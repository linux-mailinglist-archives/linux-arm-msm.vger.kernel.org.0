Return-Path: <linux-arm-msm+bounces-46868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFBDA2744F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E88B3A2BF5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 14:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5CF2135B2;
	Tue,  4 Feb 2025 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PuI/7GO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FA211A24
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679227; cv=none; b=o5e0lBelVYhvtKqyMrP6dFXOqSzERBSsH9HkJv/g7VH9VCKn3jokSi+O9USt0+XENWlPSFasUhFTyZc5yRpRkrg0udhe8T+yz+/C7faBRjVLBhS0eiOVwl/hGFwSbjw/VJGs+xAZZXIVOfDJP3bZ1VeHfA7jsEXviGKksl2+p6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679227; c=relaxed/simple;
	bh=b6wxorldtDBUT5vWFim/Jjbn/AwS9c7kO7Mu6CPEiC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY6ctuPbzAtHDreXnCHm7loJl9fpG+tgmIubkIp4YEK8Pp8QHoMQ6RbXYfXlX3IEAr5LorU73qsPURbHw2wz0TzEGtlcl1Dp8vBKvGPhtGim1VatqhiW7wkQeLSCtq+VO2iw/kQUiqOqPQOPpiBAKAi+miuwf8uTqBQuDYYGXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PuI/7GO1; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3061f1e534bso57189751fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738679223; x=1739284023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
        b=PuI/7GO1bWCrm17sdLL+cIM3WapfvMw5IXk/MowPw8DB7tCc8X6uR+OeVa7IaI4pE9
         MKLVRj2hWd1p4NOMcMnwzZVXkheIhvkoQ77+s30e1zu7BD7Lv8d+MXNR7Uzozzj2j609
         QKqeTRgSSAswaR62hcXYoR/q2zX5x9yOx2TBA5GKoEwWv0qrqvqlWpAotegIMiEQ5vEd
         lV+nu25BINDzuSIMYitjq+hSoKo3lIEYspPaXgrxXjF2BlvUr729vwPLX7PuY1OAKeoT
         zaP1CiwtoaoVclU9K6aMm5JahhpretgCYoWR/4ArgvbWCYCGQODxS4B0hUn4IHZMm3DW
         O6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679223; x=1739284023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmBbaBkGKHffCofMrs0JVEYTBSJ+mN5gf9jQjReuUmI=;
        b=eRx6M6PGETKvH0e+Lyu+loZizBrJM6JsOTJjuzx8BGGpkD+p5AGQ8fJewhjol4FnWs
         0YXQ9rSBZlwOwyRPn9aSKD7JLx9CswYkMq788nXKEmu/pvasPzwNVV6Qm8Oqup4/bGwl
         mK+cCWt4rW8VPGVTBHTOVobuDiwewq8bYvwJbkdgXIZFZBb+mbsZ6jMNtDEhbJMxxlAC
         4cV4+yPZt+9ALGV2FR17NDZkjozfy7Qaimqp7EIk1Onn3Ro2mLDTf4NIUsPFJYY00bYW
         c2Ngzqyiwcx7zC4+5W6pTyaqAcnS4FwCuKQpB/VxQbCYmxZvzb8E/HGMkAxdkkFutZBN
         E3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXmF8VmmIYNcT1tFDtLxKe3snN76EIq7zFekvk/TALRJHfyBpBUBP/GQ1y/kktsK4bB9Ar0nzHTdGgu8NXm@vger.kernel.org
X-Gm-Message-State: AOJu0YwygM84eSXC07XaNiVC0FUihIOmnEwdu5QDCh7ArlV5d5NTTiCf
	UvZ7TKOCP9ibCNhn+yP6echoifeABxw/OLRi5Sm1VCjlLUV1e9n950wuwiZoW+lNlFXy8jZU7jF
	B0Ks=
X-Gm-Gg: ASbGnctmWB2/pwm76SZHTWmAtgQKoY6J56b2oMygwinsXuQ4AnW8AZBd/XpL0jJuJ4P
	coEHg+ssFtz5jV782ntMvB0zZBuUVFws9fDwIVuz7yEneZz8xaV5ZqyxU4oe0J3BphnpOkMjqs+
	/vgyvGXMmxkng2UW6eCe8X5jHs+9QFxzEBzS/K9Bd+S6agcskr1zqa1VGAnBRXv2KphgQhDlgtR
	0+bkleLLlRW2eiPDveHKVDfZs3/YdST+Oc86oCCU1yqzHPwa8+sUtMVnH9jw0WN9LsXlWnoTlhv
	ObUc0ob+BDaXw/lvybtViwNZtMEdvdKszwJc7LzJzHs4WUwSoFktjuncDxYPyilbksZcC0g=
X-Google-Smtp-Source: AGHT+IE8XOaYEj7jYvhNnwbtWQcvDKstTrzf5XAxQhgdONK67Y73izpEykGcxI07g33XKs4TMQ+cHA==
X-Received: by 2002:a05:651c:160f:b0:300:4107:6294 with SMTP id 38308e7fff4ca-307968fb853mr89129541fa.35.1738679222565;
        Tue, 04 Feb 2025 06:27:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f6aebsm18480671fa.73.2025.02.04.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:27:01 -0800 (PST)
Date: Tue, 4 Feb 2025 16:26:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>

On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >> clock from Common Clock Framework:
> >> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >> concurrent and conflicting updates between PHY driver and clock
> >> framework, e.g. changing the mux and enabling PLL clocks.
> >>
> >> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >> synchronized.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>  	spinlock_t postdiv_lock;
> >>  
> >> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >> +	spinlock_t pclk_mux_lock;
> >> +
> >>  	struct pll_7nm_cached_state cached_state;
> >>  
> >>  	struct dsi_pll_7nm *slave;
> >> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>  }
> >>  
> >> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >> +					u32 val)
> >>  {
> >> +	unsigned long flags;
> >>  	u32 data;
> >>  
> >> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	data &= ~mask;
> >> +	data |= val & mask;
> >> +
> >> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >> +}
> >> +
> >> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >> +{
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 data;
> >> +	u32 cfg_1 = BIT(5) | BIT(4);
> > 
> > Please define these two bits too.
> 
> Why? They were not defined before. This only moving existing code.

Previously it was just a bit magic. Currently you are adding them as
masks. I want to know if BIT(4) and BIT(5) are parts of the same
bitfield (2 bits wide) or if they define two different bits.

-- 
With best wishes
Dmitry

