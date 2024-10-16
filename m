Return-Path: <linux-arm-msm+bounces-34644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0609A15AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 00:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA882811A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8342C1D4352;
	Wed, 16 Oct 2024 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSWnKtOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF11D4324
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116655; cv=none; b=O3hbwqccphbPochaSKPeTL4Xp5Xx9VUVcmEQSlpFAdx9XBhtbzAORKCVJ7CrqJ7DMPCYJ6HSQdVBez194p/xDJY3q6WyATUqWH6jXZ8m4qBLOSa+M0AwaRvcIonOPDjcAIrxoegAQcDAbX0LJWSWqEmzC6c/4KfQ/0eZ8okav3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116655; c=relaxed/simple;
	bh=DnqN0GYxTQTNhr1sTx2f2oTCRxAX06WOtWLVVwvY7mU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVqTpz0f9O33PwYiFqBiV0QOlTh/JeEHP5+ENB4MFL9HSYa9Tu1KWyB3B8jFXuscK8UoF/xRjTd3Zy0gYsodBip69z9MWxVkrD9OorPupB6q/njH/BZPZuXkGn52Ox0xW47yXKS1+pnUEqWkvMXV4zH2aAlI/IbmI8M37Splc50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSWnKtOA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so2613355e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729116652; x=1729721452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkmU+TMQPcdZQQS44rLXxdRUirokbMiNxtTTnsu7A1M=;
        b=dSWnKtOA7yw1Owg3mmik+FTQ90RHSGMwPHhQX0LG4gTZ/yg7nIu8ULx488nnf6Y/IG
         NjeexXsnBp04pQ3pFtpZMvkaB2zs62TPvRJ1JDLlcAfDWNXs9Q+cjlaJJ0LanT/YQMNt
         CbhBHxn4ySkZoDgUwHNvccqYNido4CrJO/XgCbL7Yn/QdMw9Og6OrGiMgbihq6cERPQZ
         txt/uHMDQStlfdbOLuZT1LlyxFydyhErsL04yJ9+iGNxDuixOs5l8GFJNv5H5fIFXI5n
         V4Tmf3JkqU387J0aeoMCN210+s2YOLW2kAqrm9vR+C5H12oiL3KW/xu4Qu/eehUCCMt2
         aylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729116652; x=1729721452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkmU+TMQPcdZQQS44rLXxdRUirokbMiNxtTTnsu7A1M=;
        b=OW4yBWcSn8okx5vuUuRkM+zQ4Rl0i/qumG0r8A6fDn7DZZZoSiqk1g65Fe+dlT4uCK
         +ltDGjgB5SG9b6CJ2ee5T7XwUwxxv7NhS2sN4eqthR5xsp5Gn0LHVHp0LqtYr/fHVqRv
         mIqUjq88G0l9hFpt279VVWCl1iu91ilzK0++vuflN+nMvx6LCJa2Ib09uZB6pF1neECB
         s2Sm5ZrcV4gF/v86+Z7/DbTwuFiomtqXXu8EaRV4Poypp+6WNZt8N80xJJbbDKOLdt/G
         CnjtpUaENMHBTsFB6fnKC3x3hL4Ou6O8Zrlo/uXG+AFyiVPve35ZpLxOCmai8Esgi7Fd
         p2IA==
X-Forwarded-Encrypted: i=1; AJvYcCVF67OgFNNvruFwecW7kZwz+8094OTDOvTfEoJfELxMgv07a7OQz89GWwSXjWVwCIppw0UQqhDOBdh6tNMc@vger.kernel.org
X-Gm-Message-State: AOJu0YwIT2B2JV9B+ZTEW+133N0IMvsCrbiZ+fdABck5pcsw2yk1i2Qq
	kwlBgKOByP+ZEKcFAt/1pxGh6qfifLSljEOs9WxpvhGo5Sb+S9p2YDQXSH3tTlg=
X-Google-Smtp-Source: AGHT+IE/7GB+laIBn4fQ2eRBjGrY2BLeDRMpZT3OgDpcIf9Rc1ybtQP6yIC4+eEfg4Ir/JeWq7i1xA==
X-Received: by 2002:a05:600c:1d0b:b0:42f:8fcd:486c with SMTP id 5b1f17b1804b1-4312561a417mr140028865e9.33.1729116651788;
        Wed, 16 Oct 2024 15:10:51 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c38b39sm6267325e9.6.2024.10.16.15.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 15:10:50 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org,
	broonie@kernel.org,
	dmitry.baryshkov@linaro.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org
Subject: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for DSM_CTL and SEC7 regs
Date: Wed, 16 Oct 2024 23:10:49 +0100
Message-ID: <20241016221049.1145101-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Turns out some registers of pre-2.5 version of rxmacro codecs are not
located at the expected offsets but 0xc further away in memory. So far
the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
CDC_RX_RX2_RX_PATH_DSM_CTL.

CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
0x540 for RX2 but it should be 0x54C and it also overwrites
CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).

Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
and above this offset will be equal to 0.
With such change the corresponding RXn() macros will generate the same
values for 2.5 codec version for all RX paths and the same old values
for pre-2.5 version for RX0 and RX1. However for the latter case with
RX2 path it will also add rxn_reg_stride2 on top.

While at this, also remove specific if-check for INTERP_AUX from
rx_macro_digital_mute() and rx_macro_enable_interp_clk(). These if-check
was used to handle such special offset for AUX interpolator but since
CDC_RX_RXn_RX_PATH_SEC7(rx, n) and CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)
macros will generate the correst addresses of dsm register, they are no
longer needed.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

Changes in v2:
- updated macros as suggested by Mark and Dmitry;
- removed INTERP_AUX if-check in two functions;

Link to previous patch: https://lore.kernel.org/lkml/20240925043823.520218-1-alexey.klimov@linaro.org/

 sound/soc/codecs/lpass-rx-macro.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ef7a70fa6966..febbbe073962 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -202,12 +202,14 @@
 #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
-#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
+	(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
+	(0x0440 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -645,6 +647,7 @@ struct rx_macro {
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
 	int rxn_reg_stride;
+	int rxn_reg_stride2;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -1929,9 +1932,6 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 							      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
 			}
 
-			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
 			int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
@@ -2702,9 +2702,6 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 
 	main_reg = CDC_RX_RXn_RX_PATH_CTL(rx, interp_idx);
 	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, interp_idx);
-	if (interp_idx == INTERP_AUX)
-		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
-
 	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(rx, interp_idx);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
@@ -3821,6 +3818,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_0:
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
+		rx->rxn_reg_stride2 = 0xc;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
@@ -3834,6 +3832,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
+		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
-- 
2.45.2


