Return-Path: <linux-arm-msm+bounces-14371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81F87E78F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED49F2826E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACF029D05;
	Mon, 18 Mar 2024 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTZDfcLr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8902206B;
	Mon, 18 Mar 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758590; cv=none; b=rJ/+4LI6EO72tVZDCJ/5UbG924Xbb74V5lbqN3ql2xTaICaDiKbmoDf0lZvxmXDQfMhW4ObJBfBpCCZZVON+Yh6Cm02sHxI1ws+hDDvOhXMJmT38viBVkTVDfMWYav3hJmDGfwsNjHNSXL40shquFm7atwt3SylPP6gCaOr63AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758590; c=relaxed/simple;
	bh=4Fni8SYLFfRRbsrD9nvd2suOlqS7UsLniPM7ZmjNnqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opSPXjfC4yhDOntyu/RnEzPlcUe3zuac1OlkvDfa9lU/+r4QJlWcysNTnl6UnsPJ76jvva4ASH1a+9Vw/uqVOULUoi7J5hwP/qIklvCqq7d5g3J5BVt5WTG7OXEuE0dyK8RyEOgmgrv1TydEi+K0ijuclSCWbBjND9TBS0fGO4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTZDfcLr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710758589; x=1742294589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Fni8SYLFfRRbsrD9nvd2suOlqS7UsLniPM7ZmjNnqE=;
  b=dTZDfcLrBjUBcYJs5hz7u+OYoY1SFLXKUJxbgiEpLyid1c5vE984CIsG
   +5jsubDzyILp/D3Ng7OqN1w94XAIBQOgFnBGqQ6ZmebVO9ulVfcsB5qVs
   YxWWgpuzvPSEeLihvRpT/24fAjYkhSYE8hP0tysREhykNz7mL2uRMm9f+
   YGs7+IOnNfCvYr7Pv6CJB8gLhgyXmNmRZDAZhaCJP72pNy8WQs2tKosdz
   bBWG6H7B3YT81PhPy0RtRnXGd5XVPao8ylrgWRr3qnPKqeN1TO3GAJOLX
   t3ufJLtii7tuHOU76Hs+NrNDFMUlsJmUrjgSqZH4Jo2/JeYkcR+czLR2/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5688068"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5688068"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060144"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060144"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:43:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:43:03 +0200
Date: Mon, 18 Mar 2024 12:43:03 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: ucsi: fix race condition in connection
 change ACK'ing
Message-ID: <Zfgat85yW7gBgnxB@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-1-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-1-74d90cb48a00@linaro.org>

Hi Dmitry,

On Wed, Mar 13, 2024 at 05:54:11AM +0200, Dmitry Baryshkov wrote:
> The code to handle connection change events contains a race: there is an
> open window for notifications to arrive between clearing EVENT_PENDING
> bit and sending the ACK_CC_CI command to acknowledge the connection
> change. This is mostly not an issue, but on Qualcomm platforms when the
> PPM receives ACK_CC_CI with the ConnectorChange bit set if there is no
> pending reported Connector Change, it responds with the CommandCompleted
> + NotSupported notifications, completely breaking UCSI state machine.
> 
> Fix this by reading out CCI after ACK_CC_CI and scheduling the work if
> there is a connector change reported.
 
> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

UCSI specification quite clearly states that the PPM must wait until
OPM has acknowledged the notification before sending the next
notification, so this looks like a workaround for Qualcomm specific
issue. Ideally it would have been isolated - now this is done on
every platform.

I'm a little bit uncomfortable with the unconditional reading of the
CCI field. On most systems reading the field will clear it completely.
Hopefully that will not cause more problems.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cf52cb34d285..4abb752c6806 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -61,12 +61,28 @@ static int ucsi_acknowledge_command(struct ucsi *ucsi)
>  
>  static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
>  {
> +	unsigned int con_num;
>  	u64 ctrl;
> +	u32 cci;
> +	int ret;
>  
>  	ctrl = UCSI_ACK_CC_CI;
>  	ctrl |= UCSI_ACK_CONNECTOR_CHANGE;
>  
> -	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> +	ret = ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
> +	if (ret)
> +		return ret;
> +
> +	clear_bit(EVENT_PENDING, &ucsi->flags);
> +	ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return ret;
> +
> +	con_num = UCSI_CCI_CONNECTOR(cci);
> +	if (con_num)
> +		ucsi_connector_change(ucsi, con_num);
> +
> +	return 0;
>  }
>  
>  static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
> @@ -1215,8 +1231,6 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
>  		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
>  
> -	clear_bit(EVENT_PENDING, &con->ucsi->flags);
> -
>  	mutex_lock(&ucsi->ppm_lock);
>  	ret = ucsi_acknowledge_connector_change(ucsi);
>  	mutex_unlock(&ucsi->ppm_lock);
> 
> -- 
> 2.39.2

-- 
heikki

