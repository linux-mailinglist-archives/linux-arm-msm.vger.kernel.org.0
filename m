Return-Path: <linux-arm-msm+bounces-58233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216FABA0B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 18:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F9BAA24A98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 16:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CAC17A30B;
	Fri, 16 May 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6R/jeLJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248E61FAA;
	Fri, 16 May 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412442; cv=none; b=E/BT+7FhYFBcw/LEc8JzcBirSgMI0E5vJfKezBpSkXRtbf+SNFuDyteG6aE1anPCobRs6qjLhUmWvLA9eaGXgDAMvgnfevjZlWxlI1W2drZbB8UKP4Jnk92aYjajzxBhEcOUQ/ng5t1ZT9pu0fC2aw5RMfhVlTAIn8vgyjduWqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412442; c=relaxed/simple;
	bh=TPlAi/mO14+GwPJa9+PtFUo/NVtQvh5EJl0KI78bFL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxVZy9iFQPTDPrjPtFUutiJYhQe6owyP4LuU0taYSChYbqVmC5pBOVXOXtRYauDE2jH5w/OnLJR5CI5fYP6xP2d3K8qMnE9MP4OpdTwbBrNO/qqA1PZCHiF9bJ3rtmR4AwNLrIVJd4FMqtE4Byu8JBMEjfqsSGGiHWaYnRFXIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6R/jeLJ; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85d9a87660fso217539539f.1;
        Fri, 16 May 2025 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747412440; x=1748017240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mT/Vsqhlq5iMS/QXBvcl16DqfLTsg9iUCxC/+p3/IyE=;
        b=A6R/jeLJF+tqkZuwmk5+9Hz/UnKJuEpfgqOnmmTz/GDAQhhvtRjV8Oap6VGaU3qEOc
         zwMMe3W9LzD8CU7PmWaKrIwvUIJwgb5Ly7BjWMk9QF/5KgD3UW1HjiCNiYiScv4Ncc73
         ixcz0d211EgYM7RP/pZxcou0Zq4TK+RBizMZoiB59g+TJuiEQgVAIdqbfCELTMRtE9dg
         MUWi70jgomtRu8JqqNIiPEc1THO63/nLD+/fM+RAcaMEteT50eMH2nRdNoLTbzstm9PG
         H1V1LonpvfBJCMpAU2ly50L6/Bo9ed8JG18NPMNDISyRkJVAlOos/Q1TFCbtYHazojFV
         EKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747412440; x=1748017240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT/Vsqhlq5iMS/QXBvcl16DqfLTsg9iUCxC/+p3/IyE=;
        b=bQy4TD4yM7UN0qk5Pvr6gphmvIRVE5Sh04KBb9ielvHf0ddrrUkdeQ5Mnbrmm2B6NL
         koLe/Zk2fnjHhmAOYDSNXz/VvgK0ER2FxldnSxfqNWsea+d6tFw6y/ILlfZFRvO8pe5A
         8EMVps6K3/T896u3PT01Nd+/c3x+oGDCpyExzGQUvakZza2dYtsuA+yKUZuJexBAXYtr
         ekMYgTR4kaULwx7nvkM8YEzIxQgcloT7Qyr4ghDWFFrQr3Ue/TyfgkOpTiyJXS/C7iyr
         Kfj5QW9DnjU6jOGBx/fBz2bDTIuyMDA6ohaKW6oHiJmOjFZ3pMoWoDHL7qKU3rZcMKRx
         XVrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUxr944Kw7u5QPkLRyCXmUV7hr3o2cuez4FQ0uJ3ICPyhKNvD502lRaI6axO9sRRiMGJk4v/w3z9UFNJeg@vger.kernel.org, AJvYcCWj1uvMY8OMZD9d1MkgZHoPFZBads1QGFpTmONprPkkVTf27mg+fGYGBYxlNNc68qSnfgW9qWWVUMBWlZJb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hpYHd5AXHvWRSKPsEPcYeF57XDlbxzKUqEd9zZbirqU3q51y
	VcvtLU++PSQ5ffkiWB4X9vV+C0lJ9YJ3fl6KlIqIeS+48kKccsa6pPjhZd6Wx57Ooqqd7PwE4nC
	2cqZY2Xbo+BgPLhvKBJdv15UOMMmFr9Vr9A==
X-Gm-Gg: ASbGncsKNAro4AfeCl6MSc7hKTbyScvMxnErMy5BqPt+s1l4BnfqnrimtSiEmqp2EVy
	ZJwf5L1nvYdfleww15/sqftHOG8wki+ho+lBNng3A6muEVpBfqZS3VfjkdRVCeF25kKfNAXdi63
	G54jCSJoL0Mz1Tl7kVOE17VUvnbofJaUL5KUYe8jl/pwluFdivhDIaNgQpbiBZlg==
X-Google-Smtp-Source: AGHT+IHC22IsC+3PhSpVeBM4f8XtPUyPUQIGsJ0NXAFw0bJzSA+bcpEP1Wgy59i2TILp96QoX7r/vuNK+QzWWSMkZuM=
X-Received: by 2002:a05:6e02:339f:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3db857282d6mr32363085ab.5.1747412440172; Fri, 16 May 2025
 09:20:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514175527.42488-1-robdclark@gmail.com> <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux> <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux> <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
 <aCb-72KH-NrzvGXy@pollux>
In-Reply-To: <aCb-72KH-NrzvGXy@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 16 May 2025 09:20:27 -0700
X-Gm-Features: AX0GCFuCbsPiWqD4XrqPgC4swP3tk-lMdO3-9EFfEFghtloLESQfLQoMv-hd73E
Message-ID: <CAF6AEGu=KzCnkxuUsYvCHBGwo-e2W16u_cRT1NFAXLphty1_ig@mail.gmail.com>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor path
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> > On Thu, May 15, 2025 at 10:55=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
> > > Anyways, I don't agree with that. Even if you can tweak your driver t=
o not run
> > > into trouble with this, we can't introduce a mode that violates GOUVM=
's internal
> > > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> > >
> > > I still don't see a real technical reason why msm can't be reworked t=
o follow
> > > those lifetime rules.
> >
> > The basic issue is that (a) it would be really awkward to have two
> > side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> > we have the opposite direction of reference holding.  (But at the same
> > time, don't need/use most of the features of gpuvm.)
>
> Ok, let's try to move this forward; I see three options (in order of desc=
ending
> preference):
>
>   1) Rework the legacy code to properly work with GPUVM.
>   2) Don't use GPUVM for the legacy mode.
>   .
>   .
>   .
>   3) Get an ACK from Dave / Sima to implement those workarounds for MSM i=
n
>      GPUVM.
>
> If you go for 3), the code introduced by those two patches should be guar=
ded
> with a flag that makes it very clear that this is a workaround specifical=
ly
> for MSM legacy mode and does not give any guarantees in terms of correctn=
ess
> regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.

I'm not even sure how #2 would work, other than just copy/pasta all of
drm_gpuvm into msm, which doesn't really seem great.

As for #1, even if I could get it to work, it would still be a lot
more mmu map/unmap (like on every pageflip, vs the current state that
the vma is kept around until the object is freed).  For the
non-VM_BIND world, there are advantages to the BO holding the ref to
the VMA, rather than the other way around.  Even at just a modest
single layer 1080p the map takes ~.2ms and unmap ~.3ms (plus the unmap
costs a tlbinv).  So from that standpoint, #3 is the superior option.

BR,
-R

