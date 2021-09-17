Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454F140F5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 12:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243286AbhIQKgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 06:36:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11058 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhIQKgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 06:36:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631874926; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tRXdGQsaqxR1qi7Nl0T2GI7fM9kuNZn8DahzwykxK28=; b=iCdEpgXW65EAYLo3PpkLedbjGwnhOibXPTX1sKknUJC/rZgO/PqrLGVYDwdd4zFA84597fpH
 OSArH9+gI3qZMw/g8mQqD0flhZsMW1no+PSN9wCoBfVfh9+6fsTGAkFH6cIfGux4ijxkH+l6
 Q2g6A1hCBvl+tXu/WUoaV0+3ceE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61446f51d914b051820fefce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 10:34:57
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D252C4360C; Fri, 17 Sep 2021 10:34:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22F0CC4338F;
        Fri, 17 Sep 2021 10:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 22F0CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH v4] arm64: dts: qcom: sc7280: Add WPSS remoteproc node
Date:   Fri, 17 Sep 2021 16:04:44 +0530
Message-Id: <1631874884-5166-1-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the WPSS remoteproc node in dts for
PIL loading.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
Changes from v3:
- Fix the qcom,halt-regs
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  4 +++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 63 +++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

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
index 89ed7f2..c644a9b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -69,10 +69,20 @@
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
 
+		wlan_fw_mem: memory@80c00000 {
+			no-map;
+			reg = <0x0 0x80c00000 0x0 0xc00000>;
+		};
+
 		ipa_fw_mem: memory@8b700000 {
 			reg = <0 0x8b700000 0 0x10000>;
 			no-map;
 		};
+
+		wpss_mem: memory@9ae00000 {
+			no-map;
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+		};
 	};
 
 	cpus {
@@ -1423,6 +1433,59 @@
 			#power-domain-cells = <1>;
 		};
 
+		remoteproc_wpss: remoteproc@8a00000 {
+			compatible = "qcom,sc7280-wpss-pil";
+			reg = <0 0x08a00000 0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
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
+			power-domains = <&rpmhpd SC7280_CX>,
+					<&rpmhpd SC7280_MX>;
+			power-domain-names = "cx", "mx";
+
+			memory-region = <&wpss_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&wpss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
+				 <&pdc_reset PDC_WPSS_SYNC_RESET>;
+			reset-names = "restart", "pdc_sync";
+
+			qcom,halt-regs = <&tcsr_mutex 0x37000>;
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
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.7.4

