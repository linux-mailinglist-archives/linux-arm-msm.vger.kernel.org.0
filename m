Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3BC33FE31E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 21:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344786AbhIATek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 15:34:40 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:29275 "EHLO
        mail-4318.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343549AbhIATeg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 15:34:36 -0400
X-Greylist: delayed 26238 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Sep 2021 15:34:35 EDT
Date:   Wed, 01 Sep 2021 19:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630524816;
        bh=ePXx5QabNdNy09MlRVQaJm+ill5eRDRuyyO7m8WPUkI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=sKaB8NzFKqlb9B7Q5lpV/0PT9ZLfn1FMV+aPwkmE5cjdo2WFko0pwKAKm2XYAdFuK
         O4BuAYTbT2sRyeQTjT3WoTJGrgmxjkZ1yUM2Xbl0ETxcPTXgH7dC4L/BX5NwVVat7v
         8qqcgII1Gh22j7yGlhbo5NUtcnx0/Lb59RsgA03g=
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
Subject: [PATCH 2/4] arm64: dts: qcom: msm8996: Add blsp2_i2c3
Message-ID: <20210901193214.250375-3-y.oudjana@protonmail.com>
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

Add a node for blsp2_i2c3 which is used for type-C port control chips
and speaker codecs on some devices.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 23c3435ab888..1f4eca018183 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1253,6 +1253,20 @@ blsp2_uart3_4pins_sleep: blsp2-uart2-4pins-sleep {
 =09=09=09=09bias-disable;
 =09=09=09};
=20
+=09=09=09blsp2_i2c3_default: blsp2-i2c3 {
+=09=09=09=09pins =3D "gpio51", "gpio52";
+=09=09=09=09function =3D "blsp_i2c9";
+=09=09=09=09drive-strength =3D <16>;
+=09=09=09=09bias-disable;
+=09=09=09};
+
+=09=09=09blsp2_i2c3_sleep: blsp2-i2c3-sleep {
+=09=09=09=09pins =3D "gpio51", "gpio52";
+=09=09=09=09function =3D "gpio";
+=09=09=09=09drive-strength =3D <2>;
+=09=09=09=09bias-disable;
+=09=09=09};
+
 =09=09=09wcd_intr_default: wcd-intr-default{
 =09=09=09=09pins =3D "gpio54";
 =09=09=09=09function =3D "gpio";
@@ -2825,6 +2839,24 @@ blsp2_i2c2: i2c@75b6000 {
 =09=09=09status =3D "disabled";
 =09=09};
=20
+=09=09blsp2_i2c3: i2c@75b7000 {
+=09=09=09compatible =3D "qcom,i2c-qup-v2.2.1";
+=09=09=09reg =3D <0x075b7000 0x1000>;
+=09=09=09interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09clocks =3D <&gcc GCC_BLSP2_AHB_CLK>,
+=09=09=09=09<&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>;
+=09=09=09clock-names =3D "iface", "core";
+=09=09=09clock-frequency =3D <400000>;
+=09=09=09pinctrl-names =3D "default", "sleep";
+=09=09=09pinctrl-0 =3D <&blsp2_i2c3_default>;
+=09=09=09pinctrl-1 =3D <&blsp2_i2c3_sleep>;
+=09=09=09dmas =3D <&blsp2_dma 16>, <&blsp2_dma 17>;
+=09=09=09dma-names =3D "tx", "rx";
+=09=09=09#address-cells =3D <1>;
+=09=09=09#size-cells =3D <0>;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09blsp2_i2c5: i2c@75b9000 {
 =09=09=09compatible =3D "qcom,i2c-qup-v2.2.1";
 =09=09=09reg =3D <0x75b9000 0x1000>;
--=20
2.33.0


