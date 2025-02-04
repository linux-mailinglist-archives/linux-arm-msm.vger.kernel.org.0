Return-Path: <linux-arm-msm+bounces-46869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DAA27453
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D1B1883B85
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 14:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D38213259;
	Tue,  4 Feb 2025 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8LSKXRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02296211A24
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679275; cv=none; b=De9ipo5APGujEr8QMOvrMoj3jkHMcaOQiGZAmJKcTVQ3rQ9Iu7Ulb6Xl5xW/CHp5Kq/WJOJC3A4M/uUL6vF5/226JdNil26TnaVL47YJKJfMBsJHdVy8x5vzdragtzd+rKhFejR1bBS7itlTCSvHuPhhTz0oBV6klN5jPP/V+K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679275; c=relaxed/simple;
	bh=AGv6WcB/XbU1haqB1rGCjX8Y3bdrlqL6I6pBUFLKnvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlRuYJb/9SlFe0K924hZxwqn+OB9G6zdOXrN/owrNbWAMbUikenPNOZ/BCxFzejVJWTZCCUmq/xDtjwT4L9YMEPyGwmArz3mQD8DRy9ewR5P1Jxuk4I20YAoBTAHAJNfQs80EcSuc/gLN/kWpVt9mfNTDsZYUPh6srfbX9yMVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8LSKXRq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so7282863e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738679271; x=1739284071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc9E3UYFfRAAW+rGyz5Tj1RPAc405r5bXy2a5xn17O0=;
        b=f8LSKXRqP1VhSSXSCof0NcFN/C2nbwLQ2XRA7gh2yBp6oU6pcue4mzVdtF+f7Viwuw
         UUsyyte56XEQCUOFcWMGN62TlCaNGWWzAJ7XGZDw9X/tQ38AITiGRr5Ec15rYymjvwMi
         LxWWkAKPN0mxCz2qSUA7ccJE4YqjgwkDoHJnYk/CoAIcMk4hIZXiZe8mOkpmzqglIb7g
         x+PEUvzGqRAEipw+GQM0Is0YhQUQ5FxXyuI4H0w5Ta/+h68GkwLKvcQ20V022nKmP85f
         NjRt4gc4GoyVbVmanxo4TJ9U9YTJag4suCgR0OQP9U7+qT/L2WgqWWk4++4AP7KmA+AY
         wGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679271; x=1739284071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc9E3UYFfRAAW+rGyz5Tj1RPAc405r5bXy2a5xn17O0=;
        b=JtxHCiu3UR0qc0b9mR2OrY8tdmwvs4rT8nbocuDjHW9dClqvmbGshehkPf1ZzKUq3P
         LAez0pp/gG764ygfmKfA5ss9+C8vzCJZsMt/aKDWXCYCxICLVJejErQ+xonPoD8LcfoW
         P+/RYuhpIO5BxzS508M+WTkQNiU4vrdXwL+Ds7P5iykBtzjam7pyLVUMphaOZrrUWBNd
         9lpBpzGojc92TVzuaZWYi5xsY4bWVOOodaDWIYD0CkyfCYt5bP8W6APHr3jEozIS7rLK
         /0aUwqRdoJ1lgdQh6TiaNms2rdTN64D84PXCnyp+mzRGchXCWklfeLM96ka+GUaJ1+5o
         VNCw==
X-Forwarded-Encrypted: i=1; AJvYcCU4nJJMIs4oXItm+YWkjHQuDnhesO+qQxKDELdFLDFgqzEthXorbIi+NQkPE5EwiuW/Ujk0oKTMKNiuz9e6@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/eh3tjWLQ3q52PUUrPC6+nWgwJje01ly8jAlLEWCX5AlML6i
	90kJdmTl8nhtBl0vaXljvgQMUUlRiR00wK8oO8hqEVaCxr4yiEsQbCbJtKrwijs=
X-Gm-Gg: ASbGnct6xQyhik/t8AuDLERQ3x5uFDT7zeTo/EvBx8RuXdaaGl/+WbjBslK3c87ZTJG
	ahEh26Vg3oS4M4e1GbFZMUxoZcy++Wq71VZ1llo1dGbWmVQhV6Hu8o8FH0+9M+mc4yVJllwDOnP
	puPHIIb3K0AgtCua0keq1nFMaNJecXkwlNQswzh/t6D4n9TTx1ZgTZUxFcvArkZB3HqLuY+UuXc
	qD/Qra7wyq+1bwLCaArXpP99/JCAeN3qpWmebrMNy6rI87Iwlvigw3WjTRy/V0sMU94I9U+vKEb
	HQbF1g9jy8L86IjXbL2RVTg+yEstb2ioAeN2wbh6KzOwjws0PhzoJogexcfnnGhIekoNY/A=
X-Google-Smtp-Source: AGHT+IEg7SdqGeCK1dtrjyU3szLN/KK1/z3qC0jeEm29ccKN8bg4q8Wmp9gw0E5IcQUUGfBE7uB23Q==
X-Received: by 2002:a05:6512:230a:b0:53e:3852:999c with SMTP id 2adb3069b0e04-543ffb2cc63mr1218071e87.12.1738679270909;
        Tue, 04 Feb 2025 06:27:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe781sm1585368e87.217.2025.02.04.06.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:27:49 -0800 (PST)
Date: Tue, 4 Feb 2025 16:27:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <iygq2utzftqrvekz2mm2nnjriwvbtnpskbb4th3wg2jczfikw3@5m7cttkxwenq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
 <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
 <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fdf132f-085d-4420-88c0-bdbe87ac2c74@linaro.org>

On Tue, Feb 04, 2025 at 10:22:19AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 18:40, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
> >> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> >> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> >> clocks.
> >>
> >> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> >> all other bits untouched.  Use newly introduced
> >> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> >> overwriting the rest.
> >>
> >> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
> >>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  {
> >>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> >> -	void __iomem *base = phy->base;
> >>  	u32 data = 0x0;	/* internal PLL */
> >>  
> >>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> >> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
> >>  	}
> >>  
> >>  	/* set PLL src */
> >> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
> > 
> > The mask is not defined, still.
> 
> Why would it be? That's old/existing code. Commit is doing only one
> thing - fixing something. Not introducing some masks or defines and
> changing hard-coded values into defines.

GENMASK(3, 2) needs to be defined in the XML file. It was not there
beforehand, you have just introduced it.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

