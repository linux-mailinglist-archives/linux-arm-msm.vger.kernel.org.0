Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C751CFC2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 19:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELRaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 13:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgELRav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 13:30:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83327C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 10:30:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y9so3067157plk.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uwHdadffELF6O3Ox9C2J9UrmgnS3D4KFbraj16AD0PI=;
        b=fCfpVlpsGcefVpnK833KEICYAiK6PPdm+7Hgo6P4xiIs1AthyUaTes1RRoyWsfR9i5
         H/6RCPsfT3DzDeNiBbY6Y5M9mgBVDL22QcZ2U1CmFm2KueiDUE3vI1FmZH3Q0wlqzrTH
         KrteQlpjsS14+Hx6q5m7GiiE3Y/+TfnARNv+9Oi1R6sCLHD5GtNe3VeJafdqLF/N8ZMX
         wJW3S//w/5fkW/G7lZDeZRXG869TUAMDA97RGg+l3kU9olTViqTFXG//p/uyJdU3qv3T
         ev7rHopoKPWCHVsVEg2TeavP9Ezgo4y8vNDKUTGu007zd733XFthSI9JYj8hX0V01wPv
         mJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uwHdadffELF6O3Ox9C2J9UrmgnS3D4KFbraj16AD0PI=;
        b=Wi0gBWXN88uMqVhpYEWwPtHYEWt/UvmydqCIOwNLXwigKLYIIqgmSNB84VER6gJFAK
         Xho4nuSxzRuw5qCTpb0eEdqXouAQa84HrGijVmNjOYIFwzX7eEYx8kJiVntz0/ZlTyaw
         nzCHnjjmYdCKLVku4udbzZukguLTAzDAYvdK97sWi+XbfAcXQaPWc9q1sEqyku3qJADf
         HGGRzuiw7qVeNYBsdMdJbf2V+2kEdASogX4M5LCfl8za5FCKHyRuWhLtf98J+NGmPkBV
         AL2lt5yR4CVVCr0nHqPSCk/h+cmmufzQCs7viIsPKx/D3uaFKERXfTQ43W75jBjxPXc/
         E8UA==
X-Gm-Message-State: AGi0PuZ9qsp5p6jCFVFrKHF5byV8CS29Xrlc4X1oKI5udbB+Vwu/dhhV
        4F7eutC/DDSoXUfRRe0gYidl9A==
X-Google-Smtp-Source: APiQypJ1naeDJnJozrJ4B9Xp2/Gjh1uEfEb/1H/CK20riED1XpH9FpOX7zFR/K2HUX3er/fBTJ2MNw==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr31396022pjb.190.1589304651035;
        Tue, 12 May 2020 10:30:51 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l15sm13636543pjk.56.2020.05.12.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 10:30:50 -0700 (PDT)
Date:   Tue, 12 May 2020 10:29:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] misc: fastrpc: fix potential fastrpc_invoke_ctx leak
Message-ID: <20200512172917.GG57962@builder.lan>
References: <20200512110930.2550-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512110930.2550-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 May 04:09 PDT 2020, Srinivas Kandagatla wrote:

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

Thanks, that looks better.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes since v1:
> 	moved fastrpc_context_put to fastrpc_invoke_send()
> 
>  drivers/misc/fastrpc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9065d3e71ff7..7939c55daceb 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -904,6 +904,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_user *fl = ctx->fl;
>  	struct fastrpc_msg *msg = &ctx->msg;
> +	int ret;
>  
>  	cctx = fl->cctx;
>  	msg->pid = fl->tgid;
> @@ -919,7 +920,13 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
>  	fastrpc_context_get(ctx);
>  
> -	return rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> +	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> +
> +	if (ret)
> +		fastrpc_context_put(ctx);
> +
> +	return ret;
> +
>  }
>  
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> -- 
> 2.21.0
> 
