Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C663433DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Mar 2021 18:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhCURq7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 13:46:59 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:58968 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhCURqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 13:46:33 -0400
Date:   Sun, 21 Mar 2021 17:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1616348792;
        bh=gmq6lQd1NWtTBrDin6uNBMByAAtGgaIcn+myFTSLQ/s=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MMsi0TleVJz7y1uj9wXqfmW/4SDHQjrCVHNu2pHqeeg+u8VThfJiYBtS26p3nSLqR
         jdpMFb/q/k4D8EiX2QlbfYCNxSIx7XeBq1dDBG1TJ+Y2qUevxxg3I2OH6Eh1H8RJLz
         AEQWaV3v/UrLaQviXV+sfvdbeTt+7E2f8pHaJya8=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8150: add other QUP nodes and iommus
Message-ID: <20210321174522.123036-2-caleb@connolly.tech>
In-Reply-To: <20210321174522.123036-1-caleb@connolly.tech>
References: <20210321174522.123036-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the first and third qupv3 nodes used to hook
up peripherals on some devices, as well as the iommus properties for all
of them.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qco=
m/sm8150.dtsi
index e5bb17bc2f46..543417d74216 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -577,12 +577,26 @@ gcc: clock-controller@100000 {
 =09=09=09=09 <&sleep_clk>;
 =09=09};
=20
+=09=09qupv3_id_0: geniqup@8c0000 {
+=09=09=09compatible =3D "qcom,geni-se-qup";
+=09=09=09reg =3D <0x0 0x008c0000 0x0 0x6000>;
+=09=09=09clock-names =3D "m-ahb", "s-ahb";
+=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0xc3 0x0>;
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <2>;
+=09=09=09ranges;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09qupv3_id_1: geniqup@ac0000 {
 =09=09=09compatible =3D "qcom,geni-se-qup";
 =09=09=09reg =3D <0x0 0x00ac0000 0x0 0x6000>;
 =09=09=09clock-names =3D "m-ahb", "s-ahb";
 =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
 =09=09=09=09 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x603 0x0>;
 =09=09=09#address-cells =3D <2>;
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
@@ -598,6 +612,20 @@ uart2: serial@a90000 {
 =09=09=09};
 =09=09};
=20
+=09=09qupv3_id_2: geniqup@cc0000 {
+=09=09=09compatible =3D "qcom,geni-se-qup";
+=09=09=09reg =3D <0x0 0x00cc0000 0x0 0x6000>;
+
+=09=09=09clock-names =3D "m-ahb", "s-ahb";
+=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x7a3 0x0>;
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <2>;
+=09=09=09ranges;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09config_noc: interconnect@1500000 {
 =09=09=09compatible =3D "qcom,sm8150-config-noc";
 =09=09=09reg =3D <0 0x01500000 0 0x7400>;
--=20
2.30.2


