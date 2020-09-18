Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE5A27036C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRReX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:34:23 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:12808 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRReX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:34:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600450462; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=q2e9iINiXn4aOr/7k6nZrE8i9XGigJzoqBndAZHpgGE=; b=ikHcftIKT9Z89WeZVcDPRSw695D8uKyM3Y8vwi77poSY+6+KExcKvempzPDafgcFzgk0fRUD
 fdt51lWpeJmpv2TZyuAy9iBDVTrr9zGLcnDkvwPhUy5EiLSS9YjuE0AONbIIIofdB0Y5xRku
 CbTuESngz3C7dM/Q/ZkVDutVsGE=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f64ef8b6fe64d5a7fcb3abd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:34:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28489C433F1; Fri, 18 Sep 2020 17:34:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 43923C433CA;
        Fri, 18 Sep 2020 17:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 43923C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v4] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
Date:   Fri, 18 Sep 2020 23:03:46 +0530
Message-Id: <1600450426-14063-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add the I2S controller node to sc7180 dtsi.
Add pinmux for primary and secondary I2S.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes since v3:
   -- The typo error fix
Changes since v2:
   -- The plement of lpass_cpu node is changed
Changes since v1:
   -- Updated I2S pin control nodes  with grouping common pin controls
   -- Updated lpass_cpu node with proper control names

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6678f1e..427a4bf 100644
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
+					pins = "gpio49", "gpio50", "gpio51";
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

