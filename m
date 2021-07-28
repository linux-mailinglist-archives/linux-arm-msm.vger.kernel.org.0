Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7013D98BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbhG1W1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:27:21 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:40155 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbhG1W0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:38 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id CB41C20074;
        Thu, 29 Jul 2021 00:26:34 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 38/39] arm64: dts: qcom: sdm630: Add I2C functions to I2C pins
Date:   Thu, 29 Jul 2021 00:25:41 +0200
Message-Id: <20210728222542.54269-39-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was overlooked earlier, fix it to ensure the busses can
work properly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1247140b6ac1..004df7a6eb6c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -938,96 +938,112 @@ rx-cts-rts {
 
 			i2c1_default: i2c1-default {
 				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c1_sleep: i2c1-sleep {
 				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c2_default: i2c2-default {
 				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c2_sleep: i2c2-sleep {
 				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c3_default: i2c3-default {
 				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c3_sleep: i2c3-sleep {
 				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c4_default: i2c4-default {
 				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c4_sleep: i2c4-sleep {
 				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c5_default: i2c5-default {
 				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c5_sleep: i2c5-sleep {
 				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c6_default: i2c6-default {
 				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c6_sleep: i2c6-sleep {
 				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c7_default: i2c7-default {
 				pins = "gpio26", "gpio27";
+				function = "blsp_i2c7";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c7_sleep: i2c7-sleep {
 				pins = "gpio26", "gpio27";
+				function = "blsp_i2c7";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
 
 			i2c8_default: i2c8-default {
 				pins = "gpio30", "gpio31";
+				function = "blsp_i2c8";
 				drive-strength = <2>;
 				bias-disable;
 			};
 
 			i2c8_sleep: i2c8-sleep {
 				pins = "gpio30", "gpio31";
+				function = "blsp_i2c8";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
-- 
2.32.0

