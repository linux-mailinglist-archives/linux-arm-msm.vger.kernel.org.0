Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8F2279933
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgIZM4T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbgIZM4O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A1EC0613D5;
        Sat, 26 Sep 2020 05:56:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d4so1923149wmd.5;
        Sat, 26 Sep 2020 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jbWyLKo/DYEBINJqHYUULxfe0FewV7XWDc0CVq7Buvg=;
        b=q/GMNQZSX2ICDDs5zuJYMR+ZW5lq3k6fgp25FkCrUpasC/+/JGdO7Q4UU0zauV7ov2
         /xcfYShk8ck+nNnHueRtMjvYvaTKakHbwGaKqWOSNWKHx7SswyJIUxG6iBZMz+l+ahGF
         IY/vO2d5IwPPG5lXZPIDeGAhTCQOSrt3Cb7V/Jh+gGrMI13yUh8hSW/zT6tE49+oIjve
         Za8mqKrbdtzp5U15FbE0iEOlaYFUCgFivdoyTvZpiQ8kSSxZv/h1V209Yt/CGkNuIUJJ
         Qsx4QO9tdOvoqR7AHUlEI5CpPW86euIYQ/xkH/hxtq4mrnyWGFKr2uKAz3H+oH0ul7ZF
         +0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jbWyLKo/DYEBINJqHYUULxfe0FewV7XWDc0CVq7Buvg=;
        b=few0D4XuNkKATBc1ZT5FWMgSs4+E6ZjbRvbaTHP33WcX/pOvFvLlyByH8PwSXGn3pw
         Kd7FeGMDNWHCJfHF0Vgn+PL/dH4iCtnXgh5MVDpA0o0fEguXZHGbGIWBtsoTtspGIER+
         fe/wPQ4HIC5+/He9VgMxqV9dJeOaU5GU+O7WgJ0MHTFJPAhFpbSDqEkosWeYkvP24q5R
         lr6ybaDz5ayOkZYJv3gc4zJRlfzyl//wyI5kjQkt7WlQ6AKnT57qDZ8XZVIjQgFD0NQS
         y8u2x75AFG8OVb5lpKxoq3MGrczPQFwzytPigEsDahJwpWyxIZQfMV7OWU7hdfSbkJwC
         wKlQ==
X-Gm-Message-State: AOAM532vTnFBUgf4y/OqbZ442uElmJD/kT04lOlTEq76tINqPte7XnHI
        iavTGYE7HJJszjRbOveKzaw=
X-Google-Smtp-Source: ABdhPJwrw6ipZM4wjYL1JT4uYmQsbkYpoyrT/1w5ePyAkxR5j+1KkuJ1HtGL86GOFH6+3flr7sUtpQ==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr2514384wmc.9.1601124972412;
        Sat, 26 Sep 2020 05:56:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] regulator: qcom_smd: Add PM660/PM660L regulator support
Date:   Sat, 26 Sep 2020 14:55:47 +0200
Message-Id: <20200926125549.13191-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM660 and PM660L are a very very common PMIC combo, found on
boards using the SDM630, SDM636, SDM660 (and SDA variants) SoC.

PM660 provides 6 SMPS and 19 LDOs (of which one is unaccesible),
while PM660L provides 5 SMPS (of which S3 and S4 are combined),
10 LDOs and a Buck-or-Boost (BoB) regulator.

The PM660L IC also provides other regulators that are very
specialized (for example, for the display) and will be managed
in the other appropriate drivers (for example, labibb).

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 113 +++++++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h       |   4 +
 2 files changed, 117 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index a87b56bc29fa..007e27cbf186 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -541,6 +541,69 @@ static const struct regulator_desc pmi8998_bob = {
 	.ops = &rpm_bob_ops,
 };
 
+static const struct regulator_desc pm660_ftsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(355000, 0, 199, 5000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 200,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660_hfsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(320000, 0, 216, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 217,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660_ht_nldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(312000, 0, 124, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 125,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660_ht_lvpldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 62, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 63,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660_nldo660 = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 124,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660_pldo660 = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 256,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm660l_bob = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1800000, 0, 84, 32000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 85,
+	.ops = &rpm_bob_ops,
+};
+
 static const struct regulator_desc pms405_hfsmps3 = {
 	.linear_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
@@ -902,6 +965,54 @@ static const struct rpm_regulator_data rpm_pmi8998_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm660_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm660_ftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm660_ftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm660_ftsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm660_hfsmps, "vdd_s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm660_hfsmps, "vdd_s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pm660_hfsmps, "vdd_s6" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd_l1_l6_l7" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_ht_nldo, "vdd_l2_l3" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd_l2_l3" },
+	/* l4 is unaccessible on PM660 */
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_ht_nldo, "vdd_l5" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_ht_nldo, "vdd_l1_l6_l7" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_ht_nldo, "vdd_l1_l6_l7" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd_l8_l9_l10_l11_l12_l13_l14" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_pldo660, "vdd_l15_l16_l17_l18_l19" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_pldo660, "vdd_l15_l16_l17_l18_l19" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd_l15_l16_l17_l18_l19" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, "vdd_l15_l16_l17_l18_l19" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, "vdd_l15_l16_l17_l18_l19" },
+	{ }
+};
+
+static const struct rpm_regulator_data rpm_pm660l_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPB, 1, &pm660_ftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPB, 2, &pm660_ftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_RWCX, 0, &pm660_ftsmps, "vdd_s3_s4" },
+	{ "s5", QCOM_SMD_RPM_RWMX, 0, &pm660_ftsmps, "vdd_s5" },
+	{ "l1", QCOM_SMD_RPM_LDOB, 1, &pm660_nldo660, "vdd_l1_l9_l10" },
+	{ "l2", QCOM_SMD_RPM_LDOB, 2, &pm660_pldo660, "vdd_l2" },
+	{ "l3", QCOM_SMD_RPM_LDOB, 3, &pm660_pldo660, "vdd_l3_l5_l7_l8" },
+	{ "l4", QCOM_SMD_RPM_LDOB, 4, &pm660_pldo660, "vdd_l4_l6" },
+	{ "l5", QCOM_SMD_RPM_LDOB, 5, &pm660_pldo660, "vdd_l3_l5_l7_l8" },
+	{ "l6", QCOM_SMD_RPM_LDOB, 6, &pm660_pldo660, "vdd_l4_l6" },
+	{ "l7", QCOM_SMD_RPM_LDOB, 7, &pm660_pldo660, "vdd_l3_l5_l7_l8" },
+	{ "l8", QCOM_SMD_RPM_LDOB, 8, &pm660_pldo660, "vdd_l3_l5_l7_l8" },
+	{ "l9", QCOM_SMD_RPM_RWLC, 0, &pm660_ht_nldo, "vdd_l1_l9_l10" },
+	{ "l10", QCOM_SMD_RPM_RWLM, 0, &pm660_ht_nldo, "vdd_l1_l9_l10" },
+	{ "bob", QCOM_SMD_RPM_BOBB, 1, &pm660l_bob, "vdd_bob", },
+	{ }
+};
+
 static const struct rpm_regulator_data rpm_pms405_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pms405_hfsmps3, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pms405_hfsmps3, "vdd_s2" },
@@ -932,6 +1043,8 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8950-regulators", .data = &rpm_pm8950_regulators },
 	{ .compatible = "qcom,rpm-pm8994-regulators", .data = &rpm_pm8994_regulators },
 	{ .compatible = "qcom,rpm-pm8998-regulators", .data = &rpm_pm8998_regulators },
+	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
+	{ .compatible = "qcom,rpm-pm660l-regulators", .data = &rpm_pm660l_regulators },
 	{ .compatible = "qcom,rpm-pma8084-regulators", .data = &rpm_pma8084_regulators },
 	{ .compatible = "qcom,rpm-pmi8994-regulators", .data = &rpm_pmi8994_regulators },
 	{ .compatible = "qcom,rpm-pmi8998-regulators", .data = &rpm_pmi8998_regulators },
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index da304ce8c8f7..f2645ec52520 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -19,6 +19,10 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_CLK_BUF_A	0x616B6C63
 #define QCOM_SMD_RPM_LDOA	0x616f646c
 #define QCOM_SMD_RPM_LDOB	0x626F646C
+#define QCOM_SMD_RPM_RWCX	0x78637772
+#define QCOM_SMD_RPM_RWMX	0x786d7772
+#define QCOM_SMD_RPM_RWLC	0x636c7772
+#define QCOM_SMD_RPM_RWLM	0x6d6c7772
 #define QCOM_SMD_RPM_MEM_CLK	0x326b6c63
 #define QCOM_SMD_RPM_MISC_CLK	0x306b6c63
 #define QCOM_SMD_RPM_NCPA	0x6170636E
-- 
2.28.0

