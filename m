Return-Path: <linux-arm-msm+bounces-46910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C0A2822D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 03:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2798218857A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 02:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94553212D68;
	Wed,  5 Feb 2025 02:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nC3iPDc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA042AAF
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723881; cv=none; b=agdfICiVnEV3VrV0jyZBJY1AyVH4snG8jbkVZHRtkd9CfHWyEBr92sR1MuwY6IjFIAmtW4peAqoxmFtDTYIZATgTUjxqneApwKp40Rf7l7Y3HNlyYuKor4YlOEvk4y/UfMHfzkx8yYN/Gi/J8dToBbEW16sPaFhTxemCm3eurYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723881; c=relaxed/simple;
	bh=Dq9vxqrnT5RdZRZ4AVTNMHghyNZacIE6uz6dgCTXBfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4uooUlEj7mR/bc5fGvnTCmYKcbUAMWYcknwq3th0rxI1V6xfeQqY1WWUn+/dhWl6vZcw8GBY1CVK/RSc0boZfYp217t5dmLj48Xp88dWqPzy64iOwPmsJxK0x9n52SJ9mnLhDPpMLaXjkiB3WA+MmcccDNrynaCKmLaxaCgaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nC3iPDc9; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543d8badc30so6621873e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 18:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738723876; x=1739328676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sal9bpIT3EIK1E8XL8kL1lQntuyvQMLbh8ZI+Q+dMFE=;
        b=nC3iPDc9JqiIlK8vt5ZtqlPV6Sw9ryYp4yo2nAxMIBVXusdfWv7gSJ+gvFDd2Ekz8X
         veV9NFEaRrqJXkIl2v8hxNtjXZZwTsCpuXFrmPINyxDx8YeGmXdBMIdCdzf5HFWkg+23
         48yjHmwqhwRTlq7qJC6+jCtSnk1iloe+oiyo4mE+511pb1HjiUU/tojq5aYAHq7yFkSr
         IsnK8nRoukJNK7b6fPiEnbWbdlhR4zaEBJu9SrAnZpRCpdCevpY8VDzQ6Ov+Aqu296Rj
         /cU5nEgGeSx4hGPNgAreWUFx0W+kuMwHFCVa6CC9HpLijWi64Ox2EyoqVEGWt3M7Ebwr
         vKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723876; x=1739328676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sal9bpIT3EIK1E8XL8kL1lQntuyvQMLbh8ZI+Q+dMFE=;
        b=Qjy6WaPYD7BfXtfdGTlcuHy51O+Z/q0oPpnKeGEc79U9F2n9OoptOiACusao7gEz73
         n9nZyQMufWHrgm35h9OIKJUUGybea8u3JBowCCbTDxHMILQws/l1M0ZSYyCbodTFqdk8
         S12luGBLznGRyxYUos0kI7FJzxykPT+R+EGM2L/sqTLDuoHwINTBvVVqtkxWb39P7o2I
         D3HjYyLd2vclT5MDQZkzgjI6MBGWJnXrGHyyrcBEfgfg8eR0jfMKcyodCc9PKks+fKnA
         3GUQ8PbrlvzFtzK4PswEzRVQQv9wUeiX0qCAlvPKq4B6JQ25KxrfHTHhbjc9km/EQryE
         5EvA==
X-Forwarded-Encrypted: i=1; AJvYcCV4lQZHODkdoueWbA3zU6NSX6JgK6SM1JFRUsISIRshpVwD42EWe8PHnt2TRACxYXC5SQaJi2CwNKN3gV/u@vger.kernel.org
X-Gm-Message-State: AOJu0YwICREedcsHEqSwrYSBV/mtO3+5iiPK+w8DAbNmpz0rV+i7BZZO
	5rMJ2qHA5IlpOORyucRpabI3nvf76xdhDtq3UwZIUJFec5z7A3VjMJuj1CFPUJk=
X-Gm-Gg: ASbGncshVO6xdaR2ePsF5G7uXVtTHY94FJyHUVAcAK3SV7NYI3syftMg6OD5pkRP2rl
	P6tB2wNAm9B3jrYHx8lI2zx5Sikn3mLsiUzIjr4drtFavCBUw1abruW2MBr1Hi8WiWT3o0WdRx3
	g7krzflqlRn4g3tG67nHFRzHiqrLn1mPUs+TLqGR3x+BX3DMKoghGhu95x/3/RqHGhD9FcFc0Xw
	tx5fhBNfwdNUgtzYzdA28U0lReJNgqCLx2nkHxsVRt0Bu5DW+7U+1XREFpivg7esDkEaFcl51Zs
	Bce8SkCMgqXXuTK2EXPWwk5vj90G4C7THYZjhwMNpg0nPPIPJxmKpWGOhUIxyWUZxCxNinY=
X-Google-Smtp-Source: AGHT+IEpdwrVVWgvPZBy3RjGtkhwHF0kUa5g2ZWpU4E+/3fmvwNCNdl0KYdTFTnKWGKykH6xnSeS9A==
X-Received: by 2002:a05:6512:234c:b0:540:1b7e:7b3d with SMTP id 2adb3069b0e04-54405a682f8mr239139e87.36.1738723876503;
        Tue, 04 Feb 2025 18:51:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb782bsm1779544e87.182.2025.02.04.18.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:51:15 -0800 (PST)
Date: Wed, 5 Feb 2025 04:51:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>

On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >>>> clock from Common Clock Framework:
> >>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >>>> concurrent and conflicting updates between PHY driver and clock
> >>>> framework, e.g. changing the mux and enabling PLL clocks.
> >>>>
> >>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >>>> synchronized.
> >>>>
> >>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >>>> ---
> >>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>>>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>>>  	spinlock_t postdiv_lock;
> >>>>  
> >>>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >>>> +	spinlock_t pclk_mux_lock;
> >>>> +
> >>>>  	struct pll_7nm_cached_state cached_state;
> >>>>  
> >>>>  	struct dsi_pll_7nm *slave;
> >>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>>>  }
> >>>>  
> >>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>> +					u32 val)
> >>>>  {
> >>>> +	unsigned long flags;
> >>>>  	u32 data;
> >>>>  
> >>>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> +	data &= ~mask;
> >>>> +	data |= val & mask;
> >>>> +
> >>>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >>>> +}
> >>>> +
> >>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>> +{
> >>>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>  }
> >>>>  
> >>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	u32 data;
> >>>> +	u32 cfg_1 = BIT(5) | BIT(4);
> >>>
> >>> Please define these two bits too.
> >>
> >> Why? They were not defined before. This only moving existing code.
> > 
> > Previously it was just a bit magic. Currently you are adding them as
> 
> No, previous code:
> 
> writel(data | BIT(5) | BIT(4), pll->phy->base +
> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> 
> This is a mask and update in the same time, because:
> 	(data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> is just redudant.
> 
> I did not do any logical change, I did not add any mask or field.
> Everything was already there.

Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for
that field? That's why I'm asking you to define those - you have changed
bitwrites to the masked bit writes. Masks should be defined.

> 
> 
> > masks. I want to know if BIT(4) and BIT(5) are parts of the same
> > bitfield (2 bits wide) or if they define two different bits.
> 
> While in general you are right, it does not matter for this fix. If this
> are separate bitfields - fix is correct. If this is one bitfield - fix
> is still correct. You could claim that if this was one bitfield, using
> 2xBIT() is not logical, but this was there already, so again my fix is
> only fixing and keeping entire logic or inconsistencies intact.

-- 
With best wishes
Dmitry

