Return-Path: <linux-arm-msm+bounces-29779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5F7962918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0BF31F2200F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3495D188014;
	Wed, 28 Aug 2024 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVU8clpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E19187FFE;
	Wed, 28 Aug 2024 13:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852698; cv=none; b=qtDFMdx7HpOAYeNo/10lTPSX6j1OzsLIWrx5V0tIMdnnoZs4Pc80P3/WzWsP+Ngw1vtlOSzb/0dc/HRPGPjOfe/cCLylw0RsxYLrTz3fC4klH9WcnVjxdZ8hR94wBp8ABR91UyF7Gl9CEkxkTTSlQvAL2nMfYJvWzCzINSq0FbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852698; c=relaxed/simple;
	bh=m6i2Y5G3XPS7DMEfcDzl91JOtFg1dDU0TYBsIcMzdzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uI/D9IfhM8tT4XSie/yoowIcH+E1sTkcxzq/YiNvhedowC8+ksdu+WniKXjKWvI2sla0/WQuRr5G1w2czykppPyoHvPO+dG7oj6Vg1T6hyu88lmFmfHtyf329XF3wbrsF6OYPzjbpr1s93CRpaRvp4r03KWl5Ntc04KJIQ76inQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVU8clpv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso8374699a12.1;
        Wed, 28 Aug 2024 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724852695; x=1725457495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciXe1ww20uosaznXPzWGEWV1+7lWqnPArDIYHddKD0U=;
        b=LVU8clpvgq6NBL/FkqZKy3JcmUTm6QUscRwKCDUeZw7nfqIFQSDZx7oM86R0Fo8eRB
         yjuvQTPaeQf0nmV2Rdt3PcTh8at0le5AHH4m8e2MF8oTX021gA2AUmLr4UJp8NFPUsTI
         VckQ+CnhPjJam9SX5CmE6ngLsqGxMATl3LKpj8fUKdJtWALQavy9IjuOZwckz/gmd/np
         vIhXOybWak1dJFElZaQgra0TFcg/TlFDA3b0nSBzUlzLnT9uTet+MB9N4IVzjNRoYxb7
         sSbc4EB6kGzIuZOStQThi8hAXUbOu1MaO8+8AMxhhSL2r7szjsnpZYnl/eQ9j7+OHWoS
         cnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724852695; x=1725457495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciXe1ww20uosaznXPzWGEWV1+7lWqnPArDIYHddKD0U=;
        b=Fw7NPyKYRBHUCveNkfwmfY59L71xTCEZoxO4PtqhGHaSZJ8elK8IfNd44RFdW3aWPB
         hWmA1GtYVT+FDTJBcouNT9aqj/yHPRaDKJDryTD4WeShDWViCbzMV1aSQb3ivCFu8MXu
         a88GqWfCbWO47DRLi6C3Mp9AuV/nOgrbQJcCC8XkevMf062qgPcB5onfrq2tbODQXCEi
         evogJpjXQh0elDH/s6C9ldWZ2C+zx5ZDaSRWO139pi1zG3HbXzgTNxn29KMMWmV6AUXb
         rUU5uKgM1qcOIp6FTW2lHl96Aw5i+morpYfRxxC0BWRqyfS5wGPfLyZcNdGA6npVTog1
         ItUw==
X-Forwarded-Encrypted: i=1; AJvYcCUbJma3OIetjPwQQ5U17dLsdplAhQfCLDuQw2RF8Ayt4VoUxtjevOdxxN325lhlMafwA2Vb+3hWAXYsIbXM@vger.kernel.org, AJvYcCXCKy2za1Wj0mfZ0m5Ab/YyDYsMc3OZv6lN6oGrdcRW3mRmwLMFoL/gOdM60SMx1/9DDIv9/IWnXynYnC6N@vger.kernel.org
X-Gm-Message-State: AOJu0YxmMZ3+Pp9fNbVR4+a/uAaKWTCeXXAx/oasY7WxxJ0YWEJB0M/K
	hE8soUGvGuN1JaMRojor16a+OPaxWczOm828gN2CC6u7otpmIml6gNLPrF8J0CY6H4E4GAGle+k
	DuOryVyqKFU+rf1sv6hQI2OtqLiQ=
X-Google-Smtp-Source: AGHT+IHPu8zMojXcBjKjl7uQQ/A0MIXY4TDdF/0Kugs7vRBs83nkNiGEGQeIcX8ZoYaJMmCepv+AwPgyGZ2Wwetqz0c=
X-Received: by 2002:a05:6402:1ecc:b0:5be:fa43:8017 with SMTP id
 4fb4d7f45d1cf-5c08916617emr12707264a12.16.1724852693909; Wed, 28 Aug 2024
 06:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org> <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
 <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
 <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com> <3ead166f-8108-4503-ae81-7605585c816b@kernel.org>
In-Reply-To: <3ead166f-8108-4503-ae81-7605585c816b@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:44:42 -0700
Message-ID: <CAF6AEGtAMF4efKZo-ogwXc5JGHdoYJ0EfMTtOrkF1J4=zc9yPg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:16=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 27.08.2024 10:12 PM, Rob Clark wrote:
> > resending with updated Konrad email addr
> >
> > On Mon, Aug 26, 2024 at 2:09=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Mon, Aug 26, 2024 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com=
> wrote:
> >>>
> >>> On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@=
linaro.org> wrote:
> >>>>
> >>>> This was apparently almost never set on a6xx.. move the existing val=
ues
> >>>> and fill out the remaining ones within the catalog.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
>
> [...]
>
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, b=
ool state)
> >>>>         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> >>>>         const struct adreno_reglist *reg;
> >>>>         unsigned int i;
> >>>> -       u32 val, clock_cntl_on, cgc_mode;
> >>>> +       u32 val, clock_cntl_on;
> >>>>
> >>>>         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_=
gpu)))
> >>>>                 return;
> >>>> @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, =
bool state)
> >>>>                 clock_cntl_on =3D 0x8aa8aa82;
> >>>>
> >>>>         if (adreno_is_a7xx(adreno_gpu)) {
> >>>> -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x2=
0222 : 0x20000;
> >>>> -
> >>>
> >>> This does appear to change the gmu_cgc_mode in nearly all cases.. was
> >>> this intended?
> >>
> >> Hmm, and this will only get written for a7xx, so we're dropping the
> >> reg write for a690..
>
> Right, this patch is a lot to chew through.. It:
>
> - adds the proper magic value per gpu gen
> - removes the sneaky a690 write
> - uses the new struct entry
>
> but also
>
> - fails to remove the if (a7xx) check
>
> so I suppose for v2 I can split it into:
>
> 1. add the magic values
> 2. fix the if (a7xx) check
> 3. use the struct value and drop the a690 one
>
> does that sound good?

Yeah, I would prefer if it were split up to make it clear that the
magic value changes were intentional

ps.  there is a _bit_ more time to get this in to msm-next for v6.12,
but not much

BR,
-R

> Konrad

