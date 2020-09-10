Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855A0264467
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgIJKn5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 06:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgIJKnm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 06:43:42 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32562C061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 03:43:41 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q21so5831080edv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2020 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OdGrid5jHArS354agKgp+U0Cw8ArS/XKAuRiv2AvpLY=;
        b=tf+BqZu/Jtz2YykbHq7GkLyTKze9+8Z2KP1rjUrHGv1QNhoncmxSJ3ZRPhwpfthIOs
         /RZ4EI5duiNIFSgDq+NFAt9G9MgWkUU7z5z+Y4y9QcdDrKuqyToWs2zqxhVzsybpEzNo
         B0PVrZhBFQV1CkRr6Et/qI8vEi/hsYtBovj3/Cp30iKZq+yIDhnL8PkLiMIrpgWgy+9c
         eoypGTpaC4aWPTtILxXMMwWrA+42coYYKissX+obmt+GGF0ASwain7i7W6vzA6Xf0ZYr
         BUR25fhq5MwoL39ahMXZzk1KFCP+w+Oqmdke+ifRbkPghEd/cW1iIKiD7+wLKQKGShrn
         hiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OdGrid5jHArS354agKgp+U0Cw8ArS/XKAuRiv2AvpLY=;
        b=KAnMo0ldJUBeJGjLycQ1chY4zSyQVHBuRcUwGgfZ6UtwAYXY3Y9pnW4U8jKWuAMeX/
         Pj+FbuMgWcLJJgWF4DHcxgyUBg1SJkW7wH1qYPLxUYPpmt0wyz31F1icIJglScW6HYom
         cjAqDRDnwkQcbljglO4OTmKHLOJQIWXVfp5/3WECuSoHmJcxesMh8n9gmUxDLVePJxvt
         dtWv6QwVCKlHP3g4AOsSYdjmIXNtZQTF9gc267W3+c7TJ+CMSw8j7Wh3osW9RUKz6hNM
         +X+iEBvXRMewYhxPgTp+CZYXB1tLaSMavPV7HPcM1v393HFIh5JsN1pO60zXDawkHLzf
         eHHw==
X-Gm-Message-State: AOAM533VxPf6MBbQJZKyjQy1YJGbmQoAGqjov8PRrfhjMLiZO0MaXlgF
        V5IpHLgG7/3m/aapjABLL+10QA==
X-Google-Smtp-Source: ABdhPJyj6mdNNT6Yadr/16y9PbAvqa8DY90z443T/c9iIIqLAe5J/eD33GIh7457kbnnOmArf1kv9A==
X-Received: by 2002:aa7:d593:: with SMTP id r19mr8864145edq.331.1599734620543;
        Thu, 10 Sep 2020 03:43:40 -0700 (PDT)
Received: from [192.168.1.8] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id ks21sm6485542ejb.63.2020.09.10.03.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 03:43:39 -0700 (PDT)
Subject: Re: [RESEND 1/3] venus: core: handle race condititon for core ops
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
References: <1596781478-12216-1-git-send-email-mansur@codeaurora.org>
 <1596781478-12216-2-git-send-email-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <de32b19e-c643-54d7-0233-c9fe03d4762a@linaro.org>
Date:   Thu, 10 Sep 2020 13:43:37 +0300
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

I thought more on this issue. I think we have to return error from
hfi_session_init() in the case when the driver is in
system-error-handler. Infact all userspace ioctls must end up with error
while we are in recovery state. What do you think?

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
