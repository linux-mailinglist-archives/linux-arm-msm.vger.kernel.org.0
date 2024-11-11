Return-Path: <linux-arm-msm+bounces-37455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4279C3A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 10:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5EB1F21FFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C3E16F271;
	Mon, 11 Nov 2024 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCwnx0dQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADB158535;
	Mon, 11 Nov 2024 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316204; cv=none; b=glUaXDfQUqRrmSe1/UzdwM4JyxF8seSgXu6l2rC/onhXgmhEBXGDm7QVNmg+HAjfTfs6UxcktMzSyjEGaGPcjM8EbiZ4p9QmBKBy8eqiBhyf9Y1n84RiMptXl7dF3aALXS3X29uZWXEZ/8K7xgK+rcRmTRkjD2SoAHWJAd8AXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316204; c=relaxed/simple;
	bh=w2quWylktzfEXCEOtYZ/56dXUl8crGpzaNaylY+kM5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9CLIrwj4TkXh7ML2+DLe7+3gyY18nl/7TwYgPWdciP7IV6sx6wPtdch2GgCyx3S0T/24SyYjd5EjmW83OYJIW8xIBS3Q9bgEWAGS5U1Qjexs+gVCKUdtIQ28ekjzo3kZKDG+/5ktPsn95Ae1jRlzKH3OpU1FwALX6f//R1QUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCwnx0dQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731316204; x=1762852204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2quWylktzfEXCEOtYZ/56dXUl8crGpzaNaylY+kM5E=;
  b=lCwnx0dQVZPuImlT8D0EEkhrwjd3VWg0okB6/QcTaro6ECanPNt+rWWi
   flFEYQw1IE6//r0gxYcwyCm8kdk4U2kzzwevQOUErlEdJBNooYDAqFtFr
   F80DaIN4Yh3l05sTPYSqJ9hCzSR4Jqa+fCyQR+xhoaRRsEwEJv8SfzL2o
   +0Epy4BWY69HBvXgp1RWRs6Cv8rSud8FZKMLblsPaawHMbiaAVKJ6UcsD
   aBO5fi+c/VZO4HqbZ6dPgm6tQadR4GBwoJyIT0t90gRh+02ggpflBHyCY
   zh1AChc3bEpSrlWLvSyQH8O99eRivFjGt1OoLw2XNqVwemto3f3oRcKu4
   g==;
X-CSE-ConnectionGUID: nN3sDAb0RVSEq7miMWUd5A==
X-CSE-MsgGUID: xqM/vSZ9QcSrZwAsseIofw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31274080"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31274080"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:10:02 -0800
X-CSE-ConnectionGUID: qDs9M+kmTCqssMaELPAakA==
X-CSE-MsgGUID: tJJ3vRKgSHikWe/2T8+JBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91346519"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa005.fm.intel.com with SMTP; 11 Nov 2024 01:09:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Nov 2024 11:09:56 +0200
Date: Mon, 11 Nov 2024 11:09:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: glink: fix off-by-one in
 connector_status
Message-ID: <ZzHJ5Ac1N9lSdfCy@kuha.fi.intel.com>
References: <20241109-ucsi-glue-fixes-v2-0-8b21ff4f9fbe@linaro.org>
 <20241109-ucsi-glue-fixes-v2-1-8b21ff4f9fbe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-ucsi-glue-fixes-v2-1-8b21ff4f9fbe@linaro.org>

On Sat, Nov 09, 2024 at 02:04:14AM +0200, Dmitry Baryshkov wrote:
> UCSI connector's indices start from 1 up to 3, PMIC_GLINK_MAX_PORTS.
> Correct the condition in the pmic_glink_ucsi_connector_status()
> callback, fixing Type-C orientation reporting for the third USB-C
> connector.
> 
> Fixes: 76716fd5bf09 ("usb: typec: ucsi: glink: move GPIO reading into connector_status callback")
> Cc: stable@vger.kernel.org
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 3e4d88ab338e50d4265df15fc960907c36675282..2e12758000a7d2d62f6e0b273cb29eafa631122c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -185,7 +185,7 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
>  	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
>  	int orientation;
>  
> -	if (con->num >= PMIC_GLINK_MAX_PORTS ||
> +	if (con->num > PMIC_GLINK_MAX_PORTS ||
>  	    !ucsi->port_orientation[con->num - 1])
>  		return;
>  
> 
> -- 
> 2.39.5

-- 
heikki

