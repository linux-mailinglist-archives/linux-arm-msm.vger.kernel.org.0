Return-Path: <linux-arm-msm+bounces-14372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E57787E79B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 11:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DF4C1C20B77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116522E644;
	Mon, 18 Mar 2024 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6y+INGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFE2C692;
	Mon, 18 Mar 2024 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710758752; cv=none; b=FAJaghRNyku7YSZhRagY88jvBwglTcJhPM1R9k/oo04KOcL3VaO8EAOFT1wrTCcPZPGx3StUMnSsnUHuOKfG9KxcV4+p15Uq+snPMfflGMYIjC9WVbnNcCQzZ6xkBOXhYNGofsAUlft29QgSU/16C4U9bSwZeq/ApBz0sAZBGEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710758752; c=relaxed/simple;
	bh=6kcj0I9x1ewLpfmceSJ7fV7br+JSh1oxnvdA1DXTuvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGU8fR+DA1oSzspNjZTAU/4bKpniMGv1JXbyzHxENrGPPj8bcFeKgNCjOBMnx8aoSMKVqNpL37+6Tt94+4xB2jM8sepn/pqlizY9YrJpsum5NnmZTt/p5Cl594r+8od77sbB7CuSgDMgm/1GiaTw5H6ReS5qSV4nM3Xu4FKEAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6y+INGf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710758750; x=1742294750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6kcj0I9x1ewLpfmceSJ7fV7br+JSh1oxnvdA1DXTuvs=;
  b=N6y+INGf8FLppYZL/r+m27aofpNr4mS7qnt2vrqow0WcF6B4og3frIUB
   91Bf8aAePUhU7C+0Twf3jqZokGQzj1EWecMDkkN1shRojtuom6dHSJGru
   BZDe9bwUTeuCeDsJUKn3hix3SoDHWwBUCZYxBw1sSF/78G9iwP4nG1RG+
   +xW2oUVpyZkizbDBhw1K/4/yYJHIx/8Ln+T7wLKtJmAmXSvntQIRU0IlT
   Qv6dr/R4lKiTm7o3N+k0dca6NczqtPw8WguFpD7lJvvypIKrDtv9QWJYe
   3i4DzcZvfxu81j3v7r5HHlsiBMSUKXVuY/o2T30vko8YQ9tGUDvNl1TSg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5688395"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5688395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 03:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="937060145"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="937060145"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 18 Mar 2024 03:45:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Mar 2024 12:45:45 +0200
Date: Mon, 18 Mar 2024 12:45:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: typec: ucsi: acknowledge the
 UCSI_CCI_NOT_SUPPORTED
Message-ID: <ZfgbWVLY3F3ke8h3@kuha.fi.intel.com>
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org>
 <20240313-qcom-ucsi-fixes-v1-2-74d90cb48a00@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313-qcom-ucsi-fixes-v1-2-74d90cb48a00@linaro.org>

On Wed, Mar 13, 2024 at 05:54:12AM +0200, Dmitry Baryshkov wrote:
> When the PPM reports UCSI_CCI_NOT_SUPPORTED for the command, the flag
> remains set and no further commands are allowed to be processed until
> OPM acknowledges failed command completion using ACK_CC_CI. Add missing
> call to ucsi_acknowledge_command().
> 
> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 4abb752c6806..bde4f03b9aa2 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -167,8 +167,10 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
>  	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
>  		return -EIO;
>  
> -	if (cci & UCSI_CCI_NOT_SUPPORTED)
> -		return -EOPNOTSUPP;
> +	if (cci & UCSI_CCI_NOT_SUPPORTED) {
> +		ret = ucsi_acknowledge_command(ucsi);
> +		return ret ? ret : -EOPNOTSUPP;
> +	}
>  
>  	if (cci & UCSI_CCI_ERROR) {
>  		if (cmd == UCSI_GET_ERROR_STATUS)
> 
> -- 
> 2.39.2

-- 
heikki

