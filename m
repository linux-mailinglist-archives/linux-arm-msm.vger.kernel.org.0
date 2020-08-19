Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA51124A8F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 00:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgHSWSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 18:18:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37767 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHSWR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 18:17:59 -0400
Received: by mail-io1-f68.google.com with SMTP id b16so361506ioj.4;
        Wed, 19 Aug 2020 15:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWd16XTGelFWCGWXQuxV/9tOBBIs8pfdMBMj8iZBZyo=;
        b=GfRWCdKkSVPDDgma35Mv7g10YBl5C24BXxNWqBDZu7INKIDFsELsBfkQ8H8ZPbYbs6
         lqQjeTQP2IyrApzY18mjjkwXvZhyD3DJN78CFPzELVGmDuCXB9VnkGSpo2yJCva3KVSs
         Ae1dGgo8lmrAtfHM3xhUgi69vnF1+IJs3yRFdhjZJZEWWsn1GLPCwoVr4AAKqklraalB
         Q7y32QtRLrBfbYyAWEu+IzpPpsFAPCgUk3KVC7hKsUH9LSgMbjGk5tnHLNbpXPUKzJiN
         JYxqDolMXM74Ih83Qkn7nF63iL/znM5FCYyhGMm1iWFmJrgraCk9DKn8b0R9lcFvpSR1
         BFqg==
X-Gm-Message-State: AOAM530KEGA172XcFiJDl4t0DiujKtPBxfhmzkTFeHpBgsQkqCwDaKUN
        sAvgsKwnSYex8CYsoZcc3w==
X-Google-Smtp-Source: ABdhPJwyYSdB2Vgsxw85RkevlfJtvSDTFAV2MUqzcWoY+K/hBNbSP4jmUdl5NVe+Om8h6hf9s3lfdQ==
X-Received: by 2002:a05:6638:2391:: with SMTP id q17mr495961jat.31.1597875475391;
        Wed, 19 Aug 2020 15:17:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
        by smtp.googlemail.com with ESMTPSA id t81sm10468iod.7.2020.08.19.15.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 15:17:54 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Robert Richter <rrichter@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
Date:   Wed, 19 Aug 2020 16:17:50 -0600
Message-Id: <20200819221750.2055932-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While bracketing doesn't matter for a DTB, the DT schema checks rely on
bracketing around each distinct entry. Reformat ranges and dma-ranges
entries to fix warnings such as:

arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under any of the given schemas (Possible causes of the failure):
        arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: True was expected
        arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
        arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472]

Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Robert Richter <rrichter@marvell.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Tero Kristo <t-kristo@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
SoC maintainers, please apply this directly.

 .../boot/dts/amlogic/meson-g12-common.dtsi    |  4 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi    | 20 ++++----
 arch/arm64/boot/dts/apm/apm-storm.dtsi        | 50 +++++++++----------
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |  4 +-
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  4 +-
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 22 ++++----
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  6 +--
 .../boot/dts/freescale/fsl-ls1043a-rdb.dts    |  6 +--
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 12 ++---
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    |  6 +--
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    |  4 +-
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 12 ++---
 .../boot/dts/freescale/fsl-ls1088a-qds.dts    |  6 +--
 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    |  4 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 16 +++---
 .../arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 16 +++---
 .../arm64/boot/dts/freescale/fsl-ls2088a.dtsi | 16 +++---
 .../boot/dts/freescale/fsl-ls208xa-qds.dtsi   |  6 +--
 .../boot/dts/freescale/fsl-ls208xa-rdb.dtsi   |  6 +--
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 10 ++--
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |  4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  8 +--
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |  4 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  5 +-
 arch/arm64/boot/dts/hisilicon/hip07.dtsi      |  4 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |  4 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         | 12 ++---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  4 +-
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      |  8 +--
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  4 +-
 30 files changed, 141 insertions(+), 146 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..cc7811df91f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -134,8 +134,8 @@ pcie: pcie@fc000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
-				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
+			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
+				 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
 
 			clocks = <&clkc CLKID_PCIE_PHY
 				  &clkc CLKID_PCIE_COMB
diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 3feb1881bbc2..6684955d3fcc 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -617,11 +617,11 @@ pcie0: pcie@1f2b0000 {
 			reg = < 0x00 0x1f2b0000 0x0 0x00010000   /* Controller registers */
 				0xc0 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xc0 0x10000000 0x00 0x00010000   /* io */
-				  0x02000000 0x00 0x20000000 0xc1 0x20000000 0x00 0x20000000   /* mem */
-				  0x43000000 0xe0 0x00000000 0xe0 0x00000000 0x20 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xc0 0x10000000 0x00 0x00010000>, /* io */
+				 <0x02000000 0x00 0x20000000 0xc1 0x20000000 0x00 0x20000000>, /* mem */
+				 <0x43000000 0xe0 0x00000000 0xe0 0x00000000 0x20 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 0x10 0x4
@@ -643,11 +643,11 @@ pcie1: pcie@1f2c0000 {
 			reg = < 0x00 0x1f2c0000 0x0 0x00010000   /* Controller registers */
 				0xa0 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xa0 0x10000000 0x00 0x00010000   /* io */
-				  0x02000000 0x00 0x20000000 0xa1 0x20000000 0x00 0x20000000   /* mem */
-				  0x43000000 0xb0 0x00000000 0xb0 0x00000000 0x10 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xa0 0x10000000 0x00 0x00010000>, /* io */
+				 <0x02000000 0x00 0x20000000 0xa1 0x20000000 0x00 0x20000000>, /* mem */
+				 <0x43000000 0xb0 0x00000000 0xb0 0x00000000 0x10 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0x0 0x0 0x16 0x4
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 8c802d87e751..e8d7adcbc4ae 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -617,11 +617,11 @@ pcie0: pcie@1f2b0000 {
 			reg = < 0x00 0x1f2b0000 0x0 0x00010000   /* Controller registers */
 				0xe0 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xe0 0x10000000 0x00 0x00010000   /* io */
-				  0x02000000 0x00 0x80000000 0xe1 0x80000000 0x00 0x80000000   /* mem */
-				  0x43000000 0xf0 0x00000000 0xf0 0x00000000 0x10 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xe0 0x10000000 0x00 0x00010000>, /* io */
+				 <0x02000000 0x00 0x80000000 0xe1 0x80000000 0x00 0x80000000>, /* mem */
+				 <0x43000000 0xf0 0x00000000 0xf0 0x00000000 0x10 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xc2 0x4
@@ -643,11 +643,11 @@ pcie1: pcie@1f2c0000 {
 			reg = < 0x00 0x1f2c0000 0x0 0x00010000   /* Controller registers */
 				0xd0 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xd0 0x10000000 0x00 0x00010000   /* io  */
-				  0x02000000 0x00 0x80000000 0xd1 0x80000000 0x00 0x80000000   /* mem */
-				  0x43000000 0xd8 0x00000000 0xd8 0x00000000 0x08 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xd0 0x10000000 0x00 0x00010000>, /* io  */
+				 <0x02000000 0x00 0x80000000 0xd1 0x80000000 0x00 0x80000000>, /* mem */
+				 <0x43000000 0xd8 0x00000000 0xd8 0x00000000 0x08 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xc8 0x4
@@ -669,11 +669,11 @@ pcie2: pcie@1f2d0000 {
 			reg =  < 0x00 0x1f2d0000 0x0 0x00010000   /* Controller registers */
 				 0x90 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0x90 0x10000000 0x00 0x00010000   /* io  */
-				  0x02000000 0x00 0x80000000 0x91 0x80000000 0x00 0x80000000   /* mem */
-				  0x43000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0x90 0x10000000 0x00 0x00010000>, /* io  */
+				 <0x02000000 0x00 0x80000000 0x91 0x80000000 0x00 0x80000000>, /* mem */
+				 <0x43000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xce 0x4
@@ -695,11 +695,11 @@ pcie3: pcie@1f500000 {
 			reg = < 0x00 0x1f500000 0x0 0x00010000   /* Controller registers */
 				0xa0 0xd0000000 0x0 0x00040000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xa0 0x10000000 0x00 0x00010000   /* io  */
-				  0x02000000 0x00 0x80000000 0xa1 0x80000000 0x00 0x80000000   /* mem */
-				  0x43000000 0xb0 0x00000000 0xb0 0x00000000 0x10 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xa0 0x10000000 0x00 0x00010000>, /* io  */
+				 <0x02000000 0x00 0x80000000 0xa1 0x80000000 0x00 0x80000000>, /* mem */
+				 <0x43000000 0xb0 0x00000000 0xb0 0x00000000 0x10 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xd4 0x4
@@ -721,11 +721,11 @@ pcie4: pcie@1f510000 {
 			reg = < 0x00 0x1f510000 0x0 0x00010000   /* Controller registers */
 				0xc0 0xd0000000 0x0 0x00200000>; /* PCI config space */
 			reg-names = "csr", "cfg";
-			ranges = <0x01000000 0x00 0x00000000 0xc0 0x10000000 0x00 0x00010000   /* io  */
-				  0x02000000 0x00 0x80000000 0xc1 0x80000000 0x00 0x80000000   /* mem */
-				  0x43000000 0xc8 0x00000000 0xc8 0x00000000 0x08 0x00000000>; /* mem */
-			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000
-				      0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
+			ranges = <0x01000000 0x00 0x00000000 0xc0 0x10000000 0x00 0x00010000>, /* io  */
+				 <0x02000000 0x00 0x80000000 0xc1 0x80000000 0x00 0x80000000>, /* mem */
+				 <0x43000000 0xc8 0x00000000 0xc8 0x00000000 0x08 0x00000000>; /* mem */
+			dma-ranges = <0x42000000 0x80 0x00000000 0x80 0x00000000 0x00 0x80000000>,
+				     <0x42000000 0x00 0x00000000 0x00 0x00000000 0x80 0x00000000>;
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &gic 0x0 0xda 0x4
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
index dfb41705a9a9..707e7d2d2a0f 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
@@ -112,8 +112,8 @@ pcie@30000000 {
 		 *   MEM64 pref 0x40_0000_0000 - 0x60_0000_0000
 		 */
 		ranges =
-		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
-		   0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
+		  <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000>,
+		  <0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
 		bus-range = <0 0xff>;
 		interrupt-map-mask = <0 0 0 7>;
 		interrupt-map =
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index ff19ec415b60..0b2a65fd094f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -502,8 +502,8 @@ pcie: pcie@3400000 {
 			device_type = "pci";
 			num-viewport = <2>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index 0efeb8fa773e..7ac7a425b95f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -567,8 +567,8 @@ pcie@3400000 {
 			dma-coherent;
 			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -594,8 +594,8 @@ pcie@3500000 {
 			dma-coherent;
 			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -886,19 +886,19 @@ pcie@1f0000000 { /* Integrated Endpoint Root Complex */
 			msi-map = <0 &its 0x17 0xe>;
 			iommu-map = <0 &smmu 0x17 0xe>;
 				  /* PF0-6 BAR0 - non-prefetchable memory */
-			ranges = <0x82000000 0x0 0x00000000  0x1 0xf8000000  0x0 0x160000
+			ranges = <0x82000000 0x0 0x00000000  0x1 0xf8000000  0x0 0x160000>,
 				  /* PF0-6 BAR2 - prefetchable memory */
-				  0xc2000000 0x0 0x00000000  0x1 0xf8160000  0x0 0x070000
+				 <0xc2000000 0x0 0x00000000  0x1 0xf8160000  0x0 0x070000>,
 				  /* PF0: VF0-1 BAR0 - non-prefetchable memory */
-				  0x82000000 0x0 0x00000000  0x1 0xf81d0000  0x0 0x020000
+				 <0x82000000 0x0 0x00000000  0x1 0xf81d0000  0x0 0x020000>,
 				  /* PF0: VF0-1 BAR2 - prefetchable memory */
-				  0xc2000000 0x0 0x00000000  0x1 0xf81f0000  0x0 0x020000
+				 <0xc2000000 0x0 0x00000000  0x1 0xf81f0000  0x0 0x020000>,
 				  /* PF1: VF0-1 BAR0 - non-prefetchable memory */
-				  0x82000000 0x0 0x00000000  0x1 0xf8210000  0x0 0x020000
+				 <0x82000000 0x0 0x00000000  0x1 0xf8210000  0x0 0x020000>,
 				  /* PF1: VF0-1 BAR2 - prefetchable memory */
-				  0xc2000000 0x0 0x00000000  0x1 0xf8230000  0x0 0x020000
+				 <0xc2000000 0x0 0x00000000  0x1 0xf8230000  0x0 0x020000>,
 				  /* BAR4 (PF5) - non-prefetchable memory */
-				  0x82000000 0x0 0x00000000  0x1 0xfc000000  0x0 0x400000>;
+				 <0x82000000 0x0 0x00000000  0x1 0xfc000000  0x0 0x400000>;
 
 			enetc_port0: ethernet@0,0 {
 				compatible = "fsl,enetc";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index fea167d222cf..751ab6e047f2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -43,9 +43,9 @@ &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
 	/* NOR, NAND Flashes and FPGA on board */
-	ranges = <0x0 0x0 0x0 0x60000000 0x08000000
-		  0x1 0x0 0x0 0x7e800000 0x00010000
-		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000>,
+		 <0x1 0x0 0x0 0x7e800000 0x00010000>,
+		 <0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
 	nor@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 3516af4726a5..4b7a0573ebd3 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -57,9 +57,9 @@ &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
 	/* NOR, NAND Flashes and FPGA on board */
-	ranges = <0x0 0x0 0x0 0x60000000 0x08000000
-		  0x1 0x0 0x0 0x7e800000 0x00010000
-		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000>,
+		 <0x1 0x0 0x0 0x7e800000 0x00010000>,
+		 <0x2 0x0 0x0 0x7fb00000 0x00000100>;
 
 		nor@0,0 {
 			compatible = "cfi-flash";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 5c2e370f6316..9900811a8f22 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -828,8 +828,8 @@ pcie@3400000 {
 			dma-coherent;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -854,8 +854,8 @@ pcie@3500000 {
 			dma-coherent;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -880,8 +880,8 @@ pcie@3600000 {
 			dma-coherent;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index eec62c63dafe..c6f4d5fc172a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -134,9 +134,9 @@ &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
 	/* NOR, NAND Flashes and FPGA on board */
-	ranges = <0x0 0x0 0x0 0x60000000 0x08000000
-		  0x1 0x0 0x0 0x7e800000 0x00010000
-		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000>,
+		 <0x1 0x0 0x0 0x7e800000 0x00010000>,
+		 <0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
 	nor@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index d53ccc56bb63..d2dd1fd5427e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -81,8 +81,8 @@ &ifc {
 	#address-cells = <2>;
 	#size-cells = <1>;
 	/* NAND Flashe and CPLD on board */
-	ranges = <0x0 0x0 0x0 0x7e800000 0x00010000
-		  0x2 0x0 0x0 0x7fb00000 0x00000100>;
+	ranges = <0x0 0x0 0x0 0x7e800000 0x00010000>,
+		 <0x2 0x0 0x0 0x7fb00000 0x00000100>;
 	status = "okay";
 
 	nand@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 0246d975a206..4360459507c4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -732,8 +732,8 @@ pcie@3400000 {
 			dma-coherent;
 			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -768,8 +768,8 @@ pcie@3500000 {
 			dma-coherent;
 			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi2>, <&msi3>, <&msi1>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -804,8 +804,8 @@ pcie@3600000 {
 			dma-coherent;
 			num-viewport = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&msi3>, <&msi1>, <&msi2>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
index 41d8b15f25a5..b7670ff98b32 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
@@ -108,9 +108,9 @@ eeprom@57 {
 };
 
 &ifc {
-	ranges = <0 0 0x5 0x80000000 0x08000000
-		  2 0 0x5 0x30000000 0x00010000
-		  3 0 0x5 0x20000000 0x00010000>;
+	ranges = <0 0 0x5 0x80000000 0x08000000>,
+		 <2 0 0x5 0x30000000 0x00010000>,
+		 <3 0 0x5 0x20000000 0x00010000>;
 	status = "okay";
 
 	nor@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 5633e59febc3..dcf1904e9373 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -59,8 +59,8 @@ rtc@51 {
 };
 
 &ifc {
-	ranges = <0 0 0x5 0x30000000 0x00010000
-		  2 0 0x5 0x20000000 0x00010000>;
+	ranges = <0 0 0x5 0x30000000 0x00010000>,
+		 <2 0 0x5 0x20000000 0x00010000>;
 	status = "okay";
 
 	nand@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 169f4742ae3b..78688a0b2bb4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -486,8 +486,8 @@ pcie@3400000 {
 			dma-coherent;
 			num-viewport = <256>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x20 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x20 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -512,8 +512,8 @@ pcie@3500000 {
 			dma-coherent;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x28 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x28 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -538,8 +538,8 @@ pcie@3600000 {
 			dma-coherent;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000   /* downstream I/O */
-				  0x82000000 0x0 0x40000000 0x30 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000>, /* downstream I/O */
+				 <0x82000000 0x0 0x40000000 0x30 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 			msi-parent = <&its>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -724,8 +724,8 @@ fsl_mc: fsl-mc@80c000000 {
 			 * Region type 0x0 - MC portals
 			 * Region type 0x1 - QBMAN portals
 			 */
-			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
-				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
+			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000>,
+				 <0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
 
 			dpmacs {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index f9c1d30cf4a7..4ee9ccc55869 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -122,30 +122,30 @@ &pcie1 {
 	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 	       0x10 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x10 0x00010000 0x0 0x00010000   /* downstream I/O */
-		  0x82000000 0x0 0x40000000 0x10 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+	ranges = <0x81000000 0x0 0x00000000 0x10 0x00010000 0x0 0x00010000>, /* downstream I/O */
+		 <0x82000000 0x0 0x40000000 0x10 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 };
 
 &pcie2 {
 	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 	       0x12 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x12 0x00010000 0x0 0x00010000   /* downstream I/O */
-		  0x82000000 0x0 0x40000000 0x12 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+	ranges = <0x81000000 0x0 0x00000000 0x12 0x00010000 0x0 0x00010000>, /* downstream I/O */
+		 <0x82000000 0x0 0x40000000 0x12 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 };
 
 &pcie3 {
 	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 	       0x14 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x14 0x00010000 0x0 0x00010000   /* downstream I/O */
-		  0x82000000 0x0 0x40000000 0x14 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+	ranges = <0x81000000 0x0 0x00000000 0x14 0x00010000 0x0 0x00010000>, /* downstream I/O */
+		 <0x82000000 0x0 0x40000000 0x14 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 };
 
 &pcie4 {
 	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
 	       0x16 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x16 0x00010000 0x0 0x00010000   /* downstream I/O */
-		  0x82000000 0x0 0x40000000 0x16 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+	ranges = <0x81000000 0x0 0x00000000 0x16 0x00010000 0x0 0x00010000>, /* downstream I/O */
+		 <0x82000000 0x0 0x40000000 0x16 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
index a5f668d786b8..624802feed15 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
@@ -123,8 +123,8 @@ &pcie1 {
 	reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 	       0x20 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x20 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x0 0x00000000 0x20 0x00010000 0x0 0x00010000>,
+		 <0x82000000 0x0 0x40000000 0x20 0x40000000 0x0 0x40000000>;
 };
 
 &pcie2 {
@@ -132,8 +132,8 @@ &pcie2 {
 	reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 	       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x28 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x0 0x00000000 0x28 0x00010000 0x0 0x00010000>,
+		 <0x82000000 0x0 0x40000000 0x28 0x40000000 0x0 0x40000000>;
 };
 
 &pcie3 {
@@ -141,8 +141,8 @@ &pcie3 {
 	reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 	       0x30 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x30 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x0 0x00000000 0x30 0x00010000 0x0 0x00010000>,
+		 <0x82000000 0x0 0x40000000 0x30 0x40000000 0x0 0x40000000>;
 };
 
 &pcie4 {
@@ -150,6 +150,6 @@ &pcie4 {
 	reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
 	       0x38 0x00000000 0x0 0x00002000>; /* configuration space */
 
-	ranges = <0x81000000 0x0 0x00000000 0x38 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x38 0x40000000 0x0 0x40000000>;
+	ranges = <0x81000000 0x0 0x00000000 0x38 0x00010000 0x0 0x00010000>,
+		 <0x82000000 0x0 0x40000000 0x38 0x40000000 0x0 0x40000000>;
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
index 10d2fe091965..55fb4009e597 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
@@ -18,9 +18,9 @@ &ifc {
 	status = "okay";
 	#address-cells = <2>;
 	#size-cells = <1>;
-	ranges = <0x0 0x0 0x5 0x80000000 0x08000000
-		  0x2 0x0 0x5 0x30000000 0x00010000
-		  0x3 0x0 0x5 0x20000000 0x00010000>;
+	ranges = <0x0 0x0 0x5 0x80000000 0x08000000>,
+		 <0x2 0x0 0x5 0x30000000 0x00010000>,
+		 <0x3 0x0 0x5 0x20000000 0x00010000>;
 
 	nor@0,0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
index d0d670227ae2..a24be154fa0f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
@@ -17,9 +17,9 @@ &ifc {
 	status = "okay";
 	#address-cells = <2>;
 	#size-cells = <1>;
-	ranges = <0x0 0x0 0x5 0x80000000 0x08000000
-		  0x2 0x0 0x5 0x30000000 0x00010000
-		  0x3 0x0 0x5 0x20000000 0x00010000>;
+	ranges = <0x0 0x0 0x5 0x80000000 0x08000000>,
+		 <0x2 0x0 0x5 0x30000000 0x00010000>,
+		 <0x3 0x0 0x5 0x20000000 0x00010000>;
 
 	nor@0,0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 41102dacc2e1..c6ee6d9f0f6a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -349,8 +349,8 @@ fsl_mc: fsl-mc@80c000000 {
 			 * Region type 0x0 - MC portals
 			 * Region type 0x1 - QBMAN portals
 			 */
-			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
-				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
+			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000>,
+				 <0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
 
 			/*
 			 * Define the maximum number of MACs present on the SoC.
@@ -613,9 +613,9 @@ ifc: ifc@2240000 {
 			#address-cells = <2>;
 			#size-cells = <1>;
 
-			ranges = <0 0 0x5 0x80000000 0x08000000
-				  2 0 0x5 0x30000000 0x00010000
-				  3 0 0x5 0x20000000 0x00010000>;
+			ranges = <0 0 0x5 0x80000000 0x08000000>,
+				 <2 0 0x5 0x30000000 0x00010000>,
+				 <3 0 0x5 0x20000000 0x00010000>;
 		};
 
 		qspi: spi@20c0000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index d247e4228d60..89447a6e6347 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1320,8 +1320,8 @@ fsl_mc: fsl-mc@80c000000 {
 			 * Region type 0x0 - MC portals
 			 * Region type 0x1 - QBMAN portals
 			 */
-			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
-				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
+			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000>,
+				 <0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
 
 			/*
 			 * Define the maximum number of MACs present on the SoC.
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index f70435cf9ad5..f0ce838acc9f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1189,8 +1189,8 @@ pcie0: pcie@33800000 {
 			#size-cells = <2>;
 			device_type = "pci";
 			bus-range = <0x00 0xff>;
-			ranges = <0x81000000 0 0x00000000 0x1ff80000 0 0x00010000 /* downstream I/O 64KB */
-			          0x82000000 0 0x18000000 0x18000000 0 0x07f00000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0 0x00000000 0x1ff80000 0 0x00010000>, /* downstream I/O 64KB */
+			         <0x82000000 0 0x18000000 0x18000000 0 0x07f00000>; /* non-prefetchable memory */
 			num-lanes = <1>;
 			num-viewport = <4>;
 			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
@@ -1218,8 +1218,8 @@ pcie1: pcie@33c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
-			ranges =  <0x81000000 0 0x00000000 0x27f80000 0 0x00010000 /* downstream I/O 64KB */
-				   0x82000000 0 0x20000000 0x20000000 0 0x07f00000>; /* non-prefetchable memory */
+			ranges =  <0x81000000 0 0x00000000 0x27f80000 0 0x00010000>, /* downstream I/O 64KB */
+				  <0x82000000 0 0x20000000 0x20000000 0 0x07f00000>; /* non-prefetchable memory */
 			num-lanes = <1>;
 			num-viewport = <4>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 12bc1d3ed424..ff06654c1f96 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -566,8 +566,8 @@ pcie: pcie@9860000 {
 			device_type = "pci";
 			bus-range = <0x00 0xff>;
 			num-lanes = <1>;
-			ranges = <0x81000000 0x0 0x00000000 0x4f00000 0x0 0x100000
-				  0x82000000 0x0 0x3000000 0x3000000 0x0 0x01f00000>;
+			ranges = <0x81000000 0x0 0x00000000 0x4f00000 0x0 0x100000>,
+				 <0x82000000 0x0 0x3000000 0x3000000 0x0 0x01f00000>;
 			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hip06.dtsi b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
index 50ceaa959bdc..33205a6dc87b 100644
--- a/arch/arm64/boot/dts/hisilicon/hip06.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip06.dtsi
@@ -737,9 +737,8 @@ pcie0: pcie@a0090000 {
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
-			ranges = <0x02000000 0 0xb2000000 0x0 0xb2000000 0
-				 0x5ff0000 0x01000000 0 0 0 0xb7ff0000
-				 0 0x10000>;
+			ranges = <0x02000000 0 0xb2000000 0x0 0xb2000000 0 0x5ff0000>,
+				 <0x01000000 0 0 0 0xb7ff0000 0 0x10000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0xf800 0 0 7>;
 			interrupt-map = <0x0 0 0 1 &mbigen_pcie0 650 4
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 4773a533fce5..915562c2e1d5 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1708,8 +1708,8 @@ p0_pcie2_a: pcie@a00a0000 {
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
-			ranges = <0x02000000 0 0xa8000000 0 0xa8000000 0 0x77f0000
-				  0x01000000 0 0 0 0xaf7f0000 0 0x10000>;
+			ranges = <0x02000000 0 0xa8000000 0 0xa8000000 0 0x77f0000>,
+				 <0x01000000 0 0 0 0xaf7f0000 0 0x10000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0xf800 0 0 7>;
 			interrupt-map = <0x0 0 0 1 &mbigen_pcie2_a 671 4
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 2bbc69b4dc99..72483bad470b 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -486,8 +486,8 @@ pcie0: pcie@d0070000 {
 			#interrupt-cells = <1>;
 			msi-parent = <&pcie0>;
 			msi-controller;
-			ranges = <0x82000000 0 0xe8000000   0 0xe8000000 0 0x1000000 /* Port 0 MEM */
-				  0x81000000 0 0xe9000000   0 0xe9000000 0 0x10000>; /* Port 0 IO*/
+			ranges = <0x82000000 0 0xe8000000   0 0xe8000000 0 0x1000000>, /* Port 0 MEM */
+				 <0x81000000 0 0xe9000000   0 0xe9000000 0 0x10000>;   /* Port 0 IO*/
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc 0>,
 					<0 0 0 2 &pcie_intc 1>,
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 96a5ec89b5f0..800054d32bf6 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -574,10 +574,8 @@ pcie1: pci@10000000 {
 			phys = <&pcie_phy1>;
 			phy-names = "pciephy";
 
-			ranges = <0x81000000 0 0x10200000 0x10200000
-				  0 0x100000   /* downstream I/O */
-				  0x82000000 0 0x10300000 0x10300000
-				  0 0xd00000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0 0x10200000 0x10200000 0 0x100000>, /* downstream I/O */
+				 <0x82000000 0 0x10300000 0x10300000 0 0xd00000>; /* non-prefetchable memory */
 
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
@@ -636,10 +634,8 @@ pcie0: pci@20000000 {
 			phys = <&pcie_phy0>;
 			phy-names = "pciephy";
 
-			ranges = <0x81000000 0 0x20200000 0x20200000
-				  0 0x100000   /* downstream I/O */
-				  0x82000000 0 0x20300000 0x20300000
-				  0 0xd00000>; /* non-prefetchable memory */
+			ranges = <0x81000000 0 0x20200000 0x20200000 0 0x100000>, /* downstream I/O */
+				 <0x82000000 0 0x20300000 0x20300000 0 0xd00000>; /* non-prefetchable memory */
 
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index ada724b12f01..48be19a0a9cb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -256,8 +256,8 @@ pcie0: pcie@f8000000 {
 		       <&pcie_phy 2>, <&pcie_phy 3>;
 		phy-names = "pcie-phy-0", "pcie-phy-1",
 			    "pcie-phy-2", "pcie-phy-3";
-		ranges = <0x83000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x1e00000
-			  0x81000000 0x0 0xfbe00000 0x0 0xfbe00000 0x0 0x100000>;
+		ranges = <0x83000000 0x0 0xfa000000 0x0 0xfa000000 0x0 0x1e00000>,
+			 <0x81000000 0x0 0xfbe00000 0x0 0xfbe00000 0x0 0x100000>;
 		resets = <&cru SRST_PCIE_CORE>, <&cru SRST_PCIE_MGMT>,
 			 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>,
 			 <&cru SRST_PCIE_PM>, <&cru SRST_P_PCIE>,
diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
index 9edfae5944f7..2c762e725d89 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
@@ -678,8 +678,8 @@ pcie0_rc: pcie@5500000 {
 		power-domains = <&k3_pds 120 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <3>;
 		#size-cells = <2>;
-		ranges = <0x81000000 0 0          0x0 0x10020000 0 0x00010000
-			  0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
+		ranges = <0x81000000 0 0          0x0 0x10020000 0 0x00010000>,
+			 <0x82000000 0 0x10030000 0x0 0x10030000 0 0x07FD0000>;
 		ti,syscon-pcie-id = <&pcie_devid>;
 		ti,syscon-pcie-mode = <&pcie0_mode>;
 		bus-range = <0x0 0xff>;
@@ -710,8 +710,8 @@ pcie1_rc: pcie@5600000 {
 		power-domains = <&k3_pds 121 TI_SCI_PD_EXCLUSIVE>;
 		#address-cells = <3>;
 		#size-cells = <2>;
-		ranges = <0x81000000 0 0          0x0   0x18020000 0 0x00010000
-			  0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
+		ranges = <0x81000000 0 0          0x0   0x18020000 0 0x00010000>,
+			 <0x82000000 0 0x18030000 0x0   0x18030000 0 0x07FD0000>;
 		ti,syscon-pcie-id = <&pcie_devid>;
 		ti,syscon-pcie-mode = <&pcie1_mode>;
 		bus-range = <0x0 0xff>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 9174ddc76bdc..cf2b9b2ee651 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -542,8 +542,8 @@ pcie: pcie@fd0e0000 {
 			      <0x0 0xfd480000 0x0 0x1000>,
 			      <0x80 0x00000000 0x0 0x1000000>;
 			reg-names = "breg", "pcireg", "cfg";
-			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 0xe0000000 0x00000000 0x10000000	/* non-prefetchable memory */
-				  0x43000000 0x00000006 0x00000000 0x00000006 0x00000000 0x00000002 0x00000000>;/* prefetchable memory */
+			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 0xe0000000 0x00000000 0x10000000>, /* non-prefetchable memory */
+				 <0x43000000 0x00000006 0x00000000 0x00000006 0x00000000 0x00000002 0x00000000>; /* prefetchable memory */
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc 0x1>,
-- 
2.25.1

