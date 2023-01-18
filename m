Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F39B671E93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbjARNz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjARNzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:55:41 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A76D8CE58
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:26:11 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1408782wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3k8frPalWO3Z3os+kNp0jp8dx/XM1Dyquz57dFW8EA=;
        b=ZqJeDahIqkSzoQJifZAZvvOn5FPWyWN/dKqKzr+D0yILoa1Yhq+84XSUD+kB31zN5+
         4DEJAL49lbIKnZqgHs08GIRJ5CfNDgSNm0f4qNyHdcD+WXOJxLBBZQV8gKFXJ5QtDtuY
         0c1/E/SGQ9ZoM2awPSnLJVq5vsjYoeE4n98Wd9EsDpkix3xSQi/c675ZV7KYCjcm9Rcj
         vX0BjIWYtdECxW6zSsHNVpFyLAHMyCCtjBztU9tw9Sge7b0K1bRL2FRRTwxlPfNlaktS
         DnXRAsbly8J06BHP/jjWft47IImkOeS5IsCIpTEri0ZlRuW3+/g6NVDdqLteoI5ZNPUJ
         9TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3k8frPalWO3Z3os+kNp0jp8dx/XM1Dyquz57dFW8EA=;
        b=HyGsEfBC+0+UHvIRDyDgFPuHsizY/CtC1ESJc1l/A8ma25KQwsyZDIcwX2W2H6waNX
         yVX0pNvzqS+sqe1+BRmF9B6F5vXuDUKvLbgSI8qJN7SaIIXd1qdpmtbVUShJDPxBBBYa
         bQ1KGunFfo+CC1QeYKi2vLajusGSEmNlJ4zCbwW1HlHVFRe/2DaLesY1nvYcQ3Pvytgd
         dBGtqSd0uEvLQzD0I1C67sNhFQ3LzG/FXdnGbI5AXYpOKGJV5VbEWWjl7svEZbUMUHAk
         eYLo+yftI8H3movoqGOdH9N4GTWsjxxLE5FuFKVo78WCRgxUc7iOu+TU6KIIwGDixWeV
         SkJg==
X-Gm-Message-State: AFqh2koM1V5zX4TqqJZDGRqb98yWs5OtrZzwfsz8V8HSu227ie/e0lUE
        2UCXFDAcw+yabG/HeO+JyuidWQ==
X-Google-Smtp-Source: AMrXdXs37wvLroZfU7gxPexS9gisJjQH9LTOdnfUkpefHwuHlTbMrugwkgRc/efeLQZknOBY6HRD0g==
X-Received: by 2002:a05:600c:281:b0:3da:1132:4b63 with SMTP id 1-20020a05600c028100b003da11324b63mr6726498wmk.5.1674048370192;
        Wed, 18 Jan 2023 05:26:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c384400b003d9862ec435sm1998066wmr.20.2023.01.18.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:26:09 -0800 (PST)
Message-ID: <b4ae25ea-bccd-d845-c133-488d23d92e47@linaro.org>
Date:   Wed, 18 Jan 2023 14:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe
 slim-ifc-dev
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
 <20230117192724.GA3489389-robh@kernel.org>
 <331eed95-eaf7-5c5a-86c1-0ee7b5591b9a@linaro.org>
 <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 14:19, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 5:25 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/01/2023 20:27, Rob Herring wrote:
>>> On Fri, Jan 13, 2023 at 05:22:13PM +0100, Krzysztof Kozlowski wrote:
>>>> The "slim-ifc-dev" property should not be just "true", because it allows
>>>> any type.
>>>
>>> Yes, but it is common, so it should be in a common schema. Though
>>> there's only one other binding using it (wcd9335.txt).
>>
>> This is still wcd9335 and wcd934x specific, not really common. Maybe
>> next Qualcomm codec would also bring it so then we can define common
>> schema for the codecs. But so far I think it is not really a common
>> property.
> 
> By common, I only mean used by more than 1 binding. That's already the
> case, there's just not a schema for the 2nd one. In any case, can
> address that later.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Sure!

Best regards,
Krzysztof

