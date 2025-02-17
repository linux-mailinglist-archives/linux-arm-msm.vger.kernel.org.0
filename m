Return-Path: <linux-arm-msm+bounces-48213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F66A38458
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 510CE16B53D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9677C21D00E;
	Mon, 17 Feb 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X7JPNx5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBDE21D3D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798044; cv=none; b=MOVnEv6TS2ulHp78bdKiZNQcsz4j2qKpcwa80Oj4s2EUWynCBnJ7e64mSeM4gesvp/TRWuwC3ORBuF6I6j60L++RImwOTtg9WgcZYWc30HanVkBBlIfKxskWwUSi0/vN1JNf0c9+WCqMZhMU8OOMy7wf+9cDRBi3Mal/b0GffA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798044; c=relaxed/simple;
	bh=v53bveOasZX2OiI2BS6B6x9DX4sZM1Fga2RltdlQcS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zeed0CaL4pvmj9+Gmp/vI4Z6Jdow6PYVliFBH3CJvz2LUT4Z+TKAO3mSBAYbPEWPwD5QViYeSkhqXOBEiGs59w6b4BHeih4psRvefEtcrfPZXYRtYXOQjDQZr9z6EOWTdxgOAT0NZNNCyrjX4yTFdLzCAvXFY3GCgDENG1S+t5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X7JPNx5c; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54529eeb38aso3097609e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739798040; x=1740402840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZutIcnMmP6iI6i3LYjXGBl6USSBwuenG5p8HEpR4ZU=;
        b=X7JPNx5cJAFzS5TlL0Xn6XexXVkO6p/uArZPoIoJ0Ggw7W7Qy3JrLA7hI4azpgAfZB
         WF1iit6kQWoRbmbjqUZQrf1MFOT8tz6T5u348Nrbn4I5KtLqoj/BcYsOw0AY1juHfISA
         HUoyAHgDGwHsvmfiHD2z+xO5EnldLVOmk1hbRqzoe2SUsefp+Gs4TjFUKdHaw9c9juIr
         KpKnL0d3JAOfICz6PlN6Xrn58MuVNRTZwKKVzJxpRBp0zYdZ/Z61pRUan8Wp0bZdJ9GZ
         RBNoYgeMal1cy6so/Jw6wjiYAnwtoNA0HUXeypRBx9gTPPyqJniKp/QW/i5T4hipNNaP
         X8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798040; x=1740402840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZutIcnMmP6iI6i3LYjXGBl6USSBwuenG5p8HEpR4ZU=;
        b=KGBaKNe3Va+PNQcPX9NYS/APzmuFGEQQCDJ1AlF5waMRbA2FDvV0Nt0Bq/k1M2aKu0
         5/WdM11hrLch1vVSu+6pQ/pCjGO6jYqEavOb7MNeT54BCkHEcrGPVuvRo6AVEMArgLqI
         12WgMTCgW354uWCSJznMZfZNFNVurgT98333QBE0YfLL6LCWzc5tVDVrEkaNAzRM/OG4
         xCdu12zDiXTsjjdtHC/ymyJ2AHXLyLLmAEgsbzkqrQXqgd0jyIHds+1JTdUxgb1FaOf9
         0Y9JK7JbpYT+kBxdUixah/1h0TjYRPhONRCvc4TzG1ovGhFD89hQYJl/KoDrJdntKhWL
         1YeA==
X-Forwarded-Encrypted: i=1; AJvYcCWnXPcAbgkRRBI9ANkuVOoRaLOugCCPwyrwGPptVPg+spzxqvABnH3JDZAlemoEnBJJ4Xvvug9ITAcvUg2L@vger.kernel.org
X-Gm-Message-State: AOJu0YxHh5GoQh6inMmU0rZf3ow2JGHa+6NOCRfxx69WlMI4GRNRuRdx
	zrmM4i6vCbHziDHqGo08+fKMo3mnW0zY618Iy5+HRqvdqmNtXjVfR7entLqZANE=
X-Gm-Gg: ASbGncsSgtc5M80LLqL7G1QkqRGjmkTUZ98wubAPDZKan7gRlZPI8Tp0XHG0QaLI1mX
	qn3IrfCHgF0skUXuiEFvw2re4Y2AuBvycAkU/28M/tnKWi3lfCMYhJyMil81WlF9ySWW1QEnOr0
	u8qbDeW9XKMVxHTrf8QVI4Ua3OsZc712MiOkl7GtQrJCO5YW+GhEMKaw49oaD7XpYhjnr5Xs7MD
	m8coz/+cT4Y8kG1xQRo2Tj0pnoPCxjrx26JB0Ys8FidPWv1Jf0TkEjQ3YpRReuE4rKafN7OMwJ9
	MfnAaNdHddY3oYk1g4w/UrbPTtZZdt9puryRXogDneEwjs77MFjV4lTTIw+w8RlNRneyv6U=
X-Google-Smtp-Source: AGHT+IGqa8xFmHNzImtW+A+QLQpzg9FHImgPsXMU8Ep2PbCLqkenGCdKllB7ykd8l9t74TkwpnVpHQ==
X-Received: by 2002:a05:6512:1593:b0:545:85f:6a46 with SMTP id 2adb3069b0e04-5452fe8fc2amr3163114e87.52.1739798040527;
        Mon, 17 Feb 2025 05:14:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461f0d74e6sm536349e87.170.2025.02.17.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 05:14:00 -0800 (PST)
Date: Mon, 17 Feb 2025 15:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>

On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
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
> Changes in v4:
> 1. Add mising bitfield.h include
> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> 
> Changes in v3:
> 1. Use FIELD_GET
> 2. Keep separate bit_clk_div and pix_clk_div
> 3. Rebase (some things moved to previous patches)
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>  		u32 data;
>  
>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);

Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?

>  
>  		phy_pll_out_dsi_parent = pll_post_out_div;
>  	} else {

-- 
With best wishes
Dmitry

