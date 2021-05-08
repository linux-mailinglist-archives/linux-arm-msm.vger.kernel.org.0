Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C426337700B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 08:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhEHGWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 02:22:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229841AbhEHGWr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 02:22:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23BD061106;
        Sat,  8 May 2021 06:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620454906;
        bh=81OT/9nIob3OkaDECMiKIFL2sZL6lOUhjqb8l38XH5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TtXpx1R6yzjCri7W2uCp6U2lMnWXbsBqA8SHdwFp7moCMMFXnNPjYvWvXgPcnhJpD
         wxJPAMvjmrPFkxA+1/sJ1BxnUrZiSA0Ljmv5TpB5TtLr9YyHtvcyN8REF62m5+bLzm
         YTdwE87nvPLf2Kp7v0hyr2Up44t91O2Fi71oq38lOcrnBUETSxMQ+15KzuMMrRY5xe
         C8ELlxNXYnnUwoCOghlwE8yPvZceIFr87xRzYLdt+tJO/HGLpOzL/jKjNgg0+63nfi
         8mSkkrzJLtQfnZzQDUC4FTRmD1Ya2tJk56TtOL8oLHfwwmMYfshai4eycBDqDpIq76
         z05F67HVSqnjQ==
Date:   Sat, 8 May 2021 14:21:40 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Free gadget structure only after
 freeing endpoints
Message-ID: <20210508062140.GA3159@nchen>
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

On 21-05-01 02:35:58, Jack Pham wrote:
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

Reviewed-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen

