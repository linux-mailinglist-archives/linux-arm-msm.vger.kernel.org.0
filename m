Return-Path: <linux-arm-msm+bounces-16079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DE89515C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 13:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093281F2109D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAB5FBAA;
	Tue,  2 Apr 2024 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlwjWwff"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528D5D749;
	Tue,  2 Apr 2024 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712055875; cv=none; b=Ar0TAGhc1eoIe+tZ2myjQP4VZyhXCWGdqET3tLR+8HIYNwoJFatb7xU/x17uVjhOq0T8RFCfd8pmdb3Bz/dKSgNmRyzzVo+9jvca1BxCve45QJ2kFVD+jBw91HVn1tZ0ozBloK/N7QBx1jUQo+MEtD8ovjJ4YAtP7rYrAgOOakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712055875; c=relaxed/simple;
	bh=Q+ko5XYgCGXp/6NOONUmVHwF2JgGCVehIIr780XeAek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/V2Mmv97uFp8ZlFKOb0S/zDnD64c7MRS0cjwQ8FIZaZZXluA/5UQvZowAdPkJii103maM0cmLiq/WYTt2/V+h7opyh5Rm0J3URq+WOOCSuHyie3Q9GjsW4UMT/uj6Qi8XFaEzlBcJY4DokQBpcJwVIrtD9XYTW2YZyRZtqdyVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlwjWwff; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712055874; x=1743591874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+ko5XYgCGXp/6NOONUmVHwF2JgGCVehIIr780XeAek=;
  b=OlwjWwffOnNjvPKVk4VY+g3vNwuk+9OCFyos/hLJGazJZdbXQOv5jgwx
   y5CBY7i0xgWiSbEV3A6xIUJ4UUb2tfPbKI0J7GUJKwAvHnCvPdJi0JoFS
   EJUZoOgy+whyCTzefj28cKJ2IlMIHuLTvoygokRNbw4LyFuHzs8b60QyQ
   SIAFEwrPFaKvCpsY/PQOFm7INZDk+WCTe1gvTOLxQXM/UORgUcGlEW/Z4
   oBXsy8B7RQcYjtPd0JPb0AVXkaOh3S/kOjpjbiwNGePyX2Y5CxLL19mAU
   KuCaMoMkj1fdrmH1EHSTffi8Ge2echQk7pLwFGutgtj27lhWrs1FXPUGN
   w==;
X-CSE-ConnectionGUID: abgEiq/rQJO/XSEQrfAzwA==
X-CSE-MsgGUID: +x1WrPXCSDKT3WRdeXQysg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17790065"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17790065"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 04:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083354"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083354"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 04:04:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 14:04:29 +0300
Date: Tue, 2 Apr 2024 14:04:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 07/11] usb: typec: ucsi: support delaying GET_PDOS for
 device
Message-ID: <ZgvmPPUEaqyOLchN@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-7-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-7-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:39AM +0200, Dmitry Baryshkov wrote:
> Qualcomm firmware doesn't return sane information for device's PDOs
> unless the partner is also using a PD mode. On SC8280XP this even
> results in the Error bit being set in the UCSI response (with 0 error
> status).
> 
> Add a quirk to delay reading USB PD capabilities for a device until we
> detect a partner in PD mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 41 ++++++++++++++++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h |  1 +
>  2 files changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 18b2e4ffc57e..f5ec776b84d6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -821,6 +821,28 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
>  	return ret;
>  }
>  
> +static void ucsi_register_device_pdos(struct ucsi_connector *con)
> +{
> +	struct ucsi *ucsi = con->ucsi;
> +	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version };
> +	struct usb_power_delivery_capabilities *pd_cap;
> +
> +	if (con->pd)
> +		return;
> +
> +	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
> +
> +	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
> +	if (!IS_ERR(pd_cap))
> +		con->port_source_caps = pd_cap;
> +
> +	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
> +	if (!IS_ERR(pd_cap))
> +		con->port_sink_caps = pd_cap;
> +
> +	typec_port_set_usb_power_delivery(con->port, con->pd);
> +}
> +
>  static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  {
>  	struct usb_power_delivery_desc desc = { con->ucsi->cap.pd_version };
> @@ -981,6 +1003,9 @@ static int ucsi_register_partner(struct ucsi_connector *con)
>  		break;
>  	}
>  
> +	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
> +		ucsi_register_device_pdos(con);
> +
>  	desc.identity = &con->partner_identity;
>  	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
>  	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
> @@ -1465,8 +1490,6 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>  
>  static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  {
> -	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version};
> -	struct usb_power_delivery_capabilities *pd_cap;
>  	struct typec_capability *cap = &con->typec_cap;
>  	enum typec_accessory *accessory = cap->accessory;
>  	enum usb_role u_role = USB_ROLE_NONE;
> @@ -1544,17 +1567,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  		goto out;
>  	}
>  
> -	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
> -
> -	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
> -	if (!IS_ERR(pd_cap))
> -		con->port_source_caps = pd_cap;
> -
> -	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
> -	if (!IS_ERR(pd_cap))
> -		con->port_sink_caps = pd_cap;
> -
> -	typec_port_set_usb_power_delivery(con->port, con->pd);
> +	if (!(ucsi->quirks & UCSI_DELAY_DEVICE_PDOS))
> +		ucsi_register_device_pdos(con);
>  
>  	/* Alternate modes */
>  	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
> @@ -1617,6 +1631,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	if (con->partner &&
>  	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
>  	    UCSI_CONSTAT_PWR_OPMODE_PD) {
> +		ucsi_register_device_pdos(con);
>  		ucsi_get_src_pdos(con);
>  		ucsi_check_altmodes(con);
>  	}
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 591f734d457b..2caf2969668c 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -406,6 +406,7 @@ struct ucsi {
>  
>  	unsigned long quirks;
>  #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
> +#define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
>  };
>  
>  #define UCSI_MAX_SVID		5
> 
> -- 
> 2.39.2

-- 
heikki

