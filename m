Return-Path: <linux-arm-msm+bounces-46810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634FA2618F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CD53A3B64
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02B420C46A;
	Mon,  3 Feb 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ACpP7MAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA43920C465
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 17:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604453; cv=none; b=bdPGLKYPQIR2+uo8QLZFKKC5A4LQAy6E81i+Jyj29BZ/c+iSWjL48CFm0DfFn+IF7TtcOodCnCID8wb0Z4CvBqBHEyEzUJU6EjB2Xi4SPzrHzE94I6HPxOGQ3u8+lgs3YMHAgNdLSudHNeXD6oB/1KCUO+66ocJCNTtPkfRQtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604453; c=relaxed/simple;
	bh=FvbzI49ugB0ARXUttC6X2TqYQGK2iTTyK7ALo/17Rt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b62Ih+lt7pBrpurVeEBJS/zLlfMSbzN4U2LjKyyVE/IzPOLowb5rIDiiD5JGtqrUtgKX0vkYiWjvQkUdF+9ZgTexw4KlN8rn0lj1DJ2JC/ARx561kU0bueESYg9UlfZ0S0YefMRu/1Wy6wc1nc6l6tO02KCXePpKaaILmsau3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ACpP7MAQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30225b2586cso53897791fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738604450; x=1739209250; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
        b=ACpP7MAQnGX1FsfDpc41cpZ8MFGMyqSiXSJi2e62LDn6Sz+QczRkIThp041/fqUCd2
         gs9vB5DzB8RJszih7iSlT4Py82hiEJc09A3LpSRQEse+mBaCgafDFAOWDKii0dogayIz
         Lk8SF0a0a8g8yz2BWhmhuWUzAEek3zA6XA3riNnfNQzP4btjW6QRwej/P289ik1xekjD
         5JyT7+r13bjrv5vX5idYaSJQ/ABBnqt8bdvwyfEVKcqkg3q2Wp2mYB9S1p/1WK5tiwxy
         7nZh6+jR6+tTj1ocLRyueXEhpqNlB5twb+y/8U7pdmZ1+OBDSdWU8VZfZwr6JLBYqnml
         Lkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604450; x=1739209250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA9LVH1stBv0ECBYagns/f2KMhNlEurGDeUp3Juc0l0=;
        b=dOekONiatfur1QSmorf137Xfom50RsebQtdq3bcu3rzTju5KjMP9Xdtwq4ZwILSh6K
         tIeX/tV4ckAbaTCDr6lmgBm9qOCJ1ji1uz+ppkAYOvSmQnY7AOLvJp16CHUiKWXowxrk
         N0jAcenfpwL9r/7Wj1+KxqmPZghk38lT6Rgk+94+/sfaSX4OC4sIGJyom6mjUaICCDxI
         TqLUpJsyIJHzQ0Q4U/0F3mdUhadpiNqPDWLOsc+BCgtpCAhliJ2rODLSQ4UnbwEqxRI0
         Ig3IdyzL9rX/1yiyUdXUDdity63MeKiJ+UmG6a+E/l9TXGvYX3IFddq8Rz/WaDek35yU
         iEcA==
X-Forwarded-Encrypted: i=1; AJvYcCVl5OvoOCUedel0LgxY7V7TSw1tlwH0u3RXpAfiiB10twGfm/LTX+2S2OgYPDI2b7aRo1ykG/fhpHzk9h++@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WxirrCRcqCTZr7Qpr6U9LnxdZBVaBIz29hp9XT+wH528hhaN
	zBBOIuEWhzetV+x0dkbTm8JOthxSf6nYHNuL50EOF91cKcWObJiVTG7qqyYwNfs=
X-Gm-Gg: ASbGnctMsj3Cka77OsdmDYezaXXzhL3eBhrop0HW2viOvy+yZnY2C/Sp4b0MO0QNzwf
	HyaLM0PPS70gNxs6GfpWb1qpGEz8xrAhkjOUMl7blHUCVPYlGmuA6jnreVova5lXP7nR3KCa+Cf
	e+YpWpvjhejjj8KJIq1EM1YlXsUOkS9prR62njDk8rh6sC/sr2gTW5roTM0aLytX83jBt1fuS3i
	CzPw8IajdtfqAeCqAg6ZPMMrxzd7R1DpcxF63NdAPeDo9vQVgoh21J6Aott78FYX65S4ip4QKPz
	DfIqjmNwG1oQ0PpCReHe4ROEwNo66k+u+R3pLSmRBtE6X3X0+GhBCivvcDdleEt8ir1ocDQ=
X-Google-Smtp-Source: AGHT+IHY24nboD8BN6UXFEq13aCacnm+x9IFyD9DyCkPKzh/1S25FaBfGTGrXfjyKKUiYJc6Rbvxnw==
X-Received: by 2002:a05:651c:1588:b0:306:16ca:ed05 with SMTP id 38308e7fff4ca-307c6959783mr444801fa.17.1738604449826;
        Mon, 03 Feb 2025 09:40:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a309b1dcsm15431281fa.49.2025.02.03.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:40:48 -0800 (PST)
Date: Mon, 3 Feb 2025 19:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1
 when choosing bitclk source
Message-ID: <c5wtnqiucrfplq4655wk4iiwlxm42pdwozsqohffu54lifpbme@pnrqzul2cx2f>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-3-862b136c5d22@linaro.org>

On Mon, Feb 03, 2025 at 06:29:20PM +0100, Krzysztof Kozlowski wrote:
> PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
> clock divider, source of bitclk and two for enabling the DSI PHY PLL
> clocks.
> 
> dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
> all other bits untouched.  Use newly introduced
> dsi_pll_cmn_clk_cfg1_update() to update respective bits without
> overwriting the rest.
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e26f53f7cde8f0f6419a633f5d39784dc2e5bb98..926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -616,7 +616,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>  static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> -	void __iomem *base = phy->base;
>  	u32 data = 0x0;	/* internal PLL */
>  
>  	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -635,7 +634,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>  	}
>  
>  	/* set PLL src */
> -	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);

The mask is not defined, still.

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

