Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5111D5B37AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 14:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiIIMWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 08:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiIIMWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 08:22:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9025F9FCC
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 05:20:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m15so2347230lfl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=A1qsI4DLoWoDP7E38xJHLQcit/SP9ViUibXe/QW8M14=;
        b=sIg0W5ttREu5Bj9Pdz59v6EkdmSk4P1PvvLpMJkS4amVB9+fzodJTCxh7LdAbV3/xX
         goN8fJ1kuis11jtqIMXC99aiUWgD5n2kINRILlpyhwL4AJ5UO1z2h1TWzqTy8YWLwG9h
         047BXqJFLVLDNq5w9Gh1Tfra7dWySEiYgnyRX4GgK5CJJ7ALBECfHNfsTLMzy0gFk6cX
         EtsnowKE6G39850NqUzCLsN/yoO+CD03d6zhDYMwUN0lscjl7zm//mB9WauDYSmonjeY
         jw8sFfKQEi9rhXsSDUrJqIcFbatGMYzW/mASur49FOnem/NuWJzWh+NRvYjt/yPGQDKw
         5oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A1qsI4DLoWoDP7E38xJHLQcit/SP9ViUibXe/QW8M14=;
        b=1t+Gx2TeTG3d2KpffPya1gcDQtNV8p05F4xFbvJ0m6vt26RFNhHnTBrEmAdT6iS4xY
         IVM2WprQ2uJ98sbM1cjaDXKjvyDfBFTR+WSoVHC0YTU/aNT48G5TRzPHxKw9gJR3BJM0
         2/uKvRlsXOnAgqocMZt54gRHz5VrJvTogQIyuXPkJQ/BGZ9JldARM2izZI8W3oxYRrYM
         vcLBJEgZON5sy8gyrcAL/Q6Be2Wd00q8+fCuCmmPY1pZYtZTTex+rmHKN7yaH+gzo+VX
         +TccLyu4pXUM2yxULPhDX8iKLhTjbfm2jCYTkGpfGhDalby5O0WbX6kUVJcrF7z4aWC5
         4sCw==
X-Gm-Message-State: ACgBeo3mGwyYd38sL41GavqUU5zJ/2BvmZ7G6Cq3GfWYXJ34B7xEg8k6
        Veg34PQs6xY+tGlY+7qP/Om5qg==
X-Google-Smtp-Source: AA6agR5cR67YHqywttR/j+f0+aLlTRPlg/ab/xIabDMaTZetnnUrTCKw/4OCxXliTYZ7uwthZ4M56w==
X-Received: by 2002:a05:6512:5d1:b0:494:6ece:f86 with SMTP id o17-20020a05651205d100b004946ece0f86mr4697660lfo.119.1662726052964;
        Fri, 09 Sep 2022 05:20:52 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id b8-20020a0565120b8800b0049490b3bb46sm68511lfv.36.2022.09.09.05.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 05:20:52 -0700 (PDT)
Message-ID: <28d34ce5-ed7c-e8b0-a6e7-a68fd6b2d6b0@linaro.org>
Date:   Fri, 9 Sep 2022 15:20:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH] media: camss: Clean up received buffers on failed start
 of streaming
Content-Language: en-US
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.too@gmail.com>,
        Robert Foss <robert.foss@linaro.org>
References: <20220704094437.468395-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704094437.468395-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/4/22 12:44, Vladimir Zapolskiy wrote:
> It is required to return the received buffers, if streaming can not be
> started. For instance media_pipeline_start() may fail with EPIPE, if
> a link validation between entities is not passed, and in such a case
> a user gets a kernel warning:
> 
>    WARNING: CPU: 1 PID: 520 at drivers/media/common/videobuf2/videobuf2-core.c:1592 vb2_start_streaming+0xec/0x160
>    <snip>
>    Call trace:
>     vb2_start_streaming+0xec/0x160
>     vb2_core_streamon+0x9c/0x1a0
>     vb2_ioctl_streamon+0x68/0xbc
>     v4l_streamon+0x30/0x3c
>     __video_do_ioctl+0x184/0x3e0
>     video_usercopy+0x37c/0x7b0
>     video_ioctl2+0x24/0x40
>     v4l2_ioctl+0x4c/0x70
> 
> The fix is to correct the error path in video_start_streaming() of camss.
> 
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Gentle ping, it would be great to see this fix on media/fixes for 6.0.

>   drivers/media/platform/qcom/camss/camss-video.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index b5f12ec5c50c..d272ffa02112 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -495,7 +495,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   
>   	ret = media_pipeline_start(&vdev->entity, &video->pipe);
>   	if (ret < 0)
> -		return ret;
> +		goto flush_buffers;
>   
>   	ret = video_check_format(video);
>   	if (ret < 0)
> @@ -524,6 +524,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   error:
>   	media_pipeline_stop(&vdev->entity);
>   
> +flush_buffers:
>   	video->ops->flush_buffers(video, VB2_BUF_STATE_QUEUED);
>   
>   	return ret;

--
Best wishes,
Vladimir
