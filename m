Return-Path: <linux-arm-msm+bounces-20576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 008428CFCA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81D561F227E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A49139CFC;
	Mon, 27 May 2024 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXWfMfZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A285139CF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801516; cv=none; b=HFlYd1SqNt/IR1DQwjKatQq5rz63ukdpQFUENeKupCzurWxV4GJAY/kSHP1fqFDh1SLLNfcAfJi7qCQr3aFhHBxw38rnc3CK9vooQhJvgnSG+IaqKcYTKnldgutFEaWd4W866F0iEOOCTs+AlcaWzBsxAk9O9OlI1fov5JhCVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801516; c=relaxed/simple;
	bh=wQcfv6030ij82jUK6+/wla/4dKOwktAWdTrmIqKWvnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIX7mrPSIQHIVyXj655SzE6O2QtyQAPMldj54W2C+GtlvgM/2uGjFtiLA6w8S7fVSTB5wE6VLU4ND/DxW5TCxN3PHs7gZjX0Fx8u/spUBakRY//3Qoh+2MVqXKPEozbBAIbYGgXl4GG6Vo77r3VXqBefKU+6fJTiCqQXblyWIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXWfMfZ7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e73359b8fbso87960521fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801513; x=1717406313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElGvATidgGffK1r5Dzp1IOrlLnZD2i4ep1EfK0h/Tms=;
        b=zXWfMfZ7TMtR/34NQ59daSb9BgImqB6PPvQegbRy512a5zDIwa2nAASZEElW73Ahj/
         CPRh7FY1zmyUpbCya51XpTu5QG1mUM5Pf5zA3gp0D2vo/4BO+WvXDXk94fBwVsmWFCQR
         lQpr+WhyUSeBz0QtZwVgvghlGqhVlCQKIGN4A8eisc9btN5cmauzpX7URg3jB92S89Qw
         OJ1IlJ0j8BL3Cd1AooBveVuD6gUpNTkn4jyD8iLngfIGEgMnu8NTo8NhN2G7CTtsnQ67
         OP/SuN/sJ2oy9Z2aZOtgiC3MJiSNqvbLFoN0yAJjAy/V3cswUW9ArG4By8DR1NJ77loh
         0KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801513; x=1717406313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElGvATidgGffK1r5Dzp1IOrlLnZD2i4ep1EfK0h/Tms=;
        b=EeUHfpC2pWswDdFAcieryiRAS75WgkBh8YTMZ/KcxpDYeHRiCzxTjfaC4kFyD3eVDt
         E747hlL7FgwLMdE+S+fo+FYw6boqnf/odKrhfkZjVC3xCzLR4lk0mg8ZVWwtYW4hwbZ7
         D3i1WIaHiIc2wSk9lbkxvUrRKVu/UNe3qTHqVoYE6ntApab8wGPiJjLb9RJekb9RubQL
         A8yVbE/btDF44ti0EcwgGTTykw9p7OiaAwtCob1D4iQGhzd0sBHEZbJu2ZKYfubAxX6L
         ZGBdAnCYZyylNUMq8yfX0jkExEc+uoz3+WMXVWL6Ow/nGzRkVq3ewhDcPyCbXISvAW9n
         JxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWECShsj/tKzAo1CcGAhlIS1jO7iaHF7IOvWoHjcfSwqh/i3ZUdyJBqx/lGOWiIUmsEKQCSMDYhP0hqS8IcOITUbs9hWozkjFh+DP2y7w==
X-Gm-Message-State: AOJu0Ywtu1RDTqrf850orRSHKGSxV9RSppfIWm6ZE750hbi6eCVgShRE
	r3nnazEFPl5+nrdQnu8qjJpWcazKFLv0NOL0EAN50NZzvzJwo9uGj9u+vIcFu4Q=
X-Google-Smtp-Source: AGHT+IFhFokDStqP88zftcz543WctnBkGzESkn0T+HS6G4fMr6/934An9b6sPz9x1PZPdPLBTyz6tA==
X-Received: by 2002:a2e:a710:0:b0:2dd:cb34:ddbc with SMTP id 38308e7fff4ca-2e95b27b108mr66759911fa.48.1716801512661;
        Mon, 27 May 2024 02:18:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4c32sm18295741fa.66.2024.05.27.02.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:18:32 -0700 (PDT)
Date: Mon, 27 May 2024 12:18:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec-mux: nb7vpq904m: broadcast typec state to
 next mux
Message-ID: <jdqnlfuqount32ralk4jr3beobdt7dgs3h4lcpxj5fbmanysl6@pgwqeozl7ow5>
References: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org>
 <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-2-79ec91381aba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-2-79ec91381aba@linaro.org>

On Mon, May 27, 2024 at 09:45:30AM +0200, Neil Armstrong wrote:
> In the Type-C graph, the nb7vpq904m retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the nb7vpq904m retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index b17826713753..efb10f890fed 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -69,6 +69,7 @@ struct nb7vpq904m {
>  
>  	bool swap_data_lanes;
>  	struct typec_switch *typec_switch;
> +	struct typec_mux *typec_mux;
>  
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
>  
> @@ -275,6 +276,7 @@ static int nb7vpq904m_sw_set(struct typec_switch_dev *sw, enum typec_orientation
>  static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
>  {
>  	struct nb7vpq904m *nb7 = typec_retimer_get_drvdata(retimer);
> +	struct typec_mux_state mux_state;
>  	int ret = 0;
>  
>  	mutex_lock(&nb7->lock);
> @@ -292,7 +294,14 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
>  
>  	mutex_unlock(&nb7->lock);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	mux_state.alt = state->alt;
> +	mux_state.data = state->data;
> +	mux_state.mode = state->mode;
> +
> +	return typec_mux_set(nb7->typec_mux, &mux_state);
>  }
>  
>  static const struct regmap_config nb7_regmap = {
> @@ -411,9 +420,16 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(nb7->typec_switch),
>  				     "failed to acquire orientation-switch\n");
>  
> +	nb7->typec_mux = fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(nb7->typec_mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(nb7->typec_mux),
> +				    "Failed to acquire mode-switch\n");
> +		goto err_switch_put;
> +	}
> +
>  	ret = nb7vpq904m_parse_data_lanes_mapping(nb7);
>  	if (ret)
> -		return ret;
> +		goto err_mux_put;
>  
>  	ret = regulator_enable(nb7->vcc_supply);
>  	if (ret)
> @@ -456,6 +472,12 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  	gpiod_set_value(nb7->enable_gpio, 0);
>  	regulator_disable(nb7->vcc_supply);
>  
> +err_mux_put:
> +	typec_mux_put(nb7->typec_mux);
> +
> +err_switch_put:
> +	typec_switch_put(nb7->typec_switch);

Same comment, typec_switch_put should go to a separate commit. IMHO it
almost begs us to have devm_fwnode_typec_mux_get() and
devm_fwnode_typec_switch_get().

> +
>  	return ret;
>  }
>  
> @@ -469,6 +491,9 @@ static void nb7vpq904m_remove(struct i2c_client *client)
>  	gpiod_set_value(nb7->enable_gpio, 0);
>  
>  	regulator_disable(nb7->vcc_supply);
> +
> +	typec_mux_put(nb7->typec_mux);
> +	typec_switch_put(nb7->typec_switch);
>  }
>  
>  static const struct i2c_device_id nb7vpq904m_table[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

