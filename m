Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F24845AB00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 19:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbhKWSQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 13:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbhKWSQy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 13:16:54 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50927C06173E;
        Tue, 23 Nov 2021 10:13:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id r26so230150lfn.8;
        Tue, 23 Nov 2021 10:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R1lbh8ML36PgHeRnKDif3BwxyPuxLNdG8GTZu7LkVeA=;
        b=KotJzgbsynvTermYNoEMjjHIGET9jkXyB3eCLYnPXPQRo9jt6x9lsNUqVfhyIyBGCm
         zXURN8Y+pVZqvTEkp4B4skI1YRS/QubtLPIj0wuPRHXDyvlmRWZf/jJSwjWhSvfD7Nh0
         FuYFwxAoM5+S9Fb/LuFxQSlJh+5yNuwLrBGVwI0VjjAwSXdRBN+RHiK8T/DgiUaTocl4
         0enW/BeSWQsaNts6Qyu7K0wf111+kD7kOoSBZnkRLddzlH0eCrApyFtL9sMW9pznLbl3
         DUk9wXRBA1dzSdpR2haPCEvvvSomC6b93ICsU+gLiPTTPuK0Xd35T3cA9XLSgAT6tJxc
         gROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R1lbh8ML36PgHeRnKDif3BwxyPuxLNdG8GTZu7LkVeA=;
        b=o9XlP/A8gLpVq6XJfRv1ksX3Kd4eGoee70EPYKIkV0LHTuVi9jhKCOOYFpRURZSTyl
         4Bz+kmsOvvl9GsYIjGjSryMAWKY6PyvrlsnT6M+s7BtsGjv9kitAs7oXt7USjG+S3K3I
         zTq/mynI0RnJtQu3vNWlB2jR++yBTXFW/RNhM0rLCwz5Q2zM2BKn4QRt/qkQza0G4GHm
         Q+LvNDaVbytGC68kbsXDTQjaeBnzfVKc3PibodAFjianxTlBUIWbWAkPBTwS32/UdG1J
         k0mE0tcwIJQPcqSwcRhQuLWFuXF+x1JqUGcAaZ+gfnhplrqb52UEwDv+f/5tT6dxV1PA
         FJTg==
X-Gm-Message-State: AOAM533wByUNBnB19ERdKta4BY2x6aSoFvg91oyToyBo22eJ85pNWf4q
        +ZV6SlbRdOdqab13ZIyjVso=
X-Google-Smtp-Source: ABdhPJyISSExpQ0FjzL5Bgs+xMN/c6GKyOxriIc2gCgUlYE5aIozMsnXIYIvj5wQtHQc3pFfw400Vw==
X-Received: by 2002:a05:6512:3f96:: with SMTP id x22mr6968408lfa.389.1637691223076;
        Tue, 23 Nov 2021 10:13:43 -0800 (PST)
Received: from localhost.localdomain (public-gprs375115.centertel.pl. [37.47.96.140])
        by smtp.googlemail.com with ESMTPSA id 138sm1335777ljf.89.2021.11.23.10.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 10:13:42 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH 4/4] regulator: qcom_spmi: Add pm8226 regulators
Date:   Tue, 23 Nov 2021 19:11:19 +0100
Message-Id: <20211123181119.2897-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123174127.2261-1-dominikkobinski314@gmail.com>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8226 PMIC is very often seen on
MSM8x26 boards.

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 41424a3366d0..02bfce981150 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1895,6 +1895,44 @@ static const struct spmi_regulator_data pm8941_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pm8226_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1", },
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s3", 0x1a00, "vdd_s3", },
+	{ "s4", 0x1d00, "vdd_s4", },
+	{ "s5", 0x2000, "vdd_s5", },
+	{ "l1", 0x4000, "vdd_l1_l2_l4_l5", },
+	{ "l2", 0x4100, "vdd_l1_l2_l4_l5", },
+	{ "l3", 0x4200, "vdd_l3_l24_l26", },
+	{ "l4", 0x4300, "vdd_l1_l2_l4_l5", },
+	{ "l5", 0x4400, "vdd_l1_l2_l4_l5", },
+	{ "l6", 0x4500, "vdd_l6_l7_l8_l9_l27", },
+	{ "l7", 0x4600, "vdd_l6_l7_l8_l9_l27", },
+	{ "l8", 0x4700, "vdd_l6_l7_l8_l9_l27", },
+	{ "l9", 0x4800, "vdd_l6_l7_l8_l9_l27", },
+	{ "l10", 0x4900, "vdd_l10_l11_l13", },
+	{ "l11", 0x4a00, "vdd_l10_l11_l13", },
+	{ "l12", 0x4b00, "vdd_l12_l14", },
+	{ "l13", 0x4c00, "vdd_l10_l11_l13", },
+	{ "l14", 0x4d00, "vdd_l12_l14", },
+	{ "l15", 0x4e00, "vdd_l15_l16_l17_l18", },
+	{ "l16", 0x4f00, "vdd_l15_l16_l17_l18", },
+	{ "l17", 0x5000, "vdd_l15_l16_l17_l18", },
+	{ "l18", 0x5100, "vdd_l15_l16_l17_l18", },
+	{ "l19", 0x5200, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "l20", 0x5300, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "l21", 0x5400, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "l22", 0x5500, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "l23", 0x5600, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "l24", 0x5700, "vdd_l3_l24_l26", },
+	{ "l25", 0x5800, "vdd_l25", },
+	{ "l26", 0x5900, "vdd_l3_l24_l26", },
+	{ "l27", 0x5a00, "vdd_l6_l7_l8_l9_l27", },
+	{ "l28", 0x5b00, "vdd_l19_l20_l21_l22_l23_l28", },
+	{ "lvs1", 0x8000, "vdd_lvs1", },
+	{ }
+};
+
 static const struct spmi_regulator_data pm8841_regulators[] = {
 	{ "s1", 0x1400, "vdd_s1", },
 	{ "s2", 0x1700, "vdd_s2", NULL, 0x1c08 },
@@ -2095,6 +2133,7 @@ static const struct spmi_regulator_data pms405_regulators[] = {
 static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8004-regulators", .data = &pm8004_regulators },
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
+	{ .compatible = "qcom,pm8226-regulators", .data = &pm8226_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
 	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
-- 
2.34.0

