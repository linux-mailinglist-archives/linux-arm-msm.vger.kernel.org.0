Return-Path: <linux-arm-msm+bounces-46867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F3A27441
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFFBA3A2CC2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C6720A5E0;
	Tue,  4 Feb 2025 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXpl54v0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1342E2135CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738678898; cv=none; b=J6IBo4wnkIzIupmjYV2MrQud0n/pnD6kpkfuHZixvdjAX6OfltrKu92iTzqQN+B+Umt9JGl+On8HASQuCR8UHO3q9YC9/NOEFHymf0CXcjC8QcRRyf5LEleUfmu608Hgu+X+hBYlsEYkcbKA5KOuvhQnvYtCwDjJC7DKLe19rwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738678898; c=relaxed/simple;
	bh=qrLP6bmdU9xwPaBA6pBFlO1yWZtxxW7+36Jh9jIgM/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tratK9EyrhlWXqKjlcKkwVoM3oWOoK+vdcYjejVW3zPju0XMJJB2/d1Lf1yet1s4Hk1o9unpAqftnaxifAQMynFkfxomjoBnSXJ9ctvhzamROZHv5chUzT4TKV++BP+IcwOXQ/E/4p9EAQMfw0/P1vkDJ2UesQkjVg+0+cy05XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXpl54v0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5785652e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 06:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738678894; x=1739283694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oi6tUx0/wzqbQ52cHEyBiqvPWzAr8efFA58lEXMvq7s=;
        b=qXpl54v0wKalJVw6co3OcgPVe83gOp9rOx4ZJHg1S2IOKweYw8PurGqbaTnnzYu9y4
         F5+Zs7urnRGOF1DG6YgvjzDg/Q7Yp6+8fM3yWy/xNTbtTWXVbNbVAHOupmVqnl4oliLV
         1E+fEDfUGdKZT5UK9A2UvOXp9JVLbNDgw6NnTqqp0InZ+U3QO0t4A6hiFXe6UmJw1QAd
         mqTvAz5J/7C2IPvy9dVj4bRDomKmYTue8hrOrjFr5T4ZjBQnzXqdMosOxuOD7qFnQ5Hk
         IcQ5aNrlawR4s3iM06OrqlmdZQTblOV4LH2mOLFpRr5SZfTBgj/l4jDhbuMIZRafhEG6
         3QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678894; x=1739283694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi6tUx0/wzqbQ52cHEyBiqvPWzAr8efFA58lEXMvq7s=;
        b=MyE54qddiV/C0z2RpuIE4i/tFMGkSpWDPbXGl3EBuO/q+SP6JrGOjb1Bx9mmR2sPqt
         k7kJcMXOu519senh8t8WHC1s40MHkyGqw9jM/bZFo7iG+DUGPmtABe/la+ZOl9Cyl2sA
         T5ixAeaPsUMbZoPfv0fyH8krQHszVrrOS2Exzr3RxYiU9EYghWqOXh+g2i8WZLPjQ3Gl
         6humL5NWHz/ID/R/SbeJOZ2YURkKM+d4m+9M2BF/QuKWf3yjZaE6e0vY/aVG52X2jNuy
         GJez1PUv+0JqHlf6pBXAzyb6kJzjc0GQabuM0iH+1PIfX2v/bqpH1wCqT5x7yJjPLX9Z
         8mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmFTjT3NU5arA9UUocrSiS0uE8NRTugUBIJH+mk6uXyGzosqzyq7LJFaD4YhSpzHQ4yJZ1lH+5r2RTTFI0@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSiWXg73E52fUHMNzlr3jzemuNaODmofCDhcBj9HfjlhjBovF
	t2Te0cELicK+LvrgnCh51g55V27ncAVcZNZ+7A9/j76W1HeePuNPpn7csHehwd5r/+QtQv0mwPS
	gwCQ=
X-Gm-Gg: ASbGncs+6hPw5ckZClSyX88Je78OAjC3PpSVCLZsEHEDOkVTwI10ST2yHBK8gF5kWGH
	4eKF3kFMmOiyTNRGKicGikH4YZJ7xK0v5g1qxjOuDdSeMJG2LHC5jdl/2q5dtgR216Xl7tJYkr1
	JQ8IIfmYydpePqsWlKPcclqpVa6zhvGAl43D3dOu0qVxSwJSiCzhyAsbqHX/EeYWt8/nrdovVLd
	e8Cqn6mJ7RDXH1p3vMMmPXsaf+9VHqnKHUxtgJgQOdwyN4zkheP9f8i3li6BOg00rAYg8NGm3GH
	/NDfzAn8HQSWpYdz2jJwmuhG2TdDGtRF7La2BmcY5OV8JgvDiObj0UzphlXVw0PwylAvRuI=
X-Google-Smtp-Source: AGHT+IFDRGI5VR5BcuN5nJ+zBTmiyxgvK65Wc13eLI6fmz9GDOmgId9YE/M2/7VVyU75pRkBKWfVAg==
X-Received: by 2002:ac2:4f8c:0:b0:53e:350a:729e with SMTP id 2adb3069b0e04-543e4c32e43mr6798589e87.35.1738678894011;
        Tue, 04 Feb 2025 06:21:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeb3esm1601521e87.220.2025.02.04.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:21:33 -0800 (PST)
Date: Tue, 4 Feb 2025 16:21:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Message-ID: <r3dur3sonbmpmchj4pmbeefe77iyfldnqgfztggxqh67mrjskv@sryo52xo2zml>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
 <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
 <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>

On Tue, Feb 04, 2025 at 10:20:51AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:42, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> >> divider clocks from Common Clock Framework:
> >> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> >> clocks side is protected with spinlock, however driver's side in
> >> restoring state is not.  Restoring state is called from
> >> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> >> conflicting updates with clock framework.
> >>
> >> Add missing lock usage on the PHY driver side, encapsulated in its own
> >> function so the code will be still readable.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
> >>  1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
> >>  	ndelay(250);
> >>  }
> >>  
> >> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >> +{
> >> +	unsigned long flags;
> >> +
> >> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> >> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >> +}
> >> +
> >>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >>  	u32 data;
> >> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  	val |= cached->pll_out_div;
> >>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
> >>  
> >> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> >> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> >> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> > 
> > Ideally this would be FIELD_PREP or a special function generated for you
> > in the header.
> 
> There is no header. That's patch #1 and I do not see how changing this
> to FIELDPREP is anyhow related to the actual problem being solved here.

Ack, this just moves the code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

