Return-Path: <linux-arm-msm+bounces-36544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247A89B7923
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 11:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1351F21420
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 10:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F77199E93;
	Thu, 31 Oct 2024 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIdPDcS9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951D51494AB;
	Thu, 31 Oct 2024 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730372169; cv=none; b=fyrKlSVS63SEMt76B8JD4e4pf1sjzvmjBcqwbsk1RxXhizC2avMuzuAUOT1T/IeKILZ35ps8QVgZDj4/hiHQCbhkwxR8EU3mLlAOp3quEkDUzV/gJ/dDhidFgI1fBceByaF1XZXn9oOIh1LHkN1UenvYx6ZNky7lkft3qcrECws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730372169; c=relaxed/simple;
	bh=MA12dVLrm+VqZ/ae3pjPtbILpAB3JA5KVkEPvjBUlMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMbuCce4qWU7loVzqY2i7VRCjCWRbH+V5Qt7k0tmns+PozY3AnnrFVVsND4T26q1XpmsrhZgja3oFX88cigTLxfbP+deWRMD4bPTJ76DeCEFStwntf740SMvbbyWa49dDwJAFxhFM2sHxQJn1DfquEG83TsH2APM/uLDU1ngBx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIdPDcS9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730372167; x=1761908167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MA12dVLrm+VqZ/ae3pjPtbILpAB3JA5KVkEPvjBUlMY=;
  b=lIdPDcS9U3VcNuj2INuN98I0Zj0S9aqku5ZeZFML+CpD5KVl69X+DLle
   7VyzzK8W+wwJoAaZEK1R/PzLMwxrUGPmrFc+ct91oPq/bwWrgQQo6IKO8
   oz92BKwaM1tkmY/qAZv6RN7o8rY3PC306Kabs9K6Vxb3sghBP6AsYNMUc
   uP6lAd7QxLvqSZGSPCTVVnZliQdVJTkkRjANWz+LMZcEkiQRYPPhJCZkB
   KZnSTof/03PLR1agf7h5S4+dVvBwz7yzSBgGjCLu71hBl8Oigh4ktiMLj
   Ffla2qxNTTeUe1MAhKk75VPI7rJQacO1yU5Ll0/32XMgzdPSvAn0UPBmI
   Q==;
X-CSE-ConnectionGUID: 9Tf0XJjERCGaxilXzrvqnQ==
X-CSE-MsgGUID: Z8SmUm50QraIjaRmjY0Crg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="41473384"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="41473384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 03:56:06 -0700
X-CSE-ConnectionGUID: 0kV5mYYyTy2NRvL6hEOUhw==
X-CSE-MsgGUID: hnSDvds3SZmG+Nxh0hgtLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82245396"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 31 Oct 2024 03:56:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 31 Oct 2024 12:56:01 +0200
Date: Thu, 31 Oct 2024 12:56:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org,
	linux@roeck-us.net, caleb.connolly@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Message-ID: <ZyNiQUKPdUwE8EQZ@kuha.fi.intel.com>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030133632.2116-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030133632.2116-1-rex.nie@jaguarmicro.com>

On Wed, Oct 30, 2024 at 09:36:32PM +0800, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> V2 -> V3:
> - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
> - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
> V1 -> V2:
> - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
> - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 5b7f52b74a40..726423684bae 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>  
>  	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
>  
> +	hdr_len = sizeof(msg->header);
> +	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> +	txsize_len = hdr_len + txbuf_len - 1;
> +
>  	ret = regmap_read(pmic_typec_pdphy->regmap,
>  			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
>  			  &val);
> @@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>  	if (ret)
>  		goto done;
>  
> -	hdr_len = sizeof(msg->header);
> -	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> -	txsize_len = hdr_len + txbuf_len - 1;
> -
>  	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
>  	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
>  				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
> -- 
> 2.17.1

-- 
heikki

