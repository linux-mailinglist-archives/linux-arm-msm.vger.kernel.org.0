Return-Path: <linux-arm-msm+bounces-20668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F68D1117
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C972EB230A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 00:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07512907;
	Tue, 28 May 2024 00:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqiLjdX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F617E912
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716857156; cv=none; b=D4wubz+13C9KnppUjXdh+qFEeEZSz0KSSYgdBRjKt/iZOAb6CQvsYzXnpdrffX6aprFROPdfnIChMEtaylY872YPCGw/TH8CNW1yVEEW3bAWwqegKXwSCPIh2jC0hsTCI2s2YZ8CVnLelSex85WffDMpzXEFo78AeV4DmUGs1W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716857156; c=relaxed/simple;
	bh=jVzkGsZ65uCHxBCV02bXGkUww6DDsHNwUbBPAaY0jS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioN/O68ZZ94e9LxsuETHHchcTl7lYY4fhr0WmQ1Ts6OE0vnajEO3SNzKIRjjrhy280dP3Gnbs6fid0+2D8PCIwG1D4+zdIvJqkPHz+TbZRYL9BzIqFEPHfAE77xEFd1x5kp/JrlKxNgjxJkJqwLYPRHIlaxLAdWIuHk8nXXXUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FqiLjdX1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5296935252dso329383e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 17:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716857153; x=1717461953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
        b=FqiLjdX1ksbl9Kz3S+P27hgGF46xSe9zXvNWusB8ccvSdtwl84wqlYQAXOOwnVlaYv
         OPcP1rir8/hqOwnCmXwG6/dfd4cQv1GVNRGh7NRWya9vH2waX60xhD+zVCfws+S1o2a4
         RwYuauFP/nd7uA4LT1mbwots7iItQ18gg7LVFoGmFEINyJQswL4LVoM8fDzEpm6mUg9p
         TDtquDPm+t5/daka2Nv2TZxJIHYyi4JXqzMgu4Q6tBNTHcd9aYie0q7rlEOAO21qznmo
         SzLONuTah1+002injP59Y1S+NCmfTVaPjxbXpwcCh6TIRk/ctN0bxWj9txsfGqBcXCK4
         WWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716857153; x=1717461953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOWy7EeQHptnyQiZmhO+uVmW6cGOWfsT+AnLGJBX70I=;
        b=Bzh1tPSbGPcZb2+YKKAcIwhSwcGIfVvBKH8/xj3vZB8dMGCdmjmy7oz4xFg5WA/7HU
         gWAMbVvk/omEuJvn5pWAfi5n3E09CrMPSh7/1ypySCmuH8droOqo+H14d5V7tpVNSIKT
         15vyeHcJGNcd7iax1Wgv7yQDlJzxOxgtZlxTb6Ca4pR8FGaKNvd3uvngm8k4B1rMH9t3
         aYk8sAgHCP9NCwpREpdAw6o/JrG7ZWYDkIWZIEY5tJ1sSrd8xqvxzszvRu0hgomUXLGG
         Ut8nBJ502FLFyUAHD6JjItiZ3KYVQSIHveFIrt5dxg7K4aCbeLKBCvHtfwrMiHC//SOU
         VUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCViokS7dmAoI6xqO8BoF36NFyV7GyZlyJR91q7ycUjXFfue+0PkGa6jppzeoyhHpeLRTApB49BVbnI22jGJrsVwGWMo8ubnqbO0flEB/w==
X-Gm-Message-State: AOJu0YyTd/qKf10MVR6faGuE5iXwvhvJ42Cxum7GyHRDmWkqOoGzx0ZH
	zoPCydJxNcw8LuX465i69MwvmCNxBlFZHhYx/zYxw6duUT5LrI5oBPUDSZHBXC0=
X-Google-Smtp-Source: AGHT+IEeVOq5H+mPCLvlXwPGTkXAziCy2DXE3RRA3lEao7/kITRzHNGqTbqSesNqPvwwhBkkwxU/JA==
X-Received: by 2002:a05:6512:2387:b0:51e:41a1:4d5 with SMTP id 2adb3069b0e04-529646e363bmr8255722e87.9.1716857153315;
        Mon, 27 May 2024 17:45:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066bb04sm812775e87.142.2024.05.27.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 17:45:52 -0700 (PDT)
Date: Tue, 28 May 2024 03:45:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v5 1/6] drm/msm/dpu: fix video mode DSC for DSI
Message-ID: <w5qtzevizjq3626uzhdnspefnojcludcdrbcbxnre2fxjfdei7@s7yqvofew3tu>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-1-f797ffba4682@linaro.org>

On Mon, May 27, 2024 at 10:21:47PM +0800, Jun Nie wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add width change in DPU timing for DSC compression case to work with
> DSI video mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

