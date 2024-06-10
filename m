Return-Path: <linux-arm-msm+bounces-22195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1E90224D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 15:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CFA2B209D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA89D823CB;
	Mon, 10 Jun 2024 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iy9X2o9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CB823A3;
	Mon, 10 Jun 2024 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024570; cv=none; b=M/lDc+Ux5WBWnhBJ5c7NBVFwBBym8L01GTpAUDngQh8ggR2jooo5betxsFix/1pwudOwJ3G06ALJyKhmnTSEIOCQBfQaQHhmVh13LhXL1h+Wvos9DbUETBepoMM/+mtFhGgpAxtcat0wg6GnvcikosEhPvxzUfHcBhrJZ34nvjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024570; c=relaxed/simple;
	bh=p7sK+lWKq/e0CGwf5/tnpChLf3M+KMSWrSTB9SN8IkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahMxJxSKXH5JBCzCwrLyoEp2JCiUR2jEdPcH+y1JIa6qIZjANiIdXY9P2C47uGaDIf8S00jMhCcx1WRkPwEqVzP/EyaFW1bWEarTPDTygXJvRPmDWzhooBW0cWzLrJmQyuuH+tju1NeYLUrjd6DGmM8psGqlzm7F1irZG+Eig9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iy9X2o9C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718024569; x=1749560569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p7sK+lWKq/e0CGwf5/tnpChLf3M+KMSWrSTB9SN8IkA=;
  b=iy9X2o9Cr8xRSJ7y1cy2KM9UIXJwgfDOLOV1NJmCVWnZkuFeNPN3Jyu5
   dR9UROPqhpKo/W0yLt8CxmENouA4QYcPM4da16t0UG246FIr3Cv2DBAdp
   eVdPgngVeZB+hHW0L8cxfxt2TTFNQu5uNa1HIVuxqIiH6XwTsZQHlu9LK
   eFEu9zz1L9JlfUNjTmCY7S3Ywda4RHRLW0VvVnven/exTimrtGO5GNBs0
   q/vs4xVwzeA9K/mD9Heo70BMDD+d9nAp3Hvq9ZeWJENuzp9LOnnugxkFD
   2HY5gZUdFWHulQ1x4Dt7LPPZ/LZdFldk5xQ1XIQx0taboCl6Sohr8kOSr
   A==;
X-CSE-ConnectionGUID: SzFBeSPmS6CA6QJUH04wcA==
X-CSE-MsgGUID: uX7vODkpT8OfASAKp6cLLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26094316"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26094316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 06:02:49 -0700
X-CSE-ConnectionGUID: y2UqLu/4QO6CVC/YWRKhlQ==
X-CSE-MsgGUID: U6GayEYRQe2D0cKllcktdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="76510597"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa001.jf.intel.com with SMTP; 10 Jun 2024 06:02:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 10 Jun 2024 16:02:45 +0300
Date: Mon, 10 Jun 2024 16:02:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] usb: typec-mux: nb7vpq904m: unregister typec
 switch on probe error and remove
Message-ID: <Zmb5dVRz46szJtHc@kuha.fi.intel.com>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-2-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-2-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:14PM +0200, Neil Armstrong wrote:
> Add the missing call to typec_switch_put() when probe fails and
> the nb7vpq904m_remove() call is called.
> 
> Fixes: 348359e7c232 ("usb: typec: nb7vpq904m: Add an error handling path in nb7vpq904m_probe()")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index ed93194b16cf..569f1162ee2e 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -415,7 +415,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  
>  	ret = nb7vpq904m_parse_data_lanes_mapping(nb7);
>  	if (ret)
> -		return ret;
> +		goto err_switch_put;
>  
>  	ret = regulator_enable(nb7->vcc_supply);
>  	if (ret)
> @@ -458,6 +458,9 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  	gpiod_set_value(nb7->enable_gpio, 0);
>  	regulator_disable(nb7->vcc_supply);
>  
> +err_switch_put:
> +	typec_switch_put(nb7->typec_switch);
> +
>  	return ret;
>  }
>  
> @@ -471,6 +474,8 @@ static void nb7vpq904m_remove(struct i2c_client *client)
>  	gpiod_set_value(nb7->enable_gpio, 0);
>  
>  	regulator_disable(nb7->vcc_supply);
> +
> +	typec_switch_put(nb7->typec_switch);
>  }
>  
>  static const struct i2c_device_id nb7vpq904m_table[] = {
> 
> -- 
> 2.34.1

-- 
heikki

