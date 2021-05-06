Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E4C375CC8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 23:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhEFVUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 17:20:05 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:46488 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbhEFVUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 17:20:04 -0400
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4Fbmfd1T2gz4x8RH
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 May 2021 21:19:05 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="vEUlZx9B"
Date:   Thu, 06 May 2021 21:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620335940;
        bh=hOrbqVj5R3JVLRiDgquRCxHlYsob+D3PH8ZLMkNz0DQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=vEUlZx9BpIVLYi+i8KmAnglGAhY0Lm+PIWgY+jzs7hfCLrg2nNt+6cGhKjfk+jh+t
         MW/USfsin/HVSWU0gRSSR3DqrLvTlTXA8hNDtHUcNzmek7ypLAcoBu346h8ed+gu0G
         +qOE5bKEtiOU5gdivGNSoTUgxnzYSx0iCMl+hGNA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8996: Disable ADSP and add power domains
Message-ID: <Epn1vFjJb0oQhqMYxspzL6X1N6MPcDT1f9oVVOjXc@cp3-web-020.plabs.ch>
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

Disable ADSP by default and enable it in devices that use it.
Also add CX power domain.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot=
/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..409a5dec2615 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -162,6 +162,10 @@ bluetooth {
 =09};
 };
=20
+&adsp_pil {
+=09status =3D "okay";
+};
+
 &blsp2_i2c0 {
 =09/* On High speed expansion */
 =09label =3D "HS-I2C2";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index ce430ba9c118..7e647843f7c7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8996.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
=20
 / {
@@ -2067,6 +2068,11 @@ adsp_pil: remoteproc@9300000 {
 =09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
 =09=09=09qcom,smem-state-names =3D "stop";
=20
+=09=09=09power-domains =3D <&rpmpd MSM8996_VDDCX>;
+=09=09=09power-domain-names =3D "cx";
+
+=09=09=09status =3D "disabled";
+
 =09=09=09smd-edge {
 =09=09=09=09interrupts =3D <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
=20
--=20
2.31.1


