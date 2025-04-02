Return-Path: <linux-arm-msm+bounces-53016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58728A78AC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68B8318858A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 09:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2F32356CE;
	Wed,  2 Apr 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ug640ljF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBA723535B;
	Wed,  2 Apr 2025 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585121; cv=none; b=qhroQwFJ3gvCq+Qwy2Boza6EbnruKs4y8ZbjLE6ZiKP0NVeINIfROYoad8WmW+d4ZvEwXCoVB0EFpXhSg4ldJHUYyUTi10lo4i0g+FIzeJWZjDUmgr08GED1tScUr3rnCYXxo7fAK7kEPsHdkJCgOEhGf4FkXw3JJ8xMkfJp0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585121; c=relaxed/simple;
	bh=X1/GrPb0w/5K/OAdw1/zmUXP2G79m5jGuXLRS/2mVZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S85XNEIsiG05ZBPeUUg5GU2POgN1uLRcPxgCa7paFpIj1thfenUtxFdc8BLrgGjaTeNxdfUcrnS5dacOu6l5XkVL8/3mZp1lPyy0Np6V14pA6DwjUk4SLuwmjFc0UriDzymycBq95jHg/CgkuWGPYp+nG6CHrcHPIj9ME5XsYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ug640ljF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDB5C4CEDD;
	Wed,  2 Apr 2025 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743585120;
	bh=X1/GrPb0w/5K/OAdw1/zmUXP2G79m5jGuXLRS/2mVZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug640ljF2RY0Qn4mv0WrbuMKiPF2CsxT3IzMbkZ4iENg0NBgzhcXRq65rMBYbgQG7
	 VV3kP7boCiYBZFqUm4WlsX/ptUvjNyFQWpEWm0x+2Lz5qgTnKurUFvN0Z31fIJUIyb
	 AgMFlkqefELZZXHvTJ7E9bQNRa3SINWtMkQujQoreHcLZ0rd4yjyJ0breDjrF9KExF
	 nbUva+ijr/UJ2UluOFdT8g/6egskWCY5jNi/GGA04fufeljOMS95Nxacln1eH5NUuZ
	 Tuzqd2rZbK/f1wU1KJXBguUpwSIE3M75KX9paVj5nJd0AP1gRR54Q/OOZHBsMCMmA4
	 6VQyHIulicGFQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzu8i-000000005aY-3zAU;
	Wed, 02 Apr 2025 11:12:05 +0200
Date: Wed, 2 Apr 2025 11:12:04 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
	conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
	tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Christopher Obbard <christopher.obbard@linaro.org>
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support
 for hp audio mux
Message-ID: <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327100633.11530-6-srinivas.kandagatla@linaro.org>

On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On some platforms to minimise pop and click during switching between
> CTIA and OMTP headset an additional HiFi mux is used. Most common
> case is that this switch is switched on by default, but on some
> platforms this needs a regulator enable.
> 
> move to using mux control to enable both regulator and handle gpios,
> deprecate the usage of gpio.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> @@ -3261,11 +3276,26 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>  		return dev_err_probe(dev, wcd938x->reset_gpio,
>  				     "Failed to get reset gpio\n");
>  
> -	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
> -						GPIOD_OUT_LOW);
> -	if (IS_ERR(wcd938x->us_euro_gpio))
> -		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> -				     "us-euro swap Control GPIO not found\n");
> +	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);

Running with this patch on the CRD I noticed that this now prints an
error as there is no optional mux (or gpio) defined:

	wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)

You need to suppress that error in mux_get() to allow for optional muxes
to be looked up like this.

> +	if (IS_ERR(wcd938x->us_euro_mux)) {
> +		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
> +
> +		/* mux is optional and now fallback to using gpio */
> +		wcd938x->us_euro_mux = NULL;
> +		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +		if (IS_ERR(wcd938x->us_euro_gpio))
> +			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
> +					     "us-euro swap Control GPIO not found\n");
> +	} else {
> +		ret = mux_control_try_select(wcd938x->us_euro_mux, wcd938x->mux_state);
> +		if (ret) {
> +			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
> +			wcd938x->mux_setup_done = false;
> +			return ret;
> +		}
> +		wcd938x->mux_setup_done = true;
> +	}

Johan

