Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F684369E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 20:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUSDA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 14:03:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11837 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhJUSC7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 14:02:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634839243; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=1eci9Z1I5VRE2Z8WUFuVXPk1OoCLHEo1YOgPNQMpOh8=; b=KL3mMREyqiUrPCbYJnoe4GBHApfovie9THhn0TMKdOTPRa/XZMB2BskFqO4xxanyzRym88a/
 r5C9W3HrcCZ4q2VMmO0km+wdLLxxQLxNlMiU0FMohdiQBVIUrn2/Fyc+k8JtKSUi1IJ/Hr3n
 BxL+V3Zc64uBwKogG5YZlQjzeh0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6171aab467f107c61113823a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 18:00:20
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CA8BC43616; Thu, 21 Oct 2021 18:00:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A97C6C4338F;
        Thu, 21 Oct 2021 18:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A97C6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 21 Oct 2021 11:00:15 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: dwc3: gadget: Skip resizing EP's TX FIFO if
 already resized
Message-ID: <20211021180015.GB2357@jackp-linux.qualcomm.com>
References: <20211021175807.23826-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021175807.23826-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry, disregard this. Forgot to update the patch subject with V3.

Resending...

On Thu, Oct 21, 2021 at 10:58:06AM -0700, Jack Pham wrote:
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
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v3: Fixed macro definition alignment; added Thinh's reviewed-by.
> 
> v2: Added explicit flag to dep->flags and check that instead of directly
>     reading the GTXFIFOSIZn register.
> 
>  drivers/usb/dwc3/core.h   | 1 +
>  drivers/usb/dwc3/gadget.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 5612bfdf37da..0c100901a784 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -723,6 +723,7 @@ struct dwc3_ep {
>  #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
>  #define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
>  #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
> +#define DWC3_EP_TXFIFO_RESIZED		BIT(12)
>  
>  	/* This last one is specific to EP0 */
>  #define DWC3_EP0_DIR_IN		BIT(31)
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 4519d06c9ca2..ed97e47d3261 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -702,6 +702,7 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>  				   DWC31_GTXFIFOSIZ_TXFRAMNUM;
>  
>  		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
> +		dep->flags &= ~DWC3_EP_TXFIFO_RESIZED;
>  	}
>  	dwc->num_ep_resized = 0;
>  }
> @@ -747,6 +748,10 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>  	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>  		return 0;
>  
> +	/* bail if already resized */
> +	if (dep->flags & DWC3_EP_TXFIFO_RESIZED)
> +		return 0;
> +
>  	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>  
>  	if ((dep->endpoint.maxburst > 1 &&
> @@ -807,6 +812,7 @@ static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>  	}
>  
>  	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
> +	dep->flags |= DWC3_EP_TXFIFO_RESIZED;
>  	dwc->num_ep_resized++;
>  
>  	return 0;
> @@ -995,7 +1001,7 @@ static int __dwc3_gadget_ep_disable(struct dwc3_ep *dep)
>  
>  	dep->stream_capable = false;
>  	dep->type = 0;
> -	dep->flags = 0;
> +	dep->flags &= DWC3_EP_TXFIFO_RESIZED;
>  
>  	return 0;
>  }
> -- 
> 2.24.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
