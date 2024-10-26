Return-Path: <linux-arm-msm+bounces-36015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9209B1937
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A78A1F22029
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F12762D0;
	Sat, 26 Oct 2024 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZar5dy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B342AAD
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957016; cv=none; b=EGytAk5YlQmeVJNEzUi+0hDcmfsC9E45yMhUknhOq/I3lQ9xzFWQM8y8lvZrgznsx4TLSW7f6nK7mrXGmD7lVRkm1TpzomJVl7bZbegutljIT0Ex9Uo1cj6o09K7IB6Q+ct7LMh0DG9QP51SOQahqG0+MhIGCyXvsuJ8Xpa39CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957016; c=relaxed/simple;
	bh=c/zRoaoDocjTotnoTNri6+oKTvHdwtFowxI0mIXpM/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvUp5vxLRotxtpz1nyAvEHq+j/V9M3GvqNHcU+ZZSL6L9UoinkXkMtYrkf2UIG4e4/i3/vlqYd4/Cg1gwg530Zthp/rjIdnVkgJQIn0X+WT1gq/LIHMvd/SAPSAkLEQm31ZDkBHaknIrp/U4R9FE4n6bvq0HAUkqomDbpIdosbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZar5dy4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3651311e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957012; x=1730561812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWck6eIL58uZzSAub6tD78hTuIVPy9/y+aNlZR8moG0=;
        b=WZar5dy43bhokuJDavK/vPJbNWjExzLdBmArbZ2z6SwWTpMtXkxu4zB+iBOo3mPPNI
         /j97xDsHdkdmPbhUuwGvXCK3pZfFi8/mHhTo59opZlfxkruTljWhk0OdubEE/eBA12Ep
         dLbLFEc5fC7EG5njW1uTiv1aRyW9yfboT2M/1IyPOf0OTOkPHebk8wzfCtls4RixW0rC
         udhqg3VpRSeis0ptnRavUsOcIWN3o7q4XCsE4FLpx74WPLLljIdBck0EOT4OhOJpI7Ev
         PhOjoo+c/qlDL/+vWBtukilaM1MmumIjS4hUCFS/nCndvPFBKtUhXJm29SyDXCRbKWfQ
         qqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957012; x=1730561812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWck6eIL58uZzSAub6tD78hTuIVPy9/y+aNlZR8moG0=;
        b=dqMusxqLAVBjLBvEN/lmG78cJWmhGvWuVLq6+KaOZ+N4zaFmm973CF/yKwPG1VyOrh
         4y26w46EsNz+3RE5dv3BNdz6I5R+KRW+QxE3yAKqZZj8OhqncPnJnhGR0i1cCB/05cry
         5JadlsC8pMysH0WeozS2ZbJzYHsGfegDKqhvXg55lxH9/u32Oehwstmjulinef0kWa/n
         UZEsIFfPc9Teyw1JgUTa1izk++Iz4d142Rd0moyWGyzNWtqwuIqWwVjSS6gHMW2LH9yh
         rqpDaFC8qAGpl5oYuK5wXGj/PqyZCRYpH65m+S3lkdXArZTo6bmLBPygDuS6LpoHeSQI
         KI0A==
X-Forwarded-Encrypted: i=1; AJvYcCW9Fj68wopF1591VcU1lJSTOpAHfrlhFnFcv0FHoyvbvFpTfEHtiDofTM3NRDRbP++gN/J0/CHN2wlDPJxS@vger.kernel.org
X-Gm-Message-State: AOJu0YwnwqnUYpj+jgfr5Hav8MrK6AvnSajd6jbX0ciz1g1J03XOYsaz
	+HX0xXzMofdwENtQDKEmAw0PQFXbtJJMH9xE5I7yNQMwdThl7EyzHsGKu92VCOU=
X-Google-Smtp-Source: AGHT+IEYw0zyqkyjhXmQoZPWSefeN4g3iItCWqhnrUze/+8BNQVvNaHa9jvcY6diKY38/iJBVJWP0A==
X-Received: by 2002:a05:6512:ba2:b0:539:968a:9196 with SMTP id 2adb3069b0e04-53b34a2d6e3mr1048350e87.48.1729957012345;
        Sat, 26 Oct 2024 08:36:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de0b2sm538020e87.246.2024.10.26.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:36:51 -0700 (PDT)
Date: Sat, 26 Oct 2024 18:36:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org, 
	quic_abhinavk@quicinc.com, marijn.suijten@somainline.org, airlied@gmail.com, 
	simona@ffwll.ch, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/gpu: Fix missing error check for
 dev_pm_qos_add_request()
Message-ID: <mq5tggw4x6gsiidxzllay55wlqfvtdvdgwsirty5uqjfuzw3ym@j2vuy22ixffi>
References: <20241026093738.523882-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026093738.523882-1-ruanjinjie@huawei.com>

On Sat, Oct 26, 2024 at 05:37:38PM +0800, Jinjie Ruan wrote:
> dev_pm_qos_add_request() can fail, and it returns -EINVAL in case of
> wrong parameters, return -ENOMEM if there's not enough memory to allocate
> for data structures, and return -ENODEV if the device has just been
> removed from the system. If it fails in msm_devfreq_init(), there is
> no point in going on, also call dev_pm_qos_remove_request() in the next
> error path is also meaningless
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

I'm sorry, a similar patch has already been sent:

https://patchwork.freedesktop.org/series/140162/

-- 
With best wishes
Dmitry

