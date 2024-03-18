Return-Path: <linux-arm-msm+bounces-14376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1687E7B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C0C2B2260F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CB92E65B;
	Mon, 18 Mar 2024 10:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCFIue/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605D2DF92;
	Mon, 18 Mar 2024 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759135; cv=none; b=HfMA5TqvU6KXjVHH75+/CDCZVRPDo0qGwXPcKxB0k3O2Hcv6mtADDVLpDy6YXeXWlu9dTAtoZw0Uxp+oc+VvBzKe0Mt0meThVQVaV4MV2JvL+hsigQk5xi1dMy5ndhRAWM0jr4TRUSHyI93I6cmrG1YzwLt0KGdmUHPMvlaVFT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759135; c=relaxed/simple;
	bh=nFi0pyuc4lvnSUtnKF+pUyN3hDQNQpUQ5SXo+1ipPcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQHRvHrlQf7TEGsxJgWh5HXFc2EsVBhmRQ4GcHO4K+0YFoeXMdGQf3MvWzIuTHG8KY0s1fBpN9ZiBmtsZ7nUZdxTYXdPx1ekIRdHX3iYuV38apr+EIEMx5XgLr6fF6ls2kN4tYROkFSoCWt7Z46DMua7y8ZhxpBbQzmpwX7uuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCFIue/N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710759133; x=1742295133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nFi0pyuc4lvnSUtnKF+pUyN3hDQNQpUQ5SXo+1ipPcM=;
  b=JCFIue/NPge08w3P9sGcUZa+V6/t3EV5gVFnwnWcT/i4/PSLt0WlsApy
   n7bkoFmxvX2NSmcYzrSxU7gvyTsxzNWsXX3yTWyoYdGaoQbER+QGr06TB
   45Z9jUWQc/h/skh1OV4pHIS9mX2WvwpIx6ZsUigMF1oSJbovKC6nMPIAC
   8tkREnRE6HertmD4tJ6GaUnLErNLQwSHsTfMN28kjH6LY35zRBgXwI6bH
   gcE1nIEo/crSdt6i6kTq6Uw/7rU1NChYwTh8slhVU8Jjm2DtwWNGFMl8j
   8WdO9RFFxftHGHKlaYmKNTG5DBcrE8J5mW8kuCBm/Mcr18WRsdJATQrCR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5688980"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5688980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060148"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060148"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:52:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:52:08 +0200
Date: Mon, 18 Mar 2024 12:52:08 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/7] usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS
 even further
Message-ID: <Zfgc2OTLN4J6M9NJ@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-5-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-5-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:15AM +0200, Dmitry Baryshkov wrote:
> Reading Partner Source PDOs for the consumer Connectors appears to be
> working. Permit getting PDOs in this case in order to populate
> capabilities of the connected power supply in the sysfs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 011d52bf34f6..72d368433b1f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -642,7 +642,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>  	int ret;
>  
>  	if (is_partner &&
> -	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> +	    ucsi->quirks & UCSI_NO_PARTNER_PDOS &&
> +	    ((con->status.flags & UCSI_CONSTAT_PWR_DIR) ||
> +	     !is_source(role)))
>  		return 0;
>  
>  	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> 
> -- 
> 2.39.2

-- 
heikki

