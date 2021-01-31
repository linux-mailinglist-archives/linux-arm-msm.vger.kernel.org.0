Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABE13099E0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhAaBoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232649AbhAaBkt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:40:49 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B41C061797;
        Sat, 30 Jan 2021 17:39:53 -0800 (PST)
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 4683D1F740;
        Sun, 31 Jan 2021 02:39:51 +0100 (CET)
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
Subject: [PATCH 10/18] arm64: dts: qcom: msm8994-octagon: Configure HD3SS460 Type-C mux pins
Date:   Sun, 31 Jan 2021 02:38:41 +0100
Message-Id: <20210131013853.55810-11-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

The driver is not available yet, so hardcode the pins.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 78443f5a3881..bf6e63a23600 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -337,6 +337,37 @@ pinconf {
 	};
 };
 
+&pmi8994_gpios {
+	pinctrl-0 = <&hd3ss460_pol &hd3ss460_amsel &hd3ss460_en>;
+	pinctrl-names = "default";
+
+	/*
+	* This device uses a TI HD3SS460 Type-C MUX
+	* As this device has no driver currently,
+	* the configuration for USB Face Up is set-up here.
+	*
+	* TODO: remove once a driver is available
+	* TODO: add VBUS GPIO 5
+	*/
+	hd3ss460_pol: pol_low {
+		pins = "gpio8";
+		drive-strength = <3>;
+		bias-pull-down;
+	};
+
+	hd3ss460_amsel: amsel_high {
+		pins = "gpio9";
+		drive-strength = <1>;
+		bias-pull-up;
+	};
+	
+	hd3ss460_en: en_high {
+		pins = "gpio10";
+		drive-strength = <1>;
+		bias-pull-up;
+	};
+};
+
 &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
-- 
2.30.0

