Return-Path: <linux-arm-msm+bounces-28002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EA9493BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 16:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5571F262EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 14:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454491D54C2;
	Tue,  6 Aug 2024 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSrbaQCG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B871D27A3;
	Tue,  6 Aug 2024 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722955848; cv=none; b=G60XHB6L+i/KV6GpFuf7Dw7vIwgakRaFKWCaj+lXykSaKHkJ8kSh2apoEk2SDjcb1asJo8d+7TNkjmlvGfsSzbSOQAi7qy85Ri1WWiSn1YZh7SaV1lW5yD2MIRKPBrzabinAVL9J4vOCZwezMaY8x5Wu4Nwk7668lOs6Nn1wByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722955848; c=relaxed/simple;
	bh=v/mPmTlATMsw2ACDeJWfLpDxiG/dYbLwP3blTQDlKWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KP6lrsEI4OvexsZYktlxVon0rBjfEQ29yy/7jpusMMefjIgZjj4QKhGlRjmlppmdvcVm4Bu21z0PUBmW6nHcCYo4GgsAemCC8eDmwFxa6NU9inIGNTTLoSfeNlB6pVwTbN0+XRPOaVIBHQ0mwnbhhTswBA6Z4TKMmau+xlIDvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSrbaQCG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722955847; x=1754491847;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v/mPmTlATMsw2ACDeJWfLpDxiG/dYbLwP3blTQDlKWk=;
  b=eSrbaQCGnUMg1oNXm6rmKPf4L+DaomtpMuBsEqmQFY4GTl801UKhAmFS
   vV5EQWPJEP+gYufg6FxsoHNFnXhsEuyrU62/VkhFKv0I1r8tJbHkyvYBE
   RsKbOzlemccg+ZZVi3MP4qZKaZv+bU+2kzgTeWoHVf7tD2xu2Sume/YmV
   /ZFcLYdPdbvkz+zSqyIM8aoLuznw9sx9uVhvAKEX6Ng3aSHzW6uTRBo7/
   GaUPzgWgyUREMQC2Lmjkji8uKN1d3t8WODF/FoukEvLH+nacBRDEFqeBX
   pu5FU7/sODU96EasgHCSMkMOFIKFe4wtDF/k0OkXka739gf2zuZuPStoK
   A==;
X-CSE-ConnectionGUID: +dRknBSETZ2euFFbkuD46Q==
X-CSE-MsgGUID: AMFVhNO5R0mVpt4rIk3uPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21101583"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21101583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:50:45 -0700
X-CSE-ConnectionGUID: 3DaEl9/wTaC9GlczUOLDlA==
X-CSE-MsgGUID: qU5jF+H5Sr6pD6f5BxIjrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87476567"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 07:50:39 -0700
Message-ID: <01bd74da-6f2d-4cea-81d0-06f8dd95b191@linux.intel.com>
Date: Tue, 6 Aug 2024 16:50:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 06/34] usb: host: xhci-mem: Allow for interrupter
 clients to choose specific index
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-7-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240801011730.4797-7-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/1/2024 3:17 AM, Wesley Cheng wrote:
> Some clients may operate only on a specific XHCI interrupter instance.
> Allow for the associated class driver to request for the interrupter that
> it requires.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   drivers/usb/host/xhci-mem.c       | 29 ++++++++++++++++-------------
>   drivers/usb/host/xhci-sideband.c  |  4 ++--
>   drivers/usb/host/xhci.h           |  2 +-
>   include/linux/usb/xhci-sideband.h |  2 +-
>   4 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 60dfc59260d8..997e8f27acb8 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2340,7 +2340,7 @@ xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>   
>   struct xhci_interrupter *
>   xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
> -					u32 imod_interval)
> +					u32 imod_interval, int intr_num)
>   {
>   	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>   	struct xhci_interrupter *ir;
> @@ -2355,29 +2355,32 @@ xhci_create_secondary_interrupter(struct usb_hcd *hcd, unsigned int segs,
>   		return NULL;
>   
>   	spin_lock_irq(&xhci->lock);
> -
>   	/* Find available secondary interrupter, interrupter 0 is reserved for primary */
>   	for (i = 1; i < xhci->max_interrupters; i++) {
> -		if (xhci->interrupters[i] == NULL) {
> -			err = xhci_add_interrupter(xhci, ir, i);
> -			break;
> +		if ((intr_num > 0 && i == intr_num) || intr_num <= 0) {
> +			if (xhci->interrupters[i] == NULL) {
> +				err = xhci_add_interrupter(xhci, ir, i);
> +				if (err) {
> +					spin_unlock_irq(&xhci->lock);
> +					goto free_ir;
> +				}
> +				break;
> +			}
>   		}
>   	}

When intr_num is set, you don't really need to iterate to search for 
free slot, as you already know which one you want to use?

Wouldn't something like:
         /* Find available secondary interrupter, interrupter 0 is 
reserved for primary */
         if (!intr_num) {
                 for (i = 1; i < xhci->max_interrupters; i++) {
                         if (xhci->interrupters[i] == NULL) {
                                 err = xhci_add_interrupter(xhci, ir, i);
                                 break;
                         }
                 }
         } else {
                 if (xhci->interrupters[intr_num] == NULL)
                         err = xhci_add_interrupter(xhci, ir, i);
         }
make more sense, also make intr_num unsigned int, as it should never be 
negative as it is index into a table.

> -
>   	spin_unlock_irq(&xhci->lock);
>   
> -	if (err) {
> -		xhci_warn(xhci, "Failed to add secondary interrupter, max interrupters %d\n",
> -			  xhci->max_interrupters);
> -		xhci_free_interrupter(xhci, ir);
> -		return NULL;
> -	}
> -
>   	xhci_set_interrupter_moderation(ir, imod_interval);
> +
>   	xhci_dbg(xhci, "Add secondary interrupter %d, max interrupters %d\n",
>   		 i, xhci->max_interrupters);
>   
>   	return ir;
> +
> +free_ir:
> +	xhci_free_interrupter(xhci, ir);
> +
> +	return NULL;
>   }
>   EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
>   

(...)


