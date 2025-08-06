Return-Path: <linux-arm-msm+bounces-67823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027DB1BE69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FAB57A2C18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 01:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1687E72614;
	Wed,  6 Aug 2025 01:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETZWtoZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D127455;
	Wed,  6 Aug 2025 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754444890; cv=none; b=iOZpyY5dsH2l6hXYyMmFSbdAzNLl2oTunKsid95TRq5OBEIImJ25Ovi8DpgdtUI8W32jjyveqXt9UfHeIO95pytwKIQdUmIv9AmJz3bKok1aEWUkINpJ/+Qg9AQ0ikDLcad4iHa1IlAMitQQplUema4kekSpSRwJtOWalrLqhq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754444890; c=relaxed/simple;
	bh=yOgUNYB83bxvih5HrdZGDPp9Csblycjbfn9C0Jfhjys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsHpWrUeQ2was6tI7fm51341YJIMlkMBRrTXCOqEB239JTchUlEUJr74RsuhKmkQyjlnA13GuZwc9cXbGL8kQlFYGcK4dGp2YD1vOYkLnDQsU/txw0O1RaSJGQI/udJ9H0IS+QIdY2sER8nxzL4NAGGWoCYJsNz0wAsUaBjK52c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETZWtoZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDE7C4CEF0;
	Wed,  6 Aug 2025 01:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754444889;
	bh=yOgUNYB83bxvih5HrdZGDPp9Csblycjbfn9C0Jfhjys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETZWtoZ1J1U6vPeKwtuBZ1llMNu5mGOu/Yn+4kgTVskXtRfvIMTC2GRZ4freoa01B
	 U+mmSXTCvtkkjBuOnyIeXsIT1LV8CDltqYwl6X17lwyUENbA3mUcq9H1G4dlCwujft
	 ZMi05QOzSuhzbCC8zsUPGT2KAkB0Az46SYYvkuD9Cday+/yqXk90QXSMvBzMA1PzOh
	 Y4yn0pMkOLDGz6YQg/0E/0zO/cA1vZLqx6AWgKpAvBYSIh8ONqzIQgKslgPViKxKKJ
	 3fcASWwtvkQc9tfS/TvofUr69/zA/wdXr2Ip4iOQLyTY3vCYKpKxaAPB7c6oFCr2O2
	 WtOCaru9GQnMQ==
Date: Tue, 5 Aug 2025 18:48:07 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@axis.com, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: misc: eud: Remove error print for
 devm_add_action_or_reset()
Message-ID: <5bgmxatzdgkxvuko56siujzlokyie5ru53rgozxrdaey6awmqy@u5pzyrfc7ve3>
References: <pndo6sukt8u.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pndo6sukt8u.a.out@axis.com>

On Tue, Aug 05, 2025 at 11:33:37AM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v2:
> 
> * Split the patch to one seperate patch for each sub-system.
> 
> Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
> 
>  drivers/usb/misc/qcom_eud.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 83079c414b4f..67832790acad 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -193,8 +193,7 @@ static int eud_probe(struct platform_device *pdev)
>  
>  	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
>  	if (ret)
> -		return dev_err_probe(chip->dev, ret,
> -				"failed to add role switch release action\n");
> +		return ret;
>  
>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(chip->base))
> 
> base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
> -- 
> 2.39.5
> 

