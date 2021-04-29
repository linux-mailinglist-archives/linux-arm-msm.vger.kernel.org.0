Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F5D36E930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 12:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240648AbhD2KxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 06:53:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17001 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240575AbhD2KxF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 06:53:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619693539; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=WzJnp8VEXAhB4PThXi7uYPcdyz7y9A0/UMUBJTxOg7o=; b=KTy7HbJv9Xobppz3RCJW5lG+gmIbw8CBq+pkzurgs1IL9FmbLJ4m21nsgIRsfni0F0JclXcc
 ivNsE8ziv0upX+MiY+/9NsxxBxlwsn6DvztvZTDKEl+FSj6WO7iSwQtn5j9pECvGXVGycfRb
 kJiQflkq1oXf9l60IC1VSf7a4fg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 608a8fcc853c0a2c46482087 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 10:51:56
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44AF9C4160D; Thu, 29 Apr 2021 10:51:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF04FC43217;
        Thu, 29 Apr 2021 10:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF04FC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 5/5] arm64: dts: qcom: sc7280: Add nodes to boot WPSS
Date:   Thu, 29 Apr 2021 16:21:05 +0530
Message-Id: <1619693465-5724-6-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
References: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add miscellaneous nodes to boot the Wireless Processor Subsystem (WPSS) on
SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 138 +++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 2cc478553935..5e0ae4a1c433 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -11,6 +11,8 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/reset/qcom,sdm845-aoss.h>
+#include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -51,6 +53,11 @@
 			no-map;
 		};
 
+		smem_mem: memory@80900000 {
+			reg = <0x0 0x80900000 0x0 0x200000>;
+			no-map;
+		};
+
 		cpucp_mem: memory@80b00000 {
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
@@ -251,6 +258,119 @@
 		};
 	};
 
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
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
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
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
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
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
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-wpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_WPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <13>;
+
+		wpss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wpss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -812,6 +932,12 @@
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex", "syscon";
+			reg = <0 0x01f40000 0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
@@ -825,6 +951,18 @@
 			interrupt-controller;
 		};
 
+		pdc_reset: reset-controller@b5e0000 {
+			compatible = "qcom,sc7280-pdc-global";
+			reg = <0 0x0b5e0000 0 0x20000>;
+			#reset-cells = <1>;
+		};
+
+		aoss_reset: reset-controller@c2a0000 {
+			compatible = "qcom,sc7280-aoss-cc", "qcom,sdm845-aoss-cc";
+			reg = <0 0x0c2a0000 0 0x31000>;
+			#reset-cells = <1>;
+		};
+
 		aoss_qmp: power-controller@c300000 {
 			compatible = "qcom,sc7280-aoss-qmp";
 			reg = <0 0x0c300000 0 0x100000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

