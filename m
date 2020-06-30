Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3E720F0C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 10:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731592AbgF3IqC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 04:46:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61423 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731683AbgF3Ip6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 04:45:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593506756; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LEvEvodDhoXLHKbubKsxIozC6pAZZT8N/HoNx4Mmacg=; b=YTJ+kKw7rl7VwRvd6F8FQNCQQMN2/qg7Rqr5FQ+rgRGIQLvDVM0IL0a33iDzBC9pvIpQBUmB
 beqkyqFB919fu02TmC3j+++r+F0eC/+p42Due2quW9BNDDiHP8SpbyUohyvYi18zD30N8iqi
 0zUTkJv/ziSegS7CxqhYuFKTH8U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5efafbb286de6ccd44db7599 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 08:45:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76C23C433CB; Tue, 30 Jun 2020 08:45:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6699C433C8;
        Tue, 30 Jun 2020 08:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6699C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/4] arm64: dts: sc7180: Add OPP table for all qup devices
Date:   Tue, 30 Jun 2020 14:15:10 +0530
Message-Id: <1593506712-24557-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qup has a requirement to vote on the performance state of the CX domain
in sc7180 devices. Add OPP tables for these and also add power-domains
property for all qup instances for uart and spi.
i2c does not support scaling and uses a fixed clock.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ad57df2..78fef54 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -537,6 +537,25 @@
 			status = "disabled";
 		};
 
+		qup_opp_table: qup-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-128000000 {
+				opp-hz = /bits/ 64 <128000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -579,6 +598,8 @@
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -593,6 +614,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -627,6 +650,8 @@
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -641,6 +666,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -673,6 +700,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -707,6 +736,8 @@
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -721,6 +752,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -753,6 +786,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -787,6 +822,8 @@
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -801,6 +838,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_0>;
 				interconnect-names = "qup-core", "qup-config";
@@ -850,6 +889,8 @@
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -864,6 +905,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart6_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -896,6 +939,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart7_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -930,6 +975,8 @@
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -944,6 +991,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart8_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -976,6 +1025,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart9_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -1010,6 +1061,8 @@
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -1024,6 +1077,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart10_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -1058,6 +1113,8 @@
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
@@ -1072,6 +1129,8 @@
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart11_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7180_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
 						<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_1>;
 				interconnect-names = "qup-core", "qup-config";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

