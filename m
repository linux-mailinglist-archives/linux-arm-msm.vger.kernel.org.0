Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD58CDE3AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbfJUFOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:14:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40032 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfJUFNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:31 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so7641264pfb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/rIsGovTRke4U85mNliEuwgURkTaPviPRcpW8MZElE=;
        b=zWaKu9YK0PjpE4IjfF4DdEYQDC2KYxGdEe/bH1lz3+VstZSENupl9H3xTLnDkA3MSq
         dnYIMIe9z4K/JqXjzA1/4zpwDrh626xPi1WYBqKufT2nMvfw1zDZc5tFJmi7gNJ/+T/0
         qxjYa16WeheuqmrwOj4oEnsxatqSJK554XeY0wsXWvQT2h1rZKOCW9L4YO19papH1/g9
         fK3SaSlR07IvjJXCQOCHuRSAwbXVOUY8EHD/kuyDuPRkvO7sVUG9ZLW6C0/COWRcZ/08
         A34RVt5JYrHj26H0YyvqUe8o+wjBPe2uqzmFojSkiZL4q+3Yr4fEuH17dlWpM9UTejWv
         5esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/rIsGovTRke4U85mNliEuwgURkTaPviPRcpW8MZElE=;
        b=KTuh3/zAaGTX5uGDaTmwfMB7xuWvtS2dvSYDdsHSQG4k81JalZiNwGcyZDAbumL349
         xK7ljJneiFq25su/Pr83Npg/G/OoMFf4SK4avm0vKRboZ6TpvF0AxFqOpQdftEuARpOy
         sLZTK2PxcuNbuiDRupgBONIT/yiHIS8DaqcNDESOb9vUb61ZeT4947NCpqlEG2/K/zeI
         yyv0IXyXllft4wdUo/eQaLz9yUFb+2pHJIdoelcBotKSxnzKxB8njOGxB7MoUhOmIb+K
         6+5CzRAUe1GpL61EtsZVcf8FJGIgr9EvYppvyiSerYT/d7kTWz1Gm0JyV8ROTwaTGVGv
         5dkQ==
X-Gm-Message-State: APjAAAXXoAdZYZf1Dzz90z2l0borwqWePt/hpbwPhSVKEkcgVd1ov07J
        DwjcuJC2ygCr2/aXhdKYW2qU+A==
X-Google-Smtp-Source: APXvYqymelFlzJ02CjouQqL5KNITyYZRBRmvNu4k93Hd12is/kBNh8E9lmD12kLYl8ARdcF/MHHd5Q==
X-Received: by 2002:a63:fa4a:: with SMTP id g10mr14490522pgk.432.1571634808184;
        Sun, 20 Oct 2019 22:13:28 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] arm64: dts: qcom: msm8996: Use node references in db820c
Date:   Sun, 20 Oct 2019 22:13:13 -0700
Message-Id: <20191021051322.297560-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of mimicing the structure of the platform, reference nodes by
their label in apq8096-db820c.dtsi. Add labels in msm8996.dtsi where
necessary.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 691 +++++++++----------
 arch/arm64/boot/dts/qcom/msm8996.dtsi        |   4 +-
 2 files changed, 341 insertions(+), 354 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index da2f01eb3be2..44ec3eb1c8e8 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -77,396 +77,383 @@
 			enable-gpios = <&pm8994_gpios 15 0>;
 		};
 	};
+};
 
-	soc {
-		serial@7570000 {
-			label = "BT-UART";
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp1_uart1_default>;
-			pinctrl-1 = <&blsp1_uart1_sleep>;
+&blsp1_uart1 {
+	label = "BT-UART";
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp1_uart1_default>;
+	pinctrl-1 = <&blsp1_uart1_sleep>;
 
-			bluetooth {
-				compatible = "qcom,qca6174-bt";
+	bluetooth {
+		compatible = "qcom,qca6174-bt";
 
-				/* bt_disable_n gpio */
-				enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
+		/* bt_disable_n gpio */
+		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
 
-				clocks = <&divclk4>;
-			};
-		};
+		clocks = <&divclk4>;
+	};
+};
 
-		serial@75b0000 {
-			label = "LS-UART1";
-			status = "okay";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_uart1_2pins_default>;
-			pinctrl-1 = <&blsp2_uart1_2pins_sleep>;
-		};
+&blsp2_uart1 {
+	label = "LS-UART1";
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp2_uart1_2pins_default>;
+	pinctrl-1 = <&blsp2_uart1_2pins_sleep>;
+};
 
-		serial@75b1000 {
-			label = "LS-UART0";
-			status = "disabled";
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_uart2_4pins_default>;
-			pinctrl-1 = <&blsp2_uart2_4pins_sleep>;
-		};
+&blsp2_uart2 {
+	label = "LS-UART0";
+	status = "disabled";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&blsp2_uart2_4pins_default>;
+	pinctrl-1 = <&blsp2_uart2_4pins_sleep>;
+};
 
-		i2c@7577000 {
-		/* On Low speed expansion */
-			label = "LS-I2C0";
-			status = "okay";
-		};
+&blsp1_i2c2 {
+	/* On Low speed expansion */
+	label = "LS-I2C0";
+	status = "okay";
+};
 
-		i2c@75b6000 {
-		/* On Low speed expansion */
-			label = "LS-I2C1";
-			status = "okay";
-		};
+&blsp2_i2c1 {
+	/* On Low speed expansion */
+	label = "LS-I2C1";
+	status = "okay";
+};
 
-		spi@7575000 {
-		/* On Low speed expansion */
-			label = "LS-SPI0";
-			status = "okay";
-		};
+&blsp1_spi0 {
+	/* On Low speed expansion */
+	label = "LS-SPI0";
+	status = "okay";
+};
 
-		i2c@75b5000 {
-		/* On High speed expansion */
-			label = "HS-I2C2";
-			status = "okay";
-		};
+&blsp2_i2c0 {
+	/* On High speed expansion */
+	label = "HS-I2C2";
+	status = "okay";
+};
 
-		spi@75ba000{
-		/* On High speed expansion */
-			label = "HS-SPI1";
-			status = "okay";
-		};
+&blsp2_spi5 {
+	/* On High speed expansion */
+	label = "HS-SPI1";
+	status = "okay";
+};
 
-		sdhci@74a4900 {
-		/* External SD card */
-			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
-			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
-			cd-gpios = <&msmgpio 38 0x1>;
-			vmmc-supply = <&pm8994_l21>;
-			vqmmc-supply = <&pm8994_l13>;
-			status = "okay";
-		};
+&sdhc2 {
+	/* External SD card */
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+	cd-gpios = <&msmgpio 38 0x1>;
+	vmmc-supply = <&pm8994_l21>;
+	vqmmc-supply = <&pm8994_l13>;
+	status = "okay";
+};
 
-		phy@627000 {
-			status = "okay";
-		};
+&ufsphy {
+	status = "okay";
+};
 
-		ufshc@624000 {
-			status = "okay";
-		};
+&ufshc {
+	status = "okay";
+};
 
-		pinctrl@1010000 {
-			gpio-line-names =
-				"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
-				"[SPI0_DIN]", /* GPIO_1, BLSP1_SPI_MISO, LSEC pin 10 */
-				"[SPI0_CS]", /* GPIO_2, BLSP1_SPI_CS_N, LSEC pin 12 */
-				"[SPI0_SCLK]", /* GPIO_3, BLSP1_SPI_CLK, LSEC pin 8 */
-				"[UART1_TxD]", /* GPIO_4, BLSP8_UART_TX, LSEC pin 11 */
-				"[UART1_RxD]", /* GPIO_5, BLSP8_UART_RX, LSEC pin 13 */
-				"[I2C1_SDA]", /* GPIO_6, BLSP8_I2C_SDA, LSEC pin 21 */
-				"[I2C1_SCL]", /* GPIO_7, BLSP8_I2C_SCL, LSEC pin 19 */
-				"GPIO-H", /* GPIO_8, LCD0_RESET_N, LSEC pin 30 */
-				"TP93", /* GPIO_9 */
-				"GPIO-G", /* GPIO_10, MDP_VSYNC_P, LSEC pin 29 */
-				"[MDP_VSYNC_S]", /* GPIO_11, S HSEC pin 55 */
-				"NC", /* GPIO_12 */
-				"[CSI0_MCLK]", /* GPIO_13, CAM_MCLK0, P HSEC pin 15 */
-				"[CAM_MCLK1]", /* GPIO_14, J14 pin 11 */
-				"[CSI1_MCLK]", /* GPIO_15, CAM_MCLK2, P HSEC pin 17 */
-				"TP99", /* GPIO_16 */
-				"[I2C2_SDA]", /* GPIO_17, CCI_I2C_SDA0, P HSEC pin 34 */
-				"[I2C2_SCL]", /* GPIO_18, CCI_I2C_SCL0, P HSEC pin 32 */
-				"[CCI_I2C_SDA1]", /* GPIO_19, S HSEC pin 38 */
-				"[CCI_I2C_SCL1]", /* GPIO_20, S HSEC pin 36 */
-				"FLASH_STROBE_EN", /* GPIO_21, S HSEC pin 5 */
-				"FLASH_STROBE_TRIG", /* GPIO_22, S HSEC pin 1 */
-				"GPIO-K", /* GPIO_23, CAM2_RST_N, LSEC pin 33 */
-				"GPIO-D", /* GPIO_24, LSEC pin 26 */
-				"GPIO-I", /* GPIO_25, CAM0_RST_N, LSEC pin 31 */
-				"GPIO-J", /* GPIO_26, CAM0_STANDBY_N, LSEC pin 32 */
-				"BLSP6_I2C_SDA", /* GPIO_27 */
-				"BLSP6_I2C_SCL", /* GPIO_28 */
-				"GPIO-B", /* GPIO_29, TS0_RESET_N, LSEC pin 24 */
-				"GPIO30", /* GPIO_30, S HSEC pin 4 */
-				"HDMI_CEC", /* GPIO_31 */
-				"HDMI_DDC_CLOCK", /* GPIO_32 */
-				"HDMI_DDC_DATA", /* GPIO_33 */
-				"HDMI_HOT_PLUG_DETECT", /* GPIO_34 */
-				"PCIE0_RST_N", /* GPIO_35 */
-				"PCIE0_CLKREQ_N", /* GPIO_36 */
-				"PCIE0_WAKE", /* GPIO_37 */
-				"SD_CARD_DET_N", /* GPIO_38 */
-				"TSIF1_SYNC", /* GPIO_39, S HSEC pin 48 */
-				"W_DISABLE_N", /* GPIO_40 */
-				"[BLSP9_UART_TX]", /* GPIO_41 */
-				"[BLSP9_UART_RX]", /* GPIO_42 */
-				"[BLSP2_UART_CTS_N]", /* GPIO_43 */
-				"[BLSP2_UART_RFR_N]", /* GPIO_44 */
-				"[BLSP3_UART_TX]", /* GPIO_45 */
-				"[BLSP3_UART_RX]", /* GPIO_46 */
-				"[I2C0_SDA]", /* GPIO_47, LS_I2C0_SDA, LSEC pin 17 */
-				"[I2C0_SCL]", /* GPIO_48, LS_I2C0_SCL, LSEC pin 15 */
-				"[UART0_TxD]", /* GPIO_49, BLSP9_UART_TX, LSEC pin 5 */
-				"[UART0_RxD]", /* GPIO_50, BLSP9_UART_RX, LSEC pin 7 */
-				"[UART0_CTS]", /* GPIO_51, BLSP9_UART_CTS_N, LSEC pin 3 */
-				"[UART0_RTS]", /* GPIO_52, BLSP9_UART_RFR_N, LSEC pin 9 */
-				"[CODEC_INT1_N]", /* GPIO_53 */
-				"[CODEC_INT2_N]", /* GPIO_54 */
-				"[BLSP7_I2C_SDA]", /* GPIO_55 */
-				"[BLSP7_I2C_SCL]", /* GPIO_56 */
-				"MI2S_MCLK", /* GPIO_57, S HSEC pin 3 */
-				"[PCM_CLK]", /* GPIO_58, QUA_MI2S_SCK, LSEC pin 18 */
-				"[PCM_FS]", /* GPIO_59, QUA_MI2S_WS, LSEC pin 16 */
-				"[PCM_DO]", /* GPIO_60, QUA_MI2S_DATA0, LSEC pin 20 */
-				"[PCM_DI]", /* GPIO_61, QUA_MI2S_DATA1, LSEC pin 22 */
-				"GPIO-E", /* GPIO_62, LSEC pin 27 */
-				"TP87", /* GPIO_63 */
-				"[CODEC_RST_N]", /* GPIO_64 */
-				"[PCM1_CLK]", /* GPIO_65 */
-				"[PCM1_SYNC]", /* GPIO_66 */
-				"[PCM1_DIN]", /* GPIO_67 */
-				"[PCM1_DOUT]", /* GPIO_68 */
-				"AUDIO_REF_CLK", /* GPIO_69 */
-				"SLIMBUS_CLK", /* GPIO_70 */
-				"SLIMBUS_DATA0", /* GPIO_71 */
-				"SLIMBUS_DATA1", /* GPIO_72 */
-				"NC", /* GPIO_73 */
-				"NC", /* GPIO_74 */
-				"NC", /* GPIO_75 */
-				"NC", /* GPIO_76 */
-				"TP94", /* GPIO_77 */
-				"NC", /* GPIO_78 */
-				"TP95", /* GPIO_79 */
-				"GPIO-A", /* GPIO_80, MEMS_RESET_N, LSEC pin 23 */
-				"TP88", /* GPIO_81 */
-				"TP89", /* GPIO_82 */
-				"TP90", /* GPIO_83 */
-				"TP91", /* GPIO_84 */
-				"[SD_DAT0]", /* GPIO_85, BLSP12_SPI_MOSI, P HSEC pin 1 */
-				"[SD_CMD]", /* GPIO_86, BLSP12_SPI_MISO, P HSEC pin 11 */
-				"[SD_DAT3]", /* GPIO_87, BLSP12_SPI_CS_N, P HSEC pin 7 */
-				"[SD_SCLK]", /* GPIO_88, BLSP12_SPI_CLK, P HSEC pin 9 */
-				"TSIF1_CLK", /* GPIO_89, S HSEC pin 42 */
-				"TSIF1_EN", /* GPIO_90, S HSEC pin 46 */
-				"TSIF1_DATA", /* GPIO_91, S HSEC pin 44 */
-				"NC", /* GPIO_92 */
-				"TSIF2_CLK", /* GPIO_93, S HSEC pin 52 */
-				"TSIF2_EN", /* GPIO_94, S HSEC pin 56 */
-				"TSIF2_DATA", /* GPIO_95, S HSEC pin 54 */
-				"TSIF2_SYNC", /* GPIO_96, S HSEC pin 58 */
-				"NC", /* GPIO_97 */
-				"CAM1_STANDBY_N", /* GPIO_98 */
-				"NC", /* GPIO_99 */
-				"NC", /* GPIO_100 */
-				"[LCD1_RESET_N]", /* GPIO_101, S HSEC pin 51 */
-				"BOOT_CONFIG1", /* GPIO_102 */
-				"USB_HUB_RESET", /* GPIO_103 */
-				"CAM1_RST_N", /* GPIO_104 */
-				"NC", /* GPIO_105 */
-				"NC", /* GPIO_106 */
-				"NC", /* GPIO_107 */
-				"NC", /* GPIO_108 */
-				"NC", /* GPIO_109 */
-				"NC", /* GPIO_110 */
-				"NC", /* GPIO_111 */
-				"NC", /* GPIO_112 */
-				"PMI8994_BUA", /* GPIO_113 */
-				"PCIE2_RST_N", /* GPIO_114 */
-				"PCIE2_CLKREQ_N", /* GPIO_115 */
-				"PCIE2_WAKE", /* GPIO_116 */
-				"SSC_IRQ_0", /* GPIO_117 */
-				"SSC_IRQ_1", /* GPIO_118 */
-				"SSC_IRQ_2", /* GPIO_119 */
-				"NC", /* GPIO_120 */
-				"GPIO121", /* GPIO_121, S HSEC pin 2 */
-				"NC", /* GPIO_122 */
-				"SSC_IRQ_6", /* GPIO_123 */
-				"SSC_IRQ_7", /* GPIO_124 */
-				"GPIO-C", /* GPIO_125, TS_INT0, LSEC pin 25 */
-				"BOOT_CONFIG5", /* GPIO_126 */
-				"NC", /* GPIO_127 */
-				"NC", /* GPIO_128 */
-				"BOOT_CONFIG7", /* GPIO_129 */
-				"PCIE1_RST_N", /* GPIO_130 */
-				"PCIE1_CLKREQ_N", /* GPIO_131 */
-				"PCIE1_WAKE", /* GPIO_132 */
-				"GPIO-L", /* GPIO_133, CAM2_STANDBY_N, LSEC pin 34 */
-				"NC", /* GPIO_134 */
-				"NC", /* GPIO_135 */
-				"BOOT_CONFIG8", /* GPIO_136 */
-				"NC", /* GPIO_137 */
-				"NC", /* GPIO_138 */
-				"GPS_SSBI2", /* GPIO_139 */
-				"GPS_SSBI1", /* GPIO_140 */
-				"NC", /* GPIO_141 */
-				"NC", /* GPIO_142 */
-				"NC", /* GPIO_143 */
-				"BOOT_CONFIG6", /* GPIO_144 */
-				"NC", /* GPIO_145 */
-				"NC", /* GPIO_146 */
-				"NC", /* GPIO_147 */
-				"NC", /* GPIO_148 */
-				"NC"; /* GPIO_149 */
-		};
+&msmgpio {
+	gpio-line-names =
+		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
+		"[SPI0_DIN]", /* GPIO_1, BLSP1_SPI_MISO, LSEC pin 10 */
+		"[SPI0_CS]", /* GPIO_2, BLSP1_SPI_CS_N, LSEC pin 12 */
+		"[SPI0_SCLK]", /* GPIO_3, BLSP1_SPI_CLK, LSEC pin 8 */
+		"[UART1_TxD]", /* GPIO_4, BLSP8_UART_TX, LSEC pin 11 */
+		"[UART1_RxD]", /* GPIO_5, BLSP8_UART_RX, LSEC pin 13 */
+		"[I2C1_SDA]", /* GPIO_6, BLSP8_I2C_SDA, LSEC pin 21 */
+		"[I2C1_SCL]", /* GPIO_7, BLSP8_I2C_SCL, LSEC pin 19 */
+		"GPIO-H", /* GPIO_8, LCD0_RESET_N, LSEC pin 30 */
+		"TP93", /* GPIO_9 */
+		"GPIO-G", /* GPIO_10, MDP_VSYNC_P, LSEC pin 29 */
+		"[MDP_VSYNC_S]", /* GPIO_11, S HSEC pin 55 */
+		"NC", /* GPIO_12 */
+		"[CSI0_MCLK]", /* GPIO_13, CAM_MCLK0, P HSEC pin 15 */
+		"[CAM_MCLK1]", /* GPIO_14, J14 pin 11 */
+		"[CSI1_MCLK]", /* GPIO_15, CAM_MCLK2, P HSEC pin 17 */
+		"TP99", /* GPIO_16 */
+		"[I2C2_SDA]", /* GPIO_17, CCI_I2C_SDA0, P HSEC pin 34 */
+		"[I2C2_SCL]", /* GPIO_18, CCI_I2C_SCL0, P HSEC pin 32 */
+		"[CCI_I2C_SDA1]", /* GPIO_19, S HSEC pin 38 */
+		"[CCI_I2C_SCL1]", /* GPIO_20, S HSEC pin 36 */
+		"FLASH_STROBE_EN", /* GPIO_21, S HSEC pin 5 */
+		"FLASH_STROBE_TRIG", /* GPIO_22, S HSEC pin 1 */
+		"GPIO-K", /* GPIO_23, CAM2_RST_N, LSEC pin 33 */
+		"GPIO-D", /* GPIO_24, LSEC pin 26 */
+		"GPIO-I", /* GPIO_25, CAM0_RST_N, LSEC pin 31 */
+		"GPIO-J", /* GPIO_26, CAM0_STANDBY_N, LSEC pin 32 */
+		"BLSP6_I2C_SDA", /* GPIO_27 */
+		"BLSP6_I2C_SCL", /* GPIO_28 */
+		"GPIO-B", /* GPIO_29, TS0_RESET_N, LSEC pin 24 */
+		"GPIO30", /* GPIO_30, S HSEC pin 4 */
+		"HDMI_CEC", /* GPIO_31 */
+		"HDMI_DDC_CLOCK", /* GPIO_32 */
+		"HDMI_DDC_DATA", /* GPIO_33 */
+		"HDMI_HOT_PLUG_DETECT", /* GPIO_34 */
+		"PCIE0_RST_N", /* GPIO_35 */
+		"PCIE0_CLKREQ_N", /* GPIO_36 */
+		"PCIE0_WAKE", /* GPIO_37 */
+		"SD_CARD_DET_N", /* GPIO_38 */
+		"TSIF1_SYNC", /* GPIO_39, S HSEC pin 48 */
+		"W_DISABLE_N", /* GPIO_40 */
+		"[BLSP9_UART_TX]", /* GPIO_41 */
+		"[BLSP9_UART_RX]", /* GPIO_42 */
+		"[BLSP2_UART_CTS_N]", /* GPIO_43 */
+		"[BLSP2_UART_RFR_N]", /* GPIO_44 */
+		"[BLSP3_UART_TX]", /* GPIO_45 */
+		"[BLSP3_UART_RX]", /* GPIO_46 */
+		"[I2C0_SDA]", /* GPIO_47, LS_I2C0_SDA, LSEC pin 17 */
+		"[I2C0_SCL]", /* GPIO_48, LS_I2C0_SCL, LSEC pin 15 */
+		"[UART0_TxD]", /* GPIO_49, BLSP9_UART_TX, LSEC pin 5 */
+		"[UART0_RxD]", /* GPIO_50, BLSP9_UART_RX, LSEC pin 7 */
+		"[UART0_CTS]", /* GPIO_51, BLSP9_UART_CTS_N, LSEC pin 3 */
+		"[UART0_RTS]", /* GPIO_52, BLSP9_UART_RFR_N, LSEC pin 9 */
+		"[CODEC_INT1_N]", /* GPIO_53 */
+		"[CODEC_INT2_N]", /* GPIO_54 */
+		"[BLSP7_I2C_SDA]", /* GPIO_55 */
+		"[BLSP7_I2C_SCL]", /* GPIO_56 */
+		"MI2S_MCLK", /* GPIO_57, S HSEC pin 3 */
+		"[PCM_CLK]", /* GPIO_58, QUA_MI2S_SCK, LSEC pin 18 */
+		"[PCM_FS]", /* GPIO_59, QUA_MI2S_WS, LSEC pin 16 */
+		"[PCM_DO]", /* GPIO_60, QUA_MI2S_DATA0, LSEC pin 20 */
+		"[PCM_DI]", /* GPIO_61, QUA_MI2S_DATA1, LSEC pin 22 */
+		"GPIO-E", /* GPIO_62, LSEC pin 27 */
+		"TP87", /* GPIO_63 */
+		"[CODEC_RST_N]", /* GPIO_64 */
+		"[PCM1_CLK]", /* GPIO_65 */
+		"[PCM1_SYNC]", /* GPIO_66 */
+		"[PCM1_DIN]", /* GPIO_67 */
+		"[PCM1_DOUT]", /* GPIO_68 */
+		"AUDIO_REF_CLK", /* GPIO_69 */
+		"SLIMBUS_CLK", /* GPIO_70 */
+		"SLIMBUS_DATA0", /* GPIO_71 */
+		"SLIMBUS_DATA1", /* GPIO_72 */
+		"NC", /* GPIO_73 */
+		"NC", /* GPIO_74 */
+		"NC", /* GPIO_75 */
+		"NC", /* GPIO_76 */
+		"TP94", /* GPIO_77 */
+		"NC", /* GPIO_78 */
+		"TP95", /* GPIO_79 */
+		"GPIO-A", /* GPIO_80, MEMS_RESET_N, LSEC pin 23 */
+		"TP88", /* GPIO_81 */
+		"TP89", /* GPIO_82 */
+		"TP90", /* GPIO_83 */
+		"TP91", /* GPIO_84 */
+		"[SD_DAT0]", /* GPIO_85, BLSP12_SPI_MOSI, P HSEC pin 1 */
+		"[SD_CMD]", /* GPIO_86, BLSP12_SPI_MISO, P HSEC pin 11 */
+		"[SD_DAT3]", /* GPIO_87, BLSP12_SPI_CS_N, P HSEC pin 7 */
+		"[SD_SCLK]", /* GPIO_88, BLSP12_SPI_CLK, P HSEC pin 9 */
+		"TSIF1_CLK", /* GPIO_89, S HSEC pin 42 */
+		"TSIF1_EN", /* GPIO_90, S HSEC pin 46 */
+		"TSIF1_DATA", /* GPIO_91, S HSEC pin 44 */
+		"NC", /* GPIO_92 */
+		"TSIF2_CLK", /* GPIO_93, S HSEC pin 52 */
+		"TSIF2_EN", /* GPIO_94, S HSEC pin 56 */
+		"TSIF2_DATA", /* GPIO_95, S HSEC pin 54 */
+		"TSIF2_SYNC", /* GPIO_96, S HSEC pin 58 */
+		"NC", /* GPIO_97 */
+		"CAM1_STANDBY_N", /* GPIO_98 */
+		"NC", /* GPIO_99 */
+		"NC", /* GPIO_100 */
+		"[LCD1_RESET_N]", /* GPIO_101, S HSEC pin 51 */
+		"BOOT_CONFIG1", /* GPIO_102 */
+		"USB_HUB_RESET", /* GPIO_103 */
+		"CAM1_RST_N", /* GPIO_104 */
+		"NC", /* GPIO_105 */
+		"NC", /* GPIO_106 */
+		"NC", /* GPIO_107 */
+		"NC", /* GPIO_108 */
+		"NC", /* GPIO_109 */
+		"NC", /* GPIO_110 */
+		"NC", /* GPIO_111 */
+		"NC", /* GPIO_112 */
+		"PMI8994_BUA", /* GPIO_113 */
+		"PCIE2_RST_N", /* GPIO_114 */
+		"PCIE2_CLKREQ_N", /* GPIO_115 */
+		"PCIE2_WAKE", /* GPIO_116 */
+		"SSC_IRQ_0", /* GPIO_117 */
+		"SSC_IRQ_1", /* GPIO_118 */
+		"SSC_IRQ_2", /* GPIO_119 */
+		"NC", /* GPIO_120 */
+		"GPIO121", /* GPIO_121, S HSEC pin 2 */
+		"NC", /* GPIO_122 */
+		"SSC_IRQ_6", /* GPIO_123 */
+		"SSC_IRQ_7", /* GPIO_124 */
+		"GPIO-C", /* GPIO_125, TS_INT0, LSEC pin 25 */
+		"BOOT_CONFIG5", /* GPIO_126 */
+		"NC", /* GPIO_127 */
+		"NC", /* GPIO_128 */
+		"BOOT_CONFIG7", /* GPIO_129 */
+		"PCIE1_RST_N", /* GPIO_130 */
+		"PCIE1_CLKREQ_N", /* GPIO_131 */
+		"PCIE1_WAKE", /* GPIO_132 */
+		"GPIO-L", /* GPIO_133, CAM2_STANDBY_N, LSEC pin 34 */
+		"NC", /* GPIO_134 */
+		"NC", /* GPIO_135 */
+		"BOOT_CONFIG8", /* GPIO_136 */
+		"NC", /* GPIO_137 */
+		"NC", /* GPIO_138 */
+		"GPS_SSBI2", /* GPIO_139 */
+		"GPS_SSBI1", /* GPIO_140 */
+		"NC", /* GPIO_141 */
+		"NC", /* GPIO_142 */
+		"NC", /* GPIO_143 */
+		"BOOT_CONFIG6", /* GPIO_144 */
+		"NC", /* GPIO_145 */
+		"NC", /* GPIO_146 */
+		"NC", /* GPIO_147 */
+		"NC", /* GPIO_148 */
+		"NC"; /* GPIO_149 */
+};
 
-		qcom,spmi@400f000 {
-			pmic@0 {
-				gpios@c000 {
-					gpio-line-names =
-						"NC",
-						"KEY_VOLP_N",
-						"NC",
-						"BL1_PWM",
-						"GPIO-F", /* BL0_PWM, LSEC pin 28 */
-						"BL1_EN",
-						"NC",
-						"WLAN_EN",
-						"NC",
-						"NC",
-						"NC",
-						"NC",
-						"NC",
-						"NC",
-						"DIVCLK1",
-						"DIVCLK2",
-						"DIVCLK3",
-						"DIVCLK4",
-						"BT_EN",
-						"PMIC_SLB",
-						"PMIC_BUA",
-						"USB_VBUS_DET";
-				};
-
-				mpps@a000 {
-					gpio-line-names =
-						"VDDPX_BIAS",
-						"WIFI_LED",
-						"NC",
-						"BT_LED",
-						"PM_MPP05",
-						"PM_MPP06",
-						"PM_MPP07",
-						"NC";
-				};
-			};
+&pm8994_gpios {
+	gpio-line-names =
+		"NC",
+		"KEY_VOLP_N",
+		"NC",
+		"BL1_PWM",
+		"GPIO-F", /* BL0_PWM, LSEC pin 28 */
+		"BL1_EN",
+		"NC",
+		"WLAN_EN",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"DIVCLK1",
+		"DIVCLK2",
+		"DIVCLK3",
+		"DIVCLK4",
+		"BT_EN",
+		"PMIC_SLB",
+		"PMIC_BUA",
+		"USB_VBUS_DET";
+};
 
-			pmic@2 {
-				gpios@c000 {
-					gpio-line-names =
-						"NC",
-						"SPKR_AMP_EN1",
-						"SPKR_AMP_EN2",
-						"TP61",
-						"NC",
-						"USB2_VBUS_DET",
-						"NC",
-						"NC",
-						"NC",
-						"NC";
-				};
-			};
-		};
+&pm8994_mpps {
+	gpio-line-names =
+		"VDDPX_BIAS",
+		"WIFI_LED",
+		"NC",
+		"BT_LED",
+		"PM_MPP05",
+		"PM_MPP06",
+		"PM_MPP07",
+		"NC";
+};
 
-		phy@34000 {
-			status = "okay";
-		};
+&pmi8994_gpios {
+	gpio-line-names =
+		"NC",
+		"SPKR_AMP_EN1",
+		"SPKR_AMP_EN2",
+		"TP61",
+		"NC",
+		"USB2_VBUS_DET",
+		"NC",
+		"NC",
+		"NC",
+		"NC";
+};
 
-		phy@7410000 {
-			status = "okay";
-		};
+&pcie_phy {
+	status = "okay";
+};
 
-		phy@7411000 {
-			status = "okay";
-		};
+&usb3phy {
+	status = "okay";
+};
 
-		phy@7412000 {
-			status = "okay";
-		};
+&hsusb_phy1 {
+	status = "okay";
+};
 
-		usb@6af8800 {
-			status = "okay";
-			extcon = <&usb3_id>;
+&hsusb_phy2 {
+	status = "okay";
+};
 
-			dwc3@6a00000 {
-				extcon = <&usb3_id>;
-				dr_mode = "otg";
-			};
-		};
+&usb3 {
+	status = "okay";
+	extcon = <&usb3_id>;
 
-		usb@76f8800 {
-			status = "okay";
-			extcon = <&usb2_id>;
+	dwc3@6a00000 {
+		extcon = <&usb3_id>;
+		dr_mode = "otg";
+	};
+};
 
-			dwc3@7600000 {
-				extcon = <&usb2_id>;
-				dr_mode = "otg";
-				maximum-speed = "high-speed";
-			};
-		};
+&usb2 {
+	status = "okay";
+	extcon = <&usb2_id>;
 
-		agnoc@0 {
-			pcie@600000 {
-				status = "okay";
-				perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
-				vddpe-3v3-supply = <&wlan_en>;
-			};
+	dwc3@7600000 {
+		extcon = <&usb2_id>;
+		dr_mode = "otg";
+		maximum-speed = "high-speed";
+	};
+};
 
-			pcie@608000 {
-				status = "okay";
-				perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
-			};
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
+	vddpe-3v3-supply = <&wlan_en>;
+};
 
-			pcie@610000 {
-				status = "okay";
-				perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
-			};
-		};
+&pcie1 {
+	status = "okay";
+	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
+};
 
-		slim_msm: slim@91c0000 {
-			ngd@1 {
-				wcd9335: codec@1{
-					clock-names = "mclk", "slimbus";
-					clocks = <&div1_mclk>,
-						 <&rpmcc RPM_SMD_BB_CLK1>;
-				};
-			};
-		};
+&pcie2 {
+	status = "okay";
+	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
+};
 
-		mdss@900000 {
-			status = "okay";
+&wcd9335 {
+	clock-names = "mclk", "slimbus";
+	clocks = <&div1_mclk>,
+		 <&rpmcc RPM_SMD_BB_CLK1>;
+};
 
-			mdp@901000 {
-				status = "okay";
-			};
+&mdss {
+	status = "okay";
+};
 
-			hdmi-phy@9a0600 {
-				status = "okay";
+&mdp {
+	status = "okay";
+};
 
-				vddio-supply = <&pm8994_l12>;
-				vcca-supply = <&pm8994_l28>;
-				#phy-cells = <0>;
-			};
+&hdmi_phy {
+	status = "okay";
 
-			hdmi-tx@9a0000 {
-				status = "okay";
+	vddio-supply = <&pm8994_l12>;
+	vcca-supply = <&pm8994_l28>;
+	#phy-cells = <0>;
+};
 
-				pinctrl-names = "default", "sleep";
-				pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
-				pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
+&hdmi {
+	status = "okay";
 
-				core-vdda-supply = <&pm8994_l12>;
-				core-vcc-supply = <&pm8994_s4>;
-			};
-		};
-	};
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
 
+	core-vdda-supply = <&pm8994_l12>;
+	core-vcc-supply = <&pm8994_s4>;
+};
 
+/ {
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c1b0d4..36f161547aa6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1443,7 +1443,7 @@
 			};
 		};
 
-		phy@34000 {
+		pcie_phy: phy@34000 {
 			compatible = "qcom,msm8996-qmp-pcie-phy";
 			reg = <0x34000 0x488>;
 			#clock-cells = <1>;
@@ -1505,7 +1505,7 @@
 			};
 		};
 
-		phy@7410000 {
+		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
 			reg = <0x7410000 0x1c4>;
 			#clock-cells = <1>;
-- 
2.23.0

