Return-Path: <linux-arm-msm+bounces-17193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056DA8A0B85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83B26B24454
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF682EAE5;
	Thu, 11 Apr 2024 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jySAA3fM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D4C1422DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712824878; cv=none; b=gNemjyELAHw+4c0/EoAy+7Fl0OO8VCk2Cg+rCEaDqCMjP78kdpvtRFd6LgVhqXrrL3lXcrRb5W8LbAMrQ0WTunHceM9Jzq6lI4d50Qv9qlbW6kMdJQsD1O46PAl90Zvm+Gvbolt9XG8Li/IIM5m26oPf9DeWGCnP2EOS5IaPGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712824878; c=relaxed/simple;
	bh=7XwS40heuSzS08AOg3Ct0waSlqMddnC3kfgp/oSL++0=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+3jPubRa9j82ZM0VTWsT3aJHbZE09ls2lEnyoq6mDDA6/cp3YXPobnDpXP4aLugOycXMB+BnoPw1zZJdrvwXIuW8YUQC47RBl+tLMRVjzgs557y/IMlV0M3pE3mStAIlAo8YXdfviLveqCO9a/mYNSvFKyGU9D8fDm17iRpXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jySAA3fM; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-617dfcf80aeso62241657b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712824875; x=1713429675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qyLF4kgizvTFTCCpOZdjrYGVi6dVtt6usPwLnMza0Q=;
        b=jySAA3fM9sjmJc6KOy5wz+tA+U2JE4kRTTC2xOkKada4bLo5e0RXfUGIoPoVWfjoDl
         UMF65QwUah3QQkTMdpDY0AFOdQS/hgB+kQ7zhurNy9AWHeJI3irDbfW6zg15zcfgWFl3
         JvX/GqKsaFhl3fAODHi4KwVSZXmmGULqZXb6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712824875; x=1713429675;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qyLF4kgizvTFTCCpOZdjrYGVi6dVtt6usPwLnMza0Q=;
        b=NzhXALkCkttZ3h2Ej1o7sEaE5zEs1u8oTGrQAXogR2opbX1dy6j9gRBJmpQAGuk7K1
         UQVtCvLIPYjYJ/XH95KMUliYVAcaFvSGP7WiuDTZ2UsQDVnNGpN78gzAfAkZVcpzi/15
         HvZSZ4FqXPabxmYq02uxQhbj15EWmCGgmbaTH5JJb2B4A+XpLk4a3XjhYHD/NYCv2Rsj
         r5SB4yodeuKNhErb/qxDCprQMFkMiT0Uxz2OI7FAdP0pgPugSHxZLh6teVs4a483dQv8
         Z7FEiwkP2c823ZqB5hpkswHVGyOECQhez2qjcx3iQtPg2MGSCaKAPiQiqV6GsjTTS5ce
         VtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSxXkFFyT0YIKSWXG7u+Jxsq3qRgELux6T6hfZsOhi1+CvC5LeEmFjyIWAelmDY/fa8kz4t4hLzgfj+rg+BsFmNlz1xuW/EQ5lqKrmHg==
X-Gm-Message-State: AOJu0Yy9moWiFF7lbH6K/RzHswpEwjuyyp4ilq17XvtE0q3ntWCCMBMz
	HUtif+ZtpicHwGZ4Up0fFJL272yTgC6PekY58+BPq2csn00KEBNyO+fynp2D762TCgQ8NVO6AmN
	/VEfOXY6bycCSQ0mDXD5Fn5dj2Xkdrjpbc5RN
X-Google-Smtp-Source: AGHT+IGL4zM5jBbRWCJ3sWcug1eth1VghpvE74Gg+jytpS++vbIHeFuIe+Qgfzb0HLwMjL5frK037YhyOOmBSpJ0fAA=
X-Received: by 2002:a81:6fd7:0:b0:609:ff6d:cb87 with SMTP id
 k206-20020a816fd7000000b00609ff6dcb87mr4937781ywc.50.1712824875440; Thu, 11
 Apr 2024 01:41:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Apr 2024 01:41:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZheY-S5VY2AZD7V-@gerhold.net>
References: <20240327200917.2576034-1-volodymyr_babchuk@epam.com>
 <e0586d43-284c-4bef-a8be-4ffbc12bf787@linaro.org> <87a5mjz8s3.fsf@epam.com>
 <f4ebe819-9718-42c3-9874-037151587d0c@linaro.org> <cd549ee8-22dc-4bc4-af09-9c5c925ee03a@linaro.org>
 <ZgU_YDUhBeyS5wuh@gerhold.net> <875xwo6f57.fsf@epam.com> <ZheY-S5VY2AZD7V-@gerhold.net>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 11 Apr 2024 01:41:14 -0700
Message-ID: <CAE-0n52CkvS4ir15E-dXamsPuLhEt+_v7d2J3uQqGz3d+xz8Yg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: cmd-db: map shared memory as WT, not WB
To: Stephan Gerhold <stephan@gerhold.net>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Clark <robdclark@gmail.com>, Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephan Gerhold (2024-04-11 01:02:01)
> On Wed, Apr 10, 2024 at 10:12:37PM +0000, Volodymyr Babchuk wrote:
> > Stephan Gerhold <stephan@gerhold.net> writes:
> > > On Wed, Mar 27, 2024 at 11:29:09PM +0000, Caleb Connolly wrote:
> > >> On 27/03/2024 21:06, Konrad Dybcio wrote:
> > >> > On 27.03.2024 10:04 PM, Volodymyr Babchuk wrote:
> > >> >> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
> > >> >>> On 27.03.2024 9:09 PM, Volodymyr Babchuk wrote:
> > >> >>>> It appears that hardware does not like cacheable accesses to this
> > >> >>>> region. Trying to access this shared memory region as Normal Memory
> > >> >>>> leads to secure interrupt which causes an endless loop somewhere in
> > >> >>>> Trust Zone.
> > >> >>>>
> > >> >>>> The only reason it is working right now is because Qualcomm Hypervisor
> > >> >>>> maps the same region as Non-Cacheable memory in Stage 2 translation
> > >> >>>> tables. The issue manifests if we want to use another hypervisor (like
> > >> >>>> Xen or KVM), which does not know anything about those specific
> > >> >>>> mappings. This patch fixes the issue by mapping the shared memory as
> > >> >>>> Write-Through. This removes dependency on correct mappings in Stage 2
> > >> >>>> tables.
> > >> >>>>
> > >> >>>> I tested this on SA8155P with Xen.
> > >> >>>>
> > >> >>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > >> >>>> ---
> > >> >>>
> > >> >>> Interesting..
> > >> >>>
> > >> >>> +Doug, Rob have you ever seen this on Chrome? (FYI, Volodymyr, chromebooks
> > >> >>> ship with no qcom hypervisor)

ChromeOS boots the kernel at EL2 on sc7180. But more importantly we
don't enable whichever xPU it is that you're running into.

> > >> >>
> > >> >> Well, maybe I was wrong when called this thing "hypervisor". All I know
> > >> >> that it sits in hyp.mbn partition and all what it does is setup EL2
> > >> >> before switching to EL1 and running UEFI.
> > >> >>
> > >> >> In my experiments I replaced contents of hyp.mbn with U-Boot, which gave
> > >> >> me access to EL2 and I was able to boot Xen and then Linux as Dom0.
> > >> >
> > >> > Yeah we're talking about the same thing. I was just curious whether
> > >> > the Chrome folks have heard of it, or whether they have any changes/
> > >> > workarounds for it.
> > >>
> > >> Does Linux ever write to this region? Given that the Chromebooks don't
> > >> seem to have issues with this (we have a bunch of them in pmOS and I'd
> > >> be very very surprised if this was an issue there which nobody had tried
> > >> upstreaming before) I'd guess the significant difference here is between
> > >> booting Linux in EL2 (as Chromebooks do?) vs with Xen.
> > >>
> > >
> > > FWIW: This old patch series from Stephen Boyd is closely related:
> > > https://urldefense.com/v3/__https://lore.kernel.org/linux-arm-msm/20190910160903.65694-1-swboyd@chromium.org/__;!!GF_29dbcQIUBPA!yGecMHGezwkDU9t7XATVTI80PNGjZdQV2xsYFTl6EhpMMsRf_7xryKx8mEVpmTwTcKMGaaWomtyvr05zFcmsf2Kk$
> > > [lore[.]kernel[.]org]
> > >
> > >> The main use case I have is to map the command-db memory region on
> > >> Qualcomm devices with a read-only mapping. It's already a const marked
> > >> pointer and the API returns const pointers as well, so this series
> > >> makes sure that even stray writes can't modify the memory.
> > >
> > > Stephen, what was the end result of that patch series? Mapping the
> > > cmd-db read-only sounds cleaner than trying to be lucky with the right
> > > set of cache flags.
> > >
> >
> > I checked the series, but I am afraid that I have no capacity to finish
> > this. Will it be okay to move forward with my patch? I understand that
> > this is not the best solution, but it is simple and it works. If this is
> > fine, I'll send v2 with all comments addressed.
> >
>
> My current understanding is that the important property here is to have
> a non-cacheable mapping, which is the case for both MEMREMAP_WT and
> MEMREMAP_WC, but not MEMREMAP_WB. Unfortunately, the MEMREMAP_RO option
> Stephen introduced is also a cacheable mapping, which still seems to
> trigger the issue in some cases. I'm not sure why a cache writeback
> still happens when the mapping is read-only and nobody writes anything.

Qualcomm knows for certain. It's not a cache writeback per my
recollection. I recall the problem always being that it's a speculative
access to xPU protected memory. If there's a cacheable mapping in the
non-secure page tables then it may be loaded at the bus with the
non-secure bit set (NS). Once the xPU sees that it reboots the system.

It used to be that we could never map secure memory regions in the
kernel. I suspect with EL2 the story changes slightly. The hypervisor is
the one mapping cmd-db at stage2, so any speculative access goes on the
bus as EL2 tagged, and thus "approved" by the xPU. Then if the
hypervisor sees EL1 (secure or non-secure) access cmd-db, it traps and
makes sure it can actually access that address. If not, the hypervisor
"panics" and reboots. Either way, EL1 can have a cacheable mapping and
EL2 can make sure the secrets are safe, while the cache never goes out
to the bus as anything besides EL2.

>
> You can also test it if you want. For a quick test,
>
> -       cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WB);
> +       cmd_db_header = ioremap_prot(rmem->base, rmem->size, _PAGE_KERNEL_RO);
>
> should be (largely) equivalent to MEMREMAP_RO with Stephen's patch
> series. I asked Nikita to test this on SC7180 and it still seems to
> cause the crash.
>
> It seems to work only with a read-only non-cacheable mapping, e.g. with
>
> +       cmd_db_header = ioremap_prot(rmem->base, rmem->size,
>                                      ((PROT_NORMAL_NC & ~PTE_WRITE) | PTE_RDONLY));
>
> The lines I just suggested for testing are highly architecture-specific
> though so not usable for a proper patch. If MEMREMAP_RO does not solve
> the real problem here then the work to make an usable read-only mapping
> would go beyond just finishing Stephen's patch series, since one would
> need to introduce some kind of MEMREMAP_RO_NC flag that creates a
> read-only non-cacheable mapping.
>
> It is definitely easier to just change the driver to use the existing
> MEMREMAP_WC. Given the crash you found, the hardware/firmware seems to
> have a built-in write protection on most platforms anyway. :D
>

How is Xen mapping this protected memory region? It sounds like maybe
that should be mapped differently. Also, how is EL2 accessible on this
device?

