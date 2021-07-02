Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261B83B9BBE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 07:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbhGBFCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 01:02:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:34454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhGBFCx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 01:02:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FDE761413;
        Fri,  2 Jul 2021 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625202021;
        bh=t2qyD3sHMTfsanlf2Ca59gxsFV/p6nqhM45H10N8ELk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b3QQh4ifIgFmVEXnr7OSqfOiwNHzkC/Xi88eZ/6PTSL2q772nrfTuoTDMBm05+V0S
         vjCD6yzn+HkvR52h4crxuS4xguYAC3JlA8Ul1srpDZbWFBXiwkRNOi6stY0E/Onlww
         fZCfr1vMcOqq1iu7Jb6XuqBjelUVRKDQ7vo5NiVA=
Date:   Fri, 2 Jul 2021 07:00:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        fntoth@gmail.com
Subject: Re: [PATCH v11 1/5] usb: gadget: udc: core: Introduce check_config
 to verify USB configuration
Message-ID: <YN6dY8RBXRN4BW3n@kroah.com>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
 <1625043642-29822-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625043642-29822-2-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 02:00:38AM -0700, Wesley Cheng wrote:
> Some UDCs may have constraints on how many high bandwidth endpoints it can
> support in a certain configuration.  This API allows for the composite
> driver to pass down the total number of endpoints to the UDC so it can verify
> it has the required resources to support the configuration.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/udc/core.c | 25 +++++++++++++++++++++++++
>  include/linux/usb/gadget.h    |  4 ++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index b7f0b1e..f1f44a6 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1003,6 +1003,31 @@ int usb_gadget_ep_match_desc(struct usb_gadget *gadget,
>  }
>  EXPORT_SYMBOL_GPL(usb_gadget_ep_match_desc);
>  
> +/**
> + * usb_gadget_check_config - checks if the UDC can support the number of eps

"eps"?  What is that?

> + * @gadget: controller to check the USB configuration
> + * @ep_map: bitmap of endpoints being requested by a USB configuration

There is no such option in this function, did you run 'make htmldocs'
and see that this adds a warning?

> + *
> + * Ensure that a UDC is able to support the number of endpoints within a USB
> + * configuration, and that there are no resource limitations to support all
> + * requested eps.
> + *
> + * Returns zero on success, else a negative errno.
> + */
> +int usb_gadget_check_config(struct usb_gadget *gadget)
> +{
> +	int ret = 0;
> +
> +	if (!gadget->ops->check_config)
> +		goto out;
> +
> +	ret = gadget->ops->check_config(gadget);
> +
> +out:
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(usb_gadget_check_config);

This can be written in the much simpler form:
{
	if (gadget->ops->check_config)
		return gadget->ops->check_config(gadget);
	return 0;
}

But where are the endpoints that need to be checked???

How is this working?

thanks,

greg k-h
