Return-Path: <linux-arm-msm+bounces-46882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBBDA276D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:07:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A57DC18828AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 16:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19293215183;
	Tue,  4 Feb 2025 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fa40nm6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24A214A67
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 16:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685225; cv=none; b=ezwdCc54GuhVo/6UHE2Uh60z6JbaGD8N+tTdM6Tb1ciw6PoD1NO+pCx83VVvCR+20o3VZ0XqEEIOHLdwZtMjI4wb0z7v7gDxpes9R4nIM8Cq5EZvXxQKrrYzta5ZO0Q6LylcvJjPEONzhw1g7TsDuFGSiv8ZIs0YUMWAsfjUceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685225; c=relaxed/simple;
	bh=87XElV+ZP9tSZMuwLGTjeSbc2SSgA+OFSMdHTxKMBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIun1pA+TU0FJw18Vgh7nbsynubFoYEPb1SINte2UZx8gX7K5Af1Oh8Eap1y2c2uw88pYgYRRSwC188XCH+BZAJT+AIUWtlCnIOpneWB69QCilOGStPdhJdCJAlKTEGVyJ6pL2yEP6SBs9ylBZmAwMMciCibmM7MhoscrY/dHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fa40nm6a; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3061513d353so56471961fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 08:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738685221; x=1739290021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QcM0dBP9g39GXdi7mAUq5Bo01wVZTt8edmUCGV/0Hw8=;
        b=Fa40nm6ak3mRYHUzAmfjOUUCosz+w82WaToiKQjvl6vpHZLG9/srhYTLUjMB6mfyHI
         h91AYU6yg2y8tUX/TLjIA2x3sRXio+6RWGlbv5n8oqFkdV85JrknnVX1c3SvRGggnhdZ
         cP4BEaG4in8MQOQrSnc3HdFVhFmvvS4xLwZ6wt9zN1PTZpqDrAJxrDWx5IPJa2LkH7ac
         38vtfCF8ECmYIFNrKlNzCJga14Yr9OekkDrsdlKxuIfwIRrRXWnzwTeVUDEN0GQrQo3x
         b6s6arE0CuIinwzPhVgaxb/L1/Y/DkFWFTuqhXXp95RSerYf5e/spBtC+dsCFTUAMX+f
         pngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738685221; x=1739290021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcM0dBP9g39GXdi7mAUq5Bo01wVZTt8edmUCGV/0Hw8=;
        b=A7JjV7aR/MXQWvCsFCc/IKxyUoaVNJ8g+IQoG8DY03c5ErQMJk8TbI63aGBpfORoKe
         CjUcNa0HdXbZoiHKb57l4Zb0tRjKtnpxnq+I1k1Tz14CTSJlgFv4Mdx0t13yqH49uW9X
         GeaCcRohdsDNpQLQUf0GCou60jGj2+34gRnfXwrRccCAbT8iohLt2sIpXfIC4+4VjGJQ
         apYO7wGi5ds/CdNOhSolaY0y6a3c7YGCSBpzmd1eDU4eCwCDdR4+MChy01Z91kngj8XN
         89/+z5nlFQxP6aAxPfeD3Z4sfaXtSDZ7Is0TWAlu74Ng0liA+3gr4QP/Rb66b6bJk5av
         w5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr+cuQSQNpt2i6rR3AMTMNXq1JzCzFmc+1OcH0D7tUKP8fzmk52+YEhixdq2hzvXL3ah02mcnfk3ZbfRw0@vger.kernel.org
X-Gm-Message-State: AOJu0YzZu8hzsbh6kv6BydTpSstMGsGntHpfSfLfi4tamvY5xPKtPkZC
	XxwJHhoU69QQNQC4YiFW25ckxNEfZ//WO3ABacCkPEKEd1J5AEX4mUL05dqj3/s=
X-Gm-Gg: ASbGncs9uv766c3N12T8mbq9MEULDpZikgUPb/UwW+f3Fu+k5pcHE0uUP7ZrA8ugQdB
	T22I/obc9aTIPfImf85Nfg0uucjHSV70TN+SeKpf+MAZKsQI+RcHqwuj9whrGoicvWPeYu9zCXl
	0n1FS27poXduxDPdWXb1SzCz8DiZBdTgi+qYGINKsU0eMOhssxCbPw4baLzKeyEuBtHrnZXM0hX
	N0qTEdJMjR56Hf0O3l469lGLdj9ASRDAo9+116A3Lxrkr19Mm8ouSLgPTfMctC3A3pjUWVUCF3s
	ktesqHFPBFSTyGv+04hwQUvEvkSIBsF2EaObF6BrikXAbr3r+MAbgXT15OkSbOL6ZTqUJOI=
X-Google-Smtp-Source: AGHT+IEiaDM/fV1OOyZrYGn4JSpNEJKdHLwZhH84L9MO8D7AIbye89bpe0ENwwrU/i4TaJWy2LjXDA==
X-Received: by 2002:a05:651c:220e:b0:300:3a15:8f2a with SMTP id 38308e7fff4ca-3079680fbc2mr88609331fa.2.1738685220999;
        Tue, 04 Feb 2025 08:07:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f77casm18969821fa.81.2025.02.04.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:06:59 -0800 (PST)
Date: Tue, 4 Feb 2025 18:06:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
Message-ID: <rjjaanthmbb5fer53ffu2evxohyusj4me2db5r4jnxy2wt7dxk@a6r2a5ddxoxq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
 <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
 <dtenajcyhcrejiiadcfmpz3h3cg3l2rkio55625umao6gl3q3k@asy2ecfz37ps>
 <30518b66-71c5-43ed-a770-e3ecbfdb1f58@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30518b66-71c5-43ed-a770-e3ecbfdb1f58@linaro.org>

On Tue, Feb 04, 2025 at 04:48:43PM +0100, Krzysztof Kozlowski wrote:
> On 04/02/2025 15:28, Dmitry Baryshkov wrote:
> >>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
> >>>>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
> >>>>  2 files changed, 27 insertions(+), 16 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
> >>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>> @@ -67,8 +67,7 @@ struct dsi_pll_config {
> >>>>  
> >>>>  struct pll_7nm_cached_state {
> >>>>  	unsigned long vco_rate;
> >>>> -	u8 bit_clk_div;
> >>>> -	u8 pix_clk_div;
> >>>> +	u8 clk_div;
> >>>>  	u8 pll_out_div;
> >>>>  	u8 pll_mux;
> >>>>  };
> >>>> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>>  
> >>>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
> >>>>  }
> >>>>  
> >>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>  {
> >>>> -	u32 cfg_1 = BIT(5) | BIT(4);
> >>>> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
> >>>>  
> >>>>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
> >>>>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
> >>>> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
> >>>>  	cached->pll_out_div &= 0x3;
> >>>>  
> >>>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
> >>>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
> >>>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
> >>>> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
> >>>> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
> >>>
> >>> Could you rather store these two fields separately by using FIELD_GET?
> >>
> >> So make the code again more complicated? OK.
> > 
> > It was already there, bit_clk_div and pix_clk_div.
> 
> 
> Yes and I (believe) simplified it. It is subjective, so I don't mind
> going back to two fields, as you asked.

I'd prefer it this way, thank you.

-- 
With best wishes
Dmitry

