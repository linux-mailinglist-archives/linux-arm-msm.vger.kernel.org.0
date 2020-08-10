Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFF824043D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 11:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgHJJvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 05:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgHJJvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 05:51:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A7CC061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 02:51:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l2so7530311wrc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2020 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wLAOFokMTumfYpsNR+8SVNBDFRnEeROvH0KpvMDc688=;
        b=k+dFKhCh67gRr7m58/fPDWfkNNhbMS48AtVuEWuUaL7GgRIyIEJqcBKh4X4a758b57
         KkxB+nlBkH22LvsGhtwj+9AKExh67WZoahawhyDAkFVD9weSi8e5ZbVcy/eGKq099dNT
         2rPIwd2l1SjoFjVUGdYWaoP+bfcSinZkbNbkr9MR2UhlRe6MyObY5TnVIz63omf1VXEc
         /CiuYs7UqB+sFQ+1RAzS4v8QUgGIqojlO2zYXqpOHhQb4j0xfterod5++UDpWvEyFfu1
         dkN1qnsISdn7dKkCzrj6hspVdZz0ntwatQs9yITSo29sJgxhUIS1t/mceafkgkVnAger
         2xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wLAOFokMTumfYpsNR+8SVNBDFRnEeROvH0KpvMDc688=;
        b=Faf7Uo2ipr/eVJY5ARcotLWCFXe9ijonQ8Cq0JYQg/TmJsjTltrI/Q11cyVLrapuQu
         3r06Zu8Z0oXnZlselUsRsKYno4zpS8MnVrt3/z/uE27i6zkPzwS4D078XsViWZf1ZEPU
         yCwLSD8bmiThJ1RqQw2HY46uBtg0yKOw00rVD1jLps76FnqY38k5UoQ3yD9IpPrxuj/D
         ZohW718UkMxBVGTOrJ5S+urElH5nk4gSDXZEh2NxC5SfOY7vwv5/xrVLGfD//ha8HLX0
         Ha1/u0SR1PdK/IpqvNoNLrCSlVksBaXnNAIan53IHW5iWiHMz0PfgR2cdY295Jk2TYfm
         KyRQ==
X-Gm-Message-State: AOAM5300g1ubY9VUVboWfkKGY1Qh0Uk3dbHR0yfiefLeu9SW6VrArA2Q
        WZ70wju8e3jZMVRpbgXLlxOscxd9e0LCOg==
X-Google-Smtp-Source: ABdhPJzdqkDkrHLo3mdpReSxPT2KGTqpJkwwoKLuu0f/k4VmOMdeq2ugWCPwy81kX9TCb0ZJOxWzMA==
X-Received: by 2002:a5d:5588:: with SMTP id i8mr23947186wrv.177.1597053062045;
        Mon, 10 Aug 2020 02:51:02 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id f6sm2022636wme.32.2020.08.10.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 02:51:01 -0700 (PDT)
Subject: Re: [RESEND 1/3] venus: core: handle race condititon for core ops
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <dc1f37ed-3786-5bb2-3763-368b0165478b@linaro.org>
Date:   Mon, 10 Aug 2020 12:50:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mansur,

Thanks for the patches!

On 8/7/20 9:24 AM, Mansur Alisha Shaik wrote:
> For core ops we are having only write protect but there
> is no read protect, because of this in multthreading
> and concurrency, one CPU core is reading without wait
> which is causing the NULL pointer dereferece crash.
> 
> one such scenario is as show below, where in one
> core core->ops becoming NULL and in another core
> calling core->ops->session_init().
> 
> CPU: core-7:
> Call trace:
>  hfi_session_init+0x180/0x1dc [venus_core]
>  vdec_queue_setup+0x9c/0x364 [venus_dec]
>  vb2_core_reqbufs+0x1e4/0x368 [videobuf2_common]
>  vb2_reqbufs+0x4c/0x64 [videobuf2_v4l2]
>  v4l2_m2m_reqbufs+0x50/0x84 [v4l2_mem2mem]
>  v4l2_m2m_ioctl_reqbufs+0x2c/0x38 [v4l2_mem2mem]
>  v4l_reqbufs+0x4c/0x5c
> __video_do_ioctl+0x2b0/0x39c
> 
> CPU: core-0:
> Call trace:
>  venus_shutdown+0x98/0xfc [venus_core]
>  venus_sys_error_handler+0x64/0x148 [venus_core]
>  process_one_work+0x210/0x3d0
>  worker_thread+0x248/0x3f4
>  kthread+0x11c/0x12c
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 +-
>  drivers/media/platform/qcom/venus/hfi.c  | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c653..fe99c83 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -64,8 +64,8 @@ static void venus_sys_error_handler(struct work_struct *work)
>  	pm_runtime_get_sync(core->dev);
>  
>  	hfi_core_deinit(core, true);
> -	hfi_destroy(core);
>  	mutex_lock(&core->lock);
> +	hfi_destroy(core);

As my recovery fixes [1] touches this part also, could you please apply
them on top of yours and re-test?

Otherwise this patch looks good to me.

[1] https://www.spinics.net/lists/linux-arm-msm/msg70092.html

>  	venus_shutdown(core);
>  
>  	pm_runtime_put_sync(core->dev);
> diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
> index a211eb9..2eeb31f 100644
> --- a/drivers/media/platform/qcom/venus/hfi.c
> +++ b/drivers/media/platform/qcom/venus/hfi.c
> @@ -195,7 +195,7 @@ EXPORT_SYMBOL_GPL(hfi_session_create);
>  int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>  {
>  	struct venus_core *core = inst->core;
> -	const struct hfi_ops *ops = core->ops;
> +	const struct hfi_ops *ops;
>  	int ret;
>  
>  	if (inst->state != INST_UNINIT)
> @@ -204,10 +204,13 @@ int hfi_session_init(struct venus_inst *inst, u32 pixfmt)
>  	inst->hfi_codec = to_codec_type(pixfmt);
>  	reinit_completion(&inst->done);
>  
> +	mutex_lock(&core->lock);
> +	ops = core->ops;
>  	ret = ops->session_init(inst, inst->session_type, inst->hfi_codec);
>  	if (ret)
>  		return ret;
>  
> +	mutex_unlock(&core->lock);
>  	ret = wait_session_msg(inst);
>  	if (ret)
>  		return ret;
> 

-- 
regards,
Stan
