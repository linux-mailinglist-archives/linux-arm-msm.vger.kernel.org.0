Return-Path: <linux-arm-msm+bounces-22197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D83C902263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 15:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95D81F24462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850E81754;
	Mon, 10 Jun 2024 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itLslvpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FB80BFC;
	Mon, 10 Jun 2024 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024782; cv=none; b=EDA8GFm1TgeqgSG9Fj8Mnb/ocFnnVlAGnAuAxM3xBattGD9O93VioOGFIMz9FUQjANYQL21SaBPDliPTzLxAyfC0tvLMknr3Gwyy2msuqeC/xfUpwphHsiyNoKs2U/KT3cb+CeXciNScOEYw2GOxATeJMLUCb08Rz6vNHX4xE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024782; c=relaxed/simple;
	bh=144hdn/4UZt+z7DwMhtvAAmuC7HYAGH+e5myzRdaVFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFrDApz0bb+0+C+1+dMoOK/EyjvE0I5BxomLlNdAs0L/z0uuRUEVmb3K+prU+GKCDXFievnDQZ3gRmDv/iqJCAQcG3FCgZ+IWNm0XNUThaPugTIFh36mAP1GUYdifQ/vyjSepNqxCCglxsoIxI+0VtWuVqK4+P/9IzpGFTVBXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itLslvpq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718024781; x=1749560781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=144hdn/4UZt+z7DwMhtvAAmuC7HYAGH+e5myzRdaVFk=;
  b=itLslvpqbKmAHOHm1S2Ki+T8H3KV7eT5FAPzaPTJAZGmSR/4CqK7yCc5
   mL1k5WnO4vngXGvrA++Vyu2Iqk8pav8Grza6vxAX/9+kDmVw9qnJaqBnY
   4J45zR4AcZF5hMw2HjzKdoRnyqJ+TBHdUFAQfSRhrjZy3vz6dk9CbdE+u
   u6JGlGFN9o0IRO6ozh8xiFZntHGdxR+etqF9S9xwt16GMHEuQoSsfuH8g
   M2Vk6xkBGTUKbeYifq1f9wNubmzaVC80bUGkdXd+DrPW83pU98tDseCqC
   /b+FTZl4X9HzzuyAhFbnNlX3K4Xs357lcBzmw15bQSiAlUFOGAlox6A0f
   w==;
X-CSE-ConnectionGUID: yMq50/MMSrejOp7yw+Hzrg==
X-CSE-MsgGUID: tbpF7A2TSoKsw4fgTmfjgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14803181"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14803181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 06:06:08 -0700
X-CSE-ConnectionGUID: VTxdETbATgWpc52gh9Kntg==
X-CSE-MsgGUID: QDZQZKyrRIW2inSAdjcRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="38890468"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa007.fm.intel.com with SMTP; 10 Jun 2024 06:06:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 10 Jun 2024 16:06:03 +0300
Date: Mon, 10 Jun 2024 16:06:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec-mux: nb7vpq904m: broadcast typec state
 to next mux
Message-ID: <Zmb6O9Cm0dyhS81x@kuha.fi.intel.com>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:16PM +0200, Neil Armstrong wrote:
> In the Type-C graph, the nb7vpq904m retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the nb7vpq904m retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index 569f1162ee2e..b57b6c9c40fe 100644
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
> @@ -413,9 +422,16 @@ static int nb7vpq904m_probe(struct i2c_client *client)
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
> -		goto err_switch_put;
> +		goto err_mux_put;
>  
>  	ret = regulator_enable(nb7->vcc_supply);
>  	if (ret)
> @@ -458,6 +474,9 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  	gpiod_set_value(nb7->enable_gpio, 0);
>  	regulator_disable(nb7->vcc_supply);
>  
> +err_mux_put:
> +	typec_mux_put(nb7->typec_mux);
> +
>  err_switch_put:
>  	typec_switch_put(nb7->typec_switch);
>  
> @@ -475,6 +494,7 @@ static void nb7vpq904m_remove(struct i2c_client *client)
>  
>  	regulator_disable(nb7->vcc_supply);
>  
> +	typec_mux_put(nb7->typec_mux);
>  	typec_switch_put(nb7->typec_switch);
>  }
>  
> 
> -- 
> 2.34.1

-- 
heikki

