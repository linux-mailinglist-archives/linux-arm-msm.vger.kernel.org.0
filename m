Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60A8443B77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 03:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhKCCpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 22:45:22 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:59336 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhKCCpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 22:45:21 -0400
Date:   Wed, 03 Nov 2021 02:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1635907362;
        bh=4uE4ykr+J3w0ILwejY+w4R1tl1K1S3DQISYVJru9WIo=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=oNdMb84kxJLOuKJGGqb9XOBzzo/ol1iwEkqF6hmU/AIydbuY1Z18gZJndGmFvSGSJ
         YhAgTdTpqO46MB/aJvUU3n6wzb4e/ckvBokfLmt6Tb5+MzsQnhnGRHEcgz/cMAo6nc
         0r4AWDYtJBEilLehVE0Mh0T3YapjsA+CFw4KfV8o=
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
Message-ID: <91b184266e545efcc5969fe6661b50da82351119.camel@protonmail.com>
In-Reply-To: <4455e52f-7e8a-c431-9977-dcf4aefe9822@linaro.org>
References: <20210926190555.278589-1-y.oudjana@protonmail.com> <20210926190555.278589-2-y.oudjana@protonmail.com> <YXTNL7boyiRFKQiV@builder.lan> <4455e52f-7e8a-c431-9977-dcf4aefe9822@linaro.org>
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

On Wed, 2021-11-03 at 03:50 +0400, Dmitry Baryshkov wrote:
> On 24/10/2021 06:04, Bjorn Andersson wrote:
> > On Sun 26 Sep 14:06 CDT 2021, Yassine Oudjana wrote:
> >=20
> > > Fix a total overlap between zap_shader_region and slpi_region, and re=
name
> > > all regions to match the naming convention in other Qualcomm SoC devi=
ce trees.
> > >=20
> > > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> >=20
> > FYI, I like this series, but I held off applying it because I wanted to
> > verify that the shuffling of the memory regions works on the existing
> > 8996 boards.
> >=20
> > Unfortunately it didn't work, either with or without the shuffling on
> > the db820c - and I've not found the time to figure out why that is. I
> > hope to get back to this shortly (or that someone else will figure it
> > out and provide a tested-by)
>=20
> I gave this a test too on my db820c. Usually the board MSS will crash
> after ~0.1 - 0.15 seconds after booting up, then during recovery the
> board will crash/reboot somewhere at the end of q6v5_mss_load() (and
> typically after successful q6v5_rmb_mba_wait() call.

> Occasionally (approximately 1 of 20) the MSS will not crash, presenting
> PDS service to the userspace. Even in this state it doesn't seem to be
> able to lock the gps location (but this might be related to the big UART
> mezzanine sitting on top of the board).

I've had MSS crash on xiaomi-scorpio too, but far less often. It seemed
like some sort of race condition, as it only happened when ADSP and MSS
were booted at the same time. To workaround this, I delayed loading of
the rmtfs service to leave some time between booting ADSP and MSS.

>=20
> Unfortunately there seem to be no SLPI firmware for the db820c, so I can
> not test slpi.
>=20
> A notice regarding the patchset itself. It looks like pil_q6v5_mss.c
> driver misses mx and cx proxy power domains for the MSS_MSM8996 case.

I didn't notice that. I guess they stay on and MSS is able to boot
anyway. I'll add them similar to PATCH 2/5.

>=20
> >=20
> > Regards,
> > Bjorn
> >=20
> > > ---
> > >   .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 18 ++++--
> > >   .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  | 18 +++---
> > >   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 63 ++++++++++------=
---
> > >   3 files changed, 55 insertions(+), 44 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b=
/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> > > index 507396c4d23b..4c26e66f0610 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> > > @@ -13,9 +13,10 @@
> > >   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > >   #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> > >=20
> > > -/delete-node/ &slpi_region;
> > > -/delete-node/ &venus_region;
> > > -/delete-node/ &zap_shader_region;
> > > +/delete-node/ &adsp_mem;
> > > +/delete-node/ &slpi_mem;
> > > +/delete-node/ &venus_mem;
> > > +/delete-node/ &gpu_mem;
> > >=20
> > >   / {
> > >   =09qcom,msm-id =3D <246 0x30001>; /* MSM8996 V3.1 (Final) */
> > > @@ -46,18 +47,23 @@ cont_splash_mem: memory@83401000 {
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09zap_shader_region: gpu@90400000 {
> > > +=09=09adsp_mem: adsp@8ea00000 {
> > > +=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1a00000>;
> > > +=09=09=09no-map;
> > > +=09=09};
> > > +
> > > +=09=09gpu_mem: gpu@90400000 {
> > >   =09=09=09compatible =3D "shared-dma-pool";
> > >   =09=09=09reg =3D <0x0 0x90400000 0x0 0x2000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09slpi_region: memory@90500000 {
> > > +=09=09slpi_mem: memory@90500000 {
> > >   =09=09=09reg =3D <0 0x90500000 0 0xa00000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09venus_region: memory@90f00000 {
> > > +=09=09venus_mem: memory@90f00000 {
> > >   =09=09=09reg =3D <0 0x90f00000 0 0x500000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/ar=
ch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> > > index d239b01b8505..a5e7bccadba2 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
> > > @@ -66,32 +66,32 @@ memory@88800000 {
> > >=20
> > >   =09=09/* This platform has all PIL regions offset by 0x1400000 */
> > >   =09=09/delete-node/ mpss@88800000;
> > > -=09=09mpss_region: mpss@89c00000 {
> > > +=09=09mpss_mem: mpss@89c00000 {
> > >   =09=09=09reg =3D <0x0 0x89c00000 0x0 0x6200000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > >   =09=09/delete-node/ adsp@8ea00000;
> > > -=09=09adsp_region: adsp@8ea00000 {
> > > +=09=09adsp_mem: adsp@8fe00000 {
> > >   =09=09=09reg =3D <0x0 0x8fe00000 0x0 0x1b00000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09/delete-node/ slpi@90b00000;
> > > -=09=09slpi_region: slpi@91900000 {
> > > +=09=09/delete-node/ slpi@90500000;
> > > +=09=09slpi_mem: slpi@91900000 {
> > >   =09=09=09reg =3D <0x0 0x91900000 0x0 0xa00000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09/delete-node/ gpu@8f200000;
> > > -=09=09zap_shader_region: gpu@92300000 {
> > > +=09=09/delete-node/ gpu@90f00000;
> > > +=09=09gpu_mem: gpu@92300000 {
> > >   =09=09=09compatible =3D "shared-dma-pool";
> > >   =09=09=09reg =3D <0x0 0x92300000 0x0 0x2000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > >   =09=09/delete-node/ venus@91000000;
> > > -=09=09venus_region: venus@90400000 {
> > > +=09=09venus_mem: venus@92400000 {
> > >   =09=09=09reg =3D <0x0 0x92400000 0x0 0x500000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > > @@ -107,7 +107,7 @@ ramoops@92900000 {
> > >   =09=09=09pmsg-size =3D <0x40000>;
> > >   =09=09};
> > >=20
> > > -=09=09/delete-node/ rmtfs@86700000;
> > > +=09=09/delete-node/ rmtfs;
> > >   =09=09rmtfs@f6c00000 {
> > >   =09=09=09compatible =3D "qcom,rmtfs-mem";
> > >   =09=09=09reg =3D <0 0xf6c00000 0 0x200000>;
> > > @@ -118,7 +118,7 @@ rmtfs@f6c00000 {
> > >   =09=09};
> > >=20
> > >   =09=09/delete-node/ mba@91500000;
> > > -=09=09mba_region: mba@f6f00000 {
> > > +=09=09mba_mem: mba@f6f00000 {
> > >   =09=09=09reg =3D <0x0 0xf6f00000 0x0 0x100000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/=
dts/qcom/msm8996.dtsi
> > > index eb3ec5ff46eb..1495fff6ffc9 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > > @@ -384,60 +384,65 @@ reserved-memory {
> > >   =09=09#size-cells =3D <2>;
> > >   =09=09ranges;
> > >=20
> > > -=09=09mba_region: mba@91500000 {
> > > -=09=09=09reg =3D <0x0 0x91500000 0x0 0x200000>;
> > > +=09=09hyp_mem: memory@85800000 {
> > > +=09=09=09reg =3D <0x0 0x85800000 0x0 0x600000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09slpi_region: slpi@90b00000 {
> > > -=09=09=09reg =3D <0x0 0x90b00000 0x0 0xa00000>;
> > > +=09=09xbl_mem: memory@85e00000 {
> > > +=09=09=09reg =3D <0x0 0x85e00000 0x0 0x200000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09venus_region: venus@90400000 {
> > > -=09=09=09reg =3D <0x0 0x90400000 0x0 0x700000>;
> > > +=09=09smem_mem: smem-mem@86000000 {
> > > +=09=09=09reg =3D <0x0 0x86000000 0x0 0x200000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09adsp_region: adsp@8ea00000 {
> > > -=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1a00000>;
> > > +=09=09tz_mem: memory@86200000 {
> > > +=09=09=09reg =3D <0x0 0x86200000 0x0 0x2600000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09mpss_region: mpss@88800000 {
> > > -=09=09=09reg =3D <0x0 0x88800000 0x0 0x6200000>;
> > > +=09=09rmtfs_mem: rmtfs {
> > > +=09=09=09compatible =3D "qcom,rmtfs-mem";
> > > +
> > > +=09=09=09size =3D <0x0 0x200000>;
> > > +=09=09=09alloc-ranges =3D <0x0 0xa0000000 0x0 0x2000000>;
> > >   =09=09=09no-map;
> > > +
> > > +=09=09=09qcom,client-id =3D <1>;
> > > +=09=09=09qcom,vmid =3D <15>;
> > >   =09=09};
> > >=20
> > > -=09=09smem_mem: smem-mem@86000000 {
> > > -=09=09=09reg =3D <0x0 0x86000000 0x0 0x200000>;
> > > +=09=09mpss_mem: mpss@88800000 {
> > > +=09=09=09reg =3D <0x0 0x88800000 0x0 0x6200000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09memory@85800000 {
> > > -=09=09=09reg =3D <0x0 0x85800000 0x0 0x800000>;
> > > +=09=09adsp_mem: adsp@8ea00000 {
> > > +=09=09=09reg =3D <0x0 0x8ea00000 0x0 0x1b00000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09memory@86200000 {
> > > -=09=09=09reg =3D <0x0 0x86200000 0x0 0x2600000>;
> > > +=09=09slpi_mem: slpi@90500000 {
> > > +=09=09=09reg =3D <0x0 0x90500000 0x0 0xa00000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09rmtfs@86700000 {
> > > -=09=09=09compatible =3D "qcom,rmtfs-mem";
> > > -
> > > -=09=09=09size =3D <0x0 0x200000>;
> > > -=09=09=09alloc-ranges =3D <0x0 0xa0000000 0x0 0x2000000>;
> > > +=09=09gpu_mem: gpu@90f00000 {
> > > +=09=09=09compatible =3D "shared-dma-pool";
> > > +=09=09=09reg =3D <0x0 0x90f00000 0x0 0x100000>;
> > >   =09=09=09no-map;
> > > +=09=09};
> > >=20
> > > -=09=09=09qcom,client-id =3D <1>;
> > > -=09=09=09qcom,vmid =3D <15>;
> > > +=09=09venus_mem: venus@91000000 {
> > > +=09=09=09reg =3D <0x0 0x91000000 0x0 0x500000>;
> > > +=09=09=09no-map;
> > >   =09=09};
> > >=20
> > > -=09=09zap_shader_region: gpu@8f200000 {
> > > -=09=09=09compatible =3D "shared-dma-pool";
> > > -=09=09=09reg =3D <0x0 0x90b00000 0x0 0xa00000>;
> > > +=09=09mba_mem: mba@91500000 {
> > > +=09=09=09reg =3D <0x0 0x91500000 0x0 0x200000>;
> > >   =09=09=09no-map;
> > >   =09=09};
> > >   =09};
> > > @@ -1013,7 +1018,7 @@ opp-133000000 {
> > >   =09=09=09};
> > >=20
> > >   =09=09=09zap-shader {
> > > -=09=09=09=09memory-region =3D <&zap_shader_region>;
> > > +=09=09=09=09memory-region =3D <&gpu_mem>;
> > >   =09=09=09};
> > >   =09=09};
> > >=20
> > > @@ -2001,7 +2006,7 @@ venus: video-codec@c00000 {
> > >   =09=09=09=09 <&venus_smmu 0x2c>,
> > >   =09=09=09=09 <&venus_smmu 0x2d>,
> > >   =09=09=09=09 <&venus_smmu 0x31>;
> > > -=09=09=09memory-region =3D <&venus_region>;
> > > +=09=09=09memory-region =3D <&venus_mem>;
> > >   =09=09=09status =3D "disabled";
> > >=20
> > >   =09=09=09video-decoder {
> > > @@ -3008,7 +3013,7 @@ adsp_pil: remoteproc@9300000 {
> > >   =09=09=09clocks =3D <&xo_board>;
> > >   =09=09=09clock-names =3D "xo";
> > >=20
> > > -=09=09=09memory-region =3D <&adsp_region>;
> > > +=09=09=09memory-region =3D <&adsp_mem>;
> > >=20
> > >   =09=09=09qcom,smem-states =3D <&smp2p_adsp_out 0>;
> > >   =09=09=09qcom,smem-state-names =3D "stop";
> > > --
> > > 2.33.0
> > >=20
> > >=20
>=20
>=20
> --
> With best wishes
> Dmitry



