Return-Path: <linux-arm-msm+bounces-46515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A4DA21F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 346C518844E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5252110E;
	Wed, 29 Jan 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KWLqou2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01B367
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161069; cv=none; b=JakzAED0de7QlMeJ7aV1Scxbs/P3Mz/OtTMBLJkiEsj6snfYGSiEV6aX3WGPTVswVjzvogoICDxmCbuTsG+B+WBYEljSE2NWw0uKfhHty1aomNX91YoZrKOSneMCuaPfigoomBkkSnG4q1AJsLrmnrZguaa74ezDNzKV58YNdjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161069; c=relaxed/simple;
	bh=qxPTAcisoQDpVdFupmLwBplqb0gawsQjilmvOQX5qPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k37ANgGBG9bxlWEDRPtBWQnR7h4EOdxJGGs9WMpq4EkGH0NteUR3j1Yduwr7S+ZoWXRmhOEGF+Bu0GNU3+rMcZw0CMUbR394D0L3Xl/5rMmSxDZNz2i89ZywYCCUcgEO3g/uXWaPsHOZa176j3L7gtrwoazZvM51DMK0mRdjwVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KWLqou2d; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-303548a933aso62581441fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738161066; x=1738765866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVy4t4cB0UKE4FfYHqIFPU0/jXfWjWZ0p1/3jveveAc=;
        b=KWLqou2dH8FTK2mtvfiGkam63CubB8+X6zk9A0vk1dpHAUj9EgltxqOGCnZI04v7P+
         ry23qNRXNQHQ1i3fPQmOjG70/gsbCpd9p7NoywVAS3abYw04lUr3v+gKUp5y+Qgh8Ygw
         wsrAJiNLmMsfbsPAtvbEQ9EpOJ3Zhw70dYLbXpV6dcWOcC3Z0xXyDB9f3lhRkwYGpR2x
         Y0h9r4OSnzMnu9lStKNRh+nWlDDTzS4AReLaOXeLYnxPl+lQ4/nD4h38URO3byxoFHbe
         qNNyLqxsFffUHXwLUrFVc5pMMCsP/kDxwo4AxA5kPhw/K+ezuH+yYkr3INqKMH7MyjW0
         SMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161066; x=1738765866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVy4t4cB0UKE4FfYHqIFPU0/jXfWjWZ0p1/3jveveAc=;
        b=OjvjmbAjoXgcnPkvaX1J29V7Sw8fPlEd/q57eLVAGjVjbPN5vsHnLJzohUIaBd0+pW
         L2fk5DX0p5zylKivvd6YSbQOVLb1VbUkBCLol4cuwV8j4tEjI65oVG91z6T5xD6byaMB
         D0rk7iY0M/nbYYZLaucWj+T7Yf7i768ov1aTJ4pqKyN74W7khzbdc99QU1iQp9BKD+Hg
         qVEoDfmV5Ipyx53GSVHjUJH/mbzOjl/jVWK6rUdkTymJHZ08f1JdUmVY82+XIelFSdql
         CC/60LsBiV9V1P8yMNHPLjmRH0RdVDnai3zYiOQ+j+zVg0clomkWsMEjTLccHV72eH0t
         p9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU6jMeJ+t3TLgDMS6r8JgF2S7vP99f3myzhuWU7SpD0WnPI+TNTGFwfg0oP4S01Q0E8e3ftLFbfIcYuCth0@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAdKHe7p3wCdBoEan/9MbbWIk942qYBVKj3rjikcKkXjEZGOg
	iA4ggcOcuiW+hnuoDWyfVJTS52RkL5vK9BF9tgW+MOybY01LVDbggAszejqyWd0VATwfiIp0wfZ
	tc3k=
X-Gm-Gg: ASbGncv9BRYauDyuD2IDqC4FDp6JWnyeDLRjLNEK6u9QNSTZadS1iBOeDEU5w1SHoKe
	ATQZRQTIvmjoh+4dVJuryxVbssfXYOk32ET9C0pTsY5lLiGbF+VRXQz0zBEvm33EHrN0FYPNS9O
	VHefZMUEOwd+c0yPPl+auXrxYJBtgYugEzNyOV/b3sHbRtNeF1PG9PSEL3NX4kFup2yVEr+f25E
	tf+P3poaYDnc9joYoBU8b9f6WL4GNpEtivLFCJEjE0pl/ou3LoHkQQlIFt5nlusAHrddUhZNoj0
	l1Zx94z5iAtZIPJhfZtBZAB2cuL7CBkgCcmtL2VVFLIo7NavcK4zwRJ0jfsDdB3USyi/Pos=
X-Google-Smtp-Source: AGHT+IGiFX0DAOip+lO73WcET9swpVWNQ7eiRCrLXIVYnD59II5BJCbVk0x92HCSNEMStqdqKSHwqg==
X-Received: by 2002:a2e:bc01:0:b0:302:29a5:6e01 with SMTP id 38308e7fff4ca-3079680c529mr12837351fa.2.1738161065789;
        Wed, 29 Jan 2025 06:31:05 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc18ce8sm21731551fa.67.2025.01.29.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:31:05 -0800 (PST)
Date: Wed, 29 Jan 2025 16:31:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
Message-ID: <kdnbhw2ng2kuhm2ynlmtxz4bnq6j243ktqwfvr4mgrr6w5uy7d@4j6cictf4tpu>
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>

On Wed, Jan 29, 2025 at 12:55:04PM +0100, Krzysztof Kozlowski wrote:
> Since SM8250 all downstream sources program clock inverters in
> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Not tested except my work-in-progress oon SM8750. Not sure what is the
> impact, so also no Fixes tag.

I'd say,

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I didn't fully test this, but according to msm-4.14, msm-4.19 and
display drivers techpack this change is required on all 7nm- PHYs
(including the SM8150).

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 7f6fb2a840d2..6646f8dbe457 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -326,7 +326,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll, struct dsi_pll_config *confi
>  	writel(pll->phy->cphy_mode ? 0x00 : 0x10,
>  	       base + REG_DSI_7nm_PHY_PLL_CMODE_1);
>  	writel(config->pll_clock_inverters,
> -	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS);
> +	       base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS_1);
>  }
>  
>  static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

