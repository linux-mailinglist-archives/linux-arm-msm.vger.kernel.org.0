Return-Path: <linux-arm-msm+bounces-85417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE1CC57BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 00:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75BE6302F6B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 23:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299CD33B6E4;
	Tue, 16 Dec 2025 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMGhAW5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C072222B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927990; cv=pass; b=ZiURis/ebcSSIoHz2Z19ySrgsnxCcRvtsAbbIZ5YHrcHMe09hbDcnFH0S6NatUF707Uv1UTodbMcF8f0LlekKqu6XghWfHnyQsYng7iFTGeleMQUa1bNaisvF/nqvU0+7/2jDNtVQDaVDp6623y3r/SS13y6whuYj8VLoJsKXzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927990; c=relaxed/simple;
	bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMcymevko7N4DcGTz8XOZ1OKSYbOMDrlzKp5Dv64nIQAhsr8BP3I1ZlbSUygO4UBxbdH/v81iriN//0vxy35OrXJPSDKWUgoQZYtROXDkRg2n6Os6a5cVAj0ZbustINBjsKWACgTDghwwiFfnhC9cGPisy5K+eBCY2dwoC5fcMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMGhAW5g; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso2149a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 15:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765927985; cv=none;
        d=google.com; s=arc-20240605;
        b=BJlhxdIqYpjzxC+ORHq0EWFtXtVcCghV1TfCfV6LYgr9AotW0DXeCaeokZb4W7t2fG
         mbvCcn1tuuu8Wb4dD8DmGhdytrIjvSTE03J2xiGUavbgOPSqBeroH3YDR5d6kM5iLIC4
         lf+MwbzF6aqt5TM6ZjtmIoIX21wUhd4za3nnpt2c7ZhBlChwUFOfmkn3KzBDC+hciD4U
         1vmmvtRDtqCkI2efbneo6Uf8mK46OT7L93bb16Z16p4m3iUQDOqy/tdrou/ZHfJJ3wsb
         uURou4vgmr+DbPCWOaq3Cax+uyAU0NcA5ZaHNG5gq7PfJhNIAAViQ0ndeDHj/gYgHPfW
         hr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        fh=7Q7HIm2tBPYYURqns6rxOj1uLp0bUmoGOpdrg2mQr+4=;
        b=LGf/CF5iImr5RU6M1szpPg/hBgg3xa7cHtPExkOjUkwSMHhSdo54CQ6mCQ6GMaXfBq
         iraxiSXmlAQvlLZRy0rc/rsHaJ4ljhiDlvdEd2WX3W1oJn+OoiInF31UwYX4P1RaqA1t
         6n/FwbPqjtjvbZeQzj4yxCLVbJkHAB7vbRdgBABUWuq2zzMwTZUO8raBm0l9fgZEYh+s
         vM9MHMPF3hCGJTYAMyDhmS4uEhMMEq+UhM/xPlpkjre6n/sywdrxXJAOc8vgFcPgS6wI
         hH493Xa+iG+0cH6T5E1WPk9j7OXZ2GPy14cRtE/B3N8g9gxFON20PJRtawTMq3oaaul0
         BV1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765927985; x=1766532785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        b=oMGhAW5gsjwmJ4JWiE2j5CiIgk7sei12OeI6y785V2FsNah5S5qcuI/Vwv0mCgdBCn
         G9kakylT74qC4WZFusujBr55Ahe2C5TvZwH+1qjslPJSebufuZzFPzpY7L6gJKujbuMX
         eMDIri7/T52l62SvXXRkoytFWD9Ty+L+zLy4Ky7FMBpD23en0RtLX1qL8JuskBQBZnJN
         27g7X6mP9uyd964MsMluaOJVwcwpYEs2nYeKCMMNInKQyLmj/JwWot5+RMTKBroNIvuK
         WxDWpcTHfumBTzYlbPMISJsLxV3Gl5WCTo6MSI6RUhR7ZzBXbgt6ck40FRMN2TG2CCJ/
         UvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765927985; x=1766532785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l4FmBkTjseb0UhsC1W039Xu61+Vqd5hIEEUJMA40am4=;
        b=Xro95qLPcPUZ9I2j2asNo7NWcz4hz4YlaB0ZGVchPGMagpd1VN9EuO6UCEJhhDbC5c
         2RpiGT7B0r9BhzC9wuuxDatKWXxjs4GTgej/E8VxJW2Hmrsdz4FU+4ODEbgxYkDpwsVo
         pmw7sn5vRWkTJEYkp+QWXddKM3rynbpN4VMk6CMOV6ZBqjCHqncc57kFGJfNpcRKBkgC
         F9nfo3KxYNCP7inGrRR6ljrHfL4kNqbmDXN0yjawtlvBmQ7V+KKEvxZYfT3JAwTcLJ7W
         tfYqtQHcfjZpvcs6r5dOaODesGwSBgtRkMaqDtChh2DLixmMrQVC20pRrNuCNDBSZyDR
         /gvg==
X-Forwarded-Encrypted: i=1; AJvYcCXDL193RFsaBOMonS1M7U6P8CkQw1fGGkeNy94xQg/eZEfnrWZiRAJmLwT5POVlrS0DRhj0PQwux0SSUG4b@vger.kernel.org
X-Gm-Message-State: AOJu0YxgJexkwRrVFM4gayK7Vxeu6MuB/5U1zmOa58wDhKTCd/JP9K5h
	dMYP0Ok4I5iI9TW9Z95NYIDCLna8fytfRTMpRwNiYegmAgUN0rZ/s8TCtlxcJwR5dMbwVAlA/BK
	5xKhaZyrXlui4H5R7O89DvpIAnxFqFA+FOcCnGTBZ
X-Gm-Gg: AY/fxX4cHLFA95Zzh4603gJgIyHdji8aAahagGrxB3AExYia5kanrWALQgG9tLnWcHS
	qcwSd+09OrOM422IYifMF7HaHHQ2OApTOGfcTJEceiDKNwRDHq+I4HWerRI1EsiU9gFVyFZtR6I
	RSs1C5tx5hUFiwnMmgdiuvIHzk5WcWt79zpj+zg/AG87pPfGLbpdPJcY7FfjXgt9ZYbWwRCVBUG
	56vjxqsvGVnH93jK5cAO/Rv3FhFbaPwZfnCwd/gJhsW3o57OHPR18gNhw8+p0+HZ7sSBUUwtQqE
	77CHkHDwlQ3Al71feWr48Zc5jg==
X-Google-Smtp-Source: AGHT+IFR4o7x2LqopTiGNjBR35lfZHSYLuViSW1x8WU+n1hiwmwiJpcXDqVeuIb6EPvslXhd37lYRpWUlrKA8ulumoA=
X-Received: by 2002:a05:6402:3d9:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-64b400a03e0mr19745a12.6.1765927985196; Tue, 16 Dec 2025
 15:33:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
 <CAGSQo0254uMNb52aJACpuEr6O1GiUng9nNut1eecM3AFaSy_8w@mail.gmail.com>
 <ekngmao2rw4mktubhpodudnkfvx5of74uvlswr7csnyxcwlmo5@cb6jfgiyg4vc>
 <CAGSQo03+pVhjyfSLGHHcr=w1-3=C5AcEKJf-GbcEvfJ6NTid7g@mail.gmail.com> <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
In-Reply-To: <nqao3h3a45aw74bpvleqpx4iqmsjcxdjgvegyafnhvk2vtwwz4@n37vq7lsgzrr>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 16 Dec 2025 15:32:53 -0800
X-Gm-Features: AQt7F2qqAIXNpAebENyw2gsfQTrEqJPBO4KpO2y45ePkgQdpZYydiiw3_Bj-4cA
Message-ID: <CAGSQo011pq+YX=AF0TczzzTw0JL2azvVtijCDDH8HJzzxFYOPA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 3:05=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Dec 16, 2025 at 02:13:08PM -0800, Matthew Maurer wrote:
> > On Tue, Dec 16, 2025 at 1:53=E2=80=AFPM Bjorn Andersson <andersson@kern=
el.org> wrote:
> > >
> > > On Tue, Dec 16, 2025 at 12:53:28PM -0800, Matthew Maurer wrote:
> > > > On Tue, Dec 16, 2025 at 12:49=E2=80=AFPM Bjorn Andersson <andersson=
@kernel.org> wrote:
> > > > >
> > > > > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > > > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based=
 DebugFS
> > > > > > bindings.
> > > > >
> > > > > Okay, but why?
> > > > >
> > > > > https://docs.kernel.org/process/submitting-patches.html#describe-=
your-changes
> > > > >
> > > > > [..]
> > > >
> > > > I'll move more of the text from the cover letter into the commit
> > > > message, but the short version is that it's intended to be a low-ri=
sk
> > > > driver to pilot vendor drivers in Android.
> > > >
> > >
> > > The answers I'm looking for isn't in your cover letter either. I want=
 to
> > > know what benefits Rust provides in this particular case.
> > >
> >
> > Rust likely does not provide any significant benefits for the socinfo
> > driver itself, aside from having caught the slight disconnect
> > (mentioned on the other thread) where it should probably be an
> > auxiliary device because it assumes that the `qcom-smem` device will
> > remain active as long as it does.
> >
>
> Yes, this isn't unique to Rust. The smem API would benefit from an
> overhaul in general... At the time I wrote it, you couldn't really boot
> the system without SMEM, so I added the suppress_bind_attrs, these days
> you can exercise a fair amount of use cases without it.
>
> > The primary intention of converting this driver is to be a low risk
> > trial for GKI's ABI stability for vendor modules and a first Rust
> > vendor module (we have platform modules already for binder and ashmem)
> > on Android. This was discussed informally with Trilok (a long time
> > ago) to act as an example for other vendor drivers and encourage usage
> > of Rust for new drivers or those where memory safety has been a
> > problem in the past, but nothing was ever formally committed to.
>
> But if the test bed for GKI ABI stability is the goal, don't you need
> something with a more interesting interface?

We've been watching things manually for the 6.12 release and manually
backtested on the 6.6 release (by looking at our ABI dumps) and
believe that it works. The only way we can really progress further is
by deploying a vendor driver in the field. If we pick something more
interesting, there was concern around it being caught up on concerns
related to the specific driver. The hope was that this driver would
simultaneously be real enough to count as a driver in the eyes of
other vendors watching for someone to take the lead, and simple enough
to be low risk enough to be possible.

We do have more interesting drivers in process, e.g. the tyr graphics
driver, but those are longer term efforts.

>
> Also, how would this manifest itself in the upstream kernel? Do you have
> a test bed where you build GKI + vendor "kernel" out of the upstream
> kernel tree today?

In Android, kernel modules are split into two categories - "GKI
modules", which get shipped with the primary kernel to every system,
and vendor modules, which are shipped and loaded by particular
devices. Neither current builtin modules [1] nor current GKI modules
[2] contain the qcom socinfo, so it is a vendor module. This
categorization is not an "in-tree" / "out of tree" categorization, but
a "every Android device" / "some Android devices" one.

[1] https://ci.android.com/builds/submitted/14027866/kernel_aarch64/latest/=
modules.builtin
[2] https://android.googlesource.com/kernel/common/+/refs/heads/android16-6=
.12/modules.bzl
>
> > Trying to apply Rust to more significant existing modules (where it
> > would provide a greater benefit) raises concern about whether they
> > will operate identically. Socinfo in particular can be more thoroughly
> > tested for equivalency, as aside from the runtime DSP information
> > modification that was mentioned in this discussion, the output of the
> > socinfo driver is static and can just be checked. This means that a
> > socinfo driver swap will essentially have the language change be the
> > *only* significant thing about the change, keeping the risk to a
> > minimum.
> >
> > Part of the reason for the RFC prefix on this patch is to solicit your
> > feedback on whether you are open to this. If you have somewhere else
> > you'd prefer we try this, I'd be open to that as well.
> >
>
> Rust is a new dependency and it's a foreign language to the vast
> majority of the contributors in the upstream Qualcomm community.
>
> So, IMHO sufficient value needs to come with such rewrite, and this
> value needs to be properly documented in the git history. Rewriting
> things for the sake of rewriting things, or the facilitate a downstream
> experiment, is hard for me to force onto our community.

Since you brought it up, I took a brief look and found CVE-2024-58007
[3] , which would have been prevented through use of Rust, as the
access would have been bounds-checked. I understand that such
vulnerabilities in socinfo.c are likely to be uncommon, but even for a
driver this simple memory safety issues do happen, and have even
happened recently.

[3]: https://nvd.nist.gov/vuln/detail/CVE-2024-58007
>
> Regards,
> Bjorn
>
> > > > >
> > > > > > ---
> > > > > > base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> > > > > > change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> > > > > > prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> > > > > > prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> > > > > > prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> > > > > > prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> > > > > > prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> > > > > > prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> > > > > > prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> > > > > > prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> > > > > > prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f
> > > > >
> > > > > So, it doesn't work on a clean v6.19-rc1 tree?
> > > >
> > > > Correct. Those other patchsets are patchsets I'm landing which add
> > > > bindings used in this one.
> > > >
> > >
> > > Okay, please make that explicit when submitting patches, so that the
> > > maintainers know that your patch(es) can't be merged.
> >
> > I thought that was what I had done by using the combination of "RFC"
> > and putting the prerequisite change IDs from b4, but I will include a
> > statement to that effect in my cover letter in the future.
> >
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > >
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Matthew Maurer <mmaurer@google.com>
> > > > > >

