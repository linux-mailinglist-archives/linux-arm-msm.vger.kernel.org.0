Return-Path: <linux-arm-msm+bounces-27793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1336945ED6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 15:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 493121F22497
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 13:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F631E4846;
	Fri,  2 Aug 2024 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMyq8Au5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186041E3CA2;
	Fri,  2 Aug 2024 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722606265; cv=none; b=SaeJNzVc+tcSM61CZVsN8Kc91rgpnDwytKgBEuRQlI3RqHTvGfWXlfQDFfog+ej96trNMAGwCKFvFEfBnRWQx6Eo4nAn/ibRhjdI/b6fNMPncvrxOy15e9VufRvIUc0aWvGocqLM5ntZI8tx3Xz1WUWT8DJ70VhYxfBBAg9iBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722606265; c=relaxed/simple;
	bh=/tGFo5EhmHo+7tTxulMq0gsuoQFEf0lq3lT6jXbNUrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPuny+C3vPzlsm/hZwzp+GsGb5x1HGMIrXT7q1sjN8coniEPR7WVxKwK9MfQ52vJZnsv9niZefaEYJab7b7zgXu6iX6WLKiJ+dve5Ey9Ccv962dKsIKUV8H3zSJsYR/bVluVcH+8ullSMrekVRe56mPmAEhAtjnjwNdXda61YQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMyq8Au5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d18666so14533395e9.3;
        Fri, 02 Aug 2024 06:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722606262; x=1723211062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcwtTMQVfhKv7XwexErI3oh4Oa+G3cV+0RcW1awDBRA=;
        b=aMyq8Au5oGSVN4OXf3FyYHd8Vlukjka1SmWgwAgsAj6u3zSf2xI8ErXhMFKCF6HnMK
         FLG48QkKZLWMZdYeBNI1v3ktvBEgU7WjAke0tGCXtCCreJ9QF8B/HSsM53PX2HfeuY4j
         i1ebIybJ+Jeot1eXbgqBBWvr9GVP9dTiJ8Kx+zM40Jt/Z88UoXRm1ZejMzHkIHBH22wo
         rFp+VxWMYMXLaz0y4yepsgcInaaHOPKzzXeI078zVn8RkdZoQ+mvW8LL8PHsgk/CPS28
         mANZVag95GXmVZvr70z0cbJl8MZhXnfSpqj0/vHh56e90nxfxixzuqh8rx4eHIvPqWxD
         hPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722606262; x=1723211062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcwtTMQVfhKv7XwexErI3oh4Oa+G3cV+0RcW1awDBRA=;
        b=wKZOngPfgkzQKnM/BGHRYZrPtr+5XVI+LqfED5B8KkPUNTHHkHAGVicxN93dc5tKPp
         5T+qesGtn0lslbawTmD9CqSD2xt8Vi3z5KC+9XIjy5DMBNyIqB2gu1UzPz1np8Q6UV3p
         1WJ1ZQP2zGzkdHYLgPQK0Fo1+tcbUA/c7KpikInavSKTtHykdnjqDOusQCyDFp2zSCTY
         6cvMv4tP0bd+J+Y7C11Wj7kXrlVw7BngaVKCv23KquDXaNbM/R2WhM9QAtUKxTThZIsm
         BhNwm/AKJqr5gsa6P8ydRFDR8F6D6DDHXhToIUtAohfv2EsprYwwzMBnAZPKmsJzpdsf
         AHUw==
X-Forwarded-Encrypted: i=1; AJvYcCVpx9Z4rfEQLA+Otj+D0Xv+t41Ryqt5jwZZ+aXfBm+Pk6nu6w5ap1vq7rAh8HArEWCgoH5697VFw6g4qJ+zZU4I0GvRHXSSVK6KY3Gy6SXppSth18cyAgg2cOYQ22EhUOO+vxDowAtwr42mOg==
X-Gm-Message-State: AOJu0Yx5pO/ELQa/AzWmotsqwa0e1tHnrYCS1a9DHaQYo+cQpvwcuXIl
	5Tpkdv72ZdMtmEFdgK82moSVNOmZSO8LJX3HDQjTkRgqbsKJt19T
X-Google-Smtp-Source: AGHT+IHfG0vqtO7zxfbhIi4ginfwQxwejcFL5nLLqb66mHVAL/Ea2qkix54dImYnaTW7CYLeXdZ4wA==
X-Received: by 2002:a05:600c:1d24:b0:426:6e9a:7a1c with SMTP id 5b1f17b1804b1-428e6fb66eamr19397065e9.25.1722606262025;
        Fri, 02 Aug 2024 06:44:22 -0700 (PDT)
Received: from trashcan ([222.118.21.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb63f16sm94131435e9.33.2024.08.02.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 06:44:21 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:41:32 +0000
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/msm/a5xx: properly clear preemption records on
 resume
Message-ID: <ZqziDJlrhvSnijpw@trashcan>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-3-vladimir.lypak@gmail.com>
 <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801131610.jtcpo5l2gd34uqbf@hu-akhilpo-hyd.qualcomm.com>

On Thu, Aug 01, 2024 at 06:46:10PM +0530, Akhil P Oommen wrote:
> On Thu, Jul 11, 2024 at 10:00:19AM +0000, Vladimir Lypak wrote:
> > Two fields of preempt_record which are used by CP aren't reset on
> > resume: "data" and "info". This is the reason behind faults which happen
> > when we try to switch to the ring that was active last before suspend.
> > In addition those faults can't be recovered from because we use suspend
> > and resume to do so (keeping values of those fields again).
> > 
> > Fixes: b1fc2839d2f9 ("drm/msm: Implement preemption for A5XX targets")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > index f58dd564d122..67a8ef4adf6b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
> > @@ -204,6 +204,8 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
> >  		return;
> >  
> >  	for (i = 0; i < gpu->nr_rings; i++) {
> > +		a5xx_gpu->preempt[i]->data = 0;
> > +		a5xx_gpu->preempt[i]->info = 0;
> 
> I don't see this bit in the downstream driver. Just curious, do we need
> to clear both fields to avoid the gpu faults?

Downstream gets away without doing so because it resumes on the same
ring that it suspended on. On mainline we always do GPU resume on first
ring. It was enough to zero info field to avoid faults but clearing
both shouldn't hurt.

I have tried to replicate faults again with local preemption disabled
and unmodified mesa and couldn't do so. It only happens when fine-grain
preemption is used and there was a switch from IB1.
This made me come up with explanation of what could be happening.
If preemption switch is initiated on a some ring at checkpoint in IB1,
CP should save position of that checkpoint in the preemption record and
set some flag in "info" field which will tell it to continue from that
checkpoint when switching back.
When switching back to that ring we program address of its preemption
record to CP_CONTEXT_SWITCH_RESTORE_ADDR. Apparently this won't remove
the flag from "info" field because the preemption record is only being
read from. This leaves preemption record outdated on that ring until
next switch will override it. This doesn't cause issues on downstream
because it won't try to restore from that record since it's ignored
during GPU power-up.

Vladimir

> 
> -Akhil
> >  		a5xx_gpu->preempt[i]->wptr = 0;
> >  		a5xx_gpu->preempt[i]->rptr = 0;
> >  		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
> > -- 
> > 2.45.2
> > 

