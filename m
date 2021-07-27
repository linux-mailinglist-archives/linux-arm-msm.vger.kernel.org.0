Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B11C53D70D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 10:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbhG0IGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 04:06:52 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:53145 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235912AbhG0IGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 04:06:49 -0400
Date:   Tue, 27 Jul 2021 08:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1627373192;
        bh=VzDTyoxLHHM58hrWTk1Yt2r4mVw6ytJJfV18mXrVqjE=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=wuvI0iad7Gi4yC8JL6rqo2ynTzhMndXr6H3XY1BPkFmp+cse+5MEhPWxDN9X5GIaV
         wZQae4W2f3Iz+CZ2cejBFo+HMG8xkcY1KDfJ1Fl7XznTEdSxdnUwxE/1vngn88gbek
         YdarbgdokeB2Kc/h2NodAdWhaBKRxqyhOKBMkyYs=
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add blsp2_i2c3
Message-ID: <6qg4HkrclPyAcIF0MUN7hNVjz9VdppvGD8GeT2k@cp3-web-029.plabs.ch>
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
  =20
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 044db4ad2f3e..0cde4b7f863e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1340,6 +1340,20 @@ blsp2_uart3_4pins_sleep: blsp2-uart2-4pins-sleep {
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
@@ -3023,6 +3037,24 @@ blsp2_i2c2: i2c@75b6000 {
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
2.32.0


