Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2403FA58F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 14:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhH1L6A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 07:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234099AbhH1L57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 07:57:59 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E89CC0613D9;
        Sat, 28 Aug 2021 04:57:08 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s25so14028019edw.0;
        Sat, 28 Aug 2021 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLBmY1lddKz7uTq3806Ths/k/ddF0DAc5W9kpbb8u9s=;
        b=QlH85/uPOCnjjN/jADGyKpUeAw1fcOJXg7DJ4/l9SbWgA3oRa8sGTKgU2ZAWicq24T
         WIpIqNc3UWp4Zjx7mehBYovw+PMwnkMNfRNB7mTvY69/ZSxkhnff3SFY6RFKFYA3bh9e
         Ox75QLHn89eXXpojQyE/dMkNqZ3VG8r3woTRP5SwuhtE+YVvP9XRks3Cgabj4+lLjcFj
         bUQAhSRJgJdrNykMfpdOzoY3qUjYR2OAR7wS32CbMjth9rkYkwQnl4oR2nrMt3bM6HE4
         Nl9LM9GrU4l5Htux2UzWm/UgFQiKlZbMAuI2KeCvznRf841DTepW1LPAPqXfM5xZGYNw
         iXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLBmY1lddKz7uTq3806Ths/k/ddF0DAc5W9kpbb8u9s=;
        b=Vlvr+a22rCZ2UL9dVd8rPISYh2R4RC4v0gnxflK2oCvPv/M4zAUV3BVXHAI1M0zA+B
         hgdY8suU751XMfFSEoAmJR3zMIpQ/MgTN0oD40T4ech9sWOFmVlIAlyFNjgHWuYR6NYL
         06bixQAVNeIsrG85FOHRKMSYi/q1f1PpNislWRSUI1BOqbGpnU4rzu21M8SbdRhLQHw+
         +NQB3xd/5z6Wy40cmkI3jOoI1DGyyPcB0eXovWrq3q3ZVdk+VUcpGOrU21hpv7uQjcBX
         2LYc/0+LJxVY+Ncm2MmuJWnTIj7mqdqG2Z9hx5tmHe3DvCCW1usThBQ5s2aOyteqd6Wu
         zLbQ==
X-Gm-Message-State: AOAM531iyG+DjjHDyoADEGMhqENLUHhl4Ykx8x/RxPKJeGVO1adtvikQ
        MGE75jzkXNw6Z4tlIf9YVsA=
X-Google-Smtp-Source: ABdhPJyMrN4+lBNa+okLk1rVIjF9z/e/QsIV7/FGOlERX13BkZHghuvbkHtY6nTzDLjwiHwAb63iOg==
X-Received: by 2002:a50:c94d:: with SMTP id p13mr14934833edh.246.1630151827044;
        Sat, 28 Aug 2021 04:57:07 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id l18sm2873411edr.83.2021.08.28.04.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 04:57:06 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [RFC PATCH 2/2] regulator: qcom_smd: Add PM6125 regulator support
Date:   Sat, 28 Aug 2021 14:56:54 +0300
Message-Id: <20210828115654.647548-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210828115654.647548-1-iskren.chernev@gmail.com>
References: <20210828115654.647548-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PM6125 regulator which is found on SM4250/6115 SoCs.

NOTE: The sources haven't been determined, so currently each regulator
has it's own source.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 198fcc6551f6..e97086d95774 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -666,6 +666,15 @@ static const struct regulator_desc pm660l_bob = {
 	.ops = &rpm_bob_ops,
 };
 
+static const struct regulator_desc pm6125_ftsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(300000, 0, 268, 4000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 269,
+	.ops = &rpm_smps_ldo_ops,
+};
+
 static const struct regulator_desc pms405_hfsmps3 = {
 	.linear_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
@@ -1148,6 +1157,42 @@ static const struct rpm_regulator_data rpm_pm660l_regulators[] = {
 	{ }
 };
 
+static const struct rpm_regulator_data rpm_pm6125_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm6125_ftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm6125_ftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm6125_ftsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm6125_ftsmps, "vdd_s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8998_hfsmps, "vdd_s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pm8998_hfsmps, "vdd_s6" },
+	{ "s7", QCOM_SMD_RPM_SMPA, 7, &pm8998_hfsmps, "vdd_s7" },
+	{ "s8", QCOM_SMD_RPM_SMPA, 8, &pm6125_ftsmps, "vdd_s8" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd_l1" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, "vdd_l2" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd_l3" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_nldo660, "vdd_l4" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_pldo660, "vdd_l5" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd_l6" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, "vdd_l7" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd_l8" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_ht_lvpldo, "vdd_l5" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_ht_lvpldo, "vdd_l10" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_ht_lvpldo, "vdd_l11" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_ht_lvpldo, "vdd_l12" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, "vdd_l13" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd_l14" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_pldo660, "vdd_l15" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, "vdd_l16" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_nldo660, "vdd_l17" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_nldo660, "vdd_l18" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, "vdd_l19" },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, "vdd_l20" },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, "vdd_l21" },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, "vdd_l22" },
+	{ "l23", QCOM_SMD_RPM_LDOA, 23, &pm660_pldo660, "vdd_l23" },
+	{ "l24", QCOM_SMD_RPM_LDOA, 24, &pm660_pldo660, "vdd_l24" },
+	{ }
+};
+
 static const struct rpm_regulator_data rpm_pms405_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pms405_hfsmps3, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pms405_hfsmps3, "vdd_s2" },
@@ -1182,6 +1227,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8998-regulators", .data = &rpm_pm8998_regulators },
 	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
 	{ .compatible = "qcom,rpm-pm660l-regulators", .data = &rpm_pm660l_regulators },
+	{ .compatible = "qcom,rpm-pm6125-regulators", .data = &rpm_pm6125_regulators },
 	{ .compatible = "qcom,rpm-pma8084-regulators", .data = &rpm_pma8084_regulators },
 	{ .compatible = "qcom,rpm-pmi8994-regulators", .data = &rpm_pmi8994_regulators },
 	{ .compatible = "qcom,rpm-pmi8998-regulators", .data = &rpm_pmi8998_regulators },
-- 
2.33.0

