Return-Path: <linux-arm-msm+bounces-48049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BDFA36185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D3297A59B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33919266F17;
	Fri, 14 Feb 2025 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1uniPrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C122F266EED
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546463; cv=none; b=puHGiU8N2KWULRIqwpERjoly9ikxGeQYAKlCDdEyDxUqkzJ+8/+z9gLX8qCo1wARm8JUFT3+P4KysoREkuzl28ctsrNt2EogpHllS9P6zhpy9q70ZgkyHlmtJcxQE5gFA0I202M/Jba95CPpLvXo5wKZB4WWU+dULRjvXxA2Pqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546463; c=relaxed/simple;
	bh=s2ed4dxhAcHLxAWiBMx1aLVkelooDVhuHjVkLeCVcWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUA2vmQgQNaqQIM5I8eIQL/G9udmmkF/mMxLcgn/IHdfxGoHuhSdAjnGcAPlkGMkDAhpZySkudl14pHPZhzO/S64rZAt7NN36nSbl/ffcPtoLtFj8AzhoYC2E5b0X4ni1jp4A3r1x4f4WrTAbzMG2VF4vD+kiFnwzKpHMhKq2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1uniPrt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3072f8dc069so22343721fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546460; x=1740151260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u+alm7ANPxaEHKbieUa+EyZgstYms8w4wOcWOnAHGY4=;
        b=V1uniPrtzjvPS4dEBG11kujGTCxpMR52EsL0tb+1N5q9HZmSYDkXQlRReceARA3WXD
         pAUY5rIk2OUH6TSuqE5hy36TJn1xOstJI/lv9YWGl5J35qy58LfR0/2dlZtWVzZDQQt3
         RFrYDxEUsyfqOGWW4lUVFwWybFpxSiA3cJAzko2JJZDpMkBtMufm8WLR/1ZXr71WA6e4
         IB5kSqynv2qJ6xt4E1Dy/G4oKXfEDuTVaeVEAi2h7t4/InRaku6blpW7Su2L908hveY0
         i8n4Kr/O3ubKCd+JkO0ZY4ITQWm1A0017/o2lCOJDmygf5yXlzFn3qavxn7ejLke4joW
         00Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546460; x=1740151260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+alm7ANPxaEHKbieUa+EyZgstYms8w4wOcWOnAHGY4=;
        b=GkI7Q+xn12d+m5WZ5BBk9Y5YPXsS8hqw3+V60SBVegM3sSKZsRB8Buq4+dRk7rO77f
         rRhm7o9z6qm+TP7HMwSTRy8f7quXPJznIMwv7430W01VQDAIxwZJO0PGGFLIeiALYx/5
         fVvjeH2yAhJ5szu0iWH0fQ+q4sFHC4oL3WwEr1xMtQF33/o0qboVdprthZiahgUkhvTU
         Ovm2lhDCr3LzY4s7zf7dW5YDhqF+k18RgeNOyPB7+VQpjrpxNdzDMyvmsHa041PMomjf
         piW8Vq0/Xaq7VmfgWgHxGqbrpt+V4ve3C5hhD7QV05p8HC3R4tQSFuZQ7f6VcNzhDShK
         tMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTxHwirnr/FBx0u9UbcyPQkiZxCSKnX88IJXUlnsNPv99BJk5lr4BkP0Ssf50M8BuxMiw5Ixs1TBIcL9os@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BS0jDM/RxVyw5XOU/NwPc9QbXa2n2ien6OV84eGhQDFiczcK
	9C6ij4E1gqGm4J/Qu+ubEEyc5mdxCauGM20fEBgWVQibgnY6nnTfRmzSYmMoJpo=
X-Gm-Gg: ASbGncu66kJ8Bqq4M3csnzZrf7Smow2cw0xXeC4tL1Qs1Dl/nVEgiyEvp1zqgKvg5vB
	uDHxfgZhu/LXqW3av/xUw0B+yxHzsvEgUp5ctky5Bt+Pfm9dHpCK+cINZ7PnCwfe2tDZ9CDHTVO
	t8nhS5AwIoCHG+q508LCWlDmFjqVdVFOSctxLPp2o28jvt2ex9hSeHBFgEjExgInUe4HkpUJ8w4
	hnTNU1hGldm91J3H8i7WCMebENfWU5l8DeyvlfJipSpxz+snkLEK6HZRIRN8byyAjBJ0K+A4w3x
	6kp8KaUUzDHAl8TpY0amXDz+ZcRkNKl8UnXp20TmXJMrcCql+Tcq1+SG7TBsGxwYqBMDeHM=
X-Google-Smtp-Source: AGHT+IGf/JDHOwptwq9aBdssKrkB2UDHATM0RmE6UZ1L0ih5y99blcApSprlvyWk9/7mxO1xfUKYMQ==
X-Received: by 2002:a2e:bc18:0:b0:308:eb58:657d with SMTP id 38308e7fff4ca-30903553746mr44817971fa.0.1739546459775;
        Fri, 14 Feb 2025 07:20:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b07asm5963421fa.92.2025.02.14.07.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:20:58 -0800 (PST)
Date: Fri, 14 Feb 2025 17:20:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <vuqd6hfiobmbnll7flgltiivhbhksgz6r4uaxlmsp6dvfgmirv@mt5zkhgfl5ak>
References: <20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org>
 <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-drm-msm-phy-pll-cfg-reg-v3-4-0943b850722c@linaro.org>

On Fri, Feb 14, 2025 at 04:08:44PM +0100, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
> avoid hard-coding bit masks and shifts and make the code a bit more
> readable.  While touching the lines in dsi_7nm_pll_save_state()
> resulting cached->pix_clk_div assignment would be too big, so just
> combine pix_clk_div and bit_clk_div into one cached state to make
> everything simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 12 +++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 798168180c1ab6c96ec2384f854302720cb27932..a8a5b41b63fb78348038c8f9fbb141aab2b07c7a 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -572,11 +572,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>  	cached->pll_out_div &= 0x3;
>  
>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> +	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
> +	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
>  
>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;

FIELD_GET.

>  
>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>  	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
> @@ -598,7 +598,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
>  				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
> +				    cached->pll_mux);

DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(cached->pll_mux)

>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -739,7 +740,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,

data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3)

> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  		<bitfield name="CLK_EN" pos="5" type="boolean"/>
>  		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
>  		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
> +		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
>  	</reg32>
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

