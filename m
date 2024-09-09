Return-Path: <linux-arm-msm+bounces-31303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A49718BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8577E1F23935
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7951B5EC4;
	Mon,  9 Sep 2024 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGedZ6ML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241CB1B374D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882759; cv=none; b=SvowDKuc7OwNCQpUjmVZ9NgdTFQ7wYBBUjqz3kS2gPXDLMnbM2GQyhzR/wgzBigo4vx56uanAl6xMwdX7ATSpKWq6jgljN0qhDhb9CCi5rNKID4kLVKtWIv7Db23aRQuMP2Y0JlXCPGJBMps8xVy4SU/2OMNo9sNkeD18AWuvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882759; c=relaxed/simple;
	bh=hKPc/3t2Dpte9QvhQ5bgGby31S1S30G65rFyRcbAFk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuoPwWljU8k9mLNiGop8Sr4pDh/c524vnw71SWgBXn2Y9NYwP7LsRin6N54ZIiI+Btk+xmaUB5EVl0C7nLSm4xRW5oCaFpWwvH1AtGqo2ESNjVUd9lknL83JmivLEvFeiUXociZdAa8cgqCBFAylhe3vapql3wizWjPDEGC1Tp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGedZ6ML; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-690aabe2600so37381647b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 04:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725882757; x=1726487557; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMtCp8ATO/sOcs10GHw7/+crLwD+Hw8l41IBIY7otQg=;
        b=iGedZ6MLVDkGBWYN4YECrjaCV8PZ6Ld0BjtHBmrT69CNH4Jc36P5TMLTY6p5WmcHZ+
         NZlCUq/3gnQKXPSkz2+nuXmb/U9YnmIb552Xml1nnVHRuKZhv3Awy1YH8Je0crdK6Uff
         xCmMMBT358I4Yz5yJyK1pUIlFLZ1XuhjwHjcmDKs7GN98iDaTsQPvzsr8ZUnkHZHlQrD
         /HmdkLI6WBEfXRGV251foYRCv2grxqkl4ybkejPfUrz2fmnSIEQSFvYcsG7rUW9/ODzC
         N6X0tUQ1V+4i/RjMWupHjos0A3ViN6x47HVDR7Id/eQ0MbPohm3Av46aXhgRWq2LjeWu
         x+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882757; x=1726487557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMtCp8ATO/sOcs10GHw7/+crLwD+Hw8l41IBIY7otQg=;
        b=F58cRG0SjeU2r/B5ntddV4L4nhNN2kRGNZWpl60uBqEUTqN72ZqVxNcHx+mP41p+2Q
         0qw+NPP52t43Tii7zVQ85BoMrlsxuysjb03FLWKQFs/16MM6DhmB63oSDhVeDDCFLHvV
         Qma8IBt3Zly3MilbrKH3bB9FA+lK3LzYtpiv6ISy/2EpVP7xEUmyaO74LN3IFb4kIZNx
         Ushar7dfEhlOa1ac6GplgnQJLPiBKDydwmNnaDPEDSTlS5/eCvAqR6piQS0IKuGCqDeO
         OXZRxQUZqViCYRA4atYNVP3ksmhQIEByPzL53smVHgST62MkJSz4FLcWZYRgcvTAgRd3
         mnug==
X-Forwarded-Encrypted: i=1; AJvYcCWB/bs/0grUpeLWO9a09pZwKClhRD+veg4hxyzwKfvH4wCYmVUkWrXNJBmkEIKITeRw5fb1upSwMKfIiQfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyZmDuTeaH131j7B5uUlJFfhus6CIw43LAogVJW24nUH4Hck+Vj
	dR25BFohapGponRR/sbR+eJFfmVCf66yfCqkdT54G4541fWE34zzpB219i45sLCjM5VCHNnA432
	jVz/Dr2MnS9HR2wSd0PA5jnV7erMyDlpEpS2HRA==
X-Google-Smtp-Source: AGHT+IES2R/I84SVypbTZHwAb2uGqV81o7Zid/P12Fyb+DQeCila7SGmdEBvAwfhacegWh9dEh3FskbNOuYzbfjbpH4=
X-Received: by 2002:a05:690c:113:b0:615:1a0:78ea with SMTP id
 00721157ae682-6db4516cc79mr112532817b3.34.1725882756938; Mon, 09 Sep 2024
 04:52:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
 <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org> <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
 <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
In-Reply-To: <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:52:25 +0300
Message-ID: <CAA8EJpqUAYuUrsijSs0Ncy+KT8KsjpXWMb92aZVhf=Ub_c-9iA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sept 2024 at 14:29, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> On 9.09.2024 1:25 PM, Dmitry Baryshkov wrote:
> > On Mon, 9 Sept 2024 at 13:34, Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
> >>> Under some circumstance
> >>
> >> Under what circumstances?
> >>
> >> This branch is only taken if there's a .create_private_address_space
> >> callback and it only seems to be there on a[67]xx.
> >
> > Existing code doesn't. I stumbled upon it while debugging private
> > address space translation. And that's why I wrote 'it might be
> > required' rather than 'the function returns'.
> > So yes, there is no issue with the current code. And at the same time
> > not having this in place makes debugging more difficult.
>
> Feel free to submit your debugging code in a way that won't mess
> with non-debug paths then.. This is trying to solve a non-existent
> issue.

Ack


-- 
With best wishes
Dmitry

