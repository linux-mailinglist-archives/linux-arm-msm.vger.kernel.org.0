Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DAE12483B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfLRNYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:24:22 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36622 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbfLRNYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:24:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so2134893ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2019 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=uHc+lthrXnMaFPsJZUtTjTk7JbzmnIRVKIq5hRLMJXUwM8249UZ6vrg2//+LI0OA43
         JopK3irKcBtCHJ9tfTVEyVvhdCDPWqZR4HVXis5Qr+w0a8QSsaKzm9J1U2bfZxjuWsYF
         4LGBx7uQJr3rEH19OqoH/J/8EqhcXY4iaX8Cs+CoL+gDy1QcGipKP+537M5s2+EhKEtN
         Ap7pwTAH2mKuVK0fZob6J626ttwghPIhF2cmxlDq+FVM27c2Nkf2pqPI17mKGCZjNV3X
         gX6GIhV7dB1+gdnNDBA+MhHeTnNTYz1Dm6T3sy/cw6bnhROfGrKAtTeGjE6jlbRiHvDT
         RjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sRlbBOojW7v2VRLaDWPeR8d17hgWrl9wNZOspFmUuFU=;
        b=j/7Np0j5+7r7gftZBmEMYh8py+tCFgc9oELwWgh6GVSqkDliYQnydXlmgW47i58yXZ
         jp9Z6kwBHUENUaJa1ZR923z7Mf+AYKEf3ChRS85SQoCj/6rOqmda5ZcuBTq9pOWr/dGa
         NNufTPQgyIAIGmFAugHXjWMTyb605DB4ZAyvkxu+VyTT2A5wm0g8431Fdos3UjcyqT5Q
         oZFWGc66Q9RQz+OrS7OFsO6G9rL+7Jkto6iNt0Js1/lHfg3Ob+7/jbEq3BxY9pr+DS7P
         hhODp+R7hLImb6MYi7VYhcXrxNG7VZ1PDNMNnRIonJJvoDw4b5XOu3AZ2MycrPFZ4cSG
         wslA==
X-Gm-Message-State: APjAAAUAFonPXWmcfqdDVPWo1wPM9AV3oTT75xj+ovltNxsVTh9UQ7lu
        ToJsZOVdr82rBmYCwxq6tSrnUlMsToI=
X-Google-Smtp-Source: APXvYqzecFt0moBmPL8ikUZivK+jtqmVvDhxKvoCDMXGy57D05+r6CFrgDnsaCce7deFS1237+ltOQ==
X-Received: by 2002:a2e:8698:: with SMTP id l24mr1794175lji.94.1576675457674;
        Wed, 18 Dec 2019 05:24:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id z7sm1440667lfa.81.2019.12.18.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:24:17 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 11/12] arm64: dts: sdm845: follow venus-sdm845v2 DT binding
Date:   Wed, 18 Dec 2019 15:22:50 +0200
Message-Id: <20191218132251.24161-12-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
References: <20191218132251.24161-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move all pmdomain and clock resources to Venus DT node. And make
possible to support dynamic core assignment on v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index ddb1f23c936f..c5784951d408 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2568,32 +2568,33 @@
 		};
 
 		video-codec@aa00000 {
-			compatible = "qcom,sdm845-venus";
+			compatible = "qcom,sdm845-venus-v2";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&videocc VENUS_GDSC>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&videocc VCODEC1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
-				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
-			clock-names = "core", "iface", "bus";
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus",
+				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
 
 			video-core0 {
 				compatible = "venus-decoder";
-				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC0_GDSC>;
 			};
 
 			video-core1 {
 				compatible = "venus-encoder";
-				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC1_GDSC>;
 			};
 		};
 
-- 
2.17.1

