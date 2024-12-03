Return-Path: <linux-arm-msm+bounces-40094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AB99E1EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91EA8B628FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5E82AD02;
	Tue,  3 Dec 2024 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4xGGWBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C871EF0AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234001; cv=none; b=tgUfB2CHsOTlDnPzagLrB183sLK85V6oBHdT+qWv0tutnxoj6wzlZJ33lSoa8eFTndq/eAPeC4FPIXRgLrrb9qFzot1m9C0t0upUvKbhB+RYnDlPznb+xWU/xxml8vajT5lieIzHQBe6a0nMNcq6aK+3EIjzdAU/Aw3vYKLCLBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234001; c=relaxed/simple;
	bh=3atVv1mAWnuY5nRv4mJyKTmYsdawy/26BkqrwuAK54Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujDRKBk5Xt9r3vFtvYCaLc6yl6B8q6mnwlTzhZu4YfXCrr56WQ3c7C8dmNAiNvVfph1Yu7oj0SOV3WB7DPQRW9Luu5kRTf+d2FzEqnszoNzlj2koFqQLZVoRbHj/IwDUodiq6h38ZOZtHSNvC3CQQEUm2YgEZPU2S/FxOPOytao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4xGGWBI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so5671123e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733233998; x=1733838798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8tb3PPgv++CfPZVKWrMsVoIqmBSMscd8BSedQU9tSk=;
        b=P4xGGWBI36umz+tF6xzabP4jDfxOvQGd+O20PB4uiQiTmtVahVdfRuPUwLZFDmdUyE
         BucZyUgRLsHpWATmcfrNYMEWVL3cuvwAbAEAf5gQoXi2kAQ6E1iozbTHQQfimJFd1Abj
         0nfOJw9rU97d8Fzo4cQoknHL6/pZNvCYukz1ckljcvtTrEoU3O+8hYzuccv+xqO1n0Ye
         YomPvVRvxkFcIkogj1utlvuIO31/7RCVurEuITiz6cufZf8vP7DC/sSlUgxBOcjQEaby
         Pdv13yiw/ryFFx/uRRan4xcrdAYpk4oISOWOSxrjQ7iHMuH2qygctrvywzTlZNOks4j8
         rC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233998; x=1733838798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8tb3PPgv++CfPZVKWrMsVoIqmBSMscd8BSedQU9tSk=;
        b=DPacJSvNBVreKcyaU8pxF+J4ZE3brBdrCK0CYZMa8mR7LrV4qKl1Nf33z6q2BxeWK5
         HO0umidomFW9WKkWZ98u6FUx7LUqic5sDl+Dxp/qZ8NK0DLC7Y7ZqmXJmQYXHPWmIPq+
         UlgaxsU5aBNbh0emskoSlTeFQuuismeAQWE4jY6jiyRVepE6CP4hg71ltTOVy2zKw405
         C3oHWPCnqYw/HPBi3wrukemvQc5jgawflK4SxOmQ1ntGOQImPG9NR+nb1pAS7SJOBR43
         vBX+kSmMNDfAWujZVSQrYEXf/tX7iOxj9P+1ZRokHLx4q3LZLRqiXcJIS8nBFl6I0giD
         8bhA==
X-Forwarded-Encrypted: i=1; AJvYcCV6cbyjWo2TWEe9L0phj2Wa+0ZSEaNWo+gAfGa7gp0t6pl95SsKvfyCTmeTeOqEmHxyw9U+IcR3ozg+L98S@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAkWZrjinSH1ypWfc69b+dvjL160CThcJDMqC/+qebB6/ioZl
	TBZteGQED++NvZUXOqs/xNp/cN/IR5KEH/x6kriBmbCBkM9femt6ToNSl3OFrmg=
X-Gm-Gg: ASbGncugHPe7mkkchInXKsywz8qbW7gNJB4Up2HlAXM7WyvUwrkRHt38BWkk0bdzM3L
	8172HI5qURkAZGqpDDnIwQ9jmx4FDEFwW8yEW5SqiP1v5VMkzYTtlsWmHax29ZTLRmwg69yzRe9
	9H+WMfgbu3aDQGkIIm4Tfmw/zCCLJkSsn8Dg64LSd0GbTHcs9C8uRpoDNDmQn5GS/hsTA6LlR1i
	Lb8eCFxkGLotqOJaG0qHlfqS0B/eca33ufW3d1MjIcV/FtlsECkCl7JQcbWT7m8O7MRwmag9PTh
	mALTgpwzBVyY2CwnViQvIjDzO8KESg==
X-Google-Smtp-Source: AGHT+IHmwhiWYRAUKFwNF3ZPoG27Uk1n5LAAWFLyHl2lAlSgMJV5sQBtJbBDUsi85Xo7F4t3kAwO1g==
X-Received: by 2002:a05:6512:10cd:b0:53d:eefc:260f with SMTP id 2adb3069b0e04-53e1b881433mr165323e87.16.1733233997647;
        Tue, 03 Dec 2024 05:53:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1356906esm215368e87.15.2024.12.03.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:53:16 -0800 (PST)
Date: Tue, 3 Dec 2024 15:53:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>

On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> The checks in msm_dp_display_prepare() for making sure that we are in
> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> 
> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.

Can the state change between atomic_check() and atomic_commit()?

> 
> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> there is an atomic_enable() without a prior atomic_disable() which once again
> should not really happen.
> 
> To simplify the code, get rid of these checks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 992184cc17e4..614fff09e5f2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	state = msm_dp_display->hpd_state;
> -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}
> -
>  	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>  	if (rc) {
>  		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

