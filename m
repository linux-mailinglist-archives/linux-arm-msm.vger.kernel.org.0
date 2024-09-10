Return-Path: <linux-arm-msm+bounces-31419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508C973A74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 16:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1ED1C247A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 14:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5134519580B;
	Tue, 10 Sep 2024 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6hzT6QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A3193085
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 14:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725979510; cv=none; b=KhzLo9BjpXl+tTnHT25525RWmtGW7QaelzZldPt60ckp8lYbRcydAOM2Jptdyk4pPQE3zwzb+xBELeJZTtE/mX5DDirQ40Hf8kFZNl76RyoLuDWISc2ca+jIcd0soP/vR/4pZyedWixycSK49UyW4tL8FQs0CnXPnhrg9dooZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725979510; c=relaxed/simple;
	bh=RX3KHDriwLTHhMB1/Y/4WKB1LnCFaqzNXHSC987q6o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cz2jnuTO/eMF23XKHsNgVVRXqpz730clY6NOvdUj32X5AQayncRW4wKS29PXqcvPg/TqG38CJDlny0vgYTNTrF/5A3NMA42qzCUtET1jvMjArp1JnWYZMuNBfX4szK/8P7qiDPQ+eFVQolYWbqIaLd1TkiSkAhZ29z3EBjOcIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J6hzT6QG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-535be093a43so1183753e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979506; x=1726584306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fyheDlGANeq6Wl6O+ghUD4wV0JahjuF+9A+tjmIT3aI=;
        b=J6hzT6QGHGsMK0V1dovdb2ozCbQuTJ/NafZrcVrbXy9II6HoG3Vun9eUMnHhdXVamk
         llqGr0ws9Ww5YlcsniB7a+EHsc0L7vsGl2I6PcnwzPgNCgSUzfLYya6ebqPnrJyS4NML
         B8wjNAD+RlQCBPOkjFWi0TKTLVLput6qqH2UOyECZjcahZL9UHcE4MpiEr51ujyRG8jJ
         TKoPdIBaHxoxGS5IcdpWfxoAp0wEpdVkMpW2UN0Kq5thYQFWzkB2OeU4bIiIfk8ie+fz
         nhnm24eRnEUIOrxiN8aUuuS8FieQzhYM3FAkH6kKhQaHhhi4oT9G8kHZ6sNWmXS5Th4y
         KEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979506; x=1726584306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyheDlGANeq6Wl6O+ghUD4wV0JahjuF+9A+tjmIT3aI=;
        b=pXZv/gqQySGBsgyjtblylGb1SdzE1y3TW2uGEw0cDvtL2YosjWkwhXR6ZNFuEOavTt
         UT0pG1DWU4nIjJNj25Og01T/lPnUNHebgh6jJUNDP458griHr3/LrN7RaMxlzgGF7rmB
         A/nWM98Q/II8s6pGwLfGF7SkV/6qNvoLblFrQTYb5XmOnFn4u9aI4gp+0gvmzk0AGl0n
         non1lCMk15+TGWbrDh+4oQpk+liU1UdAZDra2cdGFgPNA6OVTLLR/5QkNY0QqqHEUf0W
         G6+rKX3lTV5t57mKAK+yniOfG/HuvWo9eyRzO9Pq7kYeaYwcZxyfayvXCeooNA04fSaP
         1uxw==
X-Forwarded-Encrypted: i=1; AJvYcCWiAQbuBnC7mO0cLYWsuESb5FjZq2IL5NXjqFooCMkf263M2VrqSaU+GygI8NCkbz8bSuMfauAnD4UMGC4r@vger.kernel.org
X-Gm-Message-State: AOJu0YzrY1DP2JuC3m0OQsJrFXdKSIqZw+WOmkPOMdJKzbLbB2inptO/
	zCa78/43B6LYyLCsgAAH2CNuVqTA4XkIpFCb0PuUr1AxPCM23vSNZF8RE8F9H6KcJ5woHx3RaAI
	a
X-Google-Smtp-Source: AGHT+IGkucxQAPF17vtiwykU1NzQbKTsUYePLM268UsuU7sXnhSJr57nWX2ddN1l8A7ibNcX6hceFQ==
X-Received: by 2002:a05:6512:2385:b0:52e:9f17:841a with SMTP id 2adb3069b0e04-536587a4006mr11605403e87.6.1725979505297;
        Tue, 10 Sep 2024 07:45:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d8ebsm1190511e87.281.2024.09.10.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:45:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	Daniel Stone <daniels@collabora.com>, Helen Mae Koike Fornazier <helen.koike@collabora.com>, 
	Sergi Blanch Torne <sergi.blanch.torne@collabora.com>, Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
Subject: Re: drm-ci: flaky tests for msm driver testing
Message-ID: <2t263tpqv53kqs3dv46x6obkh2cpw7jxj54hnyhxtbiu6tew33@c7ec7yhobqqv>
References: <661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com>
 <c96d719b-1d26-4f16-812f-ede92da3869f@collabora.com>
 <64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64bc4bcf-de51-4e60-a9f7-1295a1e64c65@collabora.com>

On Tue, Sep 10, 2024 at 08:48:09AM GMT, Vignesh Raman wrote:
> Hi Maintainers,
> 
> On 12/07/24 11:35, Vignesh Raman wrote:
> > Hi Maintainers,
> > 
> > On 28/05/24 11:39, Vignesh Raman wrote:
> > > Hi Maintainers,
> > > 
> > > There are some flaky tests reported for msm driver testing in drm-ci
> > > for the below boards.
> > > 
> > > *)
> > > # Board Name: apq8096-db820c
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > dumb_buffer@create-clear
> > > 
> > > *)
> > > # Board Name: sc7180-trogdor-kingoftown
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > msm_mapping@shadow
> > > msm_shrink@copy-gpu-oom-32
> > > msm_shrink@copy-gpu-oom-8
> > > 
> > > *)
> > > # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > msm_mapping@shadow
> > > 
> > > *)
> > > # Board Name: sdm845-cheza-r3
> > > # IGT Version: 1.28-g0df7b9b97
> > > # Linux Version: 6.9.0-rc7
> > > # Failure Rate: 50
> > > kms_cursor_legacy@basic-flip-after-cursor-atomic
> > > kms_cursor_legacy@basic-flip-after-cursor-legacy
> > > kms_cursor_legacy@basic-flip-after-cursor-varying-size
> > > kms_cursor_legacy@basic-flip-before-cursor-varying-size
> > > kms_cursor_legacy@flip-vs-cursor-atomic-transitions
> > > kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
> > > kms_cursor_legacy@flip-vs-cursor-varying-size
> > > kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
> > > kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
> > > kms_cursor_legacy@short-flip-after-cursor-toggle
> > > kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
> > > kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
> > > msm_shrink@copy-gpu-32
> > > msm_shrink@copy-gpu-oom-32
> > > 
> > > Will add these tests in,
> > > drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> > > drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> > > 
> > > (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)
> > > 
> > > Please could you have a look at these test results and let us know
> > > if you need more information. Thank you.
> > 
> > There are some flaky tests reported for msm driver testing in drm-ci
> > with the recent IGT uprev (https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e7f4e6a20d550252c4f355d5a303b1d9c8ff052)
> > 
> > *)
> > # Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
> > # Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> > # Failure Rate: 100
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_lease@page-flip-implicit-plane
> > 
> > *)
> > # Board Name: sdm845-cheza-r3
> > # Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
> > # Failure Rate: 50
> > # IGT Version: 1.28-gf13702b8e
> > # Linux Version: 6.10.0-rc5
> > kms_cursor_legacy@short-flip-before-cursor-toggle
> > kms_cursor_legacy@flip-vs-cursor-toggle
> > msm/msm_shrink@copy-mmap-oom-8s
> > 
> > The expectation files have been updated with these tests,
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
> > 
> > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> There are some flaky tests reported for msm driver testing in drm-ci with
> the recent IGT uprev.
> 
> # Board Name: sdm845-cheza-r3
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc2
> kms_lease@page-flip-implicit-plane
> 
> # Board Name: sdm845-cheza-r3
> # Failure Rate: 50
> # IGT Version: 1.28-ga73311079
> # Linux Version: 6.11.0-rc5
> kms_flip@flip-vs-expired-vblank
> 
> The expectation files have been updated with these tests,
> 
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
> 
> Please could you have a look at these test results and let us know if you
> need more information. Thank you.

Thanks for the info. We will discuss this internally.

-- 
With best wishes
Dmitry

