Return-Path: <linux-arm-msm+bounces-58117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFBBAB8DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 378401886635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BEE21ABDC;
	Thu, 15 May 2025 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhpq4k+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC61F3FE3;
	Thu, 15 May 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330602; cv=none; b=T5rhSMiuQcIamYxlyX4u22re+kw2jTyBDDMMF9pFhcIteDGYBjeEOTwtWUI3lygTkml123xqQ+sFuicOOgVh7olyIlIMWt8G0Dzmu5h8p0wH1fBr0U2i29a8TPS2hZrH1MxyYe3BIbSKzk82y0vE8CR/sX+F88Lo6oe1bVgSNvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330602; c=relaxed/simple;
	bh=xtrztwEb7iUTYXp2R8jlDxuNMUUZt1rKnrYArZGNvVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Phca+mQEP8rLvsWZFL9kpgmWkZy7ydWeA/604wP7X3zrd785WityUDnHUcMAl9EYLYg/ESJMxrWVGq7u0wjjwkKZ+9lHce9J2joxr1rqb1gIPjMcYwdJ/lvB6ns59DgyyTAe+iX7Gf1/mkMTGBRaLaS6hbRWRcc25pQJAaaZr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhpq4k+j; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85db3475637so81193539f.1;
        Thu, 15 May 2025 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747330600; x=1747935400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqHcNXrLgFH+FE/dQ/7Jqx//cnQWyh3PmPGZhUVuq2M=;
        b=dhpq4k+jIFlUQVZexzbxYWDgnORQUTAYoCaEN+xuD0FCqJr8BF5ai5wWmkwRFTMmGR
         pEoVk/fjcIbaNO4nQsHhwzYlFjOuNtZz0U7PvxR4xLt2cGHJAWnUnTsHBxnxhwG1xHNz
         Vog3nnvQ5vtCn9nVLx7YhQr8vPWR6ZsfG1vJZQaN3LBjizlb6xgeZrE4cpQGbSyUvLJg
         C1fypnHBYdzquXp9iym39zZDrAO5AunVRxsb3HSL44LhZ93lBXmmdhO2Go0GJkzyMpJD
         vIGFaHBX12CN7ZvgCaV5X/nQHEzCargsX0UztxfYfPhJ+c7nny/i13W08AGT0VuHJdUC
         IHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330600; x=1747935400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqHcNXrLgFH+FE/dQ/7Jqx//cnQWyh3PmPGZhUVuq2M=;
        b=vyULIbWFGBvIFSkjmr0riOOjlDznfwkclIUmaRlumkDef8dSV1vKGmh7WS++u1Pf/6
         PrO1+cNOSGzEgKMcvl2eSnODOTQEUy5lhW2+2u1lw/PVcWbOqryYnew+1stwPB4F5BCF
         Oezoo5mVTqrj0eqyHfFSwVsB++BomdN+7tVFcHHkQqLimhY65CRiChqys61MWW8H1yOs
         cpTfAwvg7pIYm4Gp7M6Gmv1yYtoleWZppQ3Hm+LA+rDv4LiEVXQrgoAi1sTgAb4O/MlS
         0UwzNie5ft0XUi1orBM+fyRhP/D1I1IIrtxXnqVcNK2UBnVh0LX39Djkvb2op+9I805K
         4pBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2fgi4gx/xP90U+U/oK3oumKtNthDNo+ROJirwa9I5d8yPMwW6yb6uGJCAv/tBAlZ7t85no+dYLX1ztiYC@vger.kernel.org, AJvYcCVGJ1TudS4cr/2vfRMrC+UODatmTYYV1SUDRtiLM/q5pEFbvgBFCmfpRdpWEAd9UF3kkwfAyoTLOi70Z5AL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6jtZ8v9SoOAxDDWZbaS/7bs3KFjYLUGJUNwEZJUJicz04w+3d
	NNt/SqkQhgwcH2Ofh6ZXIu7wM64woZOF7QyH3P5IQPoKIAa5RVDfFMuEWhKMCgPUtgB4kIz/cmu
	aYNQmnn5KhKlUZ+ovTnOOwgwhgvH+YGU=
X-Gm-Gg: ASbGncunzkmKvxJlHsF2ivWzTKVfLKnurnkUqVzKr9I3GO9nChiUdU2JkI5Hhrfp8yG
	FojdtS80wH/t/zsJhG87Gkro4MRgg4PJqmps13tp1IlxVMW+YZFshn/pYaUsNvPTCM0vE6vSeU+
	YQhBDEuQneU5pZhp/sb2+t1FrRGg2GiB2M9zEcodn/AZ/SmrUF7XALPiUaYTHgSZ+6pY+DYr4Al
	A==
X-Google-Smtp-Source: AGHT+IFE+JBnt1NPTvRR6pHLKFY0JDRYFTVuXW5ZgFpZdNHczNUdwTdzRDEMxhVRO9gP3eWJ4OQwNuIlrSKjsez6h/k=
X-Received: by 2002:a05:6e02:1c07:b0:3db:7434:a8cc with SMTP id
 e9e14a558f8ab-3db8490530amr2645855ab.8.1747330600475; Thu, 15 May 2025
 10:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com> <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com> <aCYi_mkv47ckB6ox@pollux>
In-Reply-To: <aCYi_mkv47ckB6ox@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:36:27 -0700
X-Gm-Features: AX0GCFtCmghLHobPptzNOWUCvf5wIEoct66-fDcHcf80I6aFdxoL6tqmJhNttBg
Message-ID: <CAF6AEGt8LXUwCiin5Z0Tab-9U66N22aZBVXM5aLFw8pjMXRgNQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:23=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu, May 15, 2025 at 09:15:08AM -0700, Rob Clark wrote:
> > Basically it is a way to throttle userspace to prevent it from OoM'ing
> > itself.  (I suppose userspace could throttle itself, but it doesn't
> > really know how much pre-allocation will need to be done for pgtable
> > updates.)
>
> I assume you mean prevent a single process from OOM'ing itself by queuing=
 up
> VM_BIND requests much faster than they can be completed and hence
> pre-allocations for page tables get out of control?

Yes

