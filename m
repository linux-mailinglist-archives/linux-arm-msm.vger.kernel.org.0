Return-Path: <linux-arm-msm+bounces-27127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5C93E070
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1339BB21242
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45658187547;
	Sat, 27 Jul 2024 18:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnSY1F6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4E288BD;
	Sat, 27 Jul 2024 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104451; cv=none; b=rMcRqxwdafdXm2oi9keCT+IikjncTwfOCjvRztyFmlXooa9fEmmpd8YLNxGblcilWrrXTgMHQQEyfzTSFcz372ghWR6i4qOi0AvLT8CtEcMW7xHGS6nvCAI+pIb9AMstb1LvZTQ9USrnbYcY547e1X9ByBu5LxSpF6ntBMaVO58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104451; c=relaxed/simple;
	bh=PMtw6Te5sj/TrlbW9514sz7eS62gjeUYCJGHpfh1FaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEMY8uodMnOmscpYrXocf6t1GED3BPcqmJzjC2ynqeWEUDXrUyIBjytj69FfezGV0pPir2Aa68HP9EWRE0qrxNu2fUW5md0gFUhAg0xhFsjjwwLqsUPNJ47v6KABEMP6bqcbXlxSR8/ByC3ScUFaYKFjlcdoQY+xgossaPotNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnSY1F6V; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so34920671fa.2;
        Sat, 27 Jul 2024 11:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104447; x=1722709247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=VnSY1F6VofxM6ZohUa/dsQke6SYq0BzwiegRnU03kP0GuFGn24V3KMcaWZRiDFtRhw
         6hbwKDCfFVw0aPIcA4l/BkFrUCOqWifLXG6CDR7pcDqw98D1bzWyMg0ZEwByhS6/D+Wn
         XczSpHTnVSm+PxY+WOA27rOhx0Yk/xsU1nV2+uJwJeOIDUuO1/Q1SI5AoVKeYk5zTJqL
         ygBaAG2DpD/CQtzi0TxYGInnJpFMe3B68m8Ip11Mmrkhih9NcRXVvJGYaPBjVNPrEVO2
         Gl3u8tdd/UebS+a87OU99JXaR+5F9tNJF5Arwc67yKOYHIm15MimKpVw3zFrwx5YlHFn
         5RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104447; x=1722709247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=K7XLCaSnHVxhsCIUv0EtOxbY9fgLopzRTdIxjS8MVjd7rWu0itEnYOIt4hkZDC11gi
         HkwbyilxMWuLzFKZ+WghQX6PorcYQgeSmALbCXvYYSzTAn4cvmw2lBqhIwKMUlpBfoeV
         jvV0+vWA8dNh0yVjGzW2794HeJ92mt/1VxmYoW9fa0tGLqw2+BorPjnmgLEubQFMJAOA
         +A3uqPl5qc+HWxaFlT/b2/5AzLaelM2c8iXOMQXjnPXpW/xcf0+TmAuxoztpXBBoCFEa
         ETBSYS0I6swtIhMZmVzW+fRL4b49c+U9kUbFq7+6kiXHUfc/A/Yd2IASjHJcUYZyG46t
         h1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUd1GhaxYDSevnuJVaaxpy8rJ6EKiKrkWf6r58jI59w7q5mOkuECTLB7JgReuZz+kni1F6NqrWSNELIVak+HKHy7hB0+9vDH2fvewEJjMEEjdGfbpXOa//e8gtfCwtqfrSpsNGM/vz/doJ7yMvzcrnskm7ialR1vM9c5L28BvrchyXs0speH5+Ntfu4abaobi8CJl0UJghKtJzZY8kiq56irdEPRQ==
X-Gm-Message-State: AOJu0Yw7Nw1QReuHlFn3m7pwrzPawm/wW/+3fClMeekDHayDcmFn9SBK
	6LzgzGOLfoamWEXxZKK/U/F4bz/NIyR4OTMimBfNMhPzVCiVWx7RC+iK7Q==
X-Google-Smtp-Source: AGHT+IGvyLQim7JK45a/ba9q00AzQhJejT77FSBr2xSMgFq12bEECWsvmkm1dvXC4saab8Kw2Ycm7g==
X-Received: by 2002:a2e:be8f:0:b0:2ef:228a:1b86 with SMTP id 38308e7fff4ca-2f12edd5328mr20892951fa.21.1722104446584;
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Date: Sat, 27 Jul 2024 20:20:24 +0200
Message-ID: <20240727182031.35069-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..303dd88206b1 100644
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
@@ -320,6 +331,9 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
+	data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);
-- 
2.45.2


