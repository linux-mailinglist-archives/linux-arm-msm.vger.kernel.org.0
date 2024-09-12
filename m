Return-Path: <linux-arm-msm+bounces-31656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C55BF97732D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 22:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C0F1F24FB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 20:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF671C2335;
	Thu, 12 Sep 2024 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cryyQhs+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4E1C2422
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 20:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174642; cv=none; b=EBtOAXREN1fS3c3503g5MCufCTWz2nxCPzy5PWmJvjDvmXlzM4b5ir+ZWYucn0zrZSpYfUV6m9I+CCwbzpG0SlhP5rkfmlzpMyo2H9o6af/CiHwsYvsoMO3fxUoOKcQ05enGBw5CGtLrhIHBHwfn9P2K8MVUt/hSZq3sFcD7tJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174642; c=relaxed/simple;
	bh=MPzN7Xt9KkvDRGhzTg4I5/ta7r6Y29CJzh8rPQ/1zew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmsaPprdzBxTAkkIhqqVwi59sZYdmi90q1nT1e4nfgCpZd+At+7cVSQfVyF75Z3PI6jsFJI0ywqzDHws2gvLFznz+krQ6HCzdwvk3ri3VUWqPmY6h5EXR5EJaFq6i0k4eQwfzYnXnbu8t6iHBMQfkjGorpL5TiP79LmM+L0Pdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cryyQhs+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso912009b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726174639; x=1726779439; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5u1lBjghAEooEmt4kn5xj51889WGc4FGCt+mBnFZO0U=;
        b=cryyQhs+lo+BG5MEYRxt9tz+5uGN3mTagUl9eg78SSv7rz4sWxsDQqIitwqRC/PLCh
         BO/8zk+h8CfIJhujtJYI7iLfHPS/Ry9b50Zx/ImLlQMwtQ13Rxq9GRWtg++dcw35iKXN
         1BmvEffWzTWnDjztRRL6JIHvWDMyz7gZYChZpn+hvxw568W8t/Dg78o3eeiAuGMq9aVP
         SvdBoHQVWqsgiS+ef/hMZdlGoBTKuM7gMB5u9zSB8MsfeiqWyHa/kz9PDV8RiO1H4gtt
         PluN8FFy7biDbqAZ6Ug9wwrdAlfH81HoTZ7NUs+DOgxqHTOJVpp4gc/2CKxT2lEGD+kB
         k73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174639; x=1726779439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5u1lBjghAEooEmt4kn5xj51889WGc4FGCt+mBnFZO0U=;
        b=bwunPyUniJuFDhTSZN4IYBufBa1tjL8hnU5/F1WW+Bf6V/E9xgV2gvVeiNwEZ4YUOp
         gIuWelG5d20MpgdfB03nVodfQddE2FpviLSwyExqItFuh/wBq8wSd8LE7VbTfOgAK0vM
         pq5SQ8vXhynH2cfxzyrNw/gmI3yYKI4xY3kwEI7o4PPO1Q2f+TD72zpEM1Wg7OCt3kGj
         CBrnm81ffx5lsxPFQhCh4XkdUMpxiCiJXYwTyKdPsZdHQ9pe+eM2LovVKXJlwE2HbxOV
         1XlVkofC8amwxHDB1WggaCJqMas8Vebb2cUUL30r78XV1DRQ+A2ZbeXrpZDDTFI35vwq
         8T4w==
X-Gm-Message-State: AOJu0YzRs9j0DsdbUI31CaTGk9MptHM4JhlnZ2KZyGGKQQfoPLsTJt0S
	IPyG3wpEBVFl24s4Gdrry6Sx0QVMZQLMX53d07M2qMFzzH5W9A84zC2+KEttQw==
X-Google-Smtp-Source: AGHT+IFO0GUVgm0fzbZa/pitmVKEnOh/hQc/eRUSksaTRptu350aewgo8rqYfhW2cDAWJNam659tlw==
X-Received: by 2002:a05:6a20:d80b:b0:1c4:dfa7:d3b9 with SMTP id adf61e73a8af0-1cf75f0051bmr6069583637.28.1726174638972;
        Thu, 12 Sep 2024 13:57:18 -0700 (PDT)
Received: from google.com (253.54.247.35.bc.googleusercontent.com. [35.247.54.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fca189sm4975725b3a.23.2024.09.12.13.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:57:18 -0700 (PDT)
Date: Thu, 12 Sep 2024 20:57:14 +0000
From: Neill Kapron <nkapron@google.com>
To: Maxwell Bland <mbland@motorola.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Andrew Wheeler <awheeler@motorola.com>,
	Sammy BS2 Que | =?utf-8?B?6ZiZ5paM55Sf?= <quebs2@motorola.com>,
	Todd Kjos <tkjos@google.com>,
	Viktor Martensson <vmartensson@google.com>,
	Andy Lutomirski <luto@amacapital.net>,
	"keescook@chromium.org" <keescook@chromium.org>,
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	kernel-team <kernel-team@android.com>, maze@google.com,
	adelva@google.com, jeffv@google.com
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <ZuNVqvVgXLjNXS5Y@google.com>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>

On Thu, Sep 12, 2024 at 04:02:53PM +0000, Maxwell Bland wrote:
> (Resending as plaintext for msm-kernel mailing list.
> Original message was intended for android kernel team
> though msm-kernel should be aware.)
>=20
> Hi Kernel Team,
>=20
> + Kees, Andy, and Will since their input may be valuable.
>=20
> It has been a while! (~9 months to be exact). This January, I sent out a =
small
> message on BPF code loading ("unprivileged BPF considered harmful" or som=
ething
> like that). In it, I noted new BPF programs are compiled all the time and
> thrown into the kernel. At the time, I did not know these programs were j=
ust
> compiled seccomp filter policies, loaded in as new BPF programs continuou=
sly
> through the libminijail interface as well as direct syscall. As of two da=
ys
> ago, I now know this (and now you do too, if not already).
>=20
> OK, yes, syscall filtering is very important, but this is creating a catc=
h-22
> issue. For one, see step (4) under "Exploitation overview" for
> https://www.qualys.com/2021/07/20/cve-2021-33909/sequoia-local-privilege-=
escalation-linux.txt.
> Second, this minor lack of caching is adding load time to more than 90
> binaries/services on the standard QCOM baseline=E2=80=94I'll admit, it is=
 probably
> negligible in the grand scheme of things (a quick approximation puts the =
data
> operated on around 0.1188 MB). But most importantly, third, without some =
degree
> of provenance, I have no way of telling if someone has injected malicious=
 code
> into the kernel, and unfortunately even knowing the correct bytes is still
> "iffy", as in order to prevent JIT spray attacks, each of these filters is
> offset by some random number of uint32_t's, making every 4-byte shift of =
the
> filter a "valid" codepage to be loaded at runtime.
>=20
> You might be thinking, "but wait, bionic's libc only defines a couple of
> restricted policies, primary and secondary for system and user apps
> respectively." I know! For the most part, apps fall into either what I pr=
esume
> is the default app/system policies, but there are lots of QCOM binaries a=
nd
> other magic programs (dolby dax) that are sending up these programs as we=
ll.
> I'm seeing more than 20 different programs for around a minute's worth of
> runtime. One example is attached at the end.
>=20
> So, the proposal: a "CONFIG_SECCOMMP_STATIC_POLICY" for seccomp. This
> would change the Android kernel's generic SYS_seccomp call, which takes i=
n a
> filter with an array of BPF instructions, to instead reference an ID which
> corresponds to a fixed file on /sys/bpf/seccomp or something like that. T=
he
> sandboxing behavior of these apps should be known at compile-time, even if
> there are multiple "permission set types" that may need to be dispatched.=
 User
> apps should always have a single, fixed policy. This way it is possible t=
o say
> for every code page loaded into the kernel where it came from and what it
> should look like.
>=20
> Unfortunately, I do not know Motorola has enough "weight" to convince QCO=
M to
> do the right foundational thing here, or to "define" the seccomp APIs for
> Android, so it would be good to have Google's buy in, know if there are p=
lans
> to fix this issue, or some discussion of how to best fix the problem? If
> anything, a contact at QCOM that might be able to actually hunt down and
> document valid bytes for these policies?
>=20
> The end goal is simple: when we see a code page is allocated in the kerne=
l, we
> can be sure that (1) it isn't malicious and (2) has not been modified in
> transit. I'm fine putting code where my mouth is, but right now that code
> would involve having to fingerprint the signatures loaded by Qualcomm
> components every time a new one is released, or pinging Google with a huge
> patch changing how seccomp works with no idea of what requirements QCOM m=
ay
> have on seccomp policy generation.
>=20
> Thoughts? Is this doable, and if not, why? I'd also love help with the co=
de and
> adapting existing minijail code to use a new, more integrity-preserving
> interface. If I am mistaken and it is possible to grab out valid BPF poli=
cy
> code at compile time, please let me know how!
>=20
> Regards,
> Maxwell Bland
>=20
> Standard filter, (from, for example, com.google.android.gms)
> "ac00000000000000ac77000000000000bf160000000000006160040000000000b4020000=
b70000c01d20020000000000b40000000000000095000000000000006160000000000000550=
00200cb000000b40000000000ff7f95000000000000005500020019000000b40000000000ff=
7f950000000000000055000200ce000000b40000000000ff7f950000000000000055000200c=
6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f9500=
00000000000055000100de00000005007b000000000055000200d7000000b40000000000ff7=
f950000000000000055000200d8000000b40000000000ff7f950000000000000055000100e2=
00000005008f000000000055000200a7000000b40000000000ff7f950000000000000055000=
20038000000b40000000000ff7f95000000000000005500020062000000b40000000000ff7f=
95000000000000005500020039000000b40000000000ff7f9500000000000000550002003f0=
00000b40000000000ff7f95000000000000005500020040000000b40000000000ff7f950000=
00000000005500020050000000b40000000000ff7f9500000000000000550002004e000000b=
40000000000ff7f9500000000000000550002002c000000b40000000000ff7f950000000000=
00005500020043000000b40000000000ff7f9500000000000000550002001d000000b400000=
00000ff7f95000000000000005500020030000000b40000000000ff7f950000000000000055=
00020071000000b40000000000ff7f950000000000000055000200ae000000b40000000000f=
f7f950000000000000055000200a3000000b40000000000ff7f950000000000000055000200=
86000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f950=
000000000000055000200e9000000b40000000000ff7f9500000000000000550002003e0000=
00b40000000000ff7f95000000000000005500020087000000b40000000000ff7f950000000=
00000005500020019000000b40000000000ff7f9500000000000000550002005c000000b400=
00000000ff7f95000000000000005500020016010000b40000000000ff7f950000000000000=
055000200dc000000b40000000000ff7f95000000000000005500020060000000b400000000=
00ff7f950000000000000055000200dd000000b40000000000ff7f950000000000000055000=
20078000000b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f=
9500000000000000550002008b000000b40000000000ff7f950000000000000055000200800=
00000b40000000000ff7f950000000000000055000200cb000000b40000000000ff7f950000=
000000000055000100c600000005004c0000000000550002005d000000b40000000000ff7f9=
50000000000000055000200ac000000b40000000000ff7f9500000000000000550002008400=
0000b40000000000ff7f9500000000000000550002008c000000b40000000000ff7f9500000=
000000000550002003d000000b40000000000ff7f95000000000000005500020017000000b4=
0000000000ff7f9500000000000000b40000000000030095000000000000000500000000000=
0006160200000000000630afcff000000006160240000000000630af8ff0000000045000300=
0000000061a0fcff00000000450001000400000005000100000000000500010000000000050=
00e000000000005000000000000006160200000000000630afcff0000000061602400000000=
00630af8ff00000000450003000000000061a0fcff000000004500010002000000050001000=
0000000050001000000000005000300000000000500000000000000b4000000000003009500=
0000000000000500000000000000b40000000000ff7f9500000000000000050000000000000=
06160200000000000630afcff000000006160240000000000630af8ff000000004500030000=
00000061a0fcff0000000045000100040000000500010000000000050001000000000005000=
e000000000005000000000000006160200000000000630afcff000000006160240000000000=
630af8ff00000000450003000000000061a0fcff00000000450001000200000005000100000=
00000050001000000000005000300000000000500000000000000b400000000000300950000=
00000000000500000000000000b40000000000ff7f950000000000000005000000000000006=
160100000000000630afcff000000006160140000000000630af8ff00000000550002000000=
000061a0fcff000000001500010001000000050001000000000005000300000000000500000=
000000000b40000000000030095000000000000000500000000000000b40000000000ff7f95=
00000000000000",
> Unknown filter (from QCOM's /vendor/bin/qesdk-secmanager)
>  "ac00000000000000ac77000000000000bf160000000000006160040000000000b402000=
0b70000c01d20020000000000b4000000000000009500000000000000616000000000000055=
000200cb000000b40000000000ff7f95000000000000005500020019000000b40000000000f=
f7f950000000000000055000200ce000000b40000000000ff7f950000000000000055000200=
c6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f950=
000000000000055000100de00000005007e000000000055000100e200000005009800000000=
0055000200d7000000b40000000000ff7f950000000000000055000200a7000000b40000000=
000ff7f95000000000000005500020062000000b40000000000ff7f95000000000000005500=
02001d000000b40000000000ff7f95000000000000005500020038000000b40000000000ff7=
f9500000000000000550002003f000000b40000000000ff7f95000000000000005500020039=
000000b40000000000ff7f95000000000000005500020050000000b40000000000ff7f95000=
00000000000550002004e000000b40000000000ff7f9500000000000000550002004f000000=
b40000000000ff7f950000000000000055000200d8000000b40000000000ff7f95000000000=
000005500020043000000b40000000000ff7f9500000000000000550002002c000000b40000=
000000ff7f95000000000000005500020087000000b40000000000ff7f95000000000000005=
500020086000000b40000000000ff7f95000000000000005500020030000000b40000000000=
ff7f950000000000000055000200ae000000b40000000000ff7f95000000000000005500020=
016010000b40000000000ff7f95000000000000005500020019000000b40000000000ff7f95=
000000000000005500020042000000b40000000000ff7f950000000000000055000200dc000=
000b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f95000000=
00000000550002007b000000b40000000000ff7f9500000000000000550002005d000000b40=
000000000ff7f950000000000000055000200ac000000b40000000000ff7f95000000000000=
005500020084000000b40000000000ff7f950000000000000055000200a3000000b40000000=
000ff7f95000000000000005500020080000000b40000000000ff7f95000000000000005500=
020078000000b40000000000ff7f950000000000000055000200dd000000b40000000000ff7=
f950000000000000055000100c600000005005800000000005500020060000000b400000000=
00ff7f9500000000000000550002008b000000b40000000000ff7f950000000000000055000=
200cb000000b40000000000ff7f95000000000000005500020071000000b40000000000ff7f=
95000000000000005500020040000000b40000000000ff7f9500000000000000550002003b0=
00000b40000000000ff7f950000000000000055000200e9000000b40000000000ff7f950000=
000000000055000200b2000000b40000000000ff7f9500000000000000550002008c000000b=
40000000000ff7f950000000000000055000200d8000000b40000000000ff7f950000000000=
0000b400000000000300950000000000000005000000000000006160200000000000630afcf=
f000000006160240000000000630af8ff00000000450003000000000061a0fcff0000000045=
000100040000000500010000000000050001000000000005000e00000000000500000000000=
0006160200000000000630afcff000000006160240000000000630af8ff0000000045000300=
0000000061a0fcff00000000450001000200000005000100000000000500010000000000050=
00300000000000500000000000000b400000000000300950000000000000005000000000000=
00b40000000000ff7f950000000000000005000000000000006160200000000000630afcff0=
00000006160240000000000630af8ff00000000450003000000000061a0fcff000000004500=
0100040000000500010000000000050001000000000005000e0000000000050000000000000=
06160200000000000630afcff000000006160240000000000630af8ff000000004500030000=
00000061a0fcff0000000045000100020000000500010000000000050001000000000005000=
300000000000500000000000000b40000000000030095000000000000000500000000000000=
b40000000000ff7f950000000000000005000000000000006160100000000000630afcff000=
000006160140000000000630af8ff00000000550002000000000061a0fcff00000000150001=
0001000000050001000000000005000300000000000500000000000000b4000000000003009=
5000000000000000500000000000000b40000000000ff7f9500000000000000",
>=20
> List of services loading seccomp filters pulled from one run of the phone:
> com.google.android.deskclock
> /vendor/bin/qesdk-secmanager
> media.hwcodec/vendor.qti.media.c2@1.0-service
> media.audio.qc.codec.qti.media.c2audio@1.0-service
> /vendor/bin/vendor.qti.qspmhal-service
> /vendor/bin/qsap_sensors
> media.extractoraextractor
> /system_ext/bin/perfservice
> /vendor/bin/wfdhdcphalservice
> /vendor/bin/wifidisplayhalservice
> /vendor/bin/qsap_dcfd
> /vendor/bin/qms
> /vendor/bin/qsap_location
> /vendor/bin/qsap_qapeservice
> /vendor/bin/wfdvndservice
> media.swcodecoid.media.swcodec/bin/mediaswcodec
> /vendor/bin/hw/qcrilNrd
> qsap_qms_13qms16
> qsap_qms_24qms17
> /vendor/bin/ATFWD-daemon
> /vendor/bin/hw/sxrservice
> /vendor/bin/hw/qcrilNrd-c2
> system_server
> /vendor/bin/qmi_motext_hook1013170
> /vendor/bin/qmi_motext_hook1013171
> /vendor/bin/ims_rtp_daemon
> com.android.systemui
> webview_zygote
> com.dolby.daxservice
> vendor.qti.qesdk.sysservice
> org.codeaurora.ims
> com.android.se
> com.android.phone
> com.qti.qcc
> com.google.android.ext.services
> com.google.android.gms
> com.google.android.euicc
> com.google.android.googlequicksearchbox:interactor
> com.google.android.apps.messaging:rcs
> com.android.nfc
> com.qualcomm.qti.workloadclassifier
> com.qualcomm.location
> com.google.android.gms.unstable
> com.thundercomm.ar.core
> com.android.vending:background
> com.android.vending:quick_launch
> com.android.dynsystem
> com.android.managedprovisioning
> com.android.shell


+ Jeff, Alistair, and Maciej

Maxwell,

Thanks for the details on this, I have added several people who may be
better suited to comment on this.

Neill

