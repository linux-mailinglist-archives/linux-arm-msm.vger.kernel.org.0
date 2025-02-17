Return-Path: <linux-arm-msm+bounces-48237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9EA38753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12FEF7A40BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B79212B3A;
	Mon, 17 Feb 2025 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGliM71j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8693398B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739805394; cv=none; b=nA5LOjaCvPaKnqnfiB35e2uYpT/OQwjMtQFfxy88ilicyLCOsAkJoMF09bJc16FAvQ5XJb4i7pxpAkMIY/APg+8C5EuEkks+CC8Px65cL+Q12gwadM+0HKcXnV3vzIWmelHIn19iuXRyYuq/Mmvh2uf03gg7LH6tFviSilyQ2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739805394; c=relaxed/simple;
	bh=G2gQZTBQ4WkAjjo748dOhOV1vedDR35EheFeys46r78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOHLcDzPf+ASba61wjetRfekdIFaI5T6TiVNd4yii5v2O7hto60tSFeJ8pErvSgrcJOg6ziGxcXwZDW8sPYZnahBk71cUeJ2i4fTlHYJga4qzUZTdVuRoyTqHEvmbOG7dpGKXipANkY+ppMggsUeRavYt7f3NN/lSUxh+LWTa7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VGliM71j; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54622940ef7so1082288e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 07:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739805391; x=1740410191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PsHNJZf4gBUaXZ8wW29cD/eT1WPiatSWZEkxIO7LMjQ=;
        b=VGliM71jSvWNFiJk3wdfEYcv+fsXNjsjxiFJBVEtJA91EY2VE2pv8UnHSv4gLtNg2X
         HLqNlgMTxxlYvGVcDndWf0lkiWkBy2drQenF0VDKXjn+0zQBT+0g/DOwzKC+Eyt8/tFT
         LD+Qr2OHs8M+khs0QrvN9N8rN/Nx5mU2EUBafCgRNz413vSN6JLE/wjQybtgmHhq3M5u
         al0GWLQIc0k3V84IpYXv6TdGq5rsXbLxYYIdK88boYh3LwwBe4S1NunSfuTAawqnFFO5
         InP08qb7DH3ezwLufE4jVbIIPB3abMTM1aPbb3fPWzFjPx4UH2WQso5EBmBW3W3KSzro
         h03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739805391; x=1740410191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsHNJZf4gBUaXZ8wW29cD/eT1WPiatSWZEkxIO7LMjQ=;
        b=MGl9JsGfIWBQ8bKimU5jci0BbzLI6/8MD1+O3y6VceBpELrILXWl0lOoe/TiIMaR3S
         nM9mO1W4amFwuz0fS7uMBhk1sV+ZNr+nBR3u16OmynER8FWfK+r7aed5VCgkZhOXoJGt
         ZjkeYaAcWluYzeUTqlHiFdcgeh9jbYaFy9ShJyZg+KuU54fvmjdRpF0CN9vZZuweDCFZ
         LlgmMz02Llg3FjGUdFQyCa9xdIPTA41mAVEM3IQ21o1Lumi0h0yla6z1p8BuDsof1Uio
         rJBskz1Utd863p5ebvXZeY0Oqk3NJHrQSN/0Z0nDRk1Bxfl2lnbIollz97Hpv5MX/WTF
         HpUA==
X-Forwarded-Encrypted: i=1; AJvYcCXfVzjSSxr8lF1CFSp5QvR1tLzGZyNRHjczGAMp8jQAO8nuTMMcQjPIQAlGirV+Zypifeoyk4TCQWg/DD2v@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRb0HWN5EoqLRyhrkrRr3Ws5VHoFdIAx73Xjaqbxf8v3ofOr9
	QS8BHVhfCOEUUV/BxIiNjaWT4pdjb9nbsEtKtHAPbtcuTA9NP8YwhydtJdRjfQA=
X-Gm-Gg: ASbGncs2AatKnfcMpFo//3Q4FoAenhAm34l+sfGiNoODy+Y2rxOXOTpghGQdYBkW/GK
	8qEzvyTZCxI/wZ5uMkbvj6Q3sb+uv6O7Bgf11yR7ZfDDYoxUtFXASAg2BkGF0H3c1USg+ZAfCQG
	zdEYKCYBNWfwvJgkrONQJMpFSTOr/afcVEV0vKunH9TraHzBECR5C+tgC5Rzlf3H/TOmePJH4oR
	3qJ+uLaNeP1sKpkRBJb1pM5GBiMmtFq3RQ+CzM6AWLz4Oc/+2DDUmQQUNNZEOt5tO+zKSeLmb0+
	PSNgqErrmZZl8IIvspbUV8Q2bx4WTaot4S+I0+ykd8eAg6ASp9i9f0zzIT4klwRqFcrR/rY=
X-Google-Smtp-Source: AGHT+IFYw6tpGjpP7jPGRzku+1SoU+IGeFXOMCovWE5Iolwo1XU7UJdyi6AK5Q+nHB2rwXLxH+SKuQ==
X-Received: by 2002:a05:6512:238a:b0:545:381:70a with SMTP id 2adb3069b0e04-5452fe42483mr3989060e87.15.1739805390495;
        Mon, 17 Feb 2025 07:16:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452fb59e8bsm1043600e87.173.2025.02.17.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:16:30 -0800 (PST)
Date: Mon, 17 Feb 2025 17:16:27 +0200
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
Message-ID: <waevglqatvykntxnmaahjpgbhipxhtcfpn7gfwud4sdidqh3dz@bfm7foignlm4>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
 <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
 <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>

On Mon, Feb 17, 2025 at 02:37:31PM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2025 14:13, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
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
> >> Changes in v4:
> >> 1. Add mising bitfield.h include
> >> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
> >>
> >> Changes in v3:
> >> 1. Use FIELD_GET
> >> 2. Keep separate bit_clk_div and pix_clk_div
> >> 3. Rebase (some things moved to previous patches)
> >>
> >> Changes in v2:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
> >>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
> >>  2 files changed, 9 insertions(+), 5 deletions(-)
> >>
> >> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >>  		u32 data;
> >>  
> >>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
> >> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> > 
> > Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?
> 
> 
> This is before clocks are registered so there is really no chance for
> simultaneous access.
> 
> It is rather then question of code readability or obviousness.

That's why I added it as a nit. I don't think that it's required, but I
think it might improve the patch.

-- 
With best wishes
Dmitry

