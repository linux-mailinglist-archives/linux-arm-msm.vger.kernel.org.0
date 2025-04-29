Return-Path: <linux-arm-msm+bounces-56032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F457AA03C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A71D63BCFF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB68B27511B;
	Tue, 29 Apr 2025 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IKXk6kcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD882750ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909528; cv=none; b=KtaIhpBarREqHJ+jAfukrPfGJHdcnVHVtohGjHb0JVFWg5TvkpgLwD5oXiYvQRw/2wKmKQckMOHv7w9zk5GDV/QO7fVSgERcmSYrY6zkO1ar6En0+3JlbS9iSMKko9Iay3mIY5Ee21stOQddRzCYJAF/tOIQM+zg9bjnl3Udr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909528; c=relaxed/simple;
	bh=XVk9KoAYPAhCj6pClbdzzNJHbakY2ZuHo4YnBfMuWyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8hzERPLBJLTDt1TgcBIwq6C8+InFyx+2Kn338Am7DNaiXGwXyA1UQphXhObJMQh64ywAj5BZY3wLlKeHM0K6BiZh/TX1f/PmVygp3iNinn2uQ3dFn0/XpcoVf8VaMxaj6214ASMcgS0GeysVlAIVHZ+X4qthx/qSCrWYA80lDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IKXk6kcE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so8586668a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745909524; x=1746514324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
        b=IKXk6kcErhsQaiVFb/eeddiDvGeNEgyU5SUKlGlWVTWTgYb6oCc5LL2kSrVIX9iMjx
         MO1LH6eR3PWJLmls84n/n+GEFnJZSBAxqRA0ynKtXB/2vHDxzbrMP8m7C4Y6IdLQeDvl
         3evMTs+tQj8id06o5tQnhpYmfdsnKujf3Vx1gM1pFMkG0M2kDEYa03JU3ZjnmRcmokOC
         SkGIgDDm03+8P1S9H92efgjN3jMeU/H+5e+w/q8SzYy8DU8ArUrq5OP41umdpdH0o/16
         5mEGDbvqfPEcKsE38olDit3OLJg2J0qHdwEiqKt6OJQ9fGjtHXdjsyyyyks73e/9OVQA
         knJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909524; x=1746514324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
        b=qvbc48iE93T8GX7sqboKVWLMY5zZ5IRNcJi33w8wFwRT5GOjKuP7MaXvMcQSlGcldD
         sDPnz/gEzlAYOOuv8VaeeMeH8RZzRfnpFI1bxSTuvLshG5eIGWF1inb031DBPybQ35vb
         NhuGkKej8ArVqL8Uc7ZN76e8YlNt70Hwf2fI5eVdUNofhHWgLh6d3cPQbyU77zFpN8EH
         ZiAWx//qL9bmTo6i89rJA+yegAFJ0EC52drcPjeBOdrGv5MM1J7Hder/Jengxo2aTkfH
         pHHj0h/6UMCutMJfK0KdF5EtTnxKWn+yC7I8e1qesDDxjrAtCYnZ5ZX5xIWw5/3Wn7mZ
         sevQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2qDbTsT85iDXA4vkWTgF0sp4iRKQbDS8a1Onfx2i4v7wWlM+38Y0sF9Yo39213pPNINL2O1VephwYYWoD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBN5y2b2qQOleXefaNDJlGkMvEs/KRPgZWIEOr+86Vjy6oJmL
	2T48bKjx6aBHbOnDAuZyY/EopoSsp0maThN0d4NvsMFSBN8xKTrf7SA1p0YjSCE=
X-Gm-Gg: ASbGncvITkMXlJizZueNPB9kAHuk4ld03JpSoKSn6q9kPySRhcxUMnBfBIVeI4ZZYs+
	KuaSELv2jj1pXjPyR4IfG/Ex8+UA0PRVSbLTOiaTuv80T2WVMmuFYxbdp4Vt0IJh2shXaLPFEVe
	z7W0aTvAkpI63wpENJsii4CXiOtr5me2yafl2H+0LAu+sfrIQ4M2ap5atkWFlizv/fHwcmkE5Y6
	0srKFeDL+7fD14uf7yhErTA656FNYyb2U4Wr5wCAEB18nyCzFEGGkfM038DzUVX9N3VH1P8qjqb
	LIDl/7jRIAsrrvmJOxwlD7vO9fzVLxWo04tSQQ==
X-Google-Smtp-Source: AGHT+IE5A3qZWFdKlz6u8IXcMu/YWdgZDamp5pMVUAdRD0eLvFFABY5HqL1f0Ebisd5cUwFYaxMYbw==
X-Received: by 2002:a05:6402:2707:b0:5f6:c5e3:faa5 with SMTP id 4fb4d7f45d1cf-5f83b2561f8mr1335517a12.23.1745909524457;
        Mon, 28 Apr 2025 23:52:04 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701400565sm7082545a12.26.2025.04.28.23.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:52:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:52:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBB3ElgEoCF6yYNY@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>

On 25-04-28 20:23:45, Aleksandrs Vinarskis wrote:
> On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > The change itself makes sense though and I think makes sense to be marked as a fix.
> 
> Just to confirm, you mean to mark as fix only the 1st patch, correct?
> Since it's obvious now that the currently present partial LTTPR
> support did not break anything that used to work.

Well, the way I see it, the LTTPR support is broken on some specific
docks, even if it works in most cases. And since this fix improves
the already working cases and fixes broken ones, yes, add the Fixes tag
to the 1st patch only.

I'd even send that first patch separately to ease the merging, but that's
probably just me.

> 
> Thanks,
> Alex
> 

Abel

