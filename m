Return-Path: <linux-arm-msm+bounces-88304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C6D0AECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2F213026502
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FA332C923;
	Fri,  9 Jan 2026 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkOaLVUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E82330F7FA;
	Fri,  9 Jan 2026 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972463; cv=none; b=s7E1woQg1vTgBftsc9NsKr0/0dPvxiI/8hTJhHUuxUTZXpZKDoYb0STIokhL5wuQzcsQ0wANZ2+KLySZGAo35XbuA+iX6zXRSSJ5Hk6VfzjJvqVQph0oe3sOjDVtkoLIFp27vfoGRbMT+JdYUIKJFc9rVERItj/tO0plCHX9+e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972463; c=relaxed/simple;
	bh=ARhqdqo2BbUSrkDWHD7zjIFWP4pN9CoV0CKLdujkaf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPvLuO2soNzkFCpwbcfdmSJBFkNzl1EorQjUEmpZI4nhyyE2zr3qj0CR44p7kvfIO/0EwYNg0XPqF37BxJC4ztLMxLco5noMQoWLh91VzKxHUrKa+9V1VbWlMEScke+7wSWxfEN/Kito/H+JXq8Y3Egtu3GoezViQDJ4kUuWu+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkOaLVUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0162C4CEF1;
	Fri,  9 Jan 2026 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767972463;
	bh=ARhqdqo2BbUSrkDWHD7zjIFWP4pN9CoV0CKLdujkaf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkOaLVUGmVMMpTGEfC8Xwh/1MG1eIv2HkBiWAaKs/JdUCrv3xge/q46NBO1Klsubc
	 xr5q2VstzL3AO4SqzkTWY+KFGw14HgMu+pettW8DbNVrmL72IlOpZI9vS0g5GQRfnb
	 awkzw/pA0pl+jGUCooTzpH7HmWsgVfOMrG/KlUbqLeI3YsiFeSO5KJtAT4DTewD8QX
	 N4RY+RkcfrwOeZisYlpC68BhFchz3C4NMFNc7tvn3k6XMrNN4dGu0Ps23nigq4/xui
	 nNXTduTqgtuyH/pW6+/zdLC0YylG+S1b0lQ3ez6QI3FXBdltDK1orpxTpBdAyeHjX3
	 oANmpeX5yuAew==
Date: Fri, 9 Jan 2026 15:27:38 +0000
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: qcom-pm8xxx: fix OF populate on driver rebind
Message-ID: <20260109152738.GK1118061@google.com>
References: <20251219110947.24101-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219110947.24101-1-johan@kernel.org>

On Fri, 19 Dec 2025, Johan Hovold wrote:

> Since commit c6e126de43e7 ("of: Keep track of populated platform
> devices") child devices will not be created by of_platform_populate()
> if the devices had previously been deregistered individually so that the
> OF_POPULATED flag is still set in the corresponding OF nodes.
> 
> Switch to using of_platform_depopulate() instead of open coding so that
> the child devices are created if the driver is rebound.
> 
> Fixes: c6e126de43e7 ("of: Keep track of populated platform devices")
> Cc: stable@vger.kernel.org	# 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/mfd/qcom-pm8xxx.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 1149f7102a36..0cf374c015ce 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -577,17 +577,11 @@ static int pm8xxx_probe(struct platform_device *pdev)
>  	return rc;
>  }
>  
> -static int pm8xxx_remove_child(struct device *dev, void *unused)
> -{
> -	platform_device_unregister(to_platform_device(dev));
> -	return 0;
> -}
> -
>  static void pm8xxx_remove(struct platform_device *pdev)
>  {
>  	struct pm_irq_chip *chip = platform_get_drvdata(pdev);
>  
> -	device_for_each_child(&pdev->dev, NULL, pm8xxx_remove_child);
> +	of_platform_depopulate(&pdev->dev);
>  	irq_domain_remove(chip->irqdomain);

Have you explored devm_of_platform_populate()?

-- 
Lee Jones [李琼斯]

