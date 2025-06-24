Return-Path: <linux-arm-msm+bounces-62176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F0AE604C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37764188FFF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398A127A918;
	Tue, 24 Jun 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ2DyeGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DD827A90F;
	Tue, 24 Jun 2025 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756124; cv=none; b=i7TCUHW7VqLlHInOg6LjFyMEIm/pgyTCAbyzdeCTAZb3ePAfqJMKD4tAEB20TIJeA/BniXniLxKuvdLfnowtIlHi5Ib5zmSm6VxP0sbK1iDHxazHiiJqpDu0pyq5teXuu+VpVmgwfPGcRwR/DJabPP0OzAgudtJqIjsbsdWnF08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756124; c=relaxed/simple;
	bh=nD9Z85wNJVBrnaSiitJ62UdEMzhSwyJpACrH6JwSTmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2J1DGfcrrdk13uuPMtathOIidhQz7TTBkUFuJQHSn+Bucsp4Sj+xjmnQFcJq5Nq2B6j+dI/9MmMnSWnO0yIRBGwPsPIMXqwCJYR3TN29c78TLmJ3itvNq/Allr8Fh+7WaoEnb9qvB7YXGwDzSxRkprhlulhmGw9fx+KT0iy2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ2DyeGu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756122; x=1782292122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nD9Z85wNJVBrnaSiitJ62UdEMzhSwyJpACrH6JwSTmw=;
  b=lQ2DyeGu/TUNuFFTn/7G+c2Mw1wK+AYye1CeWuE3sVwxEyltmSnvQJ5N
   EeIPHYUjiAcxZy3arq+r9wlcrVFQkseDc1Rkx54z2mXoGOepjU/8cBiu3
   JbQixISUP9BZ4WbZuA/cgOXgS0SSuJ0YcUUz6xPH7/r6tiFWogawXw8Sw
   HPOjjR5Z+hacx+17UTFUadkHhtVO9meG2UY6C+Hbm7jZCK5ImciQmIqsb
   2VNxMD10Q7otmizNV+7T/cUGPcWlUSJGzv5BCB63g7DH6cNfE7Sffhakz
   pCsIYLEB12+yEnx9bYhiM/UZbmjz3O+p2wRcYzuYNDp+KvSoMjiyXoifH
   w==;
X-CSE-ConnectionGUID: C26KPgtiR1mO4tS+L3GkCw==
X-CSE-MsgGUID: WvKg51XyQbGb/MI3azR0Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53123488"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53123488"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:08:41 -0700
X-CSE-ConnectionGUID: NGLu+VhQQnGaJJE3DBGd3g==
X-CSE-MsgGUID: hi2eUoqAQ/exPm0GXxITBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157364202"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa004.fm.intel.com with SMTP; 24 Jun 2025 02:08:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:08:36 +0300
Date: Tue, 24 Jun 2025 12:08:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/8] usb: typec: ucsi: yoga-c630: remove duplicate
 AltModes
Message-ID: <aFprFG2Pmnx1aAXT@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-3-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-3-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:12:58PM +0300, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 the EC firmware is buggy and it returns duplicate
> AltModes over and over again instead of returning an empty one, as
> demanded by the spec. Ignore extra altmodes by zeroing them in the
> update_altmodes() callback. It is not possible to shortcut that in the
> sync_control() callback since we need to know if the AltMode matches the
> first reported AltMode or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 47e8dd5b255b2b306dd9c3d6ac8c3b896954981a..7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -71,6 +71,28 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
>  	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
>  }
>  
> +static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
> +					   u8 recipient,
> +					   struct ucsi_altmode *orig,
> +					   struct ucsi_altmode *updated)
> +{
> +	int i;
> +
> +	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
> +		return false;
> +
> +	/* EC is nice and repeats altmodes again and again. Ignore copies. */
> +	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
> +		if (orig[i].svid == orig[0].svid) {
> +			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
> +			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
> +			break;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static const struct ucsi_operations yoga_c630_ucsi_ops = {
>  	.read_version = yoga_c630_ucsi_read_version,
>  	.read_cci = yoga_c630_ucsi_read_cci,
> @@ -78,6 +100,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
>  	.read_message_in = yoga_c630_ucsi_read_message_in,
>  	.sync_control = ucsi_sync_control_common,
>  	.async_control = yoga_c630_ucsi_async_control,
> +	.update_altmodes = yoga_c630_ucsi_update_altmodes,
>  };
>  
>  static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> 
> -- 
> 2.39.5

-- 
heikki

