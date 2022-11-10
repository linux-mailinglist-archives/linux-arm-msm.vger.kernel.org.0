Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DC3624209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 13:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbiKJMMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 07:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiKJMMg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 07:12:36 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ABF20F72
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 04:12:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id be13so2843496lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 04:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3m2vparsJ0IvTRoDQtc/C+sx5KcO7jtZEv/Wo5rLyfI=;
        b=vYlOSEfSdDsa2OulOt0SwI1aMtr0j3/AxT1vf8GpEYJpd5DLlfJblTc0oGSh+aklLG
         xJyc6JbYzpB/go8XbKOmiNIFCuxKpNh4iG/jicF4jHtoinXvPFEDGQh+4dKVG0UEHkKC
         iuJmdurSeMa4YLIckEychviG4tbYJq655apEzjt+vBKNw8x8u635r9ILbJ2uLj0YHdDM
         5+sqVmnKO+FpO/27A0znGhZ72kBKrUs6Zd507+lEvTEqtXqYzbmYVFDinyNFAXVORedT
         Yee/EoH6E2Yu1WUumXbOOnQYuOx1QfNPN/uZientm8sA6qti5aAlC5rfemx72xFk83CA
         Xu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m2vparsJ0IvTRoDQtc/C+sx5KcO7jtZEv/Wo5rLyfI=;
        b=O61XKfUJ998sSdYbJUvMyNIWCPV2X88f2s7yUipC3TrH3WWkC4LdT26KWiH6gCoyl1
         VrHu+sxyxdR7S9Ncm5F5RKID4rSsrqBKfF6OwUjpaMP5AxTk50PhqScIZFzG+5uZaqaI
         H7Atm6uodYQC8J2RhFwtEPmGRAWv7pYi1cfxqFEMkhiKZS6iGrlm9fQXCPrOVB1U0Ja1
         b8cUfSEALmmEiN6jNIldUeHyuDyjLZTzYpew1lYZj4pRVqRVeOp3UW83I8VDuvbpBM+V
         kErcalMbczY9TwnYE+Gtkqa6grb1qbZfxhZdsVVhjGT1yqH5LNE0QkoRx4l4Na8yM7R3
         bGGA==
X-Gm-Message-State: ACrzQf1rQt1pJtq+WlYTtpwR7+S3stvkb2hQW3WbVxZrrwGHoHDS3BtQ
        w5QAt8UTnT5HYwRZS4qchQ+P52/twT4aF3rb
X-Google-Smtp-Source: AMsMyM6SlvmEsSoFiqy4iwt0g1PZnQCNBN2X5qFIOknPJADNVl2vkQRJY+J9ghjykqYcOmyXwMB/Jg==
X-Received: by 2002:ac2:47e1:0:b0:4af:5088:9576 with SMTP id b1-20020ac247e1000000b004af50889576mr21098188lfp.468.1668082352920;
        Thu, 10 Nov 2022 04:12:32 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id y13-20020a19640d000000b004a91d1b3070sm2733423lfb.308.2022.11.10.04.12.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Nov 2022 04:12:32 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom_smd: Fix PMR735a S3 regulator spec
Date:   Thu, 10 Nov 2022 13:12:25 +0100
Message-Id: <20221110121225.9216-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMR735a has a wider range than previously defined. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No Fixes tag, as the patch is only in -next, so the hash will change.

 drivers/regulator/qcom_smd-regulator.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 9eaae13fd385..9f2b58458841 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -686,6 +686,15 @@ static const struct regulator_desc pmic5_ftsmps520 = {
 	.ops = &rpm_smps_ldo_ops,
 };
 
+static const struct regulator_desc pmic5_hfsmps515 = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(320000, 0, 235, 16000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 236,
+	.ops = &rpm_smps_ldo_ops,
+};
+
 static const struct regulator_desc pms405_hfsmps3 = {
 	.linear_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
@@ -1277,7 +1286,7 @@ static const struct rpm_regulator_data rpm_pmi8998_regulators[] = {
 static const struct rpm_regulator_data rpm_pmr735a_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPE, 1, &pmic5_ftsmps520, "vdd_s1"},
 	{ "s2", QCOM_SMD_RPM_SMPE, 2, &pmic5_ftsmps520, "vdd_s2"},
-	{ "s3", QCOM_SMD_RPM_SMPE, 3, &pms405_hfsmps3, "vdd_s3"},
+	{ "s3", QCOM_SMD_RPM_SMPE, 3, &pmic5_hfsmps515, "vdd_s3"},
 	{ "l1", QCOM_SMD_RPM_LDOE, 1, &pm660_nldo660, "vdd_l1_l2"},
 	{ "l2", QCOM_SMD_RPM_LDOE, 2, &pm660_nldo660, "vdd_l1_l2"},
 	{ "l3", QCOM_SMD_RPM_LDOE, 3, &pm660_nldo660, "vdd_l3"},
-- 
2.38.1

