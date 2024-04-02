Return-Path: <linux-arm-msm+bounces-16060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983B895091
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D48AFB24827
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF545FB8A;
	Tue,  2 Apr 2024 10:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6hW7+dg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42905B699;
	Tue,  2 Apr 2024 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054506; cv=none; b=ZV+PuuHuje3GfIR6IdGGMPQqsJuUHdx8pMPh6WNqlWQZX0qO3zSckyZyg5DlBhJeF9krfLpUmTWSWGg32INB0rXIEge5yHRy0UoiMvQtS96d6u7K+VrxjdzjcrTDyoCY4VR4KzqgtUTuDtgjG9NyVb3Urn9a7sbI2IwF0Ewfbgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054506; c=relaxed/simple;
	bh=xz8TeTlZ7k9gVxNTL5sHUkvoUdQo+W3RkEeetP3KNKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qh6zyMppZb2Ce3OqIq/18WBpXzSIH3pq/jyAGm5Sg+0f0Kyl6DsaaATu5cXjzmp5MdmqdSDtQqxQJ7IKgxLZHvBu8P/9/tGSXheSxO9uNYuLmQg7Dyh02zkE1oppNGajbrgi/ZBda+AChmjKy0FM/HDx3pVKBJeMozA/ranT/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6hW7+dg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712054505; x=1743590505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xz8TeTlZ7k9gVxNTL5sHUkvoUdQo+W3RkEeetP3KNKY=;
  b=c6hW7+dgWtpETo13qOPe6Uu8WALXvdfzyDtmR7I5aEH2ymZNRTcwkt0z
   Q491Cjn0TMGVVdd93VXhPbY0SnJYt/+OSYP22pbTfmtJsWskc2yBNkeMO
   4u11YxRfNIfx7xcjBTbbO65GrrvLlbqtGrhTaRGq/tVY24sUH6F78ueVe
   vGHLXe/BnPRp8TRNV3w0EoVriqdHPAuTAGqEe6ZeZbzObqEOjwxJCf+ae
   w80CotyWthvXy/CmeIPDisWf/jD7ThEh0AV5Gen/XSRutQoSieDoVKcsv
   skwk3Guy6rynqj5arwgeHPBuD9k3Jio1h7MUWj543kLPB5uMU/APH/4vN
   w==;
X-CSE-ConnectionGUID: fCu13WNFTcuiRHLdN77bPA==
X-CSE-MsgGUID: 3hfx4oj5SrCabHyfpIsqfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7085813"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7085813"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083314"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083314"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:41:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:41:40 +0300
Date: Tue, 2 Apr 2024 13:41:40 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 06/11] usb: typec: ucsi: extract code to read PD caps
Message-ID: <Zgvg5Fr/Hwn7JIqx@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-6-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-6-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:38AM +0200, Dmitry Baryshkov wrote:
> Extract function to read PDOs from the port and set PD capabilities
> accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 85 ++++++++++++++++---------------------------
>  1 file changed, 32 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 35366b1a3d78..18b2e4ffc57e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -677,6 +677,26 @@ static int ucsi_get_src_pdos(struct ucsi_connector *con)
>  	return ret;
>  }
>  
> +static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_connector *con,
> +								enum typec_role role,
> +								bool is_partner)
> +{
> +	struct usb_power_delivery_capabilities_desc pd_caps;
> +	int ret;
> +
> +	ret = ucsi_get_pdos(con, role, is_partner, pd_caps.pdo);
> +	if (ret <= 0)
> +		return ERR_PTR(ret);
> +
> +	if (ret < PDO_MAX_OBJECTS)
> +		pd_caps.pdo[ret] = 0;
> +
> +	pd_caps.role = role;
> +
> +	return usb_power_delivery_register_capabilities(is_partner ? con->partner_pd : con->pd,
> +							&pd_caps);
> +}
> +
>  static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient,
>  			      u8 offset, u8 bytes, void *resp)
>  {
> @@ -804,9 +824,7 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
>  static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  {
>  	struct usb_power_delivery_desc desc = { con->ucsi->cap.pd_version };
> -	struct usb_power_delivery_capabilities_desc caps;
>  	struct usb_power_delivery_capabilities *cap;
> -	int ret;
>  
>  	if (con->partner_pd)
>  		return 0;
> @@ -815,32 +833,17 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  	if (IS_ERR(con->partner_pd))
>  		return PTR_ERR(con->partner_pd);
>  
> -	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 1, caps.pdo);
> -	if (ret > 0) {
> -		if (ret < PDO_MAX_OBJECTS)
> -			caps.pdo[ret] = 0;
> -
> -		caps.role = TYPEC_SOURCE;
> -		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
> -		if (IS_ERR(cap))
> -			return PTR_ERR(cap);
> -
> -		con->partner_source_caps = cap;
> -	}
> -
> -	ret = ucsi_get_pdos(con, TYPEC_SINK, 1, caps.pdo);
> -	if (ret > 0) {
> -		if (ret < PDO_MAX_OBJECTS)
> -			caps.pdo[ret] = 0;
> +	cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, true);
> +	if (IS_ERR(cap))
> +	    return PTR_ERR(cap);
>  
> -		caps.role = TYPEC_SINK;
> +	con->partner_source_caps = cap;
>  
> -		cap = usb_power_delivery_register_capabilities(con->partner_pd, &caps);
> -		if (IS_ERR(cap))
> -			return PTR_ERR(cap);
> +	cap = ucsi_get_pd_caps(con, TYPEC_SINK, true);
> +	if (IS_ERR(cap))
> +	    return PTR_ERR(cap);
>  
> -		con->partner_sink_caps = cap;
> -	}
> +	con->partner_sink_caps = cap;
>  
>  	return typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
>  }
> @@ -1463,7 +1466,6 @@ static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
>  static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  {
>  	struct usb_power_delivery_desc desc = { ucsi->cap.pd_version};
> -	struct usb_power_delivery_capabilities_desc pd_caps;
>  	struct usb_power_delivery_capabilities *pd_cap;
>  	struct typec_capability *cap = &con->typec_cap;
>  	enum typec_accessory *accessory = cap->accessory;
> @@ -1544,36 +1546,13 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  
>  	con->pd = usb_power_delivery_register(ucsi->dev, &desc);
>  
> -	ret = ucsi_get_pdos(con, TYPEC_SOURCE, 0, pd_caps.pdo);
> -	if (ret > 0) {
> -		if (ret < PDO_MAX_OBJECTS)
> -			pd_caps.pdo[ret] = 0;
> -
> -		pd_caps.role = TYPEC_SOURCE;
> -		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
> -		if (IS_ERR(pd_cap)) {
> -			ret = PTR_ERR(pd_cap);
> -			goto out;
> -		}
> -
> +	pd_cap = ucsi_get_pd_caps(con, TYPEC_SOURCE, false);
> +	if (!IS_ERR(pd_cap))
>  		con->port_source_caps = pd_cap;
> -	}
> -
> -	memset(&pd_caps, 0, sizeof(pd_caps));
> -	ret = ucsi_get_pdos(con, TYPEC_SINK, 0, pd_caps.pdo);
> -	if (ret > 0) {
> -		if (ret < PDO_MAX_OBJECTS)
> -			pd_caps.pdo[ret] = 0;
> -
> -		pd_caps.role = TYPEC_SINK;
> -		pd_cap = usb_power_delivery_register_capabilities(con->pd, &pd_caps);
> -		if (IS_ERR(pd_cap)) {
> -			ret = PTR_ERR(pd_cap);
> -			goto out;
> -		}
>  
> +	pd_cap = ucsi_get_pd_caps(con, TYPEC_SINK, false);
> +	if (!IS_ERR(pd_cap))
>  		con->port_sink_caps = pd_cap;
> -	}
>  
>  	typec_port_set_usb_power_delivery(con->port, con->pd);
>  
> 
> -- 
> 2.39.2

-- 
heikki

