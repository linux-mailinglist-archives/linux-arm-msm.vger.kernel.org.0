Return-Path: <linux-arm-msm+bounces-16570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0289A2D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 18:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 629091C22A7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06277171075;
	Fri,  5 Apr 2024 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhtYn1HP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D828171061
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 16:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712335621; cv=none; b=ZFV5XPRyaac0gV2ZtFnoCTT/8fRW2JV3Mwe0rmlexHdfrquQvGQyHY9EOAFHDomWYO6ZKcLrBtE+ikV9BRpS9mD9fo0vM6gVEu69LiuIWn00DIrrl9LmWvCw4TSzzlw/MWdy62K8is0R8pPJmelbTWtIKaKwBNWHwbrZxcp3c0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712335621; c=relaxed/simple;
	bh=KsPF6po0f631j8NvbzhzHLnGhKfPZwZJTUHih5WzFXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/0pqGzvcDPgtxQwxtkvubEG3rLvMYVGhlHbkjCyhXLYAzPUwGxyaQvT5uWB30yE0Oa8v2XSbZosldC9md8fx653P0ovnslNwVIkT3EFYvwWxkxKkCr8Iicpen4vA08orHKLLjKHc76joNQb/jnJan8CzB5IyFkLQzJ0yh6rmdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhtYn1HP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so1997655e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712335618; x=1712940418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
        b=HhtYn1HPAxnw8gcUfekGwloyZyzjCIMJb92tIA+8wOI5XGreRXiXhhQqcQ52YrtjBB
         LLGgJJLTUNhxIPAplxSPFLvSipb89u+Wg8xPXNDQLfkUGMYIgifqw8dPNkoXmJViJmd4
         f30Wd9YRMqD0b0oKoihhtl1C8M3icfzggfHQHXn8TTxq6mHmURyn/+DyhkPmsSVV8D8I
         OozbhYDhOzgdFELNdFBGSICGtTEA9nk+5l12ov07QlEg1qjQToTzM6j7nJNj4UNFzDas
         T21qkmnB2OFsjX6fcFsrEqvG00q7IAEqJ6Gm3zY38bLjYaiU0BR/58YNHTGlUbuHj+73
         YQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712335618; x=1712940418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
        b=ScDbL6UqWPkwyhoGi18ne5uaPu0SpeRUFzzgPpNNeiGo41AJ2uwhLg/tWQNtEeHnN2
         /fAmhVIvSmjfhTxFSjXVyNb0Bpr69owLGD0OSSjXIXZrBATVsPedEX6Weu3REZXAar/M
         vWzHQ/hITtOCtnIC3fJKUHtuudY59LqZUtSASZMb9ohcMapa7vMYMZpPrcwplkk/Xd2u
         kG1vczbjNWVbn5WD3WciXrNPeZUvKN1mvJXcd+N/7+YiyLSYDZsgvTuGnq5YQVCLqOPH
         jdIBdnmMXMw7IfXfwSr+bf9ARip+WxDnYjd37aED90De8ZBdrglk8g3/DI4vci2+n4Sj
         itkA==
X-Forwarded-Encrypted: i=1; AJvYcCWmSO92PEYjogWChBc4ahyVuj4kv/T2Ac+6dotoG73P1LStk2pStyt82/Q8+KJCnm7u+0VSYPMIf9wQ2swYeZ+revgQIk3n79BK7PSfYQ==
X-Gm-Message-State: AOJu0Yxtga6DwmvMAJbUxG3sXGQfh/e65g0iPoLsxwcPB6Hx3ZG12Jze
	DK0YpevTLCt4BN8Akz1jFhkhwCn7iIs0W4gtRnrOHcXOwhtR/B2Rq4HtaBKElMI=
X-Google-Smtp-Source: AGHT+IFufXZNeav0WseEY6nRjlxRZCZWJPm4KsDfy/VrMhHziMpaWAR1CqPIEOMNojFKUGoxkwK9tw==
X-Received: by 2002:a05:6512:224d:b0:515:ab92:6a82 with SMTP id i13-20020a056512224d00b00515ab926a82mr1791982lfu.17.1712335618108;
        Fri, 05 Apr 2024 09:46:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
        by smtp.gmail.com with ESMTPSA id r14-20020ac25f8e000000b00515c8ff6f52sm231480lfe.229.2024.04.05.09.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:46:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 19:46:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: ci: fix the xfails for apq8016
Message-ID: <oakh6gccuho2zq6aaaydq4hucz2ueuayo6qpq73uaw7ljt4gu7@haz3kdjjy7hp>
References: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401204859.24223-1-quic_abhinavk@quicinc.com>

On Mon, Apr 01, 2024 at 01:48:58PM -0700, Abhinav Kumar wrote:
> After IGT migrating to dynamic sub-tests, the pipe prefixes
> in the expected fails list are incorrect. Lets drop those
> to accurately match the expected fails.
> 
> In addition, update the xfails list to match the current passing
> list. This should have ideally failed in the CI run because some
> tests were marked as fail even though they passed but due to the
> mismatch in test names, the matching didn't correctly work and was
> resulting in those failures not being seen.
> 
> Here is the passing pipeline for apq8016 with this change:
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/57050562
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

