Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB3B3A50AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 22:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhFLU5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 16:57:01 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:56414 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhFLU5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 16:57:00 -0400
Date:   Sat, 12 Jun 2021 20:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623531299;
        bh=bbNOpruoSBcruk2LNpe9Xjxp4kzCAAldzydWEyx68YQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=aKFGcOJzcp0FDZ4+wshivY+nA+E/ZqOyEdeBByQiMYwfIaZmCNuW5HML8c3xlEkzf
         EwzgFn3u0GpeqrC+dk7KsTuLeWNPjdfF+uMGHT9QiCzygVTeu5XIBwwg6U6c+4W3R1
         E1i614A+0NzUonJwvxUUgLXm81TuywL7M6XComv4=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 3/4] arm64: dts: qcom: pmi8998: introduce qpnp haptics
Message-ID: <20210612205405.1233588-4-caleb@connolly.tech>
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

Add bindings for Qualcomm QPNP haptics, setting default values used on
most devices.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qc=
om/pmi8998.dtsi
index d230c510d4b7..ccf64c1898d4 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/input/qcom,qpnp-haptics.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>

@@ -41,5 +42,20 @@ lab: lab {
 =09=09=09=09interrupt-names =3D "sc-err", "ocp";
 =09=09=09};
 =09=09};
+
+=09=09qpnp_haptics: qcom,haptics@c000 {
+=09=09=09compatible =3D "qcom,qpnp-haptics";
+=09=09=09reg =3D <0xc000 0x100>;
+
+=09=09=09interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
+=09=09=09=09     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09interrupt-names =3D "short", "play";
+
+=09=09=09qcom,wave-shape =3D <HAP_WAVE_SINE>;
+=09=09=09qcom,play-mode =3D <HAP_PLAY_BUFFER>;
+=09=09=09qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
+
+=09=09=09status =3D "disabled";
+=09=09};
 =09};
 };
--
2.31.1


