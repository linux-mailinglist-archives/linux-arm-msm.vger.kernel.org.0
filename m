Return-Path: <linux-arm-msm+bounces-27040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1793C0B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 13:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C81E7B2258C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 11:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCB019A288;
	Thu, 25 Jul 2024 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuK5iHPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E1199E92
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721906644; cv=none; b=bgOhs8BQ9psUs0ztiSZCiqOFBDYM0MZP9P5zTSGuw4DUJhbz/ZmrX+6LUn+jhUKTAyZ9fMLQ9tV/pbe+5FWTYUnZSYoZ3YXc3zQPCyMgRvXXxwKVJQ+6Id7bT5PJ9BtDOMdYhtXzN/1Fv0o9PxB/odIr2NhKvmikuGApP6BOu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721906644; c=relaxed/simple;
	bh=V8vd4iZFObHif1p5HOQA8sXHu2YEJwGEScZnEYASwyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p1QrvRdcWiHtEzdZGJIw+E+80b2bYYlvwlQu3BoM67h2cDCBwTcKugrGzbUoIYZZQzBBdrLZNXLjodR1DIiwN4Q6+mvTHqwbrvIL7c9Dj5KL0OlAXFHlkf4P1LNLQr7bsyksmVJUrPJbTIn9KSmJJCc0V+FR05QKQfgE9+iZypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuK5iHPh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42660b8dd27so6364955e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906641; x=1722511441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=him59Jh0Za/FpncLD54ryW3nFixGnrEeRbEKdwDMQEw=;
        b=TuK5iHPhU+Ocqou7m8QUUH4OCsb8HBY45iJR2KJ2LPF8vjS7YVYe7koUHyrnMVDugY
         YrBznCTPF+iwFPxc8CT/4ai3WLQ46HBLezOXipr22MKR4n1hkuOvdTAD++xdhHy1T9Fp
         A730blIF+c1QCC2UrwS0rLsJQwNbY5kWSl9D/o1EZB02+9NNdngtn6dEX8vI6uR5wbl7
         +zsKc3JFoCyPU0tj4y2dHt90NWUO5Bngof+eWRaiHA52L6s69SZw77G5QvfPskHpq93c
         BUu1djzTGOdto39++VEnmp7MXn/fKV/oHp/MVMglj4HitWSgzvpp8HxpdmTxYZ03wkrZ
         MLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906641; x=1722511441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=him59Jh0Za/FpncLD54ryW3nFixGnrEeRbEKdwDMQEw=;
        b=cnKlA3brZ7NqfcUkg2sDO2wd79/XT/CpkfJKtPftbZprRM/+cxVhR+7idJoErmmHyI
         q0Up4WKdRClHchMVTPlA3LwFGKlKn7MYhIxiwQqLNQd/pIjkMbQ5ZbzzZ09jH0rq0Onj
         qLuOv6edydknxytZk7jpbX26pHZ7X015wNiFg48io8sDiM2ujGl8rCOLpCfO8U//wkL/
         hVgPP81kxJq6uIwoCflXABrCtxs1WgUxu3uTGwCX4r5NOj5W2vSIOwGw3+kctRfxc7DI
         HV9KgmpxuaX1WlQTWxVibkG9hrvRcdn3TN2TrRco3acKM0y5Opjqgp2+QHiosHnIz+aZ
         ac7A==
X-Forwarded-Encrypted: i=1; AJvYcCVC3d75K3Z9NHwxulPALjaQxw34WX2UCE+t5E6Px04IUBQ70WX62c1YL+n2FGTC562R5g+vlw2XTbLEugazN9YufqzLlkfDYFuUzPRkrg==
X-Gm-Message-State: AOJu0Yzx5PE/aK7lHPPXlEt2nAzfikuD21KleHbAztNbwkXfADiFg2c5
	XrdZUjVI4J4Hujf/6XGN2aKKn8V+8uWRPPd5LnEZNc68QgUcCIUVDSPY4XMm6r4=
X-Google-Smtp-Source: AGHT+IE2/MDS0EvvoNMsY4tzNjk68cr5dxij8RbWrbzM/zyGhZ/Yw33L8LYx0zf/UyaMoZNqXyZL0g==
X-Received: by 2002:a5d:6a51:0:b0:367:9904:e6b9 with SMTP id ffacd0b85a97d-36b36421ab2mr1215212f8f.44.1721906641227;
        Thu, 25 Jul 2024 04:24:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:47 +0200
Subject: [PATCH 5/7] ASoC: codecs: wcd937x: Move max port number defines to
 enum
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-5-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V8vd4iZFObHif1p5HOQA8sXHu2YEJwGEScZnEYASwyc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXHiWSSUY3gTrQtwvbi3XTqFF5y9M+V6TBdA
 UjzT+daecWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1xwAKCRDBN2bmhouD
 10BoD/9s4CyMl1vgd0j2Wq1A1AtT/gXwWXp0KYUGAtiYtOHBYxeqlx3cigfTNWTPVh/nSVaRmQr
 Fsdau1R9aTSu2uGyVHaqRk9V9V/Zg9tMQ3IOwzX6HZqgdwgBjQ89kstBVfsIwr5wQ4Xd2g04fcN
 lwA3Yed9dKQXJdkx20InzbWvK8YtuS4fvjU5t/rbLwDzrwgfHjlVLcFurBdHyhi+ubvFjCLxXiJ
 VEbYYDtAE3+CKRl+YLuZeqclG7zbkj3+vSHBatrEzwICkF8x2MARCH4tdKnvwC4lkJP1mLfEi9p
 yk5psVzerdgGGIKEGOINLAjA7vBNeZCrWeEcswBQGu0wkqA7gqPI1+I1wDdTZRGiiQkWWXQGMKz
 iHDXbdTobDgxjcDtQAqUGK4Ioz/NfmIwJWkJooFevfSqbMYivOJG/V2Jtj13G/F6aoXrxiSE4DS
 jPwOvKNQl0kmOqUawrTw+Nsvd4fn5CUAm4agfba9Xs8fxAjCzZgdBi1vn0VihKFiI5p64zfgIoD
 GmBo1ytrBslM8x/1o8+iLXNib07en48TsLulNL23bAHPp0+l6VsCiNfJsyqy2jDTTyV9CA+5wIr
 C0yKnVstuVTUkv3lES2ereAS4UrGpCknu6F8Wwmel9YC8kKHeXwZNDsMBPu6rUBv5AO6oR5P2G7
 f2vn3sq0fsshdvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Instead of having separate define to indicate number of TX and RX
Soundwire ports, move it to the enums defining actual port
indices/values.  This makes it more obvious why such value was chosen as
number of TX/RX ports.
Note: the enums start from 1, thus number of ports equals to the last
vaue in the enum.

WCD937X_MAX_SWR_PORTS is used in one of structures in the header, so
entire enum must be moved to the top of the header file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 37bff16e88dd..35f3d48bd7dd 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -484,10 +484,25 @@
 
 #define WCD937X_MAX_MICBIAS			3
 #define WCD937X_MAX_BULK_SUPPLY			4
-#define WCD937X_MAX_TX_SWR_PORTS		4
-#define WCD937X_MAX_SWR_PORTS			5
 #define WCD937X_MAX_SWR_CH_IDS			15
 
+enum wcd937x_tx_sdw_ports {
+	WCD937X_ADC_1_PORT = 1,
+	WCD937X_ADC_2_3_PORT,
+	WCD937X_DMIC_0_3_MBHC_PORT,
+	WCD937X_DMIC_4_6_PORT,
+	WCD937X_MAX_TX_SWR_PORTS = WCD937X_DMIC_4_6_PORT,
+};
+
+enum wcd937x_rx_sdw_ports {
+	WCD937X_HPH_PORT = 1,
+	WCD937X_CLSH_PORT,
+	WCD937X_COMP_PORT,
+	WCD937X_LO_PORT,
+	WCD937X_DSD_PORT,
+	WCD937X_MAX_SWR_PORTS = WCD937X_DSD_PORT,
+};
+
 struct wcd937x_sdw_ch_info {
 	int port_num;
 	unsigned int ch_mask;
@@ -581,13 +596,6 @@ enum {
 	WCD937X_NUM_IRQS,
 };
 
-enum wcd937x_tx_sdw_ports {
-	WCD937X_ADC_1_PORT = 1,
-	WCD937X_ADC_2_3_PORT,
-	WCD937X_DMIC_0_3_MBHC_PORT,
-	WCD937X_DMIC_4_6_PORT,
-};
-
 enum wcd937x_tx_sdw_channels {
 	WCD937X_ADC1,
 	WCD937X_ADC2,
@@ -602,14 +610,6 @@ enum wcd937x_tx_sdw_channels {
 	WCD937X_DMIC6,
 };
 
-enum wcd937x_rx_sdw_ports {
-	WCD937X_HPH_PORT = 1,
-	WCD937X_CLSH_PORT,
-	WCD937X_COMP_PORT,
-	WCD937X_LO_PORT,
-	WCD937X_DSD_PORT,
-};
-
 enum wcd937x_rx_sdw_channels {
 	WCD937X_HPH_L,
 	WCD937X_HPH_R,

-- 
2.43.0


