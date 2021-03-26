Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E06134AAAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 15:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhCZO7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhCZO6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 10:58:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC6DC0613AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 75so8127878lfa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C5ERnmYiVSfZOvLBPHXfrcD24I8mfAAc53AvKVggtY4=;
        b=ELvzfXAW10zs5X8fa3xbIzvf2/OOQMINVOrmncAzNMtDFbRl7fS0BkkIMU2TJ5krkJ
         GUa1vJC57d4gJf3wGKQQNz1DBdFammiWUPLsgUyRh2djrQJWx0j2ig8WKx1zDo5URl5f
         cDIEZehADeV5K0RnGacupwjaiyOLRIj/b2o0NyqcSJ+ZEp8bKfBHIzBbaEMjFLYq3+4A
         lC0A49V1Wg80Flx5MLaE3WRhzaaM8EFYyuOLBq33hCSmaZV0DlEwnvq+cGxVPZpKZvMo
         A1CTzL9Xv8TO2qAVtcugxp6MmvHjiiDdbJbj4g2v+QmXfElmz5cDS8OVrHIhLze2dbLj
         Kuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C5ERnmYiVSfZOvLBPHXfrcD24I8mfAAc53AvKVggtY4=;
        b=KLg2fS3SLhBTNmDBPfe7FD9yPQyKtom1F2U5y3rU9VMpdDrE6V+ZHhVPgH0J0oD9Hq
         ytC1Y75S2tHfwBXNQYbA8iLZJkrFQV5D6ZdO+IjiCWZFUwxrsi1jxOxhfnZAAvjeMmwz
         QDoNNvCkwkcSFaJdhr6XoS4PEdiILKqLMsfTWr6ev1Jp88drpcW4FidnEXR6bJwuP5j/
         WYHxaX6bG1iPv2NC0nv08SNUcrm8TzGWC/3wRRAO7sOVHTd/Ix1nD7NphTDDBGPgKFyu
         5PlodHpfmz8beIikSycl7Ra3lVf8va9krlxV4PmMU0GnxcpzBUU2B/jQssgxeAGTHGRI
         OA0A==
X-Gm-Message-State: AOAM53045YuQLc69vnPt1HpzEtK5QFVrZflQ5X4+brpozhlFqxlUt55e
        PzekbWuCfFvrbiPij3bB0kTYow==
X-Google-Smtp-Source: ABdhPJyfHZhl+6MBBO5Xfa3bjyeWpJXK6rzvCVBVaT1AB/4nLCKxMKGf7CZi4pFkY0tVInN5VGPfeQ==
X-Received: by 2002:a19:7409:: with SMTP id v9mr566973lfe.2.1616770732312;
        Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 27f68d92;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 3/5] arm: dts: qcom: Add support for MSM8226 SoC
Date:   Fri, 26 Mar 2021 15:58:14 +0100
Message-Id: <20210326145816.9758-4-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds basic device tree support for MSM8226 SoC which belongs
to the Snapdragon 400 family. For now, this file adds the basic nodes
like gcc, pinctrl and other required configuration for booting up to
the serial console.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 152 ++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226.dtsi

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
new file mode 100644
index 0000000000..81bb19398e
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -0,0 +1,152 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8974.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "Qualcomm Technologies, Inc. MSM8226";
+	compatible = "qcom,msm8226";
+	interrupt-parent = <&intc>;
+
+	chosen { };
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x0>;
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+
+		intc: interrupt-controller@f9000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0xF9000000 0x1000>,
+			      <0xF9002000 0x1000>;
+		};
+
+		gcc: clock-controller@fc400000 {
+			compatible = "qcom,gcc-msm8226";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0xfc400000 0x4000>;
+		};
+
+		msmgpio: pinctrl@fd510000 {
+			compatible = "qcom,msm8226-pinctrl";
+			reg = <0xfd510000 0x4000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&msmgpio 0 0 117>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		blsp1_uart3: serial@f991f000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf991f000 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART3_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
+		restart@fc4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0xfc4ab000 0x4>;
+		};
+
+		rng@f9bff000 {
+			compatible = "qcom,prng";
+			reg = <0xf9bff000 0x200>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		timer@f9020000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xf9020000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@f9021000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9021000 0x1000>,
+				      <0xf9022000 0x1000>;
+			};
+
+			frame@f9023000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9023000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9024000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9024000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9025000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9025000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9026000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9026000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9027000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9027000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@f9028000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xf9028000 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 2
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1
+				(GIC_CPU_MASK_RAW(15) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <19200000>;
+	};
+};
-- 
2.25.1

