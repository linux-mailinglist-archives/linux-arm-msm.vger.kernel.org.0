Return-Path: <linux-arm-msm+bounces-46811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8EA26198
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C0A18854DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD5620D50F;
	Mon,  3 Feb 2025 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U57a3UNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40720CCC5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604484; cv=none; b=ViQI2rmiadi4aDbdH/NgSi3YLLE4UR1pgpHk9ZZGL8O38rIHeGWhR4v6aYP5jNfG0XibA5V/dO8NPyVPFaaaawvtSzQjOW4t0RlFRmQyQCKm3vbqLPZk0prqczn/CtUZ9DfGbxU6nJeulwnb2u9EyZsnPyx/mI9/N+QfOPjWB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604484; c=relaxed/simple;
	bh=z9pVmMeGmKTo76cVhM680EWq5pAOowzbKFXIbUL5tDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw/tK/csai1/D5dU6KGgykqf1QaQ2Y3yX5RQdtICAIafwr+hs8p2ogU+xFrWdBe50cRUPrTfHWq/xw8lz8hKwU+1QOHijEgntcNp+oaI2aPpCfAe5pAJZ5U3AVgaqMdmLBlGJJLQh7CgtnlUn3uz678NxxNU1pLmgQkEc7qDkI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U57a3UNj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54024ecc33dso4853582e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604479; x=1739209279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
        b=U57a3UNjOFDMnfcRmM6vMAC/v3LV4hzv2BnQvPT3VgnjckhPFLsjkiQw8XfAkdun3l
         Hi8I8ddA23KF86C2eW2MjGhB8HwzsSmMZmDx4zCCM/8Yick2Bc1m5bHZPj3VRD185jYU
         RFX/eutn0Y69jI0d+hGQF+ZOf9D7DPtbqVM9wm1F+9OSgJZkHZQhIPE4J2rakEdHS2yA
         Cc+mh2AZ9v3GldF8RCcw5Iu30Yyiy1bIRR+Ja4Ge/PIRZwADw6SIB7DFVL7iNyjhXIla
         uF+mDhqJpnOTUIkms3aVM78wjFgIzp7Kvm+C1L3cAJp4sgpmLuCM6mLwdAJPpl/vRDNa
         X9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604479; x=1739209279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jii2RT6Vdqu1kWiW5gEilxyPVOEgz8U9u99F97i4EU=;
        b=IVajP7IozDCbMlySm6qcvA8Em5pVJmf+hDtBnm6U76LCNUENQuaon3uPjFKunuQkvv
         8g1vq1qxLCEQk58corJYsZFnYHvEACSrZ0WCdNmc9Nn2WUgWa1R4zV4+cR4PTenyhov6
         SeJYkR/xxwkC8AzNaM5a7cdEG1Ggz3NrCFjqXHp8cZu1OLFvcrobyvzYkx+sbuJAyVl+
         WHrdoUNb3UCHgxnoJhis/acBk2bjIcz14SvzCecpzBmY9yWS9kqkd32zpdL9p/9BrI25
         Dor2rDRZL6t9Jel3PO1B9xhs3m7T9JtzoZ+C/rQrpylaR0FfoEPkJL9wWLZBgEHVFOk0
         3l0A==
X-Forwarded-Encrypted: i=1; AJvYcCVHbxCzuE2D4U+panOYeqWf9Z6ltwdJTIG/dD1G/hjioDpPxVTPWHrwDe+TF9rNUKN6Eu8hmBpbkyvchrD3@vger.kernel.org
X-Gm-Message-State: AOJu0YyT9yQMSKeTfBt3Bo3r0qEtIYQOReCIGwKIVNfdaBGGM8aryXDQ
	56FJGbKWu8OLUKj1UoUCno9IEB3Gb5OG7atkTpdD2OoFDlWme665rV0QUx2jd20=
X-Gm-Gg: ASbGncu/aZ/yP1kojmK+n9vWzhiQNjvGnA8Mmjv6RPcOEEMC2OIN87AvkM3+PkbhxZi
	7areucTbvFmy/jmZc4faeyWEJxKjWGO6ZHylJpzylS6RG0KfmplOoXfC3yQ26RR8V5Q79spJUC4
	nhRU84B9cTQ4+dRkg+NUtUkypHj4Jw+hZ2DFKFbOfzKiL95a/sOrPKFLKaeDWo8z2LOtHvvup1I
	a7KPyWx4oLT4bs/JkTqm2oGQNBGoTCnA5sq9uXDBoO6IfzbqoENeseLOXZ26tM3U5Dgcq9NzmoB
	A3vJSZq/a/NkIrtblT0WB+BMZUyYqpagz3TUcgIX15iGU+uALrYxfmDOadFEYmaRMWw6mvo=
X-Google-Smtp-Source: AGHT+IGMHXTAqiNtzIR1SWRvuj6gwq0wIP4uwvupjv/2fWX/inkjy/bcBUX6RWDJkRgSgVTBLrQfJQ==
X-Received: by 2002:a05:6512:3b98:b0:543:9a61:a2e7 with SMTP id 2adb3069b0e04-543e4c3fdd0mr8509343e87.48.1738604479389;
        Mon, 03 Feb 2025 09:41:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7953sm1340249e87.169.2025.02.03.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:41:18 -0800 (PST)
Date: Mon, 3 Feb 2025 19:41:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
>  
> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> +	spinlock_t pclk_mux_lock;
> +
>  	struct pll_7nm_cached_state cached_state;
>  
>  	struct dsi_pll_7nm *slave;
> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>  }
>  
> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> +					u32 val)
>  {
> +	unsigned long flags;
>  	u32 data;
>  
> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	data &= ~mask;
> +	data |= val & mask;
> +
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> +}
> +
> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> +{
> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 data;
> +	u32 cfg_1 = BIT(5) | BIT(4);

Please define these two bits too.

>  
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> -
> -	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
>  }
>  
>  static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> @@ -574,7 +587,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
>  
> @@ -585,11 +597,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  
>  	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>  				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> -
> -	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	val &= ~0x3;
> -	val |= cached->pll_mux;
> -	writel(val, phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>  
>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>  			pll_7nm->vco_current_rate,
> @@ -742,7 +750,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  					pll_by_2_bit,
>  				}), 2, 0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				0, 1, 0, NULL);
> +				0, 1, 0, &pll_7nm->pclk_mux_lock);
>  		if (IS_ERR(hw)) {
>  			ret = PTR_ERR(hw);
>  			goto fail;
> @@ -787,6 +795,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
>  	pll_7nm_list[phy->id] = pll_7nm;
>  
>  	spin_lock_init(&pll_7nm->postdiv_lock);
> +	spin_lock_init(&pll_7nm->pclk_mux_lock);
>  
>  	pll_7nm->phy = phy;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

