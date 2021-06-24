Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0486D3B3768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 21:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhFXTwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 15:52:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57997 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbhFXTwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 15:52:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624564183; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=iaqWHZmgS8Lu3MlAqmI7Z55aQR1Dhk3as4p++438MG0=; b=VSenQBN7RQeZ/qKp6ZYl3N7HlpIGFAGqKDAmYE4XFPfR8UeyY9gEnKZRTxiwjP4NZncrwYSN
 h8yFhpPVwB0S2xQIUnFejt726vRZ4gwbWVndCdIikOIlTSZkiAbM731btMp+Je/XhgmUsRTO
 xDKzupIY0krlGCHl5+yneAqzq0Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60d4e1be5e3e57240b977354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 19:49:18
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5F08C43144; Thu, 24 Jun 2021 19:49:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35C58C43145;
        Thu, 24 Jun 2021 19:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35C58C43145
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 9/9] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
Date:   Fri, 25 Jun 2021 01:17:38 +0530
Message-Id: <1624564058-24095-10-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update MSS node to support MSA based modem boot on SC7280 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 19 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 191e8a92d153..d66e3ca42ad5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -343,3 +343,10 @@
 		bias-pull-up;
 	};
 };
+
+&remoteproc_mpss {
+	status = "okay";
+	compatible = "qcom,sc7280-mss-pil";
+	iommus = <&apps_smmu 0x124 0x0>, <&apps_smmu 0x488 0x7>;
+	memory-region = <&mba_mem &mpss_mem>;
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 56ea172f641f..6d3687744440 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -586,7 +586,8 @@
 
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,sc7280-mpss-pas";
-			reg = <0 0x04080000 0 0x10000>;
+			reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
+			reg-names = "qdsp6", "rmb";
 
 			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
 					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
@@ -597,8 +598,11 @@
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_OFFLINE_AXI_CLK>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "offline", "snoc_axi", "xo";
 
 			power-domains = <&rpmhpd SC7280_CX>,
 					<&rpmhpd SC7280_MSS>;
@@ -611,6 +615,15 @@
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+				 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+			reset-names = "mss_restart", "pdc_reset";
+
+			qcom,halt-regs = <&tcsr_mutex 0x23000 0x25000 0x28000 0x33000>;
+			qcom,ext-regs = <&tcsr_regs 0x10000 0x10004
+					 &tcsr_mutex 0x26004 0x26008>;
+			qcom,qaccept-regs = <&tcsr_mutex 0x23030 0x23040 0x23020>;
+
 			status = "disabled";
 
 			glink-edge {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

