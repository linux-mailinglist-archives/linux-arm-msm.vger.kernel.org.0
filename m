Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9439A3D0B3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 11:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236315AbhGUIUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 04:20:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20991 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236018AbhGUIBS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 04:01:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626856915; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vy1Ep55RnVZsoreoViCqRd7hhetJtneBz8aeTzwXrNM=; b=f++mFVlSEqeZhBSWd9n96lJaps4dpofgXnQdOdIkIdDSg8UrAf6HH4z+HU3GTZ3zAk7amd8z
 bNuo3uyYQs1bp8/oUA/bUnsyt4SRXiVCLRMVTpUixLAgCG2GtzG3ckITDifNt7YJ1MrF8WTi
 NsPeUCMVsBrum+AI88NlBHY6kIM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60f7ddcbe31d882d18c96568 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 08:41:47
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 54184C433F1; Wed, 21 Jul 2021 08:41:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5662C4360C;
        Wed, 21 Jul 2021 08:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B5662C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v5 1/2] arm64: dts: qcom: sc7180: Update lpass cpu node for audio over dp
Date:   Wed, 21 Jul 2021 14:11:25 +0530
Message-Id: <20210721084126.14035-2-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210721084126.14035-1-srivasam@codeaurora.org>
References: <20210721084126.14035-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Updaate lpass dts node with HDMI reg, interrupt and iommu
for supporting audio over dp.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index ad21a872be85..e6f6ebb2a9ac 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3534,17 +3534,20 @@ lpasscc: clock-controller@62d00000 {
 			#power-domain-cells = <1>;
 		};
 
-		lpass_cpu: lpass@62f00000 {
+		lpass_cpu: lpass@62d87000 {
 			compatible = "qcom,sc7180-lpass-cpu";
 
-			reg = <0 0x62f00000 0 0x29000>;
-			reg-names = "lpass-lpaif";
+			reg = <0 0x62d87000 0 0x68000>, <0 0x62f00000 0 0x29000>;
+			reg-names =  "lpass-hdmiif", "lpass-lpaif";
 
 			iommus = <&apps_smmu 0x1020 0>,
-				<&apps_smmu 0x1021 0>;
+				<&apps_smmu 0x1021 0>,
+				<&apps_smmu 0x1032 0>;
 
 			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
 
+			status = "disabled";
+
 			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
 				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
 				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
@@ -3561,8 +3564,9 @@ lpass_cpu: lpass@62f00000 {
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

