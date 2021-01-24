Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D24B301C66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 14:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbhAXN51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbhAXN5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:13 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6152C0613D6;
        Sun, 24 Jan 2021 05:56:32 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i9so1944681wmq.1;
        Sun, 24 Jan 2021 05:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AHT49i6GyNpyvj3dxg+CB5QvV0SG3lXZeXOaf7l4V8M=;
        b=MJ3PlxPcG3R9uoMzEJciGkBnDHw0EcAVlnlVXoFXJg77snSLxUrpwo1lVsqw7fZig5
         QeRWGfoTAADzQaikDitYkBlVvgFCCz1G5zAd33ir5v44NtcoaQqRPRDpwcltqh4emlLD
         +6ATP0Hj2LG6Nki02N1CRGI7SawaMFsI8TkWUHksYjagdamtrR7lhivZZuzB9SPD5tBB
         Lh3gngn06C1xi6XfClrlPGqCpxzM4ifL3WTEWKonc0kdk+uxfyjf+MSgxbtKsVrVsU4f
         6qR0GRpU4BhtzWwTO5neo5v2MAUVvo1EWnsaSSvunW/HTmrilC58Ly3O1B2bUtOFuBX8
         feOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AHT49i6GyNpyvj3dxg+CB5QvV0SG3lXZeXOaf7l4V8M=;
        b=URRo9gG+BAJ3Cnq3rUIdSqaxxCI4WNOnG0U/44rzUD+EAdj5zdFkDUkdD4iQ2+V7Cy
         od5r9VNBZUJIuRBdi2Kti7sBhfq26WBYKYWlB6tg+/BvjtLc81yZU2oMATb6LKV5jUkw
         6LjD7zWtqBkOOyelQOTH7HtirxJPxxto6jqKzSnMSAuDN0NCby0YZXiZiYAM9DHcRQEt
         M7YNvAJ9NTTgzWOBKSg236UVC6/DvEOg/S7Lux1s2eiz9kM7WLTxx6wdwgToVHwiB87R
         PaySVxFS4yQLiraDKF/4DpTGeagCJ2aPQY482Vrd1jeLHd6BJQLke11tG0/E9nSRl2fB
         ZKFA==
X-Gm-Message-State: AOAM531YBouxiX2ub76DO7EosHrF4NpxFFhmReHQGjaFgG77jMrhN+MC
        D8ZRMTlcM59sZMZVeHNBy6lGLqDtasrS3A==
X-Google-Smtp-Source: ABdhPJzBdeKoBoaePz3OMNbA0g97JBOdJd1oFzPfmUPWSCTLBspHdIj+mObR61TloisPBOhyWgocdQ==
X-Received: by 2002:a1c:2ec2:: with SMTP id u185mr1267040wmu.83.1611496591302;
        Sun, 24 Jan 2021 05:56:31 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id a27sm19658409wrc.94.2021.01.24.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:30 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: msm8916: Add blsp_i2c3
Date:   Sun, 24 Jan 2021 14:54:06 +0100
Message-Id: <20210124135409.5473-3-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8916 has another I2C QUP controller that can be enabled on
GPIO 10 and 11.

Add blsp_i2c3 to msm8916.dtsi and disable it by default.

Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi      | 15 +++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index 4dc437f13fa5..7dedb91b9930 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -220,6 +220,22 @@
 		bias-disable;
 	};
 
+	i2c3_default: i2c3-default {
+		pins = "gpio10", "gpio11";
+		function = "blsp_i2c3";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	i2c3_sleep: i2c3-sleep {
+		pins = "gpio10", "gpio11";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	i2c4_default: i2c4-default {
 		pins = "gpio14", "gpio15";
 		function = "blsp_i2c4";
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 402e891a84ab..1045d7e518f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1528,6 +1528,21 @@
 			status = "disabled";
 		};
 
+		blsp_i2c3: i2c@78b7000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b7000 0x500>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c3_default>;
+			pinctrl-1 = <&i2c3_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_spi3: spi@78b7000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b7000 0x500>;
-- 
2.17.1

