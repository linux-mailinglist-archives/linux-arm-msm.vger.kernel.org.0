Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDFF41324E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhIULQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbhIULQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:16:00 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA93C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 04:14:31 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h17so73011935edj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 04:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NP8hGoZ6JRBBSIYOTvYRgk657scZGl3huOEtLkOasG0=;
        b=w4jGQPq1MtVuKVp2mEkWDglDbxJtz+KhUAagf0TN7qJXwtiAm93WdhrT42baQE3JRi
         1UPE6pZNIyXOK+bwYA9p3ZTOqOwbjyzY291mlITCi2nTdpzCSVlUpRhVajKCIc2zODIj
         f5YI9UwAktK3ikx1JuuNk2dL+SwbjqMslk4HF24bEZtyDAdac4pZpFA3HZlp04gejhlG
         Mjdr5FAExQjaWDlozo6sDc4XMOeYRPEd3w9sZZS7ef6DKE2VQsJxNv01lTGASmS5didj
         u4sxhz6RtxpEjD8TQiXCEn3f7TkcqqcXuMIHDToxq+3WHlA2Q8Jt6aoFAb0MAph5kIWh
         6Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NP8hGoZ6JRBBSIYOTvYRgk657scZGl3huOEtLkOasG0=;
        b=dCNLmXtPTL430+zIEY4v6PIij6X7StvXEUX25PM8TEZncA4YiYU+HfrBs+yZFInWgJ
         /1SaXZzUe/3KNxAQYg4mytDq5VUPlcvTglg2GwqX763baab7vhW65EvbLcosWui6Hyir
         XRfHw5V4vqtCtzMSe1aQtNKugBxOPL0pngAfeyrSMO6dlgfKtwj/ECabwUJ9hOXiN59G
         crTnfv2CXBf9y4zfo6x7CwOx3RAvqqX8NKgiq+pPN3sFSBfbsXSRlAy9dodNXCUZLlSv
         hbCpWUft69slsGdVKQKuXZ8fwXFrzLQZtFcVnisbIn6QruBOfwdivguGY4HXuTdg583i
         UKzw==
X-Gm-Message-State: AOAM5322WleRXH0ajkFGMkTR52BKEhs1pThi/rFn8J4qjDlKmVgJwPaK
        UhM/2uLsPnOc1PNmYRFAjdAouA==
X-Google-Smtp-Source: ABdhPJz4b/MquL5mp22kz/jEHcglXRJwqe85B0xTDZy4mlDyl2jb0V9hJJkTNxqtUdwTqGtSVlWWTw==
X-Received: by 2002:aa7:c74c:: with SMTP id c12mr34800313eds.87.1632222870234;
        Tue, 21 Sep 2021 04:14:30 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v25sm7265193eja.83.2021.09.21.04.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 04:14:29 -0700 (PDT)
Subject: Re: [PATCH] [PATCH v2] misc: fastrpc: fix improper packet size
 calculation
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <aa4b9a73-dd70-a3bd-c00f-b632712cbf79@linaro.org>
Date:   Tue, 21 Sep 2021 12:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632221847-987-1-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thank Jeya for fixing, one last nit-pick, Subject line is still broken.
It should be just "[PATCH v2] misc: fastrpc: fix improper packet size 
calculation"

instead of
"[PATCH] [PATCH v2] misc: fastrpc: fix improper packet size calculation"

in this particular case where you are re-sending same version of patch, 
you can use subject line like:

"[RESEND PATCH v2] misc: fastrpc: fix improper packet size calculation"


On 21/09/2021 11:57, Jeya R wrote:
> The buffer list is sorted and this is not being considered while
> calculating packet size. This would lead to improper copy length
> calculation for non-dmaheap buffers which would eventually cause
> sending improper buffers to DSP.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> 

Once that is fixed you can add

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

> Changes in v2:
> - updated commit message to proper format
> - added fixes tag to commit message
> - removed unnecessary variable initialization
> - removed length check during payload calculation
> ---
>   drivers/misc/fastrpc.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610..69d45c4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>   static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
>   {
>   	u64 size = 0;
> -	int i;
> +	int oix;
>   
>   	size = ALIGN(metalen, FASTRPC_ALIGN);
> -	for (i = 0; i < ctx->nscalars; i++) {
> +	for (oix = 0; oix < ctx->nbufs; oix++) {
> +		int i = ctx->olaps[oix].raix;
> +
>   		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1) {
>   
> -			if (ctx->olaps[i].offset == 0)
> +			if (ctx->olaps[oix].offset == 0)
>   				size = ALIGN(size, FASTRPC_ALIGN);
>   
> -			size += (ctx->olaps[i].mend - ctx->olaps[i].mstart);
> +			size += (ctx->olaps[oix].mend - ctx->olaps[oix].mstart);
>   		}
>   	}
>   
> 
