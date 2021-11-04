Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA9D4451BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 11:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKDKwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 06:52:44 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:23031 "EHLO
        mail-4318.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhKDKwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 06:52:44 -0400
X-Greylist: delayed 115643 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Nov 2021 06:52:43 EDT
Date:   Thu, 04 Nov 2021 10:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1636023004;
        bh=z448LsLqxuCD7eN18l1DbCUT+hxRdhKv6fijjUVKwBg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Z6TqAsqSfjHOQcKTnXcTkMOILrbbLEBISzTBphdIaSm0HUSNcrCuHP/Vd20e93+Q7
         fXWI51o5pet/d9eljXED4sH3EOalYJkXK5KZCVLL1c6Th5qgsLHnhV8vkwzO8sLr4m
         yf17FUclXaUh66hqjoSTPSdNqO20x6c4j7KTF+z4=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996-xiaomi-scorpio: Add touchkey controller
Message-ID: <20211104104932.104046-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node and pin states for Cypress StreetFighter touchkey
controller.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../boot/dts/qcom/msm8996-xiaomi-scorpio.dts  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
index e5b8402b1ed6..27a45ddbb5bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
@@ -60,6 +60,20 @@ &adsp_pil {
 };
=20
 &blsp2_i2c6 {
+=09touchkey: touchkey@28 {
+=09=09compatible =3D "cypress,sf3155";
+=09=09reg =3D <0x28>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <77 IRQ_TYPE_EDGE_FALLING>;
+=09=09avdd-supply =3D <&vreg_l6a_1p8>;
+=09=09vdd-supply =3D <&vdd_3v2_tp>;
+=09=09linux,keycodes =3D <KEY_BACK KEY_MENU>;
+
+=09=09pinctrl-names =3D "default", "sleep";
+=09=09pinctrl-0 =3D <&touchkey_default>;
+=09=09pinctrl-1 =3D <&touchkey_sleep>;
+=09};
+
 =09touchscreen: atmel-mxt-ts@4a {
 =09=09compatible =3D "atmel,maxtouch";
 =09=09reg =3D <0x4a>;
@@ -416,6 +430,20 @@ &tlmm {
 =09=09"RFFE1_DATA",=09=09/* GPIO_148 */
 =09=09"RFFE1_CLK";=09=09/* GPIO_149 */
=20
+=09touchkey_default: touchkey_default {
+=09=09pins =3D "gpio77";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <16>;
+=09=09bias-pull-up;
+=09};
+
+=09touchkey_sleep: touchkey_sleep {
+=09=09pins =3D "gpio77";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09touchscreen_default: touchscreen_default {
 =09=09pins =3D "gpio75", "gpio125";
 =09=09function =3D "gpio";
--=20
2.33.1


