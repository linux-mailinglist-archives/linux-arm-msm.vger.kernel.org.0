Return-Path: <linux-arm-msm+bounces-35254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A06059A6965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 15:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55AFC1F2228A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 13:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4261EBA1E;
	Mon, 21 Oct 2024 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mr7Mmsg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005A1E511;
	Mon, 21 Oct 2024 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515673; cv=none; b=CIlGnn7yowjvBKxL/xUyYP3+0y/oKSTymVWlt5MEXd20S9ApTXY/P6Xxplzqreb9DKKJqEMQV9MRNEeT3CO8HNkcBme2bGWiuItaFBqrpijigWbLJnkkaPKFwk1mmaKL9Su/fAtbt9HImggrtDJFnI4phebKKdOqh14xHVL0Jo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515673; c=relaxed/simple;
	bh=ej3qu3+gaDVBh2zajSPGQQs7YptzCBhIISJg5FqP5Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5ZtuoIcg0SaY/bUg6AxnNeeVoE5gKwRXe1BGTnhmTvevYeIzGar/FL/MJUEaiHtlJAT1DdRLSzHQZ7IfDnJxuDeNC2nbc6R7tCivHUPqQg6vdfsZe2Ik1ccE40ofcyOmCzHJS6EveFi59rj7VrYcGJiv+onrpfXyUUtzcrQt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mr7Mmsg9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729515672; x=1761051672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ej3qu3+gaDVBh2zajSPGQQs7YptzCBhIISJg5FqP5Ys=;
  b=Mr7Mmsg9MXZzJkKHMP9+WvMb+mz93qt9QnjuND8Q8X+v3BMp+vP8gaeW
   31hWq9jkBze2zicISOWWv4FMtofRLzG/E88AO+/fdicJ6Qr1YWlniLolq
   eXG6tZwZuSMA90SLWzWZg0yfZCKeZdq9L2wOjbiJZvFZm7W87QfUvMfVo
   Q4WdoBexXfHiOmUDIRZBvo1KkcWAhkNBF7gcRnreLRZA9tiovlFA0QQqs
   i7XCOicWKd+5OQHTGPbk47YCTDOglUcLQ1av8dfKHIg/GZn4Xf6jBEK7u
   6FH0r4nb9nlteIVMY6PwZVj58QwWcc8kubtAaEm9zeKV9qgcI/RVyyPRj
   g==;
X-CSE-ConnectionGUID: SSPZ41cCQn+dXCJq9kjd3A==
X-CSE-MsgGUID: 3AT0bh6jSGy0U90EEV1wSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29162840"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29162840"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 06:01:12 -0700
X-CSE-ConnectionGUID: Ff3P9/pOT8ipqVHXPAl0nQ==
X-CSE-MsgGUID: pm4T5JBTSeeKY95E78IYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79871502"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 21 Oct 2024 06:01:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Oct 2024 16:01:06 +0300
Date: Mon, 21 Oct 2024 16:01:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: qcom-pmic-typec: use
 fwnode_handle_put() to release fwnodes
Message-ID: <ZxZQks8_rkYge-yf@kuha.fi.intel.com>
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
 <20241020-qcom_pmic_typec-fwnode_remove-v2-1-7054f3d2e215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-1-7054f3d2e215@gmail.com>

On Sun, Oct 20, 2024 at 02:56:34PM +0200, Javier Carrasco wrote:
> The right function to release a fwnode acquired via
> device_get_named_child_node() is fwnode_handle_put(), and not
> fwnode_remove_software_node(), as no software node is being handled.
> 
> Replace the calls to fwnode_remove_software_node() with
> fwnode_handle_put() in qcom_pmic_typec_probe() and
> qcom_pmic_typec_remove().
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 2201eeae5a99..73a159e67ec2 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -123,7 +123,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  port_unregister:
>  	tcpm_unregister_port(tcpm->tcpm_port);
>  fwnode_remove:
> -	fwnode_remove_software_node(tcpm->tcpc.fwnode);
> +	fwnode_handle_put(tcpm->tcpc.fwnode);
>  
>  	return ret;
>  }
> @@ -135,7 +135,7 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
>  	tcpm->pdphy_stop(tcpm);
>  	tcpm->port_stop(tcpm);
>  	tcpm_unregister_port(tcpm->tcpm_port);
> -	fwnode_remove_software_node(tcpm->tcpc.fwnode);
> +	fwnode_handle_put(tcpm->tcpc.fwnode);
>  }
>  
>  static const struct pmic_typec_resources pm8150b_typec_res = {
> 
> -- 
> 2.43.0

-- 
heikki

