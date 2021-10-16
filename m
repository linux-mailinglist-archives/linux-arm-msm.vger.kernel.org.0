Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864C94301E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 12:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244092AbhJPKWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 06:22:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42942 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244032AbhJPKWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 06:22:46 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aferraris)
        with ESMTPSA id BD5771F44C59
From:   Arnaud Ferraris <arnaud.ferraris@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Martin Kepplinger <martink@posteo.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lucas Stach <dev@lynxeye.de>, Angus Ainslie <angus@akkea.ca>,
        Guido Gunther <agx@sigxcpu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Brian Norris <briannorris@chromium.org>,
        Dan Johansen <strit@manjaro.org>,
        Simon South <simon@simonsouth.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: [PATCH 3/4] arm64: dts: qcom: add 'chassis-type' property
Date:   Sat, 16 Oct 2021 12:20:24 +0200
Message-Id: <20211016102025.23346-4-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A new 'chassis-type' root node property has recently been approved for
the device-tree specification, in order to provide a simple way for
userspace to detect the device form factor and adjust their behavior
accordingly.

This patch fills in this property for end-user devices (such as laptops,
smartphones and tablets) based on Qualcomm ARM64 processors.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 .../boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts                  | 1 +
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts           | 1 +
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts           | 2 ++
 arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts | 1 +
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts               | 2 ++
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts             | 1 +
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts   | 1 +
 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts | 1 +
 .../boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts      | 1 +
 .../arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts | 1 +
 .../boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts      | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts      | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts    | 1 +
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts    | 1 +
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts              | 1 +
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts             | 1 +
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts        | 1 +
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts                 | 1 +
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts                 | 1 +
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts            | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts       | 1 +
 arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts           | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts  | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts  | 1 +
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts    | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts  | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts    | 1 +
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts    | 1 +
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts             | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts           | 1 +
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts              | 1 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts            | 1 +
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts            | 1 +
 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts    | 1 +
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts     | 1 +
 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts       | 1 +
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts  | 1 +
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts  | 1 +
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts      | 1 +
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts      | 1 +
 49 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
index a8dffc8c64ea..314d2dc4726a 100644
--- a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
+++ b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia Z4 Tablet (Wi-Fi)";
 	compatible = "sony,karin_windy", "qcom,apq8094";
+	chassis-type = "tablet";
 
 	/*
 	 * This model uses the APQ variant of MSM8994 (APQ8094).
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 670bd1bebd73..265e539e7e99 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -9,6 +9,7 @@
 / {
 	model = "Alcatel OneTouch Idol 3 (4.7)";
 	compatible = "alcatel,idol347", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index cee451e59385..6bc0a29d4b4f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -8,6 +8,7 @@
 / {
 	model = "Asus Zenfone 2 Laser";
 	compatible = "asus,z00l", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index e0075b574190..42d93d3fba36 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -25,6 +25,7 @@
 / {
 	model = "Huawei Ascend G7";
 	compatible = "huawei,g7", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 30716eb8fb2d..9c83c96d2c8a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Longcheer L8150";
 	compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 27845189ac2b..f9ce123471d4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -10,6 +10,7 @@
 / {
 	model = "BQ Aquaris X5 (Longcheer L8910)";
 	compatible = "longcheer,l8910", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index 6cc2eaeb1d33..4ba11b020f9b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -7,6 +7,7 @@
 / {
 	model = "Samsung Galaxy A3U (EUR)";
 	compatible = "samsung,a3u-eur", "qcom,msm8916";
+	chassis-type = "handset";
 
 	reg_panel_vdd3: regulator-panel-vdd3 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index c2eff5aebf85..d978c9ac179d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -7,6 +7,7 @@
 / {
 	model = "Samsung Galaxy A5U (EUR)";
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
+	chassis-type = "handset";
 
 	reg_touch_key: regulator-touch-key {
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index 4e20cc0008f7..69a44c6f57fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Xiaomi Redmi 2 (Wingtech WT88047)";
 	compatible = "wingtech,wt88047", "qcom,msm8916";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 1ccca83292ac..4da6c44bf532 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -16,6 +16,8 @@
 / {
 	model = "LG Nexus 5X";
 	compatible = "lg,bullhead", "qcom,msm8992";
+	chassis-type = "handset";
+
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <251 0>, <252 0>;
 	qcom,board-id = <0xb64 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
index 5322b9ce5839..8933b53694e8 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dts
@@ -12,4 +12,5 @@
 / {
 	model = "Microsoft Lumia 950";
 	compatible = "microsoft,talkman", "qcom,msm8992";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 357d55496e75..69fcb6b0398d 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -14,6 +14,8 @@
 / {
 	model = "Xiaomi Mi 4C";
 	compatible = "xiaomi,libra", "qcom,msm8992";
+	chassis-type = "handset";
+
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <251 0 252 0>;
 	qcom,pmic-id = <65545 65546 0 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index c096b7758aa0..0e3dd48f0dbf 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -14,6 +14,7 @@
 / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
+	chassis-type = "handset";
 	/* required for bootloader to select correct board */
 	qcom,msm-id = <207 0x20000>;
 	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
index d0aaf5750c21..c593418202b8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dts
@@ -12,4 +12,5 @@
 / {
 	model = "Microsoft Lumia 950 XL";
 	compatible = "microsoft,cityman", "qcom,msm8994";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
index b5e90c85aaf6..99388b019a11 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia Z3+/Z4";
 	compatible = "sony,ivy-row", "qcom,msm8994";
+	chassis-type = "handset";
 };
 
 &pm8994_l3 {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
index a1d1a075941a..71758d2cfd5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia Z4 Tablet (LTE)";
 	compatible = "sony,karin-row", "qcom,msm8994";
+	chassis-type = "tablet";
 };
 
 &blsp2_i2c5 {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
index 1385956a69f3..69b7df0ed605 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia Z5 Premium";
 	compatible = "sony,satsuki-row", "qcom,msm8994";
+	chassis-type = "handset";
 };
 
 &pm8994_l14 {
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
index d3ba9867a369..466508cd8234 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia Z5";
 	compatible = "sony,sumire-row", "qcom,msm8994";
+	chassis-type = "handset";
 };
 
 /delete-node/ &pm8994_l19;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
index f129479bbf95..76bf50191f9a 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia Z5 Compact";
 	compatible = "sony,suzuran-row", "qcom,msm8994";
+	chassis-type = "handset";
 };
 
 &pm8994_l14 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
index b4cca54dcb68..4a0645db0ae1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
@@ -12,6 +12,7 @@
 / {
 	model = "Sony Xperia X Performance";
 	compatible = "sony,dora-row", "qcom,msm8996";
+	chassis-type = "handset";
 };
 
 /delete-node/ &tof_sensor;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
index be6ea855fcce..d3100ddf926f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
@@ -12,4 +12,5 @@
 / {
 	model = "Sony Xperia XZ";
 	compatible = "sony,kagura-row", "qcom,msm8996";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
index 1eee7d0fc178..3e5bdaba8378 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
@@ -12,6 +12,7 @@
 / {
 	model = "Sony Xperia XZs";
 	compatible = "sony,keyaki-row", "qcom,msm8996";
+	chassis-type = "handset";
 };
 
 &pm8994_l19 {
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 77d508e5164a..5513fc238343 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -13,6 +13,7 @@
 / {
 	model = "Xiaomi Mi 5";
 	compatible = "xiaomi,gemini", "qcom,msm8996";
+	chassis-type = "handset";
 	qcom,msm-id = <246 0x30001>;
 	qcom,pmic-id = <0x20009 0x2000a 0x00 0x00>;
 	qcom,board-id = <31 0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
index ea2ca271fe7d..e5b8402b1ed6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
@@ -13,6 +13,7 @@
 / {
 	model = "Xiaomi Mi Note 2";
 	compatible = "xiaomi,scorpio", "qcom,msm8996";
+	chassis-type = "handset";
 	qcom,msm-id = <305 0x10000>;
 	qcom,board-id = <34 0>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
index db5821be1e2f..e204b7050441 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
@@ -8,6 +8,7 @@
 / {
 	model = "Asus NovaGo TP370QL";
 	compatible = "asus,novago-tp370ql", "qcom,msm8998";
+	chassis-type = "convertible";
 };
 
 &blsp1_i2c6 {
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
index 49705fe655ee..3d495ce3f46a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -15,6 +15,7 @@
 / {
 	model = "F(x)tec Pro1 (QX1000)";
 	compatible = "fxtec,pro1", "qcom,msm8998";
+	chassis-type = "handset";
 	qcom,board-id = <0x02000b 0x10>;
 
 	/*
diff --git a/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
index 24073127091f..1eb406b43fd7 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
@@ -8,6 +8,7 @@
 / {
 	model = "HP Envy x2";
 	compatible = "hp,envy-x2", "qcom,msm8998";
+	chassis-type = "convertible";
 };
 
 &blsp1_i2c6 {
diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index 89492ed5196c..f55f6f3e3e5d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -8,6 +8,7 @@
 / {
 	model = "Lenovo Miix 630";
 	compatible = "lenovo,miix-630", "qcom,msm8998";
+	chassis-type = "convertible";
 };
 
 &blsp1_i2c6 {
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
index 66b9297588ab..9563eb62db88 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
@@ -11,6 +11,7 @@
 / {
 	model = "OnePlus 5";
 	compatible = "oneplus,cheeseburger", "qcom,msm8998";
+	chassis-type = "handset";
 	/* Required for bootloader to select correct board */
 	qcom,board-id = <8 0 16859 23>;
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
index 544b9b0ae44b..5d0dabbaee4e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
@@ -10,6 +10,7 @@
 / {
 	model = "OnePlus 5T";
 	compatible = "oneplus,dumpling", "qcom,msm8998";
+	chassis-type = "handset";
 	/* Required for bootloader to select correct board */
 	qcom,board-id = <8 0 17801 43>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
index 0de919357de4..caacb7c28402 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia XZ1 Compact";
 	compatible = "sony,xperia-lilac", "qcom,msm8998";
+	chassis-type = "handset";
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
index 87115d648cef..978495a8a6b9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia XZ Premium";
 	compatible = "sony,xperia-maple", "qcom,msm8998";
+	chassis-type = "handset";
 
 	disp_dvdd_vreg: disp-dvdd-vreg {
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
index 9fa3583c951b..4a1f98a21031 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia XZ1";
 	compatible = "sony,xperia-poplar", "qcom,msm8998";
+	chassis-type = "handset";
 };
 
 &ibb {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
index a4e1fb8ca52d..71b448978e88 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-ganges-kirin.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia 10";
 	compatible = "sony,kirin-row", "qcom,sdm630";
+	chassis-type = "handset";
 
 	chosen {
 		framebuffer@9d400000 {
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
index c574e430ba67..dd484a9bc7cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-discovery.dts
@@ -11,4 +11,5 @@
 / {
 	model = "Sony Xperia XA2 Ultra";
 	compatible = "sony,discovery-row", "qcom,sdm630";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
index a93ff3ab1b6d..2da83cd41187 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-pioneer.dts
@@ -11,4 +11,5 @@
 / {
 	model = "Sony Xperia XA2";
 	compatible = "sony,pioneer-row", "qcom,sdm630";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
index 59a679c205e0..a679d4acee29 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile-voyager.dts
@@ -11,6 +11,7 @@
 / {
 	model = "Sony Xperia XA2 Plus";
 	compatible = "sony,voyager-row", "qcom,sdm630";
+	chassis-type = "handset";
 
 	chosen {
 		framebuffer@9d400000 {
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 3e677fb7cfea..1edc53fd6941 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Xiaomi Redmi Note 7";
 	compatible = "xiaomi,lavender", "qcom,sdm660";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &blsp1_uart2;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 72842c887617..73493079d13e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -10,6 +10,7 @@
 / {
 	model = "OnePlus 6";
 	compatible = "oneplus,enchilada", "qcom,sdm845";
+	chassis-type = "handset";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 969b36dc9e2c..b63ebc48f62f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -10,6 +10,7 @@
 / {
 	model = "OnePlus 6T";
 	compatible = "oneplus,fajita", "qcom,sdm845";
+	chassis-type = "handset";
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index c60c8c640e17..054fd97f4b28 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -29,6 +29,7 @@
 / {
 	model = "Xiaomi Pocophone F1";
 	compatible = "xiaomi,beryllium", "qcom,sdm845";
+	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
 	qcom,board-id = <69 0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 6e084f14289a..168b96239094 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -30,6 +30,7 @@
 / {
 	model = "Lenovo Yoga C630";
 	compatible = "lenovo,yoga-c630", "qcom,sdm845";
+	chassis-type = "convertible";
 
 	aliases {
 		hsuart0 = &uart6;
diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 58b6b2742d3f..45eab0235d66 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -17,6 +17,7 @@ / {
 
 	model = "Sony Xperia 10 II";
 	compatible = "sony,pdx201", "qcom,sm6125";
+	chassis-type = "handset";
 
 	chosen {
 		#address-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index a26c23754f5d..36911b9a5c04 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -9,6 +9,7 @@
 / {
 	model = "Sony Xperia 10 III";
 	compatible = "sony,pdx213", "qcom,sm6350";
+	chassis-type = "handset";
 	qcom,msm-id = <434 0x10000>, <459 0x10000>;
 	qcom,board-id = <0x1000B 0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
index 736da9af44e0..c99979d04861 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -15,6 +15,7 @@
 / {
 	model = "Microsoft Surface Duo";
 	compatible = "microsoft,surface-duo", "qcom,sm8150";
+	chassis-type = "handset";
 
 	aliases {
 		serial0 = &uart2;
diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts
index 3b55fdda767a..b2780403255e 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia 5";
 	compatible = "sony,bahamut-generic", "qcom,sm8150";
+	chassis-type = "handset";
 };
 
 &framebuffer {
diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts
index 6f490ec284bd..0d6deceedf46 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dts
@@ -10,4 +10,5 @@
 / {
 	model = "Sony Xperia 1";
 	compatible = "sony,griffin-generic", "qcom,sm8150";
+	chassis-type = "handset";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
index 79afeb07f4a2..356a81698731 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia 1 II";
 	compatible = "sony,pdx203-generic", "qcom,sm8250";
+	chassis-type = "handset";
 };
 
 /delete-node/ &vreg_l7f_1p8;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
index 16c96e838534..5ecf7dafb2ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dts
@@ -10,6 +10,7 @@
 / {
 	model = "Sony Xperia 5 II";
 	compatible = "sony,pdx206-generic", "qcom,sm8250";
+	chassis-type = "handset";
 };
 
 &framebuffer {
-- 
2.33.0
