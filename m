Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A15EF1249C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 15:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfLROdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 09:33:55 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:50117 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727030AbfLROdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 09:33:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576679634; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=iqtwOlCiJqGy4B1VCNqpNj5v+p2wn063PEVEdzNJ318=; b=YmfSvqwYTgqvYliX61Rz3/3YZH65RUGUrw7hsD0gRsJeNs/9TXYTMFLdyiQW+HlPRKPeiYhs
 depF6nlxxvKk4kLEnr97iyapfRIZoerT1X8IfuNYrihpzjGTTvouUBfcqNLbj+eFWSJv7NCQ
 7QOUiyySLJM1v7w8GvlGQec7j3M=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa38cb.7f9b82697068-smtp-out-n02;
 Wed, 18 Dec 2019 14:33:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1459AC4479F; Wed, 18 Dec 2019 14:33:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B1ADC433CB;
        Wed, 18 Dec 2019 14:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B1ADC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, swboyd@chromium.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Enable multiple nodes
Date:   Wed, 18 Dec 2019 20:03:32 +0530
Message-Id: <20191218143332.29107-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add scm, smem, smp2p, aoss-qmp, aoss-cc and pdc-global device nodes
to SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

Depends on https://patchwork.kernel.org/patch/11289689/

I'll probably need to re-spin the patch once Rob decides on how to name
the reserved-memory nodes.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 126 +++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8903f9afe62f6..4e3f092093925 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -9,7 +9,10 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
+#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sdm845-aoss.h>
+#include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -65,6 +68,10 @@
 		aop_cmd_db_mem: memory@80820000 {
 			reg = <0x0 0x80820000 0x0 0x20000>;
 			compatible = "qcom,cmd-db";
+		};
+
+		smem_mem: memory@80900000 {
+			reg = <0x0 0x80900000 0x0 0x200000>;
 			no-map;
 		};
 	};
@@ -192,6 +199,92 @@
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-sc7180", "qcom,scm";
+		};
+	};
+
+	tcsr_mutex: hwlock {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x1000>;
+		#hwlock-cells = <1>;
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lpass {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+
+		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apss_shared 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		adsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		adsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+		interrupts = <GIC_SPI 451 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apss_shared 14>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
@@ -643,6 +736,11 @@
 			};
 		};
 
+		tcsr_mutex_regs: syscon@1f40000 {
+			compatible = "syscon";
+			reg = <0 0x01f40000 0 0x40000>;
+		};
+
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
@@ -1052,6 +1150,12 @@
 			interrupt-controller;
 		};
 
+		pdc_reset: reset-controller@b2e0000 {
+			compatible = "qcom,sc7180-pdc-global", "qcom,sdm845-pdc-global";
+			reg = <0 0x0b2e0000 0 0x20000>;
+			#reset-cells = <1>;
+		};
+
 		tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
@@ -1072,6 +1176,22 @@
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_reset: reset-controller@c2a0000 {
+			compatible = "qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc";
+			reg = <0 0x0c2a0000 0 0x31000>;
+			#reset-cells = <1>;
+		};
+
+		aoss_qmp: qmp@c300000 {
+			compatible = "qcom,sc7180-aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apss_shared 0>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
@@ -1199,6 +1319,12 @@
 			};
 		};
 
+		apss_shared: mailbox@17c00000 {
+			compatible = "qcom,sc7180-apss-shared";
+			reg = <0 0x17c00000 0 0x10000>;
+			#mbox-cells = <1>;
+		};
+
 		watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sc7180", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
