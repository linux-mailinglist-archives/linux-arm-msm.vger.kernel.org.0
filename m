Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B6640472D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 10:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhIIIpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 04:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:52758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231234AbhIIIpU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 04:45:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E774D61139;
        Thu,  9 Sep 2021 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631177051;
        bh=acGBQa9Px7pi52Qs5ue6YEKLuAQ3A+4r/89NWjnto9Q=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=vO64dcmx/GAAurjD0cV+plDkKchEKOvK3Sv1kicTuhpgMWL8dOTiuDny/5mOVsZ02
         qDtS1xaVSqqex7yVqmEbU1FWP3PjLbcybJ6jb5NjCZMG7N1bvOUc2SdlkKu4KMpVWu
         43v8nqpr0geIOI7+YPJtfVHjn7iFtTX03Z2WsEabh/aENSabjVOVFs+K/d4tL544II
         yn1AXoHTDN3gzx+AMbVVBO5ZeYJYRhcCKoRXjv1i4b+pXQe6Y1E4plmXgS5oMmjtHg
         nMB4Cr0zB1G3IOOxHh45+nCBmP9IGY/1GF9Mad634oeplVYe5hPEIMOGl8hKKKbzcn
         8LzgU6R/dUR4w==
References: <20210909083120.15350-1-jackp@codeaurora.org>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Date:   Thu, 09 Sep 2021 11:41:38 +0300
In-reply-to: <20210909083120.15350-1-jackp@codeaurora.org>
Message-ID: <87fsueb0ko.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Jack Pham <jackp@codeaurora.org> writes:

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
> This is easily fixed by bailing out of dwc3_gadget_resize_tx_fifos()
> if an endpoint is already resized, avoiding the calculation error
> resulting from accumulating the EP's FIFO depth repeatedly.
>
> Fixes: 9f607a309fbe9 ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirements")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/dwc3/gadget.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 804b50548163..c647c76d7361 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -747,6 +747,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>  		return 0;
>  
> +	/* bail if already resized */
> +	if (dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1)))
> +		return 0;
> +

heh, not to say "I told you so", but...

That being said, your test is not very good. The whole idea for resizing
the FIFOs is that in some applications we only use e.g. 2 endpoints and
there is considerable FIFO space left unused.

The goal is to use that unused FIFO space to squeeze more throughput out
of the pipe, since it amortizes SW latency.

This patch is essentially the same as reverting the original commit :-)

-- 
balbi
