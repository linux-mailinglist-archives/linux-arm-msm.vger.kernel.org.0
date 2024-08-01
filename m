Return-Path: <linux-arm-msm+bounces-27753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBB9454E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 01:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10BE0B22492
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 23:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368CF14D6F9;
	Thu,  1 Aug 2024 23:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGeep0n8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83A14D294
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 23:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722554814; cv=none; b=dSVComWzv8z1rABfw3OP71oQQ7C4Cn4akF6qArxPMhdqtGgffL+vOAAueKpfJzyRvYpP5Z1Cd4ElJinhdYOYzwYtc0e3K/sRSgMgToLPYzF7Q0w4AkiRbQ17DdVaLLKmpUP4Dm8uAK4QBMPZo2nHhVN5skWiM0+QKH/ijHzZZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722554814; c=relaxed/simple;
	bh=2COs+2CScpsMjyw2XQ+B14vKPr0ufm67TpkB8p3L3+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijMKRfyylOA0POG8Sffi5V1wndEXwFPm6XAoCWDnlHl7d/to3IOv+S4STeRSzCIseCHvqtTCaU8DwIjvO5GDik9zM67RjH8TP8jvqVciBrr4O5tUdC0uCjbVVEJW2DlbjuYDTXtEVaVDERiE4yx5cmFpqmB0O1DqO7apDJO/hKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGeep0n8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso85246341fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722554809; x=1723159609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2VEGUPDRRqhVW/PJkPAae6CRq9ZnKyovwy6ZCh6qQPw=;
        b=kGeep0n8kgNqKaASCLO8rx5bg6N/xKELmRIILVmiExvb9LYO31x96KKV9kqzGEiYEM
         REYO6NRcPlbl2dV4HFavtNIO4OD3PXnoEhQz7XS7GN1MsQz8wWs5OCVQyTB8OSZ/eSbg
         3ZxAQ1TFA4YVx3l41J2xUx4OQTIYPFfLBfQ8v2zx6IBhMRal93aafUo//x0sEG5fokUa
         q8qOR3s5PM3tT0D0stlQRq+5Fk46JBmK9H/PO9HUmY25lA642T/c/EhCq6XhEYZ71Ljp
         4vnVsCXKH7Tc8Ntu3dQjLbrvnfzhOx8Swb+Dn2+sxTMOtyY3UcvEekkU1IB3lm5U4NgI
         /gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722554809; x=1723159609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VEGUPDRRqhVW/PJkPAae6CRq9ZnKyovwy6ZCh6qQPw=;
        b=TVlRL1nFMnQ0TUm0WjyeUaYh2G5HQj+Mr0NfhNYjBNW8uOp5tu/0bWwqkXYxwJnvJC
         J6YuHd2QajBIza15JJx4EK2k/0ne4Yc5c356ZDHxsQrK6QHR44LLqulTiJA0+zYdJRlP
         LsU29aa+uvoIfHuFcyg+MF94Yrx+Wl467oSvzfPnIpPO8fpfCUVTBk/AlyC22z29S36U
         +yCLr+r1y5ldsKnpCuklrGQPyU0ayTSnw3yPIX3+gk9uJHYkllAD2x3MWDx5u4ogCczJ
         c69BPN2tKgIulYJHgDWZ3kpp8i/ecjA4uOYlTGBfavju6RWsT6a3aOn9ds6YFf2T0rCC
         LGsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJdFyFVzw/EB8JOll9Wv83eQvdbjKHeQIj9MLJVa1BBFB4Jp1AoaXGhMmDMbPrHMGn+TflvkxDzO8+xH8CpNmvG+knYryGpbHC0Sqfrw==
X-Gm-Message-State: AOJu0Yx96G6C7Lim00p0HtdX0OBKc3gdlG2p2qq9/bvsKJPusVJgAo0H
	8+y0FE11lORsQGvNnMflyla0GtRQNWYtlx4NSjrn3YbgazVaSmEjjITRGJVNcts=
X-Google-Smtp-Source: AGHT+IE4Mua+Rvlk/mPH7ZfoTa6bGdKOO4U17oj0KhChirq7ABB8vqTIToIdDn48zSCe17DTxHCx/g==
X-Received: by 2002:a05:6512:118a:b0:52c:dc57:868b with SMTP id 2adb3069b0e04-530bb3b150cmr1017683e87.13.1722554809015;
        Thu, 01 Aug 2024 16:26:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba3cfe3sm75233e87.281.2024.08.01.16.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 16:26:48 -0700 (PDT)
Date: Fri, 2 Aug 2024 02:26:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Rajesh Yadav <ryadav@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, Archit Taneja <architt@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: move dpu_encoder's connector assignment to
 atomic_enable()
Message-ID: <tdmzxhdd2hml4zrecawelmw5p2wrqqhzqoxip4wlbzmb2dvfpe@tmoinnmcpxsf>
References: <20240731191723.3050932-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191723.3050932-1-quic_abhinavk@quicinc.com>

On Wed, Jul 31, 2024 at 12:17:22PM GMT, Abhinav Kumar wrote:
> For cases where the crtc's connectors_changed was set without enable/active
> getting toggled , there is an atomic_enable() call followed by an
> atomic_disable() but without an atomic_mode_set().
> 
> This results in a NULL ptr access for the dpu_encoder_get_drm_fmt() call in
> the atomic_enable() as the dpu_encoder's connector was cleared in the
> atomic_disable() but not re-assigned as there was no atomic_mode_set() call.
> 
> Fix the NULL ptr access by moving the assignment for atomic_enable() and also
> use drm_atomic_get_new_connector_for_encoder() to get the connector from
> the atomic_state.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

Thanks a lot!

-- 
With best wishes
Dmitry

