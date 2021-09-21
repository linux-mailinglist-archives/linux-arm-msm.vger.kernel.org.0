Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BE94131DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhIUKlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhIUKlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:22 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B84C0613D9
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 03:39:50 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id v24so72598743eda.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/+FBrtcsk4K3OTBY/mW3qTcwRIsIjzW6KMlTO3HDIHk=;
        b=Kx0n1HsF1VKUFGr5YWnVOdaM8EFzo8u/2vKbkmEjYaHZgqlhxqzkgzIewqfZXUBKpm
         CE0+SqMhuC4qqxSsxN7S3p0xKipxhZz/nnklfZkzH9lzpDGXk4dnbrdPfvySxF3UdZJI
         wnWwxC3xXlqKgTuFMc4JoIrHebC6BtQhN9+wJjxcoQJ2h2YGbsoDouU8M5ma9HbjstsI
         qS+s2t8wGZQ6+vru0cNjtBXwUvD+t7D5REZEl088yuWOUn6M4erqYxcvoN9cOGFggZw4
         4uJzK+jB7N1KFaM7C+btFA6z3Z8rvyVmf1ZE0dTBYnq89KSHABjT5HmxNitNru7ZseoF
         e66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/+FBrtcsk4K3OTBY/mW3qTcwRIsIjzW6KMlTO3HDIHk=;
        b=L/dp6UcMCFtD5lVfQaeHy9u7FP8DWHA4PET9co20ITMyiqSjoE58YDCsd/QkHoRJ4m
         Qb0d3b4QB2F6/dq3iJAqxgzWEDoHR/pyXwJIw9Ag4mB7iPCL83+Z3jqMvkESjfRYjICY
         CG8xxqP8rpy7fzPrzPTf9/33iQqRBIA3hd3MbiwkpAB9IENO4SmLWJ0KFlkDAyyBWYEs
         hjHvA65OkItSfysNbDHDanDK9t7s9HPghTHnwIVctnt/AHVZyEL5HdlLxMuVjoUWIY4n
         yKxksKQtIcMsNAEk+aYRXu32ZmserZobtdtSQVXQiJxTiv1qd042ct/Q68HnHmOOQFmo
         tDRg==
X-Gm-Message-State: AOAM532mkSKWWmaa/WuKIXlfP6t3BtJRZw5IK6qEyUGHh6c6hX0x+mvN
        HVVfvUvzAXKKD0krNV08cyPHSA==
X-Google-Smtp-Source: ABdhPJwqKlnCfTao+ayOa8HbCWSyIfv34U/Doo66U3ohUKi9glJl0p3oKQ2aM+3EiXxXVPaafVoFXQ==
X-Received: by 2002:aa7:d2ce:: with SMTP id k14mr34994454edr.396.1632220789096;
        Tue, 21 Sep 2021 03:39:49 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id b17sm1444162edv.54.2021.09.21.03.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 03:39:48 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: fix improper packet size calculation
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632220527-29547-1-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a7afa46d-0478-34a3-d037-c40aca3445c7@linaro.org>
Date:   Tue, 21 Sep 2021 11:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632220527-29547-1-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeya,

Can you make sure the subject line reflects the patch version that you 
are sending.
In this case it should be "[PATCH v2] misc: fastrpc: fix improper packet 
size calculation"

this will help reviewers and maintainers to differentiate the versions 
of patch.

On 21/09/2021 11:35, Jeya R wrote:
> The buffer list is sorted and this is not being considered while
> calculating packet size. This would lead to improper copy length
> calculation for non-dmaheap buffers which would eventually cause
> sending improper buffers to DSP.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---

Please add changes done from v1 to v2 here.

something like:

Changes from v1:
- bla bla bla..


>   drivers/misc/fastrpc.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610..a7e550f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -719,16 +719,21 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>   static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
>   {
>   	u64 size = 0;
> -	int i;
> +	int oix = 0;

Looks like you missed to address my previous comments.

--srini
>   
>   	size = ALIGN(metalen, FASTRPC_ALIGN);
> -	for (i = 0; i < ctx->nscalars; i++) {
> +	for (oix = 0; oix < ctx->nbufs; oix++) {
> +		int i = ctx->olaps[oix].raix;
> +
> +		if (ctx->args[i].length == 0)
> +			continue;
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
