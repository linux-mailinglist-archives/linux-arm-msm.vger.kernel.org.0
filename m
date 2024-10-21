Return-Path: <linux-arm-msm+bounces-35255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C459A6970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EBC282CE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B2B1F12FA;
	Mon, 21 Oct 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl9Phj+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FC11EBFF2;
	Mon, 21 Oct 2024 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515727; cv=none; b=mmTILtLtfekXN+xUQ7/4AKNN1GWGi8alFBCdHLEbFFxOgJg74wPPgx0oIuKXgQQFiwUhoKppg8uQcChj6ttdgLrNz3j0QHCVeitmJyMVExMKPc3MRbfoPJalvkNb6cL0H6ZIU2ExCm5NG1nybc8okqYkk9QTMEAsOMrD+xo0H/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515727; c=relaxed/simple;
	bh=8itIoOYZBHbN70uXfi+3Suhes94pWXiiVtt84YiJTfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZsG4pws43wyr3jDw4ndr1DDbqSij8WKuyEyEbkeYLPK+uoiDG+lsoxabhTi/pUPwfwr4S7UCeXZXcZfFzrt1hCazO2aYOyt0BJHNqV7UwLZk4SyGVyEhpQcI5beAhu5C693dgFYb/9kRoPhLJfELr9YB1J5sU9FvxWRv9Q7R/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl9Phj+1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729515725; x=1761051725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8itIoOYZBHbN70uXfi+3Suhes94pWXiiVtt84YiJTfk=;
  b=hl9Phj+1DtOH5wkFIOJ3LvRerEcJ9w1+YN8SbL+lRv8j+X3FmzuRNQj/
   ujqSP0wYjkCZmGoYwllfSIKu1zyZ0b4zAiKqP9ZH1gVhiFTW/PfOrylnq
   9rEXZUZEiyX+XndrKBfwoMxcDNTMbEYmJOonM3kTinmiCSEwmDpVcnImV
   mcHV5KYeKxkLnlAgVRfA4n/QOx4fIXPluVBR+ovVf3Ej5I2NfDDXRfWxA
   1gtVGMQAFZ2Pofc0tYSmXtsNes+2qROcgyB2GAH94hsvcdzeUfmpRbr4w
   FYsU4f7NOs4qnTLantjMlORkb54zfJ+i8PgyP20znQlJ+d3+N/fQqqUcs
   A==;
X-CSE-ConnectionGUID: VE8BrWDESXaL37vTIC0IxQ==
X-CSE-MsgGUID: BFDe4+NESQe+oipAWHFEXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29093673"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="29093673"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 06:02:01 -0700
X-CSE-ConnectionGUID: Z958YA05R7eDlfjXgjdNpw==
X-CSE-MsgGUID: UHFHRyXgQUSrPjz22/V4yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="110351399"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 21 Oct 2024 06:01:57 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Oct 2024 16:01:55 +0300
Date: Mon, 21 Oct 2024 16:01:55 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: qcom-pmic-typec: fix missing fwnode
 removal in error path
Message-ID: <ZxZQw2DuKpPrBuGL@kuha.fi.intel.com>
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
 <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>

On Sun, Oct 20, 2024 at 02:56:35PM +0200, Javier Carrasco wrote:
> If drm_dp_hpd_bridge_register() fails, the probe function returns
> without removing the fwnode via fwnode_handle_put(), leaking the
> resource.
> 
> Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
> the fwnode acquired with device_get_named_child_node().
> 
> Cc: stable@vger.kernel.org
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 73a159e67ec2..3766790c1548 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -93,8 +93,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> -	if (IS_ERR(bridge_dev))
> -		return PTR_ERR(bridge_dev);
> +	if (IS_ERR(bridge_dev)) {
> +		ret = PTR_ERR(bridge_dev);
> +		goto fwnode_remove;
> +	}
>  
>  	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>  	if (IS_ERR(tcpm->tcpm_port)) {
> 
> -- 
> 2.43.0

-- 
heikki

