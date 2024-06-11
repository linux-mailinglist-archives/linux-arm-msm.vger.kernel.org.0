Return-Path: <linux-arm-msm+bounces-22280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3941903724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B10282460
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 08:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7587E178CE4;
	Tue, 11 Jun 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1+hfy8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD7017839C;
	Tue, 11 Jun 2024 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095986; cv=none; b=HAT47QwtTkhoUAoWe9+mUrYKDTb8aHxoUidZ8FDUe5c58rkuz3xWWzrgmJVBVhk5sK0ZHuvQsmGknZ+R9TPvOjDNIThplQSayQyHVOGoKWDCsA1qf35dtxet3Ha/QQ/jKJ/RAfXZxNhxiUl3zeixaxIVGZltfM2G8D6vvVRUjk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095986; c=relaxed/simple;
	bh=4my5g26YzEO0BtFAjOMhZ6Mg3AOp8tEE7NPVC/IGSNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9CEG0WTQXYRzzWBGjwa4tjCWabE7qpM9iy1B1MbVDoBaIV4D5t1+w0UMxZ+tdfFIMpuLIOKYP2YfF1qNsxGxD403Geq7nvw6TBdZnx7CuMO19rEVixMbg6v6ckMuvOaH00630dEGIMSHpewI0wAFwSpHaokkMoerx54roxFlAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1+hfy8h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718095985; x=1749631985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4my5g26YzEO0BtFAjOMhZ6Mg3AOp8tEE7NPVC/IGSNc=;
  b=Y1+hfy8h3W9GC5MxQCd2cITYk4NEgA4tcOg2X8/hXudPHG/pq+MSP5jX
   IYYzUgXm9P8hTuq8hX+F2fq6xfGy8Q3ULdSVSNo25hKwWpuGjh/633673
   2wONxoXCHRZIJtFFfP5lQT2wYf55LRXsGlM4DO3NPWlf+XtUNOW1ozEL+
   SVjzx7gyrYeTZxA1ImQFIIQBVqcgrhaV+7/tpLZKm92mUMMlQlKQLD9S8
   hKpn8kWQQrCO2bc7L9loGwU5lBIL4ZYsM1QEBcjH9Hmx9Y5TJ5PGH/Rae
   4SWb9cYnwcba8njfdOUS54A+RjpkLGt7cw38b64mNy0wB5HFcYD9HTZEM
   Q==;
X-CSE-ConnectionGUID: 6midKupAR/+GodYv76rnrg==
X-CSE-MsgGUID: 3XNLGAfWQceu22GnmCVCwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25912772"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="25912772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 01:53:05 -0700
X-CSE-ConnectionGUID: zRWiGUaFQkOOOJUfuTGK/Q==
X-CSE-MsgGUID: /l8WWPB+SJ6/Vt9q3nIxJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="43800303"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa005.fm.intel.com with SMTP; 11 Jun 2024 01:53:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Jun 2024 11:52:59 +0300
Date: Tue, 11 Jun 2024 11:52:59 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink: disable UCSI on sc8280xp
Message-ID: <ZmgQayq6RvJEQVgu@kuha.fi.intel.com>
References: <20240608114529.23060-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608114529.23060-1-johan+linaro@kernel.org>

On Sat, Jun 08, 2024 at 01:45:29PM +0200, Johan Hovold wrote:
> Disconnecting an external display triggers a hypervisor reset on the
> Lenovo ThinkPad X13s since 6.10-rc1 which enabled UCSI. Disable it again
> until the regression has been fixed properly.
> 
> Fixes: 3f91a0bf4a0b ("soc: qcom: pmic_glink: reenable UCSI on sc8280xp")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/soc/qcom/pmic_glink.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> 
> Dmitry reported off-list that his X13s was crashing when he disconnected
> an external display and I tracked it down to the enablement of UCSI in
> 6.10-rc1.
> 
> I have not had time to debug this further, but I'm flagging this as a
> regression and sending an effective so that we have a fall back in case
> this is not fixed in timely manner.
> 
> Note that this likely affects other Qualcomm SoCs as well.
> 
> Johan
> 
> 
> #regzbot introduced: 3f91a0bf4a0b
> 
> 
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 40fb09d69014..65279243072c 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -348,11 +348,15 @@ static void pmic_glink_remove(struct platform_device *pdev)
>  	mutex_unlock(&__pmic_glink_lock);
>  }
>  
> +static const unsigned long pmic_glink_sc8280xp_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
> +							     BIT(PMIC_GLINK_CLIENT_ALTMODE);
> +
>  static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
>  							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
>  							   BIT(PMIC_GLINK_CLIENT_UCSI);
>  
>  static const struct of_device_id pmic_glink_of_match[] = {
> +	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8280xp_client_mask },
>  	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
>  	{}
>  };
> -- 
> 2.44.1

-- 
heikki

