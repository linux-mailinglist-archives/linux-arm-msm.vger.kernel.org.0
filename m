Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076C026B30A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgIOW7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 18:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbgIOPSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:18:44 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D536BC06178A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:18:40 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id c18so3438625qtw.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HppPKgC5RTB1pHQaCQK7PTr1sh6hJlNgeHDMeLxU9Co=;
        b=hPGZKnEYtz6Fi+Z3jak+pMkNRlyIq329o5LzsaYZCDD3GCdidRik0I5wt6pM71S5ov
         r5y7KoS4D2DsDP2erYwWKqZT/rdwO6CwzgFZBsVwDjRaRxrGGK+pxq7Z7aDg5CWlM13g
         cA3SjxpzczmA/D2HH7O1SX7RC76+0bYSbka8HsUpTSs9vS2M0LaBe+jtWg+jsu9hdGSz
         ZT6mVyklkXrw278Gdgl21Ib1+QcVjjQCYSyJP4GU1s+v4Pca8fl+P9B8SUFfhDGbXZNd
         Av/Rn/YIG2Ueyc8m4gMEdkVPNLgAd0mxpBFNpFXvV4ZjxJJnptv5KRgQr8s0gec7Bx1v
         ggCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HppPKgC5RTB1pHQaCQK7PTr1sh6hJlNgeHDMeLxU9Co=;
        b=J2Nu9BkytxhU24mDffkPTqJsyuZdGHzZN+0KA1IhFTs85gXwyKGBGBKcwRVIY/W2O2
         G2C8LQ8dtFOH20Tck+ur3sZflqXn9NhOY29M++DEm5+WknIEtP4qG33bb9o9G9PErCyR
         10LFPERYiGH4rFaRfkkM6jG8sn3X1rZiNoeU+QUJN95aOq2ejZG6dW7qT4cCML1rUMNO
         DWoHqc4d11gHVF4Tl0AWMj4a6IZeUoGdMOtIgP9YE8RvGNz0dIGOALwbSBw6iFFzXSuY
         Amm6zqsYgr7Owc3fn5Kc+xL5hjfDHgCSgNSt7cSgy44jibJhIGVgML62/oAiIXsDOshK
         ztnw==
X-Gm-Message-State: AOAM533WuaaNOwd249ZihMD+KnGlDgPvTi7+z3mGXSzUEy/wDjaY2zVK
        kpGzL33tNDVaOY7g3zz5xv+Ygw==
X-Google-Smtp-Source: ABdhPJwEScs8pyK7BhkglGWQM4EvvVqJqUyNIi8N4BMtIjU88HefmksOthfAZsczpD70V/livF++bg==
X-Received: by 2002:ac8:3ac4:: with SMTP id x62mr6216721qte.279.1600183119936;
        Tue, 15 Sep 2020 08:18:39 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id u55sm18409673qtu.42.2020.09.15.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:18:39 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:18:37 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        rishabhb@codeaurora.org
Subject: Re: [PATCH] remoteproc: Fixup coredump debugfs disable request
Message-ID: <20200915151837.GC478@uller>
References: <20200915073416.20864-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915073416.20864-1-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 07:34 UTC 2020, Sibi Sankar wrote:

> Currently the coredump debugfs entry takes in "disable" to set the
> coredump state to "disabled". Let's just accept the expected state
> instead.
> 

I like this patch, but rather than arguing that it should match the name
of the internal state I think you should either argue that when read you
get "disabled" back or that "disabled" would make it consistent with the
recovery.

Regards,
Bjorn

> Fixes: 3afdc59e43904 ("remoteproc: Add coredump debugfs entry")
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 2e3b3e22e1d01..7ca823f6aa638 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -94,7 +94,7 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  		goto out;
>  	}
>  
> -	if (!strncmp(buf, "disable", count)) {
> +	if (!strncmp(buf, "disabled", count)) {
>  		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
>  	} else if (!strncmp(buf, "inline", count)) {
>  		rproc->dump_conf = RPROC_COREDUMP_INLINE;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
