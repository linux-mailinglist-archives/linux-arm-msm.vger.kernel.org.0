Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8DF15E625B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 14:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbiIVM2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiIVM2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 08:28:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE93E512A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:28:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x27so14508403lfu.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5SZRoMWkj7sPPK68CLRRPVikyUUuj8SEQiwVkaQJlWY=;
        b=MCQN23xBoz2SKYpzjoltuC8QA9SC1+5Ru6OFQsdFc14JZGlqhxRsf909vKHzjWm1Te
         WT/D/0SCsUz22VN1J1zOME7omOBRfg6yj8dwWUt21xjBwbWkwhOK8HZomv/ua9Oh7Wo4
         pBrfkYSh38qHgM+TIIimvhBy4xQS+eoy6+HJbXUBcXlrAQwum58MLvFoN77AfQJqhTli
         d6bnIsmj93xjXmdBNpLsQSKJ3oJJ/eb7Tl9wH4qhk17EXNDGTELUd8BDh2NChQUhb5oN
         vY4rWE+23sodZwklNhN3f38s1F+LNzFfuvWaK8+P48Kl6kHfAnuXAnYU5YzsuY4chov5
         aKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5SZRoMWkj7sPPK68CLRRPVikyUUuj8SEQiwVkaQJlWY=;
        b=MKOzlTs/a+xVZy/t9S5QBJdahkgHtwHOK38y/26pGTuGlCCPzYRSIu6Q+ZdgMHM+Ag
         Pe2eRIIhNzYiKB1aMMoQGBUwWyVyGU4towzYpqF5tQgQF9OSbn9uwObDwMoGjVDtr9aC
         NfeFqY2oWPfcYM4ewE6TJPXlwVOPIMwxLo9CnmfDI5AiFMnu95+S5ZwodO88l3ZI8/AR
         jihZjd7F/v7LFqBB3KJBassJcMWcXgxGhDd2nXQJYNhJkPgMemZqAbtRyCq6B41EJL07
         wS3m52CJCcJcBry45DowCI/tP/VGhtAPE4PzXn9/SqCjSZpi+nSXPpsWvpIMFLtqEKjp
         E4sg==
X-Gm-Message-State: ACrzQf0vpqtf9ehgwMGZ2gvDPwxZJlIoPCBexNmhJWGXuDkBZQmFTxU4
        1VqBtTwyRzwqNOTohwN16qZHFA==
X-Google-Smtp-Source: AMsMyM4wVKJ79xhrEwFdmhQEp5YX56Nc1TUep7BTcnzG89LQeXIsYvp7rQ2cqzc+hSndw9i+usfS6A==
X-Received: by 2002:a05:6512:401d:b0:496:9971:78c5 with SMTP id br29-20020a056512401d00b00496997178c5mr1054971lfb.337.1663849698142;
        Thu, 22 Sep 2022 05:28:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a7-20020ac25e67000000b00499b57032c1sm916120lfr.144.2022.09.22.05.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 05:28:17 -0700 (PDT)
Message-ID: <d2af0a8e-63fe-221f-1c53-9fe1c43fa04d@linaro.org>
Date:   Thu, 22 Sep 2022 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-6-dmitry.baryshkov@linaro.org>
 <02b60bf8-70ac-eb7b-33d7-1c9b7a6f0a54@linaro.org>
 <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168a46c3-2c0e-cd5c-e6f1-1e072c67d162@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 13:46, Dmitry Baryshkov wrote:
>>> -  ranges: true
>>> +    maxItems: 2
>>>   
>>>     interconnects:
>>> -    items:
>>> -      - description: Interconnect path from mdp0 port to the data bus
>>> -      - description: Interconnect path from mdp1 port to the data bus
>>> +    maxItems: 2
>>
>> I think this is not equivalent now, because you have in total minItems:1
>> and maxItems:2, while in past minItems was 2.
> 
> This means that I should have minItems:2, maxItems:2, which, if I got it 
> right, is frowned upon. Let me doublecheck though if it works as expected.

It is frowned upon only if it is alone, because for missing minItems,
maxItems implies minItems. Here you have minItems in other schema, so
there is no such case

Best regards,
Krzysztof

