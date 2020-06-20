Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4833202478
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgFTOsw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728476AbgFTOsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:50 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E751C06174E;
        Sat, 20 Jun 2020 07:48:50 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id v3so4866704wrc.1;
        Sat, 20 Jun 2020 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a2Aq2WoEc3SyzoL3m7NPl3CTgYtgUQHXBFz+wRAqCbs=;
        b=JBV/wurZmWzG4qtGhVxUM2BBhHjz/TT+QkRXvZhqAIsjIwBmU9N0rJQhW5Ubh9dfxG
         ZqiPc+QY3f5mwa2hc3OLB14NOF9QY60FYW9KW/tPs42QqYO1FWWZ/ClGhEytB1eimVbr
         NssbKXlD79X7267m7ULUSaNR1Try+daV9wYl3OWi4hu8cqXv1O7NW2W73EVMVonqrSU3
         FIBgAjfbIOGKDgll/eLXa3LGlNt/yKnr0PONILvQcssn6pJl0F+AGg5RUyQKEH1GKh1/
         d7d0uitC6+4w1sNlA3n5NvSuWkaZqmCIhF6dctmrNqyI82OOH2Hdt1/LV8VaPa2H8D3L
         gJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a2Aq2WoEc3SyzoL3m7NPl3CTgYtgUQHXBFz+wRAqCbs=;
        b=BY9GJb/uNeeEI71d5PA9yzs0P1XUN6O71Mqq963D7G1kthBlzYunaDDWaM7QIIrD0f
         Izxi3zeqypCEVdI+71fpx+9LHaw2D++ryZnduUZkNc/rPfOPmXOkLG8sDA+M60NCXT9d
         2BIOXggreV4C6Z7yvwrUf1GU2pdKKZ7P9qoVoEB0gnjaBi3FqFNvT2pSjskgLG9K0r++
         vMWD5jWETbTc+u0waLIirrToL/JGbuhL8lFuS0IQDKaHxDATtDPKQOS784aG/gcPkN9m
         fiPgPzWize0275zr/Uvw+iTn2VRs629VsTG5KHc+Yo0NTOWtQwRjqKNZbYo19ZHujOmV
         MBgA==
X-Gm-Message-State: AOAM532wmOaN06QkUz4/B3MyU1ZojIHERlRDrgdLmpJfcFtdRvGCs2Dw
        VPtgZ4npmcvOC+P7pZL2Z8c=
X-Google-Smtp-Source: ABdhPJxZeI07duiXnY1fVGWva4vTU+A1gsGMoR6OdhZPXuNzG+bS8HTt0ZfdqWEWx//TKzB/rpYz0w==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr10144276wrm.71.1592664528978;
        Sat, 20 Jun 2020 07:48:48 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:48 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/21] arm64: dts: qcom: Update msm8994 pin configuration
Date:   Sat, 20 Jun 2020 16:46:33 +0200
Message-Id: <20200620144639.335093-18-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows us to use I2C, SPI and the second UART.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi | 272 +++++++++++++++++++++
 1 file changed, 272 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
index 2e118d967f53..9fbdc46991da 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
@@ -27,4 +27,276 @@ pinconf {
 			bias-pull-down;
 		};
 	};
+
+	blsp2_uart2_default: blsp2_uart2_default {
+		pinmux {
+			function = "blsp_uart8";
+			pins = "gpio45", "gpio46";
+		};
+		pinconf {
+			pins = "gpio45", "gpio46";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp2_uart2_sleep: blsp2_uart2_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio45", "gpio46";
+		};
+		pinconf {
+			pins = "gpio45", "gpio46";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	i2c1_default: i2c1_default {
+		pinmux {
+			function = "blsp_i2c1";
+			pins = "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c1_sleep: i2c1_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio2", "gpio3";
+		};
+		pinconf {
+			pins = "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c2_default: i2c2_default {
+		pinmux {
+			function = "blsp_i2c2";
+			pins = "gpio6", "gpio7";
+		};
+		pinconf {
+			pins = "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c2_sleep: i2c2_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio6", "gpio7";
+		};
+		pinconf {
+			pins = "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c4_default: i2c4_default {
+		pinmux {
+			function = "blsp_i2c4";
+			pins = "gpio19", "gpio20";
+		};
+		pinconf {
+			pins = "gpio19", "gpio20";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c4_sleep: i2c4_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio19", "gpio20";
+		};
+		pinconf {
+			pins = "gpio19", "gpio20";
+			drive-strength = <2>;
+			bias-pull-down;
+			input-enable;
+		};
+	};
+
+	i2c5_default: i2c5_default {
+		pinmux {
+			function = "blsp_i2c5";
+			pins = "gpio23", "gpio24";
+		};
+		pinconf {
+			pins = "gpio23", "gpio24";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c5_sleep: i2c5_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio23", "gpio24";
+		};
+		pinconf {
+			pins = "gpio23", "gpio24";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c6_default: i2c6_default {
+		pinmux {
+			function = "blsp_i2c6";
+			pins = "gpio28", "gpio27";
+		};
+		pinconf {
+			pins = "gpio28", "gpio27";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	i2c6_sleep: i2c6_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio28", "gpio27";
+		};
+		pinconf {
+			pins = "gpio28", "gpio27";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_spi0_default: blsp1_spi0_default {
+		pinmux {
+			function = "blsp_spi1";
+			pins = "gpio0", "gpio1", "gpio3";
+		};
+		pinmux_cs {
+			function = "gpio";
+			pins = "gpio8";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio3";
+			drive-strength = <10>;
+			bias-pull-down;
+		};
+		pinconf_cs {
+			pins = "gpio8";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_spi0_sleep: blsp1_spi0_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio0", "gpio1", "gpio3";
+		};
+		pinconf {
+			pins = "gpio0", "gpio1", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pmx_sdc1_clk {
+		sdc1_clk_on: clk-on {
+			pinmux {
+				pins = "sdc1_clk";
+			};
+			pinconf {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <16>;
+			};
+		};
+
+		sdc1_clk_off: clk-off {
+			pinmux {
+				pins = "sdc1_clk";
+			};
+			pinconf {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+		};
+	};
+
+	pmx_sdc1_cmd {
+		sdc1_cmd_on: cmd-on {
+			pinmux {
+				pins = "sdc1_cmd";
+			};
+			pinconf {
+				pins = "sdc1_cmd";
+				bias-pull-up;
+				drive-strength = <8>;
+			};
+		};
+
+		sdc1_cmd_off: cmd-off {
+			pinmux {
+				pins = "sdc1_cmd";
+			};
+			pinconf {
+				pins = "sdc1_cmd";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+		};
+	};
+
+	pmx_sdc1_data {
+		sdc1_data_on: data-on {
+			pinmux {
+				pins = "sdc1_data";
+			};
+			pinconf {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <8>;
+			};
+		};
+
+		sdc1_data_off: data-off {
+			pinmux {
+				pins = "sdc1_data";
+			};
+			pinconf {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+		};
+	};
+
+	pmx_sdc1_rclk {
+		sdc1_rclk_on: rclk-on {
+			pinmux {
+				pins = "sdc1_rclk";
+			};
+			pinconf {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
+		};
+
+		sdc1_rclk_off: rclk-off {
+			pinmux {
+				pins = "sdc1_rclk";
+			};
+			pinconf {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
+		};
+	};
 };
-- 
2.27.0

