Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C6A377CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 09:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhEJHGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 03:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhEJHGn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 03:06:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82F7F6101B;
        Mon, 10 May 2021 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620630339;
        bh=kTQRw9IcoRW6cIOIQSgGst22f9/LbBCn9dytF3YcjAw=;
        h=From:To:Cc:Subject:Date:From;
        b=eDdOeMm85G42o98hiPkfv6ObncblbhJFBFDN//dtach5770y/wHTX75dx3wFSaeB2
         vDgdNShn7NXImCRGK+p51ab5xel+5TTPApW06i2NNtPo9bUQPcmqb3oOMxX6zlnF8W
         LzLfK9wTI7Zf5dG8lDhRharGbkzynOS0KifxYq62YDVOjEDuDIliNN5/bRfnAkYCoz
         8XbU/9tuQAZH/FpFxgIgk8pO4acEXfI0S5xV4C9VXO+s6T43/D7/KfE6qC7tUiAHWU
         Gv4ELLSsu/3qLyGqFdhvEQ28zgU/uf6aL12nO9Wji0BiZNdlIn2LzHDRHpmgHBdgVb
         CPp41HRnmnIAQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8350: fix the node unit addresses
Date:   Mon, 10 May 2021 12:35:32 +0530
Message-Id: <20210510070532.3838598-1-vkoul@kernel.org>
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

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a8cd224a2f31..d015a9ca95a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -689,7 +690,7 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
-		tsens0: thermal-sensor@c222000 {
+		tsens0: thermal-sensor@c263000 {
 			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
 			reg = <0 0x0c263000 0 0x1ff>, /* TM */
 			      <0 0x0c222000 0 0x8>; /* SROT */
@@ -700,7 +701,7 @@ tsens0: thermal-sensor@c222000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		tsens1: thermal-sensor@c223000 {
+		tsens1: thermal-sensor@c265000 {
 			compatible = "qcom,sm8350-tsens", "qcom,tsens-v2";
 			reg = <0 0x0c265000 0 0x1ff>, /* TM */
 			      <0 0x0c223000 0 0x8>; /* SROT */
@@ -1176,7 +1177,7 @@ usb_2_ssphy: phy@88ebe00 {
 			};
 		};
 
-		dc_noc: interconnect@90e0000 {
+		dc_noc: interconnect@90c0000 {
 			compatible = "qcom,sm8350-dc-noc";
 			reg = <0 0x090c0000 0 0x4200>;
 			#interconnect-cells = <1>;
-- 
2.26.3

