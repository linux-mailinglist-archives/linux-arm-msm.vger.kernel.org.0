Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9558E231DCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 14:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgG2MBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 08:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbgG2MBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 08:01:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017A3C0619D2;
        Wed, 29 Jul 2020 05:01:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 9so2463675wmj.5;
        Wed, 29 Jul 2020 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TF7XW+i8cbP3gIkhlhIAvvLS4ohbcx6+poBRM18scqo=;
        b=dNW3EfQCxfi7bVB1bqjW/PrHh2iBoDIiGQ9glC0S9lATe0WwlagXVgZpkFoPu4r5yu
         BCXvSQSxwlLkoFnF7b1z5hiCbZuk7KIPUQ+xNkr0UysidzdxM7fHO7Jbzmz/QwXVaS8G
         FGOKsriVvB7Iw/U/aMyC7nRwO4Bii1IB97+GLvwjyBv42tbRWFl6LcbUalTlsf664gVV
         9k7hmTpiCUXhsWBzMIcJ8KUhzrPbn4zd01tYbW/N+yceIgLjd4UOqN688UiwXduuJu6h
         u+vJNiSRt0bgmnAuUEENAyZyfrAYKQKLVsC7ygfHv495dTUGD7SJDoc2QaLKfUWznWyr
         AoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TF7XW+i8cbP3gIkhlhIAvvLS4ohbcx6+poBRM18scqo=;
        b=j39aYPgEe/vsgALPIv8giw+coG81UutUs4B4/nWbgqNjeubL+Lqav6itKpKWB2m09I
         CR9EdgrH3EZ+sWsLCbRzAXGEmd07hOYUsQBH8AaSPhL+p3ukeuO1KI5N1q1fTHxMB9Fr
         ishAOgrKumyoZivlm/ryAOklGS5Xbh1t5vBnCvoiTRsmKhzihDnXClXFbvbLpD/IF8dm
         EkT7OVkMZae3tryhpts62dXiVT6YFodvgp5vn9YVILgklhaRcxsvt9msrM4XiXJ+fyW1
         7HUlwuszJw4zqd5eeVZbcIWivgijGhBdINhpxXeR8kYmtfC01Wd9AvQcIK2KJZepd93v
         9XWQ==
X-Gm-Message-State: AOAM530VFxaDOlxGRxLgbLVwiptZuaqBztsNw6HyG9lCiyyChPCFJng+
        MhIfvNqs27gM0PnTyRznvzY=
X-Google-Smtp-Source: ABdhPJx+OYutPH7e9/IDvz+HCiS6cVZnFa/O5uDXkYICd4PPP3FHVaoU+E5IqQGySLM0Nkq/Uk9/Qw==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr8601167wmk.48.1596024066770;
        Wed, 29 Jul 2020 05:01:06 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id l67sm5426000wml.13.2020.07.29.05.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 05:01:06 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     lauren.kelly@msn.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 02/10] arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
Date:   Wed, 29 Jul 2020 14:00:48 +0200
Message-Id: <20200729120057.35079-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729120057.35079-1-konradybcio@gmail.com>
References: <20200729120057.35079-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will be required to support touchscreen on Lumia
devices.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 9b42ac42b171..c7dc81311f6a 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -304,6 +304,27 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		/*
+		 * This I2C seems to only be present on WP platforms
+		 * and is likely disabled in firmware
+		 * (hangs at least one device) on android platforms.
+		 */
+		blsp_i2c1: i2c@f9923000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0xf9923000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+						<&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c1_default>;
+			pinctrl-1 = <&i2c1_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		blsp_i2c2: i2c@f9924000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0xf9924000 0x500>;
@@ -524,6 +545,20 @@ sdc1_rclk_off: rclk-off {
 				bias-pull-down;
 			};
 
+			i2c1_default: i2c1-default {
+				function = "blsp_i2c1";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c1_sleep: i2c1-sleep {
+				function = "gpio";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			i2c2_default: i2c2-default {
 				function = "blsp_i2c2";
 				pins = "gpio6", "gpio7";
-- 
2.27.0

