Return-Path: <linux-arm-msm+bounces-14374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02F87E7A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F322831EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B582E651;
	Mon, 18 Mar 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U85BJ6I3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EDF24B26;
	Mon, 18 Mar 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758933; cv=none; b=F1V4UWdDiCB6+zEYILb0XUO8rRtvj0UbBp4KYkWwltWD+yIHMYEiIgqECl0hhkGcHRPebrhj3YuNfis7dD6h9Rp0Cry79ZvsI4dfvwA8JfGLbSyIsPzCNHDHLu8yFVKXNybTkxQYWQDeklxtPGjysmHu2NE4UUf+zxAdKaYY2FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758933; c=relaxed/simple;
	bh=RtP8eU6U6Ho2Zqu2gqpQBB1r7GR+88lHEvxc53l5Syw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V06DODeqNYZz3DNDwN7N3D6vkTjsZ/Viq4RQCS7043KQVkkKZv2TUm7RDUhcrspVUxd3zqGwELCrVHaEDsEObn+ImIG61O56v897/M01GABjs2GFDF7lMpb4pI4EcdZUX3ndp0WgEkIkHYdAEaR8BH9d7ejSycgvr2GLruf0FXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U85BJ6I3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710758932; x=1742294932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RtP8eU6U6Ho2Zqu2gqpQBB1r7GR+88lHEvxc53l5Syw=;
  b=U85BJ6I3TFMZG6kl26aT9VNq80cwmWN1IBfi8yj5c6Kg+xQqZO1a9AP3
   hlYnPedYw/TUMF+kXE+mN+7xEHMJvQvMz8gwRmqtWG7aSXriU0OPLrysg
   wMGe5txE340WIxDNQswacTIPeR5v7TJHLBq6BlD/LHARvrG8Izw3blHBN
   JdLDnbRuDvyCykEin5Y2gYymPLMttuEMvhzVTmVxZ47Ogws1gtNNCXSiH
   tuK0lb9L44AZXwmWqK2FCqsAsKX+tFPSXlFTQHnnmSydfPKj53/FfmH2N
   JdjQYC686I5lRPS4pnwUgn4lXgecS95vSclglTaYc3bMyu5YkDbV2IrmZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5688639"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5688639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060146"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060146"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:48:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:48:47 +0200
Date: Mon, 18 Mar 2024 12:48:47 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/7] usb: typec: ucsi: make ACK_CC_CI rules more obvious
Message-ID: <ZfgcD2b0ovU9BPiC@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-3-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-3-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:13AM +0200, Dmitry Baryshkov wrote:
> It is pretty easy to miss a call to usb_acknowledge_command() in
> the error handling inside ucsi_exec_command(). For example
> UCSI_CCI_ERROR had this call hidden inside ucsi_read_error().
> 
> Move this call and add a comment to make the rules regarding
> usb_acknowledge_command() calls more obvious.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bde4f03b9aa2..05a44e346e85 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -92,11 +92,6 @@ static int ucsi_read_error(struct ucsi *ucsi)
>  	u16 error;
>  	int ret;
>  
> -	/* Acknowledge the command that failed */
> -	ret = ucsi_acknowledge_command(ucsi);
> -	if (ret)
> -		return ret;
> -
>  	ret = ucsi_exec_command(ucsi, UCSI_GET_ERROR_STATUS);
>  	if (ret < 0)
>  		return ret;
> @@ -167,14 +162,27 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
>  	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
>  		return -EIO;
>  
> +	/*
> +	 * All error cases below must acknowledge the command completion,
> +	 * otherwise PPM will be stuck and won't process commands anymore.
> +	 *
> +	 * In non-error case the command is acknowledged after reading Data
> +	 * from the controller.
> +	 */
> +
>  	if (cci & UCSI_CCI_NOT_SUPPORTED) {
>  		ret = ucsi_acknowledge_command(ucsi);
>  		return ret ? ret : -EOPNOTSUPP;
>  	}
>  
>  	if (cci & UCSI_CCI_ERROR) {
> +		ret = ucsi_acknowledge_command(ucsi);
> +		if (ret)
> +			return ret;
> +
>  		if (cmd == UCSI_GET_ERROR_STATUS)
>  			return -EIO;
> +
>  		return ucsi_read_error(ucsi);
>  	}
>  
> 
> -- 
> 2.39.2

-- 
heikki

