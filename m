Return-Path: <linux-arm-msm+bounces-32337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B08984BCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 21:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79F6B20E89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 19:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08B812CDAE;
	Tue, 24 Sep 2024 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVSSRqFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187CD282F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727207525; cv=none; b=ttrdty27OPNivFvcnWnnF34v5YC7B+ZXhuOMoeoGpdnIaJFhQ8dcgSC+YscsBL888d7bw5ILmlRQhZYclXIvApRn1IJawWfTtvQAGzuoEUzx6qy04m9Zos69bt7/WhiW4feV1/h4F78YFFnt5hXI1YoHX0sZ8aRDY1ZQVlBgJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727207525; c=relaxed/simple;
	bh=5KeGSbg57tX5ax84rBYpT31G4XxcL2sAPukh7rLxBTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6nqiSQ1WgYmEQWC3ieyAGfsAAlv+20jejuYhHfDs+YZj2R9dw6uJAjlQnd7JPrkDRFj3EdK8txbseMjzsd27TvpH8ASD0AZ8sHI4FA5cqE15TslJ1dq2MWsxAl/cln/KlP9A3tFVjkHXL2B3sDQRSRqywzPqerhS6MY+x/t0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVSSRqFv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so61033791fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727207522; x=1727812322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bq0U9R9eeNIJowW2qVvKnhEa2DAwJD9fSlheIQ6XtPo=;
        b=tVSSRqFve4HKXsJsxHif4UbuYVO5kU4a3YBjFccsV6UFby++3B+RYVlYDPVVLrkmf2
         mAFw5XSYAlDeb+MfHM50dByAqXV9dsPRAgVo/yyAkHBndeHtMDVuxojUjo/MY6n0sEAV
         aIqGHMjeercncUnQuA9ZnJiGMNKnkv+Ur83kYrujibLZXRWpSxGp3ZsatgTz/qFA/b1V
         4zeFSp5kCe0MoQabwKRQDOudoaYJlpKMo2QGV/ouOhzMMGhwe1tuoZziaFCGKMGKzAFi
         nApQLDVM+b7KY2HJbChi5J76POV0KxXJGAtAeXDUMytNHn6U4pfHCVcBDQuB2Do1vRNM
         wlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727207522; x=1727812322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq0U9R9eeNIJowW2qVvKnhEa2DAwJD9fSlheIQ6XtPo=;
        b=A7eAe0iOLh+8zSHkYx9V2aKzgtmNo/5WcjlqGoRKYJYfwqNBiB00vcEVwS9P3+t1qu
         tNlz32qa8+tqZa+A1kt+7inKF3FMN284oqw80CqTujUdxUPEgomcIjIOEo3ZemTuqxuq
         +XsWccX61IguC0EDUagmnezitowEcdPF1Gg8aNfAgb4HU0Ut9QjKH6DyLH8m4KzQWuDo
         n+1uv3+lvnGptdSnrbdcZRp7HeCFt+pK2opQpKZOept/OlLHsnqGp20mNq6a7LXfmKT0
         wZVkx22bXDIjyL1T6rW7pAGGau8gHY3jyQZ4+i2onpw3s2iZclG56DVN9LMph7FIw0Z1
         Jvow==
X-Gm-Message-State: AOJu0Yypr6Q2LRiy+PP8vQNmoHVmXkveke6HbKACXlaz4mJsU6xSDvOl
	49MDZrcsSLkZEWnxX07nOjySvB1rm+5wtzDwpk3+nQ34f3hLtbLibFgBOJk3VzeSlLmgT2MTOQ3
	60/+Dwg==
X-Google-Smtp-Source: AGHT+IEk0uKEEK8BKFUqm0todqOrVIpVZOqp06Z3FNH4MbitPEcBybY4WcA5l7TOP1oTtKKl7bj9uw==
X-Received: by 2002:a2e:be93:0:b0:2ee:8453:5164 with SMTP id 38308e7fff4ca-2f904a5b09dmr3365951fa.0.1727207522076;
        Tue, 24 Sep 2024 12:52:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d283c655sm3056961fa.55.2024.09.24.12.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 12:52:00 -0700 (PDT)
Date: Tue, 24 Sep 2024 22:51:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: John Schulz <john.schulz1@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drivers/gpu: Switching Adreno x1-85 device check to
 family check.
Message-ID: <ftxrcovpon2vwkjcoejtcdlmmanq4fslpqr7ho3nljvikqpkae@gfxs3qvjk6zs>
References: <20240921204237.8006-1-john.schulz1@protonmail.com>
 <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j>
 <20240924155442.74210-1-john.schulz1@protonmail.com>
 <20240924155442.74210-2-john.schulz1@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924155442.74210-2-john.schulz1@protonmail.com>

On Tue, Sep 24, 2024 at 03:55:38PM GMT, John Schulz wrote:
> Switches the is_x185 check to is_x1xx_family to accommodate more devices.
> Note that I got the X1-45 GPU ID from Windows which may not be correct.
> 
> Signed-off-by: John Schulz <john.schulz1@protonmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 12 +++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)

I don't see a point in reposting the patch with the same set of issues.

-- 
With best wishes
Dmitry

