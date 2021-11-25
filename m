Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EFE45E2DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 23:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245086AbhKYWGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 17:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343562AbhKYWEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 17:04:43 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D43C0613F9;
        Thu, 25 Nov 2021 14:01:06 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id t11so14928661ljh.6;
        Thu, 25 Nov 2021 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3dhxg8En0E5Dy0T1fUht5yDxcC0QMFDHbqiSALx+1hc=;
        b=EZHM/ujpEkiszbFTFg2/eUYdAySF4sOjsbWD+9wMnjewyQpVNtnPaAv4crp6UxSwqy
         XsgP9HTzngXgTZHPvLQfsnJ6/TgJ9z+EzsEVOq2VNxfbaR7hj+Mi2sZRLjLigbvgOeAi
         nR9M2YfEQ3wc9o2V4nFTyl8ZiiBu3L4n3ZSBlyyV1QcDVz1c1Jh3um3J8osJv3oyvQoI
         9xwgWoHFB1jAbl3XUH/2suTBuqk5TO8fp6+BI6r0dlxvTrxaca9IkAaeD7qom0Crk/6r
         G7q8y2AfwT2+/reX9XjHE/U8mxzUYF9adhkB97NTDAQxI9TYcHUpyud8ppGbpo8nBJQ4
         A91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dhxg8En0E5Dy0T1fUht5yDxcC0QMFDHbqiSALx+1hc=;
        b=zCBsPsO2RPt/fmo3so1hS8JaDNSr1hGSnMcM+YP9oe4RBddkxPzC4zahxMpomNwJmL
         95NI44czWQ3f9KGWRu5U0P9Q6JgdscXaqGtBWd3NL9aLQfuG7bRuhxSD3OSLWzL+gGrY
         54JOLMaLj00fVXAWIYuJlXl8DJ9KTjzs2hubc5zuhbsFhgMAsfmTOH/fDhhJ/38RBk6Y
         PMU/sO1gbxtNC/GkI4NP78D0rchVD+HneI6Kjt8sKckmZBkwD0efldoeOCkBRd0ClPHl
         BtPu3lNgt3anczGT8vSr6NJSH5DUCU+pyJ2sY9Gn1IK5nbURc7CzpTNhUVIe/Fa7wxBd
         1M/g==
X-Gm-Message-State: AOAM530E2VlmeMc7bIsndXZGo4xE8Jw3szf2xgCPOVumuyikIG1WjA0t
        /1TgzSJL5uhYjkZ1Th7mOY0=
X-Google-Smtp-Source: ABdhPJww0zNElnW4e+ODN23UOnrINeu6Uj2Wr69uac8o6ADiXWKUNZtDMpYKUlTVVrdy5lJ3wJ93fA==
X-Received: by 2002:a2e:9718:: with SMTP id r24mr28019242lji.406.1637877664477;
        Thu, 25 Nov 2021 14:01:04 -0800 (PST)
Received: from localhost.localdomain (public-gprs212807.centertel.pl. [46.134.170.136])
        by smtp.googlemail.com with ESMTPSA id g26sm326249ljn.107.2021.11.25.14.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 14:01:04 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH v2,4/5] regulator: qcom_spmi: Add pm8226 regulators
Date:   Thu, 25 Nov 2021 23:00:47 +0100
Message-Id: <20211125220047.62545-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125213451.62010-1-dominikkobinski314@gmail.com>
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8226 PMIC is very often seen on MSM8x26 boards.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

