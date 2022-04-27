Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1E5121D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiD0TA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 15:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbiD0TAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 15:00:21 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB4812622
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 11:45:55 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q23so3751844wra.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 11:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f6A2106wpv8FyptFj0CXPhRPGyQFfkvsvlQQIXuralk=;
        b=USObKSJ2kUmKR31NngLz5pIhR33a1ZqcyGnNJvvYxbtjXLPQ7/hNFRSGycWBoFt1nc
         N59r9GCtKEmYZj+ib5amTDGDj14ILlYXGFtMVNvOyhmi5HMcGMWTx3wGdr9Kaa/Xd8Pv
         JFg5T4JrpfTKFMvZurcH4H0qA/oFeuochOGfzpSJEYbSxIlXdWL0a6Ht91kjt5uiL5Vm
         9MRD1gGbh3/YwNuS3P35nfQ97q+CWsojhI5X/qzkWKSGTLr3Wotx67sIZmRB9kBuy9QQ
         ds6kBFj6Va/Tv0NYAzeJIwu+5RdbvIdSZZ7GeNN45cRktvWeQnnXVX1umxvn6He7Op+1
         xCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f6A2106wpv8FyptFj0CXPhRPGyQFfkvsvlQQIXuralk=;
        b=ynDw9w8GRfgyJvXhKIWb2vfuolKYtpduxFMpZHVrbjNEi1m4t/fJ++5e1PaiFi96S4
         NoHV7AXi3OueCBSdulF59PzROpTHPrrxYjUIg8njsjvYc2VA5brfCUTVeHM8G9SRkZKP
         ytw2O37oZkcoCbmPowl9S9ZN0Y+BVfw8Y/sHNT7F0Zim87Z/W7Yap+dG6phGgsBSFkR+
         2g4Esmes8wgB4Nxy0ieF+LV/eg7nvKgZ96UuxOJkjWgU+isLwf3js+QL3nUDEQl9jo5C
         6N/gqWg9MfsxzLJBHaY+kfifeLmB+o6wcO9s8Af1tUgBI8p1H3zipIAQdUP0fw9vHe7C
         fxwA==
X-Gm-Message-State: AOAM531SF+uwF/EVY7QLy0gzwqfUAR9JQfPiLKz55flpiu4Tz7X69G4w
        bzyDfQQE7iScWz2pHA5QUob5uQ==
X-Google-Smtp-Source: ABdhPJxx/6zywqLRr3upfT6X/fKMN9/MUALq+nXlNuxuHRehXy0gUkKXOtbbfTTNa2tlTpDBgcRNkA==
X-Received: by 2002:a5d:47c4:0:b0:20a:e090:8590 with SMTP id o4-20020a5d47c4000000b0020ae0908590mr10237714wrc.465.1651085154133;
        Wed, 27 Apr 2022 11:45:54 -0700 (PDT)
Received: from [192.168.0.33] (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d51cd000000b0020af0706b9csm1774340wrv.53.2022.04.27.11.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 11:45:52 -0700 (PDT)
Message-ID: <850d2c2d-9531-ed4c-48fc-2daa0311e3e6@linaro.org>
Date:   Wed, 27 Apr 2022 19:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 3/9] mfd: qcom-spmi-pmic: read fab id on supported
 PMICs
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sumit.semwal@linaro.org, amit.pundir@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220323162820.110806-1-caleb@connolly.tech>
 <20220323162820.110806-4-caleb@connolly.tech> <Yma4tXvPQ+U89Whr@google.com>
 <10f7cb8e-4c2a-0bba-df55-16b56d429147@linaro.org>
 <Ymg455MYRIJTXgvW@google.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <Ymg455MYRIJTXgvW@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26/04/2022 19:24, Lee Jones wrote:
> On Tue, 26 Apr 2022, Caleb Connolly wrote:
>> On 25/04/2022 16:05, Lee Jones wrote:
>>> On Wed, 23 Mar 2022, Caleb Connolly wrote:
>>>
>>>> From: Caleb Connolly <caleb.connolly@linaro.org>
>>>>
>>>> The PMI8998 and PM660 expose the fab_id, this is needed by drivers like
>>>> the RRADC to calibrate ADC values.
>>>>
>>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/mfd/qcom-spmi-pmic.c      | 7 +++++++
>>>>    include/soc/qcom/qcom-spmi-pmic.h | 1 +
>>>>    2 files changed, 8 insertions(+)
>>>
>>> Please change the Subject line to match the style of the sub-system?
>> Hi, sorry if this is a silly question, I don't quite understand what you
>> want me to change here, the subject line is in the same "mfd: driver:"
>> format as other patches in the subsystem?
> 
> mfd: qcom-spmi-pmic: Read fab ID on supported PMICs
> 
> What's 'fab' should that be capitalised too?
"fab" is short for fabrication I think, the register value can be used to 
determine which factory the chip was manufactured in.

I can make it clearer and go for

mfd: qcom-spmi-pmic: Read fabrication ID on supported PMICs
> 
>>> Once changed:
>>>
>>>     Acked-by: Lee Jones <lee.jones@linaro.org>
>>>
>>
> 

-- 
Kind Regards,
Caleb (they/he)
