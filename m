Return-Path: <linux-arm-msm+bounces-70069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA9B2EF69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBB517B0F04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 07:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC81B2E8B85;
	Thu, 21 Aug 2025 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLvSf/w1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331D72D97A9;
	Thu, 21 Aug 2025 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760925; cv=none; b=TV1SlEtK1k+S1MeRb+MFkuCJrxA1o/CPKP3/Jbm8BLQusu7RhzbJLrd9nP9lHq4FkJwWq3x2HKByOq6NU3BTgMZpYDRgGhk8wFVGoEQqGfB0y5WDLIDmkrwsyQEcWH3h0+roCDFzg01ii0lNVL3Wed7fhwcRUfFnFxq2Tx2TNLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760925; c=relaxed/simple;
	bh=9jqvzZDvhX+QL2Mnw32b1Jruz/NKey6zrKlijqESgQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqNef6it3QDgOGNEFwPx+TNIW6SnKxDiv0ZGZ2tvFJL3uRQJDgWHIxd0rUICnINsoPREEgZ9QK8ZLE7MVieKO2r8P9bFNxF/OJh+p9CTHj+1GMMR7iEWsTD9c3H8Z+ynUR8XD7LHnkZQQ67WFKy3fbz9Qgl/JVBptn9dfhM6txU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLvSf/w1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755760924; x=1787296924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9jqvzZDvhX+QL2Mnw32b1Jruz/NKey6zrKlijqESgQU=;
  b=OLvSf/w131kUedcsEzEBReKZbCNpT4NhxCqFlOVhMzrLyS6q4k7hYWVX
   0bCtP/sbo3yOPlYchJ214PNFA3ixAFHf/JfODQzYV64WjK1oKoznd8LxF
   qrQCAPXWG9PdRrPYUS2gNrj7s3M7/QaBfY8NdW6ND9csbVMHSTKYTYvkr
   DpxEDgYxkDSNdDKlUi3imQ0cpnny+Bx6OurOaDSrASjMkCB5s+Eufxs30
   j/4yYebpztmHoUAoyih8938oT6TSfrvff8EJ5whEyx7waJVTo0/9UQTSt
   GM3r8GuH6AqIWSldxb8BKL07VKKw0ontqz071d1W82i1gzLjRdqzp9e9+
   g==;
X-CSE-ConnectionGUID: tV/ikWapS2i2ogbook1eUQ==
X-CSE-MsgGUID: ssr4PU5GRgumUHjyNSqhfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60669024"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="60669024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 00:22:04 -0700
X-CSE-ConnectionGUID: Q193JMXcSlGictcgiuHC9A==
X-CSE-MsgGUID: 7Xa+vRZzT1euEEGiWkYpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="205510285"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 21 Aug 2025 00:22:01 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 21 Aug 2025 10:21:59 +0300
Date: Thu, 21 Aug 2025 10:21:59 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: use kcalloc() instead of
 kzalloc()
Message-ID: <aKbJF56n18KsHYyS@kuha.fi.intel.com>
References: <20250819090125.540682-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819090125.540682-1-rongqianfeng@vivo.com>

On Tue, Aug 19, 2025 at 05:01:24PM +0800, Qianfeng Rong wrote:
> Replace devm_kzalloc() with devm_kcalloc() in qcom_pmic_typec_pdphy_probe()
> and qcom_pmic_typec_port_probe() for safer memory allocation with built-in
> overflow protection.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 18303b34594b..c8b1463e6e8b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -567,7 +567,7 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
>  	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
>  		return -EINVAL;
>  
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>  				GFP_KERNEL);
>  	if (!irq_data)
>  		return -ENOMEM;
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 4fc83dcfae64..8051eaa46991 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -713,7 +713,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	if (!res->nr_irqs || res->nr_irqs > PMIC_TYPEC_MAX_IRQS)
>  		return -EINVAL;
>  
> -	irq_data = devm_kzalloc(dev, sizeof(*irq_data) * res->nr_irqs,
> +	irq_data = devm_kcalloc(dev, res->nr_irqs, sizeof(*irq_data),
>  				GFP_KERNEL);
>  	if (!irq_data)
>  		return -ENOMEM;
> -- 
> 2.34.1

-- 
heikki

