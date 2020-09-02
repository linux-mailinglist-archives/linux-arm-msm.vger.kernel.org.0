Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB125A435
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 06:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgIBEEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 00:04:20 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:54964 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725927AbgIBEEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 00:04:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599019459; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=D/v2+5o8QeDQqJpVgc8PAhNMYlKjB1Kp896axpESimk=; b=l8T0YacL7LaMvd4qHg8n4EtGT5GPG/T63zcnr4YkgE/jc2Ag3Wt+7yYL6LbU1eVAcX+1sF3q
 lbCzOAr0hrPFXKTRNlTeKWxYlC+PEd8qHrK0FLH7SFB3MgGJdCn0m4pYuCWreF1Pq6MyoQs+
 gBdYBbTTdjzJKfezbfWrxrWySlI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f4f19c3252c522440555895 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 04:04:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31C08C433CA; Wed,  2 Sep 2020 04:04:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F24BC433C9;
        Wed,  2 Sep 2020 04:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F24BC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
Date:   Wed,  2 Sep 2020 09:34:01 +0530
Message-Id: <1599019441-29308-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add the I2S controller node to sc7180 dtsi.
Add pinmux for primary and secondary I2S.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b383..db60ca5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -676,6 +676,36 @@
 			};
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
 		sdhc_1: sdhci@7c4000 {
 			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x7c4000 0 0x1000>,
@@ -1721,6 +1751,45 @@
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
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

