Return-Path: <linux-arm-msm+bounces-87521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B7CF4AB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0884E307EF9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739A133CE8D;
	Mon,  5 Jan 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5hotyUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010833C19C;
	Mon,  5 Jan 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627530; cv=none; b=uTDr9TDHq91dFezBdfebwIFGtb4hMZWnLv28DJkpkZgrR01vlUIsCLlDNo13Kq8eluUFhws2FKhQVkf13UPgfZvZIci4bZJoBy9gVLLqCrroB4YNLdIhZC1zWwQCnSJxdVXOncKMGpIxv0WuOoMvOzYmILOcSq8w0qb78R2Gjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627530; c=relaxed/simple;
	bh=JCEasXWgUiniRtQ3WMnSGMJAl9Gh+xFoaFw6/WJHOe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atq8ZrSmhGtXJZLhm6Rnw0kNmYXi9Hdvkahe1Bz/Eb2SZLd4b2TMJ9Y+ODqGdHIFKCj4FMQo5Ut3oYR3cmYoQTXoWhm1cGzduSYtx/Gt1+CG/vqn8whYxNbFurtZ8iSTkykrrnozbC2dXDZ78sctbCpltSUQLgIXXpchA7RV3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5hotyUb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B8CC116D0;
	Mon,  5 Jan 2026 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767627527;
	bh=JCEasXWgUiniRtQ3WMnSGMJAl9Gh+xFoaFw6/WJHOe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5hotyUbw2P21DG7NwOGkSGbpziyTpS+srB3bjLk5yWgyWTblWyW/gAolBloCCnlj
	 buvdrXeLOjhJjo8q3GO5THgWJARFyTZxOoThkg7tY3NX8KkV7OawYNSZ5YpmJ9L44s
	 eizC5BXB1HhXQ18kLSlPikzo71GMpIqtcwdBI+4w2AMQKrzgYOgCYcYfuRecev6/nr
	 9oyVTK1xMmvNlIxEbGrL5pgH/2x629uUsc9ommknNkMkBfiCTLrbXOk8CFZkb+5GBY
	 jC89CuY7ZV81JJuh0DWjKctL5j9R1q3hJZ8p0MSWim64Jav7ugZ6HoXvT8aytuTZMd
	 il1C6Bl7dhbWQ==
Date: Mon, 5 Jan 2026 09:38:44 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/5] backlight: gpio: add support for multiple GPIOs
 for backlight control
Message-ID: <pbbqct3a7ft466aerdkm6k5kmwstfgpbegrakfvdxzj2tdpdyu@pws3zzu4sfiq>
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-4-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230130227.3503590-4-tessolveupstream@gmail.com>

On Tue, Dec 30, 2025 at 06:32:25PM +0530, Sudarshan Shetty wrote:
> Extend the gpio-backlight driver to handle multiple GPIOs instead of a
> single one. This allows panels that require driving several enable pins
> to be controlled by the backlight framework.

Can you please elaborate on the problem described here. Preferrably in
the form described in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes,
i.e. start with your problem description, then a description of your
solution.

What does it mean for a backlight device to have multiple enable GPIOs?


PS. The associated binding patch needs to be merged before the
DeviceTree (dts) changes can be merged, but it would be more efficient
to upstream them separately - as each set of reviewers could focus on
their part and you could update the patches based on the feedback from
each part.

Regards,
Bjorn

> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  drivers/video/backlight/gpio_backlight.c | 61 +++++++++++++++++-------
>  1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 728a546904b0..037e1c111e48 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -17,14 +17,18 @@
>  
>  struct gpio_backlight {
>  	struct device *dev;
> -	struct gpio_desc *gpiod;
> +	struct gpio_desc **gpiods;
> +	unsigned int num_gpios;
>  };
>  
>  static int gpio_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct gpio_backlight *gbl = bl_get_data(bl);
> +	unsigned int i;
> +	int br = backlight_get_brightness(bl);
>  
> -	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
> +	for (i = 0; i < gbl->num_gpios; i++)
> +		gpiod_set_value_cansleep(gbl->gpiods[i], br);
>  
>  	return 0;
>  }
> @@ -52,6 +56,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
>  	int ret, init_brightness, def_value;
> +	unsigned int i;
>  
>  	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>  	if (gbl == NULL)
> @@ -62,10 +67,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  
>  	def_value = device_property_read_bool(dev, "default-on");
>  
> -	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
> -	if (IS_ERR(gbl->gpiod))
> -		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
> -				     "The gpios parameter is missing or invalid\n");
> +	gbl->num_gpios = gpiod_count(dev, NULL);
> +	if (gbl->num_gpios == 0)
> +		return dev_err_probe(dev, -EINVAL,
> +			"The gpios parameter is missing or invalid\n");
> +	gbl->gpiods = devm_kcalloc(dev, gbl->num_gpios, sizeof(*gbl->gpiods),
> +				   GFP_KERNEL);
> +	if (!gbl->gpiods)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < gbl->num_gpios; i++) {
> +		gbl->gpiods[i] =
> +			devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
> +		if (IS_ERR(gbl->gpiods[i]))
> +			return dev_err_probe(dev, PTR_ERR(gbl->gpiods[i]),
> +					"Failed to get GPIO at index %u\n", i);
> +	}
>  
>  	memset(&props, 0, sizeof(props));
>  	props.type = BACKLIGHT_RAW;
> @@ -78,22 +95,34 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Set the initial power state */
> -	if (!of_node || !of_node->phandle)
> +	if (!of_node || !of_node->phandle) {
>  		/* Not booted with device tree or no phandle link to the node */
>  		bl->props.power = def_value ? BACKLIGHT_POWER_ON
> -					    : BACKLIGHT_POWER_OFF;
> -	else if (gpiod_get_value_cansleep(gbl->gpiod) == 0)
> -		bl->props.power = BACKLIGHT_POWER_OFF;
> -	else
> -		bl->props.power = BACKLIGHT_POWER_ON;
> +						    : BACKLIGHT_POWER_OFF;
> +	} else {
> +		bool all_high = true;
> +
> +		for (i = 0; i < gbl->num_gpios; i++) {
> +			if (gpiod_get_value_cansleep(gbl->gpiods[i]) != 0) {
> +				all_high = false;
> +				break;
> +			}
> +		}
> +
> +		bl->props.power =
> +			all_high ? BACKLIGHT_POWER_ON :  BACKLIGHT_POWER_OFF;
> +	}
>  
>  	bl->props.brightness = 1;
>  
>  	init_brightness = backlight_get_brightness(bl);
> -	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
> -	if (ret) {
> -		dev_err(dev, "failed to set initial brightness\n");
> -		return ret;
> +
> +	for (i = 0; i < gbl->num_gpios; i++) {
> +		ret = gpiod_direction_output(gbl->gpiods[i], init_brightness);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					"failed to set gpio %u direction\n",
> +					i);
>  	}
>  
>  	platform_set_drvdata(pdev, bl);
> -- 
> 2.34.1
> 

