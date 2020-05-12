Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1EC1CEA12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 03:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgELBTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 21:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgELBTp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 21:19:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71226C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 18:19:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id b8so5368233pgi.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 18:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J+bCb9UGvHNvD7qEIMwRcVNw6vMBwgY6JkQ/mVSuXPM=;
        b=HHqbvgKE9OIBcQWiFwjmooBzTRVr5rJdSlqi/dH/f6DdlO22lNY75Z2r10ThMDJhs9
         Jrd6InioiHaAREuFIPzLrxqjpUelM8+57DYjKYHjxrjgw2olirDNQxwblbxCjgOhTnLX
         gRLJ0UZ4FH1OnQ1W8KcqNLXVWwz5VdhnE7MG4HjnvOXqHTgHpGsXuwhJ0Ooj4NM1Gmxy
         M/9cfOXLm5rimArXEMhTz/7f89FAc4WlVY1770AEBjyHsjCLA4rYbhUh3d2Pw+Jn/kSl
         uvPAV7EA6trOUARRVMtS6oraOJP57txdOOJTRW7Wyz/MONex3wKL1oFT811xK7jRL7Cu
         pEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J+bCb9UGvHNvD7qEIMwRcVNw6vMBwgY6JkQ/mVSuXPM=;
        b=hbLlYC5rwRH7wXxtVJzshkS5c1IVjNAlYYnqpGVyKYymMZnsjh3QkAvaZuGTftNYxX
         MDsLWNfCe+YAxv6w3ey2Xp9IHgH4MzXPZtfXePA5NvwdM7RbEukSfhsearBDZbaZrQao
         muOkPPrBxx8WhFh5WWYi53P3e4KMu5afntyE+tNdwzhaj9pWn2mJ4k77naZjL6RCBGi2
         zhTJYKJ0f6oM9a4EQ6GpUk/LQAMOUSCTx1kV48nAbkl4l+2zLQv8Qfy9ir9JbbJSMQX7
         AniHgzlbF6R+h7Ix08hBGyZT3IEUZdIjNozEZfdiqbWp/glNy3zb/oXSCfY9cOCbMKHO
         RJ1w==
X-Gm-Message-State: AGi0PuZkCVuggTkBEoecGQnzUvdq4IAPkNM6gYPt9duKj+6EiKgrLzQw
        5kyWYIh8G6R7YbmtzSQCXqcElA==
X-Google-Smtp-Source: APiQypI6vF9W57VGlLu6vZbyvBXckZs7IElIfyCYJHoEnb/eefz7Izvsiz/uSm30JBD7JaJnH/Faqg==
X-Received: by 2002:a63:5955:: with SMTP id j21mr17671913pgm.70.1589246384684;
        Mon, 11 May 2020 18:19:44 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p24sm10207951pff.92.2020.05.11.18.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:19:44 -0700 (PDT)
Date:   Mon, 11 May 2020 18:18:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] misc: fastrpc: fix potential fastrpc_invoke_ctx leak
Message-ID: <20200512011810.GB57962@builder.lan>
References: <20200511162927.2843-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511162927.2843-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 May 09:29 PDT 2020, Srinivas Kandagatla wrote:

> fastrpc_invoke_ctx can have refcount of 2 in error path where
> rpmsg_send() fails to send invoke message. decrement the refcount
> properly in the error path to fix this leak.
> 
> This also fixes below static checker warning:
> 
> drivers/misc/fastrpc.c:990 fastrpc_internal_invoke()
> warn: 'ctx->refcount.refcount.ref.counter' not decremented on lines: 990.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9065d3e71ff7..07065728e39f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -949,8 +949,10 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	dma_wmb();
>  	/* Send invoke buffer to remote dsp */
>  	err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
> -	if (err)
> +	if (err) {
> +		fastrpc_context_put(ctx);

So we refcount ctx once for the invoke function and once between send
and callback. And this fastrpc_context_put() would counter the fact that
rpmsg_send() failed, so we will not get the "remote's" put().

I think that if you moved this call inside fastrpc_invoke_send() it's
relationship to the failing rpmsg_send() would be obvious.

Regards,
Bjorn

>  		goto bail;
> +	}
>  
>  	if (kernel) {
>  		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -- 
> 2.21.0
> 
