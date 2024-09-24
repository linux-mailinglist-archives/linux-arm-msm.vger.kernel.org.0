Return-Path: <linux-arm-msm+bounces-32322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08709849A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796BD282CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FD413B280;
	Tue, 24 Sep 2024 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li9BdTzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595E31AB6F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727195427; cv=none; b=RZdOOpRki2LdTUiT5Vl6gbHxCLSwjxybMovquq/MNSFDllBR8VQVQ9Ra76D1uDVhtfWYUM4jMd3/6e+xLOM5fBe8UHBqHvhI8BqnzobDGnQpKJWu++8adID7WiqQX7h6IBmMZxWkGAy4UblymH2G8xaztENiZuf0qOGKGdSh2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727195427; c=relaxed/simple;
	bh=c2dc2HZkb/Nfxo6vo/v1dohk0xe4w2LfViF8r1lBNXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uicp947lFGEunrwfje7msJhsXIqPUOFyZPHHf/yftzv9V6GrOYXbbddo/QK7H7vfwbA+7zGQVOQSrgzzlAk55L41GNP/62Ci0lHNElpOxtt+cMSb+/YftHxNIuZGNCvFD/x5A3usYcN/6Gvk88f+ZD9ufsN8lznY5bn/GVMJdEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li9BdTzA; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a0cce338fcso13949235ab.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 09:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195424; x=1727800224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGUzrIBUmNu/9j8a4EdryX5VoDDZ37PpwgoRv6S0kOI=;
        b=Li9BdTzAtkaCkZ7wf6hLX8wK38O7xnUSx9oYk3ZvnOMSNtxJu+C2bqiKAPnWUuWDUt
         zcA/8dguivnGAC88/f+aUBKfFhv/gSxcx7v/4Yl2qcgECExhCl0kueDPBsmZ510GZjxG
         3A1NuqUt9rcPgrOUA55yb1iDmEXgfHGpg4h304dPF9cy0DyDV3FNNlRcMWjuNP3OSk41
         Z8J55ijGAGegfWd1nMAy+h6fKqrUCV+5EeYhtngvBcje7kYT6e5rlTU1M09H1+3aAQEb
         15WwMhndqYigcLJxxADmdBsckw9BN+eKWTgDSPxAtMr1blcEPL/fULh1aknlMWS88ryN
         E7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195424; x=1727800224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGUzrIBUmNu/9j8a4EdryX5VoDDZ37PpwgoRv6S0kOI=;
        b=M0mDYc/mOY3y6oLk3KQkE5bzKLGI07xafOMCh+1/AWDSO8xgIDSNdpJObNXBidgNN2
         mQveb9aDk+6Cn+VlLcyf8ay3e9+dRVZEg+Fq5TI41UEvw+lsrsJqkyHLD2pgIj02Qpm+
         aLTckwylmuEjE0cMdI5lxxck9wDlLGj1HgrskHm6dYs5ZNHmH/ur8Q4bRpZN37nHvR+m
         gKChRWDO6aky/BYe9SLCXpizVA06FUbLsx+atN4evx1JxNhUjcP8wkEssRK24ccnh4tg
         EOAzIUqG6oKNrMQpEXGN31lieaqrRtfO8ZRAlrIIySnEpvqpcqhKuYD85fFtaxEnmFMc
         zj9A==
X-Forwarded-Encrypted: i=1; AJvYcCWRPp5I5+L4dqXy2dkvOXSNSe6d5LwB5HVNU4BgM/sL3S3xnzIssOn/hCA/C0VIgaEJTYCkchrHlcgOaTSH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dvBtN5ceItncZVmaRt5k4wO6cqikXxcXRNDvmuJYbiQLhxak
	gihmeoFYZr/e/sqFFVLiPxxBMkEiqR2c5mguzw2S7FYpVpBawRJDWoBKRdPKUhmx0RlL0ydWDRe
	4GxgXHIyHxBIgWBia88OaXa9auwIAtw==
X-Google-Smtp-Source: AGHT+IFj4J8ohRju9BG5lspr6b49Izee09g7jHq8oSMjOWjCIc7obAigdA4fSienQdnUrfe1wyQZcMQqKNpk2Ubt1LA=
X-Received: by 2002:a05:6e02:1c0e:b0:3a0:9fc6:5437 with SMTP id
 e9e14a558f8ab-3a26d7b1d68mr671595ab.18.1727195423880; Tue, 24 Sep 2024
 09:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921204237.8006-1-john.schulz1@protonmail.com> <ZvLEgIKbmTpqFLk+@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZvLEgIKbmTpqFLk+@hu-bjorande-lv.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:30:11 -0700
Message-ID: <CAF6AEGuTTccwGaB3YsWMEA4ZyGZhr2Xi-939askqvd==QhPE0w@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to
 family check.
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: John Schulz <john.schulz1@protonmail.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 6:54=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Sat, Sep 21, 2024 at 08:42:54PM +0000, John Schulz wrote:
> > Switches the is_x185 check to is_x1xx_family to accommodate more device=
s.
> > Note that I got the X1-45 GPU ID from Windows which may not be correct.
> >
>
> I assume from your patch that you have a X1-45 that you want to support
> and you think there will be more of these and therefor you think it's
> better to move to some form of family check.
>
> It would be preferred if you clearly state the problem you're trying to
> solve, to avoid current and future reviewers of the code from having to
> assume/deduce the reasoning behind a patch.
>
> E.g. why do you prefer adding is_family() instead of just adding
> is_x145()?

Note, I'll hold off on merging something like this until we actually
have x1-45 support.  I'd _guess_ x1-45 is probably pretty similar to
x1-85, but it is premature to speculate until someone shows up with
x1-45 patches.

BR,
-R

> Please also read:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#de=
scribe-your-changes
>
> Regards,
> Bjorn
>
> > Signed-off-by: John Schulz <john.schulz1@protonmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++++++---
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 06cab2c6fd66..f04aeacae3c2 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright (c) 2017-2019 The Linux Foundation. All rights reserved. =
*/
> >
> >
> > +#include "adreno_gpu.h"
> >  #include "msm_gem.h"
> >  #include "msm_mmu.h"
> >  #include "msm_gpu_trace.h"
> > @@ -1026,7 +1027,7 @@ static int hw_init(struct msm_gpu *gpu)
> >       gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
> >
> >       /* Set weights for bicubic filtering */
> > -     if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gp=
u)) {
> > +     if (adreno_is_a650_family(adreno_gpu) || adreno_is_x1xx_family(ad=
reno_gpu)) {
> >               gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
> >               gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> >                       0x3fe05ff4);
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 58d7e7915c57..ec36fc915433 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -526,9 +526,15 @@ static inline int adreno_is_a750(struct adreno_gpu=
 *gpu)
> >       return gpu->info->chip_ids[0] =3D=3D 0x43051401;
> >  }
> >
> > -static inline int adreno_is_x185(struct adreno_gpu *gpu)
> > -{
> > -     return gpu->info->chip_ids[0] =3D=3D 0x43050c01;
> > +static inline int adreno_is_x1xx_family(struct adreno_gpu *gpu)
> > +{
> > +     switch (gpu->info->chip_ids[0]) {
> > +     case 0x1fc31043; // X1-45
> > +     case 0x43050c01; // X1-85
> > +             return 1;
> > +     default:
> > +             return 0;
> > +     }
> >  }
> >
> >  static inline int adreno_is_a740_family(struct adreno_gpu *gpu)
> > --
> > 2.46.1
> >
> >
>

