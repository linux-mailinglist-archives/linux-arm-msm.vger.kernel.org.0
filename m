Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6526E418AB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 21:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhIZTIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 15:08:36 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:39577 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhIZTI2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 15:08:28 -0400
Date:   Sun, 26 Sep 2021 19:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632683208;
        bh=+PfaojyNFfNS+b57P5nhag3I4JQQOCndTo83SZ1C6nc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=vk+hcC9Bl1wBTMZhtDhAYUNfHEuecydKb9W8qz2z1bFWLMLT7FGvf8MABZlgsYr+x
         05fT83ofSoEtsV9vtyOkSjRT4sRvb3DZK5M/17k1YNRDfRrVezZ6SLE6xPtsmjWNyW
         HvSXdTTtGebyUDWliKMZqj8x+/FM2gj3T09qJjJY=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: msm8996-xiaomi-*: Enable MSS and SLPI
Message-ID: <20210926190555.278589-6-y.oudjana@protonmail.com>
In-Reply-To: <20210926190555.278589-1-y.oudjana@protonmail.com>
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
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

Enable mss_pil and slpi_pil and set their firmware paths.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts  |  9 +++++++++
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index a5e7bccadba2..863537f504f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -267,6 +267,12 @@ &mmcc {
 =09vdd-gfx-supply =3D <&vdd_gfx>;
 };
=20
+&mss_pil {
+=09status =3D "okay";
+
+=09pll-supply =3D <&vreg_l12a_1p8>;
+};
+
 &pcie0 {
 =09status =3D "okay";
=20
@@ -291,6 +297,12 @@ &pm8994_resin {
 =09linux,code =3D <KEY_VOLUMEDOWN>;
 };
=20
+&slpi_pil {
+=09status =3D "okay";
+
+=09px-supply =3D <&vreg_lvs2a_1p8>;
+};
+
 &usb3 {
 =09status =3D "okay";
 =09extcon =3D <&typec>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm6=
4/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index 77d508e5164a..c0d14bd0f25b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -96,6 +96,11 @@ zap-shader {
 =09};
 };
=20
+&mss_pil {
+=09firmware-name =3D "qcom/msm8996/gemini/mba.mbn",
+=09=09=09"qcom/msm8996/gemini/modem.mbn";
+};
+
 &q6asmdai {
 =09dai@0 {
 =09=09reg =3D <0>;
@@ -110,6 +115,10 @@ dai@2 {
 =09};
 };
=20
+&slpi_pil {
+=09firmware-name =3D "qcom/msm8996/gemini/slpi.mbn";
+};
+
 &sound {
 =09compatible =3D "qcom,apq8096-sndcard";
 =09model =3D "gemini";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
index ea2ca271fe7d..7f1523f66d38 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-scorpio.dts
@@ -96,6 +96,11 @@ &mdss {
 =09status =3D "disabled";
 };
=20
+&mss_pil {
+=09firmware-name =3D "qcom/msm8996/scorpio/mba.mbn",
+=09=09=09"qcom/msm8996/scorpio/modem.mbn";
+};
+
 &q6asmdai {
 =09dai@0 {
 =09=09reg =3D <0>;
@@ -110,6 +115,10 @@ dai@2 {
 =09};
 };
=20
+&slpi_pil {
+=09firmware-name =3D "qcom/msm8996/scorpio/slpi.mbn";
+};
+
 &sound {
 =09compatible =3D "qcom,apq8096-sndcard";
 =09model =3D "scorpio";
--=20
2.33.0


