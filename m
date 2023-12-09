Return-Path: <linux-arm-msm+bounces-4099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F66A80B697
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 22:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDE5428104E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 21:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2326E1D691;
	Sat,  9 Dec 2023 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ufc5RGbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22CD118
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 13:56:05 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9ea37ac87so43960531fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 13:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702158964; x=1702763764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrlBeNKlBYiRghiFBJkaO1YzixQRbHwv79FE5hf91TE=;
        b=Ufc5RGbHPXHw+Bv254bBBexkpyAfPUpJ7qbnlKin21oZFb06OZV3qfQIt/Lg4H65KM
         AyakLQPbuY/WwVuerYdPCP5Ll0j0W1HCNEEqf498Zo6cIZTfsfPdzV2QjA4tFpfrfBB5
         ZU9BrnvxmpUQMMUA+UPGbdFs1f0pU5YY+6/mfJ30KEB/M/fduKqp7am8JvinjHAPhhHK
         qaVU+oKXPoCtGjXXA7XikuLNgAtVDCrhHvgsyfIggrpy+puNiNouDiXshyW4vhd0ALfu
         brC+Wu/5iEd0H9bSITcn9GVzOSEY1nH5Qne5wv5KIXq8YPEuPifZ8ZGlwvfcglmqQruF
         OPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702158964; x=1702763764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrlBeNKlBYiRghiFBJkaO1YzixQRbHwv79FE5hf91TE=;
        b=lQbKOioLrZ6j4md4YEmusPX8jjYDDi+n6RKVR0cg6vYxSlHGbf2i/Lqt8HN7J+CGnH
         ZBEos8jf6JFk4TYGzKSQAkNRNo8GfLFCk1CKmXDAV/TtpGxv15GjhDTo5MF33taPXqs8
         iEJ9ShzAyGPufPETcTcPR8mw1NBLJ9qNaORTTKu5Kirxe0bjgfoVS77c87E+YuQB0hml
         tp/vGuNL4g4iIyh3bbf5izwF/w/58jeOmpaYobPuyyAt/P3TtyPU8prKv5jpYQhmflgs
         f70eV2/bAuhOtIr++udnSDBxiOgTw5zf1Vybu/AGWYBcKZ07P0Th7ZhAQeAGBqwiOEMo
         QLzw==
X-Gm-Message-State: AOJu0Yxxl6b+U/SOzvhMlP2b44bVF8mSvnF9igbuVY9AysPam3Dem9f2
	kAC2AdF7x6oFQcVtT3prw1GmuA==
X-Google-Smtp-Source: AGHT+IFgQivqOggLIn+Hbz2oYbqdYA/p9oelDuneu5p/rxhcYCLK5Fcui0q5XIYcDWUvt2E/imMowg==
X-Received: by 2002:a2e:b013:0:b0:2c9:f4c5:7f1f with SMTP id y19-20020a2eb013000000b002c9f4c57f1fmr738541ljk.74.1702158963902;
        Sat, 09 Dec 2023 13:56:03 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e22-20020a2e9856000000b002ca061aa9d1sm665103ljj.88.2023.12.09.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 13:56:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] soc: qcom: stats: don't crash if DDR offset contains invalid data
Date: Sun, 10 Dec 2023 00:55:59 +0300
Message-Id: <20231209215601.3543895-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stats ram on sm8150 platform contains invalid data at the
DDR_DYNAMIC_OFFSET. Most likely this is because the platform didn't
support DDR sleep stats. However this platform uses generic
"qcom,rpmh-stats" compatible, which implies presense of the DDR data.
Add safety net to prevent old DTB files from crashing the
qcom,rpmh-stats driver.

Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/qcom_stats.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 4763d62a8cb0..813c9f3c6bec 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -319,6 +319,7 @@ static void qcom_create_subsystem_stat_files(struct dentry *root,
 static int qcom_create_ddr_stats_files(struct device *dev,
 				       struct dentry *root,
 				       void __iomem *reg,
+				       resource_size_t reg_size,
 				       const struct stats_config *config)
 {
 	struct ddr_stats_data *ddrd;
@@ -337,6 +338,8 @@ static int qcom_create_ddr_stats_files(struct device *dev,
 
 	/* Get the offset of DDR stats */
 	stats_offset = readl(reg + DDR_DYNAMIC_OFFSET) & DDR_OFFSET_MASK;
+	if (stats_offset >= reg_size || stats_offset % 4)
+		return -EINVAL;
 	ddrd->base = reg + stats_offset;
 
 	/* Check if DDR stats are present */
@@ -364,6 +367,7 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	void __iomem *reg;
 	struct dentry *root;
 	const struct stats_config *config;
+	struct resource *res;
 	struct stats_data *d;
 	int i, ret;
 
@@ -371,7 +375,7 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	if (!config)
 		return -ENODEV;
 
-	reg = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(reg))
 		return -ENOMEM;
 
@@ -387,7 +391,9 @@ static int qcom_stats_probe(struct platform_device *pdev)
 
 	qcom_create_subsystem_stat_files(root, config);
 	qcom_create_soc_sleep_stat_files(root, reg, d, config);
-	ret = qcom_create_ddr_stats_files(&pdev->dev, root, reg, config);
+	ret = qcom_create_ddr_stats_files(&pdev->dev, root, reg,
+					  resource_size(res),
+					  config);
 	if (ret) {
 		debugfs_remove_recursive(root);
 		return ret;
-- 
2.39.2


