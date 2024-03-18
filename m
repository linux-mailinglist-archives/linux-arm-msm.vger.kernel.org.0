Return-Path: <linux-arm-msm+bounces-14377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477BB87E7BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC0F3B22E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CD4364A1;
	Mon, 18 Mar 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjiH1rwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A293612E;
	Mon, 18 Mar 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759230; cv=none; b=t3g9njA68fQVrrLABTf1PgIsSO3dxCyN1N1KWxJu7/6im86c1HdDEpRtpYckBk63r04IAXeRFFq/UZm0OCZnaomrn7auepZC7JEyKphfF3d6bKJwZsVAD6gM6ReMNtzFsBJxxt9gYV0Bywc4CfwIM77uSzFlMz9MM2+IZa3od74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759230; c=relaxed/simple;
	bh=UulcPcZPGGmuld9NlBNQVtXXwuHh0MpiN7ObYAIL0hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLyYHdenpwOlvCtmVuIjIfocChul5GIAh53l83TiOOHm4pL0OYza/GAeMpXZamO+MSV2IjD8YamJIm9gA/I+cxZxhAmijGBnWAMCIYix08AoGEjmcdIG5Nk9UcAUjMe9ZTzLBgkr7Xw41B9MXWYVXTgVUNEKEUGJOPwdoSV69hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjiH1rwF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710759229; x=1742295229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UulcPcZPGGmuld9NlBNQVtXXwuHh0MpiN7ObYAIL0hg=;
  b=WjiH1rwFMtk01yhogBx3RoIyDGM//LV2C3WuIUzPkaEfnBN993t1sb06
   tvqzXo+4XTH9Dr5G/gvgJcUb/OfuAdnefWcK98Yjrldx7pXS05V6Pzxj1
   bvh9HPm30n5DHd/2/9WYiEJa+LiVrcP0UqLwhfYlgukFyNgDqVkQ+h3/X
   HJhWCBZ9PmRd7bW0FrW+hJ7m7y88/llv7oleSB42T4J97JkTYmiB+UXzD
   muIGA9LhaYpTAUUczuDezq8eDtE620eB45cYsJrIq1SeJTyL+MdQ5bHzi
   MT0WChPgFibErx6xLIkr/t629eeKhjpISDk8oGsK97Jc8ecCP/70QECuO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5689101"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5689101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060149"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060149"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:53:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:53:44 +0200
Date: Mon, 18 Mar 2024 12:53:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] usb: typec: ucsi: properly register partner's PD
 device
Message-ID: <ZfgdOETcdm3M0OWg@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-6-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-6-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:16AM +0200, Dmitry Baryshkov wrote:
> Use typec_partner_usb_power_delivery_register() to register PD device
> for Type-C partner so that the PD device is nested under the partner's
> device in sysfs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 72d368433b1f..78e04b7701c8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -833,7 +833,7 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  	if (con->partner_pd)
>  		return 0;
>  
> -	con->partner_pd = usb_power_delivery_register(NULL, &desc);
> +	con->partner_pd = typec_partner_usb_power_delivery_register(con->partner, &desc);
>  	if (IS_ERR(con->partner_pd))
>  		return PTR_ERR(con->partner_pd);
>  
> 
> -- 
> 2.39.2

-- 
heikki

