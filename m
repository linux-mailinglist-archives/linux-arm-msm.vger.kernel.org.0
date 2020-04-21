Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2331B1B29FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgDUOdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 10:33:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:11030 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729057AbgDUOdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 10:33:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587479612; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LKhdSg28NnR3I8OZVDPXHKTM1A7Z4ruLmGkZBwTex78=; b=XONVh23/PIPdLRHzuZvIiUZOK7spc/9rDQLATlKs0dGYDlzuDv4NzpGAzGUyDdY78dOzmDhD
 QKY1oprx7LUJBWiwSzSM1K/p7IEcu69vnjxjflNCb1viC3ILPlyxLTD8Wshf9D6m5+RuKYzB
 qLIvio9IJ5r94Ll9A4rAwMgkGuY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f042c.7f7cc6e7c0a0-smtp-out-n02;
 Tue, 21 Apr 2020 14:33:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AAC38C38567; Tue, 21 Apr 2020 14:33:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11FAEC43636;
        Tue, 21 Apr 2020 14:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11FAEC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, mka@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
Date:   Tue, 21 Apr 2020 20:02:28 +0530
Message-Id: <20200421143228.8981-8-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TCSR node and update MSS node to support MSA based Modem boot on
SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * use memory-region to reference mba/mpss regions [Bjorn]
 * overload the base remoteproc_mpss node wherever possible [Bjorn]

Depends on the following bindings:
iommus: https://patchwork.kernel.org/patch/11499603/
spare-regs: https://patchwork.kernel.org/patch/11491425/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 28 +++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 5405cde1a32ef..08f1f04cca734 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -309,6 +309,13 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7180-mss-pil";
+	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x3>;
+	memory-region = <&mba_mem &mpss_mem>;
+};
+
 &sdhc_1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 94cead96eade0..5e2618eb1b7fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -932,6 +932,11 @@ tcsr_mutex_regs: syscon@1f40000 {
 			reg = <0 0x01f40000 0 0x40000>;
 		};
 
+		tcsr_regs: syscon@1fc0000 {
+			compatible = "syscon";
+			reg = <0 0x01fc0000 0 0x40000>;
+		};
+
 		tlmm: pinctrl@3500000 {
 			compatible = "qcom,sc7180-pinctrl";
 			reg = <0 0x03500000 0 0x300000>,
@@ -1325,7 +1330,8 @@ pinconf-sd-cd {
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sc7180-mpss-pas";
-			reg = <0 0x04080000 0 0x4040>;
+			reg = <0 0x04080000 0 0x4040>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
 
 			interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -1336,19 +1342,33 @@ remoteproc_mpss: remoteproc@4080000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_NAV_AXI_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "bus", "nav", "snoc_axi",
+				      "mnoc_axi", "xo";
 
 			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
 					<&rpmhpd SC7180_CX>,
+					<&rpmhpd SC7180_MX>,
 					<&rpmhpd SC7180_MSS>;
-			power-domain-names = "load_state", "cx", "mss";
+			power-domain-names = "load_state", "cx", "mx", "mss";
 
 			memory-region = <&mpss_mem>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+			qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+
 			status = "disabled";
 
 			glink-edge {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
