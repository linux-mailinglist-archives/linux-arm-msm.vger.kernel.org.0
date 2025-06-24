Return-Path: <linux-arm-msm+bounces-62180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BDAE60AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0C23BB613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D03D27AC45;
	Tue, 24 Jun 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+txhFkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732C27AC28;
	Tue, 24 Jun 2025 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756825; cv=none; b=jKdq+NpBiY0w1pAeF0PXhifisqMTFhr4efYISxWhD+ZYhGXYWe9m8+OKS344aLSYYP1ABHnSCDi88r2VB6laElj3NdPhZXOabrYx+vjm/0VTe0Gpp3LtKGrNPLu3kftcKAZvsQ7wo3RjaGtpyq3WmXO9Wz3grstPXAAR1VfsV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756825; c=relaxed/simple;
	bh=jZE+IgGesHcyfgzN3nG1+Ne+xiYv2cRxteQP8fTHOXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW1nMZGVEanonli86E/w1Ma/J5R5gIP2L3PuF2rB/GiqsWyRvFmLpYcRZvl6mNe/+NBz0rQW+D8jMk3IOfWfyZgzz/ukOHPjFMUSspq99u3HkTX96rBop0MTV0d3OjUCMqBjVCrH44T2a9ScXL4O7AjIlXmVsxXkHwRh9R5txrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+txhFkQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756824; x=1782292824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jZE+IgGesHcyfgzN3nG1+Ne+xiYv2cRxteQP8fTHOXE=;
  b=S+txhFkQM9R/lswsNimIYdK8oHnFHJdZBloZoFdl5ozLY8brwKaM/9kE
   ljVFV+j/MZpwjDXsOcEOl+JgONI3cMPkBbO0UjZaLT4HXYeuNvsmUPgw/
   9to3G3KyVCmtf4ZlIPu06QtwH44ThuKu7t1FUG0rkhuzRxZ50QRJ2Jn07
   0P9xDpxSH4dK+QWc1HL17UuOhm0Dw/cjBFeKwGtNv2x8tuWa+Z0OAZQ/J
   UZ6pFKSX2IjDI3IOf2m50NRARQglujsKLtUGN/Hy76hKQCJjCbpVBFjNe
   1+9X3kp2W3uUaWQj5GoohhS16dFt37CL/QVj8/XgFIzwRaihTrutIQCpJ
   A==;
X-CSE-ConnectionGUID: Gl+SGGEsScOLUm3+iA7egQ==
X-CSE-MsgGUID: pgga4psmTYubGiQvJ/RMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55618257"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="55618257"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:20:23 -0700
X-CSE-ConnectionGUID: ouSwOgoxRtml5VKPffnURg==
X-CSE-MsgGUID: 06FqYvbYTImAMHK+suunGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151995889"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 24 Jun 2025 02:20:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:20:19 +0300
Date: Tue, 24 Jun 2025 12:20:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: typec: ucsi: yoga-c630: handle USB / HPD
 messages to set port orientation
Message-ID: <aFpt0j21dOWAnNvR@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-7-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-7-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:13:02PM +0300, Dmitry Baryshkov wrote:
> Parse USB / HPD messages from EC in order to set the orientation of the
> corresponding Type-C port, letting connected USB 3 devices to enjoy
> SuperSpeed connection rather than beign limited to HighSpeed only (if
> the orientation didn't match).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 42 +++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 76afd128d42a2573ff55433f815c2773462a6426..f85170417d19cdc5ae39a15e2f97010259ef12f6 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -7,15 +7,25 @@
>   */
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/container_of.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
>  #include <linux/string.h>
>  #include <linux/platform_data/lenovo-yoga-c630.h>
> +#include <linux/usb/typec_dp.h>
>  
>  #include "ucsi.h"
>  
> +#define LENOVO_EC_USB_MUX	0x08
> +
> +#define USB_MUX_MUXC	GENMASK(1, 0)
> +#define USB_MUX_CCST	GENMASK(3, 2)
> +#define USB_MUX_DPPN	GENMASK(7, 4)
> +#define USB_MUX_HPDS	BIT(8)
> +#define USB_MUX_HSFL	GENMASK(11, 9)
> +
>  struct yoga_c630_ucsi {
>  	struct yoga_c630_ec *ec;
>  	struct ucsi *ucsi;
> @@ -144,6 +154,12 @@ static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
>  	return false;
>  }
>  
> +static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
> +{
> +	if (con->num == 1)
> +		con->typec_cap.orientation_aware = true;
> +}
> +
>  static const struct ucsi_operations yoga_c630_ucsi_ops = {
>  	.read_version = yoga_c630_ucsi_read_version,
>  	.read_cci = yoga_c630_ucsi_read_cci,
> @@ -152,8 +168,33 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
>  	.sync_control = yoga_c630_ucsi_sync_control,
>  	.async_control = yoga_c630_ucsi_async_control,
>  	.update_altmodes = yoga_c630_ucsi_update_altmodes,
> +	.update_connector = yoga_c630_ucsi_update_connector,
>  };
>  
> +static void yoga_c630_ucsi_read_port0_status(struct yoga_c630_ucsi *uec)
> +{
> +	int val;
> +	unsigned int muxc, ccst, dppn, hpds, hsfl;
> +
> +	val = yoga_c630_ec_read16(uec->ec, LENOVO_EC_USB_MUX);
> +
> +	muxc = FIELD_GET(USB_MUX_MUXC, val);
> +	ccst = FIELD_GET(USB_MUX_CCST, val);
> +	dppn = FIELD_GET(USB_MUX_DPPN, val);
> +	hpds = FIELD_GET(USB_MUX_HPDS, val);
> +	hsfl = FIELD_GET(USB_MUX_HSFL, val);
> +
> +	dev_dbg(uec->ucsi->dev, " mux %04x (muxc %d ccst %d dppn %d hpds %d hsfl %d)\n",
> +		val,
> +		muxc, ccst, dppn, hpds, hsfl);
> +
> +	if (uec->ucsi->connector && uec->ucsi->connector[0].port)
> +		typec_set_orientation(uec->ucsi->connector[0].port,
> +				      ccst == 1 ?
> +				      TYPEC_ORIENTATION_REVERSE :
> +				      TYPEC_ORIENTATION_NORMAL);
> +}
> +
>  static int yoga_c630_ucsi_notify(struct notifier_block *nb,
>  				 unsigned long action, void *data)
>  {
> @@ -164,6 +205,7 @@ static int yoga_c630_ucsi_notify(struct notifier_block *nb,
>  	switch (action) {
>  	case LENOVO_EC_EVENT_USB:
>  	case LENOVO_EC_EVENT_HPD:
> +		yoga_c630_ucsi_read_port0_status(uec);
>  		ucsi_connector_change(uec->ucsi, 1);
>  		return NOTIFY_OK;
>  
> 
> -- 
> 2.39.5

-- 
heikki

