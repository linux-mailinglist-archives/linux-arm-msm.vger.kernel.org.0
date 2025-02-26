Return-Path: <linux-arm-msm+bounces-49465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C45A45AE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 733B21893D13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028EF24E005;
	Wed, 26 Feb 2025 09:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDAglrYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2F42459D9;
	Wed, 26 Feb 2025 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563721; cv=none; b=c2sYSzuAprgX8vS+bAfpTORqMJEAyKCUQ6r6amfDxhYYZv93hnJVAAaWy/coyOwAuB01sB9HaZuG93surSo82DvjFCl9kPocQREca/IYEy3S2ZcDXRTUHtt/aRuoM/EQecrW0p9nM1p/5SD5nM0/Hy0zMwF74mtXcw1REcI0u4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563721; c=relaxed/simple;
	bh=Q09tkzvpm32EptItgLQf0HDUC7sj/PDbf0FuOpFXEYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXrS7M285MbfnBec/NGLUV19YkRglNXfhUBwWVg+BwxXAH88WIBL9Yz0fkzGVo57tuV2wFcNTeiR4GpXElr5NKo8Ql5WIaEXFKP6DKi1yCiGH2Hm8edNgLcJ0uTnTrdzwWUAmdM/Y/BS+zrRjeGYZd5ctFPGDZxkxoc1ksR5lZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDAglrYS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563720; x=1772099720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q09tkzvpm32EptItgLQf0HDUC7sj/PDbf0FuOpFXEYI=;
  b=QDAglrYSgnm6ywlaKsJEd6KWXLX9WFJ7SRFubPuI7zk/wNA1pMpIqU87
   HCxbl3VUChI1YNU9czMFKLxuEfUCNLsr9YBAttgLJi7bb6v8QFtg5203g
   eVQ40gJs+YRWpBzpskHtZyySLOCwX+7bO8Qv/r2ekddW4y2MbOMkcoBAQ
   8yslScaD7TptITVMIqx6hWGrvDRRmLGQkkYpMtwvEFQZ8T01d3sJhPiKq
   YbZrnorqlh100JDxsN5FWPg/E6WsucM3VKIrBlQFSiyVYKGoDp4VFba9E
   kc8+IMalfEBPf96psVm0QVfIYblBbvQjN6xHRAVR5Rt7LpEmkG+syz+7q
   g==;
X-CSE-ConnectionGUID: htf+I6p5RRmGcM6Aeq9nSw==
X-CSE-MsgGUID: 8wYnnOpiRNalr1MYA0pGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66774052"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="66774052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:55:20 -0800
X-CSE-ConnectionGUID: CLVTqq67Qe+ccR8lWrSmLA==
X-CSE-MsgGUID: p/HaS2YCQv+jEhOH4FMj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="147483052"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 26 Feb 2025 01:55:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Feb 2025 11:55:15 +0200
Date: Wed, 26 Feb 2025 11:55:15 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: ps883x: fix missing accessibility check
Message-ID: <Z77lA_FViRjqjrUa@kuha.fi.intel.com>
References: <20250218152933.22992-1-johan+linaro@kernel.org>
 <20250218152933.22992-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218152933.22992-3-johan+linaro@kernel.org>

On Tue, Feb 18, 2025 at 04:29:32PM +0100, Johan Hovold wrote:
> Make sure that the retimer is accessible before registering to avoid
> having later consumer calls fail to configure it, something which, for
> example, can lead to a hotplugged display not being recognised:
> 
> 	[drm:msm_dp_panel_read_sink_caps [msm]] *ERROR* read dpcd failed -110
> 
> Fixes: 257a087c8b52 ("usb: typec: Add support for Parade PS8830 Type-C Retimer")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/ps883x.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 274de7abe585..f8b47187f4cf 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -291,6 +291,7 @@ static int ps883x_retimer_probe(struct i2c_client *client)
>  	struct typec_switch_desc sw_desc = { };
>  	struct typec_retimer_desc rtmr_desc = { };
>  	struct ps883x_retimer *retimer;
> +	unsigned int val;
>  	int ret;
>  
>  	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
> @@ -360,6 +361,16 @@ static int ps883x_retimer_probe(struct i2c_client *client)
>  
>  		/* firmware initialization delay */
>  		msleep(60);
> +
> +		/* make sure device is accessible */
> +		ret = regmap_read(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> +				  &val);
> +		if (ret) {
> +			dev_err(dev, "failed to read conn_status_0: %d\n", ret);
> +			if (ret == -ENXIO)
> +				ret = -EIO;
> +			goto err_clk_disable;
> +		}
>  	}
>  
>  	sw_desc.drvdata = retimer;
> -- 
> 2.45.3

-- 
heikki

