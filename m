Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844CF231DC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgG2MBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2MBG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8CEC061794;
        Wed, 29 Jul 2020 05:01:05 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p14so2490210wmg.1;
        Wed, 29 Jul 2020 05:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffWqQU26EKVHaH4j5TG8VdhwKZhWQGA8HNUdkfskr1g=;
        b=n07AGrTUY4ZeBZzgsUrEEayU6p3xaMblwE8U62fxRMRJ4OFsGX3bGqH140wFA2tjSg
         WGmfZqFZIF+V1jKynRUbH61VsDaRD09T5W085ZUjcg3IG0XeYRnqp/AYaxis0ue2jDNJ
         Fev4kbMVnFXiudzsB/YZyGIQ4kGrMsdkzqRiqVHf8F3mtYwANxON1imLOwwdR5x8Zkpb
         Coc/hpKgdZIsQriiD8GQHd/PN1ZQ9q3z33e7ixenNpAtSO7Nzx8zmbgfgwvSYybiyp5T
         SAZwBB4YZ2oLCZ/tEy5d6gA8T95SRbqE7VPHaTkt9JcUkigEILSCSzxiR+lNiafToP7j
         PGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffWqQU26EKVHaH4j5TG8VdhwKZhWQGA8HNUdkfskr1g=;
        b=ms1zGPu0SPvL9CIlokQc3dubhfb5VYup0f8F6nGnzupz14Vg5rN7d3FvW6otzC2wv2
         DLKFHcas/JLHmxhWl8c2O6lFZrcHnQju64rfVjHu1KCdxNWUmjLxi2Y0BIG/GmXS3gBn
         fk6Ic3JtVN4ljYiiNbnCtqw2xp7KzGHrUYhe8X6JKXdK5Bo4E3jQEmaSG+Qufqh4Tz23
         XP8rqcF8wsgaJXImDjilN6vW9qtIIj2t86t2HW2aPL3eH2V+shEXQJemkbWsmen905tr
         OqFdX+M5mwi82qJlN3qqfdrkrtlQDXb3EMyY72hlt+xYcEAqHLT0lY0Y9oecvbrgzX/1
         kcFg==
X-Gm-Message-State: AOAM5317FYKasvHBmptuPv91uG2fLlcYFna+9Xy3R4fcaDYQtimha1xg
        HJ+szZQcI+CrH4fjCJDiLRE=
X-Google-Smtp-Source: ABdhPJyJs58APPSBbv50xADKh7Fo4yFO/0UGQOMAMDa8fOygjorZk1B7jLL9BjNkqqfkckCS7nc4rg==
X-Received: by 2002:a1c:3285:: with SMTP id y127mr8501315wmy.104.1596024064564;
        Wed, 29 Jul 2020 05:01:04 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:03 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 01/10] arm64: dts: qcom: msm8992: Add support for SDHCI2
Date:   Wed, 29 Jul 2020 14:00:47 +0200
Message-Id: <20200729120057.35079-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will let us use SD cards on our devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 188fff2095f1..9b42ac42b171 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -269,6 +269,28 @@ sdhc_1: sdhci@f9824900 {
 			status = "disabled";
 		};
 
+		sdhc_2: sdhci@f98a4900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				<&gcc GCC_SDCC2_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
 		blsp1_uart2: serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
@@ -573,6 +595,42 @@ i2c13_sleep: i2c13-sleep {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			sdc2_clk_on: sdc2-clk-on {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <16>;
+			};
+
+			sdc2_clk_off: sdc2-clk-off {
+				pins = "sdc2_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc2_cmd_on: sdc2-cmd-on {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_cmd_off: sdc2-cmd-off {
+				pins = "sdc2_cmd";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc2_data_on: sdc2-data-on {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <10>;
+			};
+
+			sdc2_data_off: sdc2-data-off {
+				pins = "sdc2_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
 		};
 	};
 
-- 
2.27.0

