Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D5DDDF10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 17:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfJTPIL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 11:08:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53803 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfJTPIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 11:08:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so10580188wmd.3;
        Sun, 20 Oct 2019 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uj3t3a086E+ahjHidk0EDYDz9KPcp+Uigu5w9K2w4aw=;
        b=tJUZqW8WfTq6PhPB803xCOfZvI6tnNGKPTOyQUoVjb20v8jAo2ym64L8vnHBp1qQhA
         ySh/LS4sxMbpmF7cASqtcwRGPJK8JV0xGlBxeoJZZ9R4R9bBzjmICegSPkE9Y5R0EgPj
         CVrLg1zPhOUrv5tP9wqfz2SS8kSSQ2XTjyC5lHBghyyPswc7yzAPtpzubKWQbNhamjf2
         A5u5GN/mcbozD/TdhUJZeFG7ONUVVVaRQtUjg6s0U6GT9P0gaaYp1SRpR64IywRdci3J
         0ktJL5D6/tqZ0fAHCwP0Xot82hABfhxg/5O8PypciTEJNmRAvAV8xGITY9tm3TmjB7O6
         1OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uj3t3a086E+ahjHidk0EDYDz9KPcp+Uigu5w9K2w4aw=;
        b=L5y9MR3sL2cCLbZW8keTBxscdVAORkhBr7rxABKHoaw1SXVpvrcFtQeZ5xwzMpRKYx
         7MGf5anYmvTr+x2qA6cx/CyFJ2ZOP7GL4N7R5xI9pSMCB2mjtuW3u6UHD8z0MLS11Uxp
         eKrswQiVBcIMzFLy+f0i4XcTf5LmdAtJNJ96JwI7VnDi+X6/R2S+uyna26k5SpGB5jpp
         El3erqE+GcxWNEcCf8WgkySAqVIVZEGkHzM1VVkaYGTlsHoMXfPfWkfKIWj2hG5P2sGV
         iFfoOF4F/HFQjQH/ZvX6NokA4nhp0Yet+AUxKlOvvk8ETWwQFSWs+1K1fjD7CRurkyAC
         s1ug==
X-Gm-Message-State: APjAAAU/FxkUkUk+XPxTnb10kEAS7Rp1H6OuthdCsAa6pumglJ1nWNF8
        2a4mefeHBnLbPpYp3qJYFpxti8/b3CGQWQ==
X-Google-Smtp-Source: APXvYqwnQ/SnysK5FVVnt2cpJ1zMPmIpAD7EtFBviOGjeLaRbvgeypVk8DX64mb3xCe2Ddf6ffW88A==
X-Received: by 2002:a1c:d0:: with SMTP id 199mr16209774wma.67.1571584082416;
        Sun, 20 Oct 2019 08:08:02 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id z9sm11921172wrv.1.2019.10.20.08.08.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 08:08:01 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, ccross@android.com,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, marijns95@gmail.com, kholk11@gmail.com
Subject: [PATCH 4/5] arm64: dts: qcom: Add MSM8976 SoC support dts files
Date:   Sun, 20 Oct 2019 17:07:45 +0200
Message-Id: <20191020150746.64114-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191020150746.64114-1-kholk11@gmail.com>
References: <20191020150746.64114-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

These are the DTs to support the MSM8976 SoC and, with very small
overrides in future ones, also MSM8956 and their APQ variants.

This configuration includes firmware, cpu, psci, idle states,
clocks, smem, rpm and power domains, i2c, spi, thermal sensors,
smsm, smp2p, sdhci, spmi, iommus, gpu, mdss/mdp, hexagon.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976-pins.dtsi | 2119 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi      | 1714 ++++++++++++++++
 2 files changed, 3833 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
new file mode 100644
index 000000000000..1abeba8b8d18
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8976-pins.dtsi
@@ -0,0 +1,2119 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+&tlmm {
+	cdc_reset_ctrl {
+		cdc_reset_line_sus: cdc_reset_sleep {
+			mux {
+				pins = "gpio133";
+				function = "gpio";
+			};
+			config {
+				pins = "gpio133";
+				drive-strength = <16>;
+				bias-disable;
+				output-low;
+			};
+		};
+		cdc_reset_line_act:cdc_reset_active {
+			mux {
+				pins = "gpio133";
+				function = "gpio";
+			};
+			config {
+				pins = "gpio133";
+				drive-strength = <16>;
+				bias-disable;
+				output-high;
+			};
+		};
+	};
+
+	cdc-pdm-lines {
+		cdc_pdm_lines_act: pdm_lines_on {
+			mux {
+				pins = "gpio120", "gpio121";
+				function = "cdc_pdm0";
+			};
+
+			config {
+				pins = "gpio120", "gpio121";
+				drive-strength = <8>;
+			};
+		};
+		cdc_pdm_lines_sus: pdm_lines_off {
+			mux {
+				pins = "gpio120", "gpio121";
+				function = "cdc_pdm0";
+			};
+
+			config {
+				pins = "gpio120", "gpio121";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
+
+	cdc-pdm-2-lines {
+		cdc_pdm_lines_2_act: pdm_lines_2_on {
+			mux {
+				pins = "gpio116", "gpio117",
+				       "gpio118", "gpio119";
+				function = "cdc_pdm0";
+			};
+
+			config {
+				pins = "gpio116", "gpio117",
+				       "gpio118", "gpio119";
+				drive-strength = <8>;
+			};
+		};
+
+		cdc_pdm_lines_2_sus: pdm_lines_2_off {
+			mux {
+				pins = "gpio116", "gpio117",
+				       "gpio118", "gpio119";
+				function = "cdc_pdm0";
+			};
+
+			config {
+				pins = "gpio116", "gpio117",
+				       "gpio118", "gpio119";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
+
+	hsuart_active: default {
+		mux {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "blsp_uart1";
+		};
+
+		config {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	hsuart_sleep: sleep {
+		mux {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_active: blsp1_uart2_active {
+		mux {
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			function = "blsp_uart2";
+		};
+
+		config {
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	blsp1_uart2_sleep: blsp1_uart2_sleep {
+		mux {
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	sdhc2_cd_pin {
+		sdc2_cd_on: cd_on {
+			mux {
+				pins = "gpio100";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio100";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+
+		sdc2_cd_off: cd_off {
+			mux {
+				pins = "gpio100";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio100";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
+
+	usb_c_intn_pin: usb_c_intn_pin {
+		mux {
+			pins = "gpio101", "gpio102";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio101", "gpio102";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	trigout_b0: trigout_b0 {
+		mux {
+			pins = "gpio22";
+			function  = "qdss_cti_trig_out_b0";
+		};
+
+		config {
+			pins = "gpio22";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	pmx_sdc1_clk {
+		sdc1_clk_on: sdc1_clk_on {
+			config {
+				pins = "sdc1_clk";
+				bias-disable; /* NO pull */
+				drive-strength = <16>; /* 16 MA */
+			};
+
+		};
+
+		sdc1_clk_off: sdc1_clk_off {
+			config {
+				pins = "sdc1_clk";
+				bias-disable; /* NO pull */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc1_cmd {
+		sdc1_cmd_on: sdc1_cmd_on {
+			config {
+				pins = "sdc1_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc1_cmd_off: sdc1_cmd_off {
+			config {
+				pins = "sdc1_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc1_data {
+		sdc1_data_on: sdc1_data_on {
+			config {
+				pins = "sdc1_data";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc1_data_off: sdc1_data_off {
+			config {
+				pins = "sdc1_data";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc1_rclk {
+		sdc1_rclk_on: sdc1_rclk_on {
+			config {
+				pins = "sdc1_rclk";
+				bias-pull-down; /* pull down */
+			};
+		};
+
+		sdc1_rclk_off: sdc1_rclk_off {
+			config {
+				pins = "sdc1_rclk";
+				bias-pull-down; /* pull down */
+			};
+		};
+	};
+
+	pmx_sdc2_clk {
+		sdc2_clk_on: sdc2_clk_on {
+			config {
+				pins = "sdc2_clk";
+				drive-strength = <16>; /* 16 MA */
+				bias-disable; /* NO pull */
+			};
+		};
+
+		sdc2_clk_off: sdc2_clk_off {
+			config {
+				pins = "sdc2_clk";
+				bias-disable; /* NO pull */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc2_cmd {
+		sdc2_cmd_on: sdc2_cmd_on {
+			config {
+				pins = "sdc2_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc2_cmd_off: sdc2_cmd_off {
+			config {
+				pins = "sdc2_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc2_data {
+		sdc2_data_on: sdc2_data_on {
+			config {
+				pins = "sdc2_data";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc2_data_off: sdc2_data_off {
+			config {
+				pins = "sdc2_data";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc3_clk {
+		sdc3_clk_on: sdc3_clk_on {
+			mux {
+				pins = "gpio44";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio44";
+				bias-disable; /* NO pull */
+				drive-strength = <16>; /* 16 MA */
+			};
+		};
+
+		sdc3_clk_off: sdc3_clk_off {
+			mux {
+				pins = "gpio44";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio44";
+				bias-disable; /* NO pull */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc3_cmd {
+		sdc3_cmd_on: sdc3_cmd_on {
+			mux {
+				pins = "gpio43";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio43";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc3_cmd_off: sdc3_cmd_off {
+			mux {
+				pins = "gpio43";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio43";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_sdc3_data {
+		sdc3_dat_on: sdc3_data_on {
+			mux {
+				pins = "gpio39", "gpio40",
+					"gpio41", "gpio42";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio39", "gpio40",
+					"gpio41", "gpio42";
+				bias-pull-up; /* pull up */
+				drive-strength = <10>; /* 10 MA */
+			};
+		};
+
+		sdc3_dat_off: sdc3_data_off {
+			mux {
+				pins = "gpio39", "gpio40",
+					"gpio41", "gpio42";
+				function = "sdc3";
+			};
+			config {
+				pins = "gpio39", "gpio40",
+					"gpio41", "gpio42";
+				bias-pull-up; /* pull up */
+				drive-strength = <2>; /* 2 MA */
+			};
+		};
+	};
+
+	pmx_mdss: pmx_mdss {
+		mdss_dsi_active: mdss_dsi_active {
+			mux {
+				function = "gpio";
+			};
+
+			config {
+				drive-strength = <8>; /* 8 mA */
+				bias-disable = <0>; /* no pull */
+				output-high;
+			};
+		};
+
+		mdss_dsi_suspend: mdss_dsi_suspend {
+			mux {
+				function = "gpio";
+			};
+
+			config {
+				drive-strength = <2>; /* 2 mA */
+				bias-pull-down; /* pull down */
+				output-low;
+			};
+		};
+	};
+
+	pmx_mdss_te: pmx_mdss_te {
+		mdss_te_active: active {
+			mux {
+				pins = "gpio24";
+				function = "mdp_vsync";
+			};
+			config {
+				pins = "gpio24";
+				drive-strength = <2>; /* 2 mA */
+				bias-pull-down; /* pull down */
+			};
+		};
+
+		mdss_te_suspend: suspend {
+			mux {
+				pins = "gpio24";
+				function = "mdp_vsync";
+			};
+			config {
+				pins = "gpio24";
+				drive-strength = <2>; /* 2 mA */
+				bias-pull-down; /* pull down */
+			};
+		};
+	};
+
+	spi0 {
+		spi0_default: spi0_default {
+			/* active state */
+			mux {
+				/* MOSI, MISO, CLK */
+				pins = "gpio0", "gpio1", "gpio3";
+				function = "blsp_spi1";
+			};
+
+			config {
+				pins = "gpio0", "gpio1", "gpio3";
+				drive-strength = <12>; /* 12 MA */
+				bias-disable = <0>; /* No PULL */
+			};
+		};
+
+
+		spi0_sleep: spi0_sleep {
+			/* suspended state */
+			mux {
+				/* MOSI, MISO, CLK */
+				pins = "gpio0", "gpio1", "gpio3";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio0", "gpio1", "gpio3";
+				drive-strength = <2>; /* 2 MA */
+				bias-pull-down; /* PULL Down */
+			};
+		};
+
+		spi0_cs0_active: cs0_active {
+			/* CS */
+			mux {
+				pins = "gpio2";
+				function = "blsp_spi1";
+			};
+
+			config {
+				pins = "gpio2";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+
+		spi0_cs0_sleep: cs0_sleep {
+			/* CS */
+			mux {
+				pins = "gpio2";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio2";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+	};
+
+	/* cci */
+	cci {
+		cci0_active: cci0_active {
+			/* cci0 active state */
+			mux {
+				/* CLK, DATA */
+				pins = "gpio29", "gpio30";
+				function = "cci0_i2c";
+			};
+
+			config {
+				pins = "gpio29", "gpio30";
+				drive-strength = <2>; /* 2 MA */
+				bias-disable; /* No PULL */
+			};
+		};
+
+		cci0_suspend: cci0_suspend {
+			/* cci0 suspended state */
+			mux {
+				/* CLK, DATA */
+				pins = "gpio29", "gpio30";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio29", "gpio30";
+				drive-strength = <2>; /* 2 MA */
+				bias-disable; /* No PULL */
+			};
+		};
+
+		cci1_active: cci1_active {
+			/* cci1 active state */
+			mux {
+				/* CLK, DATA */
+				pins = "gpio104", "gpio103";
+				function = "cci1_i2c";
+			};
+
+			config {
+				pins = "gpio104", "gpio103";
+				drive-strength = <2>; /* 2 MA */
+				bias-disable; /* No PULL */
+			};
+		};
+
+		cci1_suspend: cci1_suspend {
+			/* cci1 suspended state */
+			mux {
+				/* CLK, DATA */
+				pins = "gpio104", "gpio103";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio104", "gpio103";
+				drive-strength = <2>; /* 2 MA */
+				bias-disable; /* No PULL */
+			};
+		};
+	};
+
+	i2c2 {
+		i2c2_default: i2c2_default {
+			/* active state */
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+			};
+
+			config {
+				pins = "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+
+		i2c2_sleep: i2c2_sleep {
+			/* suspended state */
+			mux {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+	};
+
+	i2c4 {
+		i2c4_default: i2c4_default {
+			/* active state */
+			mux {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+			};
+
+			config {
+				pins = "gpio14", "gpio15";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+
+		i2c4_sleep: i2c4_sleep {
+			/* suspended state */
+			mux {
+				pins = "gpio14", "gpio15";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio14", "gpio15";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+	};
+
+	i2c6 {
+		i2c6_default: i2c6_default {
+			/* active state */
+			mux {
+				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
+			};
+
+			config {
+				pins = "gpio22", "gpio23";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+
+		i2c6_sleep: i2c6_sleep {
+			/* suspended state */
+			mux {
+				pins = "gpio22", "gpio23";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio22", "gpio23";
+				drive-strength = <2>;
+				bias-disable = <0>;
+			};
+		};
+	};
+
+	i2c8 {
+		i2c8_default: i2c8_default {
+			/* active state */
+			mux {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c8";
+			};
+
+			config {
+				pins = "gpio18", "gpio19";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		i2c8_sleep: i2c8_sleep {
+			/* suspended state */
+			mux {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio18", "gpio19";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+	};
+
+	/*sensors */
+	cam_sensor_mclk0_default: cam_sensor_mclk0_default {
+		/* MCLK0 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio26";
+			function = "cam_mclk";
+		};
+
+		config {
+			pins = "gpio26";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_mclk0_sleep: cam_sensor_mclk0_sleep {
+		/* MCLK0 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio26";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio26";
+			bias-pull-down; /* PULL DOWN */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_rear_default: cam_sensor_rear_default {
+		/* RESET, STANDBY */
+		mux {
+			pins = "gpio129", "gpio35";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio129", "gpio35";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_rear_vana: cam_sensor_rear_vana {
+		/* VDIG */
+		mux {
+			pins = "gpio63";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio63";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_rear_vana_sleep: cam_sensor_rear_vana_sleep {
+		/* VDIG */
+		mux {
+			pins = "gpio63";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio63";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_mclk1_default: cam_sensor_mclk1_default {
+		/* MCLK1 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio27";
+			function = "cam_mclk";
+		};
+
+		config {
+			pins = "gpio27";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_mclk1_sleep: cam_sensor_mclk1_sleep {
+		/* MCLK1 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio27";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio27";
+			bias-pull-down; /* PULL DOWN */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front_default: cam_sensor_front_default {
+		/* RESET, STANDBY */
+		mux {
+			pins = "gpio130", "gpio36";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio130", "gpio36";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front_sleep: cam_sensor_front_sleep {
+		/* RESET, STANDBY */
+		mux {
+			pins = "gpio130", "gpio36";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio130", "gpio36";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front_vdig: cam_sensor_front_vdig {
+		/* VDIG */
+		mux {
+			pins = "gpio105";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio105";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front_vdig_sleep: cam_sensor_front_vdig_sleep {
+		/* VDIG */
+		mux {
+			pins = "gpio105";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio105";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_mclk2_default: cam_sensor_mclk2_default {
+		/* MCLK2 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio28";
+			function = "cam_mclk";
+		};
+
+		config {
+			pins = "gpio28";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_mclk2_sleep: cam_sensor_mclk2_sleep {
+		/* MCLK2 */
+		mux {
+			/* CLK, DATA */
+			pins = "gpio28";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio28";
+			bias-pull-down; /* PULL DOWN */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front1_default: cam_sensor_front1_default {
+		/* RESET, STANDBY */
+		mux {
+			pins = "gpio131", "gpio38";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio131", "gpio38";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	cam_sensor_front1_sleep: cam_sensor_front1_sleep {
+		/* RESET, STANDBY */
+		mux {
+			pins = "gpio131", "gpio38";
+			function = "gpio";
+		};
+
+		config {
+			pins = "gpio131", "gpio38";
+			bias-disable; /* No PULL */
+			drive-strength = <2>; /* 2 MA */
+		};
+	};
+
+	/* add pingrp for touchscreen */
+	pmx_ts_int_active {
+		ts_int_active: ts_int_active {
+			mux {
+				pins = "gpio65";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio65";
+				drive-strength = <8>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	pmx_ts_int_suspend {
+		ts_int_suspend: ts_int_suspend {
+			mux {
+				pins = "gpio65";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio65";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	pmx_ts_reset_active {
+		ts_reset_active: ts_reset_active {
+			mux {
+				pins = "gpio64";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio64";
+				drive-strength = <8>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	pmx_ts_reset_suspend {
+		ts_reset_suspend: ts_reset_suspend {
+			mux {
+				pins = "gpio64";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio64";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	pmx_ts_release {
+		ts_release: ts_release {
+			mux {
+				pins = "gpio65", "gpio64";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio65", "gpio64";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	tlmm_gpio_key {
+		gpio_key_active: gpio_key_active {
+			mux {
+				pins = "gpio113", "gpio114", "gpio115";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio113", "gpio114", "gpio115";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+
+		gpio_key_suspend: gpio_key_suspend {
+			mux {
+				pins = "gpio113", "gpio114", "gpio115";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio113", "gpio114", "gpio115";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	pmx_qdsd_clk {
+		qdsd_clk_sdcard: clk_sdcard {
+			config {
+				pins = "qdsd_clk";
+				bias-disable;/* NO pull */
+				drive-strength = <7>; /* 7 MA */
+			};
+		};
+		qdsd_clk_trace: clk_trace {
+			config {
+				pins = "qdsd_clk";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_clk_swdtrc: clk_swdtrc {
+			config {
+				pins = "qdsd_clk";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_clk_spmi: clk_spmi {
+			config {
+				pins = "qdsd_clk";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_cmd {
+		qdsd_cmd_sdcard: cmd_sdcard {
+			config {
+				pins = "qdsd_cmd";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_cmd_trace: cmd_trace {
+			config {
+				pins = "qdsd_cmd";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_cmd_swduart: cmd_uart {
+			config {
+				pins = "qdsd_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_cmd_swdtrc: cmd_swdtrc {
+			config {
+				pins = "qdsd_cmd";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_cmd_jtag: cmd_jtag {
+			config {
+				pins = "qdsd_cmd";
+				bias-disable; /* NO pull */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_cmd_spmi: cmd_spmi {
+			config {
+				pins = "qdsd_cmd";
+				bias-pull-down; /* pull down */
+				drive-strength = <4>; /* 4 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data0 {
+		qdsd_data0_sdcard: data0_sdcard {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data0_trace: data0_trace {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data0_swduart: data0_uart {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data0_swdtrc: data0_swdtrc {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data0_jtag: data0_jtag {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data0_spmi: data0_spmi {
+			config {
+				pins = "qdsd_data0";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data1 {
+		qdsd_data1_sdcard: data1_sdcard {
+			config {
+				pins = "qdsd_data1";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data1_trace: data1_trace {
+			config {
+				pins = "qdsd_data1";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data1_swduart: data1_uart {
+			config {
+				pins = "qdsd_data1";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data1_swdtrc: data1_swdtrc {
+			config {
+				pins = "qdsd_data1";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data1_jtag: data1_jtag {
+			config {
+				pins = "qdsd_data1";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data2 {
+		qdsd_data2_sdcard: data2_sdcard {
+			config {
+				pins = "qdsd_data2";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data2_trace: data2_trace {
+			config {
+				pins = "qdsd_data2";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data2_swduart: data2_uart {
+			config {
+				pins = "qdsd_data2";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data2_swdtrc: data2_swdtrc {
+			config {
+				pins = "qdsd_data2";
+				bias-pull-down; /* pull down */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data2_jtag: data2_jtag {
+			config {
+				pins = "qdsd_data2";
+				bias-pull-up; /* pull up */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data3 {
+		qdsd_data3_sdcard: data3_sdcard {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data3_trace: data3_trace {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data3_swduart: data3_uart {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data3_swdtrc: data3_swdtrc {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data3_jtag: data3_jtag {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data3_spmi: data3_spmi {
+			config {
+				pins = "qdsd_data3";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data4 {
+		qdsd_data4_sdcard: data4_sdcard {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data4_trace: data4_trace {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data4_swduart: data4_uart {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data4_swdtrc: data4_swdtrc {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data4_jtag: data4_jtag {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data4_spmi: data4_spmi {
+			config {
+				pins = "qdsd_data4";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+	};
+
+	pmx_qdsd_data5 {
+		qdsd_data5_sdcard: data5_sdcard {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data5_trace: data5_trace {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+		qdsd_data5_swduart: data5_uart {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data5_swdtrc: data5_swdtrc {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data5_jtag: data5_jtag {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-up; /* pull up */
+				drive-strength = <0>; /* 0 MA */
+			};
+		};
+		qdsd_data5_spmi: data5_spmi {
+			config {
+				pins = "qdsd_data5";
+				bias-pull-down; /* pull down */
+				drive-strength = <3>; /* 3 MA */
+			};
+		};
+	};
+
+
+	/* CoreSight */
+	seta_1: seta1 {
+		mux {
+			pins = "gpio8";
+			function = "qdss_traceclk_a";
+		};
+		config {
+			pins = "gpio8";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_2: seta2 {
+		mux {
+			pins = "gpio9";
+			function = "qdss_tracectl_a";
+		};
+		config {
+			pins = "gpio9";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_3: seta3 {
+		mux {
+			pins = "gpio10";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio10";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_4: seta4 {
+		mux {
+			pins = "gpio39";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio39";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_5: seta5 {
+		mux {
+			pins = "gpio40";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio40";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_6: seta6 {
+		mux {
+			pins = "gpio41";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio41";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_7: seta7 {
+		mux {
+			pins = "gpio42";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio42";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_8: seta8 {
+		mux {
+			pins = "gpio43";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio43";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_9: seta9 {
+		mux {
+			pins = "gpio45";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio45";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_10: seta10 {
+		mux {
+			pins = "gpio46";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio46";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_11: seta11 {
+		mux {
+			pins = "gpio47";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio47";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_12: seta12 {
+		mux {
+			pins = "gpio48";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio48";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_13: seta13 {
+		mux {
+			pins = "gpio62";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio62";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_14: seta14 {
+		mux {
+			pins = "gpio69";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio69";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_15: seta15 {
+		mux {
+			pins = "gpio120";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio120";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_16: seta16 {
+		mux {
+			pins = "gpio121";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio121";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_17: seta17 {
+		mux {
+			pins = "gpio130";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio130";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	seta_18: seta18 {
+		mux {
+			pins = "gpio131";
+			function = "qdss_tracedata_a";
+		};
+		config {
+			pins = "gpio131";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_1: setb1 {
+		mux {
+			pins = "gpio4";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio4";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_2: setb2 {
+		mux {
+			pins = "gpio5";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio5";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_3: setb3 {
+		mux {
+			pins = "gpio26";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio26";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_4: setb4 {
+		mux {
+			pins = "gpio27";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio27";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_5: setb5 {
+		mux {
+			pins = "gpio28";
+			function = "qdss_tracectl_b";
+		};
+		config {
+			pins = "gpio28";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_6: setb6 {
+		mux {
+			pins = "gpio29";
+			function = "qdss_traceclk_b";
+		};
+		config {
+			pins = "gpio29";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_7: setb7 {
+		mux {
+			pins = "gpio30";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio30";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_8: setb8 {
+		mux {
+			pins = "gpio31";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio31";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_9: setb9 {
+		mux {
+			pins = "gpio33";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio33";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_10: setb10 {
+		mux {
+			pins = "gpio34";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio34";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_11: setb11 {
+		mux {
+			pins = "gpio35";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio35";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_12: setb12 {
+		mux {
+			pins = "gpio36";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio36";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_13: setb13 {
+		mux {
+			pins = "gpio37";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio37";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_14: setb14 {
+		mux {
+			pins = "gpio38";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio38";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_15: setb15 {
+		mux {
+			pins = "gpio116";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio116";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_16: setb16 {
+		mux {
+			pins = "gpio126";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio126";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_17: setb17 {
+		mux {
+			pins = "gpio128";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio128";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	setb_18: setb18 {
+		mux {
+			pins = "gpio129";
+			function = "qdss_tracedata_b";
+		};
+		config {
+			pins = "gpio129";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	cross-conn-det {
+		cross_conn_det_act: lines_on {
+			mux {
+				pins = "gpio144";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio144";
+				drive-strength = <8>;
+				output-low;
+				bias-pull-down;
+			};
+		};
+
+		cross_conn_det_sus: lines_off {
+			mux {
+				pins = "gpio144";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio144";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	wsa_spkr_sd: spkr_lines {
+		mux {
+			pins = "gpio132";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio132";
+			drive-strength = <2>;
+			output-high;
+			bias-pull-down;
+		};
+	};
+
+	wsa_spkr_sd_act: spkr_lines_on {
+		mux {
+			pins = "gpio132";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio132";
+			drive-strength = <2>;
+			output-high;
+			bias-pull-down;
+		};
+	};
+
+	wsa_spkr_sd_sus: spkr_lines_off {
+		mux {
+			pins = "gpio132";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio132";
+			drive-strength = <2>;
+			output-low;
+			bias-disable;
+		};
+	};
+
+	/* WSA CLK */
+	wsa_clk {
+		wsa_clk_on: wsa_clk_on {
+			mux {
+				pins = "gpio62";
+				function = "pri_mi2s_mclk_a";
+			};
+
+			config {
+				pins = "gpio62";
+				drive-strength = <8>; /* 8 MA */
+				output-high;
+			};
+		};
+
+		wsa_clk_off: wsa_clk_off {
+			mux {
+				pins = "gpio62";
+				function = "pri_mi2s_mclk_a";
+			};
+
+			config {
+				pins = "gpio62";
+				drive-strength = <2>; /* 2 MA */
+				output-low;
+				bias-pull-down;
+			};
+		};
+	};
+
+	/* WSA VI sense */
+	wsa-vi {
+		wsa_vi_on: wsa_vi_on {
+			mux {
+				pins = "gpio108", "gpio109";
+				function = "wsa_io";
+			};
+
+			config {
+				pins = "gpio108", "gpio109";
+				drive-strength = <8>; /* 8 MA */
+				bias-disable; /* NO pull */
+			};
+		};
+
+		wsa_vi_sus: wsa_vi_off {
+			mux {
+				pins = "gpio108", "gpio109";
+				function = "wsa_io";
+			};
+
+			config {
+				pins = "gpio108", "gpio109";
+				drive-strength = <2>; /* 2 MA */
+				bias-pull-down;
+			};
+		};
+	};
+
+	pri-tlmm-lines {
+		pri_tlmm_lines_act: pri_tlmm_lines_act {
+			mux {
+				pins = "gpio123", "gpio124",
+				       "gpio125", "gpio127";
+				function = "pri_mi2s";
+			};
+
+			config {
+				pins = "gpio123", "gpio124",
+				       "gpio125", "gpio127";
+				drive-strength = <8>;
+			};
+		};
+
+		pri_tlmm_lines_sus: pri_tlmm_lines_sus {
+			mux {
+				pins = "gpio123", "gpio124",
+				       "gpio125", "gpio127";
+				function = "pri_mi2s";
+			};
+
+			config {
+				pins = "gpio123", "gpio124",
+				       "gpio125", "gpio127";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
+	};
+
+	wcnss_pmux_5wire {
+		/* Active configuration of bus pins */
+		wcnss_default: wcnss_default {
+			wcss_wlan2 {
+				pins = "gpio40";
+				function = "wcss_wlan2";
+			};
+			wcss_wlan1 {
+				pins = "gpio41";
+				function = "wcss_wlan1";
+			};
+			wcss_wlan0 {
+				pins = "gpio42";
+				function = "wcss_wlan0";
+			};
+			wcss_wlan {
+				pins = "gpio43", "gpio44";
+				function = "wcss_wlan";
+			};
+
+			config {
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43",
+				       "gpio44";
+				drive-strength = <6>; /* 6 MA */
+				bias-pull-up; /* PULL UP */
+			};
+		};
+
+		wcnss_sleep: wcnss_sleep {
+			wcss_wlan2 {
+				pins = "gpio40";
+				function = "wcss_wlan2";
+			};
+			wcss_wlan1 {
+				pins = "gpio41";
+				function = "wcss_wlan1";
+			};
+			wcss_wlan0 {
+				pins = "gpio42";
+				function = "wcss_wlan0";
+			};
+			wcss_wlan {
+				pins = "gpio43", "gpio44";
+				function = "wcss_wlan";
+			};
+
+			config {
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43",
+				       "gpio44";
+				drive-strength = <2>; /* 2 MA */
+				bias-pull-down; /* PULL Down */
+			};
+		};
+	};
+	wcnss_pmux_gpio: wcnss_pmux_gpio {
+		wcnss_gpio_default: wcnss_gpio_default {
+			/* Active configuration of bus pins */
+			mux {
+				/* Uses general purpose pins */
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43",
+				       "gpio44";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio40", "gpio41",
+				       "gpio42", "gpio43",
+				       "gpio44";
+				drive-strength = <6>; /* 6 MA */
+				bias-pull-up; /* PULL UP */
+			};
+		};
+	};
+
+	pmx_adv7533_int: pmx_adv7533_int {
+		adv7533_int_active: adv7533_int_active {
+			mux {
+				pins = "gpio65";
+				function = "gpio";
+			};
+			config {
+				drive-strength = <16>;
+				bias-disable;
+			};
+		};
+
+		adv7533_int_suspend: adv7533_int_suspend {
+			mux {
+				pins = "gpio65";
+				function = "gpio";
+			};
+			config {
+				drive-strength = <16>;
+				bias-disable;
+			};
+		};
+
+	};
+
+	pmx_adv7533_hpd_int: pmx_adv7533_hpd_int {
+		adv7533_hpd_int_active: adv7533_hpd_int_active {
+			config {
+				drive-strength = <16>;
+				bias-disable;
+			};
+		};
+
+		adv7533_hpd_int_suspend: adv7533_hpd_int_suspend {
+			config {
+				drive-strength = <16>;
+				bias-disable;
+			};
+		};
+
+	};
+
+	pmx_rd_nfc_int {
+		nfc_int_active: active {
+			mux {
+				pins = "gpio21";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio21";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+		};
+
+		nfc_int_suspend: suspend {
+			mux {
+				pins = "gpio21";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio21";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+		};
+	};
+
+	pmx_nfc_reset {
+		nfc_disable_active: active {
+			mux {
+				pins = "gpio20";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio20";
+				drive-strength = <6>;
+				bias-pull-up;
+			};
+		};
+
+		nfc_disable_suspend: suspend {
+			mux {
+				pins = "gpio20";
+				function = "gpio";
+			};
+
+			config {
+				pins = "gpio20";
+				drive-strength = <6>;
+				bias-disable;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
new file mode 100644
index 000000000000..d0a66ce15eb6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -0,0 +1,1714 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-msm8976.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	qcom,msm-id = <278 0x10001>; /* MSM8976 */
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		sdhc1 = &sdhc_1; /* SDC1 eMMC slot */
+		sdhc2 = &sdhc_2; /* SDC2 SD card slot */
+		sdhc3 = &sdhc_3; /* SDC3 SDIO card slot */
+		i2c2  = &blsp_i2c2;
+		i2c4  = &blsp_i2c4;
+		i2c6  = &blsp_i2c6;
+		i2c8  = &blsp_i2c8;
+		spi0  = &blsp1_spi0;
+	};
+
+	chosen { };
+
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		cont_splash_mem: memory@83000000 {
+			reg = <0x0 0x83000000 0x0 0x2800000>;
+		};
+
+		ext-region@85b00000 {
+			reg = <0x0 0x85b00000 0x0 0x500000>;
+			no-map;
+		};
+
+		msm_imem: memory@86000000 {
+			reg = <0x0 0x86000000 0x0 0x300000>;
+			no-map;
+		};
+
+		smem_mem: memory@86300000 {
+			reg = <0x0 0x86300000 0x0 0x100000>;
+			no-map;
+		};
+
+		reserved@86400000 {
+			reg = <0x0 0x86400000 0x0 0x800000>;
+			no-map;
+		};
+
+		mpss_mem: memory@86c00000 {
+			reg = <0x0 0x86c00000 0x0 0x5600000>;
+			no-map;
+		};
+
+		lpass_mem: memory@8c200000 {
+			reg = <0x0 0x8c200000 0x0 0x1800000>;
+			no-map;
+		};
+
+		venus_mem: memory@8da00000 {
+			reg = <0x0 0x8DA00000 0x0 0x2600000>;
+			no-map;
+		};
+
+		tz_apps: memory@8dd00000 {
+			reg = <0x0 0x8dd00000 0x0 0x1400000>;
+			no-map;
+		};
+
+		rmtfs_mem: memory@dc400000 {
+			compatible = "qcom,rmtfs-mem";
+
+			size = <0x0 0x200000>;
+			alloc-ranges = <0x0 0xdc400000 0x0 0x2000000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L2_0: l2-cache {
+				compatible = "arm,arch-cache";
+				cache-level = <2>;
+			};
+			L1_I_0: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_0: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x1>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_1: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_1: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x2>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_2: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_2: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x3>;
+			enable-method = "psci";
+			cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
+			capacity-dmips-mhz = <1024>;
+			next-level-cache = <&L2_0>;
+			#cooling-cells = <2>;
+			L1_I_3: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_3: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x100>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L2_1: l2-cache {
+				compatible = "arm,arch-cache";
+				cache-level = <2>;
+			};
+			L1_I_100: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_100: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x101>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_101: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_101: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x102>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_102: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_102: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		CPU7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x103>;
+			enable-method = "psci";
+			cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
+			capacity-dmips-mhz = <1830>;
+			next-level-cache = <&L2_1>;
+			#cooling-cells = <2>;
+			L1_I_103: l1-icache {
+				compatible = "arm,arch-cache";
+			};
+			L1_D_103: l1-dcache {
+				compatible = "arm,arch-cache";
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+
+				core1 {
+					cpu = <&CPU1>;
+				};
+
+				core2 {
+					cpu = <&CPU2>;
+				};
+
+				core3 {
+					cpu = <&CPU3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+
+				core1 {
+					cpu = <&CPU5>;
+				};
+
+				core2 {
+					cpu = <&CPU6>;
+				};
+
+				core3 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <181>;
+				exit-latency-us = <149>;
+				min-residency-us = <703>;
+				local-timer-stop;
+			};
+
+			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-retention";
+				arm,psci-suspend-param = <0x00000002>;
+				entry-latency-us = <142>;
+				exit-latency-us = <99>;
+				min-residency-us = <242>;
+			};
+
+			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-collapse";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <158>;
+				exit-latency-us = <144>;
+				min-residency-us = <863>;
+				local-timer-stop;
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <19200000>;
+	};
+
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "xo_board";
+		};
+
+		cxo: cxo {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "cxo";
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32764>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	firmware {
+		scm: scm {
+			compatible = "qcom,scm";
+			clocks = <&gcc GCC_CRYPTO_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_AHB_CLK>;
+			clock-names = "core", "bus", "iface";
+			#reset-cells = <1>;
+
+			qcom,dload-mode = <&tcsr 0x6100>;
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
+
+	rpmpd_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		rpmpd_opp_ret: opp1 {
+			opp-level = <RPM_SMD_LEVEL_RETENTION>;
+		};
+
+		rpmpd_opp_ret_plus: opp2 {
+			opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
+		};
+
+		rpmpd_opp_min_svs: opp3 {
+			opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
+		};
+
+		rpmpd_opp_low_svs: opp4 {
+			opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
+		};
+
+		rpmpd_opp_svs: opp5 {
+			opp-level = <RPM_SMD_LEVEL_SVS>;
+		};
+
+		rpmpd_opp_svs_plus: opp6 {
+			opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
+		};
+
+		rpmpd_opp_nom: opp7 {
+			opp-level = <RPM_SMD_LEVEL_NOM>;
+		};
+
+		rpmpd_opp_nom_plus: opp8 {
+			opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
+		};
+
+		rpmpd_opp_turbo: opp9 {
+			opp-level = <RPM_SMD_LEVEL_TURBO>;
+		};
+
+		rpmpd_opp_turbo_no_cpr: opp10 {
+			opp-level = <RPM_SMD_LEVEL_TURBO_NO_CPR>;
+		};
+
+		rpmpd_opp_turbo_high: opp111 {
+			opp-level = <RPM_SMD_LEVEL_TURBO_HIGH>;
+		};
+	};
+
+	smd {
+		compatible = "qcom,smd";
+
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+
+			rpm_requests {
+				compatible = "qcom,rpm-msm8976";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: qcom,rpmcc {
+					compatible = "qcom,rpmcc-msm8976";
+					#clock-cells = <1>;
+				};
+
+				rpmpd: power-controller {
+					compatible = "qcom,msm8976-rpmpd";
+					#power-domain-cells = <1>;
+					operating-points-v2 = <&rpmpd_opp_table>;
+				};
+
+				smd_rpm_regulators: pm8950-regulators {
+					compatible = "qcom,rpm-pm8950-regulators";
+
+					pm8950_s1: s1 {};
+					pm8950_s2: s2 {};
+					pm8950_s3: s3 {};
+					pm8950_s4: s4 {};
+					pm8950_s5: s5 {};
+					pm8950_s6: s6 {};
+
+					pm8950_l1: l1 {};
+					pm8950_l2: l2 {};
+					pm8950_l3: l3 {};
+					pm8950_l4: l4 {};
+					pm8950_l5: l5 {};
+					pm8950_l6: l6 {};
+					pm8950_l7: l7 {};
+					pm8950_l8: l8 {};
+					pm8950_l9: l9 {};
+					pm8950_l10: l10 {};
+					pm8950_l11: l11 {};
+					pm8950_l12: l12 {};
+					pm8950_l13: l13 {};
+					pm8950_l14: l14 {};
+					pm8950_l15: l15 {};
+					pm8950_l16: l16 {};
+					pm8950_l17: l17 {};
+					pm8950_l18: l18 {};
+					pm8950_l19: l19 {};
+					pm8950_l20: l20 {};
+					pm8950_l21: l21 {};
+					pm8950_l22: l22 {};
+					pm8950_l23: l23 {};
+				};
+			};
+		};
+	};
+
+	soc: soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0 0xffffffff>;
+		compatible = "simple-bus";
+
+		tcsr_mutex_regs: syscon@1905000 {
+			compatible = "syscon";
+			reg = <0x1905000 0x20000>;
+		};
+
+		tcsr_mutex: hwlock {
+			compatible = "qcom,tcsr-mutex";
+			syscon = <&tcsr_mutex_regs 0 0x1000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-msm8916", "syscon";
+			reg = <0x1937000 0x30000>;
+		};
+
+		rpm_msg_ram: memory@60000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0x60000 0x8000>;
+		};
+
+		rng@22000 {
+			compatible = "qcom,prng";
+			reg = <0x22000 0x140>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
+		qfprom@a4000 {
+			compatible = "qcom,qfprom";
+			reg = <0xa4000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_caldata: caldata@218 {
+				reg = <0x218 0x18>;
+			};
+		};
+
+		tsens0: thermal-sensor@4a9000 {
+			compatible = "qcom,msm8976-tsens";
+			reg = <0x4a9000 0x1000>, /* TM */
+			      <0x4a8000 0x1000>; /* SROT */
+			nvmem-cells = <&tsens_caldata>;
+			nvmem-cell-names = "calib";
+			#qcom,sensors = <11>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>,
+			      <0x0b002000 0x1000>;
+		};
+
+		apcs: syscon@b011000 {
+			compatible = "syscon";
+			reg = <0xb011000 0x1000>;
+		};
+
+		smsm {
+			compatible = "qcom,smsm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			qcom,ipc-1 = <&apcs 8 12>;
+			qcom,ipc-2 = <&apcs 8 9>;
+			qcom,ipc-3 = <&apcs 8 18>;
+
+			apps_smsm: apps@0 {
+				reg = <0>;
+				#qcom,smem-state-cells = <1>;
+			};
+
+			hexagon_smsm: hexagon@1 {
+				reg = <1>;
+				interrupts = <0 290 IRQ_TYPE_EDGE_RISING>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			wcnss_smsm: wcnss@6 {
+				reg = <6>;
+				interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		modem-smp2p {
+			compatible = "qcom,smp2p";
+			qcom,smem = <435>, <428>;
+
+			interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,ipc = <&apcs 8 13>;
+
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <1>;
+
+			modem_smp2p_out: master-kernel {
+				qcom,entry-name = "master-kernel";
+
+				#qcom,smem-state-cells = <1>;
+			};
+
+			modem_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		wcnss-smp2p {
+			compatible = "qcom,smp2p";
+			qcom,smem = <451>, <431>;
+
+			interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,ipc = <&apcs 8 17>;
+
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <4>;
+
+			wcnss_smp2p_out: master-kernel {
+				qcom,entry-name = "master-kernel";
+
+				#qcom,smem-state-cells = <1>;
+			};
+
+			wcnss_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		hexagon-smp2p {
+			compatible = "qcom,smp2p";
+			qcom,smem = <443>, <429>;
+
+			interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,ipc = <&apcs 8 10>;
+
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <2>;
+
+			adsp_smp2p_out: master-kernel {
+				qcom,entry-name = "master-kernel";
+
+				#qcom,smem-state-cells = <1>;
+			};
+
+			adsp_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		thermal_zones: thermal-zones {};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-msm8976";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x1800000 0x80000>;
+		};
+
+		blsp_dma: dma@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x1f000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		blsp2_dma: dma@7ac4000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x7ac4000 0x1f000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		blsp1_uart1: serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78af000 0x200>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+
+		blsp1_spi0: spi@78b5000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x078b5000 0x500>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			dmas = <&blsp_dma 5>, <&blsp_dma 4>;
+			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi0_default>;
+			pinctrl-1 = <&spi0_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c2: i2c@78b6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b6000 0x500>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c2_default>;
+			pinctrl-1 = <&i2c2_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c4: i2c@78b8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x078b8000 0x500>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				 <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c4_default>;
+			pinctrl-1 = <&i2c4_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c6: i2c@7af6000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af6000 0x600>;
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c6_default>;
+			pinctrl-1 = <&i2c6_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		blsp_i2c8: i2c@7af8000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			reg = <0x7af8000 0x600>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
+				 <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&i2c8_default>;
+			pinctrl-1 = <&i2c8_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		sdhc_1: mmc@7824000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07824900 0x500>, <0x07824000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			mmc-hs400-1_8v;
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
+		sdhc_2: sdhci@7864000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+		sdhc_3: sdhci@7a24000 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x7a24900 0x11c>, <0x7a24000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC3_APPS_CLK>,
+				 <&gcc GCC_SDCC3_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			bus-width = <4>;
+			status = "disabled";
+		};
+
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,msm8976-pinctrl";
+			reg = <0x1000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		timer@b120000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0xb120000 0x1000>;
+			clock-frequency = <19200000>;
+
+			frame@b121000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb121000 0x1000>,
+				      <0xb122000 0x1000>;
+			};
+
+			frame@b123000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb123000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b124000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb124000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b125000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb125000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b126000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb126000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b127000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb127000 0x1000>;
+				status = "disabled";
+			};
+
+			frame@b128000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0xb128000 0x1000>;
+				status = "disabled";
+			};
+		};
+
+		spmi_bus: qcom,spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x200f000 0x1000>,
+				<0x2400000 0x800000>,
+				<0x2c00000 0x800000>,
+				<0x3800000 0x200000>,
+				<0x200a000 0x2100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
+		otg: usb@78d9000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x78db000 0x200>,
+			      <0x78db200 0x200>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <80000000>;
+			resets = <&gcc RST_USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			dr_mode = "peripheral";
+			ahb-burst-config = <0>;
+			status = "disabled";
+			#reset-cells = <1>;
+		};
+
+		gpu_iommu: iommu@1f08000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x1f08000 0x8000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_GFX3D_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <18>;
+			power-domains = <&gcc OXILI_CX_GDSC>;
+
+			// gfx3d_user:
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				qcom,ctx-num = <0>;
+				interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// gfx3d_sec:
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-num = <2>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// gfx3d_priv:
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-num = <1>;
+				interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+		};
+
+		adreno_gpu: gpu@1c00000 {
+			compatible = "qcom,adreno-510.0", "qcom,adreno";
+			#stream-id-cells = <16>;
+
+			reg = <0x01c00000 0x40000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "kgsl_3d0_irq";
+
+			clock-names =
+			    "core",
+			    "iface",
+			    "mem",
+			    "rbbmtimer",
+			    "gtcu",
+			    "gtbu",
+			    "alwayson";
+
+			clocks =
+			    <&gcc GCC_GFX3D_OXILI_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
+			    <&gcc GCC_GFX3D_BIMC_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
+			    <&gcc GCC_GFX3D_GTCU_AHB_CLK>,
+			    <&gcc GCC_GFX3D_TBU1_CLK>,
+			    <&gcc GCC_GFX3D_OXILI_AON_CLK>;
+
+			power-domains = <&gcc OXILI_CX_GDSC>;
+			operating-points-v2 = <&gpu_opp_table>;
+			iommus = <&gpu_iommu 0>;
+
+			gpu_opp_table: opp_table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+				};
+
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+				};
+			};
+		};
+
+		apps_iommu: iommu@1e1f000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			compatible = "qcom,msm8976-iommu", "qcom,msm-iommu-v1";
+			ranges = <0 0x1e1f000 0x21000>;
+			clocks = <&gcc GCC_SMMU_CFG_CLK>,
+				 <&gcc GCC_APSS_TCU_CLK>;
+			clock-names = "iface", "bus";
+			qcom,iommu-secure-id = <17>;
+			status = "ok";
+
+			// adsp_elf:
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x1000 0x1000>;
+				qcom,ctx-num = <1>;
+				interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_sec_pixel:
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x2000 0x1000>;
+				qcom,ctx-num = <2>;
+				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_sec_bitstream:
+			iommu-ctx@3000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x3000 0x1000>;
+				qcom,ctx-num = <3>;
+				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_fw:
+			iommu-ctx@4000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x4000 0x1000>;
+				qcom,ctx-num = <4>;
+				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_non_pixel:
+			iommu-ctx@5000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x5000 0x1000>;
+				qcom,ctx-num = <5>;
+				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_bitstream:
+			iommu-ctx@6000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x6000 0x1000>;
+				qcom,ctx-num = <6>;
+				interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_sec_pixel:
+			iommu-ctx@7000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x7000 0x1000>;
+				qcom,ctx-num = <7>;
+				interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// venus_enc:
+			iommu-ctx@8000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x8000 0x1000>;
+				qcom,ctx-num = <8>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// mdp_1:
+			iommu-ctx@9000 {
+				compatible = "qcom,msm-iommu-v2-sec";
+				reg = <0x9000 0x1000>;
+				qcom,ctx-num = <9>;
+				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			// adsp_io:
+			iommu-ctx@10000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x10000 0x1000>;
+				interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <14>;
+			};
+
+			// adsp_opendsp:
+			iommu-ctx@11000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x11000 0x1000>;
+				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <15>;
+			};
+
+			// adsp_shared:
+			iommu-ctx@12000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x12000 0x1000>;
+				interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <16>;
+			};
+
+			// lpass_stream:
+			iommu-ctx@13000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x13000 0x1000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <17>;
+			};
+
+			// cpp:
+			iommu-ctx@14000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x14000 0x1000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <18>;
+			};
+
+			// jpeg_enc0:
+			iommu-ctx@15000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x15000 0x1000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <19>;
+			};
+
+			// vfe:
+			iommu-ctx@16000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x16000 0x1000>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <20>;
+			};
+
+			// venus_ns:
+			iommu-ctx@17000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x17000 0x1000>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <21>;
+			};
+
+			// mdp_0:
+			iommu-ctx@18000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x18000 0x1000>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <22>;
+			};
+
+			// pronto_buf:
+			iommu-ctx@19000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x19000 0x1000>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <23>;
+			};
+
+			// mss_nav:
+			iommu-ctx@1a000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1a000 0x1000>;
+				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <24>;
+			};
+
+			// ipa_shared:
+			iommu-ctx@1b000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1b000 0x1000>;
+				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <25>;
+			};
+
+			// ipa_wlan:
+			iommu-ctx@1c000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1c000 0x1000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <26>;
+			};
+
+			// ipa_uc:
+			iommu-ctx@1d000 {
+				compatible = "qcom,msm-iommu-v2-ns";
+				reg = <0x1d000 0x1000>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+				qcom,ctx-num = <27>;
+			};
+		};
+
+		mdss: mdss@1a00000 {
+			compatible = "qcom,mdss";
+			reg = <0x1a00000 0x1000>,
+			      <0x1ac8000 0x3000>;
+			reg-names = "mdss_phys", "vbif_phys";
+
+			vdd-supply = <&pm8950_l17>;
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "vsync";
+
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@1a01000 {
+				compatible = "qcom,mdp5";
+				reg = <0x1a01000 0x89000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_VSYNC_CLK>,
+					 <&gcc GCC_MDP_TBU_CLK>,
+					 <&gcc GCC_MDP_RT_TBU_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync",
+					      "tbu",
+					      "tbu_rt";
+
+				iommus = <&apps_iommu 22>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@1a94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x1a94000 0x25c>;
+				reg-names = "dsi_ctrl";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+				vdda-supply = <&pm8950_l1>;
+				vddio-supply = <&pm8950_l6>;
+
+				assigned-clocks =
+					<&gcc GCC_MDSS_BYTE0_CLK_SRC>,
+					<&gcc GCC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+							 <&dsi_phy0 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE0_CLK>,
+					 <&gcc GCC_MDSS_PCLK0_CLK>,
+					 <&gcc GCC_MDSS_ESC0_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&dsi_phy0>;
+				phy-names = "dsi-phy";
+
+				qcom,mdss-mdp-transfer-time-us = <12000>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1: dsi@1a96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x1a96000 0x300>;
+				reg-names = "dsi_ctrl";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+				vdda-supply = <&pm8950_l1>;
+				vddio-supply = <&pm8950_l6>;
+
+				assigned-clocks =
+					<&gcc GCC_MDSS_BYTE1_CLK_SRC>,
+					<&gcc GCC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy1 0>,
+							 <&dsi_phy1 1>;
+
+				clocks = <&gcc GCC_MDSS_MDP_CLK>,
+					 <&gcc GCC_MDSS_AHB_CLK>,
+					 <&gcc GCC_MDSS_AXI_CLK>,
+					 <&gcc GCC_MDSS_BYTE1_CLK>,
+					 <&gcc GCC_MDSS_PCLK1_CLK>,
+					 <&gcc GCC_MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core";
+				phys = <&dsi_phy0>;
+				phy-names = "dsi-phy";
+
+				qcom,mdss-mdp-transfer-time-us = <12000>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy0: dsi-phy@1a94a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x1a94a00 0xd4>,
+				      <0x1a94400 0x280>,
+				      <0x1a94b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				vddio-supply = <&pm8950_l6>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&xo_board>;
+				clock-names = "iface", "ref";
+			};
+
+			dsi_phy1: dsi-phy@1a96a00 {
+				compatible = "qcom,dsi-phy-28nm-hpm-fam-b";
+				reg = <0x1a96a00 0xd4>,
+				      <0x1a96400 0x280>,
+				      <0x1a96b80 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				vddio-supply = <&pm8950_l6>;
+
+				clocks = <&gcc GCC_MDSS_AHB_CLK>,
+					 <&xo_board>;
+				clock-names = "iface", "ref";
+			};
+		};
+
+		hexagon@4080000 {
+			compatible = "qcom,q6v5-pil";
+			reg = <0x04080000 0x100>,
+			      <0x04020000 0x040>;
+
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc 0 293 1>,
+					      <&adsp_smp2p_in 0 0>,
+					      <&adsp_smp2p_in 2 0>,
+					      <&adsp_smp2p_in 1 0>,
+					      <&adsp_smp2p_in 3 0>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "bus", "mem", "xo";
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&scm 0>;
+			reset-names = "mss_restart";
+
+			cx-supply = <&pm8950_s1>;
+			mx-supply = <&pm8950_s2>; /* s2_level */
+			pll-supply = <&pm8950_l7>;
+
+			qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
+
+			status = "disabled";
+
+			mba {
+				memory-region = <&lpass_mem>;
+			};
+
+			mpss {
+				memory-region = <&mpss_mem>;
+			};
+
+			smd-edge {
+				interrupts = <0 25 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,smd-edge = <0>;
+				qcom,ipc = <&apcs 8 12>;
+				qcom,remote-pid = <1>;
+
+				label = "hexagon";
+			};
+		};
+	};
+};
+
+&thermal_zones {
+	aoss0-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+
+		thermal-sensors = <&tsens0 0>;
+		trips {
+			aoss0_alert: trip-point@0 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+		};
+	};
+
+	mdm-core-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+
+		thermal-sensors = <&tsens0 1>;
+		trips {
+			modem_alert: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+		};
+	};
+
+	qdsp-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+
+		thermal-sensors = <&tsens0 2>;
+		trips {
+			qdsp_alert: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+		};
+	};
+
+	cam-isp-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+
+		thermal-sensors = <&tsens0 3>;
+		trips {
+			cam_isp_alert: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+		};
+	};
+
+	apc1-cpu0-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 4>;
+
+		trips {
+			cpu4_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			cpu4_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			cpu4_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	apc1-cpu1-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 5>;
+
+		trips {
+			cpu5_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			cpu5_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			cpu5_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	apc1-cpu2-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 6>;
+
+		trips {
+			cpu6_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			cpu6_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			cpu6_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	apc1-cpu3-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 7>;
+
+		trips {
+			cpu7_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			cpu7_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			cpu7_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	apc1-l2-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 8>;
+
+		trips {
+			l2_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			l2_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			l2_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	apc0-cpu0-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <1000>;
+		thermal-sensors = <&tsens0 9>;
+
+		trips {
+			cpu0_alert0: trip-point@0 {
+				temperature = <95000>;
+				hysteresis = <2000>;
+				type = "hot";
+			};
+			cpu0_alert1: trip-point@1 {
+				temperature = <105000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			cpu0_crit: trip-point@2 {
+				temperature = <120000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+#include "msm8976-pins.dtsi"
-- 
2.21.0

