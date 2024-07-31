Return-Path: <linux-arm-msm+bounces-27549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AB943330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 17:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85B901C23814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 15:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F551BBBCB;
	Wed, 31 Jul 2024 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRfGq9og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7E1AED3B;
	Wed, 31 Jul 2024 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439567; cv=none; b=rwsFTrOHf4vIGDixvbZLcq/b5wGs1A7M7mmFUIQWciEzlR4U4FIuMKnzIQs0TeUvGFui2kAzkBpCx0NWwtFlZIivLK5Cgk9MkSAVx4Zr5/wxJgAB39XDaEB3DDMJcY67rMwBaN7N5YqZet+Wv2Kc4M0Acz3RCLCQbyeJpgBmqiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439567; c=relaxed/simple;
	bh=lyyOSz5mnVlYsXDZyPPBuvrk6tGYt4/xz9ZU1RO5S4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cai2m8vlyJTHNPdiFAI/fNHn5tIW7Oxul2RXgSEfAvZ0oOn63XbkT97uOmfMM+pxhFkEZlgVfn3XMIHefk4UtgQ46TEoo7w971wd1vS7xisF6S7REZMfRgNr45EbAjeTDIyll1roH04v7+sCYavdxlg54WEjP86LtxGJEWTb8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRfGq9og; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso37148815e9.3;
        Wed, 31 Jul 2024 08:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439564; x=1723044364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FC0xYn/ikx2v85GL/8Br0D4pnaNCpqHqIy3/h9Umxsk=;
        b=mRfGq9og9ioSmRoHSN8vjdo6q7Nzs2GydUh9MEdD7JJcm69xIjzFCrVV3z6VWrp5BQ
         K6jL5LtXDlwjJAQSKE3vV3JNH91OFx9KA0Q4uUK4zouXFEQ2Z3KB3IIXEXC09dM2YNOv
         4Gv4lbHWgl1xO9Kr4TNxIhVFgBU0gBSxsGEN9DfksI0DcMuMfugyBqMnmvLxINi3tjju
         gOhgxylCbYQxMHoZXN1reqjA6PU+sB7f3tnn55vw1ZwF6TDPQjgeFcxvWqeVtzzzwFLf
         yuyYdRtwQwT+wyRTKHvvfwbdRWRuL+Ea8gPPCdRH1cSRAnV/UxiZwPROHPZrRG5sBS04
         T6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439564; x=1723044364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC0xYn/ikx2v85GL/8Br0D4pnaNCpqHqIy3/h9Umxsk=;
        b=NvEPbib/hUM0Mx2G7wjkqQq1HdR5+XRXYERu9C7fGCHKj7dT2UdTncsV7keaCZU7oK
         jvqIInkf09DlchnOHc3KQFZy7CZdAG30K0uXA3h5TwMD8dGa5EYwmdmGdxA+AbwHdWy3
         fhAIo2sTotAlSxu1LA541LWvCSOvKAZ8yZYsz8XIyPQfPHCM3R1ly/j7ZVjIjknSsR4r
         Sp/kTZQ1wRwKnOIs1SyVVZbX3nA0LMp88Kjbb68FSCJ4qCz0FCt5YNR4+rq04Ykg4dLr
         P8gjNtcCpaiBBPwl3YMl5yCxJMXGIcNhw7UKm6HfJ4PPIao2NaCt3M00MxXfMGgYhw/G
         Y/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVj2Fx2O1BHhhWBXZW5mX1t4sQeki8Ig4WOc5FF7JaKI3e7MUwxRvF+ForQ7DB0JInH8iCc+bgB3czOq981w7MJUmh4drSQDEMXNQwCeHDJxp3t45MEFdjIbufYI6gzWgySN4rhdaiuk5zinFCXvOjhn79xVfQ1Rd8+INvqZ/6Vnhje9YKy/sduq14CwM+R05RqUVaKJlhOEr2N6ynVUvVvANOXtA==
X-Gm-Message-State: AOJu0YxPFhOeG/S9IVYnPuzLA9nDhIAEBC8F5X8a3Y3zfFmeYYrAkD04
	bsxRevixlMQushqbocVOA3F0dbQbRM3xCAyW/y3k9xpiRX3tLxDCnl2pPQ==
X-Google-Smtp-Source: AGHT+IGV5Tyg8OIw9jbYm8EISXLPoSoS24RYZm1S5mUY09Ep05QHPxO5cMSJU7Ibzbu5TFy9NWYQ+w==
X-Received: by 2002:a05:600c:3590:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-42828544a87mr33856585e9.14.1722439563745;
        Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:03 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:25 +0200
Subject: [PATCH v3 1/8] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-1-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.0

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..5a29adbd3f82 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -20,12 +20,13 @@
 #include "common.h"
 #include "qdsp6/q6afe.h"
 
-#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
+#define MI2S_COUNT  (MI2S_QUINARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
+	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	int mi2s_clk_count[MI2S_COUNT];
@@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
 			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
 		break;
+	case MI2S_QUINARY:
+		/* Configure Quinary MI2S */
+		if (!pdata->quin_iomux)
+			return -ENOENT;
+		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
@@ -177,6 +184,9 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	case QUATERNARY_MI2S_RX:
 	case QUATERNARY_MI2S_TX:
 		return MI2S_QUATERNARY;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return MI2S_QUINARY;
 	default:
 		return -EINVAL;
 	}
@@ -290,6 +300,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
+	struct resource *res;
 	int ret;
 
 	add_ops = device_get_match_data(&pdev->dev);
@@ -320,6 +331,10 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
+	if (res != NULL)
+		data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);

-- 
2.45.2


