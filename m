Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF13D60A8C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 15:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbiJXNK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 09:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbiJXNKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 09:10:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5D3A221F;
        Mon, 24 Oct 2022 05:23:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D57AA612E6;
        Mon, 24 Oct 2022 12:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89CBC433D7;
        Mon, 24 Oct 2022 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666613219;
        bh=PHfa30wXeQj8H2Hq4WSPYKIb6dph1mJ/5TjURLeioIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Um69Xy8qu0E9M3aIGYqwBxCD53Y12EpvoTYZBHk67gR9t/LvqH5Lmh9/YiLNtsJGu
         1OaFs4IP2s01ujmVSQH8ol4yug+QdWcdmpMskCxSBXl/B82XBaSNiB61qyZTMs55jp
         ikIu5GL2FuB0tt810JzQ9uUi0g90JhKmsExH8lpY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH 5.4 026/255] regulator: qcom_rpm: Fix circular deferral regression
Date:   Mon, 24 Oct 2022 13:28:56 +0200
Message-Id: <20221024113003.322709743@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024113002.471093005@linuxfoundation.org>
References: <20221024113002.471093005@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

commit 8478ed5844588703a1a4c96a004b1525fbdbdd5e upstream.

On recent kernels, the PM8058 L16 (or any other PM8058 LDO-regulator)
does not come up if they are supplied by an SMPS-regulator. This
is not very strange since the regulators are registered in a long
array and the L-regulators are registered before the S-regulators,
and if an L-regulator defers, it will never get around to registering
the S-regulator that it needs.

See arch/arm/boot/dts/qcom-apq8060-dragonboard.dts:

pm8058-regulators {
    (...)
    vdd_l13_l16-supply = <&pm8058_s4>;
    (...)

Ooops.

Fix this by moving the PM8058 S-regulators first in the array.

Do the same for the PM8901 S-regulators (though this is currently
not causing any problems with out device trees) so that the pattern
of registration order is the same on all PMnnnn chips.

Fixes: 087a1b5cdd55 ("regulator: qcom: Rework to single platform device")
Cc: stable@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20220909112529.239143-1-linus.walleij@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/regulator/qcom_rpm-regulator.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -812,6 +812,12 @@ static const struct rpm_regulator_data r
 };
 
 static const struct rpm_regulator_data rpm_pm8058_regulators[] = {
+	{ "s0",   QCOM_RPM_PM8058_SMPS0,  &pm8058_smps, "vdd_s0" },
+	{ "s1",   QCOM_RPM_PM8058_SMPS1,  &pm8058_smps, "vdd_s1" },
+	{ "s2",   QCOM_RPM_PM8058_SMPS2,  &pm8058_smps, "vdd_s2" },
+	{ "s3",   QCOM_RPM_PM8058_SMPS3,  &pm8058_smps, "vdd_s3" },
+	{ "s4",   QCOM_RPM_PM8058_SMPS4,  &pm8058_smps, "vdd_s4" },
+
 	{ "l0",   QCOM_RPM_PM8058_LDO0,   &pm8058_nldo, "vdd_l0_l1_lvs"	},
 	{ "l1",   QCOM_RPM_PM8058_LDO1,   &pm8058_nldo, "vdd_l0_l1_lvs" },
 	{ "l2",   QCOM_RPM_PM8058_LDO2,   &pm8058_pldo, "vdd_l2_l11_l12" },
@@ -839,12 +845,6 @@ static const struct rpm_regulator_data r
 	{ "l24",  QCOM_RPM_PM8058_LDO24,  &pm8058_nldo, "vdd_l23_l24_l25" },
 	{ "l25",  QCOM_RPM_PM8058_LDO25,  &pm8058_nldo, "vdd_l23_l24_l25" },
 
-	{ "s0",   QCOM_RPM_PM8058_SMPS0,  &pm8058_smps, "vdd_s0" },
-	{ "s1",   QCOM_RPM_PM8058_SMPS1,  &pm8058_smps, "vdd_s1" },
-	{ "s2",   QCOM_RPM_PM8058_SMPS2,  &pm8058_smps, "vdd_s2" },
-	{ "s3",   QCOM_RPM_PM8058_SMPS3,  &pm8058_smps, "vdd_s3" },
-	{ "s4",   QCOM_RPM_PM8058_SMPS4,  &pm8058_smps, "vdd_s4" },
-
 	{ "lvs0", QCOM_RPM_PM8058_LVS0, &pm8058_switch, "vdd_l0_l1_lvs" },
 	{ "lvs1", QCOM_RPM_PM8058_LVS1, &pm8058_switch, "vdd_l0_l1_lvs" },
 
@@ -853,6 +853,12 @@ static const struct rpm_regulator_data r
 };
 
 static const struct rpm_regulator_data rpm_pm8901_regulators[] = {
+	{ "s0",   QCOM_RPM_PM8901_SMPS0, &pm8901_ftsmps, "vdd_s0" },
+	{ "s1",   QCOM_RPM_PM8901_SMPS1, &pm8901_ftsmps, "vdd_s1" },
+	{ "s2",   QCOM_RPM_PM8901_SMPS2, &pm8901_ftsmps, "vdd_s2" },
+	{ "s3",   QCOM_RPM_PM8901_SMPS3, &pm8901_ftsmps, "vdd_s3" },
+	{ "s4",   QCOM_RPM_PM8901_SMPS4, &pm8901_ftsmps, "vdd_s4" },
+
 	{ "l0",   QCOM_RPM_PM8901_LDO0, &pm8901_nldo, "vdd_l0" },
 	{ "l1",   QCOM_RPM_PM8901_LDO1, &pm8901_pldo, "vdd_l1" },
 	{ "l2",   QCOM_RPM_PM8901_LDO2, &pm8901_pldo, "vdd_l2" },
@@ -861,12 +867,6 @@ static const struct rpm_regulator_data r
 	{ "l5",   QCOM_RPM_PM8901_LDO5, &pm8901_pldo, "vdd_l5" },
 	{ "l6",   QCOM_RPM_PM8901_LDO6, &pm8901_pldo, "vdd_l6" },
 
-	{ "s0",   QCOM_RPM_PM8901_SMPS0, &pm8901_ftsmps, "vdd_s0" },
-	{ "s1",   QCOM_RPM_PM8901_SMPS1, &pm8901_ftsmps, "vdd_s1" },
-	{ "s2",   QCOM_RPM_PM8901_SMPS2, &pm8901_ftsmps, "vdd_s2" },
-	{ "s3",   QCOM_RPM_PM8901_SMPS3, &pm8901_ftsmps, "vdd_s3" },
-	{ "s4",   QCOM_RPM_PM8901_SMPS4, &pm8901_ftsmps, "vdd_s4" },
-
 	{ "lvs0", QCOM_RPM_PM8901_LVS0, &pm8901_switch, "lvs0_in" },
 	{ "lvs1", QCOM_RPM_PM8901_LVS1, &pm8901_switch, "lvs1_in" },
 	{ "lvs2", QCOM_RPM_PM8901_LVS2, &pm8901_switch, "lvs2_in" },


