TRANSLATE_PATH=translation
DICT_PATH=XTranslation

function translate {
	ts2po $TRANSLATE_PATH/$1.ts $TRANSLATE_PATH/$1.po
    sed -i '/^#/d' $TRANSLATE_PATH/$1.po
    sed -i '/^msgctxt /d' $TRANSLATE_PATH/$1.po
    sed -i '/^"Report-Msgid-Bugs-To/d' $TRANSLATE_PATH/$1.po
    sed -i '/^"POT-Creation-Date/d' $TRANSLATE_PATH/$1.po
    msguniq $TRANSLATE_PATH/$1.po -o $TRANSLATE_PATH/$1.po
    msgfilter -i  $TRANSLATE_PATH/$1.po -s --keep-header -o $TRANSLATE_PATH/$1.po true
    msgmerge $DICT_PATH/dicts/$2.po  $TRANSLATE_PATH/$1.po -o $TRANSLATE_PATH/$1.po --no-fuzzy-matching
    sed -i '/^#/d' $TRANSLATE_PATH/$1.po
    
    mv $TRANSLATE_PATH/$1.po $TRANSLATE_PATH/$2.po
}

translate ar dict_ar
translate de dict_de
translate en dict_en
translate es dict_es
translate fr dict_fr
translate he dict_he
translate id dict_id
translate it dict_it
translate ja dict_ja
translate ko dict_ko
translate pl dict_pl
translate pt_BR dict_pt-BR
translate pt_PT dict_pt-PT
translate ru dict_ru
translate tr dict_tr
translate uk dict_uk
translate vi dict_vi
translate zh dict_zh
translate zh_TW dict_zh-TW
translate fa dict_fa
