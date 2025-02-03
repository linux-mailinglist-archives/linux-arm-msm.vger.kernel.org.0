Return-Path: <linux-arm-msm+bounces-46812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98596A2619B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E9597A2594
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714D820B808;
	Mon,  3 Feb 2025 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3jvwDmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BE20C472
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604546; cv=none; b=O9UelI4QEnU0gglNlMOG4vSEPBpYxrmENcWgMmUsQWWMjDPGRw+1QIwszbs51ghx68csM9ZEUnLAZsnwrjUb400LVtRx8rFs4mIPjJegMVKtZrd5lVVyDJ8/Pq4Jo2VcDZn5yRDth5lD/9cAWvVKikEPA8gnMW97Ha32NsVvfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604546; c=relaxed/simple;
	bh=yrQsM2XtVGY3NA8zhm+FsqE/2X9ptscF6CqAYanOLnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7eXnvlfZpNlj6DDnTyd+rlG/pxG1heoQOANRmdks26rmgULlAX6rVQSvwBOyKpAGbMz4TjtmUppUD4/TtYFVjTlo5Hj391uI+AtSb9vR1k+w/mJVPwq2/Wv0midkmMQ89oWqWLAXpKbecq2HsJF+ep6my6fTBIbOg7Jkf9hPrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3jvwDmL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5439a6179a7so4976020e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604542; x=1739209342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
        b=R3jvwDmLrUXzWa+NPqhHUn7rpMRiQ+xHxXX+8q9wJhKeBobUIDl8kgW+cSPsTa3IFQ
         vIRzBTh3mCK0gk1i6zVpaeEyBeSq/ITwUh5WUND1W5NbuHRBNi3K9WvG/N+fnbEdy0MB
         GE3NRj0UuqY28IUs61hrt2MghIMaCHdsUjGVZCSsUjrXFTKpmr+NhGrc5rJPE+y8AKCF
         fhagTR2aA8P1qpvstNP2sC0DKe0jYurKeb8wwjiYcqRfx2wDf0eQ7OeMs1rA6IS4ro1O
         yr08QgEAXXndLI8t1DWfwyy0NW0/QW+Iji07wG736hao5MjMhRbKBPiQNEQjFlMmqbkA
         9Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604542; x=1739209342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV759n545yp2xuLFkBUA+OXI8LlcFh1JTbt2D9n4TpY=;
        b=Ay4aS2LT5UakNheruJ6jYBpJv3lU49W7gic6eMR5Q4P1AkaQfiOCNfMUNduY/PwD6b
         pIkqXq/SuL7Nn2xTW7e6HhQFCNQf432WgX9JSH/9bsB8nAhMagOwaAlhOyJPA0Gn61mx
         dZ3ZM5HvGL1fayZZypHAHC+1RA0XsG0kGk35npntTzCqSllq/Ll5I/EwffGMyusM9DFe
         EKbCcXBDrzTTWemExTcCdp5XVI7wAC+ip43PiVzufcT3DWtxl7lcLkFQ1uKjOeCzVsVC
         gnW5ZYfoEOHWgtR6vK7tCA4ZHdokHqXDJnDTvO4stX6rdDJfSu9c+Qm0HzsGX/3q30f/
         nFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvm8/OIKjX5ttdMHVxCmci++ygJRUCW3TehJWxMYmU+wUQZZKny/E0sN+JT5Aw4EJIDy6N6TxrE+fVBIcP@vger.kernel.org
X-Gm-Message-State: AOJu0YyCThbqBtcsMD+4pfvMdEQ0LptryDgCga67LG7QRL4E9ut32K7E
	JHULuvFH7GHNrVkLRkIUlJ0jKo9aJoPvNdgOBT+6IjN3g6aj1VWnjCEvOK/RfLI=
X-Gm-Gg: ASbGnctfmcCmO80lEkncwjDOeS+xcQcgEnYhe5fmH2uM02cUShxiqv/x+uBaibQEjv9
	fS3HNcEwwQjvbb0AW3eoZECIT0xyJ4soCzkdJyODOYZXlq2fJvU7WsWk5kGsQiOLUkRF4b15hXX
	hHUcR5/rcyM0qhgp+a3QF+W+TCryzzjeUjHG+D8lRO6v+vAoL6CsBMMcXFDRiuoxU73VoiqMMDe
	fCAeibn7BKvo78810nTOmwo7NM+m7EiL1sgG5Ffe1HmnOK9eyFVW/M0HGgt3PPQFcPT5h6aV5Sk
	nUTw3RO11GVQbBJ5orpmLtOWSVBW/f1A60NKM8Fg9lNQtf8H3szQvD+WvGsjUQUEmT2XLsc=
X-Google-Smtp-Source: AGHT+IGlJ87svBgPPUA20T73yUcNcWRnrAPPLfHleKAdvq9eZ+1SZHlu0nXMsWAYW/fUC1Is8QpX2g==
X-Received: by 2002:a05:6512:3f13:b0:542:99a7:b415 with SMTP id 2adb3069b0e04-543ffab903amr96587e87.0.1738604542379;
        Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb7df3sm1351683e87.204.2025.02.03.09.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:42:22 -0800 (PST)
Date: Mon, 3 Feb 2025 19:42:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
Message-ID: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
> divider clocks from Common Clock Framework:
> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
> clocks side is protected with spinlock, however driver's side in
> restoring state is not.  Restoring state is called from
> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
> conflicting updates with clock framework.
> 
> Add missing lock usage on the PHY driver side, encapsulated in its own
> function so the code will be still readable.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  	ndelay(250);
>  }
>  
> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> +}
> +
>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>  {
>  	u32 data;
> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  	val |= cached->pll_out_div;
>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>  
> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));

Ideally this would be FIELD_PREP or a special function generated for you
in the header.

>  
>  	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>  	val &= ~0x3;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

