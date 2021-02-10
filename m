Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4164B31656E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 12:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhBJLo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 06:44:26 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:40828 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhBJLmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 06:42:21 -0500
Date:   Wed, 10 Feb 2021 11:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612957251;
        bh=sq5qGtUgy8PiKaUloWYV0Rn3UxNBbao5MT92ExM8mqc=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=ZuMGEVfAOj3IxJjy2xeEVTnC/v3rZ8kXzyOAhMCohgRJ4SVD6HGOGpz4CEHmB2HRG
         PP+V4dIIRlP6kNK6AyK1dM+HkRFaA+CpUu/DfcFCZDt6q4p9urGe/DxH8AoEPeW7ea
         eTxy7fG3sbjmS2Wn/AwHF0xUs9lxvTerXYWOsz4c=
To:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add gpu cooling support
Message-ID: <Ku7mRZ_q2mYDZQ048IPlAc8VOVhH8N4uENhMI-JXxjeiZxjbRRs40ZJYwREb_ScgCvtQgtdl1VRjoDd7CR_8vCrbWVe8n3MwyB1S3VbSDis=@protonmail.com>
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

Add cooling-cells property and cooling maps for the GPU.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 7eef07e73e25..19bfca3133a4 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/thermal/thermal.h>

 / {
 =09interrupt-parent =3D <&intc>;
@@ -618,7 +619,7 @@ hdmi_phy: hdmi-phy@9a0600 {
 =09=09=09=09=09      "ref";
 =09=09=09};
 =09=09};
-=09=09gpu@b00000 {
+=09=09gpu: gpu@b00000 {
 =09=09=09compatible =3D "qcom,adreno-530.2", "qcom,adreno";
 =09=09=09#stream-id-cells =3D <16>;

@@ -650,6 +651,8 @@ gpu@b00000 {

 =09=09=09operating-points-v2 =3D <&gpu_opp_table>;

+=09=09=09#cooling-cells =3D <2>;
+
 =09=09=09gpu_opp_table: opp-table {
 =09=09=09=09compatible  =3D"operating-points-v2";

@@ -2305,7 +2308,14 @@ trips {
 =09=09=09=09gpu1_alert0: trip-point0 {
 =09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
-=09=09=09=09=09type =3D "hot";
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&gpu1_alert0>;
+=09=09=09=09=09cooling-device =3D <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>=
;
 =09=09=09=09};
 =09=09=09};
 =09=09};
@@ -2320,7 +2330,14 @@ trips {
 =09=09=09=09gpu2_alert0: trip-point0 {
 =09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
-=09=09=09=09=09type =3D "hot";
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+=09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&gpu2_alert0>;
+=09=09=09=09=09cooling-device =3D <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>=
;
 =09=09=09=09};
 =09=09=09};
 =09=09};
--
2.30.0

