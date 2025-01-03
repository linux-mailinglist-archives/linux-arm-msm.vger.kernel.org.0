Return-Path: <linux-arm-msm+bounces-43907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84267A00D5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0136A164993
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E8E1FBCB7;
	Fri,  3 Jan 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvIsa8Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D31FC7E2
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927595; cv=none; b=DbQLEKLBQmvLNPO4hHJCulTSjQvYmODku94D4+4NdtRW+QJatjHtj+rtWqhA3yhUk0X+mkENSz/3L6IDB8u3t4nuPP522z34cYqba4YRtat3jtsYXlYrrkI8Fljw4MTgfaedMgkjdjP2ICioFRFJ4jW51JudiJ5DtTPxPB9v9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927595; c=relaxed/simple;
	bh=fMct6UX5fA0g02rGyWWpB100xU7waqikiYiaSfifA6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N72DH9tRFIcZKb2uZgTar0O587D5pgQA2F8XetgrcqqrVdJQYm3S0V9HsXf5vHVIOEx+tSYzrd6WEZPTVlgMoEHCFODaqB6zffOypcLzNqGvu8AMXwGfs6pytsZdx3yyU3arsPIPAj1mRRZPSAX/sJe17019iJLohuBTnKKAQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvIsa8Pq; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000fso12740459e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 10:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735927591; x=1736532391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
        b=rvIsa8PqGNzuCdjnsfe4nOceyWYSvb7qBK6sqpwKYYhFHhuMnE4RuZCIaxiYTFtWVv
         P0PGqaNq2tdJck/gn+HGllxY/Iw8j/xYNoutfdxWfu6mAPX53pZeUuYx1K+FoWCEjzAH
         UTTWy1to48JJZyp7jzSz7w66G2whtLBbit0svtyojaeO8uTTMSI1uFwXdygg0NpetXAs
         DW2FUQuOg3FDfBugSYUXLFA1bTrQfc5nuQ8ESiYjfqmVfWhxJnG5P2ywAxK4grZG8LUo
         Jrgl1oOPYGYLZxPc6XpsEv3a4gZeToZSjFXkEXXLzbOwqW8Sa9aWm0fA4k5jnrKeiI0o
         rMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735927591; x=1736532391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
        b=Aeq3pzs+voGfgoYhAEeA8Ditd2sQnQ9RsRJ0YfMcgjTGmLCypQsLAHcf4uwNq5aQkv
         +uVOFylo/XjLmK9pgU1249SuoJPLygh0Zluhrj6VjxAqwETF2KxkAmIeJUZCPq69lumz
         rjsQ6hx+g8Y0an0upu58LKnoDm/NDr3Di/Q4MFRvK1iMFVsoF5x6C73WOX5EueEYNDHf
         k7JxAb2tBB3mo19jtz8+D1T57CWz3V0rNvZzsFK1aw4C/LiGHJTUNTWo/t+AO34xOFg5
         CQx0ADvv4yvpoGs0qVntQ4i00wmK7NdYoEouNgNZjtbb46ff16GM1DZAbozSfL+h7l3h
         jW1A==
X-Forwarded-Encrypted: i=1; AJvYcCVOyBF0PRauHGptGKbhQye0HHqjuQfFdyBULekAWLlrh9gGX2j9XZRFo1Of/2R4xWg5wQb0oWzKJ0fuyYmc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnm8TSnEIl5VG//Z3tTqvWBnYFGrWoAR4UhvcsXFspeUdyhMZF
	fGOydN7k8GIAQw8973jdUMiXWX6EjxUSR8JN6ugkHvt5jetKfNFkcX7SlzD0SUM=
X-Gm-Gg: ASbGncsL36UrGmlKyeoakVbApHgxIbvig03KK4BFOhul/6dNN/on7wgeRE0lfeyHe1c
	EFP90co85JoTPUYYHZBFaHjU0ITR4cuLzRYXfslMtTiEZunRW0Dy5yo2Hm42j0nY4yD+Db6zG3J
	gOzeRytuYDOEggf8EtsbCmUaqoFA1bFtZuNMzToqarRsEkyOhTmAa4oPxdNqOpJ73OC2tg321XW
	kovVkuu43L0xDPy+QP+JYFfj1hbmYwJGaZFYQZbW1UGsNCzu4hfIvyqyM6T8R3Q8WrCx2skL5wZ
	JbylUbKI8OJuJ0RfhZ9b/KHmKodW5fjxX1KI
X-Google-Smtp-Source: AGHT+IGRom+Gus/1G1SgQhKlOCafo/OEVm4N6cFluXFzAfrnKOJhSwVzA8r9uuoBvSe2BPxSSW2YMg==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id 2adb3069b0e04-54229992e47mr16954688e87.24.1735927591118;
        Fri, 03 Jan 2025 10:06:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832a5bsm4176014e87.270.2025.01.03.10.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 10:06:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:06:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <yx2io7cuu5hescyocvkvzsaoiqhgbifknbxytqtusbno6y4xe2@e4bar6lemtdl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

