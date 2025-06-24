Return-Path: <linux-arm-msm+bounces-62177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA74EAE605B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442A916BA98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42227A918;
	Tue, 24 Jun 2025 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDUskyJL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368427A90F;
	Tue, 24 Jun 2025 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756327; cv=none; b=u1x9gYSmQztqp41pBtxC5/GDjwl+txyM8DEJFVjtTvFzzg9jCrroAmeJAmXjqE+Re7E6/43ZXRslatqHRTYj76agB4Y8pZfPpHIl/932xFCdBiX4O1i7bN4DDjX8vkrTTPxhpPp7kcx0nZpckkdmIBFd0w9stl7dRwko0MZI1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756327; c=relaxed/simple;
	bh=1vCl6OjgYCkElTY8PpA8eUUM3Gi+uMcu9Dv2agF9CPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFGreVdqHDb0Vd87bNsTL83uyZphLiCzteFFHbamsyOlK1nEEbzh0fyyQvEVsVf4nQ8o5ypE3hALpGuM7AOs9X4NsWBV8xfPlbRimWCaknSTuxqxFCwEMtrqNtaueiRCRnY0ogj9l7sRXf7rIkPIZG8miKEzw4U0W53XGcvm6SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDUskyJL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750756326; x=1782292326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vCl6OjgYCkElTY8PpA8eUUM3Gi+uMcu9Dv2agF9CPQ=;
  b=HDUskyJL5I5xzE992BxUAH7L7JyIXFx8QPwcTAf3VG9dAlt+Jb84h72s
   7WadIp0Oc+f+U9XExp5A9rhVSMYc+fXa4il3EI2F2D6Rh71/Q4BZ2UnhI
   +AcFiXPkrdMJuyOa6HdrDpDpTuuyPWi5tIwrEGmZy0LBj2vL7NQA2pUhL
   2blvZQ2KWucOP0nON0jBcffWW/GBxvqXwtVqgki3TLZU4vISI9qYBF7Dy
   wKUNA+SJ+XL9ekUvb4HldLAGm70nGlouKMiRFKGOs8JPzjTi3B782RhVz
   XdoCSDx+X8A74NvTpaOCi2QxBcrPLsVoda+AS3NsbOANba7u4QZKfa52S
   w==;
X-CSE-ConnectionGUID: Fr+oPWIhSX2wwcRMqySHkA==
X-CSE-MsgGUID: UnKMqvjJQVGhS4keAPUG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56770945"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56770945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 02:12:06 -0700
X-CSE-ConnectionGUID: 9HuM2JOLScSjGb6qrxABWQ==
X-CSE-MsgGUID: o67X2V6CTlK89egYcOUxCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="189056725"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 24 Jun 2025 02:12:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Jun 2025 12:12:01 +0300
Date: Tue, 24 Jun 2025 12:12:01 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/8] usb: typec: ucsi: yoga-c630: remove extra AltModes
 for port 1
Message-ID: <aFpr4ZRczYeLDgsv@kuha.fi.intel.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
 <20250621-c630-ucsi-v1-4-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621-c630-ucsi-v1-4-a86de5e11361@oss.qualcomm.com>

On Sat, Jun 21, 2025 at 09:12:59PM +0300, Dmitry Baryshkov wrote:
> On Lenovo Yoga C630 the EC firmware is buggy and it cat return altmodes
> for a device pushed into the port 0 (right) when the driver asks for
> altmodes for port 1 (left). Since the left Type-C port doesn't support
> DP anyway, ignore all UCSI_GET_ALTERNATE_MODES commands destined to the
> port 1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> index 7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3..2005f64ebfe43ca2bcada2231ff99c578fdce877 100644
> --- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> +++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> @@ -71,6 +71,27 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
>  	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
>  }
>  
> +static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
> +				       u64 command,
> +				       u32 *cci,
> +				       void *data, size_t size)
> +{
> +	/*
> +	 * EC can return AltModes present on CON1 (port0, right) for CON2
> +	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
> +	 * support DP anyway).
> +	 */
> +	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
> +	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
> +		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
> +		memset(data, 0, size);
> +		*cci = UCSI_CCI_COMMAND_COMPLETE;
> +		return 0;
> +	}
> +
> +	return ucsi_sync_control_common(ucsi, command, cci, data, size);
> +}
> +
>  static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
>  					   u8 recipient,
>  					   struct ucsi_altmode *orig,
> @@ -98,7 +119,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
>  	.read_cci = yoga_c630_ucsi_read_cci,
>  	.poll_cci = yoga_c630_ucsi_read_cci,
>  	.read_message_in = yoga_c630_ucsi_read_message_in,
> -	.sync_control = ucsi_sync_control_common,
> +	.sync_control = yoga_c630_ucsi_sync_control,
>  	.async_control = yoga_c630_ucsi_async_control,
>  	.update_altmodes = yoga_c630_ucsi_update_altmodes,
>  };
> 
> -- 
> 2.39.5

-- 
heikki

