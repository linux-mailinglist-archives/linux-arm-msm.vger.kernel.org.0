Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3F33099DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbhAaBnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbhAaBlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:41:14 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64CDC0613ED;
        Sat, 30 Jan 2021 17:40:12 -0800 (PST)
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id B48CB1F888;
        Sun, 31 Jan 2021 02:40:04 +0100 (CET)
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
Subject: [PATCH 13/18] arm64: dts: qcom: msm8994-octagon: Configure PON keys
Date:   Sun, 31 Jan 2021 02:38:44 +0100
Message-Id: <20210131013853.55810-14-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131013853.55810-1-konrad.dybcio@somainline.org>
References: <20210131013853.55810-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Gustave Monce <gustave.monce@outlook.com>

Both the power key and the vol- key are connected over PON.
Configure them.

Signed-off-by: Gustave Monce <gustave.monce@outlook.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi     | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8994.dtsi             |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 73af5265df9b..097f8f6701e3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -358,6 +358,22 @@ pinconf {
 	};
 };
 
+&pm8994_pon {
+	pwrkey {
+		compatible = "qcom,pm8941-pwrkey";
+		interrupts = <0 8 0 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		linux,code = <KEY_POWER>;
+	};
+
+	volwnkey {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0 8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
 &pmi8994_gpios {
 	pinctrl-0 = <&hd3ss460_pol &hd3ss460_amsel &hd3ss460_en>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 5ffdf37d8e31..7f7ece49bdd3 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -43,7 +43,7 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pon@800 {
+		pm8994_pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
 
 			reg = <0x800>;
-- 
2.30.0

