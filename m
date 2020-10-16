Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8350290193
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 11:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406196AbgJPJPo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 05:15:44 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:54010 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394676AbgJPJJI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 05:09:08 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1A0DFC9F62F4A6EE7BFA;
        Fri, 16 Oct 2020 17:09:06 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.134) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 17:08:55 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
Date:   Fri, 16 Oct 2020 17:08:32 +0800
Message-ID: <20201016090833.1892-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201016090833.1892-1-thunder.leizhen@huawei.com>
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The scripts/dtc/checks.c requires that the node have empty "dma-ranges"
property must have the same "#address-cells" and "#size-cells" values as
the parent node. Otherwise, the following warnings is reported:

arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
(dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
(dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
its #size-cells (1) differs from / (2)

Arnd Bergmann figured out why it's necessary:
Also note that the #address-cells=<1> means that any device under
this bus is assumed to only support 32-bit addressing, and DMA will
have to go through a slow swiotlb in the absence of an IOMMU.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi     | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
index 55259f973b5a9e4..aef8f2b00778d71 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -5,20 +5,20 @@
 	usb {
 		compatible = "simple-bus";
 		dma-ranges;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x68500000 0x00400000>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x0 0x0 0x68500000 0x0 0x00400000>;
 
 		usbphy0: usb-phy@0 {
 			compatible = "brcm,sr-usb-combo-phy";
-			reg = <0x00000000 0x100>;
+			reg = <0x0 0x00000000 0x0 0x100>;
 			#phy-cells = <1>;
 			status = "disabled";
 		};
 
 		xhci0: usb@1000 {
 			compatible = "generic-xhci";
-			reg = <0x00001000 0x1000>;
+			reg = <0x0 0x00001000 0x0 0x1000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0 1>, <&usbphy0 0>;
 			phy-names = "phy0", "phy1";
@@ -28,7 +28,7 @@
 
 		bdc0: usb@2000 {
 			compatible = "brcm,bdc-v0.16";
-			reg = <0x00002000 0x1000>;
+			reg = <0x0 0x00002000 0x0 0x1000>;
 			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0 0>, <&usbphy0 1>;
 			phy-names = "phy0", "phy1";
@@ -38,21 +38,21 @@
 
 		usbphy1: usb-phy@10000 {
 			compatible = "brcm,sr-usb-combo-phy";
-			reg = <0x00010000 0x100>;
+			reg = <0x0 0x00010000 0x0 0x100>;
 			#phy-cells = <1>;
 			status = "disabled";
 		};
 
 		usbphy2: usb-phy@20000 {
 			compatible = "brcm,sr-usb-hs-phy";
-			reg = <0x00020000 0x100>;
+			reg = <0x0 0x00020000 0x0 0x100>;
 			#phy-cells = <0>;
 			status = "disabled";
 		};
 
 		xhci1: usb@11000 {
 			compatible = "generic-xhci";
-			reg = <0x00011000 0x1000>;
+			reg = <0x0 0x00011000 0x0 0x1000>;
 			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy1 1>, <&usbphy2>, <&usbphy1 0>;
 			phy-names = "phy0", "phy1", "phy2";
@@ -62,7 +62,7 @@
 
 		bdc1: usb@21000 {
 			compatible = "brcm,bdc-v0.16";
-			reg = <0x00021000 0x1000>;
+			reg = <0x0 0x00021000 0x0 0x1000>;
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy2>;
 			phy-names = "phy0";
-- 
1.8.3


