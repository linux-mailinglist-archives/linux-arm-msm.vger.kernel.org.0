Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 605D350EBA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 00:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbiDYWYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 18:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343701AbiDYWP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 18:15:58 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006A42FE59
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 15:12:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id t25so28713639lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 15:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CAP7rPZV7Wg1L7ILm1X74Kue+bkQwcGO5HR9HWZTqCQ=;
        b=dJX2cSv/+gKglImH2uFpJEYgjc5+NX9Xd3BuvqhDgGusOPOJFIHWKeRICKBQpPPoSR
         LRWg4erbLAb1L1jmTzVE/ERDXVMvVaMjRvVK7eK25m1tZvgc7xsuVzviLcWRLXb4qJNe
         NncodU0a2RPl7ROmTaSIncvmiSd45Wt4Ukqa56boq0NxluU+2gvngMpLmVhuRptAw847
         xuWUIzDVOKohXpafkUfT2vcFXmK0te0qBVyT91KKUUDbSKU9uqP1ofJgrALW5B6j0/MD
         B0TFCbQWgpjg+K5CtO/iipd/25Fhf9UGPKZNMiNdweZ0IA1QeOLtbn7yj1vNiyXmfHLL
         3RdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CAP7rPZV7Wg1L7ILm1X74Kue+bkQwcGO5HR9HWZTqCQ=;
        b=2J9j+7sSgTRcFGFdp/dUk4K7tcyxnF/qbXLIT3gXj0q1NViT9EcTUMO9v8DIpcDWuo
         1L7MeqFQwhjANxXKusHzE6+t0jcHArNoPdNux1vGkMPfAcRBlidu4mT1k6RJB4cEaO+1
         93G5Dxl/TwzVWnie/2Wx50cJTgagee+OQOeIzNmufvX6lL6pzVxUDH8IZTIDkt2H2OLq
         DBO4OPgnihzuk08IC5P/XObEVJnHNIjbTq+12auIwhkjZxDpM2B/vBOnVbCr6I6v1Uvc
         MAZEkzuTS0adLBmkYvezCubnuF/ZqXXeEfIvuI64ZeglmPlxhsWwEmnDyDz9bY7MWbrq
         Mc+A==
X-Gm-Message-State: AOAM532N2lBDinx2vkyGjkHmC4mFCNvmdJKVAMoR5yIxwpx5JenarWca
        rUqWX5s7I929pqTePfQ/UrtznA==
X-Google-Smtp-Source: ABdhPJwcqBXtXmf+RLDNzHIm9VFcDdg9XbcmIbPJSD5DRm06iD9NfzLea91rV2lpzRSmr+WIJqT1DQ==
X-Received: by 2002:ac2:435a:0:b0:46b:ae5b:83e8 with SMTP id o26-20020ac2435a000000b0046bae5b83e8mr14551244lfl.485.1650924771409;
        Mon, 25 Apr 2022 15:12:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l28-20020a19495c000000b0044a8abcb589sm1536797lfj.186.2022.04.25.15.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 15:12:51 -0700 (PDT)
Message-ID: <e9d7c636-09ba-52f4-5575-a7027f722d20@linaro.org>
Date:   Tue, 26 Apr 2022 01:12:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm: change msm_sched_ops from global to static
Content-Language: en-GB
To:     Tom Rix <trix@redhat.com>, robdclark@gmail.com, sean@poorly.run,
        quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220421131507.1557667-1-trix@redhat.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220421131507.1557667-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2022 16:15, Tom Rix wrote:
> Smatch reports this issue
> msm_ringbuffer.c:43:36: warning: symbol 'msm_sched_ops' was not declared. Should it be static?
> 
> msm_sched_ops is only used in msm_ringbuffer.c so change its
> storage-class specifier to static.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 367a6aaa3a20..66f4ec09ef67 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -40,7 +40,7 @@ static void msm_job_free(struct drm_sched_job *job)
>   	msm_gem_submit_put(submit);
>   }
>   
> -const struct drm_sched_backend_ops msm_sched_ops = {
> +static const struct drm_sched_backend_ops msm_sched_ops = {
>   	.run_job = msm_job_run,
>   	.free_job = msm_job_free
>   };


-- 
With best wishes
Dmitry
