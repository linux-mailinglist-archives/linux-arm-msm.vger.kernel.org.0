Return-Path: <linux-arm-msm+bounces-84718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 348ACCAE54F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 23:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B2F30577F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 22:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F68C2BE62E;
	Mon,  8 Dec 2025 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4nvfd6V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AFE2264BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 22:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233385; cv=none; b=B76w8VEDBzT906mBFgaQrwca+x6Kt7rQNoFvJToCHfX9UzcZa3g0XSl+UE96yaz2v1y4s3+nFwLjMQSlIWK5zbBaSmYO0x+14lzr1yrdBH2dRjKdaYtZ04IHjATzbjdz+4e7ONjsh1y5HiEapAY0IY2PM2RxIGQnhVmvKq3FEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233385; c=relaxed/simple;
	bh=Q2G/MZtVBoEaCJauZ/cHmYZaRZTZNUt7d4RLedJ+aMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dD3f4N944fEUfsktEqn1O2X1GYwZ7LY3y8EifNLaDUcgbHsHOoiTzQg3DlkeHFVz6+rPTcBsIlPvaRvF3ow19PQOhrDto1tvKiW901+b15Drl0HusrKZImch/wW6/dr1+e9S/il1nI9Dvz0os8N6Lut9tA+m/9QZfGklWw+qq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4nvfd6V; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso2699026f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 14:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765233381; x=1765838181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4KD06lq2sAdPsV4RkTZMMEkkcHicyQ03NbVW7+GTqc=;
        b=e4nvfd6V20myoyx4sPbWfL/RXP1rQwdmAdq2qF8mYdpLIh62GRQVcC3qZmJsVNs0ZT
         uhfXlCn1Q/1vOm+PKY7kabAAXGhG/u6swFcnKnZMssTWtaAa0v9F+FzU8Uoxx5CNXi4x
         FhbUWb60nBjum44ZsVEysnD20tJVsotnFiEALa9rcDQaTIQc4IoPSevYFWwa1/3bKweT
         Wdb3djLiXPLqzDuZvPCHIlciRnDOPQ3eVcd8t58RNBjj1/1Yc8VJeluNEROlbRK9JVKM
         l9d6QJOrDkj4kanm7TJC7wrmIRWPbCg1n3eb9s8WOArCX7odCy1xAmK7v0dpM/Vri2iE
         0UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765233381; x=1765838181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4KD06lq2sAdPsV4RkTZMMEkkcHicyQ03NbVW7+GTqc=;
        b=EShDNEvjsU265QPgdMcPp0i3YmNNYHrQh5MgxxD+v1u/wTpPq2qQafWe8EuvgZhI/D
         srsCW1fvcOVgfJ9GP9Lsl2xo010FggAnF4jI8vxJMV5cZREtpwA13EGqxUowGs1noJ6+
         Cu+C8y2+TN05QEr8fKLDlAzeF350D58/fkm26Q0NGfJQbiI+SsT5pCVdJxOF5Q7LcDV8
         TCTMEfNOZS6aPj/3+pOBSMBRpM0VQhvDPuHPMaj4r55J3Dp7rSxwr+voWsNDw5jufApO
         p0Zv6YEac5xQ9ko0had0fQnLpS/aKHpRjabdjwY8K+u7fW4rTiibUS96UOKQtGzIjPAO
         dXNw==
X-Forwarded-Encrypted: i=1; AJvYcCV+3PVxidtvmdBky53F+B1Voj1C7ZGTUT9FIIEBtplVy5PB3KdKgfLEwz/YcQ5EAStkn0CtRlMtKvN6xeO8@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNuFES7R5UUV7WM9G951ObIrrfWkQqtP4VmQM52sKmsVqj0P9
	fH7ORzMQ0TOkpvTLdPtw25RWI0QbEr8IEHY1XZiPycGUaT0AzvwD63/uQk5GfU9x+rWC8AGQKAw
	5ZfJZ/LTJl7UfaGzwlVcmZy3R48Ci4V2fMDQbyubUBw==
X-Gm-Gg: ASbGncsYC1GFC2Jc3aART0A9d5JcbMDI/lcu6394tgUXicUtHEpQ1T3ewZ5WuAm4rLp
	2jCCGr/GYBnU0ZIoSrCe35djmy/zuz7UNbAZfBVRdy8Uvsqm68slUM2BTc6Qj88CsK/6WZ6ixcX
	HFcn3TKGkCxAcuoC4bWOTinxfbaQWw4JLdHcp+qdOBuzd8toPPykzm6Z62gzcMO+R30b03lES7p
	JJu6Mdz/Bpoc7by91B3jBSuE1/Hwxnj7vMqJoqaiFMHzmyBegagHfV74CTU5kLZLyIsj70=
X-Google-Smtp-Source: AGHT+IHdENdqQ5ZpfGKlDmPBmXNvBchycFRz1S91lwgqXoJLXzAP6AzIRd2MqCvVDm4uYekNJP736gqsi3Ttoiy1uEE=
X-Received: by 2002:a05:6000:26ca:b0:3ff:17ac:a34b with SMTP id
 ffacd0b85a97d-42f89f7f743mr10799228f8f.42.1765233380524; Mon, 08 Dec 2025
 14:36:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-wip-obbardc-qcom-msm8096-clk-cpu-fix-downclock-v1-1-90208427e6b1@linaro.org>
 <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
In-Reply-To: <8d769fb3-cd2a-492c-8aa3-064ebbc5eee4@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 8 Dec 2025 22:36:09 +0000
X-Gm-Features: AQt7F2pyLxXm2GWb6gtwnpa1Ns2Gi_xPr5Pdfa1W2vBee9eceYgn1z1DZ-WxUWw
Message-ID: <CACr-zFD_Nd=r1Giu2A0h9GHgh-GYPbT1PrwBq7n7JN2AWkXMrw@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb"
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Wed, 3 Dec 2025 at 10:52, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 12/2/25 10:24 PM, Christopher Obbard wrote:
> > This reverts commit b3b274bc9d3d7307308aeaf75f70731765ac999a.
> >
> > On the DragonBoard 820c (which uses APQ8096/MSM8996) this change causes
> > the CPUs to downclock to roughly half speed under sustained load. The
> > regression is visible both during boot and when running CPU stress
> > workloads such as stress-ng: the CPUs initially ramp up to the expected
> > frequency, then drop to a lower OPP even though the system is clearly
> > CPU-bound.
> >
> > Bisecting points to this commit and reverting it restores the expected
> > behaviour on the DragonBoard 820c - the CPUs track the cpufreq policy
> > and run at full performance under load.
> >
> > The exact interaction with the ACD is not yet fully understood and we
> > would like to keep ACD in use to avoid possible SoC reliability issues.
> > Until we have a better fix that preserves ACD while avoiding this
> > performance regression, revert the bisected patch to restore the
> > previous behaviour.
> >
> > Fixes: b3b274bc9d3d ("clk: qcom: cpu-8996: simplify the cpu_clk_notifie=
r_cb")
> > Cc: stable@vger.kernel.org # v6.3+
> > Link: https://lore.kernel.org/linux-arm-msm/20230113120544.59320-8-dmit=
ry.baryshkov@linaro.org/
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---


Apologies for the late response, I was in the process of setting some
more msm8096 boards up again in my new workspace to test this
properly.


> It may be that your board really has a MSM/APQ8x96*SG* which is another
> name for the PRO SKU, which happens to have a 2 times wider divider, try
>
> `cat /sys/bus/soc/devices/soc0/soc_id`

I read the soc_id from both of the msm8096 boards I have:

Open-Q=E2=84=A2 820 =C2=B5SOM Development Kit (APQ8096)
```
$ cat /sys/bus/soc/devices/soc0/soc_id
291
```
(FWIW this board is not in mainline yet; but boots with a DT similar
enough to the db820c. I have a patch in my upstream backlog enabling
that board; watch this space)

DragonBoard=E2=84=A2 820c (APQ8096)
```
$ cat /sys/bus/soc/devices/soc0/soc_id
291
```


> see:
>
> https://lore.kernel.org/linux-arm-msm/20251111-db820c-pro-v1-0-6eece16c5c=
23@oss.qualcomm.com/
>
> https://lore.kernel.org/linux-arm-msm/kXrAkKv7RZct22X0wivLWqOAiLKpFuDCAY1=
KY_KSx649kn7BNmJ2IFFMrsYPAyDlcxIjbQCQ1PHb5KaNFawm9IGIXUbch-DI9OI_l73BAaM=3D=
@protonmail.com/

Thanks for the pointers. Interesting, but it does look like my boards
are msm8096 (and not the pro SKU). Can you confirm that at all from
the soc_id above?

Another bit of (hopefully useful) information is that the db820c boot
firmware log sthe following, which is different to the logs I saw from
the pro SKU (BUT the firmware could also be outdated?):
```
S - QC_IMAGE_VERSION_STRING=3DBOOT.XF.1.0-00301
S - IMAGE_VARIANT_STRING=3DM8996LAB
S - OEM_IMAGE_VERSION_STRING=3Dcrm-ubuntu68
S - Boot Interface: UFS
S - Secure Boot: Off
S - Boot Config @ 0x00076044 =3D 0x000001c9
S - JTAG ID @ 0x000760f4 =3D 0x4003e0e1
S - OEM ID @ 0x000760f8 =3D 0x00000000
S - Serial Number @ 0x00074138 =3D 0x14d6d024
S - OEM Config Row 0 @ 0x00074188 =3D 0x0000000000000000
S - OEM Config Row 1 @ 0x00074190 =3D 0x0000000000000000
S - Feature Config Row 0 @ 0x000741a0 =3D 0x0050000010000100
S - Feature Config Row 1 @ 0x000741a8 =3D 0x00fff00001ffffff
S - Core 0 Frequency, 1228 MHz
B -         0 - PBL, Start
B -     10414 - bootable_media_detect_entry, Start
B -     50197 - bootable_media_detect_success, Start
B -     50197 - elf_loader_entry, Start
B -     51760 - auth_hash_seg_entry, Start
B -     51863 - auth_hash_seg_exit, Start
B -     85147 - elf_segs_hash_verify_entry, Start
B -     87651 - PBL, End
B -     89700 - SBL1, Start
B -    185684 - usb: hs_phy_nondrive_start
B -    186050 - usb: PLL lock success - 0x3
B -    189039 - usb: hs_phy_nondrive_finish
B -    193156 - boot_flash_init, Start
D -        30 - boot_flash_init, Delta
B -    200263 - sbl1_ddr_set_default_params, Start
D -        30 - sbl1_ddr_set_default_params, Delta
B -    208254 - boot_config_data_table_init, Start
D -    317169 - boot_config_data_table_init, Delta - (60 Bytes)
B -    529968 - CDT Version:3,Platform ID:24,Major ID:1,Minor ID:0,Subtype:=
0
B -    534665 - Image Load, Start
D -     22448 - PMIC Image Loaded, Delta - (37272 Bytes)
B -    557143 - pm_device_init, Start
B -    562908 - PON REASON:PM0:0x60 PM1:0x20
B -    599294 - PM_SET_VAL:Skip
D -     40016 - pm_device_init, Delta
B -    601216 - pm_driver_init, Start
D -      2897 - pm_driver_init, Delta
B -    607834 - pm_sbl_chg_init, Start
D -        91 - pm_sbl_chg_init, Delta
B -    614575 - vsense_init, Start
D -         0 - vsense_init, Delta
B -    624670 - Pre_DDR_clock_init, Start
D -       396 - Pre_DDR_clock_init, Delta
B -    628208 - ddr_initialize_device, Start
B -    631899 - 8996 v3.x detected, Max frequency =3D 1.8 GHz
B -    641537 - ddr_initialize_device, Delta
B -    641567 - DDR ID, Rank 0, Rank 1, 0x6, 0x300, 0x300
B -    645410 - Basic DDR tests done
B -    714157 - clock_init, Start
D -       274 - clock_init, Delta
B -    717543 - Image Load, Start
D -      4331 - QSEE Dev Config Image Loaded, Delta - (46008 Bytes)
B -    723002 - Image Load, Start
D -      5307 - APDP Image Loaded, Delta - (0 Bytes)
B -    731603 - usb: UFS Serial - a28415ce
B -    735965 - usb: fedl, vbus_low
B -    739594 - Image Load, Start
D -     55449 - QSEE Image Loaded, Delta - (1640572 Bytes)
B -    795043 - Image Load, Start
D -      2043 - SEC Image Loaded, Delta - (4096 Bytes)
B -    802607 - sbl1_efs_handle_cookies, Start
D -       488 - sbl1_efs_handle_cookies, Delta
B -    811117 - Image Load, Start
D -     14365 - QHEE Image Loaded, Delta - (254184 Bytes)
B -    825482 - Image Load, Start
D -     14091 - RPM Image Loaded, Delta - (223900 Bytes)
B -    840397 - Image Load, Start
D -      3172 - STI Image Loaded, Delta - (0 Bytes)
B -    847107 - Image Load, Start
D -     34800 - APPSBL Image Loaded, Delta - (748620 Bytes)
B -    881999 - SBL1, End
D -    796569 - SBL1, Delta
S - Flash Throughput, 94000 KB/s  (2958928 Bytes,  31192 us)
S - DDR Frequency, 1017 MHz
Android Bootloader - UART_DM Initialized!!!
[0] BUILD_VERSION=3D
[0] BUILD_DATE=3D00:29:31 - Dec  4 2023
[0] welcome to lk
...
```


Cheers!

Chris

