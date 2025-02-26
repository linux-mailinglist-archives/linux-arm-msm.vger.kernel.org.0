Return-Path: <linux-arm-msm+bounces-49466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22025A45AEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 364CF3A915C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1115426D5C7;
	Wed, 26 Feb 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLRVEi+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76D23816C;
	Wed, 26 Feb 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563777; cv=none; b=qn99L/j3xQV4FQ3nby4DxVh82UhUg0WMSzjrim0LWtU9ZNXfggtJ3MnKKwVBDeXTJPPi66hLJigW8CrxZ6tRAoiqf5fK0Tk8dB8at6qohKvg0SyytHjGtKt80P+2pOnp8QPWKCWy7FbI1hvkeCLlaQDNcdvW021cZeK1JJfA/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563777; c=relaxed/simple;
	bh=uLcfPblXp3Dq6tC1+K5w8I0KVlAA3UXTDKqyfaM/JgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3o6e5LqBSlGjrpAeQjbqg7gFNEY4sjhuF7x6LZCPHxVOV35M3OOvqwL7LNQQgJuWhxG2S8NIVJbpKh5pE3ZhFGZjB+eWqpforpvABFx+/RFeskHrOcFchf9eTaUUqB3cSU6+ruv3hxU+cwJlj0y66RB9X1ZHMU+8o2VIK80T2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLRVEi+G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563777; x=1772099777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uLcfPblXp3Dq6tC1+K5w8I0KVlAA3UXTDKqyfaM/JgI=;
  b=SLRVEi+GofDcJhQgEEbdwWI9oJe/GOkYop0Dgp5kp6j4rg//zlfZueEq
   q6MctfIHCdBIC/DfQlTMHaSQNrJ3cZ5E7kpFFwX0Gllbe1BT+4/Paykg+
   Ec4HZTOtde3RjwGOhyVjQy4VVk1fOmgzAsyGN7ZrWfSYRHkLON1V5GXiE
   ZmZ4o8YsmcEbwfodAW0YScbzfIMO8KmwegF3CeICiQ0EukRc5v//6im5B
   2eZCw4fnec2oCAP6l8+bpA8XCCEokinf0+gjThEpyqMEZ+ZSZNMv6twBR
   PagxD2D98qpc0aNsgtc94cpd8lBdnqDGvQsmmNb6E+o5ybhLNFupzxuvr
   w==;
X-CSE-ConnectionGUID: pAzU2cPRTF2YhQpAFYgElA==
X-CSE-MsgGUID: +5wFp+ViS0GsYYa8R9q9uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41317133"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41317133"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:56:14 -0800
X-CSE-ConnectionGUID: zPzLMhNhRfeLeImi2/euhw==
X-CSE-MsgGUID: 0sPndXcsTEqsht5X+w/tFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="139882556"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 26 Feb 2025 01:56:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Feb 2025 11:56:09 +0200
Date: Wed, 26 Feb 2025 11:56:09 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: typec: ps883x: fix configuration error handling
Message-ID: <Z77lOR8nUQSNafm0@kuha.fi.intel.com>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
 <20250218152933.22992-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218152933.22992-4-johan+linaro@kernel.org>

On Tue, Feb 18, 2025 at 04:29:33PM +0100, Johan Hovold wrote:
> Propagate errors to the consumers when configuring the retimer so that
> they can act on any failures as intended, for example:
> 
> 	ps883x_retimer 2-0008: failed to write conn_status_0: -5
> 	pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to setup retimer to DP: -5
> 
> Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/ps883x.c | 36 ++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index f8b47187f4cf..ad59babf7cce 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -58,12 +58,31 @@ struct ps883x_retimer {
>  	unsigned int svid;
>  };
>  
> -static void ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
> -			     int cfg1, int cfg2)
> +static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
> +			    int cfg1, int cfg2)
>  {
> -	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
> -	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
> -	regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
> +	struct device *dev = &retimer->client->dev;
> +	int ret;
> +
> +	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
> +	if (ret) {
> +		dev_err(dev, "failed to write conn_status_0: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_1, cfg1);
> +	if (ret) {
> +		dev_err(dev, "failed to write conn_status_1: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_2, cfg2);
> +	if (ret) {
> +		dev_err(dev, "failed to write conn_status_2: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static int ps883x_set(struct ps883x_retimer *retimer)
> @@ -74,8 +93,7 @@ static int ps883x_set(struct ps883x_retimer *retimer)
>  
>  	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
>  	    retimer->mode == TYPEC_STATE_SAFE) {
> -		ps883x_configure(retimer, cfg0, cfg1, cfg2);
> -		return 0;
> +		return ps883x_configure(retimer, cfg0, cfg1, cfg2);
>  	}
>  
>  	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
> @@ -113,9 +131,7 @@ static int ps883x_set(struct ps883x_retimer *retimer)
>  		return -EOPNOTSUPP;
>  	}
>  
> -	ps883x_configure(retimer, cfg0, cfg1, cfg2);
> -
> -	return 0;
> +	return ps883x_configure(retimer, cfg0, cfg1, cfg2);
>  }
>  
>  static int ps883x_sw_set(struct typec_switch_dev *sw,
> -- 
> 2.45.3

-- 
heikki

