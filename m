Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0C55EF4A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 13:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbiI2LsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 07:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235580AbiI2Lrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 07:47:47 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8059C151B1D
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:47:46 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bu25so1855957lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=aSlVEfb6wnDYtrnOuzX2ls16fh7KcS4K9DsHeur+Ejk=;
        b=lUzCaviMsGgmGJ6hkXVUgsjKl1VLH2F4cyoNzNCcn1P544z/Rx3e4kBz1KVpKxdt6G
         bkdTBKlAI90Wy12ivOwDhEaekVGKDTa38Pbzf5n0FdB75OOOEiTN8F95qTR7fXar12FI
         Yabk3Duj+/kPLEilpkk2sNYKPExgsQGqP5zziCnF0UZ1sFcMqrMigpDKkv4TjGnaR5o5
         mj8JIGIjI4GI8odFpY+BrAO0Tv1urQVJVF3wCuHfP68AeYuN7F7MqGsJHZJcoI+arBHI
         cHhFo3GzFmmRrZ1yep3lJyrgjvgx+jBLoAKrcpmhdabNQ7xaMKmFoB9CurtkA+1qSRt7
         aBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aSlVEfb6wnDYtrnOuzX2ls16fh7KcS4K9DsHeur+Ejk=;
        b=sD9fS/9OHPwUlOvyZ3CAhG8wEdaveaThJXXvYew5llKdBvSECAe9PK9oCoW3BWCsST
         Rvjv5hy/Iro27Ng7DCdw0jXyDl4U5iTRodoMaMhQRyen9yJE0+V40Q+WxAQJj41KM0xi
         zDd2sB0sFicnQHYEM63TlEt9V4q9HFSlTzr50/ktWx8cghzhjmRFu8W2ykZ5joInp+pW
         VpEAxd9ISMhfn1YN6Q1G0yzH/09//wkKScwa1HeDmSSTG4eGcnv9Ysf2hnV9koThrS4W
         wIswTy82Sqg5UZnL9BYQzFgcsoyFuKXv3Qtju3f05vRN2ERm9hp+74npUNvnjDcqAoJX
         TBMA==
X-Gm-Message-State: ACrzQf2W7mBKeNv+zyilOOT++ImAUt2TlB1fs3QeDROB79EGdTo2/B+2
        /V4tszT1aUwcl9mAhDJJ7LhdMg==
X-Google-Smtp-Source: AMsMyM5QerQ1m9hBoAB4XhpAEC/07Xcm5gSBvbF7Likl4rJSTnIN6znqFOVPa5mCe0srBo5E3lw8Fg==
X-Received: by 2002:a05:6512:3f0e:b0:4a0:45b7:a8dc with SMTP id y14-20020a0565123f0e00b004a045b7a8dcmr1184988lfa.368.1664452064759;
        Thu, 29 Sep 2022 04:47:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w7-20020a05651204c700b004979da67114sm761370lfq.255.2022.09.29.04.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 04:47:44 -0700 (PDT)
Message-ID: <f54377f0-a152-9367-1b06-f49df7466282@linaro.org>
Date:   Thu, 29 Sep 2022 13:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 5/7] arm: dts: qcom: mdm9615: remove invalid pmic
 subnodes compatibles
Content-Language: en-US
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-5-b6e63a7df1e8@linaro.org>
 <0636d53f-508f-8a86-0973-2641c9020622@linaro.org>
 <6ed642ea-424d-49ed-eb30-e09588720373@linaro.org>
 <1a3c6766-9be5-1e55-95eb-bc9656e5c9a3@linaro.org>
 <7f8572ab-ff97-54bd-a5f3-fe0e179ee48e@linaro.org>
 <84cb8941-eb15-1bbf-59b7-bbcd6c15c30d@linaro.org>
 <07405d0d-8534-6470-21d1-26b85dbd7de0@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <07405d0d-8534-6470-21d1-26b85dbd7de0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2022 13:39, Neil Armstrong wrote:
>>>> The DTS looks correct unless you have some real argument that it is not.
>>>>
>>>> How this should be fixed? First, drop bogus entries from drivers, then
>>>> document proper compatibles.
>>>
>>> What do you mean ? There's no point to keep the PM8921 compatibles, the gpio
>>
>> I asked at beginning - why? Why there is no point to keep them?
> 
> Because the HW is an PM8018 and the addition of the PM8921 was for policy/organization/struggling-to-make-dt-merged-before-clear-dt-policy/...
> so you say I should modify the Bindings to reflect the actual "pm8018", "pm8921" situation instead of changing the DT even if incorrect ?

Yes, this is what I already wrote:

"How this should be fixed? First, drop bogus entries from drivers, then
document proper compatibles."

>>> and PMIC bindings already enforces to only have the PM8018 compatible.
>>
>> That is just partial argument because binding does not match DTS. So
>> something is not correct. Why do you assume bindings are correct?
> 
> Because bindings accurately reflects HW and DT doesn't.

That's not really an answer... Bindings are correct because they are
correct? What is exactly correct in the bindings? How they reflect the
HW in a proper way, while DTS does not?

Or let's focus on actual hardware - what are the properties of the
hardware which indicate that DTS is wrong?

Best regards,
Krzysztof

