Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B003C3E8297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 20:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhHJSMl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 14:12:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21870 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234196AbhHJSMb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 14:12:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628619129; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oL1WDsEvqvap52+RoHgws/BVmR0/7VIUAB6915T9xi0=; b=KrOUpc1xNtNB5WAOBQI2Kj4Q9M7RME9yDEGGf+bW845y2Swo3RdA5iOxThcH6fjqd8MfQy6p
 b1KDuboG7HVNjToGcQ6BowRaZFl4Wb7ZxZ5J1VDkSY1KJOyAWvKKaTRlyu+0M39oBvfBQsXf
 aXGBS0qxEIAtTyjbiyR+aWmSd0g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6112c163b14e7e2ecba9f9ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 18:11:47
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A481BC28D95; Tue, 10 Aug 2021 18:11:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61494C41634;
        Tue, 10 Aug 2021 18:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61494C41634
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        sboyd@kernel.org, mpubbise@codeaurora.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Tue, 10 Aug 2021 23:41:29 +0530
Message-Id: <1628619089-12502-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the WPSS remoteproc node in dts for
PIL loading.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 57 +++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..2b8bbcd 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -68,3 +68,7 @@
 		qcom,pre-scaling = <1 1>;
 	};
 };
+
+&remoteproc_wpss {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d0..41a7826 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -74,6 +74,16 @@
 			reg = <0 0x8b700000 0 0x10000>;
 			no-map;
 		};
+
+		wlan_fw_mem: memory@80c00000 {
+			no-map;
+			reg = <0x0 0x80c00000 0x0 0xc00000>;
+		};
+
+		wpss_mem: memory@9ae00000 {
+			no-map;
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+		};
 	};
 
 	cpus {
@@ -1270,6 +1280,53 @@
 			};
 		};
 
+		remoteproc_wpss: remoteproc@8a00000 {
+			compatible = "qcom,sc7280-wpss-pil";
+			reg = <0 0x08a00000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wpss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wpss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wpss_smp2p_in 3 IRQ_TYPE_NONE>,
+					      <&wpss_smp2p_in 7 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
+				 <&gcc GCC_WPSS_AHB_CLK>,
+				 <&gcc GCC_WPSS_RSCP_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "gcc_wpss_ahb_bdg_mst_clk",
+				      "gcc_wpss_ahb_clk",
+				      "gcc_wpss_rscp_clk",
+				      "xo";
+
+			memory-region = <&wpss_mem>;
+
+			qcom,smem-states = <&wpss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
+				 <&pdc_reset PDC_WPSS_SYNC_RESET>;
+			reset-names = "restart", "pdc_sync";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x37000>;
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_WPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "wpss";
+				qcom,remote-pid = <13>;
+			};
+		};
+
 		usb_2: usb@8cf8800 {
 			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
 			reg = <0 0x08cf8800 0 0x400>;
-- 
2.7.4

