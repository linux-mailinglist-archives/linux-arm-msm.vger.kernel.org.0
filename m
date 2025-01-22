Return-Path: <linux-arm-msm+bounces-45872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB93A19ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 23:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53503AB58D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 22:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D101C9B9B;
	Wed, 22 Jan 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDlRtJ22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8581CAA66
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584083; cv=none; b=Cz943Fy1HyYTBfD2dKfnQEuxeMcV3jTLQXjixB9tKMyGPSRNhkZyUmzsNqXZ1+NnH/jTRH9SNm/XWkWcqMEFyJGS7VUYXgOgdVOK1mPFJl3H4FwqJocZVoH4MbiQk/qTAUygBK7GClr+bKN10J8LZhoYT2gMkdUPiiQJgdTDux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584083; c=relaxed/simple;
	bh=xHnt4GFQCIQSuiR4bwSRKt54t/sjVBI8NQmJKJltCaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4p2zZRlWLjjBt/osgQ88WGCtXxNJ3x/uJlzIB7P5bBHUXwJK4mTCBpBdAb8X3+lsH5WyM/lw/D1sqBFq2fPZUofnUI3b9uxHYzNYJbLxhVxPIRXoIdETayqjZ0eeqINyO6jNctT0M8a1CSAu5gkgd9BVoyszkRE2lcqhKcChqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDlRtJ22; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30225b2586cso14434251fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737584079; x=1738188879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
        b=GDlRtJ22l6s+ySIfZdIoDZtemOtsaYaGSYlRtHbabSWJoL1odvYihc+PxTFNqyGPyj
         OS+4WUZfJ6zF51kE7mhTl1OKe6h1VK0ate+AiJ/gbaiNhM9VG0bMcu37yeSRTvL1P/zb
         xrG0MOZ974DXwpt+dpZpFpMcJqdaVopiPicfIAzOq01nvE46oREYKukhl+jhk92/epPm
         f9OmPBVSwJcU+19z1vlP8hhVhIiZjro0ZtNp5A2MkCSgImp3XryUPpjpG2X6hRkWMpY1
         2LJ3FG1fVwBuWj3m6yInkVPHuxdQgLNu37RtNsUrW1hJdJC4rx0NNmnXT7EuN6sV7OUB
         zMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737584079; x=1738188879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwZtc77vhcVJuVM8Re9KLoWSMRTvcITBEPJQXYppitQ=;
        b=TMVLnXxEbaNy/PlVMciETg6mEnoviDGeXeaMpd+dwsgIrvj4tuxjdKhSH/nUuGCysg
         ehdHL4hyMHdw61m1a+hBU3R6yLLUzkXXbAssZ1XSotzJb27YYPoewAQZV2b70PkHVaaQ
         wSh7o+hhTy8cNJSBb08/RR+67tOFWG3Z4nlDPNlRv2tuAjvueU8xjHFFH+mjN8qdm8aN
         j+6wH7wCxO+s9UKhhTGtLe46lLWkZq2oyzB1GKRiV6uIg59zsxwzV0nQNeSF68OhjhfD
         2U6CE/7c6iHpSILSXyil5VM1Z/qLwsG2Sr2juD2GjQYFpiB9PjkUIu7Y0MMpTPEsQdsG
         oWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyNYZ3M0oIenP+N/bqoCvwWAvpGM4/TCtaXe0O1lMwF9nTs+VoXevBNDc4/jAWyl+1XxrL+aqOTsSpWaOS@vger.kernel.org
X-Gm-Message-State: AOJu0YzoI1JITKLRHyhv6ELHfu6dfyy7mrQq4XOV9x7wrA9IyEGUSffq
	UFIlIrMY1sWdtCaDhoea12Y5VojWoPoOChCGK9sr9P+W+xhcUu6Qoc5N6/jzeyI=
X-Gm-Gg: ASbGncvHpqftvfL4pyNzaXjxiMxq5IJxGkQViE5uuTIc0OpuftnMdmpaa+gS5weOvzS
	P46liUywHjhhxWlHkc/4NcTYn7CXsi32IcEEOxIdDxAuZQNwaKO0xTb6CXurSotpmQiuVYyIDCA
	yHa7wH12KLYLY8axJeA3+GHCO2fdH/7KeXBr8l7bZO+Eepgd6jBUGLdF+RI/IycsHZoMPTQxZLb
	YTxnGu/I71SnsKRns1YDyUz7oz+6x9RncTBZkwl4SPwJYwYNkx3oBvdQvTfvuk/67b4teczSsPF
	FLdQbqp6DPNnpIX7MQVAAOsJzxtFk8PpzP6btAUe3MnpO1zO54X6mMQ/lUb1
X-Google-Smtp-Source: AGHT+IFK/4GQM98jZZ/5OPlTud8xH7WRoXr9IJVmyofaZZMHWNRpLmTWDBbwwb5fKkA6+eFoKUKwWg==
X-Received: by 2002:a05:651c:410d:b0:300:3307:389f with SMTP id 38308e7fff4ca-307619c49c8mr1819821fa.0.1737584079129;
        Wed, 22 Jan 2025 14:14:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed2d2sm27708361fa.74.2025.01.22.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:14:37 -0800 (PST)
Date: Thu, 23 Jan 2025 00:14:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>

On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
> Existing DPCD access functions return an error code or the number of
> bytes being read / write in case of partial access. However a lot of
> drivers either (incorrectly) ignore partial access or mishandle error
> codes. In other cases this results in a boilerplate code which compares
> returned value with the size.
> 
> As suggested by Jani implement new set of DPCD access helpers, which
> ignore partial access, always return 0 or an error code. Reimplement
> existing helpers using the new functions to ensure backwards
> compatibility.
> 
> This series targets only the DRM helpers code. If the approach is found
> to be acceptable, each of the drivers should be converted on its own.

Gracious ping for the series, it's been posted a week ago.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (7):
>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
>       drm/display: dp: implement new access helpers
>       drm/display: dp: use new DCPD access helpers
>       drm/display: dp-aux-dev: use new DCPD access helpers
>       drm/display: dp-cec: use new DCPD access helpers
>       drm/display: dp-mst-topology: use new DCPD access helpers
>       drm/display: dp-tunnel: use new DCPD access helpers
> 
>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
>  include/drm/display/drm_dp_helper.h           |  81 +++++-
>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
>  9 files changed, 354 insertions(+), 345 deletions(-)
> ---
> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

