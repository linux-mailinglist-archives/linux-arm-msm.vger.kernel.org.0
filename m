Return-Path: <linux-arm-msm+bounces-17779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D78A8F54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 01:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B835283330
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 23:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAC985C69;
	Wed, 17 Apr 2024 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mt901/BV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84F85643
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713396666; cv=none; b=pI2asyVJBLPtYmii5mAyCxTARTBZNWLWTQEb/bxuOw/UiLI1xJNqquFRiE5rjv+g9EFsN8SLdj2j8I7XAWyENW/g9B8wRvP7kLaso2t0QGBstoJgOHVpcjB7vETjcSSVi/OeHYB4BWcWfo85Udju4BOB3TkNvYE5HMUEybQgByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713396666; c=relaxed/simple;
	bh=+wnp08U/kyK8/mMyjzZ7MHT+WrYqgAZlIl85tBAgotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTefKkUYFnbxQ1o1AlTPLP5x+T5CnPmlrZ9s7FoTmJAY8i1if91Vi4xCE42qEDOi6OyGzOIdxw1h+HELfCei509FwEFZ+Yl2jc4+JqAiJAEx4GO/j/pzwDPl0NmlsW/D3Sp7jYCeVqT2aKXfkpzPRHD7tMmTI/D0WaXiSYW3c6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mt901/BV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5196c755e82so204538e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713396662; x=1714001462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoRisbGnaphvkOMl0BaR8O6Ht/Z9FTi+nAoLdKSqnlw=;
        b=Mt901/BVD9IfcqJBMFD2nd0S+y1XmXqO/3cdt92DOkgUUT47tvuYpiCs/PpI2h7Z7w
         Zlo3/5axXHgc2BFYSzwK29ipGMeI003MdUCvfbr5RGiOok7Yml5EUdPB4xxPl55yCb38
         zptFjrfHem2rhSaIa9Im1hX4gAN3jwMMDyyxrZH2IEQkGAArwrnAoetpgdKy+9VhkmrH
         0mKHgHGl8UxibaPhyBlfzRhH0mZIrPKUk2o5NOFwL12U41Bqv2FMkuanZDbpKOS6lkqS
         A13pLpYOLnm/KkVt8DXGTaIgvSWeb5R3sQhYS9GX9wUgH8uKddWDJSvMFWk3YTlOqF4A
         c9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713396662; x=1714001462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoRisbGnaphvkOMl0BaR8O6Ht/Z9FTi+nAoLdKSqnlw=;
        b=hN1ynPc5Y9Ort1ZUxpqekU4DGDrn/wYDFaXlVWOk5UQvzTbCJ8CcAle1eUsfbRVLp+
         oflWDaNOH+rBecnYmkW7lWw1EPz3wOxxuWH6pDritWiCzSUZy6vZivImDlyLwsr0umS/
         J2qSkaLJA+E5H9mWOLuJiuStv8gQALxoKlKZ/Pqmm0efR3jF5Mga1s+t19q17zFtYGQM
         R3dgRDe6dibXCvlyr4Aop+XvkN32SYmj/7LzLWDYTPAWqTJVGy1Q6eL6IKYOGVP7x97T
         2BOuCg5IVkidJZX3+7HGpn9KF10vs+UxhDtGcHeEB3i/YBgDP3L1rMjMqiMqk+jBYWat
         TrdA==
X-Forwarded-Encrypted: i=1; AJvYcCU2i2P+JuR0dopTrQNIHHIiDqs2fLuAPxx62zlGZtBnrf25JSsbTZsDv7nbHKpRwG7VYY3ptN0/1SyWutDPxDq68KVsSPs1DqhNKA2vsA==
X-Gm-Message-State: AOJu0Yy5nRW1HCyiyVsGbgmIGCy9s2duMNZ0t/gl7oK9NsPaPT1r2QpD
	7fL0o7KYqU+JO/WFmJ7N8YggEJGXjUW85TAUbC8Wet/0NUyHxshSyh5e0YUi1m0=
X-Google-Smtp-Source: AGHT+IFdNJlkHn8NQV8zP3hm/RjD7xvcRdfYhoYaJN6camRxCnIHqiip6JS4Fiw3DsaEK+EVXCYA8g==
X-Received: by 2002:ac2:4e4f:0:b0:515:c102:c825 with SMTP id f15-20020ac24e4f000000b00515c102c825mr352459lfr.19.1713396662157;
        Wed, 17 Apr 2024 16:31:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id y22-20020a197516000000b005195b134404sm34870lfe.103.2024.04.17.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:31:01 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:30:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 5/7] drm/msm/dpu: Correct dual-ctl -> dual-intf typo in
 comment
Message-ID: <76hjmo4sq6sfjgmnvjoienc5aij74pfjtwevnnls65kxinyaxu@y3yydacvcflm>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-5-78ae3ee9a697@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-5-78ae3ee9a697@somainline.org>

On Wed, Apr 17, 2024 at 01:57:45AM +0200, Marijn Suijten wrote:
> This comment one line down references a single, "same CTL" that controls
> two interfaces, so the comment should clearly describe two interfaces
> used with a single active CTL and not "two CTLs".
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d9e7dbf0499c..7e849fe74801 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -428,7 +428,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>  	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>  
>  	/*
> -	 * For single flush cases (dual-ctl or pp-split), skip setting the
> +	 * For single flush cases (dual-intf or pp-split), skip setting the

It should be fixed, but in the other way: it's 'single-ctl'. See
sde_encoder_phys_needs_single_flush().

>  	 * flush bit for the slave intf, since both intfs use same ctl
>  	 * and HW will only flush the master.
>  	 */
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

