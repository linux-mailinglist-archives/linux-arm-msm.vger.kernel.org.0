Return-Path: <linux-arm-msm+bounces-62178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E843FAE6062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF5E188FFED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF1427A918;
	Tue, 24 Jun 2025 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiuS/zgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B91126C05;
	Tue, 24 Jun 2025 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756404; cv=none; b=k/w3LuS/03qYiahJ225rjqV+cL/8lpPj8cBh+PTmFcXpyx//05sd8G/dP2Zro0tqtZe6X2ftvV0RR1g2VgE2QCoGC42C7jO/m4FdBZ8549eTTjfE1LsekVhhrcVwzfzgNWfUiKEJYLkDpTUb8/a2jRsMNhRatztyLUX/PVIQ4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756404; c=relaxed/simple;
	bh=1rtj4LL8jpBMhqQhtH/QLjHCuuhJHvwXIw7NHRiEGUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYIa15tTcMtWBzJCq+mUc2Rfc0jrnB9Vgpon8htQv9uKP+NAwVj6K8P+Ky/7ESksGJOCWk1M2BUB/0gG2PhaIiNUzXyE5w0pDDVZOohTubLMXSaLOSqFIixiofg7FgD1yo5zZ27zKKupvEiq1neDg/QBWDruBgiLp4H/u2MII4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiuS/zgZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756403; x=1782292403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1rtj4LL8jpBMhqQhtH/QLjHCuuhJHvwXIw7NHRiEGUg=;
  b=eiuS/zgZZ1eCBrEx9tZHikNW5oBNQTiZw/VPWzGCZg6BcMucsaPmRs1G
   rkQmtmkVwkrdCGX/dxcqo6s3rCKilQUz1pS++tpU3usOkcnN+v/8UspL2
   WtIgFhXzBmKVmIWS8Tx0VKgrGgGwTb+7w+b+6kFl/bWqT0y3uK+we8FVU
   6j8NZ+Z86N/moGbqwzwVaXMtZKe+xMZ9pkh6Uzzcn13cZxq1tVbqy2Hwl
   8k0sS5tkDwBMSp8cUYpIMQvHjCTh+wrxJ7VeoTDMXpWUC1t1I9DuNIy1g
   OFfstH6cnqPmMVobMI81eaLn/gmCQcFqEb7yRizyl5qeFDgBr9BpjA97Q
   A==;
X-CSE-ConnectionGUID: eTV1/814QbCtUi38tuoslA==
X-CSE-MsgGUID: tfXPIBJkQvKcnsQbIrO8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52859295"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52859295"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:13:23 -0700
X-CSE-ConnectionGUID: ye8MAOSpSBG2969zWUxzDA==
X-CSE-MsgGUID: cZRg6GkETMmU7UUV+xswBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152029507"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa007.jf.intel.com with SMTP; 24 Jun 2025 02:13:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:13:18 +0300
Date: Tue, 24 Jun 2025 12:13:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/8] usb: typec: ucsi: yoga-c630: fake AltModes for port 0
Message-ID: <aFpsLpuE1VYjxtJy@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-5-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-5-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:13:00PM +0300, Dmitry Baryshkov wrote:
> EC firmware provides information about partner AltModes and handles the
> DisplayPort AltMode internally, however it doesn't report AltModes of
> the port to the host. Fake the DP AltMode for port0 in order to let
> Linux bind displayport AltMode driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.h           |  1 +
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index d02f6a3e2f50a4044eb3f22276931017cc624532..b711e1ecc3785eeb34e407e58df939f2d29bdb38 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -50,6 +50,7 @@ struct dentry;
>  /* Command Status and Connector Change Indication (CCI) bits */
>  #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
>  #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
> +#define UCSI_SET_CCI_LENGTH(_c_)	((_c_) << 8)
>  #define UCSI_CCI_NOT_SUPPORTED		BIT(25)
>  #define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
>  #define UCSI_CCI_RESET_COMPLETE		BIT(27)
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 2005f64ebfe43ca2bcada2231ff99c578fdce877..506faf31b6e3a056e067f2bb69f5e9e5ea40e514 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -76,6 +76,28 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
>  				       u32 *cci,
>  				       void *data, size_t size)
>  {
> +	int ret;
> +
> +	/*
> +	 * EC doesn't return connector's DP mode even though it is supported.
> +	 * Fake it.
> +	 */
> +	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
> +	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 1 &&
> +	    UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_CON &&
> +	    UCSI_ALTMODE_OFFSET(command) == 0) {
> +		static const struct ucsi_altmode alt = {
> +			.svid = USB_TYPEC_DP_SID,
> +			.mid = USB_TYPEC_DP_MODE,
> +		};
> +
> +		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
> +		memset(data, 0, size);
> +		memcpy(data, &alt, min(sizeof(alt), size));
> +		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
> +		return 0;
> +	}
> +
>  	/*
>  	 * EC can return AltModes present on CON1 (port0, right) for CON2
>  	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
> 
> -- 
> 2.39.5

-- 
heikki

