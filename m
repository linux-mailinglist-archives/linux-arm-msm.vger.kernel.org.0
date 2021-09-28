Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC1841B158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240954AbhI1N6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:58:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32391 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241154AbhI1N6O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:58:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632837394; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=d1bqIbCb6A0cdyg4xxTSDN2l2cjyaAmnVWjCeucB6/s=; b=BhgWeSJQfgi2c1fRR6fuFVvoxAzGnrI9sk23OzQ5D5HsrlqKx1eY7lb/ii2NMQpx2LYmTRIJ
 5tld+iDcDbIv+OrbJEIM7puXC0rCZrOooU758AK4E+G7qaEvI1WO2S1HuVzS5E30OFKELRLw
 SR6Uis0pnDYcBSpvE9SOTykDI+8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61531f04713d5d6f961079c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:56:20
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94956C43460; Tue, 28 Sep 2021 13:56:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 868E0C43616;
        Tue, 28 Sep 2021 13:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 868E0C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v9 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
Date:   Tue, 28 Sep 2021 19:25:49 +0530
Message-Id: <1632837350-12100-4-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632837350-12100-1-git-send-email-pmaliset@codeaurora.org>
References: <1632837350-12100-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe controller and PHY for sc7280 IDP board.
Add specific NVMe GPIO entries for SKU1 and SKU2 support.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  9 ++++++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 54 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 ++++++
 3 files changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..1562386 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,15 @@
 	modem-init;
 };
 
+&nvme_pwren_pin {
+	pins = "gpio19";
+};
+
+&nvme_3v3_regulators {
+	gpio = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
+
 &pmk8350_vadc {
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index def22ff..5b5505f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -31,6 +31,17 @@
 			linux,can-disable;
 		};
 	};
+
+	nvme_3v3_regulators: nvme-3v3-regulators {
+		compatible = "regulator-fixed";
+		regulator-name = "VLDO_3V3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&nvme_pwren_pin>;
+	};
 };
 
 &apps_rsc {
@@ -220,6 +231,42 @@
 	modem-init;
 };
 
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&nvme_3v3_regulators>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l10c_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
+&pcie1_default_state {
+	reset-n {
+		pins = "gpio2";
+		function = "gpio";
+
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	wake-n {
+		pins = "gpio3";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &pmk8350_vadc {
 	pmk8350_die_temp {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
@@ -489,3 +536,10 @@
 		bias-pull-up;
 	};
 };
+
+&tlmm {
+	nvme_pwren_pin: nvme-pwren-pin {
+		function = "gpio";
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
index 1fc2add..0548cb6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -21,3 +21,12 @@
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&nvme_pwren_pin {
+	pins = "gpio51";
+};
+
+&nvme_3v3_regulators {
+	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

