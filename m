Return-Path: <linux-arm-msm+bounces-46870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B0A2745E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD6397A2A3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9813420FA81;
	Tue,  4 Feb 2025 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n84ZoAok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6257517F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679347; cv=none; b=UN7p6swwSVqEjhHBT9JcX+Iv+xPhMffK7tJ0OjslAcWzpl+5ifcSBrQ9VGFBEG/28h6nCvkCNBWkaOanjbE7tFojGeQslPPvYPvD2K5rKevB0v9o8yL5QbK8FaW3RLfTtaScBAS6QE3w6E/OvqzuLDA3FmkUpSrHqqAmjJf2cgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679347; c=relaxed/simple;
	bh=NBJRH26yYM7Wm6nLXjawz/KQQcsI48cVNhftnRcKDOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIPCln+6wSdwnC7lU9voZ1oY9Away1jNHpaCsu3zwnDcqpCmidQS+pcQB1HTC1zSlIZvhFagYFXsfLfWc+elRIsZtEuDpRjTjJXtmQs2sNVf+TiCvTIvUPFnEHCW6vDuz4aSqr1wI4yGYo89YrcekFKqZnG1RVt4eKI+Vk5dp5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n84ZoAok; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3c47434eso635095e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 06:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738679343; x=1739284143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=focBQCwxswdAVZ8Abbt2a80oqi/2vqTjInyZgccbIAA=;
        b=n84ZoAokzoDI+fs3gFnvG0GXe4GgEPV9y47AADlwUuYw0Dc2HxNSYCEHVWvHUYdJTo
         0OZOXk/XOnomcXndAzP1NwOSNzWtaq/v+O9L/CFZ+uSzswVvyWvS6waHy5OG5mhbGOMz
         Nou8v03DvQdmj6jHoBI6h9DtI0C5f8EkWuVUQ/pc3Wy8monq8xKmBxHpkBht4UkhMqU+
         7sz1Wy6VZNDSoHU6hQHkcGAEzKFq5Mi1B7Rk20hNrPkl46esIIqAORjZlfKBvfiGubZ2
         w+FBLgkvT5WtXf/aPGkRHtJRbm7KhA5uNi78/QPqFKsQ6f8k1OcGMYJsDwOrjwr+Tfhz
         AhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679343; x=1739284143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=focBQCwxswdAVZ8Abbt2a80oqi/2vqTjInyZgccbIAA=;
        b=eHQAHotZhcX2AtIkWD7sP7VTRq/b6J5Bybaw6mLYFGeoKwellgw5GxILEAP6NhTdB/
         u8mSAlcWyCBzYBxtzh28FR4HVZXwVvypCi2c4QnESvYjSr9+vkmUou+3cMKoju2668DX
         62AcXwcsA3yLOtRjs1l/Q5pJRJXBuOFnTgFwrWZ32xluk2qnP5r7wJ/PBPNxJwE0Dmuz
         sIQOk6awXti5VQU9i4CsNDkQEDweOtvdnrhlf5mgaGZ2AR4iQha5MTcakTN5g0q56OeF
         ngj68eathhNAVCpa7ghVV17BgBDvSAQlzgJobMyYsjvnU2TzIEbFUSTNjXxetmeAfPk2
         5Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCXe/xMdHBzQtIJRGOoHBFt76OGLaoUbMVTS0WSRoqD8xOFXKAws/AUVxeog0kD/KxenAkfT45qqMFveemYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVot5RHev7J/DGTFPvm404QAtdotcDOnGcSjJzF3XHKaIRpnC
	MFef6fEk8mNaC4EeXnm+f++SEbn2+qmyKPzjqHkfuAvNs9ju246h+u3eolO6dCA=
X-Gm-Gg: ASbGnct7aT5XXD61w+ava5ZORsZ9NPFMURUlmmK/wM6fuI+fppGdkZQyEbyq2fSL+33
	YfksBTNO6rKAh4FxF23g/h1xWGGyMCPkqlGShOmMt1MGyzi1OW7wkTIBAvrK616eASEZNrJ017J
	pYnuZ8NCNpyB1HcqfwwFVmJb/kl5IFcJkzBI/trwuf7L6y1lzsZQwItUduZHE1eKfx4ye+ZHdhQ
	81edTykzxnE1h9fzy+909BQvdQniYDikoNW34il1LUArxeklxEWAmhfZD0CSB6vHwmE6w5ZaOHJ
	EiOJY1forpFeoRF4oQQ5oOQShxEzyrxIzHAvZRtMzagqakIeAl793PwFn1MSuxfktK7haxs=
X-Google-Smtp-Source: AGHT+IEC1O4dAfwm2RAvRMNkQGlW/UA2o/sGSDuis3tbSpMY5FqwwE6f9ZDBY3h24zAeDqxXdOmmxQ==
X-Received: by 2002:a05:6512:48c1:b0:53e:39e6:a1c5 with SMTP id 2adb3069b0e04-543e4c32c8emr7811652e87.41.1738679343360;
        Tue, 04 Feb 2025 06:29:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeb92sm1597455e87.228.2025.02.04.06.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:29:02 -0800 (PST)
Date: Tue, 4 Feb 2025 16:28:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
 <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>

On Tue, Feb 04, 2025 at 10:24:28AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:58, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:21PM +0100, Krzysztof Kozlowski wrote:
> >> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> >> avoid hard-coding bit masks and shifts and make the code a bit more
> >> readable.  While touching the lines in dsi_7nm_pll_save_state()
> >> resulting cached->pix_clk_div assignment would be too big, so just
> >> combine pix_clk_div and bit_clk_div into one cached state to make
> >> everything simpler.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
> >>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
> >>  2 files changed, 27 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -67,8 +67,7 @@ struct dsi_pll_config {
> >>  
> >>  struct pll_7nm_cached_state {
> >>  	unsigned long vco_rate;
> >> -	u8 bit_clk_div;
> >> -	u8 pix_clk_div;
> >> +	u8 clk_div;
> >>  	u8 pll_out_div;
> >>  	u8 pll_mux;
> >>  };
> >> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>  
> >>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
> >>  }
> >>  
> >>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>  {
> >> -	u32 cfg_1 = BIT(5) | BIT(4);
> >> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
> >>  
> >>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> >>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> >> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
> >>  	cached->pll_out_div &= 0x3;
> >>  
> >>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> >> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> >> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> >> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
> > 
> > Could you rather store these two fields separately by using FIELD_GET?
> 
> So make the code again more complicated? OK.

It was already there, bit_clk_div and pix_clk_div.

> 
> > 
> >>  
> >>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> >> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
> > 
> > FIELD_GET
> > 
> >>  
> >>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
> >> -	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> >> -	    cached->pix_clk_div, cached->pll_mux);
> >> +	    pll_7nm->phy->id, cached->pll_out_div,
> >> +	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
> >> +	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
> >> +	    cached->pll_mux);
> >>  }
> >>  
> >>  static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >> @@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  	val |= cached->pll_out_div;
> >>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
> >>  
> >> -	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> >> -				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> >> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> >> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> >> +				    cached->pll_mux);
> >>  
> >>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
> >>  			pll_7nm->vco_current_rate,
> >> @@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  	}
> >>  
> >>  	/* set PLL src */
> >> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
> >> +				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);
> > 
> > use accessor function from the header.
> 
> For which part? for last argument? It will be almost pointless, but sure.
> 
> 
> > 
> >>  
> >>  	return 0;
> >>  }
> >> @@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >>  		u32 data;
> >>  
> >>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> >> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>  
> >>  		phy_pll_out_dsi_parent = pll_post_out_div;
> >>  	} else {
> >> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> >> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> >> @@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >>  	<reg32 offset="0x00004" name="REVISION_ID1"/>
> >>  	<reg32 offset="0x00008" name="REVISION_ID2"/>
> >>  	<reg32 offset="0x0000c" name="REVISION_ID3"/>
> >> -	<reg32 offset="0x00010" name="CLK_CFG0"/>
> >> -	<reg32 offset="0x00014" name="CLK_CFG1"/>
> >> +	<reg32 offset="0x00010" name="CLK_CFG0">
> >> +		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
> >> +		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
> > 
> > Are there any sensible names for these two regs? It looks ther are
> > not...
> 
> These are the sensible names. That's how they are called in datasheet.

Yeah, that's what I had in the register file too. Then this part is
okay.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

