Return-Path: <linux-arm-msm+bounces-62181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DDBAE60BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF61616FE2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C056D27A93A;
	Tue, 24 Jun 2025 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvtgmICy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3268623E347;
	Tue, 24 Jun 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756916; cv=none; b=fqZ81zS1pM9sRh1XwXpV4fnMahJb8N9y3+ses1m1wVaTui4zPYmZzuH/LR1a+OsKyUOxe1O/TNINpMlDgkcZ2moNSQmLS+RAQXYON48+YjIHc1fvA45F4s7CetnX4QOXGyalovcgeacc9o/FZpf9L3J1vrrDI923CgaRoP6S+Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756916; c=relaxed/simple;
	bh=Y9ykpnPfKcHUHs6NNyHG5SYbLx8xRe/y/50hrb078cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3SypMDLt8826i7hreD5zDthMBu+culaA8QdbVvMQOQ9V1cBKHPDnWtPPM5CnhcQIqxg2NzevtH8iyM8ukg1SgPCfhS76sn8Wvbm9SEh8+0qtT69IN9KVBFoC9K4gzRtgz/BvILYLsNrQB5z3qpBzU+41R0iV4SwKvEfLZagqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvtgmICy; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756916; x=1782292916;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y9ykpnPfKcHUHs6NNyHG5SYbLx8xRe/y/50hrb078cY=;
  b=XvtgmICyZ0mOmRlkl3wxOhJdDHtJu6BFgyj+PLpnBm88YcflNeQrrXVy
   nkxjogPE1Yi7/NHxrg7SdPMR6GhvERyO2WnvSJaLRp1Q0WCIzkhpJb/f+
   8pfGRwBPtmQgxyTrJrVPyMzPxD9ZuRpeOW+JkZBQXLZ8Acy6iXQ9c1niZ
   2aIhisWJxW5S2f9JeMlTj8yL4GkOf5sEQQctxJxZX74b2Vfh37t8VW6Vx
   tgulhuLxoSXHgst6/yorNTO6/GWzOCNJC4DV3n3nPA+mVEgkX+XVipj9m
   IH4YTcfaQZ2CpqNG2+dqq8R4edaUIh9x12GtpqAInxBxve23+FN20aeN3
   A==;
X-CSE-ConnectionGUID: dXRuMBVhTtyTgPrlqq8+Hg==
X-CSE-MsgGUID: dxB4cRmPTtiSgttgOshOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56664508"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56664508"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:21:55 -0700
X-CSE-ConnectionGUID: WWAjkbxmRcOXea07g8oNOQ==
X-CSE-MsgGUID: stK1ZMvJR/SV0Uw+es8bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="175465205"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 24 Jun 2025 02:21:51 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:21:50 +0300
Date: Tue, 24 Jun 2025 12:21:50 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/8] usb: typec: ucsi: yoga-c630: register DRM HPD bridge
Message-ID: <aFpuLuzBXgazxecA@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-8-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-8-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:13:03PM +0300, Dmitry Baryshkov wrote:
> On Qualcomm platforms DisplayPort driver expects to have a drm bridge in
> the final device on the USB-C chain. Register the DRM HPD bridge in
> order to fulfill this requirement and to send HPD events to the DRM
> driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/Kconfig          |  1 +
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 39 +++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 8bf8fefb4f07bccc4be90a4b7f771d91294386b0..52b53bb6dfed28c4272f8ccc5e31601aede29911 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -85,6 +85,7 @@ config CROS_EC_UCSI
>  config UCSI_LENOVO_YOGA_C630
>  	tristate "UCSI Interface Driver for Lenovo Yoga C630"
>  	depends on EC_LENOVO_YOGA_C630
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  This driver enables UCSI support on the Lenovo Yoga C630 laptop.
>  
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index f85170417d19cdc5ae39a15e2f97010259ef12f6..0187c1c4b21abc7b5429526ebb4538c28b2e2e77 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -12,10 +12,14 @@
>  #include <linux/container_of.h>
>  #include <linux/module.h>
>  #include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/string.h>
>  #include <linux/platform_data/lenovo-yoga-c630.h>
>  #include <linux/usb/typec_dp.h>
>  
> +#include <drm/bridge/aux-bridge.h>
> +
>  #include "ucsi.h"
>  
>  #define LENOVO_EC_USB_MUX	0x08
> @@ -29,6 +33,7 @@
>  struct yoga_c630_ucsi {
>  	struct yoga_c630_ec *ec;
>  	struct ucsi *ucsi;
> +	struct auxiliary_device *bridge;
>  	struct notifier_block nb;
>  	u16 version;
>  };
> @@ -193,6 +198,13 @@ static void yoga_c630_ucsi_read_port0_status(struct yoga_c630_ucsi *uec)
>  				      ccst == 1 ?
>  				      TYPEC_ORIENTATION_REVERSE :
>  				      TYPEC_ORIENTATION_NORMAL);
> +
> +	if (uec->bridge)
> +		drm_aux_hpd_bridge_notify(&uec->bridge->dev,
> +					  dppn != 0 ?
> +					  connector_status_connected :
> +					  connector_status_disconnected);
> +
>  }
>  
>  static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> @@ -237,6 +249,24 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
>  	uec->ec = ec;
>  	uec->nb.notifier_call = yoga_c630_ucsi_notify;
>  
> +	device_for_each_child_node_scoped(&adev->dev, fwnode) {
> +		u32 port;
> +
> +		ret = fwnode_property_read_u32(fwnode, "reg", &port);
> +		if (ret < 0) {
> +			dev_err(&adev->dev, "missing reg property of %pfwP\n", fwnode);
> +			return ret;
> +		}
> +
> +		/* DP is only on port0 */
> +		if (port != 0)
> +			continue;
> +
> +		uec->bridge = devm_drm_dp_hpd_bridge_alloc(&adev->dev, to_of_node(fwnode));
> +		if (IS_ERR(uec->bridge))
> +			return PTR_ERR(uec->bridge);
> +	}
> +
>  	uec->ucsi = ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
>  	if (IS_ERR(uec->ucsi))
>  		return PTR_ERR(uec->ucsi);
> @@ -255,8 +285,17 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
>  	if (ret)
>  		goto err_unregister;
>  
> +	if (uec->bridge) {
> +		ret = devm_drm_dp_hpd_bridge_add(&adev->dev, uec->bridge);
> +		if (ret)
> +			goto err_ucsi_unregister;
> +	}
> +
>  	return 0;
>  
> +err_ucsi_unregister:
> +	ucsi_unregister(uec->ucsi);
> +
>  err_unregister:
>  	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
>  
> 
> -- 
> 2.39.5

-- 
heikki

