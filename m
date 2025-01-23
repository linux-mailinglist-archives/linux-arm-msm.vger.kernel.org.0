Return-Path: <linux-arm-msm+bounces-45944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFBA1A284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F8D16023B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EF320E01D;
	Thu, 23 Jan 2025 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ttnztkww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377FF20C46B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630280; cv=none; b=aXsTldcrE3XArCnXVH4zWyGswKnusqQ/lcchMOjfrcId2i+mzxQf1rZCq9EqFa1dHne2OP9/kRDzYpBrfEajuLnyvXjeCGcsjggNjx1zg52xnNZ9kB11LzhPTAh1ibE1t4y4IQ0Tpm/vns3IZVk7nAmui8ou53C3DB+gXSdYnC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630280; c=relaxed/simple;
	bh=5QblbkyHoT9BHoO8R/c9rQG5AMF4FpdsfVISleTnUSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXjVNz+QMhkJd7ShH1re1DCjjxuH1GSoyfLvwzGgrsKQ1dF2jT6Sl9axO29E9HoQxdzNpgcAs11MsMlK23UvGJT1oH6R6+JZKcEI+TAkrBcRh2c7I/9FDK8iuWvgIKinv8Xyuz6e0ITsUaMLgEHd0eLDzPoa3Q042RxrQ77KiLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ttnztkww; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54021daa6cbso901292e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737630275; x=1738235075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rj2GtJ6nzpZLgheHkg3rMzdXQplG/HNwyYcLI7b1CE=;
        b=ttnztkwwxGckso772If+lLSoeXuuY/5U3tescbjBiOnfukiQgbOIcEB0t7wfWZKNLT
         yQluz9FGdO1hfB6+zWGSHK+6E9zRg2VAFfwXCLKl0EtkbJGbu148Oqgo3qJI5d33mVjy
         QbuxBM8Q25DNw8BUB2iBzUFCGM5yCRy5fBdqDZL6KPk5H69tBkN1ILIGpXDgh2uJwLDL
         z4358OYVmmgzLPecJt4tF+S1NiAxCB9ELJQKCOVMO919wg5BIh7kQHLoq7owZb90yU84
         20rdB6/if7lte6D4cIKMBJ6ikMNO6bwua9CN6p/oxebdSCtuPSC+3UQO7NiCUiXrCPME
         u6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630275; x=1738235075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Rj2GtJ6nzpZLgheHkg3rMzdXQplG/HNwyYcLI7b1CE=;
        b=EjO7lVfGGJ9eEf+vwww19g9F6koLD44GJTZNI2IsrttAZH1THJOMxmpcfUpQqJhl3Y
         hjBscT7snYL2HdaOd6P9KlyoBy03w77F6xiz4nLujE0SvK1hgPxlSxYlSsXZVIP4VVUH
         noerj8ABEggbgu2FEgFuRTl1HmjJM4fLXX/ajptsE1fLufC4MaLJx5mmSqFp7hf75wSt
         hVaKwDCL4ul/WfFTYeOAasVQX9S52734cEw4kJinWKWcT22dROgLvbQLXUYirTKfspwx
         iWwxMNnGokop4QN3sW84Fv7W7GNkmWw4sQyex84fH7WgOs0qR5tRxu56UnGrRmApGb+l
         H1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA0UcdSFm5cusGCQ5u1+ed0IGhtUjQ5K8n4lY09DsF+Ce7EoPzJ8rd710flEVDuebs6WMopKSRK8t/HAEE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn6w/z+si5SOSFWymP3pqW3KUpISTklEgzRd7bPp2Y4eKMoFCR
	qJQ31XEMJ+cGekGtF29lq0aKQFsMOc5c1n5vk52GC/9uBlPKijGvwlP7IFx8oH8=
X-Gm-Gg: ASbGncshh6bhc1eAfKKPFvNbEPu4C2GxXPzgwNqtiFH5UwRAXOGZxGf90AZ2SmuPwGP
	VHILdNKalncV+PSpQ7HQAkdpGkGV17//KFblwAv6FxRMRFuQuHift63A6fNn4OiePxA9KLNGmYY
	JLS8Ep1zekN1Offww2Z08io8ez+uDjWFDkLu01RG/LGOXMb7GpJt2bqEq/2W1Q55p92NbEZujm5
	OSoAjmNs9NYvU4ipP5br2CNN4lcF/1ZdaCTGq942jlWJLuLeuR0H3KjjEt1Oop9xvOHMyG8+gry
	gKeC6KFSve7nA7eOOwzBENciUYg9kpKHtswo/GbLRJR4aj7uFhDw2kYc2HRV
X-Google-Smtp-Source: AGHT+IH+11R13avpIf+E+wXtNihIljAcxVa+BKIM6BqUk/yHYhwQQaLP/QAJaKwHxjFG+DRnlW/51g==
X-Received: by 2002:a05:6512:4029:b0:542:a763:4469 with SMTP id 2adb3069b0e04-5439c246d06mr7384805e87.21.1737630275131;
        Thu, 23 Jan 2025 03:04:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af06315sm2592507e87.36.2025.01.23.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:04:33 -0800 (PST)
Date: Thu, 23 Jan 2025 13:04:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/7] drm/display: dp: implement new access helpers
Message-ID: <oimolivajra4a7jmeloa5g4kuw2t54whmvy2gpeayo5htkcyb4@ryev34rq2m4j>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-2-7fc020e04dbc@linaro.org>
 <87o6zxn7vy.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6zxn7vy.fsf@intel.com>

On Thu, Jan 23, 2025 at 12:26:25PM +0200, Jani Nikula wrote:
> On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Existing DPCD access functions return an error code or the number of
> > bytes being read / write in case of partial access. However a lot of
> > drivers either (incorrectly) ignore partial access or mishandle error
> > codes. In other cases this results in a boilerplate code which compares
> > returned value with the size.
> >
> > Implement new set of DPCD access helpers, which ignore partial access,
> > always return 0 or an error code. Implement existing helpers using the
> > new functions to ensure backwards compatibility.
> >
> > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c       | 42 +++++++-------
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 +++++----
> >  include/drm/display/drm_dp_helper.h           | 81 ++++++++++++++++++++++++++-
> >  include/drm/display/drm_dp_mst_helper.h       | 10 ++--
> >  4 files changed, 119 insertions(+), 41 deletions(-)
> >
> > +
> > +/**
> > + * drm_dp_dpcd_write() - write a series of bytes from the DPCD
> > + * @aux: DisplayPort AUX channel (SST or MST)
> > + * @offset: address of the (first) register to write
> > + * @buffer: buffer containing the values to write
> > + * @size: number of bytes in @buffer
> > + *
> > + * Deprecated wrapper around drm_dp_dpcd_write().
> > + * Returns the number of bytes transferred on success, or a negative error
> > + * code on failure.
> > + */
> > +static inline ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux,
> > +					unsigned int offset,
> > +					void *buffer, size_t size)
> > +{
> > +	int ret = drm_dp_dpcd_write_data(aux, offset, buffer, size);
> > +
> > +	if (ret < 0)
> > +		return ret;
> 
> I just realized this changes behaviour. This no longer returns the
> number of bytes transferred when it's less than size. It'll always be an
> error.
> 
> Now, if we were to accept this change, I wonder if we could do that as a
> standalone change first, within the current functions? Return either
> size or negative error, nothing between [0..size).
> 
> After that, we could change all the return checks for "!= size" or "<
> size" to "< 0" (because they would be the same thing). When all the
> places have been changed, we could eventually switch from returning size
> to returning 0 on success when nobody depends on it anymore, and keep
> the same function names.
> 
> I think this does have a certain appeal to it. Thoughts?

I thought about it while working on the series. There is an obvious and
huge problem: with the changed function names you actually have to
review usage patterns and verify that the return comparison is correct.
If the name is unchanged, it is easy to miss such usage patterns. For
example, i915 / amd / msm drivers are being developed in their own
trees. Even if we review those drivers at some point, nothing stops them
from adding new code points, checking for size instead of 0. Likewise
patches-in-flight also can't be properly reviewed if we just change the
return value.

Thus, I think, while the idea of keeping function names sounds
appealing, it doesn't help in a longer term and can potentially create
even more confusion.

-- 
With best wishes
Dmitry

