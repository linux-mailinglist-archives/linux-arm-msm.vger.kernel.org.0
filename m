Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4738427993C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgIZM4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgIZM4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:12 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C170CC0613D3;
        Sat, 26 Sep 2020 05:56:11 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so2105041wmm.2;
        Sat, 26 Sep 2020 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iVHbmIDtdj7eTnKNqArcd3YavmHn2fSkokpWT45oN6A=;
        b=W+U4C8BImGxt+tcW1WHQdwOq/Mevs/ZlVOvuxWBrXymaAv3HBnTSrqmZ/hy9MsVhJX
         FEi9jw5M6Yn8ftm4hGxv2YNGexLwqXJCw9OypIKAjuQHRTiuRGZo6iJqfzhp/EFyb+68
         fvJXBPUPpdLrbeibOwpzAW5/l5bxc4SzCACMGz43EUJGpRfpBAx2ttQ5T4uqenlbSbKp
         Axp4+9vvbpL/DHbSRA0SPwqOIV/cAQmF1jmNXXZvYq6aiEOeinvNaSijBfzwIic5GLpM
         JKyf1a3k2cN/uaJwmI44GvQ4SJYlxqr0TgrFkQFksa+4O7t4YR3SlM4WX6WikW4YOpg8
         vqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iVHbmIDtdj7eTnKNqArcd3YavmHn2fSkokpWT45oN6A=;
        b=CzXsKyZaGk5uveOfa7e5j3YeNAUX7rT7EZWwmpClQHYezkESptbWTuu2p9qqhdHcCH
         lBRO9Tt3VyQP2+rgJb9PnOSSFdD0XGdWZPvozGnJLg+doTaMssIzkZXbqtO7zY8cVf+g
         ArQIdTH/ZFRQtw686jTcG2rODiDzGvSRVgQvZyphitxuLrruCtTH+s8VY0USmPCyxBxl
         BBzU3ymoRek3AN77zW4Lcz69fVq04t3AYPf3E5UNaDnpg2tMWrAfH9HEkGaL4onSh9MH
         eQxpWmL72vxGMvPe7UkULd+U11a3YhYTIcAiYuXH7vjC0/gGCUkI3JgKllahUEeNDMbp
         LM6Q==
X-Gm-Message-State: AOAM532d2boB4VdHNgIrukNmrkRXjOSJWBCCrZrkGFJY4AIXt6swFQcA
        fJ8mRrvghIHSlthSf7PsWfk=
X-Google-Smtp-Source: ABdhPJzmNydZdtsWgONpyvNY/J+jb6FWVzH6ddu7gm3c54qVjmKnC4TnoVettibJnXGkyGH+bpZImQ==
X-Received: by 2002:a1c:67d4:: with SMTP id b203mr2494173wmc.120.1601124970301;
        Sat, 26 Sep 2020 05:56:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] regulator: qcom_spmi: Add PM660/PM660L regulators
Date:   Sat, 26 Sep 2020 14:55:45 +0200
Message-Id: <20200926125549.13191-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM660 PMIC is very often paired with the PM660L option on
SDM630/663/660 (and SDA variants) boards.

The PM660 has 11 "660" LDOs (2 NMOS, 9 PMOS) and 7 HT LDOs (4 NMOS,
3 PMOS) and a quirk: the L4 regulator is unaccessible or does not
exist on the PMIC.
The PM660L has 8 "660" LDOs (1 NMOS, 7 PMOS) and 2 HT NMOS LDOs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/regulator/qcom_spmi-regulator.c | 51 +++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 0a507c7f4ae1..e62e1d72d943 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -2014,6 +2014,55 @@ static const struct spmi_regulator_data pmi8994_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pm660_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1", },
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s3", 0x1a00, "vdd_s3", },
+	{ "s4", 0x1d00, "vdd_s3", },
+	{ "s5", 0x2000, "vdd_s5", },
+	{ "s6", 0x2300, "vdd_s6", },
+	{ "l1", 0x4000, "vdd_l1_l6_l7", },
+	{ "l2", 0x4100, "vdd_l2_l3", },
+	{ "l3", 0x4200, "vdd_l2_l3", },
+	/* l4 is unaccessible on PM660 */
+	{ "l5", 0x4400, "vdd_l5", },
+	{ "l6", 0x4500, "vdd_l1_l6_l7", },
+	{ "l7", 0x4600, "vdd_l1_l6_l7", },
+	{ "l8", 0x4700, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l9", 0x4800, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l10", 0x4900, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l11", 0x4a00, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l12", 0x4b00, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l13", 0x4c00, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l14", 0x4d00, "vdd_l8_l9_l10_l11_l12_l13_l14", },
+	{ "l15", 0x4e00, "vdd_l15_l16_l17_l18_l19", },
+	{ "l16", 0x4f00, "vdd_l15_l16_l17_l18_l19", },
+	{ "l17", 0x5000, "vdd_l15_l16_l17_l18_l19", },
+	{ "l18", 0x5100, "vdd_l15_l16_l17_l18_l19", },
+	{ "l19", 0x5200, "vdd_l15_l16_l17_l18_l19", },
+	{ }
+};
+
+static const struct spmi_regulator_data pm660l_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1", },
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s3", 0x1a00, "vdd_s3", },
+	{ "s4", 0x1d00, "vdd_s4", },
+	{ "s5", 0x2000, "vdd_s5", },
+	{ "l1", 0x4000, "vdd_l1_l9_l10", },
+	{ "l2", 0x4100, "vdd_l2", },
+	{ "l3", 0x4200, "vdd_l3_l5_l7_l8", },
+	{ "l4", 0x4300, "vdd_l4_l6", },
+	{ "l5", 0x4400, "vdd_l3_l5_l7_l8", },
+	{ "l6", 0x4500, "vdd_l4_l6", },
+	{ "l7", 0x4600, "vdd_l3_l5_l7_l8", },
+	{ "l8", 0x4700, "vdd_l3_l5_l7_l8", },
+	{ "l9", 0x4800, "vdd_l1_l9_l10", },
+	{ "l10", 0x4900, "vdd_l1_l9_l10", },
+	{ }
+};
+
+
 static const struct spmi_regulator_data pm8004_regulators[] = {
 	{ "s2", 0x1700, "vdd_s2", },
 	{ "s5", 0x2000, "vdd_s5", },
@@ -2042,6 +2091,8 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8950-regulators", .data = &pm8950_regulators },
 	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
 	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
+	{ .compatible = "qcom,pm660-regulators", .data = &pm660_regulators },
+	{ .compatible = "qcom,pm660l-regulators", .data = &pm660l_regulators },
 	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
 	{ }
 };
-- 
2.28.0

