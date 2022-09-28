Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2875EE458
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 20:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbiI1S3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 14:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbiI1S3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 14:29:15 -0400
Received: from mail-4324.protonmail.ch (mail-4324.protonmail.ch [185.70.43.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659F810651D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 11:29:12 -0700 (PDT)
Date:   Wed, 28 Sep 2022 18:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664389749; x=1664648949;
        bh=J6Q0VuvyIjV0kEqykmiUPF3+T4Y0AOtQNu0NAJk0z28=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=Z1re1hcf6xVNgettc/MzhcqUJaDjgd5rUpJfdtgNMyas4LXaYxH6yh6Uu3dFruOxz
         3O+px1y6t9UybLwYiIsbLgRxbttn6ML/1XpPIM9hZ8aBRTZOVtEKeZvSYjxl58DFvd
         YuJRNcH9aDlOLl9Up4DiO40rQ7zxtfTdI8U7C2s/UgVzsOrEoW7DbrIcMyiK6N2qP6
         aPaiNF2CxOhe41C+W0vwG/d+bOo3CYjRvQSzDua7j6BuCp3EsIiBeBqFqGcLvqOtib
         z+o8OsgnvdU+SMKluDNWhptt2iqYvJtCI41c0UIP/JUOtOnX57E2Zwfn8bxF2A1Oav
         Qv5CYldob1R3g==
To:     devicetree@vger.kernel.org
From:   "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Josef W Menad <JosefWMenad@protonmail.ch>,
        Markuss Broks <markuss.broks@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 2/4] arm64: dts: qcom: msm8916-samsung-j5-common: Add initial common device tree
Message-ID: <20220928182722.186237-1-linmengbo0689@protonmail.com>
In-Reply-To: <20220928182435.186116-1-linmengbo0689@protonmail.com>
References: <20220928182435.186116-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The smartphones below are using the MSM8916 SoC,
which are released in 2015-2016:

Samsung Galaxy J5 2015 (SM-J500*)
Samsung Galaxy J5 2016 (SM-J510*)
Samsung Galaxy J3 2016
- SM-J3109/SM-J320Y/SM-J320YZ
- SM-J320N0/SM-J320ZN
- SM-J320P/SM-J320R4/SM-J320V/SM-S320VL

Add a common device tree for with initial support for:

- GPIO keys
- SDHCI (internal and external storage)
- USB Device Mode
- UART (on USB connector via the SM5703 MUIC)
- WCNSS (WiFi/BT)
- Regulators

The three devices (some varints of J3, all other variants of J5 released
in 2015 and J5X released in 2016) are very similar, with some differences
in display and GPIO pins. The common parts are shared in
msm8916-samsung-j5-common.dtsi to reduce duplication.

Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 ...-j5.dts =3D> msm8916-samsung-j5-common.dtsi} |   9 +-
 .../boot/dts/qcom/msm8916-samsung-j5.dts      | 224 ++----------------
 2 files changed, 16 insertions(+), 217 deletions(-)
 copy arch/arm64/boot/dts/qcom/{msm8916-samsung-j5.dts =3D> msm8916-samsung=
-j5-common.dtsi} (94%)
 rewrite arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts (93%)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/b=
oot/dts/qcom/msm8916-samsung-j5-common.dtsi
similarity index 94%
copy from arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
copy to arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
index eabeed18cfaa..502b38d4a61e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
@@ -1,15 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
=20
-/dts-v1/;
-
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
=20
 / {
-=09model =3D "Samsung Galaxy J5 (2015)";
-=09compatible =3D "samsung,j5", "qcom,msm8916";
-=09chassis-type =3D "handset";
-
 =09aliases {
 =09=09serial0 =3D &blsp1_uart2;
 =09};
@@ -92,7 +86,6 @@ &usb {
=20
 &usb_hs_phy {
 =09extcon =3D <&pm8916_usbin>;
-=09qcom,init-seq =3D /bits/ 8 <0x1 0x19 0x2 0x0b>;
 };
=20
 &smd_rpm_regulators {
@@ -199,7 +192,7 @@ l18 {
 };
=20
 &msmgpio {
-=09gpio_keys_default: gpio-keys-default {
+=09gpio_keys_default: gpio-keys-default-state {
 =09=09pins =3D "gpio107", "gpio109";
 =09=09function =3D "gpio";
=20
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/b=
oot/dts/qcom/msm8916-samsung-j5.dts
dissimilarity index 93%
index eabeed18cfaa..0a32d33e9778 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
@@ -?,? +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-j5-common.dtsi"
+
+/ {
+=09model =3D "Samsung Galaxy J5 (2015)";
+=09compatible =3D "samsung,j5", "qcom,msm8916";
+=09chassis-type =3D "handset";
+};
+
+&usb_hs_phy {
+=09qcom,init-seq =3D /bits/ 8 <0x1 0x19 0x2 0x0b>;
+};
--=20
2.30.2


