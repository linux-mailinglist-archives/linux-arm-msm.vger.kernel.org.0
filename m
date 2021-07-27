Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AC93D7081
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 09:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhG0HmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 03:42:18 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:45327 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbhG0HmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 03:42:17 -0400
Date:   Tue, 27 Jul 2021 07:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1627371734;
        bh=HiZPZfrpeXDNpkWKRFr9rPzKk6vLeH+/6Vh/isEMjz0=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=PKTYaCQ5sXNMylG/ql9dF/fScBSqVDnjze4z3aNKjvnXRM7irdkuv9WsezL2YXrs+
         tBxCmeAamVY4HUq2KUVW4OQphZ0xPyoC0TVVps5Il9Hu+Nc/HqrW99rAc7xX/Nh3vt
         dzX2qc7JE0JJzFK4XR/enGA2tSC/inZzSQtyLKGE=
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add CPU cooling support
Message-ID: <jmayJcXoExAK2G7UBIXMz5CDN0BYgYkFZguHlPNRFOU@cp4-web-038.plabs.ch>
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

Add second trip points and cooling maps for all CPUs.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 84 +++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index bfd0acfcce7e..0327e6f19fcb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3591,7 +3591,13 @@ cpu0-thermal {
=20
 =09=09=09trips {
 =09=09=09=09cpu0_alert0: trip-point0 {
-=09=09=09=09=09temperature =3D <75000>;
+=09=09=09=09=09temperature =3D <85000>;
+=09=09=09=09=09hysteresis =3D <2000>;
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+
+=09=09=09=09cpu0_alert1: trip-point1 {
+=09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
 =09=09=09=09=09type =3D "passive";
 =09=09=09=09};
@@ -3602,6 +3608,19 @@ cpu0_crit: cpu_crit {
 =09=09=09=09=09type =3D "critical";
 =09=09=09=09};
 =09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&cpu0_alert0>;
+=09=09=09=09=09cooling-device =3D <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09=09map1 {
+=09=09=09=09=09trip =3D <&cpu0_alert1>;
+=09=09=09=09=09cooling-device =3D <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09cpu1-thermal {
@@ -3612,7 +3631,13 @@ cpu1-thermal {
=20
 =09=09=09trips {
 =09=09=09=09cpu1_alert0: trip-point0 {
-=09=09=09=09=09temperature =3D <75000>;
+=09=09=09=09=09temperature =3D <85000>;
+=09=09=09=09=09hysteresis =3D <2000>;
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+
+=09=09=09=09cpu1_alert1: trip-point1 {
+=09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
 =09=09=09=09=09type =3D "passive";
 =09=09=09=09};
@@ -3623,6 +3648,19 @@ cpu1_crit: cpu_crit {
 =09=09=09=09=09type =3D "critical";
 =09=09=09=09};
 =09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&cpu1_alert0>;
+=09=09=09=09=09cooling-device =3D <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09=09map1 {
+=09=09=09=09=09trip =3D <&cpu1_alert1>;
+=09=09=09=09=09cooling-device =3D <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09cpu2-thermal {
@@ -3633,7 +3671,13 @@ cpu2-thermal {
=20
 =09=09=09trips {
 =09=09=09=09cpu2_alert0: trip-point0 {
-=09=09=09=09=09temperature =3D <75000>;
+=09=09=09=09=09temperature =3D <85000>;
+=09=09=09=09=09hysteresis =3D <2000>;
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+
+=09=09=09=09cpu2_alert1: trip-point1 {
+=09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
 =09=09=09=09=09type =3D "passive";
 =09=09=09=09};
@@ -3644,6 +3688,19 @@ cpu2_crit: cpu_crit {
 =09=09=09=09=09type =3D "critical";
 =09=09=09=09};
 =09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&cpu2_alert0>;
+=09=09=09=09=09cooling-device =3D <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09=09map1 {
+=09=09=09=09=09trip =3D <&cpu2_alert1>;
+=09=09=09=09=09cooling-device =3D <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09cpu3-thermal {
@@ -3654,7 +3711,13 @@ cpu3-thermal {
=20
 =09=09=09trips {
 =09=09=09=09cpu3_alert0: trip-point0 {
-=09=09=09=09=09temperature =3D <75000>;
+=09=09=09=09=09temperature =3D <85000>;
+=09=09=09=09=09hysteresis =3D <2000>;
+=09=09=09=09=09type =3D "passive";
+=09=09=09=09};
+
+=09=09=09=09cpu3_alert1: trip-point1 {
+=09=09=09=09=09temperature =3D <90000>;
 =09=09=09=09=09hysteresis =3D <2000>;
 =09=09=09=09=09type =3D "passive";
 =09=09=09=09};
@@ -3665,6 +3728,19 @@ cpu3_crit: cpu_crit {
 =09=09=09=09=09type =3D "critical";
 =09=09=09=09};
 =09=09=09};
+
+=09=09=09cooling-maps {
+=09=09=09=09map0 {
+=09=09=09=09=09trip =3D <&cpu3_alert0>;
+=09=09=09=09=09cooling-device =3D <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09=09map1 {
+=09=09=09=09=09trip =3D <&cpu3_alert1>;
+=09=09=09=09=09cooling-device =3D <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT=
>,
+=09=09=09=09=09=09=09 <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+=09=09=09=09};
+=09=09=09};
 =09=09};
=20
 =09=09gpu-thermal-top {
--=20
2.32.0


