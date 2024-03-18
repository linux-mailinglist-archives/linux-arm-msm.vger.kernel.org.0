Return-Path: <linux-arm-msm+bounces-14378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6487E7BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84ED1F23CF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E8C364B8;
	Mon, 18 Mar 2024 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lg56H3dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675EC364B1;
	Mon, 18 Mar 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759262; cv=none; b=JmuVm2PMpLZ9tlNORmi0XX/xser9SVMMGVb2CmHs9l5d++SDoNCpAB6LUzEGGEwzw1B3admRq/olAEdbM6LLFsYq4grdMxe/YUHUvusEyEfWmQufwm5IYHHBpwPsvfbg3voV0E/nf6ejKwwdAxtcvNk+hOcHWQLXmwRR6+wxT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759262; c=relaxed/simple;
	bh=5kJ4JgBacAaoHudopqOcpLyTe2tEolQgkTqBecahwIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDfAKbd5IbSartW/UeIVKIUF0fgFOVEm+P+ER/AP0irlm1kIU+EHUa2UCMlqdSHOjVceEH1KpCQ2tNOwyP1gC5Rw3ZPAQHVG9v7K4/iajvcO+dw29JGx9ba1hfpRP4yekOZmHZso1T+RnQ4XqvUbrNgmC2cNF/Ih4Gm25Y/qzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg56H3dk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710759261; x=1742295261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5kJ4JgBacAaoHudopqOcpLyTe2tEolQgkTqBecahwIE=;
  b=lg56H3dkoINoyghd+vxui9qoiUQn+WzemMKg+he+M8xhSIUaXBfmonS0
   erZQEZSGjLyEZ0zweQ9ckoolrKbIUyuzoX5mgsaRGFmTSwiLvQbSANKbo
   c4hjG1xDJXWL796c4ykRZcrvUA6Qx0GmgUy6i4pXXHtwddkVOSa7wF5wj
   co47iYekYUzE0m/uPHDcqofbVo+t2cPC0m/yY9DmQxgtTP+1OBVJ55wLc
   Z+kbAdCMhKRiXj74lfiuH/xJBmMn8sC7nmie59cnf1A2C/kgflOJFdVGs
   HpKIjquhZoPJmTouAUExBiAeNXw3XUWHudNAbQQm6uzyMjIUg+HUIu5+O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5689160"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5689160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060150"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060150"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:54:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:54:17 +0200
Date: Mon, 18 Mar 2024 12:54:17 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/7] soc: qcom: pmic_glink: reenable UCSI on sc8280xp
Message-ID: <ZfgdWS8oI4TfKj2Y@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-7-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-7-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:17AM +0200, Dmitry Baryshkov wrote:
> Now as all UCSI issues have been fixed, reenable UCSI subdevice on the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/soc/qcom/pmic_glink.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index f913e9bd57ed..e5a591733a0f 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -343,7 +343,6 @@ static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT
>  
>  static const struct of_device_id pmic_glink_of_match[] = {
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
> -	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
>  	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>  	{}
>  };
> 
> -- 
> 2.39.2

-- 
heikki

