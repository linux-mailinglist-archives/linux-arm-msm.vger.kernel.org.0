Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F237AEA51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 12:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjIZK2D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 06:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjIZK2C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 06:28:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB00B3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 03:27:55 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9adb9fa7200so1887172366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695724073; x=1696328873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJCY8Me/FNTd/3Q4t/OHKV9ApYCGDApYXH49P21T41E=;
        b=y2UamL7UyTqHcDgoXFwDJD/dL9+5iptY8ripG7BDhERnhwba5BD6bmmcrKvdzAGwPe
         p3mI+55WQS4yGZyeK4j60aYZTwl7H9AYlmEytwOddI1SaSdx0R0eieg1wPO050kv9K/u
         Exm76J9SBAkjJJvpoqNItlmBm0Vw+WkjU3XGdnafwgKD3ZZlnhirqhYF7k4Rb7SWseUq
         jzYw3GRZyGjjltWDrYwRGy4ipqf52uKsJ7NBPcNaJvfDofxVy6MuxWhvKqhij9rXErOt
         O4Ss5piSUeeSFCqRhKxrSlEV+JP4Y0M6CZ08SvJJ/UmiEwmny+ByMMUBbGJPqALeAx0s
         t93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695724073; x=1696328873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJCY8Me/FNTd/3Q4t/OHKV9ApYCGDApYXH49P21T41E=;
        b=lwOcbwKtfvP1jW/Z3GdxDvO7ga3fjGnZzwAGtTBsSew88Pp4umpfsrqStzwaOk9fcz
         sNlLsGSTHVTucINm1YyrbNH82cFJj2J722ihFGOFm55BkAlTXPkAvONIEuOOYS5srHB9
         xFXXYf8SrfEWY1wyTTr9S9AXF4T21arIFpKuwvAolYT1dE6suYRigVromyCOyBQMz3qw
         ImWb6u5o1wn/2eLv17F2O36ZEiGwFwZhk6oHS2NMI7+qmVigXwrtgcSg6D98nNcO607t
         orlavp/5rKcJ3gMU1cCCzGChmhDZyYdbIMChxPkPdxi/clnv2LO0jJNYqCkx1JRqEFeA
         c3Fg==
X-Gm-Message-State: AOJu0YxTMoyhu19HMrqzk0dFKO9OlEcY+mnWUSEptKx6sDEqycdmdqxc
        zwiQ0Mgh7kwGkE+11L2kvS2cyg==
X-Google-Smtp-Source: AGHT+IEhBfhnsnKLswFK75Zx3YExEbWoBKkgTmp+Z+ndOhuTFxnaoeLiVsYJaeT6i0mA9+tM65UF2Q==
X-Received: by 2002:a17:907:760f:b0:9ad:e0fb:6edf with SMTP id jx15-20020a170907760f00b009ade0fb6edfmr3348436ejc.7.1695724073523;
        Tue, 26 Sep 2023 03:27:53 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id mh2-20020a170906eb8200b00992b2c55c67sm7571754ejb.156.2023.09.26.03.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:27:52 -0700 (PDT)
Message-ID: <90dffe7f-02c1-4965-8d48-1d689abc9323@linaro.org>
Date:   Tue, 26 Sep 2023 11:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] misc: fastrpc: Free DMA handles for RPC calls with no
 arguments
Content-Language: en-US
To:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
References: <1693463029-9311-1-git-send-email-quic_ekangupt@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1693463029-9311-1-git-send-email-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Ekansh for this patch.

few comments below

On 31/08/2023 07:23, Ekansh Gupta wrote:
> The FDs for DMA handles to be freed is updated in fdlist by DSP over

So the dsp is updating the fd list after invoke?


> a remote call. This holds true even for remote calls with no
> arguments. To handle this, get_args and put_args are needed to
> be called for remote calls with no arguments also as fdlist
> is allocated in get_args and FDs updated in fdlist is freed
> in put_args.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 22 +++++++++-------------
>   1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9666d28..e6df66e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1153,11 +1153,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   	if (IS_ERR(ctx))
>   		return PTR_ERR(ctx);
>   
> -	if (ctx->nscalars) {

Why do we need to remove this check?
fastrpc_internal_invoke will have nscalars set before calling. and we 
are not dealing with fdlist in fastrpc_get_args(), so am not sure what 
this change is helping with.


> -		err = fastrpc_get_args(kernel, ctx);
> -		if (err)
> -			goto bail;
> -	}
> +	err = fastrpc_get_args(kernel, ctx);
> +	if (err)
> +		goto bail;
>   
>   	/* make sure that all CPU memory writes are seen by DSP */
>   	dma_wmb();
> @@ -1181,14 +1179,12 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>   	if (err)
>   		goto bail;
>   
> -	if (ctx->nscalars) {
> -		/* make sure that all memory writes by DSP are seen by CPU */
> -		dma_rmb();
> -		/* populate all the output buffers with results */
> -		err = fastrpc_put_args(ctx, kernel);
> -		if (err)
> -			goto bail;
> -	}
> +	/* make sure that all memory writes by DSP are seen by CPU */
> +	dma_rmb();
> +	/* populate all the output buffers with results */

A comment about fdlist here would be really useful

> +	err = fastrpc_put_args(ctx, kernel);
> +	if (err)
> +		goto bail;
>   
>   bail:
>   	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
