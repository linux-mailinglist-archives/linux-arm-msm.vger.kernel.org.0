Return-Path: <linux-arm-msm+bounces-17144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B198A056A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F9DC1C22634
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 01:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D315260B95;
	Thu, 11 Apr 2024 01:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OV5RUeG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2728A6FD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 01:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712798520; cv=none; b=RTFK5xGJ7pSxBvxNqOh9FJ2TPS+7grxoK3cg1UoFvNIZQEPp5Ynojhzz5XBgH1WqG0P5KLFWnsxy96OtawQmOhjc4E8YvVtEl+ffRRSdtPFmeaStlM7n80IFXOSVeoaaI1AqzV7B7EMR7yKPfQlgLbWBRvx6X5ETtWLDgUkVgiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712798520; c=relaxed/simple;
	bh=6XVfC+5aVbBd5z/Sg03W9TTELq2ezxScF/CKhxawJgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9K4bvIu0XUu2LcFhJcKrHQMq0yReqbKLw7CvrWFiowYXOYxmfFwggr4czDVan7PJKB/nBzkIX7MDOE9mA4FUQKzkel3QC0YfYYFtwxfCHdIjb5QG5rORXXjC5fyF6a1S0IybNhuVWnPICMrj9T3ejGxhRnL3j35dWElfVLWtB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OV5RUeG5; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso7228133276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712798518; x=1713403318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=29JTXvl1eeIXizUo3xD7DriQJsmKP+Knw9aK5HMQNoU=;
        b=OV5RUeG50NLev/oS65irdQAZSbW+04gUZOP8u7rWBrbH3Bo5WU1gSp3cHm0yfJeccb
         xhyFDcDPqa75T/fkTUCWkAI/stJKfHzTxZ0YVaeuFpghs/yW/UfWis7HgIRACDEhQRC2
         uLc2XStQRE9FhpF9fhypYaVxU9SuiQm6zUtyRxFB7zBzdbCToR+ySKAHYuXFL1itBGpq
         lf3A4LIIAxrztsqsiFNSLNPYmxNHeF1f3yaxHVhTpUgGOQPPyhMPUJAB+C6cxuyN2loU
         tLpHQS4wu4DXo0ewJeXHOWGVomi6YjOvcT6QaRsqeSucvHbV05jB0rFy3JI1ACXDY8DM
         xdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712798518; x=1713403318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29JTXvl1eeIXizUo3xD7DriQJsmKP+Knw9aK5HMQNoU=;
        b=VOz2H8o7ZeHscWtSzkzsX0XZFBqjEhzjOD8H3klv6/0AGj6DGXemfJS1AngS60uKe6
         I8vVwGEim4PT6y+Y9w4469CqHBf0u5B/3L9OTQksAJaZKpjj2lWTg+Kmd78K/plj4SO9
         rQYeri6Rb8EGRFhdbN+28Da2TOTog1lMXauHfO475ln+sCFQTBHvBIC592smlV5DAgLL
         OfVqaT5qkOihHC7/tWDO1m2uxRn+Ue11bTVyc1/LX5X5uCZC1cq7FnWjemJwfU4N4Zy2
         n0hAvNyeaiUGL+bVBxqVB83QDkZTE3YoTNtyrVfZ8iN0T3oolEU3cKqPJE+6mWlSUIA8
         KHeA==
X-Forwarded-Encrypted: i=1; AJvYcCVxwLIbIGQGVn2rROcD66Pb47iJwceHkpX2GbJePhQxqcXFZ8iPonqn4Bt1W0jhWOx9SISP6/pcw6wCXPbTv6O0MlBU+urfZRf2rjy7/Q==
X-Gm-Message-State: AOJu0Yzig0ESNauTh3slMZFW7PJ1zVrqARhQ7E5LimwDriiFCCQqdupE
	gzaJRMeFjIihshEiMZdtYuQbe1zxSywJbGwqXY6MuU96/+kZhxVD9hQJgBH+Qnu4aAEDuDfsB6H
	ZSqv2u27z/7689X91ZYLE1RdjHmcmmeBESsGbzA==
X-Google-Smtp-Source: AGHT+IEt39xqYh+VuBi1zOnldmXuKPcH5dj7N/c8zUF/gfcXX2jQXpI3CXbRm64XnnkdG88YgddWiN60MDbL4hwJaKs=
X-Received: by 2002:a25:9bc7:0:b0:dcc:96db:fc0d with SMTP id
 w7-20020a259bc7000000b00dcc96dbfc0dmr4108725ybo.25.1712798518192; Wed, 10 Apr
 2024 18:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org> <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com> <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
 <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com> <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
In-Reply-To: <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 04:21:47 +0300
Message-ID: <CAA8EJpqHLtnAANkZxh1xJfTpRtoCub1fkz2ny=TVKv1TVw3K6w@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from mdp_common.xml.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 04:20, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 11 Apr 2024 at 02:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
> > > On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> > >>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > >>>>> Instead of having DPU-specific defines, switch to the definitions from
> > >>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > >>>>> MDP format tables.
> > >>>>>
> > >>>>
> > >>>> Adding MDP_***__ usages in DPU driver is quite confusing.
> > >>>>
> > >>>> Can we align to a common naming scheme such as DISP_***?
> > >>>
> > >>> No, it's not something display-generic. It is specific to MDP
> > >>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
> > >>> it?
> > >>>
> > >>
> > >> No some aspects of the hw are completely different as you already know
> > >> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> > >> right.
> > >
> > > MDP4 is different, it's true. But there is a lot of common between MDP5
> > > and DPU. Frakly speaking, I don't see an issue with using the constant
> > > that was defined for MDP5 for DPU layer. Especially since we are also
> > > going to use mdp_ functions for format handling.
> > >
> >
> > All the HW naming etc in the doc has migrated to DPU and in fact it only
> > makes sense to start using DPU for MDP5 as we plan to move mdp5 targets
> > to DPU anyway. Not the other way around.
> >
> > MDP4 remains different.
> >
> > How about MSM_DISP then? I dont get why this is MDP platform specific.
>
> I expect MSM_DISP to be applicable to all MSM displays, even if e.g.
> at some point DPU2 switches colour component encoding.
>
> > Because the term MDP no longer holds true for DPU.
>
> The XML is still called mdp_common. And the functions are in the mdp_
> namespace. I don't think we should be changing them just because the
> name has changed.
> Likewise if MDP3 is not compatible with these definitions (to be
> honest, I didn't check) I still don't think we should change these
> names.
>
> > I am even looking for future chipsets. We cannot live with MDP5 names.
> > Have to think of generic names for formats.
>
> Ok, I'm open for suggestions from your side.

My proposal: MDPU? Neither MDP nor DPU.

-- 
With best wishes
Dmitry

