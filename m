Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123105B211D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbiIHOsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbiIHOr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:47:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F323C9F8EC
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:47:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bt10so28135987lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
        b=OVR1cCbGJE072hGoQUQmFQJ+kprUmprVLEtmSadFZzpbbM7QbSvFvlCIfSqryPYi1+
         SD1skqQd1QH52qTt6B1S/BsqHmuHjpZH9S8UyJzmPe8Zx7lmJFsP6MLRxPjlD72Vew+F
         b3lD9iUSQTOtSZCuSR/OZHMWl5KUpzR00UUcgkT49wx1fcv3qiGGhm3smwbpo3sqBOFZ
         Z5hickhSir1Me8plctfVtkpBlKW0vRDxdoKVZ7W3hL2g2Jcf81GRGI863Xy7G+pj3Pp2
         4oWiONVlaAsk50KQFObKyWirZF0osd3vjKUSXgBE+7K2LLcMQ4dOLD77ynoOtMcJFiKA
         8gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
        b=eUh5i8UdLg3XYgeUeX4CJnANZeZZISWzW1iQqrSs4PiGywDzsJLFJTK6OeOFTFcBJ7
         uYDgREfE8IBlGb/mPYrmdkEPshfrX6p1g6bDwxu1ZgoY8/c+x7Wp2dr+OvSjR75ei05I
         S5rwYhu2XiTqrX+SAPWWuq+x8ZXzEraj9vu4kMSzk7hkbu11ENQd13DrHoSW5w/YwPNo
         4NyiGh4VPP6ZtWIE4QQr0bmEakhSnD4w62oewYABXouAdq7eyzPdgM3NeOSUmwbyQKL3
         ofbFJ7/QctlFP6HzyElkYrHlHL8X6/94mpScYQOsGsrz2kEqKZFTbkF2n4UbrIRXvO5N
         VIYQ==
X-Gm-Message-State: ACgBeo2DJQ72FG4+pIbJM4HD7/xkx0ivGkYZ2JPVRage1Jfg7QA3YEy3
        f/y50X67pMTwj2ctXlhAEOwYxA==
X-Google-Smtp-Source: AA6agR7D86UKhJvdjGXOYNf76HQYlp2EoXMifqDRKaFOaRaCQAkypP44nETDFgPRIChEC/kucC5VjA==
X-Received: by 2002:a05:6512:224e:b0:498:f21f:3500 with SMTP id i14-20020a056512224e00b00498f21f3500mr659945lfu.581.1662648475360;
        Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a24-20020ac25e78000000b0048aee825e2esm788307lfr.282.2022.09.08.07.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Message-ID: <f1d8736c-2e05-885c-aebe-0e89e3139eb5@linaro.org>
Date:   Thu, 8 Sep 2022 17:47:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 1/4] drm/msm: clean event_thread->worker in case of an
 error
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
 <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 03:08, Abhinav Kumar wrote:
> 
> 
> On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
>> If worker creation fails, nullify the event_thread->worker, so that
>> msm_drm_uninit() doesn't try accessing invalid memory location. While we
>> are at it, remove duplicate assignment to the ret variable.
>>
>> Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of 
>> kthread_run")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> the change itself LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> One minor nit below
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 44485363f37a..1aab6bf86278 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>           if (IS_ERR(priv->event_thread[i].worker)) {
>>               ret = PTR_ERR(priv->event_thread[i].worker);
>>               DRM_DEV_ERROR(dev, "failed to create crtc_event 
>> kthread\n");
> 
> Can we print ret in this error message?

In a separate change. I'll add it to my todo list.

> 
>> -            ret = PTR_ERR(priv->event_thread[i].worker);
>> +            priv->event_thread[i].worker = NULL;
>>               goto err_msm_uninit;
>>           }

-- 
With best wishes
Dmitry

