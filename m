Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A988427AB2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 11:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgI1Jta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 05:49:30 -0400
Received: from z5.mailgun.us ([104.130.96.5]:17115 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgI1Jta (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 05:49:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601286569; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qn+TyQW0uRSEpV5/j5AX5raZI77uFQO7tTHdRBnrOjM=; b=L6DDXwdUyJagrXQAEZT8PmeJPq6m/rx1Kv0zCizWmoili/wzd+2LHZdi5KirjUqech0RHGku
 EvBIaXRF0NUPf7yAqQjYMFls7peH7oQH+lmRT7/RxHhxwLcWHrCcs09RbPBIev+W3e89i9Gb
 HYSc7paQmMUv+YuEt/r6LiqADCo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f71b1a9a7eb63c6982c1d51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 09:49:29
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90E62C433F1; Mon, 28 Sep 2020 09:49:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25641C433CB;
        Mon, 28 Sep 2020 09:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25641C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
Date:   Mon, 28 Sep 2020 15:19:04 +0530
Message-Id: <1601286545-25429-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601286545-25429-1-git-send-email-srivasam@codeaurora.org>
References: <1601286545-25429-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Updaate lpass dts node with HDMI reg, interrupt and iommu
for supporting audio over dp.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 427a4bf..802ea0a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/reset/qcom,sdm845-pdc.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3428,16 +3429,18 @@
 			#power-domain-cells = <1>;
 		};
 
-		lpass_cpu: lpass@62f00000 {
+		lpass_cpu: lpass@62d87000 {
 			compatible = "qcom,sc7180-lpass-cpu";
 
-			reg = <0 0x62f00000 0 0x29000>;
-			reg-names = "lpass-lpaif";
+			reg = <0 0x62d87000 0 0x68000>, <0 0x62f00000 0 0x29000>;
+			reg-names =  "lpass-hdmiif", "lpass-lpaif";
 
-			iommus = <&apps_smmu 0x1020 0>;
+			iommus = <&apps_smmu 0x1020 0>, <&apps_smmu 0x1032 0>;
 
 			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
 
+			status = "disabled";
+
 			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
 				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
 				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
@@ -3449,13 +3452,13 @@
 					"mclk0", "pcnoc-mport-clk",
 					"mi2s-bit-clk0", "mi2s-bit-clk1";
 
-
 			#sound-dai-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "lpass-irq-lpaif";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif", "lpass-irq-hdmi";
 		};
 
 		lpass_hm: clock-controller@63000000 {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

