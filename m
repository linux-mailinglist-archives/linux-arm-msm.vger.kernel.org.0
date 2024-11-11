Return-Path: <linux-arm-msm+bounces-37456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59B9C3A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 10:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8552D1F22005
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E2916F0D0;
	Mon, 11 Nov 2024 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgZP3a8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758A16C6A1;
	Mon, 11 Nov 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316236; cv=none; b=BbkytG0+fNKgmcRYe6FgqG75MrEvTS1eoZCKReQT2vhHJ860bsHvz96QIDiU2VxWxztaWJVNbqCBOs39SSUBciNYA+sp3BlhaD6qG4Dpitc5DsQhfvPCVRGzO/R20S6dQUgHv/WDzRbwvE5PM/BF1ZxrzEfBS2JfGOVeajypoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316236; c=relaxed/simple;
	bh=o1/gfen9NI6hjZYBmRSoret7R0kHPZnUAbizO7uo+84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDWzIzYc4EkeUsUAVFMgg9K3UcKwWUhpnS+/XD3KxDsuc2oD88wRDMjP1lhAa1OOC5MCimXsCNwdX44QXK58wlJuSJLgeZ3pHbRxsKzP3X8qlH9TRNBWvHuB/pe/CUvFbGfwNJjiRXhqaBS3wxMYd5pnAN6s0B4gjGI4uUvCGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgZP3a8t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731316235; x=1762852235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o1/gfen9NI6hjZYBmRSoret7R0kHPZnUAbizO7uo+84=;
  b=RgZP3a8tAad/gEn1IuQEl86Z1hICym4t9mtSYPfGd+Xqhac1WAjAFu6h
   b4enGdMsxNmwTxDUUcMzg4/GMeY0xKH75taMlfQLLaq+FAV7D2GbB5PEf
   chWS7gkqla0ojDOv+d8WV8AS/eBx/GGSn54YErB04OhiqaEMOQCR2srMS
   LqjFK5vDdjkFdYuCDiqXK6vF59SFXje8TG/9aTi2PBKA5oHBxX5Sqp2UI
   Q1EVs6cGT5voCnAkd56+DA91dG3B0X4/UShb2ld8XHUJOBhOEfFPzzTwC
   yJjqOHJHwZGyre6eTLu2q0Gxe/JTqphXUTfJ1841PfymynSqt8XbEY2kI
   Q==;
X-CSE-ConnectionGUID: VoBhO6ZVTSK/DSvGOny/nw==
X-CSE-MsgGUID: lYa78zUeTL+e6/HKCpG9XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48563946"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48563946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:10:34 -0800
X-CSE-ConnectionGUID: RYvbklKETdCGuCSSTGilkw==
X-CSE-MsgGUID: JgFc1Iq5Sgqt10gTRNkYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86781793"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 11 Nov 2024 01:10:31 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 11 Nov 2024 11:10:29 +0200
Date: Mon, 11 Nov 2024 11:10:29 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Message-ID: <ZzHKBVmpDfiwxeCn@kuha.fi.intel.com>
References: <20241109-ucsi-glue-fixes-v2-0-8b21ff4f9fbe@linaro.org>
 <20241109-ucsi-glue-fixes-v2-2-8b21ff4f9fbe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-ucsi-glue-fixes-v2-2-8b21ff4f9fbe@linaro.org>

On Sat, Nov 09, 2024 at 02:04:15AM +0200, Dmitry Baryshkov wrote:
> Instead of checking if any of the USB-C ports have orientation GPIO and
> thus is orientation-aware, check for the GPIO for the port being
> registered. There are no boards that are affected by this change at this
> moment, so the patch is not marked as a fix, but it might affect other
> boards in future.
> 
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 2e12758000a7d2d62f6e0b273cb29eafa631122c..90948cd6d2972402465a2adaba3e1ed055cf0cfa 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -172,12 +172,12 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
>  static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
>  {
>  	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
> -	int i;
>  
> -	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
> -		if (ucsi->port_orientation[i])
> -			con->typec_cap.orientation_aware = true;
> -	}
> +	if (con->num > PMIC_GLINK_MAX_PORTS ||
> +	    !ucsi->port_orientation[con->num - 1])
> +		return;
> +
> +	con->typec_cap.orientation_aware = true;
>  }
>  
>  static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
> 
> -- 
> 2.39.5

-- 
heikki

