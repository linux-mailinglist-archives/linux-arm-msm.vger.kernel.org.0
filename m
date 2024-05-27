Return-Path: <linux-arm-msm+bounces-20575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F738CFC97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41BBD1F22AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3270139D0A;
	Mon, 27 May 2024 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G7RhDco3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14045139CFC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801377; cv=none; b=QhB596y2y59UCXY4X2TDbDg7qZHOcS14VkQLdYUlHxtV8OPx1SKGJ2jcgjAFlvlTk1uYY8POZ5FhsBMnGRUifnufAwZZqtFFu8yQnZPs3MtwtYxuQgdFId9FZt671EcBYiwBx60ss32Kp8TVkoYQal6YpdbB+azrs3VuAsepS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801377; c=relaxed/simple;
	bh=Ue2tVsGDVZ2DgPwjPShSInk2BKkdPtg1Dw6O8JfqzSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aODHdZszfBTLN4IITzqXipY5OVFnkIcpHX7hqRlggB3kej5obiqEnYAWxE/AwnGAgohaKra9yQ62wILXkKvkLwtojbjX8Ou1REi2OXgRHPMoldO5uIbExSDBullERKV5co51kkaN16qAh9D9PfENhou+OmzJoaKZnIUkhE8/d/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G7RhDco3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295a66e775so3311433e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716801374; x=1717406174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQtx7jnj8OkHf0JB5BmFRhF9zFMLEU0M0KHpSnf/nfg=;
        b=G7RhDco3IqA1kYDPgp1XW3bthkDMKHUu919KX5C8hjYTGFVK64m+FRCApIO1t5FdU3
         59MtWsoEroq7ddXw4XE6P8+xkKdmkIprTv31o85RhMoZxIi4hc8eVTjuXYYJKmc5Pr9O
         VLMyrKjpO89j+I9+bQN4ZmYz1pRp89A1+UWYEd6oaiYdibz9Y7rYEhRPZTQBcqj3azHh
         syVvXwXU6XcyfMCMimIRvNLTHP6xgzk+iJtTXvP0lfgW2zditVbuTNx93bwXEu8D7SHz
         1Y+htTo/R0AtUTClwAVflNbX/BvzXJoKNn3TXKO71obX5gk6/UxLsA2PjNw5FyhsLV0z
         YB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716801374; x=1717406174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQtx7jnj8OkHf0JB5BmFRhF9zFMLEU0M0KHpSnf/nfg=;
        b=dO9GL2Il3IYm2mSuH+NKMtTB4bjWxje972k3evnw8LXOK8d51mVMZY9MznaabT9G1U
         lOsg47q6Pm0SdBjuV8JMOdwGGfun3OXBu+gIg/jwQXo/AIIufN6sgZt5Qx/QxA86yj/C
         8MYTjOeMoUGOLLqWUeXd7B4dGVjFKpvvo9J/4/3Wiht9uYXnFpHnRiIY6z0XL14JpcZX
         CqOi7zMHuDdiQ/gaafbuvFkT8vIQ+KeEpywoFwXQU+3S5vu/Pp3yundWqJrfimWKZGZq
         5gS7md2JS8bwPlrDDOY2EUEZNce3TrX6YSbpCn7irm2I3bO4fSCzX+aBAcsMDpCMltA3
         ds5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnlHDcAHb8kuq2K/rL7Y5qD+ZJKAuOYbCkMCqBcNdLSY8tCtTUB1KJ2ihOTJQekAaseKJqToOxf0HBsPqkF3tSC9ce0Ia2zRawHt/Q+w==
X-Gm-Message-State: AOJu0YzIPwkGLsG+ZWUl6Kay/vSZkidI6PeGComVox52rEBIuW7r5Chy
	l9LaN4OQ9Vc7igxAJ8outulrFXL3nPuH/zEDJmTkoSP7ZWBKzmyBJuaU61WM+JxoT0guSw+km2P
	D
X-Google-Smtp-Source: AGHT+IHKz4XIu/b8vO3XvJlh0od1NHwsAv2tZUl+/Bf2xMSJLGQmRBc9d+aotEQhWhibFZyygstyWg==
X-Received: by 2002:a05:6512:224c:b0:518:c69b:3a04 with SMTP id 2adb3069b0e04-529612c0598mr11389178e87.0.1716801374132;
        Mon, 27 May 2024 02:16:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529aa059d07sm185070e87.233.2024.05.27.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:16:13 -0700 (PDT)
Date: Mon, 27 May 2024 12:16:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec-mux: ptn36502: broadcast typec state to
 next mux
Message-ID: <llt5o2btdlz5ckvhd3a73kxxkrm544wi3b2xhnytwg62ekcm3l@ck6wqglx35d6>
References: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-0-79ec91381aba@linaro.org>
 <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-1-79ec91381aba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-sm8x50-upstream-retimer-broadcast-mode-v1-1-79ec91381aba@linaro.org>

On Mon, May 27, 2024 at 09:45:29AM +0200, Neil Armstrong wrote:
> In the Type-C graph, the ptn36502 retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the ptn36502 retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> --
> 
> Reported Tested by Luca in [1]
> 
> [1] https://lore.kernel.org/all/D1HOCBW6RG72.1B2RKGKW2Q5VC@fairphone.com/
> ---
>  drivers/usb/typec/mux/ptn36502.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ptn36502.c b/drivers/usb/typec/mux/ptn36502.c
> index 0ec86ef32a87..129d9d24b932 100644
> --- a/drivers/usb/typec/mux/ptn36502.c
> +++ b/drivers/usb/typec/mux/ptn36502.c
> @@ -67,6 +67,7 @@ struct ptn36502 {
>  	struct typec_retimer *retimer;
>  
>  	struct typec_switch *typec_switch;
> +	struct typec_mux *typec_mux;
>  
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
>  
> @@ -235,6 +236,7 @@ static int ptn36502_sw_set(struct typec_switch_dev *sw, enum typec_orientation o
>  static int ptn36502_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
>  {
>  	struct ptn36502 *ptn = typec_retimer_get_drvdata(retimer);
> +	struct typec_mux_state mux_state;
>  	int ret = 0;
>  
>  	mutex_lock(&ptn->lock);
> @@ -252,7 +254,14 @@ static int ptn36502_retimer_set(struct typec_retimer *retimer, struct typec_reti
>  
>  	mutex_unlock(&ptn->lock);
>  
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	mux_state.alt = state->alt;
> +	mux_state.data = state->data;
> +	mux_state.mode = state->mode;
> +
> +	return typec_mux_set(ptn->typec_mux, &mux_state);
>  }
>  
>  static int ptn36502_detect(struct ptn36502 *ptn)
> @@ -321,9 +330,18 @@ static int ptn36502_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(ptn->typec_switch),
>  				     "Failed to acquire orientation-switch\n");
>  
> +	ptn->typec_mux = fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(ptn->typec_mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ptn->typec_mux),
> +				    "Failed to acquire mode-switch\n");
> +		goto err_switch_put;
> +	}
> +
>  	ret = regulator_enable(ptn->vdd18_supply);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to enable vdd18\n");
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to enable vdd18\n");
> +		goto err_mux_put;
> +	}
>  
>  	ret = ptn36502_detect(ptn);
>  	if (ret)
> @@ -363,6 +381,12 @@ static int ptn36502_probe(struct i2c_client *client)
>  err_disable_regulator:
>  	regulator_disable(ptn->vdd18_supply);
>  
> +err_mux_put:
> +	typec_mux_put(ptn->typec_mux);
> +
> +err_switch_put:
> +	typec_switch_put(ptn->typec_switch);

Please split typec_switch_put() to a separate patch, it's a fix.

> +
>  	return ret;
>  }
>  
> @@ -374,6 +398,9 @@ static void ptn36502_remove(struct i2c_client *client)
>  	typec_switch_unregister(ptn->sw);
>  
>  	regulator_disable(ptn->vdd18_supply);
> +
> +	typec_mux_put(ptn->typec_mux);
> +	typec_switch_put(ptn->typec_switch);
>  }
>  
>  static const struct i2c_device_id ptn36502_table[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

