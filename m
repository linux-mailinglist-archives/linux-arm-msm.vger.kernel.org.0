Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF3741F036
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 17:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354735AbhJAPDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 11:03:33 -0400
Received: from mail-m17638.qiye.163.com ([59.111.176.38]:45408 "EHLO
        mail-m17638.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354688AbhJAPDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 11:03:33 -0400
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Oct 2021 11:03:32 EDT
Received: from localhost.localdomain (unknown [112.48.80.210])
        by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 40F191C0091;
        Fri,  1 Oct 2021 22:54:32 +0800 (CST)
From:   Chukun Pan <amadeus@jmu.edu.cn>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH] arm64: dts: ipq8074: Add QUP5 I2C node
Date:   Fri,  1 Oct 2021 22:54:21 +0800
Message-Id: <20211001145421.18302-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
        kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlKSklWHx1MTB5KHRgZTU
        kdVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KzI6Mio*SD4OKzgKKE5PNhg5
        P0swCxJVSlVKTUhISktLS0xJTE1NVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
        SVVPQ1VDS1VJSktZV1kIAVlBSUtPTjcG
X-HM-Tid: 0a7c3c598636d993kuws40f191c0091
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add node to support the QUP5 I2C controller inside of IPQ8074.
It is exactly the same as QUP2 controllers.
Some routers like ZTE MF269 use this bus.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index aebd0949ac81..68aaad4c9705 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -430,6 +430,21 @@
 			status = "disabled";
 		};
 
+		blsp1_i2c5: i2c@78b9000 {
+			compatible = "qcom,i2c-qup-v2.2.1";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x78b9000 0x600>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
+				<&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
+			clock-names = "iface", "core";
+			clock-frequency = <400000>;
+			dmas = <&blsp_dma 21>, <&blsp_dma 20>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		blsp1_i2c6: i2c@78ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			#address-cells = <1>;
-- 
2.17.1

