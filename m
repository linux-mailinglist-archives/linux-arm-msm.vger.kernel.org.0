Return-Path: <linux-arm-msm+bounces-47272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C1A2DAA2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64B701884DCE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A517711CA0;
	Sun,  9 Feb 2025 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwKV+4O6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC7B4409
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739072304; cv=none; b=I9lzTBeuoHhAtgEXPBuH4ux/EYL8SCS2yI9SLLEpSEjfN9lTiHuedCHs9FifEjsSRk44tEyH2I7Dlk2xu+FTybrSujWAY/BNs2mCFEOl8khiaHwGqf29NdFTc+Zs2oeop/3oWZC+cdQKSuFIJRHhruJuAikTnevqvGarctzFGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739072304; c=relaxed/simple;
	bh=/qAcYCKh8OmEH9Fcx0X2ca76LPDtXY0RMYXA3FieKhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhfnV6JmE3My/wC+LiWQRyMkipcRodqdj3ms3+pg5NpRCpdwKtnBbPC8xDcXDtfqgzOBnyOcrtTCp1UuEDMYgIHq8HucQ/48jxf0GAtUg6HXaIB4JiNyaHqolINPMd2AgbIIvDiZe6/EmMcdweBLWNmTzl6Yuf6acX2vX5UGHks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwKV+4O6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30761be8fa8so31444121fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739072301; x=1739677101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/6yPVhvzSQt8FpEj+34A3KYWg9MIBUILVNRXOHt7zM=;
        b=LwKV+4O6jFXDmlWMjod7/PMtVGTOyPqz8a8F1/R/KGeNOCeK7jomCLOvLcn8tma7ym
         sdriHA6mu0ZbsOIOu79LuBZalxZqykcMI+w98E/QN92Di9JUeDO9lb0o1S28BXj4Mary
         lhD5F54OazJ20noCNJAKNL6LT+ZAfowQ/K6lFAzllz1cmEiVzk1vao3T4y/jYsOsYyWv
         8/aKw2CdmDbPi7EZ5UmaSaGMIXEjMtI68ntJ/MpCESi4QdFJcGXiec3vTjIR59mQNBj3
         QssXLDBYOIHEodIfyPliXjo3FzryZR8r+3nW9kU/130WkWiOb44ndgI6K5CpSGSUcnoQ
         cV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739072301; x=1739677101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/6yPVhvzSQt8FpEj+34A3KYWg9MIBUILVNRXOHt7zM=;
        b=ajDFXy8iZcEIxdbV6+AdFYve3SETn+uvgHZiJ/gf8WlP+ieDN1x8qDOVnInup+KgL1
         TJh2/44AQBeJ61qD5hT54+UXe+5YWrwTQpmz2Ks6p3CtXtEElMvbC1E8kBi0RF6RwLQC
         JlQIkz1KnHQHWKiE020aI1M3n3n4rrzYLBZnSrSLEu95dV+I65E5feSpCAYlkP46QKp8
         fBVjiFz3oVEfZoqiMisHVVYKi/fg4KbGlpGs5QHI9ngZij0jPpc2yu/P1RSQ/Km64RKG
         SH6MqQvM6fObyibIslI5Ll6loSHN2Jl0pHwYZwqltcC47L8rDlJ4dyBV1arnGr88YPpS
         bh9w==
X-Forwarded-Encrypted: i=1; AJvYcCU3OzQEgfIAem66PS0E6u2MgA0NM7XFvQjz105RvDVOGrEpzpMbJQSWBRlI8zUEhjlbKDGOIjy3Ic1T8ecW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp38FxC7dW+aa37s1QrlexRVswX59umIHniT+gs4wVxRmcxRuT
	7TTT6jxVVqV1XyWUiwMklp6yV0TmXYUQC0eTuJnDbsNHytBlLDAG40H1kLmZLm4=
X-Gm-Gg: ASbGnct4/2QWcKW0u9FUyLOA3j0g7PI7kDkFfoWReX0Rmo86RQ/757AX/J+dY0SFBRT
	kTqTHtQEsZrNm4AYqLCYN+R0z6wUnNkwd2r9Gzlpj65XkMPmioVExvSX/jc1JRPkiorF2Ox2aaE
	gCoSMfF4BADVZTX/4fb+B/Z6rMHGYiP5Zd7EN7+LsHQLQv0S3TY9bVNXUS2jFgakLTk0ixvCWv4
	U01rK3FLR4z+HY0Da3VdYxbAXZIsYR/0yOOq/yV6bhMa2Q3CVoDF+9YQ7NjuaDKp/jN/S28S+Dz
	Sg33zO45rSDOHMivdFT+RZF2laun94fyRvpymK+Ezl1u8snwSowqEiZxadhUWIo5nRoVqWE=
X-Google-Smtp-Source: AGHT+IES07fxPyHCztfsqpUU3ib0W9GV8knyWCON3WWXjJGQPwrMdTFe5n+ZQFCrewVIai6KclkWWw==
X-Received: by 2002:a05:6512:108d:b0:540:2a92:7da9 with SMTP id 2adb3069b0e04-54414ab5605mr2768060e87.21.1739072300614;
        Sat, 08 Feb 2025 19:38:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450a64ea2dsm39590e87.14.2025.02.08.19.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:38:20 -0800 (PST)
Date: Sun, 9 Feb 2025 05:38:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 0/7] drm/display: dp: add new DPCD access functions
Message-ID: <pxcgcutzjjge6ruw5hobg6jkfqozhtlvbhdlmyazesbi4aipj2@enepqlcvjruw>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <ctla3nt6o3osdxek63zyidyuofzgq3mgshh2azong3ntcqevhi@3rrzr3hrzbor>
 <87r04tn8is.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r04tn8is.fsf@intel.com>

On Thu, Jan 23, 2025 at 12:12:43PM +0200, Jani Nikula wrote:
> On Thu, 23 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Fri, Jan 17, 2025 at 10:56:35AM +0200, Dmitry Baryshkov wrote:
> >> Existing DPCD access functions return an error code or the number of
> >> bytes being read / write in case of partial access. However a lot of
> >> drivers either (incorrectly) ignore partial access or mishandle error
> >> codes. In other cases this results in a boilerplate code which compares
> >> returned value with the size.
> >> 
> >> As suggested by Jani implement new set of DPCD access helpers, which
> >> ignore partial access, always return 0 or an error code. Reimplement
> >> existing helpers using the new functions to ensure backwards
> >> compatibility.
> >> 
> >> This series targets only the DRM helpers code. If the approach is found
> >> to be acceptable, each of the drivers should be converted on its own.
> >
> > Gracious ping for the series, it's been posted a week ago.
> 
> It's a bit of a bummer the names become longer. I don't have a better
> suggestion, though.
> 
> I do like it that the error handling becomes easier and more uniform
> overall, and this actually fixes many places that only checked for < 0
> with the old functions.
> 
> I glanced through the series, I didn't spot anything obviously wrong,
> but didn't do a thorough review either. I can do once we have wider
> buy-in for the idea in general, so the effort won't be wasted.
> 
> For now,
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Is it okay to merge this? I'd prefer to have comments from other
developers / maintainers, so that it doesn't become a controversial
change.

> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (7):
> >>       drm/display: dp: change drm_dp_dpcd_read_link_status() return
> >>       drm/display: dp: implement new access helpers
> >>       drm/display: dp: use new DCPD access helpers
> >>       drm/display: dp-aux-dev: use new DCPD access helpers
> >>       drm/display: dp-cec: use new DCPD access helpers
> >>       drm/display: dp-mst-topology: use new DCPD access helpers
> >>       drm/display: dp-tunnel: use new DCPD access helpers
> >> 
> >>  drivers/gpu/drm/display/drm_dp_aux_dev.c      |  12 +-
> >>  drivers/gpu/drm/display/drm_dp_cec.c          |  37 ++-
> >>  drivers/gpu/drm/display/drm_dp_helper.c       | 345 +++++++++++---------------
> >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 132 +++++-----
> >>  drivers/gpu/drm/display/drm_dp_tunnel.c       |  20 +-
> >>  drivers/gpu/drm/msm/dp/dp_ctrl.c              |  45 ++--
> >>  drivers/gpu/drm/msm/dp/dp_link.c              |  17 +-
> >>  include/drm/display/drm_dp_helper.h           |  81 +++++-
> >>  include/drm/display/drm_dp_mst_helper.h       |  10 +-
> >>  9 files changed, 354 insertions(+), 345 deletions(-)
> >> ---
> >> base-commit: 440aaf479c9aaf5ecea9a463eb826ec243d5f1cf
> >> change-id: 20241231-drm-rework-dpcd-access-b0fc2e47d613
> >> 
> >> Best regards,
> >> -- 
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry

