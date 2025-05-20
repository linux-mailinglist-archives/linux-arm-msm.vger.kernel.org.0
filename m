Return-Path: <linux-arm-msm+bounces-58755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA83ABE17D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 19:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88DAB1BA75B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FB22741B2;
	Tue, 20 May 2025 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVHRK1Nt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B524288D6;
	Tue, 20 May 2025 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760762; cv=none; b=egMaAMNE5wpiPBUBRNZNrT1QHciIku9bNhFGAcIKcHLtioBz6wi1TJyGYI/YnVCNxVVv5PslgbdHchwstLPwiq7zDSa73gJ/Lc90rxbXLp9dn/543QWO3kmi71m1VOS0zBZ3E2GPJG3a4MSJA2a9hMge1CLb1/r01a0C8BBLg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760762; c=relaxed/simple;
	bh=LYXk7Zx9Sol1gLspwEygZpRd3hvjMbgUe1MHTTcA9XI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GCr1j3aC9rJosCY/SaTRCzPVHkoB22v/PAFIJDQpbz/2vIgmvgDIXrz6eZhC7ulp8LTb0ZOokzq2hYYqsaZ3DNT3IRDoEd6MP3Zesrctn3HK+lSh+WjMZYi1K8JSItiNs/fxsmfSiGGl/slIiazH0AOvGooneliNynq3aLUo9HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVHRK1Nt; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30e7ee5fe74so920161a91.3;
        Tue, 20 May 2025 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747760760; x=1748365560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSxEkDXbJDIhMR3kFQKAYgsi/4CQTU4cPfem70BSEkY=;
        b=CVHRK1Nt8e3YDHWHC8AhqeWrf7kXSK4/oJBPiPFu3OJzbgDU5yqXpeiqaoBTIcWSXH
         d7XYMSKzPd2PmZlvc/gQCQziDPVGo6U7gm6glpYI6UrBwCqOUV2y0P4sVVUgknVVpCPt
         PxpRS9X9yH/ig78yiRB4Laol+2fv0/m7zyQRNWA+XpJn8txUZV6s/KjSqc2ROqCQPRXF
         JnCfeVsMDkTNJNiDF395fq/ZXH/iyQlC/vKGNiYTn90TYaQ6yRdZqzjDblcDP5F4DyIc
         zv43U4NiLhLyd7NwvsD4nAyt5dh/YTkmykS8bWYVZgD8qBkRCWk3VX4ixcd/M8cFKift
         DHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760760; x=1748365560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSxEkDXbJDIhMR3kFQKAYgsi/4CQTU4cPfem70BSEkY=;
        b=j+7rWUQkXufMzLyqwp/YJu7U1KFRfe9GzviA1LNSPkWgG4LzQKIy9S2R4jQJyuIVp5
         Sonjkfzg3NJ9QWfVfQTuilLmdOjrpPXGzdrJtRri6IGb+MfO9dnq2OedXhxBzHg63jCu
         tH6wCvPK6aw32GMMxjtvEKomQO/Ngx4n4j44uQep1I5M/C//Q4C87rKFHRlOZjALaefs
         Op01zZmw2B3xPqFo7cDO52eIkiV4n67w19oWL5yQn4q7F9TH56FS79w7W9MuhG5Un3AK
         HEa3HC11HHHeXYH3wgkSaQXokhAvMu8YE2BfTGgxn3+5Iobkc2MpqXncmkzG152fe4Kt
         7dCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZIXwgDlcbuaefUDToVpFHWliwTtthxfrTfC2qR9V0FTcYwrP5fzWD1LTRTzopdkELFtOYTX+EpW3nXaue@vger.kernel.org, AJvYcCXpZMzRsFbE0mc1TAcvlmdCnRHmBZiTD2UV7yj+SA1GEa4YJmPPIZi3XGb5CqUxpxI+tiBsiQgbQCuRxMyT@vger.kernel.org
X-Gm-Message-State: AOJu0YxH8JTUCkuoZljYVROozhekDI3e8aHL98csKFbSOS7WUWLaBIKF
	Ga/y+SRq+RRZY0JfNEzZSnRkp25zCujYoaVs2vQPawpKtClRMF+kufZdLfuHcaoP8ez8/gSPjj5
	xq3C1MFveS4mdkVAta8AaDZoYE7dXwCc=
X-Gm-Gg: ASbGncsd5Z/+YVhuDmSXrwRNDlB4jZvYNJSIiaWUVAHVFUAo2BPtafe2uqaD1RxIpVC
	SW+kw6YCEtqcI9BN+nuQWk27M5ymwbbsIQQHVoJby7HeuG9NA1Hv6mtgslTYLcUx45CsJrtpiQc
	pwNd2CaPKPwuQW4ZFt6tWglQINzPMeMgfs4dE2iPopgo0=
X-Google-Smtp-Source: AGHT+IHsOqBineUHxLJx9akQIdSVlbC4CtdZpwW/0uzDJXEMDO7/CjK53KJcvCLjE7LdutD2WX0uucRok2QjsWFIgmI=
X-Received: by 2002:a17:90b:4ac1:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-30e7d2fd72emr10302244a91.0.1747760760170; Tue, 20 May 2025
 10:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-5-robdclark@gmail.com> <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux> <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux> <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux> <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
In-Reply-To: <aCyzyAPbQ1SYbo4q@pollux>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:05:49 -0400
X-Gm-Features: AX0GCFudq4Uk9hVggM5__uGXxd07kkOoRDiLKGh7USy4Eu6RGR5O4yyQhzMT2o8
Message-ID: <CACu1E7GEqm+5pmz8rOeCp0FP-7Q3UrEqkkvG3ZbbkPJzjqRhyw@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

n Tue, May 20, 2025 at 12:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > On Tue, May 20, 2025 at 12:06=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > >
> > > On Thu, May 15, 2025 at 12:56:38PM -0700, Rob Clark wrote:
> > > > On Thu, May 15, 2025 at 11:56=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > > > > > On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > >
> > > > > > > (Cc: Boris)
> > > > > > >
> > > > > > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote=
:
> > > > > > > > For some context, other drivers have the concept of a "sync=
hronous"
> > > > > > > > VM_BIND ioctl which completes immediately, and drivers impl=
ement it by
> > > > > > > > waiting for the whole thing to finish before returning.
> > > > > > >
> > > > > > > Nouveau implements sync by issuing a normal async VM_BIND and=
 subsequently
> > > > > > > waits for the out-fence synchronously.
> > > > > >
> > > > > > As Connor mentioned, we'd prefer it to be async rather than blo=
cking,
> > > > > > in normal cases, otherwise with drm native context for using na=
tive
> > > > > > UMD in guest VM, you'd be blocking the single host/VMM virglren=
der
> > > > > > thread.
> > > > > >
> > > > > > The key is we want to keep it async in the normal cases, and no=
t have
> > > > > > weird edge case CTS tests blow up from being _too_ async ;-)
> > > > >
> > > > > I really wonder why they don't blow up in Nouveau, which also sup=
port full
> > > > > asynchronous VM_BIND. Mind sharing which tests blow up? :)
> > > >
> > > > Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.=
buffer_size_2_24,
> > >
> > > The test above is part of the smoke testing I do for nouveau, but I h=
aven't seen
> > > such issues yet for nouveau.
> >
> > nouveau is probably not using async binds for everything?  Or maybe
> > I'm just pointing to the wrong test.
>
> Let me double check later on.
>
> > > > but I might be mixing that up, I'd have to back out this patch and =
see
> > > > where things blow up, which would take many hours.
> > >
> > > Well, you said that you never had this issue with "real" workloads, b=
ut only
> > > with VK CTS, so I really think we should know what we are trying to f=
ix here.
> > >
> > > We can't just add new generic infrastructure without reasonable and *=
well
> > > understood* justification.
> >
> > What is not well understood about this?  We need to pre-allocate
> > memory that we likely don't need for pagetables.
> >
> > In the worst case, a large # of async PAGE_SIZE binds, you end up
> > needing to pre-allocate 3 pgtable pages (4 lvl pgtable) per one page
> > of mapping.  Queue up enough of those and you can explode your memory
> > usage.
>
> Well, the general principle how this can OOM is well understood, sure. Wh=
at's
> not well understood is how we run in this case. I think we should also
> understand what test causes the issue and why other drivers are not affec=
ted
> (yet).

Once again, it's well understood why other drivers aren't affected.
They have both synchronous and asynchronous VM_BINDs in the uabi, and
the userspace driver uses synchronous VM_BIND for everything except
sparse mappings. For freedreno we tried to change that because async
works better for native context, which exposed the pre-existing issue
with async VM_BINDs causing the whole system to hang when we run out
of memory since more mappings started being async.

I think it would be possible in theory for other drivers to forward
synchronous VM_BINDs asynchronously to the host as long as the host
kernel executes them synchronously, so maybe other drivers won't have
a problem with native context support. But it will still be possible
to make them fall over if you poke them the right way.

Connor

>
> > > > There definitely was one where I was seeing >5k VM_BIND jobs pile u=
p,
> > > > so absolutely throttling like this is needed.
> > >
> > > I still don't understand why the kernel must throttle this? If usersp=
ace uses
> > > async VM_BIND, it obviously can't spam the kernel infinitely without =
running
> > > into an OOM case.
> >
> > It is a valid question about whether the kernel or userspace should be
> > the one to do the throttling.
> >
> > I went for doing it in the kernel because the kernel has better
> > knowledge of how much it needs to pre-allocate.
> >
> > (There is also the side point, that this pre-allocated memory is not
> > charged to the calling process from a PoV of memory accounting.  So
> > with that in mind it seems like a good idea for the kernel to throttle
> > memory usage.)
>
> That's a very valid point, maybe we should investigate in the direction o=
f
> addressing this, rather than trying to work around it in the scheduler, w=
here we
> can only set an arbitrary credit limit.
>
> > > But let's assume we agree that we want to avoid that userspace can ev=
er OOM itself
> > > through async VM_BIND, then the proposed solution seems wrong:
> > >
> > > Do we really want the driver developer to set an arbitrary boundary o=
f a number
> > > of jobs that can be submitted before *async* VM_BIND blocks and becom=
es
> > > semi-sync?
> > >
> > > How do we choose this number of jobs? A very small number to be safe,=
 which
> > > scales badly on powerful machines? A large number that scales well on=
 powerful
> > > machines, but OOMs on weaker ones?
> >
> > The way I am using it in msm, the credit amount and limit are in units
> > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > 1024 pages, once there are jobs queued up exceeding that limit, they
> > start blocking.
> >
> > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in fli=
ght.
>
> That doesn't make a difference for my question. How do you know 1024 page=
s is a
> good value? How do we scale for different machines with different capabil=
ities?
>
> If you have a powerful machine with lots of memory, we might throttle use=
rspace
> for no reason, no?
>
> If the machine has very limited resources, it might already be too much?

