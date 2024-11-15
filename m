Return-Path: <linux-arm-msm+bounces-38028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041B9CE5C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22D73B34171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74821B6D04;
	Fri, 15 Nov 2024 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhaFh2Yi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4A1B3942
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731680425; cv=none; b=ddZY8bHKuOZV4rATCM8aIgJxnYelq6w3x/969fxQwddkgZlf94NhNZeUN7YJs47DV16C9PL6iQgSd8sSLe5VBSz+AHkyux3ym1kOjetpyOxwzRFxXaMWHsUK1qWvlS8xrFJqtUkT4MzCvr9LO5IEndTm4FIXNNhks7vxNa73w4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731680425; c=relaxed/simple;
	bh=E+N7hANlUNnWzMAxdQP13OfBphSSO9L7QTGOneJcRxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSbcABmPiQUxyk2NujCYzu3phUx9rz0JqXsY1nsq32IMom2d5jAmWXr4muERmrM6uw+ceONPYqsO4ft78dVPmjwQa/FNDzEWg+d8ahDP0U1eHlFM5OVq5emevEn6Sq82D0m4LPo3fFLrZT6cFZdJhHKws+I/RCqvq8ySeVOwoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhaFh2Yi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d9fffea1so1840550e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731680422; x=1732285222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
        b=XhaFh2Yi3+XTMP/pWXhSckGwjpIJPYO8RF1/ae5fapU+l2o5ZDXYcsaKtx7c8+9stJ
         2gZ81gmL+dehmuqKWcbXkrKNnNlgo6j/KY7WtFMzX/FWaEYelZXM02W4sTT2lSHGHi3m
         x94V1hwUu3mscnpcfhCrsIsI28D2b/iWa4W4ZRJ8G/LRPslX5/J8IRio0pYGja14QErR
         PrjqJHlLrUd6bylrra7KtdPdCTdwx2Gxh0zrjKjdySs3viQJpBlt3TgiS9QLiCS/JXmN
         CUZU0l1pr1kbXHxCEj+mgpCfgLh4miriMV+K66OWmUe8jY0RfQWWXUSQuIPP7/LojFyh
         C8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731680422; x=1732285222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kxLZh7oIW/Qu6MO9UxZ5HRBg1gE82+4pLIY8QLKtus=;
        b=rAzCtI2zsEJDbJfDoViHt5IppTOHFb/J+70Mmgmn5sH4CvJzRlGKK4FYkwpPSEasNF
         2F5Rhbbxz2ZI07d+VAVoEm6IN7d/xdM8PAfQlmZRSrZLOmbQx+PCmPJDMBBBkX3AHO4G
         X3VvCKtYm0vQ1btBxRc/RhTOYRs6rq5f9fFUm0DhqpV2aXHKy85v0HQ1Vn4XrkBgOjkd
         cI+AJc+Qo9hQZGZCQZbcQbBN6bz2p0Fhqz34fUldsNEOUtmfjLUfGDOxpm624eOYH1EO
         Iou+MVqsJ16tccc+uZ17NoIs1b5kG8eVIUdGt+Ttu1TwZjrmlfAMCV6gZStrDqk+6eEd
         UYiA==
X-Forwarded-Encrypted: i=1; AJvYcCUuJ2vuFuwZKJjXB3uQKDnZazXtoH0/q3Jnn6WSdqEgi7gT4yDXmsrfFBtjeiZ1/FnPyycAUN3Jgx2HBtOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxDXeG7Xp+IuEpGMZVN0zhFDrOIFw6nYjxZF+PW62DlB72p8j
	8v12tf/T3lFrN8FgINK85l+c6waq+4gSd2OChQi+DKw0MACfJk0ybO6TT6lYuPU=
X-Google-Smtp-Source: AGHT+IEBU8A15vScg0ia4WplSofYKJIuXC0KSALSXA7EzvPsyMeCtNrpJisnibjIPA6EZmUQQ6oJwQ==
X-Received: by 2002:a05:6512:3a88:b0:539:96a1:e4cf with SMTP id 2adb3069b0e04-53dab2ab63fmr1545621e87.32.1731680422383;
        Fri, 15 Nov 2024 06:20:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6549034sm584101e87.272.2024.11.15.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:20:21 -0800 (PST)
Date: Fri, 15 Nov 2024 16:20:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
Message-ID: <7qx65y6o4fvnnnspof2exzk7xru4bgpda43655deeu7hw6wowt@zcnpzyw2xutm>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>

On Fri, Nov 15, 2024 at 01:55:13PM +0100, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>   [dpu error]enc37 frame done timeout
>   *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>   *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

This matches other DPU hardware, so

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

