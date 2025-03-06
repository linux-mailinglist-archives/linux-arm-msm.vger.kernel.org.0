Return-Path: <linux-arm-msm+bounces-50445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88EA5430E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 07:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C9E16E78E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599CC1A01B9;
	Thu,  6 Mar 2025 06:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6ddBh2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DEC19C556
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243707; cv=none; b=aeuZW0tVYSAOKSZnTPjRGPdenqwUttHZfb41zy52bAJqs90+4oFxVWaByDtvBue4EAAQC9mrnCvbizh71lg6mSzWFr7UftByjrbGpu8lZE/8SrROenq8VhExMcuiFzNzWz/LQYLY/BLjq0HNZfqcvEO26WICPAeV53RpQ6MiP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243707; c=relaxed/simple;
	bh=UA0gi6dU6GWmRwcwBxSVb+GE50ynrzzdgaRpss5hpj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzaAY5Sagd5tDTnqG9ujQkzSDcSalPYw4++WBzUXDrF2ZDvCLaDqbVhpmoNwBqPqz9yUUSUifoIYvDtSPzWzCV8eztOSYgT0dtkSgb0rM1hvedhWD6bA/rhqGESR2FtJc6nuJBTx6/+GGvbaLJwBPMGtolkULmsGSMUYC7LWfkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6ddBh2Q; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54958009d4dso295550e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 22:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741243703; x=1741848503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1tgevcrO1W0sGqnA4Y17aruM3TaIseJYV5OzYAAywA=;
        b=C6ddBh2QxhQxk+P85gEIKgonqGoMppbsVssh7rJWuOKX9gxmfr6zcK7nIn4o1U8pgZ
         22nUZtZ0iO46ps42/XBv1qJaB8IlOyjFYvD3QhlX7x0RmmhJQYYyQBHOpBo13H3XuMaQ
         4B5misdN/5I2E/NAQxBHB6vCbIeYHoaK+zQkwTO9EQLnXicy7aWdDRgo1orr6mI8fX8Y
         0zUPPbCXVrs8qsFvoCNMk/PmPZlb466Jq3N6NsPVLkdF8KcLkr0QZiSe//+6UBcZqOTd
         43QfAJC34LD8hE3EcBZeX+NiHdam5Z85d2/Geki9jN1w96uVDd+gutVgLnd73FTh+9ey
         JGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243703; x=1741848503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1tgevcrO1W0sGqnA4Y17aruM3TaIseJYV5OzYAAywA=;
        b=ieu8UtFpvxuLIoiCqCnw3pKRgN2Jyi64lKVqbQa1588Of5yxFSa3ivSgXEikTCGJBt
         OgOfJu9TZNJdF5X7xseod/wGsPPo0qu5oTbD7c9NweQqOsCJQdOqnxtAlqtYRugVjvZe
         WJf3BRMG9XNMkV8vD/9AC/pG8Aqu7zbAqNUG1gWRP51kxSHIiqYqIe+0/YcnnbT9DE93
         ySNyILFL2RaZZPqZIiIEHYfv2cg0B+biW6gOExM90wB2qsquJrcWN5SaYJxfB9Cmp63a
         yibBQEgQXFQP6/TEtlYP2RrNAFGv+Wp+BM9yMsO7tge6zy3GIlw9nXT9CadhWY746ivU
         Jnig==
X-Forwarded-Encrypted: i=1; AJvYcCVIL6kw2lxUDQIiZpnykQ2dAd4UE31+yoWngmEORkfp0e8bmx+cszgs+cIVkGZU11iNC1faLj/Q2QXhTjYC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QTaqs5WZGj90QfVgpW1NgsQVr83KsqWXQv0TIzdymZST0jFc
	ChuCp+RkPquqxZDyT/xnq9LiQTXPcrqexSeIMEWhxHS0P8wiSxy5JzUnsxEZDV0=
X-Gm-Gg: ASbGncuaE51zYdTxi2s/xa6+ijqvgWr9SdT6fVBof9M8SZtuJ/DEdtpC6dSK8KcKNU9
	69W9orrzyVZ/H7yh32t6aTIoqfuJB76z60VN8dGX6jawb3UNjR9hsfV/6Afuv/icrCutbHosRg+
	HFx34QMQUm7xwIXR1+65/mBJ3v36snNRE+RSMXZlpCSxjuu5T4ynWMWH0SC6Sh9dxKav8SASyxp
	BYYsMZbawFeWXiYBz0cHbXxkbKglMMBuALAhNi0cdHwknRVEn6Xu471B9Z6NiJwsDi+OE7DNpOW
	G3ruT31x76w45AyfctSw29SoZZM3+9/bMfH+fuB54KpUgjIpfAX0ahCLkCllvCSrVUhbrHeFwi1
	GBCPKC3l38zjkdFge4n7lRYfR
X-Google-Smtp-Source: AGHT+IH0hkV0iX6P252sfEzSP5tCD+8r0VAB5ZE45IACRvNYvn/oK9vSvfMyEF7y7x1OJNcNv0ajeQ==
X-Received: by 2002:a05:6512:234f:b0:545:2550:7d67 with SMTP id 2adb3069b0e04-5497d376d53mr2072687e87.36.1741243703464;
        Wed, 05 Mar 2025 22:48:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae46137sm84341e87.9.2025.03.05.22.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:48:22 -0800 (PST)
Date: Thu, 6 Mar 2025 08:48:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Clear perf params before calculating bw
Message-ID: <mzkarsq7qljikfe3ef3hhasouee6hjmf4goqxmgbh2l4nsap7g@tachus6mob2y>
References: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>

On Wed, Mar 05, 2025 at 07:46:44PM -0800, Jessica Zhang wrote:
> To prevent incorrect BW calculation, zero out dpu_core_perf_params
> before it is passed into dpu_core_perf_aggregate().
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

