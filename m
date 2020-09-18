Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDCA26FE45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 15:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgIRNXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 09:23:17 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:25619 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgIRNXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 09:23:16 -0400
X-Greylist: delayed 341 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 09:23:15 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600435395; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=exXqLcIyyzNmMUFnFIDJKq5vfsUN/0HP8/mCm+MXqcI=; b=b3zLKyXyG0mAs90UB4n/MSPJmt3t4iryVMS66p8t4kfgFgJ1hLvIQ7ds/gRoprQiZ8Hy5LwP
 s18h1Ugu4zC1dEK4m5Ngsxz2ooyZK1+H40mcbj8qiNuq5yj5tIcnfnbTjZs0chmY4TD8RHY7
 kz0kGuQzbLX+RU7go+aNUL1mOcY=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f64b3684398385e3052e430 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 13:17:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6311EC433CB; Fri, 18 Sep 2020 13:17:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46698C433CA;
        Fri, 18 Sep 2020 13:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46698C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [PATCH v3] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
Date:   Fri, 18 Sep 2020 18:47:06 +0530
Message-Id: <1600435026-1876-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add the I2S controller node to sc7180 dtsi.
Add pinmux for primary and secondary I2S.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
Changes since v1:
   -- Updated I2S pin control nodes  with grouping common pin controls
   -- Updated lpass_cpu node with proper control names
Changes since v2:
   -- The plement of lpass_cpu node is changed
 
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e..59c39cf 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1742,6 +1742,45 @@
 				};
 			};
 
+			sec_mi2s_active: sec-mi2s-active {
+				pinmux {
+					pins = "gpio49", "gpio50", "gpio51";
+					function = "mi2s_1";
+				};
+
+				pinconf {
+					pins = "gpio49", "gpio50", "gpio51";;
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_active: pri-mi2s-active {
+				pinmux {
+					pins = "gpio53", "gpio54", "gpio55", "gpio56";
+					function = "mi2s_0";
+				};
+
+				pinconf {
+					pins = "gpio53", "gpio54", "gpio55", "gpio56";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_mclk_active: pri-mi2s-mclk-active {
+				pinmux {
+					pins = "gpio57";
+					function = "lpass_ext";
+				};
+
+				pinconf {
+					pins = "gpio57";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
 			sdc1_on: sdc1-on {
 				pinconf-clk {
 					pins = "sdc1_clk";
@@ -3389,6 +3428,36 @@
 			#power-domain-cells = <1>;
 		};
 
+		lpass_cpu: lpass@62f00000 {
+			compatible = "qcom,sc7180-lpass-cpu";
+
+			reg = <0 0x62f00000 0 0x29000>;
+			reg-names = "lpass-lpaif";
+
+			iommus = <&apps_smmu 0x1020 0>;
+
+			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+
+			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
+
+			clock-names = "pcnoc-sway-clk", "audio-core",
+					"mclk0", "pcnoc-mport-clk",
+					"mi2s-bit-clk0", "mi2s-bit-clk1";
+
+
+			#sound-dai-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif";
+		};
+
 		lpass_hm: clock-controller@63000000 {
 			compatible = "qcom,sc7180-lpasshm";
 			reg = <0 0x63000000 0 0x28>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

