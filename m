Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8425418AA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 21:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbhIZTIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 15:08:06 -0400
Received: from mail-4325.protonmail.ch ([185.70.43.25]:58825 "EHLO
        mail-4325.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbhIZTIF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 15:08:05 -0400
Date:   Sun, 26 Sep 2021 19:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632683184;
        bh=LWAOE37C/kM05HzrUj7w++3CWgqk3JHXi6PHW4x1QVM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=nVCgK5zJcexhIdQgFZlXGr/1wdi3ffc1zsSlO32LJ8iikMb/28l+b94iymp4/noh5
         FykazAoMXGZgRXOt/BwAOIfVVS+ySFnLEs+YTVpkJMJA03gkdAdF9WBJJdwTHinqm7
         Gq7GhoQB2JN0e5QAQU+bgr23C1NPVPcImrXJTqtE=
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
Subject: [PATCH v2 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
Message-ID: <20210926190555.278589-2-y.oudjana@protonmail.com>
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

Fix a total overlap between zap_shader_region and slpi_region, and rename
all regions to match the naming convention in other Qualcomm SoC device tre=
es.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 18 ++++--
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 18 +++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 63 ++++++++++---------
 3 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/=
arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 507396c4d23b..4c26e66f0610 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -13,9 +13,10 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
=20
-/delete-node/ &slpi_region;
-/delete-node/ &venus_region;
-/delete-node/ &zap_shader_region;
+/delete-node/ &adsp_mem;
+/delete-node/ &slpi_mem;
+/delete-node/ &venus_mem;
+/delete-node/ &gpu_mem;
=20
 / {
 =09qcom,msm-id =3D <246 0x30001>; /* MSM8996 V3.1 (Final) */
@@ -46,18 +47,23 @@ cont_splash_mem: memory@83401000 {
 =09=09=09no-map;
 =09=09};
=20
-=09=09zap_shader_region: gpu@90400000 {
+=09=09adsp_mem: adsp@8ea00000 {
+=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1a00000>;
+=09=09=09no-map;
+=09=09};
+
+=09=09gpu_mem: gpu@90400000 {
 =09=09=09compatible =3D "shared-dma-pool";
 =09=09=09reg =3D <0x0 0x90400000 0x0 0x2000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09slpi_region: memory@90500000 {
+=09=09slpi_mem: memory@90500000 {
 =09=09=09reg =3D <0 0x90500000 0 0xa00000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09venus_region: memory@90f00000 {
+=09=09venus_mem: memory@90f00000 {
 =09=09=09reg =3D <0 0x90f00000 0 0x500000>;
 =09=09=09no-map;
 =09=09};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm=
64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index d239b01b8505..a5e7bccadba2 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -66,32 +66,32 @@ memory@88800000 {
=20
 =09=09/* This platform has all PIL regions offset by 0x1400000 */
 =09=09/delete-node/ mpss@88800000;
-=09=09mpss_region: mpss@89c00000 {
+=09=09mpss_mem: mpss@89c00000 {
 =09=09=09reg =3D <0x0 0x89c00000 0x0 0x6200000>;
 =09=09=09no-map;
 =09=09};
=20
 =09=09/delete-node/ adsp@8ea00000;
-=09=09adsp_region: adsp@8ea00000 {
+=09=09adsp_mem: adsp@8fe00000 {
 =09=09=09reg =3D <0x0 0x8fe00000 0x0 0x1b00000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09/delete-node/ slpi@90b00000;
-=09=09slpi_region: slpi@91900000 {
+=09=09/delete-node/ slpi@90500000;
+=09=09slpi_mem: slpi@91900000 {
 =09=09=09reg =3D <0x0 0x91900000 0x0 0xa00000>;
 =09=09=09no-map;
 =09=09};
=20
-=09=09/delete-node/ gpu@8f200000;
-=09=09zap_shader_region: gpu@92300000 {
+=09=09/delete-node/ gpu@90f00000;
+=09=09gpu_mem: gpu@92300000 {
 =09=09=09compatible =3D "shared-dma-pool";
 =09=09=09reg =3D <0x0 0x92300000 0x0 0x2000>;
 =09=09=09no-map;
 =09=09};
=20
 =09=09/delete-node/ venus@91000000;
-=09=09venus_region: venus@90400000 {
+=09=09venus_mem: venus@92400000 {
 =09=09=09reg =3D <0x0 0x92400000 0x0 0x500000>;
 =09=09=09no-map;
 =09=09};
@@ -107,7 +107,7 @@ ramoops@92900000 {
 =09=09=09pmsg-size =3D <0x40000>;
 =09=09};
=20
-=09=09/delete-node/ rmtfs@86700000;
+=09=09/delete-node/ rmtfs;
 =09=09rmtfs@f6c00000 {
 =09=09=09compatible =3D "qcom,rmtfs-mem";
 =09=09=09reg =3D <0 0xf6c00000 0 0x200000>;
@@ -118,7 +118,7 @@ rmtfs@f6c00000 {
 =09=09};
=20
 =09=09/delete-node/ mba@91500000;
-=09=09mba_region: mba@f6f00000 {
+=09=09mba_mem: mba@f6f00000 {
 =09=09=09reg =3D <0x0 0xf6f00000 0x0 0x100000>;
 =09=09=09no-map;
 =09=09};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index eb3ec5ff46eb..1495fff6ffc9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -384,60 +384,65 @@ reserved-memory {
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
@@ -1013,7 +1018,7 @@ opp-133000000 {
 =09=09=09};
=20
 =09=09=09zap-shader {
-=09=09=09=09memory-region =3D <&zap_shader_region>;
+=09=09=09=09memory-region =3D <&gpu_mem>;
 =09=09=09};
 =09=09};
=20
@@ -2001,7 +2006,7 @@ venus: video-codec@c00000 {
 =09=09=09=09 <&venus_smmu 0x2c>,
 =09=09=09=09 <&venus_smmu 0x2d>,
 =09=09=09=09 <&venus_smmu 0x31>;
-=09=09=09memory-region =3D <&venus_region>;
+=09=09=09memory-region =3D <&venus_mem>;
 =09=09=09status =3D "disabled";
=20
 =09=09=09video-decoder {
@@ -3008,7 +3013,7 @@ adsp_pil: remoteproc@9300000 {
 =09=09=09clocks =3D <&xo_board>;
 =09=09=09clock-names =3D "xo";
=20
-=09=09=09memory-region =3D <&adsp_region>;
+=09=09=09memory-region =3D <&adsp_mem>;
=20
 =09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
 =09=09=09qcom,smem-state-names =3D "stop";
--=20
2.33.0


