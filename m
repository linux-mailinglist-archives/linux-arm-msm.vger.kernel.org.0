Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C468F435FB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhJUKy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 06:54:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhJUKy0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 06:54:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A931760EE9;
        Thu, 21 Oct 2021 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634813531;
        bh=ju2/G1q9d1NsW6DFlmH3WjqOSsI8ErlJ2aYm/MR0KDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rp/cEbz3k5j+qHt2ta4LiVmNsU8w3jEotL0w2gyQM3aSKE8q1vzDQNFn+Opg4Cedt
         K68UUAqlULtJs4pmK8euYmowvopud7SMSRQ4dnBcVmN2Dl7vDIDcfT2IggS0CUyLvR
         wUxQq29tvzhP2BsVVfyOKCjb66kAQJiGJArDZzZ0=
Date:   Thu, 21 Oct 2021 12:52:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Message-ID: <YXFGWPMmmdyaSOPg@kroah.com>
References: <20211019004123.15987-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019004123.15987-1-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 05:41:23PM -0700, Jack Pham wrote:
> Some functions may dynamically enable and disable their endpoints
> regularly throughout their operation, particularly when Set Interface
> is employed to switch between Alternate Settings.  For instance the
> UAC2 function has its respective endpoints for playback & capture
> associated with AltSetting 1, in which case those endpoints would not
> get enabled until the host activates the AltSetting.  And they
> conversely become disabled when the interfaces' AltSetting 0 is
> chosen.
> 
> With the DWC3 FIFO resizing algorithm recently added, every
> usb_ep_enable() call results in a call to resize that EP's TXFIFO,
> but if the same endpoint is enabled again and again, this incorrectly
> leads to FIFO RAM allocation exhaustion as the mechanism did not
> account for the possibility that endpoints can be re-enabled many
> times.
> 
> Example log splat:
> 
> 	dwc3 a600000.dwc3: Fifosize(3717) > RAM size(3462) ep3in depth:217973127
> 	configfs-gadget gadget: u_audio_start_capture:521 Error!
> 	dwc3 a600000.dwc3: request 000000000be13e18 was not queued to ep3in
> 
> Add another bit DWC3_EP_TXFIFO_RESIZED to dep->flags to keep track of
> whether an EP had already been resized in the current configuration.
> If so, bail out of dwc3_gadget_resize_tx_fifos() to avoid the
> calculation error resulting from accumulating the EP's FIFO depth
> repeatedly.  This flag is retained across multiple ep_disable() and
> ep_enable() calls and is cleared when GTXFIFOSIZn is reset in
> dwc3_gadget_clear_tx_fifos() upon receiving the next Set Config.
> 
> Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: Added explicit flag to dep->flags and check that instead of directly
>     reading the GTXFIFOSIZn register.
> 
>  drivers/usb/dwc3/core.h   | 1 +
>  drivers/usb/dwc3/gadget.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 5612bfdf37da..f033063f6948 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -723,6 +723,7 @@ struct dwc3_ep {
>  #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
>  #define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
>  #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
> +#define DWC3_EP_TXFIFO_RESIZED	BIT(12)

Any specific reason this isn't lined up properly?

thanks,

greg k-h
