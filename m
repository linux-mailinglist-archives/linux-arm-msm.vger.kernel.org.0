Return-Path: <linux-arm-msm+bounces-16056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1964895076
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29311C20FED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08A15D8EB;
	Tue,  2 Apr 2024 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVAmjj7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055825D468;
	Tue,  2 Apr 2024 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054328; cv=none; b=afQnkouzKJUJaqed6qMP2BaVtaHMQbGjaOC9J3qyvE5tkCIbbcdkrvdv2YV3hodOoRliilMynNt/RXBvHDiuZxFX5JsGdASNnYbRmoaH7Sw0HMPPlPWYVN3SWesNQ8tnxoY+kDMs8vP8gKMHzo5dSToHOsTWqvBHLSQOz96mAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054328; c=relaxed/simple;
	bh=7KyO2JQO+KqWbpINOu308OaZUHEEE3om6QPwZYpGRQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTfcYrO6YnPHIGCyTr2FtvrZcHBnVV1uNLLQ1LOARUr+SKNHvd5T9mNPtWAxZToN+rAiuMoDWj95T1L9HLRvxYDUJSLAhOQdqOx00FCSH7+iTVBnq5DrkRsmCbdMjOM45Rhloc5xZ32pVy8/kyzclccjpMenhSMA0zAWZcUdmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVAmjj7K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712054327; x=1743590327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7KyO2JQO+KqWbpINOu308OaZUHEEE3om6QPwZYpGRQk=;
  b=UVAmjj7Kucn72xqLTaGnh+SipWFZmSHpd0fcHvznE9fycmZdgDfhtw0y
   5P/gMScnk8gjJOH8Bt43JL7BhEcFWQVbykN9rIdfatsLpaVWjskT4yoqu
   gnWAjtA3qDb42PtUCmX9SJ3Bp+ItEmsAFNdYiR55Ov09H222/tC8Ho5w7
   NmyVYWps+t0WH4UsV/RiMmN13KC33BfqQsp3+/gDHslTPXMmWBFxgYlud
   G1qFj0LmX7Uv901I4DgcNHiaKAr4/n8G7M1xnxQ/PiCCHA8MmJLhE9Umi
   DAWiUG9ppvKXKnirbaDw9rPt8Iz/L1DR6CO9UV7HsrIo5n9mWTChhi/yk
   A==;
X-CSE-ConnectionGUID: D694rBfpQc+V1QsB78kGVQ==
X-CSE-MsgGUID: HkmAWCmUQ028YIfMmclewg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7085580"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7085580"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083295"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083295"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:38:42 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:38:42 +0300
Date: Tue, 2 Apr 2024 13:38:42 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 04/11] usb: typec: ucsi: always register a link to USB
 PD device
Message-ID: <ZgvgMtvUc1dq9/ks@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-4-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-4-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:36AM +0200, Dmitry Baryshkov wrote:
> UCSI driver will attempt to set a USB PD device only if it was able to
> read PDOs from the firmware. This results in suboptimal behaviour, since
> the PD device will be created anyway. Move calls to
> typec_port_set_usb_power_delivery() out of conditional code and call it
> after reading capabilities.
> 
> Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 7666142d8bbb..d1a45ce7f660 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1569,7 +1569,6 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  		}
>  
>  		con->port_source_caps = pd_cap;
> -		typec_port_set_usb_power_delivery(con->port, con->pd);
>  	}
>  
>  	memset(&pd_caps, 0, sizeof(pd_caps));
> @@ -1586,9 +1585,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  		}
>  
>  		con->port_sink_caps = pd_cap;
> -		typec_port_set_usb_power_delivery(con->port, con->pd);
>  	}
>  
> +	typec_port_set_usb_power_delivery(con->port, con->pd);
> +
>  	/* Alternate modes */
>  	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
>  	if (ret) {
> 
> -- 
> 2.39.2

-- 
heikki

