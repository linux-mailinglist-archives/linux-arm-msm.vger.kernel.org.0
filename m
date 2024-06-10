Return-Path: <linux-arm-msm+bounces-22196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ED7902256
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 15:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88D7528576E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 13:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF71281219;
	Mon, 10 Jun 2024 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2d9MYz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B207F490;
	Mon, 10 Jun 2024 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024679; cv=none; b=Zj2HKccNt+HaBrrDRMM6Ct2ViF/QqmyYEh7woCNj2Tywr2zzPDeMFNRY2Yu0mPpv1dZI98AQMypmwdk7L/5rUEo7jqkk7+m1Ik3c3Pj8IW1Eq/vm+bsoWIzoP+36t0Nf1tVNjYOt3E+uj1v7UuvMjTDl+yWA4YAN68Bn7HEvPao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024679; c=relaxed/simple;
	bh=WN0Nt9uOr7Y9XeU2Noy57KGOiDQUxlFpu8h3EU8FfRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhXxNEgJpqW4qYTzHm8uPJHW2uiZlcMapBPg4ZGiVxZsHLxQiRrG5uSD5DEQJDDR5E/o5ehWpTWwsT3bf4t+KQWCt65uPo4P7MCgPLHo4JoOHSRlwFefbgUH8NqfDSn1kNuXAMJ2qx9Kw1PStKtrLezyabN3XgUHjo7TKEkWKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2d9MYz7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718024678; x=1749560678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WN0Nt9uOr7Y9XeU2Noy57KGOiDQUxlFpu8h3EU8FfRY=;
  b=c2d9MYz74t8K+ldehXe5ZPKNIoATjlLS+sOQ5U1U7uMHLV6KZeA0S+9J
   fo5SvDyFXM5TSRqfllyUwL2G4ACb/IfVJL2x9l7ZCBE5sfLBMkr+KRGvm
   Bj7aztClMJMB7Lvz//a9U/9+HDeCfRkBZF5iFQZXhTC7spTsxAGmE2oxN
   G2WSRulCTCgOIlmTwv5Tl4UReoK0orrTYFR5JMUoQheA+8s5+Y4eXOYH/
   5TrFISuz1qSdd61p6OgtXOAGVo5F3bOc4x8PuvqSmIpx9opdko7v1uDRn
   sRgMbmgEvG/0XQI637XiT+Vf+08sqBnaLOCxWFeMB4UEdHSiD2qDV8mYY
   w==;
X-CSE-ConnectionGUID: nl36BbkiQjy1AqYEur5pig==
X-CSE-MsgGUID: 0dPvkh/LSKSLSmr0LORvgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25789188"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="25789188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 06:04:37 -0700
X-CSE-ConnectionGUID: s+hnK7EaSBKt1HZReG1eOg==
X-CSE-MsgGUID: jOFhMznIT3610lm46GlnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="70216797"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa001.fm.intel.com with SMTP; 10 Jun 2024 06:04:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 10 Jun 2024 16:04:33 +0300
Date: Mon, 10 Jun 2024 16:04:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: typec-mux: ptn36502: broadcast typec state
 to next mux
Message-ID: <Zmb54WG2tcKPD/Zf@kuha.fi.intel.com>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-3-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-3-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:15PM +0200, Neil Armstrong wrote:
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

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Reported Tested by Luca in [1]
> 
> [1] https://lore.kernel.org/all/D1HOCBW6RG72.1B2RKGKW2Q5VC@fairphone.com/
> ---
>  drivers/usb/typec/mux/ptn36502.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ptn36502.c b/drivers/usb/typec/mux/ptn36502.c
> index 88136a6d6f31..129d9d24b932 100644
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
> @@ -321,10 +330,17 @@ static int ptn36502_probe(struct i2c_client *client)
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
>  	if (ret) {
>  		ret = dev_err_probe(dev, ret, "Failed to enable vdd18\n");
> -		goto err_switch_put;
> +		goto err_mux_put;
>  	}
>  
>  	ret = ptn36502_detect(ptn);
> @@ -365,6 +381,9 @@ static int ptn36502_probe(struct i2c_client *client)
>  err_disable_regulator:
>  	regulator_disable(ptn->vdd18_supply);
>  
> +err_mux_put:
> +	typec_mux_put(ptn->typec_mux);
> +
>  err_switch_put:
>  	typec_switch_put(ptn->typec_switch);
>  
> @@ -380,6 +399,7 @@ static void ptn36502_remove(struct i2c_client *client)
>  
>  	regulator_disable(ptn->vdd18_supply);
>  
> +	typec_mux_put(ptn->typec_mux);
>  	typec_switch_put(ptn->typec_switch);
>  }
>  
> 
> -- 
> 2.34.1

-- 
heikki

