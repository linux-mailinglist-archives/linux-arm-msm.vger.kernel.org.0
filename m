Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A338F515F0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354494AbiD3Q1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377154AbiD3Q1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:27:24 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4666D5F8D9
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:24:02 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 072013F729;
        Sat, 30 Apr 2022 18:23:59 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] arm64: dts: qcom: msm8998-laptops: Clean up DTs
Date:   Sat, 30 Apr 2022 18:23:41 +0200
Message-Id: <20220430162353.607709-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220430162353.607709-1-konrad.dybcio@somainline.org>
References: <20220430162353.607709-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reorder properties to match new laptop DTs, change hex to dec.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  | 14 ++++++++------
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |  9 +++++----
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |  9 +++++----
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
index 37f994351565..102f3e9a79a1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
@@ -16,20 +16,22 @@ &blsp1_i2c6 {
 
 	touchpad@15 {
 		compatible = "hid-over-i2c";
-		interrupt-parent = <&tlmm>;
-		interrupts = <0x7b IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x15>;
-		hid-descr-addr = <0x0001>;
-
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchpad>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <123 IRQ_TYPE_LEVEL_LOW>;
+
+		hid-descr-addr = <0x0001>;
 	};
 
 	keyboard@3a {
 		compatible = "hid-over-i2c";
-		interrupt-parent = <&tlmm>;
-		interrupts = <0x25 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x3a>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <37 IRQ_TYPE_LEVEL_LOW>;
+
 		hid-descr-addr = <0x0001>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
index 1eb406b43fd7..38389c6a3f68 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
@@ -16,13 +16,14 @@ &blsp1_i2c6 {
 
 	keyboard@3a {
 		compatible = "hid-over-i2c";
-		interrupt-parent = <&tlmm>;
-		interrupts = <0x79 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x3a>;
-		hid-descr-addr = <0x0001>;
-
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchpad>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <121 IRQ_TYPE_LEVEL_LOW>;
+
+		hid-descr-addr = <0x0001>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index f55f6f3e3e5d..cf81c33a9d7e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -16,13 +16,14 @@ &blsp1_i2c6 {
 
 	keyboard@3a {
 		compatible = "hid-over-i2c";
-		interrupt-parent = <&tlmm>;
-		interrupts = <0x79 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x3a>;
-		hid-descr-addr = <0x0001>;
-
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchpad>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <121 IRQ_TYPE_LEVEL_LOW>;
+
+		hid-descr-addr = <0x0001>;
 	};
 };
 
-- 
2.35.2

