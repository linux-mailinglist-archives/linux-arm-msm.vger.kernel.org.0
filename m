Return-Path: <linux-arm-msm+bounces-20029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 355278C9427
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 11:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38AA2816E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 09:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8978522F19;
	Sun, 19 May 2024 09:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlXQ9+tN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27704C8E
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716109294; cv=none; b=t8SJQuxp/UKOM8KgkV09LNNf6AEhQ/B3oBKQYRF3s9dWQL2+CD+6R/PDgOPVV8ZlLACGmfCJucUzNI+kA08CtW+k6LcH5k5ZAhq8m7ECZG0jt1ggDfRTuD2I5/dyPvPxLXlVO1HnebOMcXLwlqfYSiwPXPEQ3N55Yn1EJ6zLxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716109294; c=relaxed/simple;
	bh=J9hb1EieOotdwy6le5SRNSVIHsPXMfQxPpMua98WyyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XE55x8TGyddBV87/uCkVssseP9e3IKwgDEjKTjdfTm7B7pdzCtcGZBZP5OEdgLCJtXV1KAw+1pvkXcn3j9/nnMROUvHU9S8HdkeaDRs9aews6ntVp1ANCeyPOhuUNzNCQ6dOs6hYjt9vM9jmkRnVU5Bba8XzAjr71PUJywNF1/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RlXQ9+tN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f60817e34so3905183e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 May 2024 02:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716109291; x=1716714091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
        b=RlXQ9+tNX1a9f4udPndiHg1o1P0B5tnuNgjR0hNhBQPHtTbyX2UI/BYBGZntY7V0Hh
         NzobHhAznrhaE+EJJc3KOjf0S3blrWkbxqQf1b2Uf7vzKvrEOoG2UjMr+XOIcdfG21SK
         cANkdE3SWC8eK6JG6vfdhz4soGpP0xgF8BX3jRl3wcvbvlEY71gAuY+F/WRczxwcB3WW
         r/N1RDx29pxo1A514VxrxNzknNC+3vm5G3igzsqFiDfmOmFawOucOq21LMYjOpcxbPmf
         KJ3fCTgKhaL9+CP8jxcwrB/CvypXtZhPM/KjiT9S2JH/wEaU1x4FmeJV04gKtaRSNQNJ
         GHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716109291; x=1716714091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YSot/x5cFZB8ewE8eTJgK6YVMXZ1880kiMw+EZFqIk=;
        b=gXmGlAoJu8CKzs0gt8F4+bq3BGWRdHqAn/W6Py/hT/dNHcckO7ZFjNp7ZBdDlqzk5/
         zcVaNZlJqSu7E4sru7A0P0aeLut6KkgmFmNgfa6pIOx8svSNFQlui7WBzBc76YArW4k7
         S73f90GDWeG14ranu3OnGsRznCe7zzndOgV+XNWN3qhwJV/hMyDxQk1WDhBRF0fj9q3I
         irKY6TZEFr72FykjXarQsYvH91X7oedzwN+ExO8sxBE/Lj1elFHkyz7vCkbKvhrzwEGO
         C87nKssJfzqZvE99jR6XjmcwTJqnCtLS+jY9Hca3XqDlnonk8XXB00ApM9B1p8xjBQ/c
         c3tw==
X-Forwarded-Encrypted: i=1; AJvYcCUoOJ+tmiv5Ml8xxrkMEgpd3pFnTMUQ3l5jLXYvghHNRbFMvdylg5mtxG5OUsRQIn23TGMpzbFERwcZ2pdMwRmj3hvGNixlqja7/q5BPw==
X-Gm-Message-State: AOJu0YyHMDplUf2txC17n1ZIy228JHOD1TzTUbzqgK8PEknBJkD2/QR3
	wUqRCzhK+kV+pjIhMrPPWWmpYUjp/nNCbBrLD9XoVfeVSI7XpKyFv37sZX+DpvU=
X-Google-Smtp-Source: AGHT+IHo2lG2QfN3wSHOdCTPeob4sZG4UUob2G1FAI+cUqka9doJg1KkF/LYr2/BlXVeJ+LSz1LbtQ==
X-Received: by 2002:a05:6512:131d:b0:523:6354:881e with SMTP id 2adb3069b0e04-523635488aemr12970576e87.39.1716109291007;
        Sun, 19 May 2024 02:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad584sm3859393e87.21.2024.05.19.02.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 02:01:30 -0700 (PDT)
Date: Sun, 19 May 2024 12:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Nikita Travkin <nikita@trvn.ru>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: Check for zap node availability
Message-ID: <zqncrzat2adqwdbvtjzrropwvfmhplmhv72mzv2nbhbgg54byk@wbpgofmqpjtn>
References: <20240517195021.8873-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517195021.8873-1-robdclark@gmail.com>

On Fri, May 17, 2024 at 12:50:19PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This should allow disabling the zap node via an overlay, for slbounce.
> 
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

