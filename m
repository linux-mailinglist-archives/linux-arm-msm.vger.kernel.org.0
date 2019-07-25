Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3258E74E46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 14:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388359AbfGYMkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 08:40:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50517 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388213AbfGYMkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 08:40:37 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so44883081wml.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gCwqBNqiH6Cazjbw2rLinwK1/I01nMLWsu9gwurgxHI=;
        b=bD1mSnBXEW7qLuMEwtw52MukOBD8WVorM6KS53hbiejSUrciirPICdcv6qeuylS3xh
         akC7ZG8s+RL1zqMGkDkyxq7l1xflqBPwxvu5sNQMNz92sMK2Tyochn8fzbe4NpQfY0sE
         kXXwk6iu1XFwq3/BaVEseL4yLX/ZYsgmqKz6rPtB/P45Gv4z//UZFjUaA6rYJSeH1SWT
         CqVL7RdiSsgsmnvvHZ9JyS1ypW/2iNbPkYve+5KZrSDCwuRoyK5nzE8/1F7mOGHKo9Yd
         CQPPdqpR95J4XYppTdQp+nO+m7W1+DtaxraDM+IOfmaEN+uRwuPGbLg4rYuJLLK0Ci4u
         IZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gCwqBNqiH6Cazjbw2rLinwK1/I01nMLWsu9gwurgxHI=;
        b=HssJXbB8xcTOr/BP6vEPWY6jhMmEybBaP/ruNJcbxEj82VwdHBnaNeBR7qut1AoHiP
         dhTbaElIXG2SKYsIgB6vm9mu4cZC0SHhxFHW5Yo1Aj2E5M8+YVYKItKwDX4lGkCFnpZ2
         /qNw6eITx2ZDFwMB+WMe6eW+Gr7KOg1j3FHh5UZalsw7/eb+UHXnxGx8kGp5+IroqA3a
         qOPf12AsoY1OCzBmJEUI2yrhD2gYbfUZubbe/1GsC3wUerX8dNDuz3xBNWK8q0TrFjo9
         ZSN0deamORTooqOl0cnhsqJJKc+CRZZbL//kckM9W8fUysyiyUqjJl3vxRQJ8qiykJB9
         T4xA==
X-Gm-Message-State: APjAAAW1q2x7R2DhoAewV/2T5lFQ86UARwTNUlP/YU/N6ehhd7kvEv0u
        2mvkmUs3+fy+Mo/oubeJN069Ez/30348zA==
X-Google-Smtp-Source: APXvYqwiaaONoJ1bhDvxILB7j4yN0qCUfeyGhpyyuPT6/Uwbtwrc8H53YL2Zn4cnrRfO8IpiwM7Ohg==
X-Received: by 2002:a1c:238d:: with SMTP id j135mr29120617wmj.39.1564058435359;
        Thu, 25 Jul 2019 05:40:35 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id c4sm39260225wrt.86.2019.07.25.05.40.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 05:40:34 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add Venus video codec DT node
Date:   Thu, 25 Jul 2019 15:39:49 +0300
Message-Id: <20190725123949.31763-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds Qualcomm Venus video codec DT node for the video
codec hardware found in MSM8996 platforms.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 68 +++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 942465d8aeb7..ac6e4e430eec 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1777,6 +1777,74 @@
 					      "ref_clk";
 			};
 		};
+
+		venus_smmu: arm,smmu-venus@d40000 {
+			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			reg = <0xd40000 0x20000>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc MMAGIC_VIDEO_GDSC>;
+			clocks = <&mmcc SMMU_VIDEO_AHB_CLK>,
+				 <&mmcc SMMU_VIDEO_AXI_CLK>;
+			clock-names = "iface", "bus";
+			#iommu-cells = <1>;
+			status = "okay";
+		};
+
+		video-codec@c00000 {
+			compatible = "qcom,msm8996-venus";
+			reg = <0x00c00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VENUS_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&venus_smmu 0x00>,
+				 <&venus_smmu 0x01>,
+				 <&venus_smmu 0x0a>,
+				 <&venus_smmu 0x07>,
+				 <&venus_smmu 0x0e>,
+				 <&venus_smmu 0x0f>,
+				 <&venus_smmu 0x08>,
+				 <&venus_smmu 0x09>,
+				 <&venus_smmu 0x0b>,
+				 <&venus_smmu 0x0c>,
+				 <&venus_smmu 0x0d>,
+				 <&venus_smmu 0x10>,
+				 <&venus_smmu 0x11>,
+				 <&venus_smmu 0x21>,
+				 <&venus_smmu 0x28>,
+				 <&venus_smmu 0x29>,
+				 <&venus_smmu 0x2b>,
+				 <&venus_smmu 0x2c>,
+				 <&venus_smmu 0x2d>,
+				 <&venus_smmu 0x31>;
+			memory-region = <&venus_region>;
+			status = "okay";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VENUS_CORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VENUS_CORE1_GDSC>;
+			};
+		};
 	};
 
 	sound: sound {
-- 
2.17.1

