Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1EC221C6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 08:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGPGOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 02:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgGPGOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 02:14:52 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC08C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 23:14:52 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k5so3405731plk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX60TSR1P7XjO+Zan3QrbefgI3vkAw4Lsg0JYzx7KTU=;
        b=DfaEXmosLkzCXColYdER7fQTE+pnxestTiwogli79YB63MdvbjgeIx7gkFJS1CbxBF
         o5b5y2FxBgxlnZJbQFsEEwOTkyQq6DYaoAuN81UW48px8AC/6JitpcdVwdzeMjfQD2a8
         tpLZ9QAuBKCI2jQcymhxWbWcN8sWCef2vk0BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rX60TSR1P7XjO+Zan3QrbefgI3vkAw4Lsg0JYzx7KTU=;
        b=Ewm9MCDp6tF7M/+CyeMd/4ISaoqZUxVcBHAqAgmkQIzporen0MEW1qATiO1kCd61xr
         3fSbNgZ9lh6gfeRq1l3s19o6z6A98abCLkSlwosx6VOeUWwWF8QnNUv/bK5axmUD5dLM
         eG9cYNzAi5J5ERgvakRV1eJpNxADSO8GUXGDe5hzE3jCs3GpnTHoEYBcIn2vVHSifqTz
         gpruswGvu1OyCCnqZOoFNd69ALL1ENoa3hPrQo8fhfSMcB6965sr/VGiEyH6zVPR8yrd
         D/YrYe+g9ddZ6vltEUTzNYl6quVvrc4qHI0FrQpJNJwqvfIUrewKSR7Qdwkt+b00Fj/+
         syfg==
X-Gm-Message-State: AOAM5326qVqzV63quDCyGa4MWNG0QXUB2G6bfu8zdTFKBRhxt23Rk8+4
        ewHLsAhL7PmlXcbhCBaMeVcXHw==
X-Google-Smtp-Source: ABdhPJytRFsLl3nksVCRoGhLJkXcC9c3Nco6dEzjGhQI7mrBYNaPdjOvYWM0U7xbKS1h4vZ5aIHkJw==
X-Received: by 2002:a17:90a:ea83:: with SMTP id h3mr3434941pjz.176.1594880091903;
        Wed, 15 Jul 2020 23:14:51 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id j10sm3885604pgh.28.2020.07.15.23.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 23:14:51 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, dianders@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Add lpass cpu node for I2S driver
Date:   Thu, 16 Jul 2020 14:14:45 +0800
Message-Id: <20200716061445.628709-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add the I2S controller node to sc7180 dtsi.
Add pinmux for pirmary and secondary I2S.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
This patch depends on these patch series so it is not ready to be merged now.
- clk: qcom: Support for Low Power Audio Clocks on SC7180 https://patchwork.kernel.org/cover/11664273/
- arm64: dts: qcom: sc7180: Add LPASS clock controller nodes https://patchwork.kernel.org/patch/11664303/
- ASoC: qcom: Add support for SC7180 lpass variant https://patchwork.kernel.org/cover/11650649/

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 132 +++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 6eb14b6a47f5..2fe3bd89f950 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -511,6 +511,34 @@ qusb2p_hstx_trim: hstx-trim-primary@25b {
 			};
 		};
 
+		lpass_cpu: lpass {
+			compatible = "qcom,lpass-cpu-sc7180";
+
+			reg = <0 0x62F00000 0 0x29000>;
+			reg-names = "lpass-lpaif";
+
+			iommus = <&apps_smmu 0x1020 0>;
+
+			power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
+
+			status = "disabled";
+
+			clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_CORE_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
+				 <&lpasscc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
+
+			clock-names = "noc", "audio-core", "mclk0", "sysnoc_mport",
+				      "pri_ibit", "sec_ibit";
+
+			#sound-dai-cells = <1>;
+
+			interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "lpass-irq-lpaif";
+		};
+
 		sdhc_1: sdhci@7c4000 {
 			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x7c4000 0 0x1000>,
@@ -1357,6 +1385,110 @@ pinmux {
 				};
 			};
 
+			sec_mi2s_active: sec-mi2s-active {
+				pinmux {
+					pins = "gpio49";
+					function = "mi2s_1";
+				};
+
+				pinconf {
+					pins = "gpio49";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			sec_mi2s_ws_active: sec-mi2s-ws-active {
+				pinmux {
+					pins = "gpio50";
+					function = "mi2s_1";
+				};
+
+				pinconf {
+					pins = "gpio50";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			sec_mi2s_dout_active: sec-mi2s-dout-active {
+				pinmux {
+					pins = "gpio51";
+					function = "mi2s_1";
+				};
+
+				pinconf {
+					pins = "gpio51";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_active: pri-mi2s-active {
+				pinmux {
+					pins = "gpio53";
+					function = "mi2s_0";
+				};
+
+				pinconf {
+					pins = "gpio53";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_ws_active: pri-mi2s-ws-active {
+				pinmux {
+					pins = "gpio54";
+					function = "mi2s_0";
+				};
+
+				pinconf {
+					pins = "gpio54";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_dout_active: pri-mi2s-dout-active {
+				pinmux {
+					pins = "gpio55";
+					function = "mi2s_0";
+				};
+
+				pinconf {
+					pins = "gpio55";
+					drive-strength = <8>;
+					bias-pull-up;
+				};
+			};
+
+			pri_mi2s_din_active: pri-mi2s-din-active {
+				pinmux {
+					pins = "gpio56";
+					function = "mi2s_0";
+				};
+
+				pinconf {
+					pins = "gpio56";
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
2.28.0.rc0.105.gf9edc3c819-goog

