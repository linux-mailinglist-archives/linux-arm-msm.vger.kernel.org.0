Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D68515FC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 20:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbiD3SKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 14:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbiD3SKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 14:10:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18463183B2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 11:06:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y19so14039063ljd.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=usM/3SEn9Zt9Vp4vV1TlLkrBXXnAMnXgqhwfe3UJfAk=;
        b=KLD7erR60kwh5eDVlR9alL6HEt5NnJ/stggDecNkhSm1kVwSf8zE/rojbWd9+/n2GX
         /QxwwCv4EluBGqY19YGgn8SYMo6CMi6HPzA/yolECgArq3DGzKrnTfOCXVe5eZyWdSr9
         uo5mkTXl4kCrr0mDo4C5Sn68qd1u22U0UAwQJf+MQmEcu0iWXsWQ2jEoxW5vb1hkNG0i
         LfWORZVWNwqCYKDE+ByzqQ1G71D5RpCyKinGSDE3WiOhBHvw98mL9B1awUcOYobm+oXu
         2iyuKJwusN+Ct43TagKYnkmYKnLaItnV6r7FMwOcOh/CR/IXgjV8UBH09PwJ5c431aH3
         Q61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=usM/3SEn9Zt9Vp4vV1TlLkrBXXnAMnXgqhwfe3UJfAk=;
        b=WIdlgd5Y8uyFMbCLywVbQxcOUNTWQcIN3YS6kALwblU/HB3n10ZlEYAsatwcEEfU+G
         re9iPy0PNhs5N16Ewe41lgR6M4eoGfn8j5VobiEyIFAnDPqvSmT7EMdxXmTUdkLLVJSY
         RouI1vgCGuwNNVxvGIeDLj+Y1Nocr8CUY9zSwj4/4kUn0ufP5XWsvSN44juskL3IuIZr
         70a9BxDNlZk2QGcuznMiQLm4cUdJYdsQlL+xSRpAaBNIco+Ot0SX1AQZwGOrrUuS8dw0
         TOGBi4VawyZAwwgk7llQciYSsjewzD4V2jW7aY6eLDRt9yDU0pcIJA/d7rQhdEkWdkdQ
         49/A==
X-Gm-Message-State: AOAM532ZU7/3JUd3p4NL/nNa6xWo0+h0pt7nODfZ/HOiP2mAOnWxMJso
        oCXoE0CsJi6+UBVyCyzuhO5QMQ==
X-Google-Smtp-Source: ABdhPJxDaOYZdMVuyzRm0gkaknUor661m/3PgVpJR7QlUL9lMQT38wtjWewdDquSzJ9p8hlPiuLMkA==
X-Received: by 2002:a2e:87cb:0:b0:24f:81c:8940 with SMTP id v11-20020a2e87cb000000b0024f081c8940mr3290470ljj.423.1651342012368;
        Sat, 30 Apr 2022 11:06:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m1-20020a195201000000b0047255d21109sm242291lfb.56.2022.04.30.11.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Apr 2022 11:06:52 -0700 (PDT)
Message-ID: <cb55ae92-5ed2-5372-70a8-08faa8cf6983@linaro.org>
Date:   Sat, 30 Apr 2022 21:06:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm: add missing include to msm_drv.c
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
References: <20220430104820.3782290-1-dmitry.baryshkov@linaro.org>
 <f564f2e0-74b9-7829-1729-12cb840db9b9@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f564f2e0-74b9-7829-1729-12cb840db9b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/04/2022 18:00, Abhinav Kumar wrote:
> Change seems fine, with a couple of minor things below.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On 4/30/2022 3:48 AM, Dmitry Baryshkov wrote:
>> Add explicit include of drm_bridge.h to the msm_drm.c to fix the
> 
> this should be msm_drv.c

Ack.

> 
>> following warning:
>>
>> drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of 
>> function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? 
>> [-Werror=implicit-function-declaration]
>>
>> Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
> 
> How did the this commit compile without this?

I think this manifests only in some situations depending on the drivers 
and features selected. The config generated by the robot is the PA/RISC 
randconfig. See [1].
For example the whole tree compile w/o any issues here. Otherwise I 
would have noticed it.

[1] 
https://download.01.org/0day-ci/archive/20220430/202204301804.hJxOQfse-lkp@intel.com/config


> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 4f3dce334553..4a3dda23e3e0 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/uaccess.h>
>>   #include <uapi/linux/sched/types.h>
>> +#include <drm/drm_bridge.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_ioctl.h>


-- 
With best wishes
Dmitry
