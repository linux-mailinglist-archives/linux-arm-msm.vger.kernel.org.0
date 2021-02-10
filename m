Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C14316483
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 12:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhBJLCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 06:02:03 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:39002 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhBJK7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 05:59:51 -0500
Date:   Wed, 10 Feb 2021 10:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612954686;
        bh=GRRV1eBGqOks0+oMuJPFV2qf6WNyQkliy1bbSM1rdeM=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=bU5LjjP29E8rR5cjyhqZL57GnwCL7lv8a+ssDMDH09ITZxzvTvE7w6pbdRS0aqO/t
         QFfFeHqiZdtHSL3hK73E4yuSNTrnCUyOyg5yij6X1QvhUNprOOm1zQSj0AY0/9p+50
         JE5LCOBeNOR9hoPKyPooBsGz/vEal5Zv8+sK7zPA=
To:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v2] arm64: dts: qcom: pm8994: Add resin node to PON
Message-ID: <BmEPgqFMiMXOzn9xFz6KSPtOZdWoeJ8zUpGXI_p7U9FBBSgbG2IP6Akuvb-WWzy7MVuBkrhOas158Vd9klSLFmrbSRGEpQGouiAFpsf03Ag=@protonmail.com>
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

Add resin as a child node of PON, and specify its key code on apq8096-db820=
c.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 18 ++++--------------
 arch/arm64/boot/dts/qcom/pm8994.dtsi         |  6 ++++++
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot=
/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..8e129bcc20ba 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -951,6 +951,10 @@ dai@2 {
 =09};
 };

+&resin {
+=09linux,code =3D <KEY_VOLUMEDOWN>;
+};
+
 &sound {
 =09compatible =3D "qcom,apq8096-sndcard";
 =09model =3D "DB820c";
@@ -1026,20 +1030,6 @@ codec {
 =09};
 };

-&spmi_bus {
-=09pmic@0 {
-=09=09pon@800 {
-=09=09=09resin {
-=09=09=09=09compatible =3D "qcom,pm8941-resin";
-=09=09=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-=09=09=09=09debounce =3D <15625>;
-=09=09=09=09bias-pull-up;
-=09=09=09=09linux,code =3D <KEY_VOLUMEDOWN>;
-=09=09=09};
-=09=09};
-=09};
-};
-
 &ufsphy {
 =09status =3D "okay";

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qco=
m/pm8994.dtsi
index 5ffdf37d8e31..b4828188417e 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -58,6 +58,12 @@ pwrkey {
 =09=09=09=09linux,code =3D <KEY_POWER>;
 =09=09=09};

+=09=09=09resin: resin {
+=09=09=09=09compatible =3D "qcom,pm8941-resin";
+=09=09=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09=09debounce =3D <15625>;
+=09=09=09=09bias-pull-up;
+=09=09=09};
 =09=09};

 =09=09pm8994_temp: temp-alarm@2400 {
--
2.30.0

