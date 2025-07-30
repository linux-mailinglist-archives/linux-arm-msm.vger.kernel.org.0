Return-Path: <linux-arm-msm+bounces-67175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F71B163BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 17:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC4D3AA920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 15:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FA119EED3;
	Wed, 30 Jul 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHMiE3VM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1070C2C9;
	Wed, 30 Jul 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753889417; cv=none; b=dB8QYZqYC2vwYilYHJiUrjXD+Jyd8tGqWW7mRfnxQRfpttktZxMArAUNqqAaDCLAInrUurQhgGvTguL91ruFerH18vsJnpMnh4n/RghRWpIG6cvQ5MMP/KZ/SYeTMziPXGpJ8GgIOUbWp1E+ovRwTye7QP2WWY6RySO88wYz/hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753889417; c=relaxed/simple;
	bh=E6E065AUvx0BSgXnbM0bRsN6IRIk/p6dbL+KhehhkYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+dyPv3NZRrhhTfbZnbP5L1ZRDhhORybE8ZsyufBXK+rQAro1KwDUOHbwr2jpllPK0jVoqOAasmKtwh7zID+pBHa3++5HHjrj3ocCx77FzwbBFw99mZDB7A3U/P3g1+3hV5HhE0mHwO/LGwIKcGMoXci9GRd8nkEEQkLDW+qfDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHMiE3VM; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f234ba1abso1535959241.1;
        Wed, 30 Jul 2025 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753889414; x=1754494214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETEaDdsh4V/Pnn8da6FGSNH6gc9uIIVN3F5KKLwOk6w=;
        b=KHMiE3VMBm+1nMziQWH2I2IJtuZJ/q0SGdfBszM4Fh9MztnXS1F7Fi3xWAAuEotKI5
         AmdsjVVVlCVeNgV+7n5Tot0v9wdREGiPauBc6C4O2tlqw2XNtwTSkfQ8WHNZGFBUo+2M
         B+fDWVday1nEwcPjk+mitCT9IUNRK75xQ+jCQjq6SdjgF2RLAOHntb9OW0sU4SSvVEVE
         emEFc4+ZprDuibi9gpuU18rgN2MpDY0zbofVJ136FRL4+57uoO/6WWcvgESxfAuav/bA
         cz5lvQD14J1mZM0Eh9AtZO0Oy255wJ25FeGKA74i5VYaCymPTqbDfkCnLun3r671Lmqk
         jeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753889414; x=1754494214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETEaDdsh4V/Pnn8da6FGSNH6gc9uIIVN3F5KKLwOk6w=;
        b=I1Md5oPLvi9J8QMj56PD7ZN3GIco59WvhYYKqu3cN3mI5UYcunfltgrsec7O6fF07Y
         a6rhlONMxdbh3kY7BopCxskGTGOIInyS7GMhHCnO/Uik3QKIWgjHc9pDC2UF0FB5CuDi
         pNG8J0NHlOBpTB1GuTu65hb39IfOxYwklrDdR+9QaduKOyVmvLyMcQ4NGLJikwjFqXdq
         lRDfsTvireRMnsNznHi+r5YOgmNeSV8AikWAeudqRXy/hx5lSGE8q5QoCCbwCLEAhBFE
         TNQKwWBxSi9RuUC4rY8StSCz17Dm350juAEUnfXfNBTHm0LGhLNs/fCkxvQEG/S+5JGH
         zEUw==
X-Forwarded-Encrypted: i=1; AJvYcCUXJMoHZJ7PFAHkBK+U+GNcCLwrmX5LUHIZJDMmjeqVaNfH3fY2e5AX7qOGOciiyhUPIGfxRe+yhaed@vger.kernel.org, AJvYcCUYT6a+ThpgJv2U8i0xBZ7rAxxuul5nAPEdhOy4pbOWJF/PKtVc6og8u+k4X9Djc6d1uTpcPza6Ocq3vbawLQ==@vger.kernel.org, AJvYcCX+wj+RMOj4ikyBRcrVm43gc24pqpixfzsde62fw33fpovkUmc4PHV7USPPG3clzIWUwqT6dx5Ubxfpjcyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JZg2MmKAAOcBhoPSReiQ4POcw3EhQmpqJVeI3fyhhDhoWiB8
	Hx4I2vsYjD1AKuDyye7RqfX14GxFCT6bUsLK1k6W0X/UDn6ewCibyr2jfa9DcKUXJtqVX2L0hP4
	HmyhX8Bz8ehC8AICjG6LJ9jKdg5FL74U=
X-Gm-Gg: ASbGncv/IupK0mXqgY4cT7dr2bIVIaRK6QhPd45PXoY5+O/odHqcg28HbVVCkTCkcK7
	6kas97xEgnIbGktZS7RJIKsxpqbB+Hi3XG4zuZkvaao8VB2sJf46uo5sVB1+KqaFTStd0AjZ8AR
	Pxib6XZyYrhW3FzFE1ycJ4ifyIrpR2O83OyXsc7bsYuX+yqXXI5leH8vIyneK6ncHoMLDTKogbv
	AAqIj2f1g5xpKEFLGTu6co60A==
X-Google-Smtp-Source: AGHT+IHznV6dg30Ye/D9QHiF0pBWehxd42YHVufgZ6Dh2rQUjYF0ytzAn97RzY2GiFjJWyv6zR2LSaEnGLxJM3Wkaww=
X-Received: by 2002:a05:6102:c0e:b0:4e2:aafe:1bde with SMTP id
 ada2fe7eead31-4fbe7f6614bmr2241100137.9.1753889413633; Wed, 30 Jul 2025
 08:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
 <20250706034303.5404-1-mitltlatltl@gmail.com> <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
In-Reply-To: <f2f0f25b-40b0-452c-ad9e-01b84b32e163@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 30 Jul 2025 23:29:26 +0800
X-Gm-Features: Ac12FXzLvf0MYB4pOOt83gs0mrzjwhR_q7rYVQjUnz8JJvzV9JpPlIH82pXRttk
Message-ID: <CAH2e8h6XWAz-pqmuvzK8JqOb=ggiDGb2U3TvAR2+43D_zdsZpQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: aliceryhl@google.com, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, ebiggers@google.com, 
	ilpo.jarvinen@linux.intel.com, joel.granados@kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, len.brown@intel.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, mingo@kernel.org, ojeda@kernel.org, robh@kernel.org, 
	sfr@canb.auug.org.au, vanyang@smail.nju.edu.cn, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 8:53=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/6/25 5:43 AM, Pengyu Luo wrote:
> > On Sat, Jun 28, 2025 at 3:48=E2=80=AFAM Konrad Dybcio <konrad.dybcio@os=
s.qualcomm.com> wrote:
> >> On 6/17/25 11:29 AM, Pengyu Luo wrote:
> >>> The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platfo=
rm,
> >>> also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providi=
ng
> >>> the unlocked device and early development work. This patch adds an
> >>> initial device tree to enable basic functionality.
> >>>
> >>> Currently supported components include:
> >>> - Bluetooth & Wi-Fi (board file regeneration required)
> >>> - Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-gl=
ink
> >>> - Flash LEDs (front and rear)
> >>> - Hall sensor (lid detection)
> >>> - Keyboard (via Bluetooth or USB)
> >>> - NVMe SSD
> >>> - Power and volume keys
> >>> - Simple-framebuffer
> >>> - Sound (playback and capture; top-left DMIC only, top-right works on=
ly
> >>>   on Windows)
> >>> - Touchscreen and stylus (requires GPI DMA support [1] and stylus sup=
port [2])
> >>> - USB Type-C ports
> >>>
> >>> The following components are currently non-functional:
> >>> - Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames=
 in libcamera;
> >>>   partial driver can be found on LKML archives)
> >>> - DSI display (blank screen with `dsi_err_worker: status=3D4`; primar=
y DSI register
> >>>   dump included below)
> >>> - Stylus wireless charger (CPS4035)
> >>> - UCSI over GLINK
> >>>
> >>> [1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-m=
itltlatltl@gmail.com
> >>> [2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitl=
tlatltl@gmail.com
> >>>
> >>> Note: This series does **not** include any confidential material. Tho=
se
> >>> who wish to run Linux on this device should contact Ntmer, as the
> >>> bootloader is locked via secure boot.
> >>>
> >>> Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> >>> Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> >>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>
> >>> dsi_ctrl, reg =3D <0 0x0ae94000 0 0x400>;
> >>> 0xae94000 20050001 000001f3 0000000b dddd1011
> >>
> >> This is not something we want in the commit log
> >>
> >
> > I will remove it. I need help, then I attached it, two of my sc8280xp
> > devices require dsi to work. Reversing and guessing wasted a lot of
> > time. I will appreciate it if qcom could support it.
>
> There should be nothing interesting compared to what's on SM8350 when it
> comes to DSI on 8280.
>
> I would assume something's wrong with how your panel is being set up.

Just to mention it. According to some public sources, the Adreno 1095 DPU
is included in the sm8350, while the Adreno 1199 DPU is included in the
sc8280xp, they are slightly different. Here is a quick comparison

                   dpu_version     dsi_version     dsi_phy_version
Adreno 1095 DPU:     7.0            2.5.0           4.2
Adreno 1199 DPU:     8.0            2.5.1           4.2

The panel setup has been tweaked and tested countless times, I really don't
think I screwed it up. I had already brought up a lcd video panel with dual
dsi and dual dsc on the sm8650. On the sc8280xp, I=E2=80=99ve worked with t=
wo
different panels:

- One LCD video panel with dual DSI and dual DSC
- One OLED video panel with dual DSI only

Both fail to display anything and complain about DSI FIFO errors
(dsi_err_worker: status=3D4). Someone also encountered a similar issue on
the SC8180X([1]), another WoA platform.

Anyway, I had quit. This doesn=E2=80=99t bother me anymore. Just mentioning=
 the
info for reference.

[1]: https://gitlab.freedesktop.org/drm/msm/-/issues/62

Best wishes,
Pengyu

