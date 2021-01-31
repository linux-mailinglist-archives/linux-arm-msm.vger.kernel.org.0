Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FA13099E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhAaBod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:44:33 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:53735 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbhAaBkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:46 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 3D70C1F881;
        Sun, 31 Jan 2021 02:40:00 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustave Monce <gustave.monce@outlook.com>
Subject: [PATCH 12/18] arm64: dts: qcom: msm8994-octagon: Configure Lattice iCE40 FPGA
Date:   Sun, 31 Jan 2021 02:38:43 +0100
Message-Id: <20210131013853.55810-13-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Octagon devices have a Lattice iCE40 FPGA connected over SPI.
Configure it.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 004a42261cef..73af5265df9b 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -304,6 +304,27 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&blsp2_spi4 {
+	status = "okay";
+
+	/*
+	 * This device is a Lattice UC120 USB-C PD PHY.
+	 * It is actually a Lattice iCE40 FPGA pre-programmed by
+	 * the device firmware with a specific bitstream
+	 * enabling USB Type C PHY functionality.
+	 * Communication is done via a proprietary protocol over SPI.
+	 *
+	 * TODO: Once a proper driver is available, replace this.
+	 */
+	uc120: ice5lp2k@0 {
+		compatible = "lattice,ice40-fpga-mgr";
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		cdone-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pmi8994_gpios 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &blsp2_uart2 {
 	status = "okay";
 
-- 
2.30.0

