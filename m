Return-Path: <linux-arm-msm+bounces-22189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82570902200
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90AB31C21C12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A3080637;
	Mon, 10 Jun 2024 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwMomoxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEF7F48A;
	Mon, 10 Jun 2024 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023887; cv=none; b=shHTA1bRljQ1qcpTBYY7KmjSa6ijNAMV+5+TMinnXQdBmdLanI7jsafE53Zt9UyqgqQM2bYU88Pif6pHJMOF3RIDuNQ/HdcLs8qsX/kLKpCNvCqnXZtzVj0PTbMNBXHt9yRQeOuNCWzR14pkzN2zf+HFyIGvjbH3aQkFNV3vJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023887; c=relaxed/simple;
	bh=2Fc4pFDCgQPKjxooSwTbGF79zLLOa0fePyJi1yAQFx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czXYwqeJ/C4IcGfz8b3FTi9INaFvs+rWQi3nMo7fRTUtMQh1DtPSUMG5TGGNlCQ+3BG2yRcnRENilyPKOzD8XWIYtfzGcTUwke/c40aPSKKQWEwXvxnjFqugApFOpV+6qx7byEvPPhy5MhOGBAaBQCQ5yfP15IjylyVgKjXahJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwMomoxz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718023886; x=1749559886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Fc4pFDCgQPKjxooSwTbGF79zLLOa0fePyJi1yAQFx0=;
  b=KwMomoxzARXnnn/t2EqatXc+93hBBM71iEZYvOyn3nfPfl9yfKpjQd+/
   EORh4jzamwDXSzIhVmSeCGgZFutKwYzSN3t9AMmBkH38PXRrhnDvvCklo
   COc/Qd91nMXyM+OGclBZtNeGw7nnprNdU3Bs3Wb9gOUfGFiW1wG6H/CYD
   ll9nAsMwb7QKfxAlKBHThuksbG358KPhf7SHtX9UzVD0zh14d7OY1XS+4
   iTau2X7Gn783gSunTB79upvg6lBBnKkJPwxEko8fEz+cG0WiAYtO0ONm+
   usxZOQ8Uh7jrNeOJ77j0fsJEuBIM5fId6/ypkK6Plf41I/AHBsLTWr9WX
   w==;
X-CSE-ConnectionGUID: zwrAxEDDRgmvE5pYpqtFBg==
X-CSE-MsgGUID: Eb7MMUdoTCSO0gzvzgdhpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14801252"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14801252"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:51:24 -0700
X-CSE-ConnectionGUID: uyedrw4DQOmhZgnVvDx/Vw==
X-CSE-MsgGUID: H2shQeqQSD2K+InfTIl39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39501218"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa006.jf.intel.com with SMTP; 10 Jun 2024 05:51:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 10 Jun 2024 15:51:20 +0300
Date: Mon, 10 Jun 2024 15:51:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: typec-mux: ptn36502: unregister typec switch
 on probe error and remove
Message-ID: <Zmb2yHkNe12ivAYY@kuha.fi.intel.com>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-1-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-1-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:13PM +0200, Neil Armstrong wrote:
> Add the missing call to typec_switch_put() when probe fails and
> the ptn36502_remove() call is called.
> 
> Fixes: 8e99dc783648 ("usb: typec: add support for PTN36502 redriver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/ptn36502.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ptn36502.c b/drivers/usb/typec/mux/ptn36502.c
> index 0ec86ef32a87..88136a6d6f31 100644
> --- a/drivers/usb/typec/mux/ptn36502.c
> +++ b/drivers/usb/typec/mux/ptn36502.c
> @@ -322,8 +322,10 @@ static int ptn36502_probe(struct i2c_client *client)
>  				     "Failed to acquire orientation-switch\n");
>  
>  	ret = regulator_enable(ptn->vdd18_supply);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to enable vdd18\n");
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to enable vdd18\n");
> +		goto err_switch_put;
> +	}
>  
>  	ret = ptn36502_detect(ptn);
>  	if (ret)
> @@ -363,6 +365,9 @@ static int ptn36502_probe(struct i2c_client *client)
>  err_disable_regulator:
>  	regulator_disable(ptn->vdd18_supply);
>  
> +err_switch_put:
> +	typec_switch_put(ptn->typec_switch);
> +
>  	return ret;
>  }
>  
> @@ -374,6 +379,8 @@ static void ptn36502_remove(struct i2c_client *client)
>  	typec_switch_unregister(ptn->sw);
>  
>  	regulator_disable(ptn->vdd18_supply);
> +
> +	typec_switch_put(ptn->typec_switch);
>  }
>  
>  static const struct i2c_device_id ptn36502_table[] = {
> 
> -- 
> 2.34.1

-- 
heikki

