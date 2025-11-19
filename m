Return-Path: <linux-arm-msm+bounces-82471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F84C6DD93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 761A82D880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AA8345CC8;
	Wed, 19 Nov 2025 09:57:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7632E2667
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546240; cv=none; b=oeNN8uguK0g/wQoWO1j5GEr0Hp5GltDYXBipRZkOb3wov3U0Drl+6IHvreoWzxJN0ZXbTDTyj6nIPXnYOMGbQKOvg3eDKkeFzaq4ycyl0xsKYNCatVJkY57sNtIVvYLecVT9YHAKpzQUpTubz154BKEUm2y5QPFA/QaR1DyL3gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546240; c=relaxed/simple;
	bh=u79rK05bGjXVLdcXPTg+6TrexWR50QX9FMb4ZS2IZYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpIGanEzV6ck//u10KawbYE7DjSun+Igl6Sau25tEQt1ZHqoUEgUThWyRtpr2FOT/RZMuC6Elj4zprIDentdwG9itzWp5m2IDWuiNOsAOeDj3T5NvigRFA9oaV2t9aZna1gchL3+4ZzcFXikOUx6bygSTSyBr4cgkROkDMS67ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63e1e1bf882so5696630d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763546230; x=1764151030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0htT7CWQPeByeqxSahyOl4zpUDCMY13dqs08SYJuOU=;
        b=rmZijC0t2K8vlXywGcSIeQEti21d4gdbW7BY53QSBi3cXEIf9F3fpaA1I9SIehr6Nw
         i+9eqcv6MgzMrRkSG0iPtnX/F8IF/UDK4/6Ewi95IdNeQd0JuT174SKA/BCujJNqpn+O
         YzNWf1DtVA80rmHoT3+Z7MjLfF3dHY2oR+cuxPF9GdYTSBlgIKGR6MLAb4kTbE2+GB3Z
         YuCPtCcY6S7NCsPrw/RIWUd++MgimTkbJ0yWIcBaENwW52rch7mfZInZNnQLThVcTZVh
         gahky3X73AnTrXU5dKD6DecALehp+Ah6ZZvZZP91utPtxWIxh9cnTf/xSugiUFpeXu4M
         qO8g==
X-Forwarded-Encrypted: i=1; AJvYcCUW38cIIV7bO41NB4lxFhDPqY5g2P9aUXgD3JzoWPDWtuZsZT32Eu3cfgc8vrPv5JDAiWReHD/pUpfdJhZm@vger.kernel.org
X-Gm-Message-State: AOJu0YyTK/PZ2cKCMf91uZc4A+9BwZdKukh1gbnsMF1ZMmN+kYG8B9Ke
	Nlh+RXu22nC/9VWg9Nn0isaACw6af8e9JQE+6lMX3vhIN4e7xy4Q383AsWrHow==
X-Gm-Gg: ASbGnctVkng6RE8HJ7oMwKMb5KScxogiYo43FFZ6MMZHKr0dHmIwUXZCMnqfoO5lEYZ
	LGRU59glP2g66SLOBTBNZ2pQ9VstecWhxhiYMig9/PJ0wLoYJFA4M7818nnMYWzCFvQydHCG4dZ
	PslsWgF2z9VRixs6yUW7ohCAXwx0CNuT1iWcwXwYdl+dmCcHgOFTmbCY4doAyKqjjw4qXp2yHht
	WfqxRGkzMz2d/p/I8nDqdtRKJLEMctJlkzKIg1KQmLHHLuZM7ji620+Bu4gAoaGGgAnCG+qZPNg
	ZuPFeFPfWIn8kNkW9tV9FfmfWY710437/8lB01tpfFrU8mQiuIBj+scD+b+ZqxceNbYXWKI31AJ
	nWHEHdWAHAO/1DzN+WarWf8jUk3DvVcZVkYN3Y46dCvxvbsnVOei935Kg2JRg6civ/XOHf08TkT
	0u4UHB9KFXOl/HnAL7TxL5OG1QcPhHdvQbsr4S2M9nZENa8SligVHcXCUp
X-Google-Smtp-Source: AGHT+IHDbhAbThzA9CphdUTAM4R/xbD4BVYHV0WhDzQlYBgM+wL3Vk7iT2Zzi7mVD8bnk84NFFK7LA==
X-Received: by 2002:a05:690c:3507:b0:786:96de:af5f with SMTP id 00721157ae682-78929ef8948mr325089797b3.53.1763546229602;
        Wed, 19 Nov 2025 01:57:09 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a70995ec8sm2586397b3.6.2025.11.19.01.57.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:57:07 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-786d1658793so59124897b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGaIj42Rcp9y5luaXae0dcQysfdseuDAUlfLWfA21pkXqV3yWTYiosQN2t6AI3VJ/cPD4/L+YHtVQUuAFw@vger.kernel.org
X-Received: by 2002:a05:690c:86:b0:786:7c0a:71e5 with SMTP id
 00721157ae682-78929e44351mr312271377b3.26.1763546226053; Wed, 19 Nov 2025
 01:57:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com>
 <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org> <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
 <2iv3hsxcwlgfnpq75h4tfnbilurs5jelslig6gzknpb6lsupvk@xfxdofqw7b3v>
In-Reply-To: <2iv3hsxcwlgfnpq75h4tfnbilurs5jelslig6gzknpb6lsupvk@xfxdofqw7b3v>
From: Roger Shimizu <rosh@debian.org>
Date: Wed, 19 Nov 2025 01:56:54 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkke-tON2-oR9qSHgDH63gtDKu0S71XtMw=uwqRxSHkGA@mail.gmail.com>
X-Gm-Features: AWmQ_bl_SFzQCsuk2XqZ4jDBPrsGzKnkCwo_SRBXj_zK7hVSRiz7ReegFQasHCc
Message-ID: <CAEQ9gEkke-tON2-oR9qSHgDH63gtDKu0S71XtMw=uwqRxSHkGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Reidel <adrian@mainlining.org>, Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dmitry,

Glad that you're checking for the changes for RUBIK Pi 3!

On Tue, Nov 18, 2025 at 10:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, Nov 16, 2025 at 11:36:13PM -0800, Roger Shimizu wrote:
> > Thanks Jens, and Dmitry for the review!
> >
> > On Sat, Nov 15, 2025 at 9:25=E2=80=AFAM Jens Reidel <adrian@mainlining.=
org> wrote:
> > >
> > > Hi,
> > >
> > > On 11/14/25 5:34 PM, Hongyang Zhao wrote:
> > > > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > > > QCS6490 SoC.
> > > >
> > > > Works:
> > > > - Bluetooth (AP6256)
> > > > - Wi-Fi (AP6256)
> > > > - Ethernet (AX88179B connected to UPD720201)
> > > > - FAN
> > > > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > > > - M.2 M-Key 2280 PCIe 3.0
> > > > - RTC
> > > > - USB Type-C
> > > > - USB Type-A 2.0 port
> > > > - 40PIN: I2C x1, UART x1
> > > >
> > > > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > > > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> > > >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 +++++++=
+++++++++++++
> > > >   2 files changed, 1416 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dt=
s/qcom/Makefile
> > > > index 6f34d5ed331c..2433b15754fe 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -138,6 +138,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D =
qcs6490-rb3gen2.dtb qcs6490-rb3gen2
> > > >
> > > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs6490-rb3gen2-industrial-mezza=
nine.dtb
> > > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs6490-rb3gen2-vision-mezzanine=
.dtb
> > > > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs6490-thundercomm-rubikpi3.dtb
> > > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs8300-ride.dtb
> > > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs8550-aim300-aiot.dtb
> > > >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs9100-ride.dtb
> > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.=
dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > new file mode 100644
> > > > index 000000000000..4c9016992de3
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > > > @@ -0,0 +1,1415 @@
> > >
> > > [snip]
> > >
> > > > +
> > > > +&pcie0 {
> > > > +     perst-gpios =3D <&tlmm 87 GPIO_ACTIVE_LOW>;
> > > > +     wake-gpios =3D <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > > > +
> > > > +     pinctrl-0 =3D <&pcie0_clkreq_n>,
> > > > +                 <&pcie0_reset_n>,
> > > > +                 <&pcie0_wake_n>;
> > > > +     pinctrl-names =3D "default";
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&pcie0_phy {
> > > > +     vdda-phy-supply =3D <&vreg_l10c_0p88>;
> > > > +     vdda-pll-supply =3D <&vreg_l6b_1p2>;
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&pcie1 {
> > > > +     /* Using traditional address mapping */
> > > > +     reg =3D <0 0x01c08000 0 0x3000>,
> > > > +           <0 0x40000000 0 0xf1d>,
> > > > +           <0 0x40000f20 0 0xa8>,
> > > > +           <0 0x40001000 0 0x1000>,
> > > > +           <0 0x40100000 0 0x100000>;
> > > > +
> > > > +     ranges =3D <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x10=
0000>,
> > > > +              <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd0=
0000>;
> > >
> > > Thanks for attempting to fix the PCIe issues. With your patch series
> > > applied on top of linux-next, I'm still seeing PCIe issues:
> > >
> > > [    0.380693] Internal error: synchronous external abort:
> > > 0000000096000010 [#1]  SMP
> > > [    0.406491] Modules linked in:
> > > [    0.406495] CPU: 5 UID: 0 PID: 106 Comm: kworker/u32:6 Tainted: G =
  M
> > >                 6.18.0-rc5-next-20251113 #13 NONE
> > > [    0.406499] Tainted: [M]=3DMACHINE_CHECK
> > > [    0.406500] Hardware name: thundercomm Thundercomm RUBIK Pi
> > > 3/Thundercomm RUBIK Pi 3, BIOS 2025.10-rc4 10/01/2025
> > > [    0.406502] Workqueue: async async_run_entry_fn
> > > [    0.406508] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
> > > BTYPE=3D--)
> > > [    0.428362] pc : __pi_memset_generic+0x16c/0x188
> > > [    0.428366] lr : dma_direct_alloc+0x19c/0x3d0
> > > [    0.428370] sp : ffff8000810e3920
> > > [    0.428371] x29: ffff8000810e3920 x28: ffff000080d0f810 x27:
> > > ffffba4c6196ec48
> > > [    0.428373] x26: ffff000080d0f810 x25: ffffba4c607b31cc x24:
> > > 0000000000000000
> > > [    0.428375] x23: ffff000080d0f810 x22: ffff000000c00000 x21:
> > > ffff000082858948
> > > [    0.428376] x20: 0000000000001000 x19: fffffdffc0030000 x18:
> > > 000000000000000a
> > > [    0.428378] x17: ffff0000823dae00 x16: 0000000000000000 x15:
> > > 0000000000000000
> > > [    0.428380] x14: 00000000ffffffff x13: 0000000000000068 x12:
> > > 0000000000000100
> > > [    0.449344] x11: 0000000000000000 x10: ffff0001fef99500 x9 :
> > > 0000000000000000
> > > [    0.449345] x8 : ffff000000c00000 x7 : 0000000000000000 x6 :
> > > 000000000000003f
> > > [    0.449347] x5 : 0000000000000040 x4 : 0000000000000000 x3 :
> > > 0000000000000004
> > > [    0.449349] x2 : 0000000000000fc0 x1 : 0000000000000000 x0 :
> > > ffff000000c00000
> > > [    0.449350] Call trace:
> > > [    0.449351]  __pi_memset_generic+0x16c/0x188 (P)
> > > [    0.449354]  dma_alloc_attrs+0x94/0x210
> > > [    0.449357]  dmam_alloc_attrs+0x74/0xc0
> > > [    0.469967]  dw_pcie_msi_host_init+0x100/0x300
> > > [    0.469971]  dw_pcie_host_init+0x5e4/0x6d8
> > > [    0.491913]  qcom_pcie_probe+0x5a8/0x838
> > > [    0.491916]  platform_probe+0x64/0xc0
> > > [    0.491919]  really_probe+0xc8/0x3f0
> > > [    0.491921]  __driver_probe_device+0x88/0x170
> > > [    0.491922]  driver_probe_device+0x48/0x130
> > > [    0.491923]  __device_attach_driver+0xc4/0x190
> > > [    0.491925]  bus_for_each_drv+0x90/0x100
> > > [    0.491928]  __device_attach_async_helper+0xb8/0x120
> > > [    0.491929]  async_run_entry_fn+0x3c/0x1e0
> > > [    0.491931]  process_one_work+0x150/0x3a0
> > > [    0.491934]  worker_thread+0x288/0x480
> > > [    0.491936]  kthread+0x118/0x1e0
> > > [    0.491938]  ret_from_fork+0x10/0x20
> > > [    0.513092] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
> > > [    0.513094] ---[ end trace 0000000000000000 ]---
> > >
> > > I can only get the device to boot by disabling both pcie0 and pcie1.
> >
> > I think there're some regressions in "next-20251114".
> > After some time to "git bisect", I found after running 2 revert
> > commands below, it can boot for both RUBIK Pi 3 and RB3 Gen2.
> >
> > $ git revert b15ce3c0882c9cd2fbe4f87047874ad087b583ff -m 1
> > $ git revert 03e928442d469f7d8dafc549638730647202d9ce
> >
> > > > +
> > > > +
> > > > +     perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> > > > +     wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> > > > +
> > > > +     pinctrl-0 =3D <&pcie1_clkreq_n>,
> > > > +                 <&pcie1_reset_n>,
> > > > +                 <&pcie1_wake_n>;
> > > > +     pinctrl-names =3D "default";
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&pcie1_phy {
> > > > +     vdda-phy-supply =3D <&vreg_l10c_0p88>;
> > > > +     vdda-pll-supply =3D <&vreg_l6b_1p2>;
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > >
> > > [snip]
> > >
> > > > +
> > > > +&remoteproc_adsp {
> > > > +     firmware-name =3D "qcom/qcs6490/adsp.mbn";
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > >
> > > I'm fairly sure that this is the wrong ADSP firmware. With the firmwa=
re
> > > in linux-firmware, I'm seeing charger pd crashes and the ADSP constan=
tly
> > > restarting. Using the Radxa Dragon Q6A ADSP firmware which disables t=
he
> > > charging feature in the firmware works way better and does not result=
 in
> > > crashes.
> >
> > I run the Ubuntu 24.04 base system:
> > * https://ubuntu.com/download/qualcomm-iot#rubikpi3
> >
> > Currently it boots well with adsp fw from RB3 Gen2 (from deb pkg:
> > firmware-qcom-hlosfw) without crash.
> > But I heard from next release, adsp will be customized, so Hongyang
> > will make another patch to upstream the adsp for RUBIK Pi 3.
>
> Then it would be nice to include the new path for ADSP firmware from the
> day 0 (you can do this even before it is sent to linux-firmware).

Thanks for letting me know we can post it here, before sending to
linux-firmware!

Currently we're using the same adsp blob as QLI1.4 for RB3 Gen2.
It's packaged in ubuntu:
* https://launchpad.net/~ubuntu-qcom-iot/+archive/ubuntu/qcom-ppa/+packages
* Package: firmware-qcm6490-msl
* Version: 1.0.r00083.0+dsp103-0ubuntu1

I heard from Hongyang that from QLI1.5, RUBIK Pi 3 will have a
slightly different adsp than RB3 Gen2.
Hongyang will make it public after full testing.

Cheers,
Roger

> > Cheers,
> > Roger
> >
> > > > +
> > > > +&remoteproc_cdsp {
> > > > +     firmware-name =3D "qcom/qcs6490/cdsp.mbn";
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > >
> > > [snip]
> > >
> > > Thanks,
> > > Jens
>
> --
> With best wishes
> Dmitry

