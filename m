Return-Path: <linux-arm-msm+bounces-25139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEC925FD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89E621F239E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5621317966D;
	Wed,  3 Jul 2024 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukGMD67J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F801741C0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008678; cv=none; b=AU2jjSYZjf2cYgmijaDZDSoNGGWswzYjj+WvbkoxAP2KsOZdUQSw6WeAQAnNR7zEs+qXCd6ag8JufZ/u0NuL1ZF4XaR8hGxsTRpRjPQDSOd7yHJ9zw8jCZUdw+9x93O7uu+Wk2wMZO1JMKe087M/z+ExRWKRViHUiSxWFD3hIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008678; c=relaxed/simple;
	bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hX8nOneVM/3qPHGcH+MeXjWHWG2nGmda+6/eRaRDVL90Tude58Bj4IGEzi91YWuFZFEPvsJWo+kkFtrIntSW0Db+OmOtMBMIyjaaFjhktIaHb0AUGCshrWyf+8LlE/vS94+OvijLGc0RC8A39VPIz0d2/mBoOlxi5qCpygahqzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukGMD67J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42567ddf099so37061475e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008675; x=1720613475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=ukGMD67J3/3y5Ok4gt/EhrLW4SWTqdM/gIHOt6VEkgBvgn8CrEzjyhZH4Mel9c2JIg
         6KFU7Ng2dQ00+xVgEcUpGg62IzW2SFV/S8gs3elUQWo9x48Y4n+tmta3ZAzA6D49AzRS
         vSAolF4Up8FTfC2pAFPCLL8PVqgFM0ow81TGH0997ZwxjodEMresm67z01x2/vU5Krwh
         K3RmOClFvNrh4DtJN1RHi7nDj0Wj+zZQOaAN1if9OJT0JernSUCo1EC6cTJ76ePgFuFj
         lWcxM/t8EExQbeMBekQ/FT87kR6AjRPx72urvFo2vALQtjrFNHKQzHU7DfjF3RlNFjny
         s7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008675; x=1720613475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdbATdFaTptmFaDd3LBcoz91pHQr1cKSbt3yHXPYoFA=;
        b=AzMxzujr1gZ0oBDlD96bP4/KHipEjYN0G4EZtBsoZRlG7WRoS/U+e6TN5ex9dxPF9P
         Liau2p1Xe8NYT6AguUrp4HXptwhso+Ri21B/9WYBmlag6r25KvI9SkUTtfnUgspDI6L3
         4vJDEWZj235SQnWWWbMC5POMuaK0Fec+vYn7Ab+nv2r8yqUK6eE6Kz46+4gR8snGnW0s
         nMDRrAW6Zhw6Q+yLDGJHTq0MuNEzmJOTb+huwCRzDa6DrFjAZpYXjd5p2v8YlDb3rqaN
         zdWUrYWAhDVuK3jiJeGAU2KAhR/11Uxv8Po5vPuzFdPWCp0oKWTS+ArvPSJozpLjIkEV
         V8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWwUdjlhgUWCIczgZ02JCwJbnh0sETli2kuw6C87bG070VwtvSZf818jByVAGr318pV/K3HKnsriltvvaCvKcPYnQMeHOQozWdeVqILCg==
X-Gm-Message-State: AOJu0YztSuXwKbs4phQVQ5+XOUV49n7S+nyBtbGcmXgp5zHAj2oe/ZzC
	Pms5adfA166Xz9yFItyy4Bo/1yAuHGOZAgdvVnKEUTv0jKj9OPcwjEZr0dX0qcFQCd1Oijl0cLo
	rRds=
X-Google-Smtp-Source: AGHT+IGrLsHp3VA6L8jTQ5ej6pjKRa1e82AI7Hd2/DqZYivIJ2FyYoGUJpc1Ou30fG1o2MruG9SS7g==
X-Received: by 2002:a05:600c:4c14:b0:424:abd7:2321 with SMTP id 5b1f17b1804b1-4257a00dc53mr75429565e9.12.1720008674781;
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:58 +0200
Subject: [PATCH 04/11] ASoC: codecs: wcd934x: Simplify with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-4-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kohttqfCWrqbGc8ure/Vt69RKlLKq333AiDxnpMSqxs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/Up3Lhqw1lG8hf6t79kWGG+4wCsdFcumtsc
 T9S3yaOibyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1AAKCRDBN2bmhouD
 18TVD/sFzG/Chwmi1OFCni8P6wToAEF0mWU3fsKO4cdcBdThHB5JG0otzPtaSKk/NngKHF8qFYx
 7bXfnXw65p0AIzyIi+K/KT/HS2JqWziHSf8ztIiu/eMt3jxbSaC71V5k1gfSZxJEvLNMIcBUOhU
 s8IQoNsMSSatumy4nLovUfHNChCas82BtISCmoEpHftZIr4FJZ1G5mGgJWWdX2wbxBia3stm11X
 VYBQxG18BC7NsyLY0Y0KVdOOMNYbB4zOJYCA96xlTzOwiWz0etfgvArlb7y5nl1pq7HdGoJ7NTm
 hrX4nR5SaQudQg1PWP7HlVuOtyYH4DmGw4PNaV/7CImP+hPBSh5bHjp3PpDMOcHLcyVmX/xu5Mk
 nJ0kAi4Yyqo33sFw5jKjCDtMmy3C065QqrP4gpssMYt+yVluRTme+gD6VXEufkCLn1HXiWkET3Y
 2tYePWhNHAWy2r1kLkVLmEJUnICPHQh3KV8gRdsE58tTNb2CUIKALHqTzKVMn5PvY/DD6rW5ze2
 1ypvy76pvgSdXSz8O1ZlRw4m/LfpkUWp3PhaD7GyzsHE3gDnXakzA/PySna6wcTQl2a8jJKBIQr
 f6fwRFI8zzDPmUpI8d/ixZSZNGdMOtURZgzK5GYpzsyfgq0m6s2IP6rI7FXctnclehMYDltwEAR
 8r+c07k6ETwUrSQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6c65b46e2dc9..291d0c80a6fc 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/interrupt.h>
@@ -4973,25 +4974,23 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	unsigned int decimator;
 	char *dec_adc_mux_name = NULL;
-	char *widget_name = NULL;
-	char *wname;
+	char *widget_name;
 	int ret = 0, amic_n;
 	u16 tx_vol_ctl_reg, pwr_level_reg = 0, dec_cfg_reg, hpf_gate_reg;
 	u16 tx_gain_ctl_reg;
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
-	if (!widget_name)
+	char *wname __free(kfree) = kstrndup(w->name, 15, GFP_KERNEL);
+	if (!wname)
 		return -ENOMEM;
 
-	wname = widget_name;
+	widget_name = wname;
 	dec_adc_mux_name = strsep(&widget_name, " ");
 	if (!dec_adc_mux_name) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, w->name);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	dec_adc_mux_name = widget_name;
 
@@ -4999,16 +4998,14 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	if (!dec) {
 		dev_err(comp->dev, "%s: decimator index not found\n",
 			__func__);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	ret = kstrtouint(dec, 10, &decimator);
 	if (ret < 0) {
 		dev_err(comp->dev, "%s: Invalid decimator = %s\n",
 			__func__, wname);
-		ret =  -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	tx_vol_ctl_reg = WCD934X_CDC_TX0_TX_PATH_CTL + 16 * decimator;
@@ -5101,8 +5098,7 @@ static int wcd934x_codec_enable_dec(struct snd_soc_dapm_widget *w,
 					      WCD934X_DEC_PWR_LVL_DF);
 		break;
 	}
-out:
-	kfree(wname);
+
 	return ret;
 }
 

-- 
2.43.0


