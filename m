Return-Path: <linux-arm-msm+bounces-21965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EED8FF107
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEBFC1F27817
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A712D197A7C;
	Thu,  6 Jun 2024 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXOHFHRb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D636019754F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717688684; cv=none; b=WZchGsYdT/g/uB1kve3n3rxzIpwbYi8A59c3Q2EcdBLNIJxMbEvn6tFOPRkaa0CtPULewlx61F03KAl+cnEISwuVfG20jXXDAEJK5w334P/UqpHaSQ/vc8iqlOIF20uM5X19mM/Wdl91diWw9E2NJRURBWeIGm4hag2yjayp7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717688684; c=relaxed/simple;
	bh=GK2TAzVHi7t+avHmUmGxuI/Ivtu5v5EspjOyIKr0EM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9oGXLamEjLF2sps7fZalekkkJrXhFR5u2dPESmzzCd8JhbISw/QNLyQ22XzeG6K/KhcfotEoHRx2I8ttrMWbi95a1w6NOH2nT1AeDIWzA1zXIez721FpoUgiNoSdEFahvie5xyUBMgaSjGLtDfByYlshwwMtKNgKmHL8RqG83Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXOHFHRb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5295e488248so1362241e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717688680; x=1718293480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcvLWtoAhuxv7+XmnyzWyh5/jHFSbk/UPbtacznbqAQ=;
        b=jXOHFHRbt09mM9B9tKrV+CFN1aCkt/ox6ddsiYAhEIu7EV2k8UB6NuaMmZhbWMcU6i
         TpQHgmlN+IAiTeikDkAY4pYaFhXJGP6k47YpEvlrNQwEFHUrwlfiRP5OPiQ/it2Jp+ME
         3yvkodRMX+JWFgHuy1/HhG6k2oYYhJ6CYMST3pyLbgMPHiKQpLqf9kSAYK+Fb/hSotKC
         ItvFFHipXubPO7xbLISCqHGS7Q7rMEFvAG49fAPlDzKHZE95NJ8qBfXJZgfoeHcPySn2
         LESo5bEOh1bdPKLomyb9iXEbX4vBzLXHkWyCanNb+K9Eu1//FfY5pwLb3sUEkaWLE+FB
         Ww2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717688680; x=1718293480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcvLWtoAhuxv7+XmnyzWyh5/jHFSbk/UPbtacznbqAQ=;
        b=P3BdhnspuNSTt1DZ8i1JwpzRYwPAZ3Gau9his199GK8As50QN9e32JG75LkATTSQ+n
         lPzbi4hDxCOWRaQ0i0sLyvN1JJ9JuvMTBrsxUSsZ7PdrxZJ8CJbESaEQoi4VhpG9+tTo
         bTxCvKN2Mfy2dEAZIlbPiUrVNxOEWdsxgp/W2DloE59tnPB2P4iMI4SeDK6JkSIwhyjw
         Qy9u4faW3hrCThW+8yCm78Q3iuAyfmkKanbKfVRKQGeDFnj45I3whH/yalgdipyGnzCW
         qibkwpGkfnmdpQzRFcQyvLzXqOqCXAoQkBds20QCQQdq+TR4E4dDMVgu9ZJSIgoxs4Kn
         TbiA==
X-Forwarded-Encrypted: i=1; AJvYcCWs12A8DZtL7BRc1mIvGSITozjQSHVhnwfup6Hymb5C/5Z/YFb64g/3+udqnkHWwtu2iA+Zk8qy+fov49ZvMMGPNTHfe24Fw4tqIeUQKA==
X-Gm-Message-State: AOJu0YwXnd/vVxDNaW2aeDSHnzi3vkZmDU4HDl8mniWmqtnqqW8nw0+J
	JLrc1R8wulvGWzcbHfuue5HRs99T132XYvtNojVQQBQTQMxGIdoRHECB1uuEMFY=
X-Google-Smtp-Source: AGHT+IGfkquA6C70zvNtH1bpeU35r9otrSSRpObdg1UiWOp9nLQV2leYilFdaGLb2X7iS4KqqbZ4DA==
X-Received: by 2002:a05:6512:3b8:b0:52b:7a3c:36ca with SMTP id 2adb3069b0e04-52bb9f7cbb5mr3964e87.27.1717688679984;
        Thu, 06 Jun 2024 08:44:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee6acsm227187e87.80.2024.06.06.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 08:44:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:44:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>, 
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	nathan@kernel.org, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <5b2o5hhq76pa322bum2td4cqqa5333d7rdxxsxulhalt3j24pi@ea7wzku5waf6>
References: <20240605183415.259276-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605183415.259276-1-quic_abhinavk@quicinc.com>

On Wed, Jun 05, 2024 at 11:34:15AM -0700, Abhinav Kumar wrote:
> GCC diagnostic pragma method throws below warnings in some of the versions
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
> option after '#pragma GCC diagnostic' kind [-Wpragmas]
>   #pragma GCC diagnostic ignored "-Wunused-const-variable"
>           ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
> 'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_0_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
> 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_2_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
> 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>   static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>                                             ^
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
> 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_9_0_external_core_regs[] = {
> 
> Remove GCC version dependency by using __unused__ for the unused gen7_* includes.
> 
> Changes in v2:
> 	- Fix the warnings in the commit text
> 	- Use __attribute((__unused__)) instead of local assignment
> 
> changes in v3:
> 	- drop the Link from the auto add
> 
> changes in v4:
> 	- replace __attribute((__unused__)) with __always_unused
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

