Return-Path: <linux-arm-msm+bounces-28974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293F956B05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 14:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D120828227B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 12:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266AD16B3B8;
	Mon, 19 Aug 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tf5vBtaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7C16B397;
	Mon, 19 Aug 2024 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071181; cv=none; b=TvY4wJ14FzO+VA2GVLQH/KKDy6plqeW9U2KRSAsqVNSRYtqJurVoDvrMVUAdKZDGxOzh8UsUY88K3a8e/s/X1xOKIlu4aOTUec7kJOWlIOdOMqRzqkeMP0m6EA96qZYpq55oncGdhLd2W4QcdDBf+LgCRMdpkx5LJeBD+5nDlmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071181; c=relaxed/simple;
	bh=HrTwzLj7XSeTw8tryKWAcTYmPm+9tklQ6X4mSbHuZms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWK9zUTwb5iw8qjZ5fOWMSqRO0dDgZ+3UxVlL2ZWJd99za+Lqot68ykZlGoeyv6/twLvaymPqFF0vN3xEQa9pLqevPYFz8A7xevFd45PFdhHhHMAAAj4FYZhZmXEL5H52p+pUWsPy7fhagyjs10MECDmJE4LoKNRkdcH3G+9ZeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tf5vBtaV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724071179; x=1755607179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HrTwzLj7XSeTw8tryKWAcTYmPm+9tklQ6X4mSbHuZms=;
  b=Tf5vBtaV1ZZgixYqHt7pp3U5F8hN+jWO9p4zrsGpA31jT84848/jPbOB
   qbB91Un2Tw33edFfBIsEuVN2wc6RA0mnNBDeDJOVE6DnAnNOKsBQ7zRVQ
   A60Z0a0xBUuV0I+4TN5+ixDsEfnBoz9tmokwJJXMFSR7ASVtIzljJi3lt
   ETkyh4TvRqWPm6SsgE1cC+F0qyoN/3vC20VGuumgMWkAWpppV/6OaGm0d
   m0/QZE9YS2/O4jEtd8h01Q82jAHfIgS0NQYFoYLKN4RIzpvBL3zoe6N8E
   YgQoLg0WQSsgBKEr2MV+qrOm3ONzU4RzI3/q8KRK3bYgRrs2Kjw0DpOQl
   w==;
X-CSE-ConnectionGUID: XMNdGA50RUqP5mpP6tCpxQ==
X-CSE-MsgGUID: fSYg2WLkQVG5iSC40gvYPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22473825"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22473825"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 05:39:38 -0700
X-CSE-ConnectionGUID: HEKcbfg2SjuEnCUqRPyVFw==
X-CSE-MsgGUID: gbH/QOgkRCevGz8xw6aE/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60340619"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa008.fm.intel.com with SMTP; 19 Aug 2024 05:39:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 19 Aug 2024 15:39:34 +0300
Date: Mon, 19 Aug 2024 15:39:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fsa4480: Relax CHIP_ID check
Message-ID: <ZsM9BkcaxV3qdWNs@kuha.fi.intel.com>
References: <20240818-fsa4480-chipid-fix-v1-1-17c239435cf7@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818-fsa4480-chipid-fix-v1-1-17c239435cf7@fairphone.com>

On Sun, Aug 18, 2024 at 10:21:01PM +0200, Luca Weiss wrote:
> Some FSA4480-compatible chips like the OCP96011 used on Fairphone 5
> return 0x00 from the CHIP_ID register. Handle that gracefully and only
> fail probe when the I2C read has failed.
> 
> With this the dev_dbg will print 0 but otherwise continue working.
> 
>   [    0.251581] fsa4480 1-0042: Found FSA4480 v0.0 (Vendor ID = 0)
> 
> Cc: stable@vger.kernel.org
> Fixes: e885f5f1f2b4 ("usb: typec: fsa4480: Check if the chip is really there")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/fsa4480.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index cd235339834b..f71dba8bf07c 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -274,7 +274,7 @@ static int fsa4480_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initialize regmap\n");
>  
>  	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
> -	if (ret || !val)
> +	if (ret)
>  		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
>  
>  	dev_dbg(dev, "Found FSA4480 v%lu.%lu (Vendor ID = %lu)\n",
> 
> ---
> base-commit: ccdbf91fdf5a71881ef32b41797382c4edd6f670
> change-id: 20240818-fsa4480-chipid-fix-2c7cf5810135
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>

-- 
heikki

