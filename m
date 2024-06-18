Return-Path: <linux-arm-msm+bounces-23116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896790D952
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 18:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AFFA285DB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C746B4D8BD;
	Tue, 18 Jun 2024 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0pnjbRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E017547;
	Tue, 18 Jun 2024 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718728444; cv=none; b=Yt2jMS3aecsSK9Nsoi1Dk02S6llgz8Bvf3Ita8wyvBNlpPDVV+i65xJQHvJZo0EK9WrMmk31zK2Tsp9vhhrJJ8D2cSsCLSvjYnbUfbWEGuw3N4OHGjSi+MnG4amB7PFwTAqdr5jcjkw3tBg/tNfqHAPI2YVYbEehPX0Oqv7L1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718728444; c=relaxed/simple;
	bh=vtqL5uLiXNZmhoRIDb32QUjO537rn0Pygvb/lubLcaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnkwegmMQAwyJObedYqbUnJfAlSNmNAr/7zdWJnAEEGltWFEPqk+A7IAPA2vQlUDvbncLVB2qZMPb8erQKBFnlc38/59yg6Sb14PGJcQ4vPLwbaaTB/9GVFQ29zVmFMWrDRSaoBK2YeYYafmFwzGFry5b3QsYxL2y2hdrRdr3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0pnjbRq; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a4d7ba501so7039680a12.2;
        Tue, 18 Jun 2024 09:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718728441; x=1719333241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpLrStmTGpoo6K4G77AeZx73ca3AbUqkqK/2aKkW3c4=;
        b=M0pnjbRqwLs8Q34Owry2GNmozQCtnOLX7VXVdX8l1bG7l7DHWmmhmI/4yZxreDkALU
         YvT8hoyq1vxp1tXTlQCkTaZprnQnc9EB7e3Q+VnOLYuAqyrEQoRiHED7niD48NeqyMXH
         KFRCWbZ907tsvIjnO6Yc2S9TENJq4th8jPEe2X/kvqcyEVlCQNWkE8dpLtfaKBJgPbgR
         55HZvSYBYP5VSrWDTjvcBOUtstj8B6oCRNDNPgqrHqXYUbx9Kq7hbXVWzfC4Q+26ybKI
         4tI+Vt5Qv1+6K226h7u07Op0hkSiStXM1w74kDWS5utfG36M+oYpZbQLoLX8GWqNH1XS
         rogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718728441; x=1719333241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpLrStmTGpoo6K4G77AeZx73ca3AbUqkqK/2aKkW3c4=;
        b=MucbcFFe26UEa55Jy073Fyw1Z9SiHrQVKQ+Gb9MQqFp+3RqGGzd4k6W8aTWIPZe0wG
         CxW+uHN18JNc2paWqvpLHFOstJAiRG9uAeUMH1ahMQKPO7W2gnuZXmsJY4EBBzMOYXrR
         jo2rZQlDNYRAkzLq7ohEkTK83NnBz1olrMxA1C5UqKKl2uAFYi8xKXTP0kbpbBTpNX7F
         DXzSwqm1dp0x265+QROLvpDP1teyO95ULi7GJXkEfBtVwRytHNfIHmhvLPyEZFOYcZcF
         pEyZrm+PmdxhAUDxT7PnuK6LDtzq2PzblftSCIcmJBfeqXtWHNql4c07QjSsnmTYyXaA
         8nJA==
X-Forwarded-Encrypted: i=1; AJvYcCWSCOnMlGjpkj6Nt8mHrHNpeX3MSNTP5ul15VxbwpGmZjP1qvqmeK3t2c9qNjaG/9YZgmsOsdr3UVGPn9/bp0uqhPR56dLJajPpcwO80dgKpgWqC7a5NPYcOtnHdNbbstf4KBqn2Ub2VrQWcQ==
X-Gm-Message-State: AOJu0YxTtCOlEYn0aWj0JHJHlqF+06nnerTQNPXaQ89IHe2S789v2an8
	rRbBS8nOMygTfBqeaiJOYKKiTQUVB6FrXJGCd0JBl8GHw+xFLqR/hNVQBRWoJXKbaIwm4TdxnAL
	YUH5gH8b1eWzd92rXrnoobhIOgOo=
X-Google-Smtp-Source: AGHT+IEshCt8XHunjxXajUUYc8cEJkBcPVr+pyxgi7wON07IhIVY9iZh4sfGDDKi0k0CzdMNcVHTnLUtpJ21Rwioa18=
X-Received: by 2002:a50:930e:0:b0:57a:858d:20ca with SMTP id
 4fb4d7f45d1cf-57d07eabfc1mr9899a12.28.1718728441008; Tue, 18 Jun 2024
 09:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617225127.23476-1-robdclark@gmail.com> <20240617225127.23476-5-robdclark@gmail.com>
 <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
In-Reply-To: <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Jun 2024 09:33:48 -0700
Message-ID: <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx specific info
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 1:30=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jun 17, 2024 at 03:51:14PM GMT, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Introduce a6xx_info where we can stash gen specific stuff without
> > polluting the toplevel adreno_info struct.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
> >  4 files changed, 67 insertions(+), 19 deletions(-)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > @@ -98,7 +100,9 @@ struct adreno_info {
> >       struct msm_gpu *(*init)(struct drm_device *dev);
> >       const char *zapfw;
> >       u32 inactive_period;
> > -     const struct adreno_reglist *hwcg;
> > +     union {
> > +             const struct a6xx_info *a6xx;
> > +     };
> >       u64 address_space_size;
> >       /**
> >        * @speedbins: Optional table of fuse to speedbin mappings
>
> My preference would be towards wrapping the adreno_gpu, but that would
> require more significant rework of the driver. Let's see if we can get
> to that later.
>

yeah, it was going to be more re-work, and I'm neck deep in
gpuvm/vm_bind.. I just wanted to land this since it is a pita (and
error prone) to rebase as more gpu's get added ;-)

It isn't entirely unlike how we handle gpu gen specific options in
mesa, where we have a somewhat bigger set of options, so I wouldn't
say that this approach was worse than extending adreno_info.. just
different..

BR,
-R

