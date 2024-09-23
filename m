Return-Path: <linux-arm-msm+bounces-32192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0497E92D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF579B212B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C7B194147;
	Mon, 23 Sep 2024 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdYzs2V8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94706194AFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085515; cv=none; b=jMdHbqYJHWVVqbLJGGo3Gf+ACmHMzkBAFLDL7PEnXPWol5fmxvLOVt2JRhRAr32LyQsmoCbJZw6fOdyKNeEBvCEX7Ye+NZvcjCcebQhW79k3VeOhyDqZZcUvzKp1+HaIUNn4AtvPGJZkx/4W51J2y+1pTWqU9FI7IpvdEsvRRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085515; c=relaxed/simple;
	bh=diVA6mkav7S1q4H7HLbHC6FC3Js5JaiEdmc0yq5VF+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvhLtcGpgrU86qVcG24q2nJNDfnS+JaRdFVHBKuqfj9ewCA2fHfG1VgAk6hqBJ/8ABmcGz/tEfSvdvA21NsDfEj9UX61tYJTzw7AmqtwzwXXxNL3vvlSUft8wnPFBN6E57SmtJMmDIrSndvmr0XODRR1Ufpfg+n735NjKrnWIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdYzs2V8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365c512b00so4669061e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727085511; x=1727690311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
        b=KdYzs2V8cPmZGiTioQuulWsItpbVe7u+OgAqbehfd2VNtE+p9gJfiluSP6KEE7PsAc
         nl1Z7Lfw/DNfosQnkch4yhvD+PyEdHI1z6V+9nAzfh6PtDCQ4sqWhAQNHlO2lBQaILqX
         4FJxpn/Ca2tP/Cm61x8RD8GYH3KqtZanQnX2tWEUVdFjCGH+UZwjupeBV1WGqsl5+qQE
         E17Q0UQiUXgDz1HWchFRliPhsEg1CvpBWRU2tP23YI6ypCOd2tCW2pMER1T+wV7Av+Qo
         p/zSTbYcKNfzgZQ68kJjMKOdV84TMkrm06yV1O6RQ8m7KLOEHfNCYLWXEfKyWqg3M09X
         sgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085511; x=1727690311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub4XgTiDaTnG37jRiFm9Y2Fc+WlrLGpXlCWkejMfFT4=;
        b=ko5+S/GAYkOXK81rv9iqRF7jCIGVLlpuziwhC+cv3oTuuof8B7HcrsPObLpKAa8c9+
         AKXo1Kckd0y9t77WfFKdKq5jucgEBQ2znzUkc5kM0hA8WKOkOfLUkePhSBbZgGm3I2UZ
         XUOzX0/IVTr9mrsOg4qMgDXHczLUMC0eXKaPPsPRq/wdsLyyxsMEM1kTiMGz2kiOO94b
         SC35IBvh9iHMr4D+A24w2OJPa77/8bhkAiSuIg6rlGT9+3q4C1ngQpP1XM8ukELyu+5m
         k7TiHkSO+VYctoDYNqjlikQ2OHAsXjtGCUIsPrdHPCKmEW8iKyiw+1thiK1coIlaUBhx
         rgYg==
X-Gm-Message-State: AOJu0YzEA9WBOAbgrHZ0/DPamvy9yHCap0/7OTNuGeYOPqaq1f4Ck/kG
	HiGKpXj4Q/KgXweXd/Y6Dmo1FqjuIyqkFIc44wZY23r5Q3/4yqT6CPNS6OBcVYo=
X-Google-Smtp-Source: AGHT+IF70YCd6NPOg2g1uNWxOpDA5cEHVgZRGvQWfOhS4sHNqYU0tUy6qbj/ZoxZsUYtksuWhlIynw==
X-Received: by 2002:a05:6512:1309:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-536ac2d6909mr5891988e87.1.1727085510477;
        Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368709684dsm3220907e87.148.2024.09.23.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 02:58:30 -0700 (PDT)
Date: Mon, 23 Sep 2024 12:58:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
Message-ID: <utahvquemchnryqnbhuv2rfxqcgfowqqhjrbs3xtxej7ts47km@bbir4nq2mfwv>
References: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>

On Sun, Sep 22, 2024 at 12:14:48AM GMT, Dmitry Baryshkov wrote:
> The pll_cmp_to_fdata() was never used by the working code. Drop it to
> prevent warnings with W=1 and clang.
> 
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 


And of course

Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")

-- 
With best wishes
Dmitry

