Return-Path: <linux-arm-msm+bounces-40740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D49E6A8C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C560528C3A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6513C1DF980;
	Fri,  6 Dec 2024 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwElul9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596191EF0BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477996; cv=none; b=e0sbN5B4zBogdCHlzK44hXUvfH19/d7Dv46sDozQrv1AvDo+yP661pXt9ZgCYERTZWEPRFux0E+zNeqtvpuQKxPIFbjSoI29hB4tpGORXAtcfGpY3HNPvhCKTHcIE5YVGNlEKqMnrpgPecjI2vU2GkZh/1UIrZb/1sSblnGQlb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477996; c=relaxed/simple;
	bh=hP9AIVICyv/HViIOvkl6GKCZizMiepmoi0uyK3av/ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7+4iLFYclhLIxWf51JCpi/WELARwGYPfUWrzUEVmoq4VOIR7tOeqmAlHqavPblWnDLAUJCdZfwGOUgi5uP8kE2bFxlp+a/Ad1vvtNU/zLQJQki+R48ukVdpbBuwVlDpycjOXc+fN48TXJA/y1C8fA1yjYiZXIRbwlPd4OHRWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwElul9D; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e22458fb5so1679816e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733477992; x=1734082792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lyjy+B1BzCuYPV6TYOZ9W+qMOzIQt8vOgPam9Y/pajs=;
        b=uwElul9DLy1Km94Rp5aTvm61eD509czFHJ0raIfKiaqvDJqz4nPak0iyp5R69Yhw5M
         mDg9Vy7BJ37irliuB3yhFdVqLi/AgWWWgN6RbSadwUCfbrdQctimpTPl+2ofsZlkEiF9
         mPQEwalwSfSeZwJSD03aThKX2l3IJl4P6zNDidSSX5jCML6ZfenJiyWC2qO2SfaDbqfM
         szzHok+0ovdFnZc4YZX5UepXDRJWEbP2/Gm1U82gIvrtZv/ryZBtVdfIEhlEijVm/2+8
         UZhrXpFjqHN4JWqpP5zoCs1pXg9NlI5qGek8YIBNFyOu8QKJtzNZkLRvttuNCdmJodWk
         ADdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733477992; x=1734082792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyjy+B1BzCuYPV6TYOZ9W+qMOzIQt8vOgPam9Y/pajs=;
        b=Mm2cmJwUTbGCvtFIctU6Em818dNcYqZr/e02Noe3ME8ODzU19/owsBa7rC6OBr2BOH
         AFTYm5qmnT/ALi4Uf7XRF2agRixKM3x1oqtZOTYGFBVSIJAYB8IQXc2Z4pVihIkR4MlH
         52so+xpc2MhHX1ceyeDPEDUI5xUg5DfikLdNQzTl4jtg9dZMxPvaV8rHqHTiBJqc7i2j
         60qXh9iIKPR+cSJ+gMniRqv8IgUtl5bXr/9ZTwHTWveOUocrw9ouClssOeYeknPy5nX1
         Ey/1s65CQFcn9RGHb2Ejxsc+F8QsY8hMvq43+I3MPp7JAKQyFC4GEMhTxkIBIcptROQU
         alMA==
X-Forwarded-Encrypted: i=1; AJvYcCXVbUcPu31vVQxarX7kmHZLsGYIZY8MO+bgcyJuD9ov2trQqubnlDInchb5e6nSOoNXKDQ83I+xrr3ps0tc@vger.kernel.org
X-Gm-Message-State: AOJu0YyENxKLs/pptECehQ7pJFuQiCoW4Tk3/WW3hczcxfpE3UB+JgOg
	IBVmnxqp4WQE3fRRMhJ9+IxQnzcVP2qhXBn2w9HrKltNj0/uQHAKOTj59orC90k=
X-Gm-Gg: ASbGnculsxxk9DtH3Kc4usbrlFoyQmqi/LvoFsA2+V/ZVGwSo+MzKkKGzczET6wqiUd
	xeTfBp4yy0lYM0G1nhJ4GFpPXYa0Pfyf84a9/da/bI2ks3sCrIYf8Z+BYqbYCgMDVmXO+x4pIPf
	49MeeTvpoxH/EOHiMNw6aby0Zj8p0UEFm6+tj1ixy0MbAW2AsDV7zEhHHNpEWS60g8yDKDK3HUK
	WDTybQoeLrYh0TeTLrqXYkxGDHNG/cNhBwfBXdZ/eTp7ldRkDCtTqDu/B8bS+pqL96oBYRecMSd
	hKX1qFz2lqg7wrIbKyo8Dywzy121Jw==
X-Google-Smtp-Source: AGHT+IGNBPdaS1w4uQtjk5trf2hXxJbni2d/hlEYqanCr4EtCYjz+uzjDBO9Y74HuWm6AMKmFcMGVQ==
X-Received: by 2002:a05:6512:138a:b0:53e:232b:6864 with SMTP id 2adb3069b0e04-53e2c2b17f4mr621540e87.2.1733477992487;
        Fri, 06 Dec 2024 01:39:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ca4aasm448445e87.244.2024.12.06.01.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:39:51 -0800 (PST)
Date: Fri, 6 Dec 2024 11:39:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/45] drm/msm/dp: add support for programming p1
 register block
Message-ID: <d6hwd3mktcgrczwiqmkuf53byjushkdxgadilcjb5dqu2sdq2n@z7tzffqkn6tg>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:47PM -0800, Abhinav Kumar wrote:
> p1 register block is needed for the second mst stream.
> Add support in the catalog to be able to program this block.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..ee7f2d0b23aa034428a01ef2c9752f51013c5e01 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -73,6 +73,7 @@ struct dss_io_data {
>  	struct dss_io_region aux;
>  	struct dss_io_region link;
>  	struct dss_io_region p0;
> +	struct dss_io_region p1;
>  };
>  
>  struct msm_dp_catalog_private {
> @@ -93,6 +94,8 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
>  	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
>  	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
>  	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
> +

Drop extra empty line, please

> +	msm_disp_snapshot_add_block(disp_state, dss->p1.len, dss->p0.base, "dp_p1");
>  }
>  
>  static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
> @@ -145,6 +148,26 @@ static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
>  	return readl_relaxed(catalog->io.p0.base + offset);
>  }
>  
> +static inline void msm_dp_write_p1(struct msm_dp_catalog_private *catalog,
> +				   u32 offset, u32 data)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	writel(data, catalog->io.p1.base + offset);
> +}
> +
> +static inline u32 msm_dp_read_p1(struct msm_dp_catalog_private *catalog,
> +				 u32 offset)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */

Not applicable to the actual function.

> +	return readl_relaxed(catalog->io.p1.base + offset);
> +}
> +
>  static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
>  {
>  	return readl_relaxed(catalog->io.link.base + offset);
> @@ -1137,6 +1160,12 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
>  			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
>  			return PTR_ERR(dss->p0.base);
>  		}
> +
> +		dss->p1.base = msm_dp_ioremap(pdev, 4, &dss->p1.len);

p1 is not populated for eDP case, it wasn't always present in DT, etc.
So please make it optional.

> +		if (IS_ERR(dss->p1.base)) {
> +			DRM_ERROR("unable to remap p1 region: %pe\n", dss->p1.base);
> +			return PTR_ERR(dss->p1.base);
> +		}
>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

