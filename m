Return-Path: <linux-arm-msm+bounces-33867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C6998780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5914E1C20B4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5C31C9B6D;
	Thu, 10 Oct 2024 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="saeAksIE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFAC1C3316
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728566483; cv=none; b=Uv7Xvv5viLxurG5XDwZjjIMRssqTxT5h7tNlsAbPJr0aeC4YxhfQ/ZoRC7tNsl+tcDf3bFIIKYvXZGp4yOuw/g7XR9pHhfXEt4GaO4c62TArDwpyQjRgilj4z5qIiRM4L21ZfIS1PhtnO/eaUegwUROgLvE9G6r8m0ieikU4c4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728566483; c=relaxed/simple;
	bh=7DRDybXvi8HHlA4JKBozEkk5rZAUBYHz1N91SMf9M6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO8cobjtQj7clhm2YroESYjZHN4ORNF1QZuu5+tVQ/TJRz+8nl+WqWKv4hsZzB86QBe9T9vwCCTTUc2DaNXmb6AcESGrMYEKedeSppddDrRXHsNPDr8y+wv83bLBmORMnidGCoCkXjBGxGykfkdG/j09aEl/DBIh62lYTXsfG14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=saeAksIE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so874099e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728566480; x=1729171280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XigYU3sB/s2Rw0iXGaJ9OicIPQ+b9qifNZZ8fxL3Ss0=;
        b=saeAksIE1ygxOIYHGCaTNFT8q4l5+6fMSVYAySUZu0wyNyZtPh7xINgPhn9XiNbT1x
         ElTRKE6g1mmBNiuWXK28wQdHlQeCGjbhXIjFdhnNlynfCl9YrnrCnmEYIQt9CUi+hNIg
         G0IMCJUgF4qh/3oz3A0rHfq1XX9qg05JBwLaxWhoQE0uUvldn/8qZyq43iBLV/1uxqBI
         B45sEN/2iWDGxNLENwykavlX5wsFQhW33GALAZiwRJKjErS8ksNuOvV7aPYvTJNPtkHf
         +UbLg0IA1w7Z5dk8jXilrZI2yLz9lKYepftNausG7IBkt3oaZDj6zRFpQkK7mFMbays3
         G0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566480; x=1729171280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XigYU3sB/s2Rw0iXGaJ9OicIPQ+b9qifNZZ8fxL3Ss0=;
        b=uHfp0kjcR4W6TLO/91QWhrECI4iwvyPyqR5SSBiJ77Eh4k9cFHKI05iSrO8uGmsYYJ
         w6DwE5NKFMt6UnOhEI7jBOZFGryDahWlrqOGanw+ySKklTdba1CjCcZlQ2yFzL4D3XC2
         GXw4zYxjxcdnaY3/gyzjgqTFIsWYV9js3orDq6Lv6IiOeJzNtUfmgglwVleW5auAGVxz
         XKvn6LZzSGa8/Xbe54Jfk0gNbE+6q3+APJ0uE++cBXOzaJKNasCJ5z+2l46dr8O85Mbq
         P00097u1G9jZVjuF43911yPcZAQRa/jQj13RG0MKIvovUo1eHrZgVHrznpT0ey86dPt1
         kD1g==
X-Forwarded-Encrypted: i=1; AJvYcCVFh020Mq9UBFBlTrB4YfaxGp8ZFBoHKSWBjL2Bk7D1MUeclKkGDmNlWum0Q/mGjHPSZAfnWwHrgvkU/qXq@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQ1uebEVQd/dHI91HFs0HhDLi7Zh20qhvxf+RXm/OCNXXbBWT
	e8TZznJcMfb4Gs3GTgfVvIZpC7asZUzr+Cha2Z1qygNlXiw+m7YhOAaCUcI855c=
X-Google-Smtp-Source: AGHT+IF+YKWCkRaviw5WO8kAYdrmWTSD0wjNIqxxPvLjLHR42AM2SSftnbdZgot9P+As/E1/AS0loA==
X-Received: by 2002:a05:6512:2392:b0:535:6480:707d with SMTP id 2adb3069b0e04-539c98ab991mr1255454e87.19.1728566480282;
        Thu, 10 Oct 2024 06:21:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c11e4sm255304e87.10.2024.10.10.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:21:19 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
Message-ID: <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> Share SSPP info for multi-rect case if virtual plane is not enabled.
> Otherwise, the 2nd half of DMA content is not displayed due to sspp
> pointer of r_pipe is null.

Fixes?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 904ebec1c8a18..898fc2937954e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  		pipe->multirect_index = DPU_SSPP_RECT_0;
>  		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>  
> +		/*
> +		 * Signifies that r_pipe is to be used if the width of the 2nd
> +		 * pipe is not 0. This does not apply to virtual plane case.
> +		 */
> +		r_pipe->sspp = pipe->sspp;
>  		r_pipe->multirect_index = DPU_SSPP_RECT_1;
>  		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

