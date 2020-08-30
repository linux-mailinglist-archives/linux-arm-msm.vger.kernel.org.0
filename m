Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B843257065
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Aug 2020 22:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgH3UJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 16:09:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:47367 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgH3UJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 16:09:34 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mw8gc-1kTB772Z1A-00s5Em; Sun, 30 Aug 2020 22:09:29 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: replace status value "ok" by "okay"
Date:   Sun, 30 Aug 2020 22:08:45 +0200
Message-Id: <20200830200845.1771-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+tc2JPteRMO/gXsjFaKAfgwusfC5BheWA1niOsDAyiHjM51tUzF
 du/oKvkXZWGH5EOYwnBSV3MqwK5IKdcCEusZn+kZMte2UNxLJKNqCPtVNzYob3p+eRpfG8d
 1Ah5qkE6gALNq2w5oQX3iKIpJEjS4pv337/bcC0WNrlne0MdT8iNzA8V/r6OMomjKTfOZDP
 uMGNQ66KQeBTRKNygJHBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R9KLd9E+K1M=:mazZc6MF2D/Y42HxrXwgIT
 9vJuHrtLCit/BeohWwkEqrfrJNvN41krWKrZrNws4m2XQTJ2S2LyoB9LuVBmu8ZSg12FkvtT+
 kXXO4n6hg3QnVpgUap8VjynemOkY4h8IRawgdMTp1WYgDzjxKE7xGiiwXsg0JDSTra7UZiYTy
 HTRHI8Kntn39Wfo6kYsn6P3xf8ue8CqXZfkIipQf9YYsFJhVjRqiPtTR1t2JQJf+El6/lSKPc
 PVyyAameed3gaqnxNiF9kvFNQqMwFmH9xmMSR1mKnhMdvqpnaPsnpkdf01wb6O9rmqkk1TUTu
 dLBSfZKuGcizYGbR+VxAoghea0sihYBRQjTXBBHIvnQH34ll+A6oRX3eaAy9DerT8gml0hiwn
 ojz0U5wSd9VUHytMSYGCWlMQCSaHdSZp8wRDXs9ZI5cflo+jiu2tFAtyKXSYt/ymXODxbgJ5v
 6nKk3UnKlpxpiIVP5H1h3iAzW1wODeEeTuvS6xWWxShhAFB4zFdjhRKMGACDQlgVUjMC3iFjg
 eNmxvaobUb32+Lvq7TEbXGRjTB93m9oGWCGaFmZGwFdYgEgrw6EOcyuW7rEJT646z3pSJTs1d
 wGQ03YZwjiiuptISV/tjKrxEIA38RXrLQwYOhYaGMRjKZF6CZNBUtN2wrFvO2brgIi8kf/5yQ
 nhMYvvLez+pOYheX2bIZRdohBl8a1qpda1QkvGvrWaapvStd2SaeMyCenkfVyLJ7Y2cYPgI5I
 faG6XTBBFAsp0rv7kQGEeYGh7ARDH89Ylf+ziMx1qajJa+J82dGZrYIKN610tPt08pxjzQDMh
 YEYv5kLmwym1d1gdx91y+dAXOi15Vjjw9NvctkownAhqnVLp+a8v2sBdC6ZRcjC3m/u4QkfhE
 26s3d1doxM7Zfz/wmbCg==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While the DT parser recognizes "ok" as a valid value for the
"status" property, it is actually mentioned nowhere. Use the
proper value "okay" instead, as done in the majority of files
already.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi    |  4 +--
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  6 ++--
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts    | 34 ++++++++++----------
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts |  2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi     | 12 +++----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts   |  2 +-
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 194343510dcb..8665d3464e9b 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -585,7 +585,7 @@
 };
 
 &camss {
-	status = "ok";
+	status = "okay";
 	ports {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -602,7 +602,7 @@
 };
 
 &cci {
-	status = "ok";
+	status = "okay";
 };
 
 &cci_i2c0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index b31117a93995..e8eaa958c199 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -26,18 +26,18 @@
 &blsp1_uart3 {
 	pinctrl-0 = <&serial_3_pins>;
 	pinctrl-names = "default";
-	status = "ok";
+	status = "okay";
 };
 
 &i2c_1 {
 	pinctrl-0 = <&i2c_1_pins>;
 	pinctrl-names = "default";
-	status = "ok";
+	status = "okay";
 };
 
 &spi_0 {
 	cs-select = <0>;
-	status = "ok";
+	status = "okay";
 
 	m25p80@0 {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index f4a76162ab5f..e8c37a1693d3 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -27,11 +27,11 @@
 };
 
 &blsp1_i2c2 {
-	status = "ok";
+	status = "okay";
 };
 
 &blsp1_spi1 {
-	status = "ok";
+	status = "okay";
 
 	m25p80@0 {
 		#address-cells = <1>;
@@ -43,37 +43,37 @@
 };
 
 &blsp1_uart3 {
-	status = "ok";
+	status = "okay";
 };
 
 &blsp1_uart5 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie0 {
-	status = "ok";
+	status = "okay";
 	perst-gpio = <&tlmm 61 0x1>;
 };
 
 &pcie1 {
-	status = "ok";
+	status = "okay";
 	perst-gpio = <&tlmm 58 0x1>;
 };
 
 &pcie_phy0 {
-	status = "ok";
+	status = "okay";
 };
 
 &pcie_phy1 {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_bam {
-	status = "ok";
+	status = "okay";
 };
 
 &qpic_nand {
-	status = "ok";
+	status = "okay";
 
 	nand@0 {
 		reg = <0>;
@@ -84,29 +84,29 @@
 };
 
 &sdhc_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &qusb_phy_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &qusb_phy_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssphy_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &ssphy_1 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_0 {
-	status = "ok";
+	status = "okay";
 };
 
 &usb_1 {
-	status = "ok";
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 479ad3ac6c28..08d5d51221cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -13,7 +13,7 @@
 };
 
 &ethernet {
-	status = "ok";
+	status = "okay";
 
 	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
 	snps,reset-active-low;
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6422cf9d5855..a80c578484ba 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -97,7 +97,7 @@
 };
 
 &pcie {
-	status = "ok";
+	status = "okay";
 
 	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
 
@@ -106,22 +106,22 @@
 };
 
 &pcie_phy {
-	status = "ok";
+	status = "okay";
 
 	vdda-vp-supply = <&vreg_l3_1p05>;
 	vdda-vph-supply = <&vreg_l5_1p8>;
 };
 
 &remoteproc_adsp {
-	status = "ok";
+	status = "okay";
 };
 
 &remoteproc_cdsp {
-	status = "ok";
+	status = "okay";
 };
 
 &remoteproc_wcss {
-	status = "ok";
+	status = "okay";
 };
 
 &rpm_requests {
@@ -215,7 +215,7 @@
 };
 
 &sdcc1 {
-	status = "ok";
+	status = "okay";
 
 	supports-cqe;
 	mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a2a98680ccf5..8443451ac8cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1103,7 +1103,7 @@
 };
 
 &cci {
-	status = "ok";
+	status = "okay";
 };
 
 &cci_i2c0 {
-- 
2.20.1

