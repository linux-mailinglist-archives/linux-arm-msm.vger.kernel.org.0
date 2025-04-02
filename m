Return-Path: <linux-arm-msm+bounces-53004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB3A789A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EEB616D709
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1975233701;
	Wed,  2 Apr 2025 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbAsompa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085931D5151
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581868; cv=none; b=bOcL+X1irGsohh2AQ2D233lZItTZsBaO46RT5vF4dW+YOmNook1zFWfCXoy2mINqgZ1RT9aLapTXKKpLiTLB2w3036eu7yZHxxBY36ccCQcHoQ7b5r54ZZ7vK3lHw2VeEV0iWjkUeu2C/DU3mGQHBdXh3oI5Qu79AKp7OQmkKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581868; c=relaxed/simple;
	bh=0q+S1hyB2bD2iYxcKQW4K5H0rWMVwEzHTrltKS/Se9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/OvLIWaHQrgZet4hGezObbbBlwaHCGvTj5lNYpWeMBRQtsieIPTUNWel9fGGP/KQUtSeKaEKJTAIZ0pMHLhI9MHiHo21+SqH580+TvpIyWy49ySXoP3CZFgw+jk0pZHBKuKfntp3dZjzgRTA3LiXkIUREle+5J6NJW5F4xS/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbAsompa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223f4c06e9fso12203075ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743581865; x=1744186665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=bbAsompaPwzrPClUTs7sgciw/KKcEufZjly0gbvdFxDMN/k+nkK+CU3bbWH3Hc3BGh
         4sgehhlWuy4m3QRY+TdstMaON1XtoFi+2drSgNxPhH75ioftivQYpk4nMUH4GSBIsFdN
         BAAUBaLOvah26tRFgqhb46nAkIrab+LsGU3UlnSdRNO+9JPB3+ywSUQkoP5gb9IPQeMg
         97Bzk2ro1Dp6JmG/N0T9IpVmy+sXXR3C1SPHqOkdjeiLOIE93jgXi0G/6SuirYqIF81U
         R+PSVBTnhBPYZ3kTM6GfvelabPvvVnA3h2lMLdnxvj0Zp+AKUD4iqGopc+qDvwd2e45a
         0WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581865; x=1744186665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iReWBKNHJjwopXjK+8MuckTWWzuTqK2CEkS+IjT3heM=;
        b=S9fWzwMb0bkh17eUS2ucjiEAPsKupjsE/vpsDhZuM0R0YIq3GAz0X/vMY82usSBVQG
         c3P/zO3JelhPf2mBH/oKjIr/vjyfQIE3jOKDfNHGEA8bvD3JiQukNiHdO2u42Ps2s6EB
         WLRi8Fv/m7dkVN8T2xh4DDYHrYrV4FmaQ2a35iepNbw08RhBQ9xCJuluozlLjavnaV27
         OiClrgpyz1CttW/v1t0XWO+02RU3lfRKGUIiBR8uMy4LXRYDyzsWMaeS1jzivaKzSU2c
         Mnhl/cg1L7SpSMsvZHM3A7bjy0+xRCca73rsDSTT42Q41B91iaKZC7zNMRzsBv7iZrHS
         b8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFlXoX9KnI+svM4LrSwyKWU3WtCfWc8RT9zsuG0KqfKX2kO19cKok/oI1MSHMTwv95cXWWYmvoU7P54jYP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aiaXq9bfys0Hcz0RTqO1Qu8FVpZ/jsTdgbzTyIZ0mqtgHjh8
	pnbEm83rB/TeAcrT2aXV1HAF5WLGvX+EGj4bvcsEmrbywvn3W0DUyUkE005fjQXGSvPX1wGClXa
	xGIEHbsbx8IupyPRC0QMi8fSVAKvzO0q+6MMMYg==
X-Gm-Gg: ASbGncsLzidQHIHIxgij2UM6t3DsLKz+j+vHRjYBsFCK0e05RwlXFGG+nVtrKwYxw7U
	NCvNuN14zvSMS3us/SyLp6+pPG619WbdM/fS90ibV7onzRAJKC9UhdJmjvhi3I1RNhfZVQbYZDA
	XwnM7rYmwHWk0BSoSTG3oR0aO3GdE=
X-Google-Smtp-Source: AGHT+IEuDyAtb3J035y+ewvbAOiSkrMUX4Bvbz2hxthwagxAZwB2X+VCBgOccBZJT6A84W8a4x1DNPMed8dqnvNjtK4=
X-Received: by 2002:a17:903:41cc:b0:223:517a:d5a9 with SMTP id
 d9443c01a7336-2296df23507mr15163485ad.15.1743581865407; Wed, 02 Apr 2025
 01:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
 <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com> <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
 <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
In-Reply-To: <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 09:17:31 +0100
X-Gm-Features: AQ5f1JqACQ7YzdMw4Wc1Q8A3QYmI1HCNj3Ligt1dvD-z-qjoAaOVowy7RgvRkgY
Message-ID: <CAJ9a7Vjhm5B=3mDHQpuRj2JSE1hfYzOx5wq-yQcC3k+QqEcvAQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 2 Apr 2025 at 01:50, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
>
>
> On 4/1/2025 5:56 PM, Mike Leach wrote:
> > Hi,
> >
> > On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >> On 4/1/25 07:12, Jie Gan wrote:
> >>> The trace_id in coresight_path may contain an error number which means a
> >>> negative integer, but the current type of the trace_id is u8. Change the
> >>> type to int to fix it.
> >>>
> >>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> >>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> >>
> >> LGTM
> >>
> >> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >>
> >>> ---
> >>>   include/linux/coresight.h | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> >>> index d79a242b271d..c2bf10c43e7c 100644
> >>> --- a/include/linux/coresight.h
> >>> +++ b/include/linux/coresight.h
> >>> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >>>    */
> >>>   struct coresight_path {
> >>>        struct list_head        path_list;
> >>> -     u8                      trace_id;
> >>> +     int                     trace_id;
> >>>   };
> >>>
> >>>   enum cs_mode {
> >
> > There are many places in the Coresight drivers that assign a u8
> > traceid from the path trace ID.
> >
> > e.g.
> > In coresight-etm4x-core.c : etm4_enable_perf()
> >
> > drvdata->trcid = path->trace_id;
> >
> > drvdata->trcid is defined as a u8  - the reason being trace IDs are
> > 128 bits wide with some reserved values.
> >
> > Will this not just trigger the same issue if path->trace_id is changed
> > to an int? Even if not it is inconsistent handling of the trace ID
> > values.
> >
> > Trace ID errors should be handled by returning an invalid trace ID
> > value - were the trace ID value will fail the macro
> > IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
> > error return in a function.
> >
>
> Hi Mike,
>
> The path->trace_id is verified after it has been assigned with the logic
> you mentioned:
>
> if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>         goto err_path;
>
> So it should be safe to assign to another u8 parameter, like you mentioned:
>
> In coresight-etm4x-core.c : etm4_enable_perf()
>
> drvdata->trcid = path->trace_id;
>

It is safe but will it not trigger a warning just like the one you are
trying to fix as the types are mismatched?

Mike

> Thanks,
> Jie
>
>
> > Regards
> >
> > Mike
> >
> >
> >
> > --
> > Mike Leach
> > Principal Engineer, ARM Ltd.
> > Manchester Design Centre. UK
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

