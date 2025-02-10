Return-Path: <linux-arm-msm+bounces-47346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D229A2E2DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFE627A2662
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85D654918;
	Mon, 10 Feb 2025 03:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TncuxE5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B57EAF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158876; cv=none; b=eKOdAGKjOft6OqOZdy+B3FRg1BMehE7JJac5F3T8Ei7v1FJPyCrqofRXqfNiqNwmsfyhUyqnyb7i/sA5LeKQpO3bvHvarFN2u0Sa2/+zmbtLuGdNaPJBWtj/ATilF3xESSAHOMvnjhLycSW0R0elQCX5/4qbyzV/yhpyWp9+yDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158876; c=relaxed/simple;
	bh=jmiUe51uVwfNO7Yc9rbiTw/w9FGfidwf+BX6y6QUDkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bq/TgENnVRj+YpwaRifKUGOFG1Od5lumbYyorcayJGEKOK/dGlsPkO2aX/YdTQktdEJEk7RwJJkcWJHty2fCl794TuiZBlQcOR7+f2wp5L7f7jDH2rhN750LayV8ZaNHMX6QGIVHWaKr9kZhgezE7lvzwXJFh5eThJsFWwu6wrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TncuxE5h; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30737db1aa9so39791271fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739158873; x=1739763673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
        b=TncuxE5hWC3f3CFYs/Scb2745g85rgawqUwjez3nHFg5uIHVQ+1+XxpxwedQkHLxMq
         9jFSOqoulMPwmMcdNdCMlSvdyJJQTYHyWVRqQ2nbfMEi5Q7BGox7Nj/oTrWq7UpHUwVD
         WN4+NujQUmXYKm0eG3Rk1M4l7k+Bpp457uDqVUCXX+uojzf1HA+X1smAKosZ1riv2i7A
         8IJkuwnVteFesEXJ5WOkpIja+cLYWVE3cl4hXdOKNulwp0k9/S8vGfB26Qc9zOD1kimZ
         W62b6g8qiuQIADuyePMzwM38rdhubNeP2Agq/b3mjs8ly8maUqSOnjlWernKc4kSzYTS
         2Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158873; x=1739763673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npEs8jA07Ng6Z03mAEVt5n9zo6OF7AFtNoGrjJ2+5Mw=;
        b=uyODrHIakNhMx4LCC+nxQlx0XzQxIZrspCcYfhEyW5M9Oyr7OlsTKu2MpsNdAZrHsg
         kE6QW6AxOwGtN5VT4d1z09GC9JOf/ojRHqZM8HSWQ0aoDqhlFRr9q4ZbhdFMHbASsCx4
         CSRSatVpFzEYGjZVNSdVV57fUyHthbruqDZ/C/n2NZAkmXFOz7DfbhwBnBtGV56bAn4v
         MvmsJxhmduDs/JEaYOrpUagfOi4NQ3qS74R8PhYiagrRYhOyyWXae2OK8QchoQmHKMlT
         i4x39Vkb/Lvk48dlYDBgydPW757hzK3yQLH35BAJsWs69sKD7mtX2cOZdLQ8oIB+twYj
         J7bw==
X-Forwarded-Encrypted: i=1; AJvYcCXyb4/sLM/q26A6PeTBAUp1AGV2B+mOxRzQxBCB+tH7zJ51fWDrVOtCZFykHaSnqSm1qakl5kqlX0dyRabD@vger.kernel.org
X-Gm-Message-State: AOJu0YwgXNAxOHaQGcOXLdOHJpSYjkfpM24oEG4rwRY6z9WpYYZgc6Xi
	xgQhPqRKV83vvjW6jxn0qYgNUR/G8TSVFxoCSO0iuxsOzlxr2M7JA0SC4JqT+oE=
X-Gm-Gg: ASbGncujJcqfJja3gjDCHV5nKHg5cnF2Ji5NeK7/DhXOoLSgnmUdfp+Vk/vrahq0Y7P
	g6xlar4z97mcHkZCPAQdz6ovaGWv3eDRt2kM20WVavNikemZSTkFS2iieXhZPZXMH14u6eNPzZZ
	B38zGGhY12qUmerEfWUORJHIj4I9wYrchGyTSk7nYTQ3yilVSnwGqwK2wFrTV5XphDtC2f8Z1Tm
	6j/wr0lbfqbpux0hDNaqZh8bBdDzmsmaoh3ErCJufequzQ2BAcAzdwl+u/nhiRM8Ofz94LzX9Ac
	UDnNFrfuVsO4DmmQAxZaqXcbUOjI/eqLgxgpvCiL9C1NQRwuxshe/JHbOrYG73tMnvkc1rI=
X-Google-Smtp-Source: AGHT+IH7m6oiasYVqnzqsfHHyi3NYn+WrwlbtgfZKMfhDxmQoU4N6KPHZD2MhJ82kLTvoCVN0EbGyg==
X-Received: by 2002:a05:651c:1986:b0:302:3356:7ce2 with SMTP id 38308e7fff4ca-307e57ca9acmr39237721fa.11.1739158872958;
        Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f2d7fae7sm567661fa.39.2025.02.09.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 19:41:12 -0800 (PST)
Date: Mon, 10 Feb 2025 05:41:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix uninitialized variable
Message-ID: <o7yqskbm6px5t2klbiid7dklogrchyn4we2radaoznopupczxw@imywm2ngpoc5>
References: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>

On Sun, Feb 09, 2025 at 10:32:33PM -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> Fix this by initializing *ret* to 0.
> 
> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;

Thanks, but I think it better to make the function return ret from
within the loop and return explicit 0 if there was no error.

>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-dpu-c3fac78fc617
> 
> Best regards,
> -- 
> Ethan Carter Edwards <ethan@ethancedwards.com>
> 

-- 
With best wishes
Dmitry

