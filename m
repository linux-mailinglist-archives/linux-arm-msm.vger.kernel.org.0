Return-Path: <linux-arm-msm+bounces-14375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E4487E7AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FC5CB2062B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69DEF2E651;
	Mon, 18 Mar 2024 10:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIFnSGqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD732C89;
	Mon, 18 Mar 2024 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758990; cv=none; b=hxsYXb2GGcM6+n/+xKPiYeCl0Osb7/DPKktF5FpE2Ep9LP7HdYzTgSLW7pOiZ1rcQempYcdepUaPVBxQKLcirrv2LHHkOpDI9egPoG8hoYuZgg/oqROE+VOysFkuWFDInoKMmyHPChPQRoQtplQYuL7vM5HWdo6PMDRxXNIJpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758990; c=relaxed/simple;
	bh=HkKXZS+xqewqpC1IUBdyeh/GAjd0JKls/I/Ml9dMl00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIUqS0cxxOCs0QT5N8Myc/6JjSDK1q9XJlo8LxcPX0NJOifVIqEQReXW+Beh0SIn2R58Nd8DiTRhlnqgOV5u3WrqeJymLLXIZa5YrlBKlK+c4Z7/YC/IPv+dEVaXbQiqWpuKlwspuESb2FgVDK9wpE+AewPni3plZSGC3QS1g+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIFnSGqf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710758989; x=1742294989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HkKXZS+xqewqpC1IUBdyeh/GAjd0JKls/I/Ml9dMl00=;
  b=XIFnSGqfDfywfMoLnUL6A9YrPwx/x8Tk/vVZZ0kjxQ/MAJrQeQqQ/Bqh
   eRbzSvDtlF9Wf+4Qvey0G+xusidprAHW34LcOlY8AT7lKgmjO0k7c/8k0
   FWVBgJhuxXRMkvKCt2IvbJgp21D8gG6eMH3sSuz7GDMqGD1Ui2a/TtUz8
   9rpNaoKTjP0fhgA79mOC57hmnOVuezhjovKYXjstg/aaDlcvFtlNHjUxQ
   qy2PTrcmCd9BkdC45p0LpVLY8wvaPZTqD18RoQGYc7ICtRKgAiGtQgiqi
   7mOCYfnEtZuSMinH8QjfpKmM3jtXNzilB7CoY9YZAKRgcZji9lp7RIWFT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5688831"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5688831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060147"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060147"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:49:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:49:44 +0200
Date: Mon, 18 Mar 2024 12:49:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] usb: typec: ucsi: allow non-partner GET_PDOS for
 Qualcomm devices
Message-ID: <ZfgcSKh1p2G+mcZs@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-4-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-4-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:14AM +0200, Dmitry Baryshkov wrote:
> The name and description of the USB_NO_PARTNER_PDOS quirk specifies that
> only retrieving PDOS of the attached device is crashing. Retrieving PDOS
> of the UCSI device works. Fix the condition to limit the workaround only
> to is_partner cases.
> 
> Fixes: 1d103d6af241 ("usb: typec: ucsi: fix UCSI on buggy Qualcomm devices")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 05a44e346e85..011d52bf34f6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -641,7 +641,8 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>  	u64 command;
>  	int ret;
>  
> -	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> +	if (is_partner &&
> +	    ucsi->quirks & UCSI_NO_PARTNER_PDOS)
>  		return 0;
>  
>  	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> 
> -- 
> 2.39.2

-- 
heikki

