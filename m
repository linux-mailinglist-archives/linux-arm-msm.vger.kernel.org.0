Return-Path: <linux-arm-msm+bounces-46607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2441A24062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 17:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC481889F65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 16:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FE81E47A3;
	Fri, 31 Jan 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3EDhu9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BB1E47A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 16:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340832; cv=none; b=Qf/aswbZyziM6zwkTYVehbyk7THVCF/l/e3kVtl2gSv5dWaaQZOqS5NZYU7H8mI90YQZMEU5iTTTJ33lf4D8IVi8y7CgpCaHEgAQCfd+gC6o2dLeed8MGAC5d7+KhPoXAuS5MLm+88IlRy2iEW6QnRm6NRYSoErXwr5QprwSpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340832; c=relaxed/simple;
	bh=mphiO0uqMnS8BS4zTsbBlWAHVHMHxhRHKsIMj8aE9ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEXaUVXpFsmcHksMBAsMOOOn/T6WqjBLLhF9cQ9dhKt3NubcMPP67Fts1THEl4fOnUWCM0ahCLYUPalxCUykRd6eFbdo+zo2sTXBLP21lOdL2iNWWn8qRcEsTsZG2hsgMbgAY/NGujO4Oi06fJ/U54UZK2NBofhj15vUUziC6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3EDhu9M; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3043e84c687so18387961fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2025 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738340829; x=1738945629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
        b=Z3EDhu9MQaW/LQ4x2Po6whml9XAijMLQjjpJbpL/V9QUnbva8V/XSrhJe+WxQicntm
         fSleVznp56M18f+WZ8JdM2DVjDFmLNRFrPdpUyfMIqWO6N9l4QAZldYtWUfeIriQbF2y
         t+ba7scUekcnlkRYcMb8H7rZ8CM0Kifi8Q+jGNXL3sJU3L0Xph4qctin9A/YMg/+Nnfs
         s07N7V+5nur2Nrbz4ZtkaGX25fC/FQpzWuFXkvRIzOjon17c1qlrxtqCGXTl4TIIPXOs
         XM9ZctVtPcBbJWcJzZtvkX1v/a2VykIx9vdm4iEZ8UhNJVdBmXdO94pfoLU0GEZ/rOpM
         ofPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340829; x=1738945629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqNHljgGvF39ZoYvi7LQhjvqJjolDyUDugtI7pAIX/w=;
        b=l2qAOFmdBhqat2xpG0OYKXlFcPAmKzkomZmuDEtPA7fpE2MPYwVn7cqKl8Upw0NYfp
         oIetNFX/+jGD2lP8KXYYiGnrlOwo7xS0aY+JUufuaCQlSlzEeiCpza4j+8fFHXsHZ6YO
         8nDhcMaabPVIC7la79nux+n/iCCi3PEUGu3VQfjRc6tb8Ev0gqAcKxbgpMrscqSlCLCn
         nkPVKdppcpUTL66/8C4cdktfA1YndjzWr08KUdHAhlz2eb0JLU8FRmwN4CFL+ZQ2n7nd
         3/tNv0q9Xp12p3k+kOT7y0QnMFJupIIs/j9Wffn+j3mk8EyRBKy9FWRUdKmPvjPCvHCU
         RFHw==
X-Forwarded-Encrypted: i=1; AJvYcCXNE1OFknal2Cdw7p8KQZo05Rxht2hrDv6FYiv4AkySLzmoVIOTQUmWRRpRYr2gwusg+ykjKuA/YJgEuu87@vger.kernel.org
X-Gm-Message-State: AOJu0YxzpkvhJCkT9ei3YA8yi9fBRz/HJplJwfwOLcAOeR6gOWjIX7HH
	BNk3k6mSeret9j2hyQvr2aUV3IacR9xk6sf5enY8XwIRbodn5vlz8yEO40O2Mc4=
X-Gm-Gg: ASbGncu7a8WGO2//UgtqH+GdGiAj8yeULaOHvI3yYXzP0OcA1f5rx9fHrPbJbluuGz5
	XMFhxsEFrrKrO8H1zp/mWO57onYYv887vTYVZAwPNYptpXWT6aFbrV+CV0lgVII7v/9jRuCCfzG
	+hq0mjpOpGL6xBF1GGoqyNg83eCnZfPjvSU4hNpOQ6JAbAFPJgEmV/bzdysiM7/Tb9frEdi1+d6
	OYrpyDsnmLsYp3vh+mBa95sEDb2vmf8LheHVN/P3ZsU5IsDWL2dGGaeYx0XsHGzAiaveQ2f6j0M
	6z31+w8Bjo3Z7si4Et+Zd6nBb9jOEKt6o1b2z9ujDaXxx8CdTUJTL41y80wSgoN4v6uQ6ss=
X-Google-Smtp-Source: AGHT+IHj2CEfFG1Ny3hI/iiu/YjFUy7k0PuAj0GbWhKpJjm24+fabydi0W5P5bg17qhnO1cLtaZBqg==
X-Received: by 2002:a05:651c:1608:b0:300:2d54:c2ae with SMTP id 38308e7fff4ca-307968e7b65mr51500131fa.27.1738340828800;
        Fri, 31 Jan 2025 08:27:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f806csm6141981fa.70.2025.01.31.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:27:07 -0800 (PST)
Date: Fri, 31 Jan 2025 18:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <lpg4ig3lzypzbv5nyzjfdz77ma5jdk3ey2hjt5htt5yd3ztfjp@i4qzlexajhvb>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>

On Fri, Jan 31, 2025 at 04:02:52PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce..8a9ee308ccffc3b9d112a994a064d8be06d9c42e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -615,7 +615,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -634,7 +633,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

This also should be defined.

>  
>  	return 0;
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

