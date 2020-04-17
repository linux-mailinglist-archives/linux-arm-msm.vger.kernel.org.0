Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44511ADFE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgDQO1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:27:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:28361 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727909AbgDQO0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:26:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587133615; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fSWZYAx+xUo9BW8l9Vg7d7Qrc7pAbwtD1+dmCZo15aU=; b=qAI7c0CNTsu91jzZWSIR4/3wecGHZLkaGuW4KfTq5M02Q+XiGVHWWCZj5sIpvCz15KABrxB9
 Fxf2163oGK+NiIHkgtqN1hQV46gIo05Vq41fxnnVI/Og1xgWsoXtzE6usOmbAXuZen3rl/AY
 GfNzUzt9ti6fb/Nzs0H2Qwy5E40=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99bca5.7fe88aa9f960-smtp-out-n03;
 Fri, 17 Apr 2020 14:26:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CAFB7C433BA; Fri, 17 Apr 2020 14:26:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 002ABC4478F;
        Fri, 17 Apr 2020 14:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 002ABC4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 5/5] arm64: dts: qcom: sc7180: Update Q6V5 MSS node
Date:   Fri, 17 Apr 2020 19:56:05 +0530
Message-Id: <20200417142605.28885-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417142605.28885-1-sibis@codeaurora.org>
References: <20200417142605.28885-1-sibis@codeaurora.org>
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

Depends on the following bindings:
iommus: https://patchwork.kernel.org/patch/11443101/
spare-regs: https://patchwork.kernel.org/patch/11491425/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 42 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    |  5 +++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index e613d70cc0198..6f472872be1a3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -319,6 +319,48 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_mpss {
+	compatible = "qcom,sc7180-mss-pil";
+	reg = <0 0x04080000 0 0x410>, <0 0x04180000 0 0x48>;
+	reg-names = "qdsp6", "rmb";
+
+	clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+		 <&gcc GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+		 <&gcc GCC_MSS_NAV_AXI_CLK>,
+		 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+		 <&gcc GCC_MSS_MFAB_AXIS_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "iface", "bus", "nav", "snoc_axi",
+		      "mnoc_axi", "xo";
+
+	iommus = <&apps_smmu 0x460 0x1>, <&apps_smmu 0x444 0x2>;
+
+	resets = <&aoss_reset AOSS_CC_MSS_RESTART>,
+		 <&pdc_reset PDC_MODEM_SYNC_RESET>;
+	reset-names = "mss_restart", "pdc_reset";
+
+	qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+	qcom,spare-regs = <&tcsr_regs 0xb3e4>;
+
+	power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+			<&rpmhpd SC7180_CX>,
+			<&rpmhpd SC7180_MX>,
+			<&rpmhpd SC7180_MSS>;
+	power-domain-names = "load_state", "cx", "mx", "mss";
+
+	/delete-property/memory-region;
+
+	status = "okay";
+
+	mba {
+		memory-region = <&mba_mem>;
+	};
+
+	mpss {
+		memory-region = <&mpss_mem>;
+	};
+};
+
 &uart3 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index e319762a0bffc..c49801ddb9d70 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -981,6 +981,11 @@ tcsr_mutex_regs: syscon@1f40000 {
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
