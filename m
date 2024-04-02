Return-Path: <linux-arm-msm+bounces-16058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25386895082
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 12:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A6AB23940
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 10:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A804CDF9;
	Tue,  2 Apr 2024 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oa+x4i9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0554F897;
	Tue,  2 Apr 2024 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712054417; cv=none; b=lM8t07uBmkNobX5y1rbUlpHdlobePlCByO8fQrOCVZTIuXSfd/btPOhLTWqzTxplakDqgL51RerZk1wgcQ5uwkSachxUv9hjS384gKqmdMiGgNbwZ8cdX4irYzUtB2k+MwjFK+vYR4Lafo3+3SJ2q3V8Zq7rWHdsQXV4mJ6u8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712054417; c=relaxed/simple;
	bh=znHWUavCj46z2XKYldokx9ecmiWhHaeLqUlAqoDEUQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi9RVqUnZ2L9iIJBbWpkOkjzZ0r94uVjmJegGDS5ZU4DfcVWX2ID3Fy2TAgQMVSeC6CYanEynSgjQ7tGkV09hbVvbncCInpch5phTPGJcFDmxaofIk2iTIO7vTtxZI5RQ44+1g7JdPoNXxYpvCkGvs3VEYQaQmdQhPlzGzpUHI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oa+x4i9P; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712054416; x=1743590416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=znHWUavCj46z2XKYldokx9ecmiWhHaeLqUlAqoDEUQw=;
  b=Oa+x4i9PPq872rBr7bYLT3XvhAesQ6SWje28+zvHuT8dZo8RNXA+ijuH
   fJZ8iKaigM5SuwBkU8atGmtl3112f7XtdrCjPexxbLyJ3EKE+qfU1kS5v
   w8BBAsAcsIq1vAFhBgKGNnjt/IOE23+KF6bQvQFZYX/eZOIbUtcaFfBOr
   xXXWOIsOQjcNBZHhL3BsxWxJilLoSaTgYI0Y1NUmkHOBDmUtOz63bA0VN
   xtC9ERl3KFQgDuZMhjMKoQmp+XPDMWcColc29vCI3O7805f5Kq3IYTwj/
   +7xMt1hzUjbt68R9dJK8o86IiV5OeDoarSnBr2TtIcR8HISTudDtHAdz2
   Q==;
X-CSE-ConnectionGUID: 4HsBUxDFQwaX422FnzJ4EQ==
X-CSE-MsgGUID: 5Cdc5OMCShC9lKm7y9jGjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7085669"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7085669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083296"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083296"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Apr 2024 03:40:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Apr 2024 13:40:11 +0300
Date: Tue, 2 Apr 2024 13:40:11 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 05/11] usb: typec: ucsi: simplify partner's PD caps
 registration
Message-ID: <Zgvgi2yC5P9XaIZa@kuha.fi.intel.com>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
 <20240329-qcom-ucsi-fixes-v2-5-0f5d37ed04db@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-5-0f5d37ed04db@linaro.org>

On Fri, Mar 29, 2024 at 08:15:37AM +0200, Dmitry Baryshkov wrote:
> In a way similar to the previous commit, move
> typec_partner_set_usb_power_delivery() to be called after reading the PD
> caps. This also removes calls to
> usb_power_delivery_unregister_capabilities() from the error path. Keep
> all capabilities registered until they are cleared by
> ucsi_unregister_partner_pdos().
> 
> Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d1a45ce7f660..35366b1a3d78 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -826,12 +826,6 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  			return PTR_ERR(cap);
>  
>  		con->partner_source_caps = cap;
> -
> -		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
> -		if (ret) {
> -			usb_power_delivery_unregister_capabilities(con->partner_source_caps);
> -			return ret;
> -		}
>  	}
>  
>  	ret = ucsi_get_pdos(con, TYPEC_SINK, 1, caps.pdo);
> @@ -846,15 +840,9 @@ static int ucsi_register_partner_pdos(struct ucsi_connector *con)
>  			return PTR_ERR(cap);
>  
>  		con->partner_sink_caps = cap;
> -
> -		ret = typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
> -		if (ret) {
> -			usb_power_delivery_unregister_capabilities(con->partner_sink_caps);
> -			return ret;
> -		}
>  	}
>  
> -	return 0;
> +	return typec_partner_set_usb_power_delivery(con->partner, con->partner_pd);
>  }
>  
>  static void ucsi_unregister_partner_pdos(struct ucsi_connector *con)
> 
> -- 
> 2.39.2

-- 
heikki

