Return-Path: <linux-arm-msm+bounces-82057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACCC62C1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 847CB34D351
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2090B31A546;
	Mon, 17 Nov 2025 07:36:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591D31D725
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763364989; cv=none; b=Ts9xbFDW2X9ElgRaEeu1MwpvTenv4yB6I793S9i+KKZS+13sLTCj9eLJVDjuEi6UVpGNVj04nPzDUV5hdyyF/H84LWy8doGZAsBEjBh/1V10BatWieeRfYzjGJ8n2qGh7d/RmXARic8UhyR5OhyPpsZFVaY2tUYibm/ZqPoSrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763364989; c=relaxed/simple;
	bh=sEIC12gY8xGmvPgbsyhw3/r0/GkwDMXGYP/Oy3YUG/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5NhcboHaILNguM/8pjEaqRTGQsnkxM3E1Dfsig4MJLdZbyNqS6BmoWiPkGJhleatkLhaAR7BZdYClmxHVXGsYT7VaWK7yLhmRI8NaC18BuAM5wR5EbLYFAzAATU1jlLdSdyCj0lo3tWn4FJXiXC3PIWC/tN00ffjYczFFDar30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-789505a2fe7so6558017b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763364986; x=1763969786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhKCAerPq2QkTfQSFkO+3MqZuYdSjTftIor4Yigrops=;
        b=UuE7Xbzf9Kr0bbOror9cJnbOCxSiR4AOb+OYI5QoR5leZm5dwth841Gg0QTeBEUs6g
         mqK6GDNsj53QR+RiT9r4cPyRsMUZoHkabtLeK/pH4Jybnb6eklZqMX4fYeGjLsmdDwLR
         Qj0yWYuadaxi9b8czrDsgSYuJ02h4qezTgSDu3trv4XlbqE38BOO4kTQPiE16EKVLGra
         K+xYgSm6nbsoxnAtQHLOx9H5E+Xjt1DGY82rxDxg0JdVDdf1Wo8iZA/+rdGdeAWrGy1m
         iofT3B9ktF043Jqg2yLqdYTIAjIYKWO3BfpeHyKAJ67OUqBLJY1+0KkdjxEZZwSoUziT
         eD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTUKv1uzsdSLzwbX6FO6ZFVU/FpRRYmicYPj9/WlVkimFdr2x7Ro8C8GB10ShIR+mFqaa16iWJyvyCBd4w@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXanXQTwzTfPJnmHRJOedg5G9CpYhxAHKARULLLfr2yEZxfk5
	dUpLdh5ErXNc0kMdPCsGQPsqY+RfBCPcM2iubh5EBims8CCjTu4Dbr9pVLvk1g==
X-Gm-Gg: ASbGncvoc9KeVGLEEAl0nBVAwvFv/wTvnRi/LpOWVva6tL/nrYvDoLTHYu+Au/ntCQl
	6mV0zmUOcbqxjB8aIv2RybL5Jf9yIHw6x9XFX5zSsZbjq7rbpFHzijcE/A7SbWEzhE0GE+KWDD/
	38vvs66TSOYJafoI3Vu+ma8W4BPasRCs7AY7vyAucHD76O4Ddhbb0y2wGIm9yt5FaZrJS6aDFNw
	7gxGCxbb1WDoi43bippGbTW3awnGI+Akot8xVTD0CgGwTZ7bbC3syyDAKlsi/EpR2X8Lz4gCw7v
	nDPjPRnv0zSHHKUcrW229wPEElfE5WM199206onpANX0wuXUtRVRij7ebFaiTxkvqb2+O0lM+4b
	aYjlEHBZwE8/JULeNDGvpOmdF0VRvnNTqpdYc+taqbdiZUhl3TYzMdz2ZzuTnLgis5qcdy15+RY
	VR4iboyKOXjvj1h5/ucspzyhIo+CJ1QkHgO3DYgr0WKw==
X-Google-Smtp-Source: AGHT+IGRY9guTy33zXh4EqcoxKqQtUl6xNltjZ/vcemKheA75njz72Xv47jgRPMbPBIHMbvssjhHmg==
X-Received: by 2002:a05:690c:6d11:b0:786:a78a:6abc with SMTP id 00721157ae682-78929e65564mr100007167b3.21.1763364985529;
        Sun, 16 Nov 2025 23:36:25 -0800 (PST)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com. [74.125.224.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-788221221c8sm39902187b3.36.2025.11.16.23.36.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:36:24 -0800 (PST)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640d790d444so3394175d50.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:36:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8mqrh+4aoAlh4EYEIuusT71aeolYO+6e0kQhl9/gstzv7RF/e9Pvi1ytyulSpyukhAUmz2miINnNDQfu8@vger.kernel.org
X-Received: by 2002:a05:690e:154b:10b0:63e:d1f:d685 with SMTP id
 956f58d0204a3-641e76d648bmr7956746d50.51.1763364984565; Sun, 16 Nov 2025
 23:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115-rubikpi-next-20251114-v1-0-fc630dc5bb5d@thundersoft.com>
 <20251115-rubikpi-next-20251114-v1-1-fc630dc5bb5d@thundersoft.com> <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org>
In-Reply-To: <b2d4d91f-c726-4f5a-994a-086edc9caff2@mainlining.org>
From: Roger Shimizu <rosh@debian.org>
Date: Sun, 16 Nov 2025 23:36:13 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
X-Gm-Features: AWmQ_bmSUlkiL2vZBTUpoKENWapC_9eYXU4pMWfB_kVnKjAMmmrB_4WSgcTKk2M
Message-ID: <CAEQ9gE=ztgQ+pGJVxKgk5dVWDSSfOG7r=s1cDa_x0_Zsf2eyYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3
 board dts
To: Jens Reidel <adrian@mainlining.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jens, and Dmitry for the review!

On Sat, Nov 15, 2025 at 9:25=E2=80=AFAM Jens Reidel <adrian@mainlining.org>=
 wrote:
>
> Hi,
>
> On 11/14/25 5:34 PM, Hongyang Zhao wrote:
> > Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
> > QCS6490 SoC.
> >
> > Works:
> > - Bluetooth (AP6256)
> > - Wi-Fi (AP6256)
> > - Ethernet (AX88179B connected to UPD720201)
> > - FAN
> > - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
> > - M.2 M-Key 2280 PCIe 3.0
> > - RTC
> > - USB Type-C
> > - USB Type-A 2.0 port
> > - 40PIN: I2C x1, UART x1
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > Reviewed-by: Roger Shimizu <rosh@debian.org>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
> >   .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1415 +++++++++++=
+++++++++
> >   2 files changed, 1416 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index 6f34d5ed331c..2433b15754fe 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -138,6 +138,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs :=3D qcs6=
490-rb3gen2.dtb qcs6490-rb3gen2
> >
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs6490-rb3gen2-industrial-mezzanine=
.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs6490-rb3gen2-vision-mezzanine.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qcs6490-thundercomm-rubikpi3.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs8300-ride.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs8550-aim300-aiot.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs9100-ride.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts =
b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > new file mode 100644
> > index 000000000000..4c9016992de3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > @@ -0,0 +1,1415 @@
>
> [snip]
>
> > +
> > +&pcie0 {
> > +     perst-gpios =3D <&tlmm 87 GPIO_ACTIVE_LOW>;
> > +     wake-gpios =3D <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > +
> > +     pinctrl-0 =3D <&pcie0_clkreq_n>,
> > +                 <&pcie0_reset_n>,
> > +                 <&pcie0_wake_n>;
> > +     pinctrl-names =3D "default";
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie0_phy {
> > +     vdda-phy-supply =3D <&vreg_l10c_0p88>;
> > +     vdda-pll-supply =3D <&vreg_l6b_1p2>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie1 {
> > +     /* Using traditional address mapping */
> > +     reg =3D <0 0x01c08000 0 0x3000>,
> > +           <0 0x40000000 0 0xf1d>,
> > +           <0 0x40000f20 0 0xa8>,
> > +           <0 0x40001000 0 0x1000>,
> > +           <0 0x40100000 0 0x100000>;
> > +
> > +     ranges =3D <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000=
>,
> > +              <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000=
>;
>
> Thanks for attempting to fix the PCIe issues. With your patch series
> applied on top of linux-next, I'm still seeing PCIe issues:
>
> [    0.380693] Internal error: synchronous external abort:
> 0000000096000010 [#1]  SMP
> [    0.406491] Modules linked in:
> [    0.406495] CPU: 5 UID: 0 PID: 106 Comm: kworker/u32:6 Tainted: G   M
>                 6.18.0-rc5-next-20251113 #13 NONE
> [    0.406499] Tainted: [M]=3DMACHINE_CHECK
> [    0.406500] Hardware name: thundercomm Thundercomm RUBIK Pi
> 3/Thundercomm RUBIK Pi 3, BIOS 2025.10-rc4 10/01/2025
> [    0.406502] Workqueue: async async_run_entry_fn
> [    0.406508] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [    0.428362] pc : __pi_memset_generic+0x16c/0x188
> [    0.428366] lr : dma_direct_alloc+0x19c/0x3d0
> [    0.428370] sp : ffff8000810e3920
> [    0.428371] x29: ffff8000810e3920 x28: ffff000080d0f810 x27:
> ffffba4c6196ec48
> [    0.428373] x26: ffff000080d0f810 x25: ffffba4c607b31cc x24:
> 0000000000000000
> [    0.428375] x23: ffff000080d0f810 x22: ffff000000c00000 x21:
> ffff000082858948
> [    0.428376] x20: 0000000000001000 x19: fffffdffc0030000 x18:
> 000000000000000a
> [    0.428378] x17: ffff0000823dae00 x16: 0000000000000000 x15:
> 0000000000000000
> [    0.428380] x14: 00000000ffffffff x13: 0000000000000068 x12:
> 0000000000000100
> [    0.449344] x11: 0000000000000000 x10: ffff0001fef99500 x9 :
> 0000000000000000
> [    0.449345] x8 : ffff000000c00000 x7 : 0000000000000000 x6 :
> 000000000000003f
> [    0.449347] x5 : 0000000000000040 x4 : 0000000000000000 x3 :
> 0000000000000004
> [    0.449349] x2 : 0000000000000fc0 x1 : 0000000000000000 x0 :
> ffff000000c00000
> [    0.449350] Call trace:
> [    0.449351]  __pi_memset_generic+0x16c/0x188 (P)
> [    0.449354]  dma_alloc_attrs+0x94/0x210
> [    0.449357]  dmam_alloc_attrs+0x74/0xc0
> [    0.469967]  dw_pcie_msi_host_init+0x100/0x300
> [    0.469971]  dw_pcie_host_init+0x5e4/0x6d8
> [    0.491913]  qcom_pcie_probe+0x5a8/0x838
> [    0.491916]  platform_probe+0x64/0xc0
> [    0.491919]  really_probe+0xc8/0x3f0
> [    0.491921]  __driver_probe_device+0x88/0x170
> [    0.491922]  driver_probe_device+0x48/0x130
> [    0.491923]  __device_attach_driver+0xc4/0x190
> [    0.491925]  bus_for_each_drv+0x90/0x100
> [    0.491928]  __device_attach_async_helper+0xb8/0x120
> [    0.491929]  async_run_entry_fn+0x3c/0x1e0
> [    0.491931]  process_one_work+0x150/0x3a0
> [    0.491934]  worker_thread+0x288/0x480
> [    0.491936]  kthread+0x118/0x1e0
> [    0.491938]  ret_from_fork+0x10/0x20
> [    0.513092] Code: 91010108 54ffff4a 8b040108 cb050042 (d50b7428)
> [    0.513094] ---[ end trace 0000000000000000 ]---
>
> I can only get the device to boot by disabling both pcie0 and pcie1.

I think there're some regressions in "next-20251114".
After some time to "git bisect", I found after running 2 revert
commands below, it can boot for both RUBIK Pi 3 and RB3 Gen2.

$ git revert b15ce3c0882c9cd2fbe4f87047874ad087b583ff -m 1
$ git revert 03e928442d469f7d8dafc549638730647202d9ce

> > +
> > +
> > +     perst-gpios =3D <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +     wake-gpios =3D <&tlmm 3 GPIO_ACTIVE_LOW>;
> > +
> > +     pinctrl-0 =3D <&pcie1_clkreq_n>,
> > +                 <&pcie1_reset_n>,
> > +                 <&pcie1_wake_n>;
> > +     pinctrl-names =3D "default";
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&pcie1_phy {
> > +     vdda-phy-supply =3D <&vreg_l10c_0p88>;
> > +     vdda-pll-supply =3D <&vreg_l6b_1p2>;
> > +
> > +     status =3D "okay";
> > +};
> > +
>
> [snip]
>
> > +
> > +&remoteproc_adsp {
> > +     firmware-name =3D "qcom/qcs6490/adsp.mbn";
> > +
> > +     status =3D "okay";
> > +};
>
> I'm fairly sure that this is the wrong ADSP firmware. With the firmware
> in linux-firmware, I'm seeing charger pd crashes and the ADSP constantly
> restarting. Using the Radxa Dragon Q6A ADSP firmware which disables the
> charging feature in the firmware works way better and does not result in
> crashes.

I run the Ubuntu 24.04 base system:
* https://ubuntu.com/download/qualcomm-iot#rubikpi3

Currently it boots well with adsp fw from RB3 Gen2 (from deb pkg:
firmware-qcom-hlosfw) without crash.
But I heard from next release, adsp will be customized, so Hongyang
will make another patch to upstream the adsp for RUBIK Pi 3.

Cheers,
Roger

> > +
> > +&remoteproc_cdsp {
> > +     firmware-name =3D "qcom/qcs6490/cdsp.mbn";
> > +
> > +     status =3D "okay";
> > +};
> > +
>
> [snip]
>
> Thanks,
> Jens

