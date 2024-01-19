Return-Path: <linux-arm-msm+bounces-7644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7B832FD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 21:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 825D01F212EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jan 2024 20:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AD156454;
	Fri, 19 Jan 2024 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7jT12MR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D493374E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705696556; cv=none; b=jo55wDFlZBaIy+PuEZk/6WkIxLVrDh8XAq7eunEILfCr5zsaF8dR2BXAAcHlufRq4zPl+D+b57JyzqjkGL03sdFr35kwrwHo1huNxWx07MqyeJz2yCsVHpwj0F0f7Rde7V3IH/4PkwTEqJ0IIDLbVHF8oDQg8CUqDKQ326XD2UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705696556; c=relaxed/simple;
	bh=Da350K6foabEPR3XP9PM6t2zVSKNbvcdZb6h5pOnBBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgBgivR2tgcmtdBt9LF2ZlKW3VXeRSVzONHEVndFXOkape9JScUeuLEG8xtSrxh8Z8tErniiFdsYsEUHkXlUjHgi9J17IGsLnvYbZDdl0D+Zu+fKw/Ddd/YAhhfUqVHPiD4shFnar/PvMAYgeaSnY03QDtjJ8v9bYHejkg6WA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7jT12MR; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc236729a2bso1142980276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 12:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705696554; x=1706301354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq6a9Wcfb/K9SZpzYXbOmT6slrxaKFYZPaGPVB9JuHM=;
        b=n7jT12MRk3fQmY7MxYU97LT2Pv1d1dQAohLf0H9jFM45PeHPIhrzpJVG9nZdHvvBGp
         9lEueBxCel2KY9Mg45uLLbBrnZs26e6nsH3Hn911wGrq2P82YAO+q8njGkTLlEqjw+2p
         vmnAawlWyoQGIyqM5hVhKE62AsRFAE5ccNSGuRoqo9RwcuTV7dbQi7zM21YMlp9UqQQ/
         NY3qvcSMVT6n4Q7+CAfNy/l+o/eU9ei5989RLLQRJ6f7NSRwoUWMfm0ThkkBThgOuI3+
         1Mt+UGUw3AuiGDn9baHkAxF5fGIFa6NlkNGBQGcelyCTJhRPti7PDFmx9AHvtd2huzlv
         6ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705696554; x=1706301354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq6a9Wcfb/K9SZpzYXbOmT6slrxaKFYZPaGPVB9JuHM=;
        b=c0pvZjKeLI6gZKjTy2X4vkdWR2/bdtXMpV+H58/W7EYXkUafw1v/QyMsyJjICaiOOI
         Q0BpnB8b3y6Lnz7hOy8YV/qsaXTnJlFk6u3VxSYqocDS1xEVJIZJzH+BNsntDHa5b0D9
         TcXaX6mnkYoiMopakC4SbrjkZRHYyX85xAxVB70OjgkzBiHjysZOmAGqVeFTT75PBtGh
         3Lo0Mm3QkVZMy92FsOwOotDW2XAi8HO9Sw6Bcecedg6fba/yyoJ1yJbL940evt7cZ8Fv
         wvqniKJ9+24xnoa94mgAclLvrw2JByGC9IrtPgAa/eTlEiTY+Td4Brn0mZPE1HI9fyIF
         dJ6A==
X-Gm-Message-State: AOJu0Yxd5CppuXAw+GMZeMLGbGnWM0tODjR5pUWw7WcCrVxBRUl1q57/
	+Hx/fkf3TUAU89fJoOGIu2FJ0hW+hYJGZAJTR18DORjIukidytdJg5r+U3TItTkYaGbD/hyDNYB
	lAM6XcsxPPFTubEfYFvNFvzlbpDkwDazAhOFMDA==
X-Google-Smtp-Source: AGHT+IFpl97msSR+YJehEn5UzAbLewmm99ALCb9KjvcHZAfQ8hZT0KmzSnhQw5CEYuMghLfLzqVEDKDbl5HBgXy/yZE=
X-Received: by 2002:a25:6947:0:b0:dc2:645d:163c with SMTP id
 e68-20020a256947000000b00dc2645d163cmr447161ybc.6.1705696554265; Fri, 19 Jan
 2024 12:35:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118155711.7601-1-quic_ninanaik@quicinc.com>
 <rq2dnfh6ctn5gbf3o3op5ywxx7zhx6r5sh5ykautye56o3p4dg@rjttk3rr65ld> <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20240119191144.GR3013251@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 22:35:43 +0200
Message-ID: <CAA8EJppLNFReZn1HK_radSkKkf5L584fx3FCuqG0FoUt4+H=nw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Eric Chanudet <echanude@redhat.com>, Ninad Naik <quic_ninanaik@quicinc.com>, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_psodagud@quicinc.com, quic_kprasan@quicinc.com, quic_ymg@quicinc.com, 
	kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jan 2024 at 21:12, Bjorn Andersson <quic_bjorande@quicinc.com> w=
rote:
>
> On Thu, Jan 18, 2024 at 06:58:19PM -0500, Eric Chanudet wrote:
> > On Thu, Jan 18, 2024 at 09:27:11PM +0530, Ninad Naik wrote:
> > > New memory map layout changes (by Qualcomm firmware) have brought
> > > in updates to base addresses and/or size for different memory regions
> > > like cpcucp_fw, tz-stat, and also introduces new memory regions for
> > > resource manager firmware. This change brings in these corresponding
> > > memory map updates to the SA8775P SoC device tree.
> > >
> > > Signed-off-by: Ninad Naik <quic_ninanaik@quicinc.com>
> >
> > With next-20240118, without this patch, running "./memtester 32G"[1]
> > crashed the board quickly during the mlock:
> >
> > [   42.144892] Internal error: synchronous external abort: 000000009600=
0010 [#1] PREEMPT SMP
>
> Sounds like just passing "memtest=3D1" on the kernel command line (with
> CONFIG_MEMTEST=3Dy) would trip this...
>
> > [   42.153316] Modules linked in: r8153_ecm cdc_ether usbnet marvell dw=
mac_qcom_ethqos stmmac_platform r8152 rfkill stmmac crct10dif_ce qcom_spmi_=
temp_alarm pcs_xpcs nvmem_qcom_spmi_sdam qcom_stats i2c_qcom_geni qcom_pon =
spi_geni_qcom qcom_wdt socinfo phy_qcom_sgmii_eth nvmem_reboot_mode phy_qco=
m_qmp_usb gpucc_sa8775p phy_qcom_snps_femto_v2 phy_qcom_qmp_pcie qcom_rng d=
rm fuse backlight ipv6
> > [   42.188566] CPU: 3 PID: 472 Comm: memtester Not tainted 6.7.0-next-2=
0240118-00001-g10a3c9d045cf #169
> > [   42.197944] Hardware name: Qualcomm SA8775P Ride (DT)
> > [   42.203138] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [   42.210292] pc : clear_page+0x18/0x58
> > [   42.214063] lr : clear_huge_page+0x84/0x1a0
> > [   42.218370] sp : ffff800081ef3a30
> > [   42.221776] x29: ffff800081ef3a30 x28: 0000000000000000 x27: 0000000=
000210009
> > [   42.229108] x26: 0000000000000000 x25: fffffc6abc053380 x24: ffff000=
000000000
> > [   42.236439] x23: 0000000000000000 x22: 0000000000000000 x21: 0000006=
a89b87f80
> > [   42.243770] x20: 00000000000001fe x19: fffffc6a89b80000 x18: ffff800=
081ef3d18
> > [   42.251101] x17: 0000000000000068 x16: 0000000000000001 x15: 0000000=
0000001c2
> > [   42.258431] x14: 0000000000000002 x13: fffffc6a89b90008 x12: 0000000=
000000001
> > [   42.265761] x11: 0000000000440dc0 x10: 0000000000000100 x9 : ffffc57=
0ba60c604
> > [   42.273090] x8 : 0000000000000030 x7 : ffff554053756000 x6 : ffff800=
081ef39f0
> > [   42.280420] x5 : 0000000000000130 x4 : ffffc570bd029ae0 x3 : ffff554=
053756000
> > [   42.287752] x2 : 0000000000000004 x1 : 0000000000000040 x0 : ffff1aa=
26e1ff000
> > [   42.295083] Call trace:
> > [   42.297607]  clear_page+0x18/0x58
> > [   42.301015]  do_huge_pmd_anonymous_page+0x254/0x8f8
> > [   42.306036]  __handle_mm_fault+0x728/0x1548
> > [   42.310338]  handle_mm_fault+0x70/0x290
> > [   42.314281]  __get_user_pages+0x144/0x3c0
> > [   42.318404]  populate_vma_page_range+0x7c/0xc8
> > [   42.322972]  __mm_populate+0xc8/0x1d8
> > [   42.326736]  do_mlock+0x194/0x2d0
> > [   42.330144]  __arm64_sys_mlock+0x20/0x38
> > [   42.334178]  invoke_syscall+0x50/0x120
> > [   42.338034]  el0_svc_common.constprop.0+0xc8/0xf0
> > [   42.342874]  do_el0_svc+0x24/0x38
> > [   42.346284]  el0_svc+0x34/0xb8
> > [   42.349425]  el0t_64_sync_handler+0x120/0x130
> > [   42.353906]  el0t_64_sync+0x190/0x198
> > [   42.357674] Code: 37200121 12000c21 d2800082 9ac12041 (d50b7420)
> > [   42.363932] ---[ end trace 0000000000000000 ]---
> >
> > With next-20240118 and this patch, memtester continues through the
> > test-suite.
> >
>
> But the commit message says that this is a new memory map, not that it
> fixes critical shortcomings in the existing definition.
>
> If that's the case the commit message needs to be updated so that we can
> get this into v6.8-rc and the stable kernel (and do we really need all
> those changes for that?).

This kind of change sets a very bad precedent. This way old kernels
become incompatible with the updated firmware. For me it looks like
Linux kernel suddenly being unable to boot after the BIOS upgrade.
Generally memory map updates should be disallowed after the board hits
the production and the DT is published and merged. There can be other
users of DT. BSD systems, U-Boot. We spend sensible efforts in making
sure that DT is an ABI: newer kernel remain compatible with older DT
files. We expect the same kind of efforts from device manufacturers.

I think unless there is a good reason, the memory map update should be
reverted on the Qualcomm side as a breaking change.
If this kind of update is absolutely necessary, it might be better to
define a new set of board files utilising the new memory map, marking
existing DT files as legacy.

--=20
With best wishes
Dmitry

