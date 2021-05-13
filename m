Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D9A37F2D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 08:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhEMGIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 02:08:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:60608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhEMGIw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 02:08:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D38F613E6;
        Thu, 13 May 2021 06:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620886063;
        bh=pK2kgc/d5ImHgmBAxIHHR+V6Xy07tmUh5AxlEyVbnIQ=;
        h=From:To:Cc:Subject:Date:From;
        b=FonvQCGl6l4up6n4TqxD3y7J4gZjwniq7Hnn3I6PljyjnGDOpLyGAHLz/4L5QQRZs
         9XVmJqCAhLnsdiRPdy5XFx5ER/JIR3q7nr3FtiB90jAsAPBivEjFLI2eTQgXtTFjz/
         y+PLKVr09l+XTbYRdOC6cJnCSk16JdusRNnUx3jzIsWYP9CJsF+cFxCXpWEKQ3iE4K
         QYQO8nusDkAsaGGJFl/hD3+4+q+axd8hff506A0yayTVHDeMKfO3BFieyRXs9ppuLd
         na4KxjZsMyjms/7hG4NgUc5hVPBKKbWnb+hQY0HMTiJcrqQ9ckxdymZDfsf/77n2mz
         9KaT7htS0Z6Ug==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: sm8350: fix the node unit addresses
Date:   Thu, 13 May 2021 11:37:33 +0530
Message-Id: <20210513060733.382420-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some node unit addresses were put wrongly in the dts, resulting in
below warning when run with W=1

arch/arm64/boot/dts/qcom/sm8350.dtsi:693.34-702.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c222000: simple-bus unit address format error, expected "c263000"
arch/arm64/boot/dts/qcom/sm8350.dtsi:704.34-713.5: Warning (simple_bus_reg): /soc@0/thermal-sensor@c223000: simple-bus unit address format error, expected "c265000"
arch/arm64/boot/dts/qcom/sm8350.dtsi:1180.32-1185.5: Warning (simple_bus_reg): /soc@0/interconnect@90e0000: simple-bus unit address format error, expected "90c0000"

Fix by correcting to the correct address as given in reg node

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

changes in v2:
 - drop the interconnect header included worngly in this patch

 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index cdeea45a2b2c..d015a9ca95a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -690,7 +690,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		tsens0: thermal-sensor@c222000 {
+		tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x8>; /* SROT */
@@ -701,7 +701,7 @@ tsens0: thermal-sensor@c222000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		tsens1: thermal-sensor@c223000 {
+		tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x8>; /* SROT */
@@ -1177,7 +1177,7 @@ usb_2_ssphy: phy@88ebe00 {
 			};
 		};
 
-		dc_noc: interconnect@90e0000 {
+		dc_noc: interconnect@90c0000 {
 			compatible = "qcom,sm8350-dc-noc";
 			reg = <0 0x090c0000 0 0x4200>;
 			#interconnect-cells = <1>;
-- 
2.26.3

