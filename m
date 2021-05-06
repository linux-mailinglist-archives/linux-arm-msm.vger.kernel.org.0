Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AC337581A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 18:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhEFQDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 12:03:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51534 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235176AbhEFQDk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 12:03:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620316962; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=efE5r/sYkhOAQaMM6Pgo8kSJGlvYpTsZ60hpwNgttKs=; b=t8jJ5vXMZ7kCk1bYdMcNkw/AUMiQpxwZG8nPJkZLAPaFFBAzqsAZ/wEpOuyiryFvxVjw44ON
 5qJfYQWz+RjutGPfZu3zud4syGQRXOnbqDo3QLORg9dKugpVgdFCbbAWcQqhBG4iA+N6rxMy
 cHPhExglUaTE2jOs/GGA+WJkDuo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 609413159a9ff96d956096a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 16:02:29
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB0F4C4323A; Thu,  6 May 2021 16:02:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EE40C433F1;
        Thu,  6 May 2021 16:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5EE40C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 6 May 2021 09:02:22 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Free gadget structure only after
 freeing endpoints
Message-ID: <20210506160222.GA16492@jackp-linux.qualcomm.com>
References: <20210501093055.1468-1-jackp@codeaurora.org>
 <20210501093558.7375-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210501093558.7375-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

I know it may still be early in the merge window but do you have any
feedback for this? We have some internal testers getting hit by this
use-after-free when enabling SLUB_DEBUG or KASAN enabled builds. This
fix resolves the issue in those cases so was hoping for a review soon
so we can eventually queue it up for stable too.

(I sent V2 quickly after V1 but before the kernel bot caught my obvious
blunder on V1.  But I sent V2 as a threaded-reply, so not sure if that
made this get buried in people's inboxes...)

Thanks
Jack

On Sat, May 01, 2021 at 02:35:58AM -0700, Jack Pham wrote:
> As part of commit e81a7018d93a ("usb: dwc3: allocate gadget structure
> dynamically") the dwc3_gadget_release() was added which will free
> the dwc->gadget structure upon the device's removal when
> usb_del_gadget_udc() is called in dwc3_gadget_exit().
> 
> However, simply freeing the gadget results a dangling pointer
> situation: the endpoints created in dwc3_gadget_init_endpoints()
> have their dep->endpoint.ep_list members chained off the list_head
> anchored at dwc->gadget->ep_list.  Thus when dwc->gadget is freed,
> the first dwc3_ep in the list now has a dangling prev pointer and
> likewise for the next pointer of the dwc3_ep at the tail of the list.
> The dwc3_gadget_free_endpoints() that follows will result in a
> use-after-free when it calls list_del().
> 
> This was caught by enabling KASAN and performing a driver unbind.
> The recent commit 568262bf5492 ("usb: dwc3: core: Add shutdown
> callback for dwc3") also exposes this as a panic during shutdown.
> 
> There are a few possibilities to fix this.  One could be to perform
> a list_del() of the gadget->ep_list itself which removes it from
> the rest of the dwc3_ep chain.
> 
> Another approach is what this patch does, by splitting up the
> usb_del_gadget_udc() call into its separate "del" and "put"
> components.  This allows dwc3_gadget_free_endpoints() to be
> called before the gadget is finally freed with usb_put_gadget().
> 
> Fixes: e81a7018d93a ("usb: dwc3: allocate gadget structure dynamically")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: Fix silly typo: usb_del_gadget_put -> usb_put_gadget (brain fart
> when manually recomposing the patch)
> 
>  drivers/usb/dwc3/gadget.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 6eab78f8a1a7..c7e5f5a07f3b 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -4062,8 +4062,9 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>  
>  void dwc3_gadget_exit(struct dwc3 *dwc)
>  {
> -	usb_del_gadget_udc(dwc->gadget);
> +	usb_del_gadget(dwc->gadget);
>  	dwc3_gadget_free_endpoints(dwc);
> +	usb_put_gadget(dwc->gadget);
>  	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,
>  			  dwc->bounce_addr);
>  	kfree(dwc->setup_buf);
> -- 
> 2.24.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
