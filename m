Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFA13AB1F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 13:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhFQLLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 07:11:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229901AbhFQLLU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 07:11:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8096561209;
        Thu, 17 Jun 2021 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623928152;
        bh=84l+h0maKkmzDzigHHjqNqGTeEXAil0QmCCQktMiKnU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OCqCYuFRbPTGiAXnTGZ7lxSgKOK6smXubt5fQQPSGApIFrVXK3YHRVBdyVXyU5Rj1
         Bneu7FbTwGtCoTO/BLJIWQD3VU1GsoyMnbUh8sHc6R/bnpjA1E/knBPkBkKT9mSHRa
         QhQf9p+Am13S5RrOdxGNGHXOseLb1Fqw1ld5CvfQ=
Date:   Thu, 17 Jun 2021 13:09:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 1/6] usb: gadget: udc: core: Introduce check_config
 to verify USB configuration
Message-ID: <YMstVXuwAQm5Cea/@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623923899-16759-2-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 02:58:14AM -0700, Wesley Cheng wrote:
> Some UDCs may have constraints on how many high bandwidth endpoints it can
> support in a certain configuration.  This API allows for the composite
> driver to pass down the total number of endpoints to the UDC so it can verify
> it has the required resources to support the configuration.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/udc/core.c | 25 +++++++++++++++++++++++++
>  include/linux/usb/gadget.h    |  5 +++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index b7f0b1e..e33ae2d 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1003,6 +1003,31 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
>  }
>  EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
>  
> +/**
> + * usb_gadget_check_config - checks if the UDC can support the number of eps
> + * @gadget: controller to check the USB configuration
> + * @ep_map: bitmap of endpoints being requested by a USB configuration

Will a u64 really hold all of the possible endpoints?

Why make it odd like this, why not just provide a list like we do in the
USB core with the structure that USB drivers use?  What can a driver do
with a bitmap only?


thanks,

greg k-h
