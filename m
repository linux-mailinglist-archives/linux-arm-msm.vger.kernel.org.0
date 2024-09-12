Return-Path: <linux-arm-msm+bounces-31657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DB9773B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 23:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4331284A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 21:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934502C80;
	Thu, 12 Sep 2024 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xFVa09VG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826019259A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 21:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726177171; cv=none; b=EqZp8cL3A3WamXXA+UkksEt8YHKNEGRZIr3ZysevGWYPwDDK1Keo58ErJ7aPJXRWjNngYFwsJogOR85//mciXivPyMvH92n374IavAHPtpEz1MWVJN5OJ+h2lvJwst820h2AEGK1GCrKBoo57XAzZfHALARDHU6liVknyxpgm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726177171; c=relaxed/simple;
	bh=y003CWC1jp6ot0EKoLFPrIRUy6Ud21JLUgybL2LpLyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLgSwE9MlQ8cWzCXROKFEZG27CXH6k4hFuOkaieFnRE58J7eO8GAZcNxLjPkF7TwLDJpR3Mt6Hc/+s/5kTstc34AlP0+TGXeJjleBU5MGSRN4oHCA41OmHffgiCxgbxxhwGsBV2qHOVG8T6XTeJJCCqaUTWjj1RFKdyIqO+7AvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xFVa09VG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c24374d8b6so4389a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726177168; x=1726781968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+GTbFKn448fOy4mp+eUqnX/14sRs2cMrabP6vh+tuA=;
        b=xFVa09VGCX8FCpZ/jJb/2WsH0A9cX4NK2SxDmk/G6Wr6/0CoS/BjZlBoXoG8mlG6cx
         C6b2fqXMJPQ4keZ9WMoC6vbWKOBpyiy3+DTusQeNitb6k4fU9CybKnplMG2iFGFGsc8x
         kjtiM0kAGuMxkhQ7c5VFEZN2Hq7R2JP3JeHEkyASVkV2L1putpzEd4O4rKs6FoTlVqxJ
         YBwNA68D+tvbRhrZht+B7rRPvCNZycPDOUUZ3uK0jpp0+FMUBukt5n6+8HnJq8600QDn
         MCDm0fi1XWRAkB2cVH4cUs83A4jfPMMQ/Gz7HcyUO++pkLUcjBrtuVvHm5nJXXSKq8xI
         h4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726177168; x=1726781968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+GTbFKn448fOy4mp+eUqnX/14sRs2cMrabP6vh+tuA=;
        b=pLnuhnDqDzcGoSXay3tgWyYYH01r+tiuC1Ikg751V8+AuAb0zWkKxfm8/CBAEkTQ49
         cSku6JqIg9bjHI2IUbQuhiGAUu1p9wUjkZXYrdbOq9Rt+wfzGDiUPqHlOL+wU7VJemZj
         OTp59eZYer5U69Sx+1iGeVEYnzhyuYMl7D5PKg1WhghnUxdK+lWDtZvwVoeZj4kLc0gt
         dzIqS8fgsdqbxDcki2egR/nR7ymXg4TwipVNSa7pLT207AfrB76FhsbR9WtUrK1XunSK
         0qklfhAm1DN+l/RjfXrhOeuhRVwOVt/sYpP68YM4MwHrTBMsO8Uazzp5vqxLLPV0MM41
         0ggQ==
X-Forwarded-Encrypted: i=1; AJvYcCU57Gip2egk0A5ubeaoRsqCO5yw7Vf1/rbj9I2ZsVAB3cPkXDI/kdwNeEHurbFzS89E+cQl8DCjFMrzR5XG@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTGP94DLzRiwDxJCqijHaANYqsjJQrAJKzm3j2NmUcTYiLoV9
	MZjfDDWLMfZtoXcdqv00HWlpFRoD3uUhzRf+jkH3+Ai011s5OhrmfxLDH250RjuJOMmtbRR4OxH
	Yed27mO2EewZ76k5Y1wO0DJwHCxF6uUreH0T/
X-Google-Smtp-Source: AGHT+IGTYbHYnVTOXHzZnLZov0l/waFrLzav0F3azRBjpXojOrNkCM1ve+L2rYlEv3FuOwJbWfFmpkyr3Z9TQhVzs8c=
X-Received: by 2002:a05:6402:348d:b0:5c0:aad5:43db with SMTP id
 4fb4d7f45d1cf-5c4146155d7mr437446a12.4.1726177167137; Thu, 12 Sep 2024
 14:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
 <ZuNVqvVgXLjNXS5Y@google.com>
In-Reply-To: <ZuNVqvVgXLjNXS5Y@google.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 12 Sep 2024 14:39:09 -0700
Message-ID: <CANP3RGfez2onSLVT2wC1hsSmKGxD9aFdV3we3Zsngw0BgbeGyw@mail.gmail.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
To: Neill Kapron <nkapron@google.com>
Cc: Maxwell Bland <mbland@motorola.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Andrew Wheeler <awheeler@motorola.com>, 
	=?UTF-8?B?U2FtbXkgQlMyIFF1ZSB8IOmYmeaWjOeUnw==?= <quebs2@motorola.com>, 
	Todd Kjos <tkjos@google.com>, Viktor Martensson <vmartensson@google.com>, 
	Andy Lutomirski <luto@amacapital.net>, "keescook@chromium.org" <keescook@chromium.org>, 
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	kernel-team <kernel-team@android.com>, adelva@google.com, jeffv@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wrt. BPF on Android:

(a) eBPF should already be locked down to just the bpfloader boot time proc=
ess.

If you can prove it isn't, please let us know, but as this is sepolicy
around the bpf(BPF_PROG_LOAD) system call, it should be pretty
airtight:

allow bpfloader self:bpf { ... prog_load ... };
...
neverallow { domain -bpfloader } *:bpf prog_load;

(basically the only exception to the above is root/su on userdebug/eng
builds, which runs sepolicy in permissive mode and thus doesn't
enforce the above - but that obviously doesn't matter for user builds)

(b) cBPF [classic BPF, internally the kernel translates this to eBPF]
is still allowed, for both seccomp() and normal old style socket
filters

- bpf seccomp() is to the best of my knowledge used by normal play
store updatable applications (including the chrome web browser) for
sandboxing (of rendering processes), as such it would be basically
impossible to lock it down (as apps update independently of the rest
of the system) - and would probably be a net loss for security if you
did lock it down / break it...

If you wanted to pursue this you'd need to get agreement from Chrome &
other applications and provide some 'better' alternative.  Likely some
sort of hard coded seccomp version that blocks things that most
sandboxing apps agree is beneficial to block...

(bpf seccomp() is also used by the Android zygote itself to block
various extra system calls from processes/apps it spawns, but as this
list is hardcoded at build time, it's not actually a problem)

- similarly old style BPF socket filters are 'normal' 'ancient'
BSD/Unix/Linux API.  They're used in the (privileged) network stack
itself (which is mainline updatable via the play store, including the
cbpf code), but could also AFAIK be used by random play store
applications - filtering on sockets is truly ancient api.
https://www.tcpdump.org/papers/bpf-usenix93.pdf is from 1992

-

Is there some eBPF program loading API I'm not aware of that we thus
haven't blocked?

On Thu, Sep 12, 2024 at 1:57=E2=80=AFPM Neill Kapron <nkapron@google.com> w=
rote:
>
> On Thu, Sep 12, 2024 at 04:02:53PM +0000, Maxwell Bland wrote:
> > (Resending as plaintext for msm-kernel mailing list.
> > Original message was intended for android kernel team
> > though msm-kernel should be aware.)
> >
> > Hi Kernel Team,
> >
> > + Kees, Andy, and Will since their input may be valuable.
> >
> > It has been a while! (~9 months to be exact). This January, I sent out =
a small
> > message on BPF code loading ("unprivileged BPF considered harmful" or s=
omething
> > like that). In it, I noted new BPF programs are compiled all the time a=
nd
> > thrown into the kernel. At the time, I did not know these programs were=
 just
> > compiled seccomp filter policies, loaded in as new BPF programs continu=
ously
> > through the libminijail interface as well as direct syscall. As of two =
days
> > ago, I now know this (and now you do too, if not already).
> >
> > OK, yes, syscall filtering is very important, but this is creating a ca=
tch-22
> > issue. For one, see step (4) under "Exploitation overview" for
> > https://www.qualys.com/2021/07/20/cve-2021-33909/sequoia-local-privileg=
e-escalation-linux.txt.
> > Second, this minor lack of caching is adding load time to more than 90
> > binaries/services on the standard QCOM baseline=E2=80=94I'll admit, it =
is probably
> > negligible in the grand scheme of things (a quick approximation puts th=
e data
> > operated on around 0.1188 MB). But most importantly, third, without som=
e degree
> > of provenance, I have no way of telling if someone has injected malicio=
us code
> > into the kernel, and unfortunately even knowing the correct bytes is st=
ill
> > "iffy", as in order to prevent JIT spray attacks, each of these filters=
 is
> > offset by some random number of uint32_t's, making every 4-byte shift o=
f the
> > filter a "valid" codepage to be loaded at runtime.
> >
> > You might be thinking, "but wait, bionic's libc only defines a couple o=
f
> > restricted policies, primary and secondary for system and user apps
> > respectively." I know! For the most part, apps fall into either what I =
presume
> > is the default app/system policies, but there are lots of QCOM binaries=
 and
> > other magic programs (dolby dax) that are sending up these programs as =
well.
> > I'm seeing more than 20 different programs for around a minute's worth =
of
> > runtime. One example is attached at the end.
> >
> > So, the proposal: a "CONFIG_SECCOMMP_STATIC_POLICY" for seccomp. This
> > would change the Android kernel's generic SYS_seccomp call, which takes=
 in a
> > filter with an array of BPF instructions, to instead reference an ID wh=
ich
> > corresponds to a fixed file on /sys/bpf/seccomp or something like that.=
 The
> > sandboxing behavior of these apps should be known at compile-time, even=
 if
> > there are multiple "permission set types" that may need to be dispatche=
d. User
> > apps should always have a single, fixed policy. This way it is possible=
 to say
> > for every code page loaded into the kernel where it came from and what =
it
> > should look like.
> >
> > Unfortunately, I do not know Motorola has enough "weight" to convince Q=
COM to
> > do the right foundational thing here, or to "define" the seccomp APIs f=
or
> > Android, so it would be good to have Google's buy in, know if there are=
 plans
> > to fix this issue, or some discussion of how to best fix the problem? I=
f
> > anything, a contact at QCOM that might be able to actually hunt down an=
d
> > document valid bytes for these policies?
> >
> > The end goal is simple: when we see a code page is allocated in the ker=
nel, we
> > can be sure that (1) it isn't malicious and (2) has not been modified i=
n
> > transit. I'm fine putting code where my mouth is, but right now that co=
de
> > would involve having to fingerprint the signatures loaded by Qualcomm
> > components every time a new one is released, or pinging Google with a h=
uge
> > patch changing how seccomp works with no idea of what requirements QCOM=
 may
> > have on seccomp policy generation.
> >
> > Thoughts? Is this doable, and if not, why? I'd also love help with the =
code and
> > adapting existing minijail code to use a new, more integrity-preserving
> > interface. If I am mistaken and it is possible to grab out valid BPF po=
licy
> > code at compile time, please let me know how!
> >
> > Regards,
> > Maxwell Bland
> >
> > Standard filter, (from, for example, com.google.android.gms)
> > "ac00000000000000ac77000000000000bf160000000000006160040000000000b40200=
00b70000c01d20020000000000b400000000000000950000000000000061600000000000005=
5000200cb000000b40000000000ff7f95000000000000005500020019000000b40000000000=
ff7f950000000000000055000200ce000000b40000000000ff7f95000000000000005500020=
0c6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f95=
0000000000000055000100de00000005007b000000000055000200d7000000b40000000000f=
f7f950000000000000055000200d8000000b40000000000ff7f950000000000000055000100=
e200000005008f000000000055000200a7000000b40000000000ff7f9500000000000000550=
0020038000000b40000000000ff7f95000000000000005500020062000000b40000000000ff=
7f95000000000000005500020039000000b40000000000ff7f9500000000000000550002003=
f000000b40000000000ff7f95000000000000005500020040000000b40000000000ff7f9500=
0000000000005500020050000000b40000000000ff7f9500000000000000550002004e00000=
0b40000000000ff7f9500000000000000550002002c000000b40000000000ff7f9500000000=
0000005500020043000000b40000000000ff7f9500000000000000550002001d000000b4000=
0000000ff7f95000000000000005500020030000000b40000000000ff7f9500000000000000=
5500020071000000b40000000000ff7f950000000000000055000200ae000000b4000000000=
0ff7f950000000000000055000200a3000000b40000000000ff7f9500000000000000550002=
0086000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f9=
50000000000000055000200e9000000b40000000000ff7f9500000000000000550002003e00=
0000b40000000000ff7f95000000000000005500020087000000b40000000000ff7f9500000=
0000000005500020019000000b40000000000ff7f9500000000000000550002005c000000b4=
0000000000ff7f95000000000000005500020016010000b40000000000ff7f9500000000000=
00055000200dc000000b40000000000ff7f95000000000000005500020060000000b4000000=
0000ff7f950000000000000055000200dd000000b40000000000ff7f9500000000000000550=
0020078000000b40000000000ff7f9500000000000000550002005e000000b40000000000ff=
7f9500000000000000550002008b000000b40000000000ff7f9500000000000000550002008=
0000000b40000000000ff7f950000000000000055000200cb000000b40000000000ff7f9500=
00000000000055000100c600000005004c0000000000550002005d000000b40000000000ff7=
f950000000000000055000200ac000000b40000000000ff7f95000000000000005500020084=
000000b40000000000ff7f9500000000000000550002008c000000b40000000000ff7f95000=
00000000000550002003d000000b40000000000ff7f95000000000000005500020017000000=
b40000000000ff7f9500000000000000b400000000000300950000000000000005000000000=
000006160200000000000630afcff000000006160240000000000630af8ff00000000450003=
000000000061a0fcff000000004500010004000000050001000000000005000100000000000=
5000e000000000005000000000000006160200000000000630afcff00000000616024000000=
0000630af8ff00000000450003000000000061a0fcff0000000045000100020000000500010=
000000000050001000000000005000300000000000500000000000000b40000000000030095=
000000000000000500000000000000b40000000000ff7f95000000000000000500000000000=
0006160200000000000630afcff000000006160240000000000630af8ff0000000045000300=
0000000061a0fcff00000000450001000400000005000100000000000500010000000000050=
00e000000000005000000000000006160200000000000630afcff0000000061602400000000=
00630af8ff00000000450003000000000061a0fcff000000004500010002000000050001000=
0000000050001000000000005000300000000000500000000000000b4000000000003009500=
0000000000000500000000000000b40000000000ff7f9500000000000000050000000000000=
06160100000000000630afcff000000006160140000000000630af8ff000000005500020000=
00000061a0fcff0000000015000100010000000500010000000000050003000000000005000=
00000000000b40000000000030095000000000000000500000000000000b40000000000ff7f=
9500000000000000",
> > Unknown filter (from QCOM's /vendor/bin/qesdk-secmanager)
> >  "ac00000000000000ac77000000000000bf160000000000006160040000000000b4020=
000b70000c01d20020000000000b40000000000000095000000000000006160000000000000=
55000200cb000000b40000000000ff7f95000000000000005500020019000000b4000000000=
0ff7f950000000000000055000200ce000000b40000000000ff7f9500000000000000550002=
00c6000000b40000000000ff7f95000000000000005500020042000000b40000000000ff7f9=
50000000000000055000100de00000005007e000000000055000100e2000000050098000000=
000055000200d7000000b40000000000ff7f950000000000000055000200a7000000b400000=
00000ff7f95000000000000005500020062000000b40000000000ff7f950000000000000055=
0002001d000000b40000000000ff7f95000000000000005500020038000000b40000000000f=
f7f9500000000000000550002003f000000b40000000000ff7f950000000000000055000200=
39000000b40000000000ff7f95000000000000005500020050000000b40000000000ff7f950=
0000000000000550002004e000000b40000000000ff7f9500000000000000550002004f0000=
00b40000000000ff7f950000000000000055000200d8000000b40000000000ff7f950000000=
00000005500020043000000b40000000000ff7f9500000000000000550002002c000000b400=
00000000ff7f95000000000000005500020087000000b40000000000ff7f950000000000000=
05500020086000000b40000000000ff7f95000000000000005500020030000000b400000000=
00ff7f950000000000000055000200ae000000b40000000000ff7f950000000000000055000=
20016010000b40000000000ff7f95000000000000005500020019000000b40000000000ff7f=
95000000000000005500020042000000b40000000000ff7f950000000000000055000200dc0=
00000b40000000000ff7f9500000000000000550002005e000000b40000000000ff7f950000=
0000000000550002007b000000b40000000000ff7f9500000000000000550002005d000000b=
40000000000ff7f950000000000000055000200ac000000b40000000000ff7f950000000000=
00005500020084000000b40000000000ff7f950000000000000055000200a3000000b400000=
00000ff7f95000000000000005500020080000000b40000000000ff7f950000000000000055=
00020078000000b40000000000ff7f950000000000000055000200dd000000b40000000000f=
f7f950000000000000055000100c600000005005800000000005500020060000000b4000000=
0000ff7f9500000000000000550002008b000000b40000000000ff7f9500000000000000550=
00200cb000000b40000000000ff7f95000000000000005500020071000000b40000000000ff=
7f95000000000000005500020040000000b40000000000ff7f9500000000000000550002003=
b000000b40000000000ff7f950000000000000055000200e9000000b40000000000ff7f9500=
00000000000055000200b2000000b40000000000ff7f9500000000000000550002008c00000=
0b40000000000ff7f950000000000000055000200d8000000b40000000000ff7f9500000000=
000000b400000000000300950000000000000005000000000000006160200000000000630af=
cff000000006160240000000000630af8ff00000000450003000000000061a0fcff00000000=
45000100040000000500010000000000050001000000000005000e000000000005000000000=
000006160200000000000630afcff000000006160240000000000630af8ff00000000450003=
000000000061a0fcff000000004500010002000000050001000000000005000100000000000=
5000300000000000500000000000000b4000000000003009500000000000000050000000000=
0000b40000000000ff7f950000000000000005000000000000006160200000000000630afcf=
f000000006160240000000000630af8ff00000000450003000000000061a0fcff0000000045=
000100040000000500010000000000050001000000000005000e00000000000500000000000=
0006160200000000000630afcff000000006160240000000000630af8ff0000000045000300=
0000000061a0fcff00000000450001000200000005000100000000000500010000000000050=
00300000000000500000000000000b400000000000300950000000000000005000000000000=
00b40000000000ff7f950000000000000005000000000000006160100000000000630afcff0=
00000006160140000000000630af8ff00000000550002000000000061a0fcff000000001500=
010001000000050001000000000005000300000000000500000000000000b40000000000030=
095000000000000000500000000000000b40000000000ff7f9500000000000000",
> >
> > List of services loading seccomp filters pulled from one run of the pho=
ne:
> > com.google.android.deskclock
> > /vendor/bin/qesdk-secmanager
> > media.hwcodec/vendor.qti.media.c2@1.0-service
> > media.audio.qc.codec.qti.media.c2audio@1.0-service
> > /vendor/bin/vendor.qti.qspmhal-service
> > /vendor/bin/qsap_sensors
> > media.extractoraextractor
> > /system_ext/bin/perfservice
> > /vendor/bin/wfdhdcphalservice
> > /vendor/bin/wifidisplayhalservice
> > /vendor/bin/qsap_dcfd
> > /vendor/bin/qms
> > /vendor/bin/qsap_location
> > /vendor/bin/qsap_qapeservice
> > /vendor/bin/wfdvndservice
> > media.swcodecoid.media.swcodec/bin/mediaswcodec
> > /vendor/bin/hw/qcrilNrd
> > qsap_qms_13qms16
> > qsap_qms_24qms17
> > /vendor/bin/ATFWD-daemon
> > /vendor/bin/hw/sxrservice
> > /vendor/bin/hw/qcrilNrd-c2
> > system_server
> > /vendor/bin/qmi_motext_hook1013170
> > /vendor/bin/qmi_motext_hook1013171
> > /vendor/bin/ims_rtp_daemon
> > com.android.systemui
> > webview_zygote
> > com.dolby.daxservice
> > vendor.qti.qesdk.sysservice
> > org.codeaurora.ims
> > com.android.se
> > com.android.phone
> > com.qti.qcc
> > com.google.android.ext.services
> > com.google.android.gms
> > com.google.android.euicc
> > com.google.android.googlequicksearchbox:interactor
> > com.google.android.apps.messaging:rcs
> > com.android.nfc
> > com.qualcomm.qti.workloadclassifier
> > com.qualcomm.location
> > com.google.android.gms.unstable
> > com.thundercomm.ar.core
> > com.android.vending:background
> > com.android.vending:quick_launch
> > com.android.dynsystem
> > com.android.managedprovisioning
> > com.android.shell
>
>
> + Jeff, Alistair, and Maciej
>
> Maxwell,
>
> Thanks for the details on this, I have added several people who may be
> better suited to comment on this.
>
> Neill

