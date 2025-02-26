Return-Path: <linux-arm-msm+bounces-49464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0ADA45ADA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B59883A8AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE23C2459E9;
	Wed, 26 Feb 2025 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T37V6VPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DF4258CED;
	Wed, 26 Feb 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563671; cv=none; b=AJZbFAQ//RimSmbVydLn6y+ZbzS/4RD3ncokdweaApYcdmPLFc8HaC/mXoQne9gdtLba6BWA0uwo9O9cujHUZQAdHAQFf+5I8SgTZUfJDl49yaEYG4U3yynKc0XRjjBL00Tb9F3qM+Wgm5yhcWhr5ptWfbc7fV1mmov/hst0Wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563671; c=relaxed/simple;
	bh=ynYdVPkFH8NphPZahSZ/UfNkTCSOldanlpu9GJfKG88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKmwl+UKCjsfSSoFgOJmhH0u1ZuZNkNdRJo8LDXx1pUwweups3rJ13omgyQ3xpCjQEWl+p7iUAY6/wfk+Afdmdd3ntUP5vmMLmSRSuu/INVVPPSHYknKaGjccaDcHnyqH1RkZaYnNLtohzxZirDYnpqO10NsYP+1nbvJIpKrPS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T37V6VPH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563670; x=1772099670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynYdVPkFH8NphPZahSZ/UfNkTCSOldanlpu9GJfKG88=;
  b=T37V6VPHWz/GvggZXfYQhvn/Vylz0zulHjHkAYtg8l+/2QhV9ZKgjSHj
   GP7p+FcqWaFfBKpwJ/x7yKXIXZIukDxJrOGhgSi4y4D8XJzxKZHb0Hbmv
   6QY/Yc7JzdNsxHm4Na7ePYvfx7FBSHUvCj66E2mUbqozEKk1R+/8fM/H/
   Ds7HJRcHJ3HKFa7hbFMek5bhpJim6LWNVGSiSX73cYoBEcJCJpChDSKU5
   v8fZy+nfgXaAJawmKDIPyq7/a7do3aGaMVrFBiZ2JOjNN7UjJxuv/5nni
   /rJ6SXc4Ur5jnsgeUipLYDSKELPlJqqOgG5zDH5JK1XqR6419x44ZPR/Q
   w==;
X-CSE-ConnectionGUID: lj33qjGSQHW47ySUgZIqLg==
X-CSE-MsgGUID: nh/OEQprQDy/x0CYk/3coQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41103265"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41103265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:54:29 -0800
X-CSE-ConnectionGUID: GwLkxpNnRbeFlR8dW1iuiQ==
X-CSE-MsgGUID: y3dxM7/VQJaUwMmx3AzrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121269320"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa005.fm.intel.com with SMTP; 26 Feb 2025 01:54:25 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Feb 2025 11:54:24 +0200
Date: Wed, 26 Feb 2025 11:54:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: typec: ps883x: fix registration race
Message-ID: <Z77k0MzLV3htrIbd@kuha.fi.intel.com>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
 <20250218152933.22992-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218152933.22992-2-johan+linaro@kernel.org>

On Tue, Feb 18, 2025 at 04:29:31PM +0100, Johan Hovold wrote:
> Make sure that the retimer is fully setup before registering it to avoid
> having consumers try to access it while it is being reset.
> 
> Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/ps883x.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index ef086989231f..274de7abe585 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -346,6 +346,22 @@ static int ps883x_retimer_probe(struct i2c_client *client)
>  		goto err_vregs_disable;
>  	}
>  
> +	/* skip resetting if already configured */
> +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> +			     CONN_STATUS_0_CONNECTION_PRESENT) == 1) {
> +		gpiod_direction_output(retimer->reset_gpio, 0);
> +	} else {
> +		gpiod_direction_output(retimer->reset_gpio, 1);
> +
> +		/* VDD IO supply enable to reset release delay */
> +		usleep_range(4000, 14000);
> +
> +		gpiod_set_value(retimer->reset_gpio, 0);
> +
> +		/* firmware initialization delay */
> +		msleep(60);
> +	}
> +
>  	sw_desc.drvdata = retimer;
>  	sw_desc.fwnode = dev_fwnode(dev);
>  	sw_desc.set = ps883x_sw_set;
> @@ -368,21 +384,6 @@ static int ps883x_retimer_probe(struct i2c_client *client)
>  		goto err_switch_unregister;
>  	}
>  
> -	/* skip resetting if already configured */
> -	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> -			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
> -		return gpiod_direction_output(retimer->reset_gpio, 0);
> -
> -	gpiod_direction_output(retimer->reset_gpio, 1);
> -
> -	/* VDD IO supply enable to reset release delay */
> -	usleep_range(4000, 14000);
> -
> -	gpiod_set_value(retimer->reset_gpio, 0);
> -
> -	/* firmware initialization delay */
> -	msleep(60);
> -
>  	return 0;
>  
>  err_switch_unregister:
> -- 
> 2.45.3

-- 
heikki

