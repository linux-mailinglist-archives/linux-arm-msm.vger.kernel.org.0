Return-Path: <linux-arm-msm+bounces-29209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB395A05C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C96F6B22F8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE111607B0;
	Wed, 21 Aug 2024 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHtZXUF6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6B2364D6;
	Wed, 21 Aug 2024 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251831; cv=none; b=JI3IPuKlmD11V2z7e2AIRrruWqXTM/5FPB8au7HVqaTFcr2cHwAfWgWmkqcBCvqoabZJGj18AcvssyG2m48mIkcO8+AZ8y6Xo+kcjutkYJjW7uf638dSMllWhoD6o42BnNjpwFkowTVvqIlCTai58Acv27relK5G+KLvLUidVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251831; c=relaxed/simple;
	bh=DOn+l7VijRoQ0qf3XpvX93tTLR74QrEEGQ4BtmKSlDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1z82iuNKO+nBNlulZaB0NbbTsfNZW3gr9NZsDdxntAxdSrhH7XvPE0O4Lrcd1tPrZCQz/0DwyMegbXQ/kML7PgTcdNaHWBfJodH2H0fFGcLVpyk5/UC+TIEMophTMLdg8Q2jab6hGpKIJomW0Jp8AKkqOsGRFEXr9uXFP/XxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHtZXUF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E6DC4AF09;
	Wed, 21 Aug 2024 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724251830;
	bh=DOn+l7VijRoQ0qf3XpvX93tTLR74QrEEGQ4BtmKSlDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHtZXUF6aY8uuzdzlC/nehYxpXwf1+Vri257L2u9J+46BBETHc/1LSOI5bf3lVyxE
	 HuapqepRW9B9qTaRxeFOUGDKvDs6BSIn28vsBfIMo5/9i+QtHK5Px+8Y2cGXq7Tkx7
	 QSmwKv8zmOxX7+eKw+x0GqHl2PRILupM1FUPlAbfAO6Vb8jEXknKJOXRUVzhd2wfjl
	 /ibkexLAF22k5FZnhdCuYFtVcdaEMQ7uMxRavmxqJ3SX4cD96/OfWOg9CrhwzIMzd6
	 7WWVfuvfOnDi/rWGxbaTeezQ3DxSielSIJi8G2nM9VazcpqUtK6+rDLfvqGhMpCfua
	 mb9zzlJ8IxKbg==
Date: Wed, 21 Aug 2024 09:50:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: vkoul@kernel.org, kishon@kernel.org, agross@codeaurora.org, 
	ansuelsmth@gmail.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: Check NULL ptr on lvts_data in
 qcom_ipq806x_usb_phy_probe()
Message-ID: <4kpmkjp6pp6r34v7se24rscnk2t7g2pjcrqm6l7nt7h3lgsu3v@rauqrchifqjj>
References: <20240821131042.1464529-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821131042.1464529-1-make24@iscas.ac.cn>

On Wed, Aug 21, 2024 at 09:10:42PM GMT, Ma Ke wrote:
> of_device_get_match_data() can return NULL if of_match_device failed, and
> the pointer 'data' was dereferenced without checking against NULL. Add
> checking of pointer 'data' in qcom_ipq806x_usb_phy_probe().

How do you create the platform_device such that this happens?

Regards,
Bjorn

> 
> Cc: stable@vger.kernel.org
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> index 06392ed7c91b..9b9fd9c1b1f7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -492,6 +492,8 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
>  
>  	phy_dwc3->dev = &pdev->dev;
>  
> -- 
> 2.25.1
> 
> 

