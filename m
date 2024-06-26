Return-Path: <linux-arm-msm+bounces-24240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6386917B39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 10:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819AB281AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788FA1607BF;
	Wed, 26 Jun 2024 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jaBCE6ue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A6166301
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 08:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719391513; cv=none; b=D2IhKTvCu0Dh7Ai+Md3koIot0AJwqK12qU21keINo0jLgwgXyJrIs1t2wRosqyIyRwdQIFZm8FmHCvy4mk3aYh82mV/oxgMNpekpcekqgQCrBE6xPF7gz6lRNJEuw67vuN/HgwlhtjeknXO+426YXVhd8T7h/01SlKkLMuE2XI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719391513; c=relaxed/simple;
	bh=4TqMgPchaSgkEnGussyG2ZGIP6a6Rnch6g+F0GYql/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReyTHctu4ENyo6GOtb4Jo1IbQIsP9IhhKN3kXwIQbymaV4u/VN1yW4Tozfn+9C3tRD8aWUOAGNhuWBDgd+rL3uIr54x6ppsJ6y/Dc18C2oOXZsqrg+ZopyaVlhtNHwT1Ws61DeBKjQGewq4UMVCdRe3OGsJd89Sv8Aujx8DVny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jaBCE6ue; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52bbf73f334so5088970e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719391510; x=1719996310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzxdCXT91751HJvUEbEVilPPM8qkMSIeAMEqqDe5ss4=;
        b=jaBCE6uet1C3xlqnIbvRXwb73kgI7MffLkWNyc0wQ/G/5U4DI6VSZIbQGizoq4bCdu
         7sIOScL4eGZB58CZvF4y9t76CabNdNey9gyVVhakQSkw62V1pAoGThI+lkTUgbWIy0IS
         E4lQzBCwJHENDzxTMvZkRfsVfuztbBqhT3QSNEpy/yDEZMNHK+3/Ztu7F5OusDSYurZN
         fYy0Lj7Bozm+bBcDzqo2eWXkYOSNwHoiJuXDNmorIghnH989rObweyNaDAAw2zXNu0dC
         12VinN3Ai5l4LzQ+qbbK26wkdvpaRSxZSeejewY7U+4lih9Baw4VyfpSSDT4ExKmf/So
         Micg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719391510; x=1719996310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzxdCXT91751HJvUEbEVilPPM8qkMSIeAMEqqDe5ss4=;
        b=BD66Dtn1OZuI7pUuQMi4TyQERjfbzecbWadV3Gi2+O9QsdPGbZWolFkQHAy+/4mj6m
         Y141N67Y3gQzZ+gHkBpRXwRt1FIM6LzQtKhlWVKdDI1GSSYHZL2XY4dEEZnxZdAHSiXN
         hTxe7Z7TUkj1xmiDHmg2z4vb74unES5zyNkChOGttmudzAyNVmZNl3Qg1KvzvPSwKx8O
         08eQPxTkd1NNsRkglIB7QKtnJfH5KJtiGkmFoQTj4Rrf/OXINFxTmxM4VPrpy+updCbE
         SoxpC1XEYY0ar4POyI2hfjhp1BYjtxuv+mxavd/mF+KrqxcYAkoFpQ9fSBB9YyIX8oM+
         rU0g==
X-Forwarded-Encrypted: i=1; AJvYcCWmunyLS1bMuqnwY4MslB0+haCwP/9ykvdksmCBpN129USohXMVy7Hjk9xnIjMAi0wEAetFYFgBQwbQRPYrBghzRH7cyoFN0vZ0KDhFXA==
X-Gm-Message-State: AOJu0YwCs6Lrq315ZeHrmbwhChCzatOlucx/09gArBC8vOFp7zyYasQ3
	Gpcc54lNSS7RINkE7OsJs8/JlEtSH2t97wROFBrfyF0nMC90l1sRvfXpiP9xM0I=
X-Google-Smtp-Source: AGHT+IEfNnaYv5wFcwXGDonyXMCAQRs6U5hhIUgaupgn52qc7BZELI6S6uPQT6f7cTlAU8Kn7qOOxA==
X-Received: by 2002:ac2:5f63:0:b0:52c:a002:1afc with SMTP id 2adb3069b0e04-52cdf7f66f2mr6580219e87.34.1719391509740;
        Wed, 26 Jun 2024 01:45:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52db1a5b45esm180539e87.46.2024.06.26.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 01:45:09 -0700 (PDT)
Date: Wed, 26 Jun 2024 11:45:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix a7xx gpu init
Message-ID: <yrhlsznrz3zt72kjizwfoit7st3qtdpug2lgruzpjditik5kh2@a7yu6in37kvo>
References: <20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-v1-1-ff0a0b7c778d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-v1-1-ff0a0b7c778d@linaro.org>

On Wed, Jun 26, 2024 at 09:53:16AM GMT, Neil Armstrong wrote:
> The gpulist has twice the a6xx gpulist, replace the second one
> with the a7xx gpulist.
> 
> Solves:
> msm_dpu ae01000.display-controller: Unknown GPU revision: 7.3.0.1
> msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.10.1
> msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.20.1
> 
> on SM8450, SM8550 & SM8560.
> 
> Fixes: 8ed322f632a9 ("drm/msm/adreno: Split up giant device table")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

