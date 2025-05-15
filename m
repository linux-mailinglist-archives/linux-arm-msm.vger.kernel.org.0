Return-Path: <linux-arm-msm+bounces-58118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF8AB8DFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 19:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 529387B581E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DB022580D0;
	Thu, 15 May 2025 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEJ2ndro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9979218858;
	Thu, 15 May 2025 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330830; cv=none; b=BDRnfA6Isu4Z1xroQBTXGuqlOZY6N/tcTLfZCkcD09vRdDj+XN98y4mCGYELkOZFoHRW9JXSAbRm9nlZialAdoflZRyyjaYSj6rS5Zm0FFKSrYyjd5UdBl6FaaVCOs1fVScPta32OeX2C+/lSlMPobfoVc8Xx3/Z/D3VgNi5uak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330830; c=relaxed/simple;
	bh=0IzJdOxR81ygQCmsqANdLatnRP0Wcuz+EfKUEkhkJEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1otjG/l9HSYM/dahDBKbBgxrAXMsgakUioZixh4itaVsfuVdGe3vrB8LwYTR74P9XKc1x5+dVMjVzFqa+IpOdRlZhmDYfW2dv1cLQ+lyNE3QU8XGwniY41v83UMpJ/rur73NBN+nqr4Um4Vay/dMgVteFjOVIGB724m9GzD1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEJ2ndro; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3da73e9cf17so8945435ab.2;
        Thu, 15 May 2025 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747330828; x=1747935628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gv+jyqF5iQ9QDCMmj+4HNiLTyap9tDvvCFpoRNaACI=;
        b=IEJ2ndros5wAvfxAQmVcITjhyjVxyHMT9y6bVlUIqax36s/hwgJE6tZ6Bnuy2MKzIf
         oxIpmjpcIJG8qGQv8OFNAFnbCiy1olDcFfCM+5cCQ0jd3m1Q8dBfn23jgbtHLjgKqLXP
         IrmJqSwPmkAYvNiosEKFrWDltcQj4IjQf8v37pHk5V/7DN+RUwXsQZPjPV+axV+hHeXn
         wp2SiGyn1nG5rYBroH0x84q65Owordgt88vzAHRACZhjTRYKoOJdR6WzyC+MiCBr5m0R
         yZbTqnDVwDL+sIXh5r1O0M5U4qOrT077/C9cQ5P26mAiB49jSoUZdgbrCZ81IcQtFRlc
         7AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330828; x=1747935628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gv+jyqF5iQ9QDCMmj+4HNiLTyap9tDvvCFpoRNaACI=;
        b=EIfF4eF08sw6T1rtdvQmOlT/oLTx5E60UpEqsAbNqacoPjnSGgltuV2QgdtPm1mF9y
         fVdd6QkK29LfNsYVMBIvQniHGCstCpw9oGg5EGfu9wsZhGwZWNrJnuaB01LjlYrzVNxL
         dFxODCbW6nvg3cgVoKf5HmbggQADNfXTe10mwFDJ63Rn0/IbqDmoi5rk6lpYFl3ZMzbS
         8qC8iXfgSis/WMl7xWqQFNz7ua4KXjBnk/CrQ9mri/6rszV64DwIgocmrO9d/j7e++yO
         b0MHckXrxcwccTs15Pct7Mjox4H/8iZnfq6Fud+kkdYBkrkUNxmyKhHKU9LUMN4DVpze
         XFxg==
X-Forwarded-Encrypted: i=1; AJvYcCUyd2jmLa6yHmOjTwUbQdWkuP5S6yO2ZL+blPOr3ZgMiq3lkXL1oLgy5IA2r+8qcw93rRRl/VUHwABd8cPE@vger.kernel.org, AJvYcCVisMzaFlOQq72J3aQIzkin4YqErpIVxZaAF2qdEWXA9MEqKXIZL6/Eb08gcb0XNNhZ2w4MR79HtD/U7VKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9k32Fulhldq81WbzQxX56vVjkKl5MpBMOGVdIclZ0EVvcTM5o
	glADaAHQnMVgNrp21L/ALCmh09BIsLRlFDnqWeqdYozHixqAGYvG9tyVXGYt2PU+Q/2fYCDrh/D
	3Ze7JWNKE/YKda36WeAaOJUOQIzppgVk=
X-Gm-Gg: ASbGncu55MHQNSXY04MlmScBAoIS4YIFFC05y1RXNwojSkmcMw2F1H2PLOfZnSjsrbv
	APwy61U4rpUaxKIcC+H4pwtAMs5ubxT8cxaEiPbzKSE7gKBAXOzcnB7+xM0RdD0pCTdoLyvZT7o
	D5LrZ67bPspvhvDg95FXl3fGZPZ2S7Pg6kW0hu/3LurDd8kNd4vxCX7cwvGcEyrb0=
X-Google-Smtp-Source: AGHT+IEJipXdl2VdU/Oec1bGlBvZGZ7tO6kaKvHUZEoNz8drXkpWOZVfZlKq5HOiApXq2RnjQWE/s2cZ189LZWiNKr4=
X-Received: by 2002:a05:6e02:1a6c:b0:3d9:398f:b836 with SMTP id
 e9e14a558f8ab-3db84321988mr8926665ab.17.1747330827801; Thu, 15 May 2025
 10:40:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514170118.40555-1-robdclark@gmail.com> <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com> <aCYkk4Y7feltfp79@pollux>
In-Reply-To: <aCYkk4Y7feltfp79@pollux>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 15 May 2025 10:40:15 -0700
X-Gm-Features: AX0GCFtd_SrDNpGNgyp8XAQPhmBBmDgvcdrcdNZ8xnRlH3UestZq2hfK_c4xVuQ
Message-ID: <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
To: Danilo Krummrich <dakr@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, phasta@kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> (Cc: Boris)
>
> On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > For some context, other drivers have the concept of a "synchronous"
> > VM_BIND ioctl which completes immediately, and drivers implement it by
> > waiting for the whole thing to finish before returning.
>
> Nouveau implements sync by issuing a normal async VM_BIND and subsequentl=
y
> waits for the out-fence synchronously.

As Connor mentioned, we'd prefer it to be async rather than blocking,
in normal cases, otherwise with drm native context for using native
UMD in guest VM, you'd be blocking the single host/VMM virglrender
thread.

The key is we want to keep it async in the normal cases, and not have
weird edge case CTS tests blow up from being _too_ async ;-)

> > But this
> > doesn't work for native context, where everything has to be
> > asynchronous, so we're trying a new approach where we instead submit
> > an asynchronous bind for "normal" (non-sparse/driver internal)
> > allocations and only attach its out-fence to the in-fence of
> > subsequent submits to other queues.
>
> This is what nouveau does and I think other drivers like Xe and panthor d=
o this
> as well.

No one has added native context support for these drivers yet

> > Once you do this then you need a
> > limit like this to prevent memory usage from pending page table
> > updates from getting out of control. Other drivers haven't needed this
> > yet, but they will when they get native context support.
>
> What are the cases where you did run into this, i.e. which application in
> userspace hit this? Was it the CTS, some game, something else?

CTS tests that do weird things with massive # of small bind/unbind.  I
wouldn't expect to hit the blocking case in the real world.

BR,
-R

