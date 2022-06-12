Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB60547CD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 00:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236530AbiFLWdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jun 2022 18:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237292AbiFLWdK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jun 2022 18:33:10 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51310186C9
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:07 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h19so5054084edj.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jun 2022 15:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5r2jX1NRw8l4yEIr0s6m6XSJvuObgjeUKX1+q07TNao=;
        b=rdWDY1+hudfr+zgnuNA3+YkHhlagP80qgytD0WEcFkdI5qiqoiDMREH1PoU4BmpSmD
         M2pLR2k7kKpDGTodghQlNMBrRlJolFT2DiWpbRZbTRpTif9/GN6jRpzM4TS4kJyhwqbR
         dQRyXpKYI3myDgxqk8V4dzGlV8yTCsnzEwXmicF5L8j5oATPDTNe2StlVCIM+GULF8L7
         cnQS56adVO6m0pSsGfbhQ7Z4Fr8h/BdpwcOgzQvnPv+DrbKDXDuw0XGdHdVVYosdmqMQ
         CH+41GZQUbOm8il1A37ygsBYuCHZ4Z6xJVr0LhvoBhO1eqpjaIQPHN92mrk7ftXRjKgJ
         7NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5r2jX1NRw8l4yEIr0s6m6XSJvuObgjeUKX1+q07TNao=;
        b=3tDCr2orFY49To3AVJ4V3IU1dy4y5a7euIJdI3ZafaTsIuvpC169UzKvJFDAPmIJW+
         GAE1YmX4J+NcGGhx4ZxPZ78LnpIkVDutnUCp78UI3aGqJ0hFrzeWHBLOxIgYYjM8CzDq
         pyFPnQh3oTTe208REDU8iLlQZDgTCXZwLmmYqYLKjKdUQMrHxVaWnq9KcAGdMPASFdf7
         Z2cJQzS6hsLSiI/ynaz+s87PaDmvT6bFC5rMR6fYbH9EO3S1vDvuOKysPLTpgwo1NziI
         l8BM3+uw68g3g4PDQStxjeybWd6sVeYE6g87uQ1pmfi3dtnuma38FgNOBw7anaPvCDcc
         3lTw==
X-Gm-Message-State: AOAM533QWW/H1TqnmcxuRRxT93zNA7KKfpghwdlGoMxb7H3W0q747OJf
        us7W4yBNtPUG2AUFM6djJD7LKQ==
X-Google-Smtp-Source: ABdhPJzGQEYW11h0DqLonLG3Aj17JpIBr8vvqZ3tME1FBmSzAi55bqNIuaTMSnBE98H5U1PpuVmMig==
X-Received: by 2002:a05:6402:278d:b0:42e:d3d5:922e with SMTP id b13-20020a056402278d00b0042ed3d5922emr53014372ede.154.1655073186130;
        Sun, 12 Jun 2022 15:33:06 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056402104300b0042b5cf75d6esm3766559edu.97.2022.06.12.15.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 15:33:05 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/6] arm64: dts: freescale: Add missing space around properties
Date:   Mon, 13 Jun 2022 00:31:58 +0200
Message-Id: <20220612223201.2740248-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing space around properties before the typo spreads to other
files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi            | 6 +++---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi                 | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi                 | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi                 | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mq.dtsi                 | 2 +-
 .../arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi                | 6 +++---
 8 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 92465f7776035a14..d4b719c8a0b93faf 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -120,13 +120,13 @@ pmu {
 	};
 
 	gic: interrupt-controller@6000000 {
-		compatible= "arm,gic-v3";
+		compatible = "arm,gic-v3";
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		reg= <0x0 0x06000000 0 0x10000>, /* GIC Dist */
+		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
 			<0x0 0x06040000 0 0x40000>; /* GIC Redistributor */
-		#interrupt-cells= <3>;
+		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
 					 IRQ_TYPE_LEVEL_LOW)>;
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index a79f42a9618ec55f..3e335b4664980189 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -54,7 +54,7 @@ usdhc2: mmc@5b020000 {
 		clock-names = "ipg", "per", "ahb";
 		power-domains = <&pd IMX_SC_R_SDHC_1>;
 		fsl,tuning-start-tap = <20>;
-		fsl,tuning-step= <2>;
+		fsl,tuning-step = <2>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 1bf070473829244d..eb02244fa55441be 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -212,7 +212,7 @@ clk_ext3: clock-ext3 {
 	clk_ext4: clock-ext4 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <133000000>;
+		clock-frequency = <133000000>;
 		clock-output-names = "clk_ext4";
 	};
 
@@ -995,7 +995,7 @@ usdhc1: mmc@30b40000 {
 					 <&clk IMX8MM_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -1009,7 +1009,7 @@ usdhc2: mmc@30b50000 {
 					 <&clk IMX8MM_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -1023,7 +1023,7 @@ usdhc3: mmc@30b60000 {
 					 <&clk IMX8MM_CLK_USDHC3_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index e41e1d56f980d511..130c6d90dd79bb4d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -212,7 +212,7 @@ clk_ext3: clock-ext3 {
 	clk_ext4: clock-ext4 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <133000000>;
+		clock-frequency = <133000000>;
 		clock-output-names = "clk_ext4";
 	};
 
@@ -941,7 +941,7 @@ usdhc1: mmc@30b40000 {
 					 <&clk IMX8MN_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -955,7 +955,7 @@ usdhc2: mmc@30b50000 {
 					 <&clk IMX8MN_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -969,7 +969,7 @@ usdhc3: mmc@30b60000 {
 					 <&clk IMX8MN_CLK_USDHC3_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index d9542dfff83fba78..b2f4a5f1f73cbe15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -195,7 +195,7 @@ clk_ext3: clock-ext3 {
 	clk_ext4: clock-ext4 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <133000000>;
+		clock-frequency = <133000000>;
 		clock-output-names = "clk_ext4";
 	};
 
@@ -903,7 +903,7 @@ usdhc1: mmc@30b40000 {
 					 <&clk IMX8MP_CLK_USDHC1_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -917,7 +917,7 @@ usdhc2: mmc@30b50000 {
 					 <&clk IMX8MP_CLK_USDHC2_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -931,7 +931,7 @@ usdhc3: mmc@30b60000 {
 					 <&clk IMX8MP_CLK_USDHC3_ROOT>;
 				clock-names = "ipg", "ahb", "per";
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 49eadb081b19860e..0c74c2a4a40f7615 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -94,7 +94,7 @@ clk_ext3: clock-ext3 {
 	clk_ext4: clock-ext4 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <133000000>;
+		clock-frequency = <133000000>;
 		clock-output-names = "clk_ext4";
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
index 144fc9e82da751c6..e3f161a10448e007 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi
@@ -38,17 +38,17 @@ rtc_i2c: rtc@68 {
 
 /* Colibri UART_B */
 &lpuart0 {
-	status= "okay";
+	status = "okay";
 };
 
 /* Colibri UART_C */
 &lpuart2 {
-	status= "okay";
+	status = "okay";
 };
 
 /* Colibri UART_A */
 &lpuart3 {
-	status= "okay";
+	status = "okay";
 };
 
 /* Colibri FastEthernet */
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 09f7364dd1d05a11..ba281e689cf6ed26 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -331,7 +331,7 @@ usdhc0: mmc@298d0000 {
 				clock-names = "ipg", "ahb", "per";
 				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC0>;
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -346,7 +346,7 @@ usdhc1: mmc@298e0000 {
 				clock-names = "ipg", "ahb", "per";
 				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC1>;
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
@@ -361,7 +361,7 @@ usdhc2: mmc@298f0000 {
 				clock-names = "ipg", "ahb", "per";
 				power-domains = <&scmi_devpd IMX8ULP_PD_USDHC2_USB1>;
 				fsl,tuning-start-tap = <20>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				bus-width = <4>;
 				status = "disabled";
 			};
-- 
2.36.1

