Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477967D8CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2019 11:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731187AbfHAJwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Aug 2019 05:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbfHAJwY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Aug 2019 05:52:24 -0400
Received: from localhost.localdomain (unknown [122.178.237.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2752214DA;
        Thu,  1 Aug 2019 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564653143;
        bh=/bJqbQDEMm8hNMnZ0qkjzcaeXZrEU7N35G86q3pp0ZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LpqMKXfKpR8+xGbACDLCy3oPJZevLoKQ1i/ECvZ5hAFbXdntaHEZlyvsx0/aW6pJ4
         Bb7ZxDBH8uYQwyD3jyjFPGhpyFWteuQvKeiRhHiDEnj7q+V3XR3ZwFB0UrzToPslZv
         hMLHYroanaHQQvUTuVpesEWEcIHqxo3tPs2Lrcys=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: pms405: add unit name adc nodes
Date:   Thu,  1 Aug 2019 15:20:47 +0530
Message-Id: <20190801095049.13855-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801095049.13855-1-vkoul@kernel.org>
References: <20190801095049.13855-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The adc nodes have reg property but were missing the unit name, so add
that to fix these warnings:

arch/arm64/boot/dts/qcom/pms405.dtsi:91.12-94.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/ref_gnd: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:96.14-99.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vref_1p25: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:101.19-104.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vph_pwr: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:106.13-109.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/die_temp: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:111.27-116.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor1: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:118.27-123.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor3: node has a reg or ranges property, but no unit name
arch/arm64/boot/dts/qcom/pms405.dtsi:125.22-130.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/xo_temp: node has a reg or ranges property, but no unit name

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 14240fedd916..a28386900a3b 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -88,41 +88,41 @@
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
 
-			ref_gnd {
+			ref_gnd@0 {
 				reg = <ADC5_REF_GND>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			vref_1p25 {
+			vref_1p25@1 {
 				reg = <ADC5_1P25VREF>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			pon_1: vph_pwr {
+			pon_1: vph_pwr@131 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;
 			};
 
-			die_temp {
+			die_temp@6 {
 				reg = <ADC5_DIE_TEMP>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			pa_therm1: thermistor1 {
+			pa_therm1: thermistor1@77 {
 				reg = <ADC5_AMUX_THM1_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			pa_therm3: thermistor3 {
+			pa_therm3: thermistor3@79 {
 				reg = <ADC5_AMUX_THM3_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
 				qcom,pre-scaling = <1 1>;
 			};
 
-			xo_therm: xo_temp {
+			xo_therm: xo_temp@76 {
 				reg = <ADC5_XO_THERM_100K_PU>;
 				qcom,ratiometric;
 				qcom,hw-settle-time = <200>;
-- 
2.20.1

