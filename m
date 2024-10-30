Return-Path: <linux-arm-msm+bounces-36383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B47689B5E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64764B21856
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 08:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1821E0E0E;
	Wed, 30 Oct 2024 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS4srn9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EB14F90;
	Wed, 30 Oct 2024 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730277560; cv=none; b=s1kXYnJCbwhekvS+C6nNYluNw4SB8cTCpndklaUitPDcF1pBcpk1Vg1c5X3qvhXJ5tylwb5MLuC+g6Wikb6EhNjCj1onAnzShTYfLYvnqXxZr2D0zIQ6dCy63IxR++qwqc8mg1skL4qU+wPQnwpOeWvGPN41qOYKSwAtKxv8AwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730277560; c=relaxed/simple;
	bh=iDjNKUS8pWojbxvVdBXeM9KYPv39A21uCXdrEPFlX20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLYv9+QTJuN6l9K0Vgej0EdFxqwF+FDoGCchzFmUfl3igXeIeUhiagIuVFX61CefVm5jpQk8vjfUgcek6OjjpTpeYmZ6VS2p2bxtAbkqzPuT2++2HPV6zLtmG2Ntk5VGXJQxXKyvRLy7+XHMGnIKQoFVwolFUYEMa6PS3JKjE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS4srn9g; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730277558; x=1761813558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iDjNKUS8pWojbxvVdBXeM9KYPv39A21uCXdrEPFlX20=;
  b=jS4srn9gbOXWVw9tqIj1y4mzyfcp++dCrRnMR64VN8pQQ6G+MD09Snm3
   CNdmaRW5AiSPcHk2dW7NJTJfwNrpZqVzx+d9Whd8S2yGGM0xF4sD8/QkI
   uT3VUMoy0oEaApbAaCi0bZBRySw8EmKvMdTHkQuogiQboD+0MWjkmbCC/
   o/UJaWZ6s06E2g6iKIrE03hcUp2wrs1PMVd/XhScUliUyBol8N8gvHX4y
   YWT2hWz35ZjAmhrv2NWLXpoYkGjIaWz6O8WgBwSk4a6MK77xcR4FObZYM
   tPLgY2h/tEQ3TmuuX0oH47MZ9EvNVb7KHwPKqTrKeS5+uEC/bfeOzsjkc
   g==;
X-CSE-ConnectionGUID: Kfnx4bITScKMCk3KOv5tSg==
X-CSE-MsgGUID: ntCu6FjUT8adsQVuUe2tbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30070189"
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="30070189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 01:39:17 -0700
X-CSE-ConnectionGUID: oJ8qcQaoTvicu0jsUpGCnQ==
X-CSE-MsgGUID: ++0oQ/M6RyeCO3qZzGGQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="113091613"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa001.fm.intel.com with SMTP; 30 Oct 2024 01:39:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 30 Oct 2024 10:39:14 +0200
Date: Wed, 30 Oct 2024 10:39:13 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Subject: Re: [PATCH v2] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Message-ID: <ZyHwscXdDl-ui7CK@kuha.fi.intel.com>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
 <20241030022753.2045-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030022753.2045-1-rex.nie@jaguarmicro.com>

Hi,

On Wed, Oct 30, 2024 at 10:27:54AM +0800, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---

You need to include a changelog also for the patch itself here, after
that "---" separator. This patch is also still missing the Fixes tag.

You can read more about how to send the patches from the documentation:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

So please send v3 with those fixed. Don't forget to Cc the stable ml.:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch

thanks,

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

