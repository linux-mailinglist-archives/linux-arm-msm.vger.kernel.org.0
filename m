Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44163AB1F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 13:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhFQLJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 07:09:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhFQLJ2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 07:09:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2541861209;
        Thu, 17 Jun 2021 11:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623928040;
        bh=PeGZ1cLj00k0RPgo/UNeh5ota3U/cIizQo1ijpzwC/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Xq1mc3q7DJ5UQnfNr3Zh+Xu8FrlLQWpyAo0fDePKavzGfsEq47TDz33O1zvfkFIp
         bcmgvK4ak4mxsOtOwIjxHjJnCUGo2xDsswdaeWa3o5AFu5Yd6Pqrj9TjdYzzLhczmh
         nZyr0J1A2x+q7Ftcji7YxcPfRKFJzt21PZxam2Po=
Date:   Thu, 17 Jun 2021 13:07:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com
Subject: Re: [PATCH v10 2/6] usb: gadget: configfs: Check USB configuration
 before adding
Message-ID: <YMss5tFFBjokk1k6@kroah.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623923899-16759-3-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 02:58:15AM -0700, Wesley Cheng wrote:
> Ensure that the USB gadget is able to support the configuration being
> added based on the number of endpoints required from all interfaces.  This
> is for accounting for any bandwidth or space limitations.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/configfs.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 15a607c..76b9983 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1374,6 +1374,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>  		struct usb_function *f;
>  		struct usb_function *tmp;
>  		struct gadget_config_name *cn;
> +		unsigned long ep_map = 0;
>  
>  		if (gadget_is_otg(gadget))
>  			c->descriptors = otg_desc;
> @@ -1403,7 +1404,28 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>  				list_add(&f->list, &cfg->func_list);
>  				goto err_purge_funcs;
>  			}
> +			if (f->fs_descriptors) {
> +				struct usb_descriptor_header **d;
> +
> +				d = f->fs_descriptors;
> +				for (; *d; ++d) {

With this check, there really is not a need to check for
f->fs_descriptors above in the if statement, right?

> +					struct usb_endpoint_descriptor *ep;
> +					int addr;
> +
> +					if ((*d)->bDescriptorType != USB_DT_ENDPOINT)
> +						continue;
> +
> +					ep = (struct usb_endpoint_descriptor *)*d;
> +					addr = ((ep->bEndpointAddress & 0x80) >> 3) |
> +						(ep->bEndpointAddress & 0x0f);

Don't we have direction macros for this type of check?

> +					set_bit(addr, &ep_map);
> +				}

What is this loop trying to do?  Please document it as I can not figure
it out at all.

thanks,

greg k-h
