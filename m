Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C635BF038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiITWdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiITWdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:33:45 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F2C474C1;
        Tue, 20 Sep 2022 15:33:44 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id c4so3628515iof.3;
        Tue, 20 Sep 2022 15:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8x7bkc+/nQ4Gak6zOOVzdJShWFx0m/P34PcdoTGcao4=;
        b=OswUv+NR5xlRdjGfDKP40MbmgCQjeXYtK8PqtzjqfHuA28/0EwyYLC2byrOhNmXORy
         E5wT9SNoIN9ZHmVfodXEL8ifRdaptQJ/8aw9F1jbnijn7aRNrOZ1cbGZ14UqLM76k9fV
         iYdtBayWcozVDKTAT8OJC4Vj9QXBh+5C0z9B7quh0pZScgSr5+gVAssOlUW1RP0dqt3m
         m5CpcysAfu2X6HpLoRaPXX7FC75n+CmSJBS9umvtcBWhJQYxM4KHKnymh0a2qWKJtcM+
         YKsRPORqiefCldrwZD1gfMcvqaUN89VF4qZVrkUO1zKRz3Os1o4tXLfBSDgOG950Zq3u
         skug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8x7bkc+/nQ4Gak6zOOVzdJShWFx0m/P34PcdoTGcao4=;
        b=qJdwTsz1HLDpUjLWPy72eeWA3nc/dYU3v+JhazkitOs3W9Ib5ekAWZO0R/vEyGDFHA
         C2OsWYfGP7SGpZr/cTdnVdTYsfTPLVRRzN/ILC0q133PeWI/dgBiSAYWyTWwtey0dysm
         UEdAAqEd9+fKB6H/mXUXX2vq1GbpqNnFn82bXowEsl6Mu1WKaSE1BD5e8f0KzzsZHgsm
         vVwWGY8SuSpBjcVyq/haXUevr3h3HT88PxSt5q+8Omu9R9K1+QxV0D8gxfD0NCWdwM4E
         O89H9qxJ9eanes23rnJ1nuSCEzyo7IxeoJKcHZCtME2/XGQS/g/0lxlg7inIDIBCdLpE
         C92w==
X-Gm-Message-State: ACrzQf3ya1hQNL/+x7Ntj1aatOiGFkGtquDxu7GFJh/ulxGKKmSzAsR0
        SnkDdo8x1pVDPkTCA114nyzcfosO0vo=
X-Google-Smtp-Source: AMsMyM6l/w7kUfqUCApbzt7/WdUFWyfH1QfOS5eT3T38t3s41W0Ep1K+oPIusf4+CtDh9h9UMVb8Jg==
X-Received: by 2002:a05:6602:2b14:b0:67b:8976:2945 with SMTP id p20-20020a0566022b1400b0067b89762945mr10333822iov.82.1663713223071;
        Tue, 20 Sep 2022 15:33:43 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id n4-20020a056638110400b0034ac4b215c3sm379128jal.102.2022.09.20.15.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:33:42 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/2] regulator: qcom-rpmh: add pm660 and pm660l pmics
Date:   Tue, 20 Sep 2022 18:33:31 -0400
Message-Id: <20220920223331.150635-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223331.150635-1-mailingradian@gmail.com>
References: <20220920223331.150635-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM630 and SDM660 both use RPM (not RPMh) for managing the PM660 and
PM660L. The SDM670 uses RPMh to manage them as PMIC 4s. To support the
SDM670, add the PM660 and PM660L to the RPMh regulator driver.

Link: https://android.googlesource.com/kernel/msm/+/58064f13c0a436a82c35f2e3b5a122d874ae5846%5E%21/#F0
Link: https://android.googlesource.com/kernel/msm/+/f676d3d24f9d802bfe63369167c4a8cc162b8950%5E%21/#F3
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index b2debde79361..4158ff126a67 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1198,6 +1198,52 @@ static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm660_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic4_hfsmps3,   "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic4_hfsmps3,   "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic4_hfsmps3,   "vdd-s6"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic4_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic4_nldo,      "vdd-l2-l3"),
+	/* ldo4 is inaccessible on PM660 */
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic4_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo19",  "ldo%s19", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	{}
+};
+
+static const struct rpmh_vreg_init_data pm660l_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic4_ftsmps426, "vdd-s5"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic4_nldo,      "vdd-l1-l9-l10"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic4_pldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic4_pldo,      "vdd-l4-l6"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic4_pldo,      "vdd-l4-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
+	{}
+};
+
 static int rpmh_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1320,6 +1366,14 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmr735a-rpmh-regulators",
 		.data = pmr735a_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm660-rpmh-regulators",
+		.data = pm660_vreg_data,
+	},
+	{
+		.compatible = "qcom,pm660l-rpmh-regulators",
+		.data = pm660l_vreg_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
-- 
2.37.3

