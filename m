Return-Path: <linux-arm-msm+bounces-46606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A520A24055
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5DA5168B5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0CE1E991C;
	Fri, 31 Jan 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XB3L0Z4g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28B1E571B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340741; cv=none; b=rC53rUas5NJrDCMkf9Re1fJ4EUPu6jzj4Mj1L18t0ZZzSFg9qqcL0GOjh7NFGTfl677GJLkKU7Km0AAx+5OrWUjoqUdq3YsrKXPhZ0dnB12+sgL9tlwg8uhB3r0cPtceYUmEEpKxcuyZrNJWp4EDkN+GYGQvNjETCeU4Omzb3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340741; c=relaxed/simple;
	bh=e+B/l7bCP7C9h0VKFjIzKy6EdxoujUAYOJIKocAbIrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr1mSjPrVum1ZmglIS6IBWYbj6GPuuBgDDKJW+k5JYfLSypIIMTuehzLRf47EcwHKQW2LlbkEGp7PxgXdjmWaHzwu3Hij36LoICgh1ka88Swyq/hKmvV41o1CzrO22XZAC4wsIfr9ZclZgYlfDfFi5vLuxnmF/e3F9sVmXkaz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XB3L0Z4g; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401be44b58so2330476e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340738; x=1738945538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b9vd8/l8+wYXFpqXqX8R06RWP6ry4k2O+3VX6QzghOg=;
        b=XB3L0Z4gUn8phy2PVtRD4LLHzsZOzVBEPKxxoIMOjghczuZvr/0BX7pgbAtDwbxZR9
         XbkRC+NxKfbP8QrUt0Brq1qS6U1tQkyKDkb+/E0lnJ4S0B97TyZZz3eAS2XKEvFGKmY3
         unAr+qpvC7DfTYbbG+GWxLqbwh8wKYsMQjZFd28dBaNMRBjTHNn2wr+agluqPPCATkM5
         7fqZHBUGUWFUpaBsKqYLvxGRnC2KjcOkPAQAKmPNOk6r6hchZarcA6+eLrrVQ6BBhUkU
         e28ytAh0cLd8i9VB9s1t+vTtdZGCxS/qwfNzS0hJDhApuIGPgQVL219pzvdGJZ1sDSjt
         UCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340738; x=1738945538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9vd8/l8+wYXFpqXqX8R06RWP6ry4k2O+3VX6QzghOg=;
        b=YZOzf0HODEmkVqV7J7ae+WKrlftid1VJDTRZtZiUXQXaRyGbuEu1ih9vKB5eJ7OBmD
         TkFUjdbe9O8XvtpHg+u0I+gX3liMwBoT4p5aE1BUozpfhCp41snkxAhGU7KhFEyxelYz
         SO6w+W1s6tiW3v80DLyRSa7zNxW1suQ45bWY5iHQqXjPM7U8eV+iQucjIQU2mz5qaGc3
         pr5Jzqh2GAIixCcX5dHWLuBdHcDVNj8/sbmBqEplYouXGP1C5gGoavWsZW3pRzP2TEoA
         hQrFjVDlFJfWdoPBpYJiLq3d1BX12yeEmVbJN8GNvHKRXC9hyrgJpiz1h1S1hMRd1uCz
         rhIw==
X-Forwarded-Encrypted: i=1; AJvYcCUIokR1X7Q+XeHcTx7ARfVXXK7qGztYWdRqzCOiPiFbedjzooiacODjDJ+yd9jbxiaqAS3lYPv7CaT4KC5+@vger.kernel.org
X-Gm-Message-State: AOJu0YykWYIUzaJoDaeWQj5WSeZp1mPZzQuUX8C/3NPmezO+eMUStCa6
	/Vu30N38xTr34QpsoyFh1v1ewPLqkWRB7tyBGm0d2fqcI4tkX6FDOKhUTYaqPvw=
X-Gm-Gg: ASbGncuegXWiKssdFrJyHsJvR8bYOlnCFS0QpDUj4JlQSnvYBBxIkYefFf36s3BvdRd
	Hm2OUZY+QTYipAX09AE7ivBheMHRtUubmQ/LdYXrGXlwlXNNMNbCPORUSc6G3O+WaJx7Knme0Dj
	vhvAtZQDZTHMw9wF5U5rGvWI554+8xfUlfBy6shG9zRuEurKVyUJeUJsbnZ7cUAfyZv1DKh0mVm
	TpoEN7qFzmKBJ5dGiTjn0IeeMset/pje5/YDE3T5NueSgMs8hGXc+MTKGZ12VX2K17TDIo3cbk9
	/0jbglxZuCShJQTRhkzNyGG+ZiLG7GjRoTRzjTvXGnlziUAltlUXhvmdQvNkHj8jPnhYEPY=
X-Google-Smtp-Source: AGHT+IEnb8J/vWpEj7xWQEo7oH9oqERPA03G2zfqohO9kVZWC2hAmVGzn3YneXt9Fx1uYeU0k889xQ==
X-Received: by 2002:ac2:4d13:0:b0:543:bb1a:c13f with SMTP id 2adb3069b0e04-543e4c02fd1mr3474942e87.28.1738340738137;
        Fri, 31 Jan 2025 08:25:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebef13sm526644e87.255.2025.01.31.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:25:36 -0800 (PST)
Date: Fri, 31 Jan 2025 18:25:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:51PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> clock from Common Clock Framework:
> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> concurrent and conflicting updates between PHY driver and clock
> framework, e.g. changing the mux and enabling PLL clocks.
> 
> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> synchronized.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 34 +++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c164f845653816291ad96c863257f75462ef58e7..6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce 100644
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
> @@ -381,22 +384,31 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
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

PLease add these bits to the corresponding XML file (here and later on)

>  }
>  
>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>  {
> -	u32 data;
> -
>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>  
> -	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -	writel(data | BIT(5) | BIT(4), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5) | BIT(4), BIT(5) | BIT(4));
>  }
>  
>  static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> @@ -574,7 +586,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
>  	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
> -	void __iomem *phy_base = pll_7nm->phy->base;
>  	u32 val;
>  	int ret;
>  
> @@ -585,11 +596,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
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
> @@ -742,7 +749,7 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  					pll_by_2_bit,
>  				}), 2, 0, pll_7nm->phy->base +
>  					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> -				0, 1, 0, NULL);
> +				0, 1, 0, &pll_7nm->pclk_mux_lock);
>  		if (IS_ERR(hw)) {
>  			ret = PTR_ERR(hw);
>  			goto fail;
> @@ -787,6 +794,7 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
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

