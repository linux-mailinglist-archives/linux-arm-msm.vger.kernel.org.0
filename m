Return-Path: <linux-arm-msm+bounces-16083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10043895170
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 13:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDFBA28804A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5C95D749;
	Tue,  2 Apr 2024 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPdMskb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3160BB6;
	Tue,  2 Apr 2024 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056042; cv=none; b=AWyC7Z7JEkQMlqlPeX7M1HzWYYQgpK/7/Qgyx2fzP3MjyoB6e7GV6wBK+2IyZbzGEbKl2shZn4BFLwv50O902yPD+81Q5dwSxgGzrs1ne3H0WP+05LbEmGCKnkSzEIXA7QnclUKePx/qOmexfC1G2suTsoBF/i2+XYPNIXQD+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056042; c=relaxed/simple;
	bh=/T1mri8b/0fnueh22GddljkZfL2fnPdJTMp6hkaSMkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZRZAN2zwDIcXEibwKbnn5gaWuJtL4/VX/3G7QDzZ6c/lMizToGsavrQ2fxkRMHaXJYLfFW8O0iKSeOXgtQ3lFdN0oYXPJWuNK2L4hzdtAwFXvtD/4dU2zp1Xi4GkOzxmRPmazLFv+ctvRB1efZTy3UfhJhYvl2AYQ8Urg4CZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPdMskb8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712056041; x=1743592041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/T1mri8b/0fnueh22GddljkZfL2fnPdJTMp6hkaSMkg=;
  b=NPdMskb8zqQFDofGiV3HINE715YL0Oxd56nWOti+I2gHiV3yykhrBIXf
   BiEZHwAQX+q9bwB09asY2m4cv7ABUEiJ1ONEIOXHGZpqFmaL3BLj4DuRM
   xEjSp1UzhsNG4AkSkPKObL0+/PZouXpho/XuemGE4WomCZzAZjA4jmoau
   UW2rM1LD8PubEtodlbRNvsc02V9wcxc2emnvHm/+R/fwt+sYC9+6vxIL1
   s8r/r4FxYjC0ERM9RjXe2ePW04O5gIT1OmY6Z2oF4lAtez2V7fC2RdduP
   EgkOXLiKgSQowNgXkow1xtcHl+jZ5Vy/b0HOyi6G0SS17RZUQbtaAmTc0
   g==;
X-CSE-ConnectionGUID: M+q65fIsS/+nJ0cAg06DAQ==
X-CSE-MsgGUID: R+CL5TTtT4mH3ZkcW/pO1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17790271"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17790271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 04:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083356"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083356"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 04:07:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 14:07:16 +0300
Date: Tue, 2 Apr 2024 14:07:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 09/11] usb: typec: ucsi_glink: enable the
 UCSI_DELAY_DEVICE_PDOS quirk
Message-ID: <Zgvm5BLgiCfRMHa1@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-9-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-9-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:41AM +0200, Dmitry Baryshkov wrote:
> Enable the UCSI_DELAY_DEVICE_PDOS quirk on anything past sc8180x /
> sm8350.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index d7a18950faab..bd5ad1898a4a 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -298,13 +298,16 @@ static void pmic_glink_ucsi_destroy(void *data)
>  }
>  
>  static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
> +static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
> +static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
>  
>  static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
> -	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
>  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
> -	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8180x, },
> +	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8280xp, },
>  	{}
>  };
>  
> 
> -- 
> 2.39.2

-- 
heikki

