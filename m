Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAAECB8AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 12:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfJDKvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 06:51:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37778 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJDKvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 06:51:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 284D661A24; Fri,  4 Oct 2019 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570186283;
        bh=okwnO27NbFYjjfsCFRbJqJqJfz8rw0aIBzpv6lhT0QM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IoZfhr09hGtOLzgdJOOGs1xFEa7mMb1td4MQNkMcIBF6e5Y8GbMs7PMC/RaK14kYf
         i4bTfPAbJQTY40GWAHe4pAZNUOh5UbcgO+O2RDcgw83Ay0QY7Y4JaH6L4Lqc3FIYzf
         7m2W4DOgHXkEHWcp5LOZo/TKAQ5ly6Al2ZIt/lTE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 487A061A17;
        Fri,  4 Oct 2019 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570186282;
        bh=okwnO27NbFYjjfsCFRbJqJqJfz8rw0aIBzpv6lhT0QM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ifaQvjwZaWjj9sJNvSN0QwrJWHIBviYJ+ci7wQyiaIJ8oWU9olTKKCsUG7bK9NGuo
         zYN5xQ8qxieFBqNyKkiSwQYUnpMfkj3oS7fFysl9Hc+/x/TW2hlVfELJU35u4IIEae
         z7wel7eQWaf5nXL4LhiFv2OmOQ02B9t9NQ7w34D4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 487A061A17
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 2/2] ARM: dts: qcom: sc7180-regulator: Add RPMh regulators for SC7180
Date:   Fri,  4 Oct 2019 16:20:57 +0530
Message-Id: <1570186257-10254-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
References: <1570186257-10254-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator devices for SC7180 as RPMh regulators. This ensures
that consumers are able to modify the physical state of PMIC
regulators.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi b/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi
new file mode 100644
index 0000000..50a675b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-regulator.dtsi
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, The Linux Foundation. All rights reserved.
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+&apps_rsc {
+	pm6150-rpmh-regulators {
+		compatible = "qcom,pm6150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a_1p1: smps1 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vreg_s4a_1p0: smps4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <1744000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_l1a_1p2: ldo1 {
+			regulator-min-microvolt = <1178000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l2a_1p0: ldo2 {
+			regulator-min-microvolt = <944000>;
+			regulator-max-microvolt = <1056000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <968000>;
+			regulator-max-microvolt = <1064000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l4a_0p8: ldo4 {
+			regulator-min-microvolt = <824000>;
+			regulator-max-microvolt = <928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5a_2p7: ldo5 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l6a_0p6: ldo6 {
+			regulator-min-microvolt = <568000>;
+			regulator-max-microvolt = <648000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l9a_0p6: ldo9 {
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l11a_1p8: ldo11 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l13a_1p8: ldo13 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1728000>;
+			regulator-max-microvolt = <1832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1696000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-min-microvolt = <2920000>;
+			regulator-max-microvolt = <3232000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l18a_2p8: ldo18 {
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l19a_2p9: ldo19 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+	};
+
+	pm6150l-rpmh-regulators {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1120000>;
+			regulator-max-microvolt = <1408000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1616000>;
+			regulator-max-microvolt = <1984000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1168000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-min-microvolt = <2696000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

