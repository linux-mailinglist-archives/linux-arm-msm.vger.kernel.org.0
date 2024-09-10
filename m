Return-Path: <linux-arm-msm+bounces-31420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F94973A96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 16:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C88928831C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12ED194C79;
	Tue, 10 Sep 2024 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fe7VI2Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2E2BB05
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725979914; cv=none; b=F6V2JvPqFrBbbH6DIZLDQq6boPkTM0X+Ki14Wdf+7okc3bG2AKD8BH026/NfqvfRcUZAEyGb4JuArJ3yqMiE10F+JTAvZNtfGnDAS+RmHHvndL6WLPqMd7A9QbHvBP4BcwIrrN9COAtewZc7yoiuRh+urJAZDw668t21OkMNeiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725979914; c=relaxed/simple;
	bh=fn0x7MgdlzDXSnR/GHHGgpFnTBVxD8zVeMzV7TL9iXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bhvm6zsAzW6ig1YOOwZ16Vb00JIus+gLeC6usE3La6aGr1VgWlxlowyFxqMLStNsJwnrPFGtlHc6/+4p95JAXDLHNuhOrVBe6feGmvqnHR3idvcpoyhRBlnpV+b/X0m7hwyBzs/LhtLGZKFJQM8N1lWjMUOEZO+6Z1WbhtZLiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fe7VI2Qg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53661a131b4so3799226e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Sep 2024 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979911; x=1726584711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPNcqQDTNtB9FLYRVQUunHyQhw4bFfhZF9EYGYq1bPQ=;
        b=Fe7VI2QgHLLEH/eW42yYUXZBsZkGo0PrVGoyhhR4xj/aQmnaho52MWYfF8203NqDqo
         MvShYbSAXMAOXSugB60vSIY3YabcK3eYINoxwuHiz4y8IVDnoxCfVCk33tykoiSw1Z3M
         F372ETxgJmIQ/gGIm3gp79MYlz+zUgc7J8h6HQLVlrr1wpFlKnfKKu1SHmEDj0AymoSz
         77oLXdwEI/qcYOMgos+o/9oehVOrDTlB0BZO1ZLfGG8fk7IunfCwEhDr2HcGR4lOmb+t
         YCjoEkKFnf5xwbQ7EgxuNTd9Z49HWA7uq4+IDdy25z4xxL0OQ3prvIU4HK+FV0qYy13X
         SKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979911; x=1726584711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPNcqQDTNtB9FLYRVQUunHyQhw4bFfhZF9EYGYq1bPQ=;
        b=iUJQmccNLWrLuraat3knGxCYm68LboXp+MGJ9mSE6PjB3BBZnyvZ353+bXVkTuzf+f
         1nsiWZHmGsRK8gL9wmhsVFB/xrNmZWPHgtiOCMc58zqViwH5Qbc4oKL1+0UdSHABiP81
         TYxS/34XdhnJjX0RyBemm/uuAwUQaVTbYo6pul1PKWdriFR9gVffjMbUCboQVaLzmwbY
         QAj085XQCXE/2bkdsRkMFhzRaYBEp8wpkRU6T/FNycSgVWYiAFNZ26TDHI3QSSUDUq5F
         4AVQ2p6KAv8AZs1N5kAq3stYVIGZMPFWFta6zmvFCE35+heWtS7XJ+nchekutOMPfBmL
         2LGg==
X-Forwarded-Encrypted: i=1; AJvYcCUXIl3O1rWRmFjaDXb6se3qds9ONWUkAHLgXbj5pVecT8mmmcXRwVSOKPtwioTgT4tQJf3g6oPqhkVkI6wb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81xTRFQLCJqWlATf1Z9MfJk3hi7LPQkH9WuVGxsXl5hqfQjDo
	HfLpBwXCAeu1Kj9MT2HSHRzRjYYxlTEsyQx1jDQvn8RSd60BJm4hkV4cr7x7amo=
X-Google-Smtp-Source: AGHT+IG+AWbYy78KvM7LBUg2X7pmVaUk8Y1WznGe5KKIxbksdIDi5B3WPEr8BmPZ7CuQcwHnA7OxUQ==
X-Received: by 2002:a05:6512:b90:b0:535:3d08:5844 with SMTP id 2adb3069b0e04-536587a79b2mr9951482e87.6.1725979909923;
        Tue, 10 Sep 2024 07:51:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f86fb1esm1185204e87.64.2024.09.10.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:51:49 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:51:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>, 
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>

On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> Building with clang and and W=1 leads to warning about unused
> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I think this function can be dropped. Marc, your call, as an author of
the patch?

> 
> ---
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> index 0e3a2b16a2ce..c0bf1f35539e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>  	return dividend - 1;
>  }
>  
> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>  {
>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>  
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

