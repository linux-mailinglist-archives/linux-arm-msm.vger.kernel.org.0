Return-Path: <linux-arm-msm+bounces-62173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E43AE602D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CCF01924269
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CB1279DD4;
	Tue, 24 Jun 2025 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSDkpNtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A4319CD01;
	Tue, 24 Jun 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755953; cv=none; b=ehnOLnmu752yBhinJ6WJt0mMv4QMfb3yyUrIvpsv96hBy79hlfo+cym9Am1hfvSPdyMte7UT/n+th2q+g5n195KRWiD81Rloh+gAjhtalWQjWXTEgaODtpBpP4lNFYlyXFC2aR3ww3oiIRq5K/3ZUKGfY4dZjiVqiJyq2xJclvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755953; c=relaxed/simple;
	bh=Kdr7XdnAFcDOh1tDuY6cmVBs5NYiJeppVVlFCEqaASg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AusuXYOp62DCc4xWYU1Fw0LUgT7WV1dD5Y+ldC6PVQz/R9aU71WpTQUjHoyLkuaklZzrpaRSDdYjEwtZPByFMYS/HCsRj0DX52HwMBvRuUFLAkNpZ64PCFUNdQzRkQoPwCFbkdFyvNRZ1jRQ+ytdcqMDKymiyK4hTU3PjSYHUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSDkpNtB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750755953; x=1782291953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kdr7XdnAFcDOh1tDuY6cmVBs5NYiJeppVVlFCEqaASg=;
  b=WSDkpNtB7HCVmkHRvvg6l4MwneyW2gQGobjk/c/uHX+OH5ZmDmDHCIk/
   B9+OZT7NpAt0dhv7upLSMXandsFHa9dP3IygLGI5atuXm6B3txofvisC/
   gMo1MrM7uIVkd81dwMxTBCc/yIoHpDgsXYS87DablyFort/cFOr2w09oX
   YFD2A2APQgiUIvo9aS7//L9Jdc/kwE6ucrzqOe9wvXgUfyv/LzS/+CPyQ
   lYkb9OZyVWwRNg6Gw6cVFjQS7hnnKaDaQRiYtSJj6tu/vZFGVA9D4rNlL
   3UmlyxRnu48+wkrJa8uP4BJ8iegGbUXX8v2OoWx/WNWn9nlK5eyZymkAL
   Q==;
X-CSE-ConnectionGUID: dpROhMPdT+iq7lq5IkP7tg==
X-CSE-MsgGUID: pt034b0/TPucn995mZEsMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63251834"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63251834"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:05:52 -0700
X-CSE-ConnectionGUID: xNoTi//jR8m+1PLwMqr0eA==
X-CSE-MsgGUID: HvLYdZz4RhKlC4zagbKIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151608959"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 24 Jun 2025 02:05:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:05:47 +0300
Date: Tue, 24 Jun 2025 12:05:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/8] usb: typec: ucsi: yoga-c630: fix error and remove
 paths
Message-ID: <aFpqaylonUQwJfoV@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-1-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-1-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:12:56PM +0300, Dmitry Baryshkov wrote:
> Fix memory leak and call ucsi_destroy() from the driver's remove
> function and probe's error path in order to remove debugfs files and
> free the memory. Also call yoga_c630_ec_unregister_notify() in the
> probe's error path.
> 
> Fixes: 2ea6d07efe53 ("usb: typec: ucsi: add Lenovo Yoga C630 glue driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index d33e3f2dd1d80f7b49d9c5e7355fb14a97c74dd5..47e8dd5b255b2b306dd9c3d6ac8c3b896954981a 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -133,17 +133,30 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
>  
>  	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
>  	if (ret)
> -		return ret;
> +		goto err_destroy;
> +
> +	ret = ucsi_register(uec->ucsi);
> +	if (ret)
> +		goto err_unregister;
> +
> +	return 0;
>  
> -	return ucsi_register(uec->ucsi);
> +err_unregister:
> +	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
> +
> +err_destroy:
> +	ucsi_destroy(uec->ucsi);
> +
> +	return ret;
>  }
>  
>  static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
>  {
>  	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
>  
> -	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
>  	ucsi_unregister(uec->ucsi);
> +	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
> +	ucsi_destroy(uec->ucsi);
>  }
>  
>  static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {
> 
> -- 
> 2.39.5

-- 
heikki

