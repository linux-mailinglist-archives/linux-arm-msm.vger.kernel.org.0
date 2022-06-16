Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3967854DC73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358692AbiFPIHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358520AbiFPIHL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:07:11 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5515D18F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:07:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y32so1040956lfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/pRixx8A5NmIgzuI16/xbS/fxWasbprf5TzsyZtX/Rc=;
        b=O0SNbdpeeKwPEve6kekoUpHg0VY0BV5/OlzzAnPIcmeWqfZ46O3iwx3D2yZcEhmuZb
         pmmvn5eLND7D9sXQWd2nFnyd1VBOuAQ6g5r4f+z1yM03T9c3PLKjLDvgucOtRAlfImth
         dNk+IhW9UB+Qm2aIn3VQit/82dGZvlAi09GvHQOyGsGchU/0wfWpILjnkBLSoIcan2am
         OsRygAdYw8V4rwyOdgHVpnGihU+OuhChaUZQgA9T5/lX+ZPOUdlBCuSqqvWcqKJsxiaC
         YogBLc8YA+wAY3/32/4MtEr1agQ6iOqEnQDchAdqH6x1wUlKuFh9oEgw6krL0Tad0miZ
         ACHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/pRixx8A5NmIgzuI16/xbS/fxWasbprf5TzsyZtX/Rc=;
        b=g3imQgEQaIzsX3a28DwJxClXcPfWIXSeUq/yEXaGb+/Suzx9ydyRBACLZDmE+yHecJ
         D/P3MH7/bT7OabvIupTfXMFDzgeImDejIcM6OS7GwNVVhsDZQsDoTi4LeWp34t6d6uJ6
         yiH0faAXv/9L/ikyOPgJo4a9GRQ1/10loIhefDpYwRXk/fP7U7m9cANxvjXoELzXG0PU
         bQyjV7ce1A+D7B1ub964ANei9mCDU7CMl2RHygxxfnAU4CO/g65nt4NYZhPpAVUEcrjV
         pjryWjZ9AxFBL0A7yrHT832MUpeZMzYywuTeimLasUPtSpxa8MAzTsd1lQq7gMETm0x6
         /XjA==
X-Gm-Message-State: AJIora/5RGpJk4OzRfbZ4BHqsMYHPnPPuh0wVnXMr7qeMs6FQ2fub6WW
        GpGWBr6geATGEzIgpSpVBYBmJw==
X-Google-Smtp-Source: AGRyM1u1xELSmGKoa5EcL2ZapZwgIxY84syV2QpLs574QTwTg3SmggmDf2p8wydDHJjjK5jGJgklKA==
X-Received: by 2002:a19:2d57:0:b0:479:732e:d8d5 with SMTP id t23-20020a192d57000000b00479732ed8d5mr1941662lft.131.1655366826908;
        Thu, 16 Jun 2022 01:07:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b28-20020a19645c000000b00473c87152bcsm138299lfj.127.2022.06.16.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 01:07:06 -0700 (PDT)
Message-ID: <92d13645-82de-18ea-f0e6-30a8de1ce3c8@linaro.org>
Date:   Thu, 16 Jun 2022 11:07:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/5] drm/msm: move KMS aspace init to the separate
 helper
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
 <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/06/2022 05:34, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-04 17:16:04)
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index a37a3bbc04d9..98ae0036ab57 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
>>
>>   #include <linux/of_address.h>
>>
>> +struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>> +{
> [...]
>> +       }
>> +
>> +       aspace = msm_gem_address_space_create(mmu, "mdp_kms",
>> +               0x1000, 0x100000000 - 0x1000);
>> +       if (IS_ERR(aspace)) {
>> +               mmu->funcs->destroy(mmu);
> 
> 
>> +               return aspace;
>> +       }
>> +
>> +       return aspace;
> 
> This can be 'return aspace' one time instead of two.

Yes. I was just always in favour of explicit error returns rather than 
falling through. I'll send v2.

> 
>> +}
>> +
>>   bool msm_use_mmu(struct drm_device *dev)
>>   {
>>          struct msm_drm_private *priv = dev->dev_private;


-- 
With best wishes
Dmitry
