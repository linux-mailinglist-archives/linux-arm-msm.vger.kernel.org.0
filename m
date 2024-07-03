Return-Path: <linux-arm-msm+bounces-25144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF575925FDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E5B1F215B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7066517BB07;
	Wed,  3 Jul 2024 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsVJR+2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C517BB1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008685; cv=none; b=KHwGO5WWpa7YLDEa+49C/Xm2OzCti4sp3Teh3SewGvBi1tNt6Y6fW7iFvQAsG9udFFP967cctLihcj7R/z0dV/47kHtaIUJG4V7SlaGN6hvDODSgdErw4MFeK1VlH/zfUnwsdp4ZTd9YEIgtJHPK8VwO8MYK13gKErXBhfqIWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008685; c=relaxed/simple;
	bh=RsWsmysnuoF6fY/OCoGbFZiI1xwwnVRPPOdxwdqc+3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nknEkTmUu4sne5YLPfUHpkq1ThAW4z5AZhZT8jlkbs+4rHFmu9utBRLmfXH6AATTKw+1KWvX1fvoMh/zikwd3vL3g7WZ3KZZLdLNOzr8D/fTb6NVpx3g3bVcUfGGaFpRYy38aSTqyWGAPCyxR/3cTHka2lRuFcauuHB7cOaQ3rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsVJR+2a; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3651ee582cfso2931426f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008682; x=1720613482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJA9Libl+Uqmyn52YGiFDQqu33nD4AolbxKyly1SWNY=;
        b=NsVJR+2aOdEdFV7GCS9yekFecKaF7Wh7OyQil/wcGp54C6ay20118w/WoxPtmcAda9
         R6/z5kjJEs5ahynF7ZxY9NqshcWFvMlhESiOp6bbgYbNhIP6oUttt8sSrxI9AqqXxDTX
         O/YmGMCiIGATwR10iWaBUCzxdZmGdemm0lm2++s+T8eopG0ybq0oTLPTkTJl41oyegPL
         FG1urnBWLytfbsFm5ZBpeNx7ZAwPH2494xtDlYFVEMvUEG7MmM15Ejdp79V7h6JfMaTv
         NwqFtryOlDUC7+Jxoalpon0JNfUkJK4gsCKEknzYJ17JX0IS3Oi84rifiQqUFK9zMvCj
         Dmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008682; x=1720613482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJA9Libl+Uqmyn52YGiFDQqu33nD4AolbxKyly1SWNY=;
        b=XlD2Nootb7sdtvT5CcvIno6aO3+t/E0j2Z2KVgO6xRh/JzgLaviC3MJ+ywjxa6Y9JQ
         YSgmTydlNMLwcHOOb+l1o8E8HiKS1N1LMEOgdsZVeG5ZOPvikV0R/DKCvLhYq6ff15OW
         YUzmuF4N+fAgIH/n+DciG8LVyJPxmO5FGjSF5AuII6Raeep9dHFb7yWKHV/r5PNd4bnP
         Da6jHoRNODyOrBN8UrciCMoLKng5arbohejk1mr8RfmdB908lyUfTmH/ouJAVW17KSxl
         AdazsZWjWZ48ShmqwhnKv0iS7F0U7YwsP1kje0Xu46YjZVjwrmkt93EGVCc9f+zeCId9
         J5yw==
X-Forwarded-Encrypted: i=1; AJvYcCXgsujLI2sz3BfNEXXhwiENI2YnneK71HYKflgRs6SVCRqM9FQ3xWB1D7Kq/ewV2LfNKAm/VbhqIYoSwnE8WnHnor9o8a4hdGC6VD8UnQ==
X-Gm-Message-State: AOJu0YzHH57zJjU3fH4IzrU0+M9yIItH5zArlLoMom4Qu5auDLJ7ZakG
	NrUdy2ocFCChxmnWO9ahSlbJu7w1LSucKvcOMnXuc5gdiuKaS5qGG0sNBukAcfOKOTFyj7ch7eF
	dNEg=
X-Google-Smtp-Source: AGHT+IF/dzKmxxIVuo0OfSIDGShstJ+GWG2IgoFCIidChX+Z7q4QU3VbhgmbdYsAVhPZV4fPfKOv3A==
X-Received: by 2002:adf:fe88:0:b0:364:aafb:5fd7 with SMTP id ffacd0b85a97d-36775725e0bmr7848589f8f.45.1720008681897;
        Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:03 +0200
Subject: [PATCH 09/11] ASoC: ops: Simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-9-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RsWsmysnuoF6fY/OCoGbFZiI1xwwnVRPPOdxwdqc+3o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/ZFFYqtapjqgR+qkmLxS6NgXzZ72SPoiC+n
 AVOrALK50WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2QAKCRDBN2bmhouD
 1wVjD/9Kmx9Xn33PLX+O7XctVZDImIZXAIG3VS1fDB+WBE3Ein5aZrxm2K8EqHw8WshLKTu0N/+
 NbmILfiW8aIUfLIDgS/w7Bjen5cqwb4YyiT1pfCszbkNiFv2Jyc+MmxD3IXLwvWTr7AuZTqIILI
 l9JAeRHCPjEB2ch/Z/+UfsP1irQnj0d6xIgssBDxo7KRqPT2v/0vr3tqNDKKBnO3tkCd8D53lJW
 BJ5hIYReOcJXnyXU3mQB/GL0qK9daJygRgsofiW7Y94QzLtH6EMZW9u3pkTxrddhFXbD7q8Nvea
 1a6SCrP8t1xmXUNFEphcHVPVNtPsTcH0IAHFufd/Y94WNI+bnMv+/GC3llrBbqaRxVxgcpH1Bd1
 A7zCih62eVxnL2sbHpj/H9ADke3xGuuJ9x5BBWbOQQJhOKSU/k5UEscxiLla2DzcZykz0VpIR7z
 ocdZNaZhCc6ndeIPyrTNdZIpAfMmeyOkcbXUC3PuVzpR1i0jL/2BkOblsoa9+f9G+eCkLnx18XO
 oyPEFhdWrSJgr46XD9ADdva2yLcNZ/mCH+SCw5fP6Ta2U4gb0GKg+bJKArwkV1TsuxbUQ4rcsJn
 qLzd5Is+F2ga+9kpn5L72q578OAib/R87VK+XhAl50di/RTJn47RmDuuPpc1PyIPTJh8k713IGD
 fHN13N60FiqYYSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/soc-ops.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index b27e89ff6a16..19928f098d8d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -11,6 +11,7 @@
 //         with code, comments and ideas from :-
 //         Richard Purdie <richard@openedhand.com>
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -727,14 +728,14 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes *params = (void *)kcontrol->private_value;
 	int ret, len;
 	unsigned int val, mask;
-	void *data;
 
 	if (!component->regmap || !params->num_regs)
 		return -EINVAL;
 
 	len = params->num_regs * component->val_bytes;
 
-	data = kmemdup(ucontrol->value.bytes.data, len, GFP_KERNEL | GFP_DMA);
+	void *data __free(kfree) = kmemdup(ucontrol->value.bytes.data, len,
+					   GFP_KERNEL | GFP_DMA);
 	if (!data)
 		return -ENOMEM;
 
@@ -746,7 +747,7 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 	if (params->mask) {
 		ret = regmap_read(component->regmap, params->base, &val);
 		if (ret != 0)
-			goto out;
+			return ret;
 
 		val &= params->mask;
 
@@ -760,14 +761,14 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 			ret = regmap_parse_val(component->regmap,
 							&mask, &mask);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u16 *)data)[0] &= mask;
 
 			ret = regmap_parse_val(component->regmap,
 							&val, &val);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u16 *)data)[0] |= val;
 			break;
@@ -776,30 +777,23 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 			ret = regmap_parse_val(component->regmap,
 							&mask, &mask);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u32 *)data)[0] &= mask;
 
 			ret = regmap_parse_val(component->regmap,
 							&val, &val);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u32 *)data)[0] |= val;
 			break;
 		default:
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
 
-	ret = regmap_raw_write(component->regmap, params->base,
-			       data, len);
-
-out:
-	kfree(data);
-
-	return ret;
+	return regmap_raw_write(component->regmap, params->base, data, len);
 }
 EXPORT_SYMBOL_GPL(snd_soc_bytes_put);
 

-- 
2.43.0


