Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBE03BDCD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 20:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhGFSQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 14:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhGFSQI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 14:16:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25A7461C5B;
        Tue,  6 Jul 2021 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625595208;
        bh=bHnAYckIVuxZO/9EYFsl7HYVNOh8BlvdmxqH2jLYj0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wZTv+P/O3sFBTABPV/Ms+tyI3IwjDMuI7vshyy+Ueww8rIBnsrifIQ0R8hzB45qCC
         J7J0kCybSxSpAk2NEbe7NNI56603ce7K82mjHLewVn/bMELGQZl1+eBAvRmOIPXUO/
         OYwAbBYVlOXFP7P5KJ406DlnBUY7idEGPVrZ714k=
Date:   Tue, 6 Jul 2021 20:13:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        robh+dt@kernel.org, frowand.list@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com
Subject: Re: [PATCH v12 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YOSdRKTy3+CdV/UF@kroah.com>
References: <1625218655-14180-1-git-send-email-wcheng@codeaurora.org>
 <1625218655-14180-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625218655-14180-4-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 02, 2021 at 02:37:32AM -0700, Wesley Cheng wrote:
> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
> a larger TX FIFO size results in better TX throughput.
> 
> By introducing the check_config() callback, the resizing logic can fetch
> the maximum number of endpoints used in the USB composition (can contain
> multiple configurations), which helps ensure that the resizing logic can
> fulfill the configuration(s), or return an error to the gadget layer
> otherwise during bind time.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c   |   9 ++
>  drivers/usb/dwc3/core.h   |  15 ++++
>  drivers/usb/dwc3/ep0.c    |   2 +
>  drivers/usb/dwc3/gadget.c | 221 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 247 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index e0a8e79..a7bcdb9d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  	u8			rx_max_burst_prd;
>  	u8			tx_thr_num_pkt_prd;
>  	u8			tx_max_burst_prd;
> +	u8			tx_fifo_resize_max_num;
>  	const char		*usb_psy_name;
>  	int			ret;
>  
> @@ -1282,6 +1283,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  	 */
>  	hird_threshold = 12;
>  
> +	tx_fifo_resize_max_num = 6;
> +

No comment as to why 6 was picked, like the other defaults in this
function?

Why was 6 picked?


>  	dwc->maximum_speed = usb_get_maximum_speed(dev);
>  	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>  	dwc->dr_mode = usb_get_dr_mode(dev);
> @@ -1325,6 +1328,10 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				&tx_thr_num_pkt_prd);
>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>  				&tx_max_burst_prd);
> +	dwc->do_fifo_resize = device_property_read_bool(dev,
> +							"tx-fifo-resize");
> +	device_property_read_u8(dev, "tx-fifo-max-num",
> +				&tx_fifo_resize_max_num);

So you overwrite the "max" with whatever is given to you?  What if
tx-fifo-resize is not enabled?

thanks,

greg k-h
