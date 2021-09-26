Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970ED418AAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 21:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhIZTIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 15:08:12 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:28613 "EHLO
        mail-4318.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhIZTIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 15:08:10 -0400
Date:   Sun, 26 Sep 2021 19:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632683191;
        bh=oqFbCeCc6o9yr1xwdz7yiLzjrQnuGfa2Ku5w5u0x9AQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=wEGHL0w679/Hmdc0NB/oRBdVHk5RjB9Ox0XVG1nnuwdIfFhNZNVyBmNCmrtJgRxNq
         Rk+/7RNCff//K3VhnNCvV/Cgs2ZUP9i88ZTK71j188OLWeBLemCHIddEaAxpR1JHGO
         81a2vaPICMRx6Ittg2nITI6iSRKOAxWlWyf2onU4=
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
Subject: [PATCH v2 3/5] arm64: dts: qcom: msm8996: Unify smp2p naming
Message-ID: <20210926190555.278589-4-y.oudjana@protonmail.com>
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

Rename smp2p-modem to smp2p-mpss, and make the subnode labels of smp2p_adsp
and smp2p_slpi follow the <name>_smp2p_<out/in> layout.
Also move smp2p_slpi_out above smp2p_slpi_in to make it match mpss and adsp
where master-kernel is the first subnode.

This patch brings no functional change.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 33 ++++++++++++++-------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 1495fff6ffc9..7710ca6f3374 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -518,12 +518,12 @@ smp2p-adsp {
 =09=09qcom,local-pid =3D <0>;
 =09=09qcom,remote-pid =3D <2>;
=20
-=09=09smp2p_adsp_out: master-kernel {
+=09=09adsp_smp2p_out: master-kernel {
 =09=09=09qcom,entry-name =3D "master-kernel";
 =09=09=09#qcom,smem-state-cells =3D <1>;
 =09=09};
=20
-=09=09smp2p_adsp_in: slave-kernel {
+=09=09adsp_smp2p_in: slave-kernel {
 =09=09=09qcom,entry-name =3D "slave-kernel";
=20
 =09=09=09interrupt-controller;
@@ -531,7 +531,7 @@ smp2p_adsp_in: slave-kernel {
 =09=09};
 =09};
=20
-=09smp2p-modem {
+=09smp2p-mpss {
 =09=09compatible =3D "qcom,smp2p";
 =09=09qcom,smem =3D <435>, <428>;
=20
@@ -542,12 +542,12 @@ smp2p-modem {
 =09=09qcom,local-pid =3D <0>;
 =09=09qcom,remote-pid =3D <1>;
=20
-=09=09modem_smp2p_out: master-kernel {
+=09=09mpss_smp2p_out: master-kernel {
 =09=09=09qcom,entry-name =3D "master-kernel";
 =09=09=09#qcom,smem-state-cells =3D <1>;
 =09=09};
=20
-=09=09modem_smp2p_in: slave-kernel {
+=09=09mpss_smp2p_in: slave-kernel {
 =09=09=09qcom,entry-name =3D "slave-kernel";
=20
 =09=09=09interrupt-controller;
@@ -566,16 +566,17 @@ smp2p-slpi {
 =09=09qcom,local-pid =3D <0>;
 =09=09qcom,remote-pid =3D <3>;
=20
-=09=09smp2p_slpi_in: slave-kernel {
+=09=09slpi_smp2p_out: master-kernel {
+=09=09=09qcom,entry-name =3D "master-kernel";
+=09=09=09#qcom,smem-state-cells =3D <1>;
+=09=09};
+
+=09=09slpi_smp2p_in: slave-kernel {
 =09=09=09qcom,entry-name =3D "slave-kernel";
+
 =09=09=09interrupt-controller;
 =09=09=09#interrupt-cells =3D <2>;
 =09=09};
-
-=09=09smp2p_slpi_out: master-kernel {
-=09=09=09qcom,entry-name =3D "master-kernel";
-=09=09=09#qcom,smem-state-cells =3D <1>;
-=09=09};
 =09};
=20
 =09soc: soc {
@@ -3003,10 +3004,10 @@ adsp_pil: remoteproc@9300000 {
 =09=09=09reg =3D <0x09300000 0x80000>;
=20
 =09=09=09interrupts-extended =3D <&intc 0 162 IRQ_TYPE_EDGE_RISING>,
-=09=09=09=09=09      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-=09=09=09=09=09      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-=09=09=09=09=09      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-=09=09=09=09=09      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+=09=09=09=09=09      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 =09=09=09interrupt-names =3D "wdog", "fatal", "ready",
 =09=09=09=09=09  "handover", "stop-ack";
=20
@@ -3015,7 +3016,7 @@ adsp_pil: remoteproc@9300000 {
=20
 =09=09=09memory-region =3D <&adsp_mem>;
=20
-=09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
+=09=09=09qcom,smem-states =3D <&adsp_smp2p_out 0>;
 =09=09=09qcom,smem-state-names =3D "stop";
=20
 =09=09=09power-domains =3D <&rpmpd MSM8996_VDDCX>;
--=20
2.33.0


