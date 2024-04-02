Return-Path: <linux-arm-msm+bounces-16084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE149895172
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 13:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D9A51F20CD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF54E604BB;
	Tue,  2 Apr 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7YnfbpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BA459176;
	Tue,  2 Apr 2024 11:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056078; cv=none; b=pCydAWHXtX/WMJl3QtC8NKahSv4AF0IlpDN3eiMbePj2Jv52KYLU+K/zIcXH/ySP3QLRNRP5y+p9sHor2+8I0z47GmomJeRudkPqznQxTgKwrGTNXvFq8ozI95nf1xdDzEdyCaovf+QDIbAfXfhmTEfjVuRx3O9oCQO7Lnrh1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056078; c=relaxed/simple;
	bh=ozasLjnG9pB7ik3kFxEJQG3wN6hrqhNa18GbPPH0O2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgULO3cNfrICLBMxe1I8xbOBZb5Xw9jQ9dW4rKnOG5gSMw3Hk52eY3yz9WfEQkAYGjLho+sjnr2+jU8I/S/iIfp8XGXXWkleF/SvwIMjekCYzkzB9teNSYPWtmG/6Ir5RpK+HKu1c9PTvzOuMgPN8ShGIxaB6Zn0K5vtpHz9o9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7YnfbpY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712056077; x=1743592077;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozasLjnG9pB7ik3kFxEJQG3wN6hrqhNa18GbPPH0O2E=;
  b=g7YnfbpYfjbNmOBdxzP36TyZNi4W3mrxkHlVNAPei7Ktpt0k3ItG/+rI
   C/9/moZnEAhROoTsEYRpvQ8K3h939SnGJL52hfCal5QuuRB0UGinvrTE3
   CgoI6l4XH1X4AI28fb70OAU7Ne3Buk4B5yD7/1N4zZqrZEb3e/N57HoOu
   akO826XrM2C1cvubdXm64A1OowSDRijZxal2vNlAg+kEjaxr52pOT1auN
   Ig/8skU1BlYU24DFxSpf2RA8wAlCMW1J7zVqiA1qhNnC6r4SEzgwd01nV
   V+oFwPJGYvBT6p8+xcspSYhQpGYgkIt8Fa5FAc2UUPuy4R0ciRaoF0r5m
   A==;
X-CSE-ConnectionGUID: rMWwye6gQI+46HjSLWxy8w==
X-CSE-MsgGUID: +wOVNUFiSzeGid9KJMt2Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17790311"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="17790311"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 04:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083357"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083357"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 04:07:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 14:07:51 +0300
Date: Tue, 2 Apr 2024 14:07:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 11/11] soc: qcom: pmic_glink: enable UCSI on sc8180x
Message-ID: <ZgvnB24F0PcPY10J@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-11-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-11-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:43AM +0200, Dmitry Baryshkov wrote:
> Now as all UCSI issues have been fixed, enable UCSI subdevice on the
> Qualcomm SC8180X platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/soc/qcom/pmic_glink.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index e5a591733a0f..c2f71d393bbb 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -334,15 +334,11 @@ static void pmic_glink_remove(struct platform_device *pdev)
>  	mutex_unlock(&__pmic_glink_lock);
>  }
>  
> -static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> -							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
> -
>  static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
>  							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
>  							   BIT(PMIC_GLINK_CLIENT_UCSI);
>  
>  static const struct of_device_id pmic_glink_of_match[] = {
> -	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
>  	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>  	{}
>  };
> 
> -- 
> 2.39.2

-- 
heikki

