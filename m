Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDFB3FE316
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244465AbhIATe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:34:27 -0400
Received: from mail-4325.protonmail.ch ([185.70.43.25]:42065 "EHLO
        mail-4325.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245070AbhIATeZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:34:25 -0400
X-Greylist: delayed 26248 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Sep 2021 15:34:25 EDT
Date:   Wed, 01 Sep 2021 19:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630524807;
        bh=2mAEu7nrS11Je4C2dPB8KcRtC9+APx4d3X7m/pti9Ng=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=vPUQfrpGWFiO5EJpOKbyaSzhFlfm5EXDWd0E2k2RzVOHHo2sidgslt57zf+yp7CEB
         gys+bUbiwDNZ2D9SKG90BVchV3RuV7YT1lyyR9FU0hpUdzTk8ORCLqHjD/ufoswImc
         GhSSBIYbUJmdl6dlkp7X1JRD54xcgMAtxF6aCjKY=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 1/4] arm64: dts: qcom: db820c: Move blsp1_uart2 pin states to msm8996.dtsi
Message-ID: <20210901193214.250375-2-y.oudjana@protonmail.com>
In-Reply-To: <20210901193214.250375-1-y.oudjana@protonmail.com>
References: <20210901193214.250375-1-y.oudjana@protonmail.com>
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

Move blsp1_uart2_default and blsp1_uart2_sleep to the SoC device tree to
avoid duplicating them in other device trees.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 29 --------------------
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 17 ++++++++++++
 2 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot=
/dts/qcom/apq8096-db820c.dtsi
index 51e17094d7b1..eca428ab2517 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -148,9 +148,6 @@ &blsp1_spi1 {
 &blsp1_uart2 {
 =09label =3D "BT-UART";
 =09status =3D "okay";
-=09pinctrl-names =3D "default", "sleep";
-=09pinctrl-0 =3D <&blsp1_uart2_default>;
-=09pinctrl-1 =3D <&blsp1_uart2_sleep>;
=20
 =09bluetooth {
 =09=09compatible =3D "qcom,qca6174-bt";
@@ -437,32 +434,6 @@ config {
 =09=09};
 =09};
=20
-=09blsp1_uart2_default: blsp1_uart2_default {
-=09=09mux {
-=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
-=09=09=09function =3D "blsp_uart2";
-=09=09};
-
-=09=09config {
-=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
-=09=09=09drive-strength =3D <16>;
-=09=09=09bias-disable;
-=09=09};
-=09};
-
-=09blsp1_uart2_sleep: blsp1_uart2_sleep {
-=09=09mux {
-=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
-=09=09=09function =3D "gpio";
-=09=09};
-
-=09=09config {
-=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
-=09=09=09drive-strength =3D <2>;
-=09=09=09bias-disable;
-=09=09};
-=09};
-
 =09hdmi_hpd_active: hdmi_hpd_active {
 =09=09mux {
 =09=09=09pins =3D "gpio34";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 52df22ab3f6a..23c3435ab888 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1211,6 +1211,20 @@ wake {
 =09=09=09=09};
 =09=09=09};
=20
+=09=09=09blsp1_uart2_default: blsp1-uart2-default {
+=09=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
+=09=09=09=09function =3D "blsp_uart2";
+=09=09=09=09drive-strength =3D <16>;
+=09=09=09=09bias-disable;
+=09=09=09};
+
+=09=09=09blsp1_uart2_sleep: blsp1-uart2-sleep {
+=09=09=09=09pins =3D "gpio41", "gpio42", "gpio43", "gpio44";
+=09=09=09=09function =3D "gpio";
+=09=09=09=09drive-strength =3D <2>;
+=09=09=09=09bias-disable;
+=09=09=09};
+
 =09=09=09blsp1_i2c3_default: blsp1-i2c2-default {
 =09=09=09=09pins =3D "gpio47", "gpio48";
 =09=09=09=09function =3D "blsp_i2c3";
@@ -2704,6 +2718,9 @@ blsp1_uart2: serial@7570000 {
 =09=09=09clocks =3D <&gcc GCC_BLSP1_UART2_APPS_CLK>,
 =09=09=09=09 <&gcc GCC_BLSP1_AHB_CLK>;
 =09=09=09clock-names =3D "core", "iface";
+=09=09=09pinctrl-names =3D "default", "sleep";
+=09=09=09pinctrl-0 =3D <&blsp1_uart2_default>;
+=09=09=09pinctrl-1 =3D <&blsp1_uart2_sleep>;
 =09=09=09dmas =3D <&blsp1_dma 2>, <&blsp1_dma 3>;
 =09=09=09dma-names =3D "tx", "rx";
 =09=09=09status =3D "disabled";
--=20
2.33.0


