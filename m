Return-Path: <linux-arm-msm+bounces-50442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F1A542FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 07:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C56E188D0BD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35E51A2547;
	Thu,  6 Mar 2025 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zWRdOsAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF091A23BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243503; cv=none; b=dwxTIP17M9U66Md9vKlL8ulerb7DiIDgXI6qxCr16l7u524fnCpAudwc4KIRfrxdlZxH+/pE3vpxteB7wPbCLEGuWyiWB33JitQWeRcUZGw/HCJy9XbkCpVWoRUWnGqi3aurU9WHrfSJqxylvUAa4fqFtFzvsiVLbV9b/F/70zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243503; c=relaxed/simple;
	bh=y5E08rWlMslvB/K+XX3+OWFa9aCDHykKOGuGEwH0wPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSU8jpCJWMwsEX6LRQqkAx1yZfhMI2KWwtdQrP/D70OiN+REL1jqeR80mly97/NJ3pQGZ7btSY51hZzPjj+RwDFrusmmDz1t+hLavJmU6fWCnyyDtMiNVJSRnHiETlOQwcjstJ4/XAJucb+DPP6a0Z+8fCe1p/xevI5O1efXayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zWRdOsAb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bee1cb370so547541fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 22:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741243500; x=1741848300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
        b=zWRdOsAbSpLP57bPSWoFMx0r+zQrQGiv5gboBIy9QBL4fZIKFGoeHIJASrjL6i9E/V
         Xdt0nF8fERTaS0HUh//Z3i0fn1XkC8RIxL2s2sPDu8zU7dWb9fWx5TmnC9IHXUkED8VQ
         bCFkKOgy0+T+Ed4xGlaVpo+bLc69zbp/IxcWPzb6vM5QbDlRCUQP3YKmumM04IctHTem
         ar6wMqzqim7Q0jWFM5SKcRVZLY0uPnilGBF/CaidUVluPRNwjLM2GcLVa3WUahlCUWTu
         K2yxPBaSG+2sBmHfUaFqJdJVHYQGS2qW4t2jssy1FhJmY88U+93DLVrnqn5beEaXpR21
         wNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243500; x=1741848300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJcWTKFiNofQSBl8Y+/9Hv1NdwHNGxMC5GhCSRQfHSY=;
        b=OoesabKNVSiGj4pdMx06VQr7WHITVKzsQ8SFnIhPD3+w2Y6AYnHbX7RIOfm6MNxQJy
         Knk9kW0QUnRNmxi43vEq2lz/8DYaCmpSzgHtH2WYY6Ik90pidyD8g1MSemaiZQigakIV
         3aqYULmSv6ccAB/UL4A9HTXDzTWhRGA2TMnMGyHJXeMey2WeYd/dkvzhQhGhRh9f4AT/
         I5iBEqQHV7jW6EEDE1+QluOGilftFZHd2AxqGyrbf3kRXqqT5gQEJTWRZmnQW2AHPcxc
         YiA8tRILzWWCbFClbhGUdWQ7psAVdUWIjGSbvCypiGLUYHvje1VZiEDNdFfPs9qsm1nt
         ihPw==
X-Forwarded-Encrypted: i=1; AJvYcCXH8vZSkUgnq2OzyjGtiXvX/Ow/bTl0gm3unGgK4Ksh92jsiMXrpszaDHj9BpGGzix5DWTWQgu7V5JIZWif@vger.kernel.org
X-Gm-Message-State: AOJu0YwcasdQy+7dubuHIzi9gVGsIBwFu7oW6OUJwgCADPx/EfvuvxI0
	c4hTCnLEiB9S1/7oyh1PihgTOWanTw1TreAIUwHcp2N2aBCa7nobqaRdu+N5iUg=
X-Gm-Gg: ASbGncswSeHSfjrJ0LHA661/gQfOtAz4MMMwHRiHGUNAc0UQlrUc+ysnSGidU7SbuKp
	cURgV7mNMY6zF9HRPr+oj7iT+nNI5VPwYlTm2Q2SvrAlSpe+OdvSeUfk2ekSM5lB0OifuazIaYp
	LFk7kEpGi1F/2YF00pzdmc9sqLUZWnqSORDGMP6c2Ledz0t/9O/hO0GUPg7mwnVCjFb9vR81BZg
	YiEyqSp7cfKj94G4v5rwQzbWxZd5HKXeH8ADou7SA/BQIosU+pvgqXO5agl0dV78Yegoxr1zITU
	YIyVV0m8sfWsM2t8U5Pe+QaXqGXicJr0oKsLIltYbfbVce6LowesghTqeEdTKY/wyd28uCLUVH4
	rrLYAxRdypVUyczQGu4dBOEPc
X-Google-Smtp-Source: AGHT+IGKZmSCFgA/R9sb1yzYNL1vBOalW8LPwb3ZSbsOkodGM8bD2zIilQTAga0vyIRSmk9t4Oethg==
X-Received: by 2002:a05:651c:4cb:b0:30b:ee44:b692 with SMTP id 38308e7fff4ca-30bee44d138mr619121fa.33.1741243499788;
        Wed, 05 Mar 2025 22:44:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99c8319sm1034191fa.76.2025.03.05.22.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:44:58 -0800 (PST)
Date: Thu, 6 Mar 2025 08:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Adjust CDM_MUX to support CWB PINGPONG
Message-ID: <vjufkcrkungrwy7w4pxzsac57ilzk2dt3eeypzy6pna2z5ocxg@uf237ixu6kqq>
References: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-cdm-cwb-mux-fix-v1-1-16148ca6e4d2@quicinc.com>

On Wed, Mar 05, 2025 at 07:16:51PM -0800, Jessica Zhang wrote:
> Similar to WB_MUX, CDM_MUX also needs to be adjusted to support
> dedicated CWB PINGPONGs
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> index ae1534c49ae0..3f88c3641d4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
> @@ -214,7 +214,9 @@ static void dpu_hw_cdm_bind_pingpong_blk(struct dpu_hw_cdm *ctx, const enum dpu_
>  	mux_cfg = DPU_REG_READ(c, CDM_MUX);
>  	mux_cfg &= ~0xf;
>  
> -	if (pp)
> +	if (pp >= PINGPONG_CWB_0)
> +		mux_cfg |= 0xd;

Shouldn't it be 0xb for PINGPONG_CWB_2 and 3?

> +	else if (pp)
>  		mux_cfg |= (pp - PINGPONG_0) & 0x7;
>  	else
>  		mux_cfg |= 0xf;
> 
> ---
> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> change-id: 20250305-cdm-cwb-mux-fix-69ed5297d4f7
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

