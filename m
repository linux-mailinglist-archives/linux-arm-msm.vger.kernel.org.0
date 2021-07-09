Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A933C27ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbhGIRFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:05:34 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:56502 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhGIRFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:05:34 -0400
Date:   Fri, 09 Jul 2021 17:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850167;
        bh=80lmMy862wGV7v35JfsLiPl1/HjheMwvUvIo/8ZENUg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Gp24XLw/S5svc20MAO9+IpQBCx3c6mrjZTCzRlWlUCjieRJuRYxVFZ0Co7o3I+wGu
         LBDJx8et1P+Lc8FkCOP4GEDm12FcdFV0SKrG1xpbSAqH4qILSlAgqvVmSq9I0B4WT2
         XxGD0+5aVe7fQ/svYVP9/BJIadrW3SBG6ujHjUHA=
To:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Dr. Git" <drgitx@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 2/5] arm64: dts: qcom: msm8996: Unify smp2p naming
Message-ID: <PjoL1JJVMLZRdErmWrNSNtHThaVx4nsyD2sXKMEpQ@cp4-web-038.plabs.ch>
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
index 258be683ad6d..559612a3ddeb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -284,12 +284,12 @@ smp2p-adsp {
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
@@ -297,7 +297,7 @@ smp2p_adsp_in: slave-kernel {
 =09=09};
 =09};
=20
-=09smp2p-modem {
+=09smp2p-mpss {
 =09=09compatible =3D "qcom,smp2p";
 =09=09qcom,smem =3D <435>, <428>;
=20
@@ -308,12 +308,12 @@ smp2p-modem {
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
@@ -332,16 +332,17 @@ smp2p-slpi {
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
@@ -2058,10 +2059,10 @@ adsp_pil: remoteproc@9300000 {
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
@@ -2070,7 +2071,7 @@ adsp_pil: remoteproc@9300000 {
=20
 =09=09=09memory-region =3D <&adsp_mem>;
=20
-=09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
+=09=09=09qcom,smem-states =3D <&adsp_smp2p_out 0>;
 =09=09=09qcom,smem-state-names =3D "stop";
=20
 =09=09=09power-domains =3D <&rpmpd MSM8996_VDDCX>;
--=20
2.32.0


