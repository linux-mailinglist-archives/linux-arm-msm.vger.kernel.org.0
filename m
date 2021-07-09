Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C6B3C27F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhGIRFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:05:49 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:48413 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhGIRFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:05:49 -0400
Date:   Fri, 09 Jul 2021 17:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850152;
        bh=5bId7Sm91A3HT+RYYbNOEcA1cu5qpF8J4QRc4xYq4UM=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=hY3DlirngHr9v6/CRFUUwan6afbkvmkFh1THEefjuTpmxKuV8L6o6Uzufj32blKq6
         zigvWfnLdNS/8BKP0+43RnoYorH2rPdxfJpLDyC6jaT3P6wLOOSb/OjNJsbTNdNpDM
         qCHFfv7kCKSNfqd2r14hMEmLitWNa8vRz9sng5Jk=
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
Subject: [PATCH 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
Message-ID: <fzmn8bdpxO41bpKxyI7aD2zwEqKGGRVC3DhcM9EWY@cp3-web-020.plabs.ch>
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

Fix a total overlap between zap_shader_region and slpi_region, and rename
all regions to match the naming convention in other Qualcomm SoC device tre=
es.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 63 +++++++++++++++------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index a8811c704604..258be683ad6d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -150,60 +150,65 @@ reserved-memory {
 =09=09#size-cells =3D <2>;
 =09=09ranges;
=20
-=09=09mba_region: mba@91500000 {
-=09=09=09reg =3D <0x0 0x91500000 0x0 0x200000>;
+=09=09hyp_mem: memory@85800000 {
+=09=09=09reg =3D <0x0 0x85800000 0x0 0x600000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09slpi_region: slpi@90b00000 {
-=09=09=09reg =3D <0x0 0x90b00000 0x0 0xa00000>;
+=09=09xbl_mem: memory@85e00000 {
+=09=09=09reg =3D <0x0 0x85e00000 0x0 0x200000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09venus_region: venus@90400000 {
-=09=09=09reg =3D <0x0 0x90400000 0x0 0x700000>;
+=09=09smem_mem: smem-mem@86000000 {
+=09=09=09reg =3D <0x0 0x86000000 0x0 0x200000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09adsp_region: adsp@8ea00000 {
-=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1a00000>;
+=09=09tz_mem: memory@86200000 {
+=09=09=09reg =3D <0x0 0x86200000 0x0 0x2600000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09mpss_region: mpss@88800000 {
-=09=09=09reg =3D <0x0 0x88800000 0x0 0x6200000>;
+=09=09rmtfs_mem: rmtfs {
+=09=09=09compatible =3D "qcom,rmtfs-mem";
+
+=09=09=09size =3D <0x0 0x200000>;
+=09=09=09alloc-ranges =3D <0x0 0xa0000000 0x0 0x2000000>;
 =09=09=09no-map;
+
+=09=09=09qcom,client-id =3D <1>;
+=09=09=09qcom,vmid =3D <15>;
 =09=09};
=20
-=09=09smem_mem: smem-mem@86000000 {
-=09=09=09reg =3D <0x0 0x86000000 0x0 0x200000>;
+=09=09mpss_mem: mpss@88800000 {
+=09=09=09reg =3D <0x0 0x88800000 0x0 0x6200000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09memory@85800000 {
-=09=09=09reg =3D <0x0 0x85800000 0x0 0x800000>;
+=09=09adsp_mem: adsp@8ea00000 {
+=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1b00000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09memory@86200000 {
-=09=09=09reg =3D <0x0 0x86200000 0x0 0x2600000>;
+=09=09slpi_mem: slpi@90500000 {
+=09=09=09reg =3D <0x0 0x90500000 0x0 0xa00000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09rmtfs@86700000 {
-=09=09=09compatible =3D "qcom,rmtfs-mem";
-
-=09=09=09size =3D <0x0 0x200000>;
-=09=09=09alloc-ranges =3D <0x0 0xa0000000 0x0 0x2000000>;
+=09=09gpu_mem: gpu@90f00000 {
+=09=09=09compatible =3D "shared-dma-pool";
+=09=09=09reg =3D <0x0 0x90f00000 0x0 0x100000>;
 =09=09=09no-map;
+=09=09};
=20
-=09=09=09qcom,client-id =3D <1>;
-=09=09=09qcom,vmid =3D <15>;
+=09=09venus_mem: venus@91000000 {
+=09=09=09reg =3D <0x0 0x91000000 0x0 0x500000>;
+=09=09=09no-map;
 =09=09};
=20
-=09=09zap_shader_region: gpu@8f200000 {
-=09=09=09compatible =3D "shared-dma-pool";
-=09=09=09reg =3D <0x0 0x90b00000 0x0 0xa00000>;
+=09=09mba_mem: mba@91500000 {
+=09=09=09reg =3D <0x0 0x91500000 0x0 0x200000>;
 =09=09=09no-map;
 =09=09};
 =09};
@@ -690,7 +695,7 @@ opp-133000000 {
 =09=09=09};
=20
 =09=09=09zap-shader {
-=09=09=09=09memory-region =3D <&zap_shader_region>;
+=09=09=09=09memory-region =3D <&gpu_mem>;
 =09=09=09};
 =09=09};
=20
@@ -1183,7 +1188,7 @@ video-codec@c00000 {
 =09=09=09=09 <&venus_smmu 0x2c>,
 =09=09=09=09 <&venus_smmu 0x2d>,
 =09=09=09=09 <&venus_smmu 0x31>;
-=09=09=09memory-region =3D <&venus_region>;
+=09=09=09memory-region =3D <&venus_mem>;
 =09=09=09status =3D "okay";
=20
 =09=09=09video-decoder {
@@ -2063,7 +2068,7 @@ adsp_pil: remoteproc@9300000 {
 =09=09=09clocks =3D <&xo_board>;
 =09=09=09clock-names =3D "xo";
=20
-=09=09=09memory-region =3D <&adsp_region>;
+=09=09=09memory-region =3D <&adsp_mem>;
=20
 =09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
 =09=09=09qcom,smem-state-names =3D "stop";
--=20
2.32.0


