Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6CF616684
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 16:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiKBPvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 11:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiKBPvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 11:51:45 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1C62BB38
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 08:51:44 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f37so28893840lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XkrttrP/8k6Uhj+JHOcFHyc8juhef2eGyny7iXFjWgw=;
        b=Z0VLSJzNCtq9E/ToW9yfbkWyLnA4YxfCOgY356IXchLTKymFr/drPoV6ftSoyyK1kx
         7HNvXAtou0FZKenXDL6dfoFqMh7JInssILzSMMfBYEFJrWIEKLuCn+TApj49wJfEdvwl
         p2n3sIFPzHPnzLFUYRjh/oMxWAuMI3n7mTPhkKTJA4c5OIIKISCY5y550/FKvsJjLw9+
         14vw+0YMXt+QXJJfB035YvPXV1Qxt2CBojYgM2PUJQ+Q/jfD7nlbjPZ8iYBn2xjOjtUK
         /gOyDngmmxbfzeWYJhhScq7bUEJu/MshMGh1kiS6U8iDcea209WtB1opX5Ut2oAR1N39
         PV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkrttrP/8k6Uhj+JHOcFHyc8juhef2eGyny7iXFjWgw=;
        b=YEMUxzjCiSF5WpbhzVbzZeSSAQqbB/lwutcSaVTRNL7JpyKPYBH1yZcbvb0xzLpFeI
         H5oDZTu67Q7VNIUT0KwHaI9XUQ0vyB/f980XyinqUsdUt16b9DgKdpa0MOz27uk9Ux0+
         1nDtqyLmGo267aBL76PXJGjM8SHLlDC2XAG+3L56ZKN4i8HTZ/SYUA9yDA9b+iTvSgZ0
         C2cjfzGNj232ZF1stcCYSLSt8An9LR3fnXZWLJ0Ll4FKT/sEYfE/3QcQYhQgdsskB7HZ
         ++3JooRT55nA8tfrBnmv6NzRHQ7LsEbQT6FfNaCOLfZxFhq4K+rsgXYxOOgE+/3iswpw
         l6pw==
X-Gm-Message-State: ACrzQf2RcLuiQ8EURdH0r6clGnrwyIcMOSSGwgxMO5U5vYpDXRPU0xMM
        rd/Vy5VOyZqDeF4bVPjIQ0Bkbf+4psUABCsBk1o=
X-Google-Smtp-Source: AMsMyM5obyOxH5ml1zFCem7IPj8YH+crCGInHzB5mEhtge5d5tFEMYzt7zsPGDsbakKat45LEQ00pQ==
X-Received: by 2002:ac2:51b4:0:b0:4b1:785c:7a5d with SMTP id f20-20020ac251b4000000b004b1785c7a5dmr349522lfk.261.1667404302716;
        Wed, 02 Nov 2022 08:51:42 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u16-20020a2ea170000000b0026c3ecf9a39sm2192247ljl.38.2022.11.02.08.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 08:51:42 -0700 (PDT)
Message-ID: <b0663134-f1fe-9d14-44fb-145b95e5228c@linaro.org>
Date:   Wed, 2 Nov 2022 18:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 3/3] drm/msm/dp: retry 3 times if set sink to D0 poweer
 state failed
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1662999830-13916-1-git-send-email-quic_khsieh@quicinc.com>
 <1662999830-13916-4-git-send-email-quic_khsieh@quicinc.com>
 <067c7bc0-4746-f714-db56-a3c9e4f25588@linaro.org>
 <61d591ff-c5d8-a032-9eaa-6ab4c535a679@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <61d591ff-c5d8-a032-9eaa-6ab4c535a679@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 22:26, Kuogee Hsieh wrote:
> 
> On 9/12/2022 11:37 AM, Dmitry Baryshkov wrote:
>> On 12/09/2022 19:23, Kuogee Hsieh wrote:
>>> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
>>> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
>>> patch will retry 3 times if written to DP_SET_POWER register failed.
>>
>> Could you please elaborate this change? Can the sink succeed in 
>> reading the DP_SET_POWER, but fail writing DP_SET_POWER?
> 
> yes, there is possible since it is not only set local sink device but 
> also all downstream sink devices to D0 state.

Ack. Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>
>>>
>>> Changes in v5:
>>> -- split into two patches
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_link.c | 13 ++++++++-----
>>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>>> b/drivers/gpu/drm/msm/dp/dp_link.c
>>> index 9d5381d..4360728 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>> @@ -50,6 +50,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>>> *aux,
>>>   {
>>>       u8 value;
>>>       ssize_t len;
>>> +    int i;
>>>         if (link->revision < 0x11)
>>>           return 0;
>>> @@ -61,11 +62,13 @@ static int dp_aux_link_power_up(struct drm_dp_aux 
>>> *aux,
>>>       value &= ~DP_SET_POWER_MASK;
>>>       value |= DP_SET_POWER_D0;
>>>   -    len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>>> -    if (len < 0)
>>> -        return len;
>>> -
>>> -    usleep_range(1000, 2000);
>>> +    /* retry for 1ms to give the sink time to wake up */
>>> +    for (i = 0; i < 3; i++) {
>>> +        len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
>>> +        usleep_range(1000, 2000);
>>> +        if (len == 1)
>>> +            break;
>>> +    }
>>>         return 0;
>>>   }
>>

-- 
With best wishes
Dmitry

