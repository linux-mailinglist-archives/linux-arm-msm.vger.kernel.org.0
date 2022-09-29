Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63EC95EF56F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 14:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiI2M1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 08:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiI2M1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 08:27:14 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5642139BCD
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 05:27:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bu25so2005806lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 05:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uZ8rwX1Ng8wKP4KeotkJ0H96LB9Ra2ZbdIKcCc54Vck=;
        b=nwGJbm1z4bUAzUFXtKpQ5Nl+MaLDFl8Lf8PqYk7CmaqtuBDHibP+ymOl5pcy5/q/en
         6Um8ZIeKCpfybZ3gMXd3NUZd+qGdCtUE56thXh05Vb+F3Su4Jxw2QsTeC6ca0Oe4S4Ut
         ADoKVSK+IYaB74GHsgcx4OwT3+2iWlWDYm/3UklWYg8nEhffXx3kRe83+DxOzYfw7pnz
         kwnIaElbcMcEN9ktB5aJm9LeOLvgfvXGKjv5PvQkbkJP/1PfMQN++RCaZ27zvVIk2+Uj
         oi9rs02P8wE9s0zKa48r9fC7Er6MoKeTdDev84SVSxTe06P3h2TeQR0hujd/DMWKXNs4
         aBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uZ8rwX1Ng8wKP4KeotkJ0H96LB9Ra2ZbdIKcCc54Vck=;
        b=OWx1m4JFRNgUDPpWgEJHty3ynevpCXUSAKHiKMOK/dB0K05BRnZkwTyTgxAvWnXwlo
         8JQNZ7bYvvGOMXX3AbOM6pB1aV8+VgNt6iugN0UhBo4oG3eThR9Bb1+j+O8eDsPvEPMC
         1fbFGJsPXaz7QwW23cWoQF3dMuy1nHzBylxzru4omduZyqT1hkp2pXwBKta/VRNI7Ea/
         ymFTumG+kkQsaUirF8ZQWd2WCdBDeYM+CRgBQVtC4P6uuX0NuYwQODHn8k+oRzmQBeCw
         Ki+pqGAAag5jW9D9M6jqwq77zGzOQ+SgBZd7lqrTHROEw+1eoC72u7L5nib3zCx4cX+l
         CNfw==
X-Gm-Message-State: ACrzQf2H8Izjdr9Tq0G2nMkpfqIdr3iXCN2hhpbNYYxjnueGXQrD5Koe
        JmXM/oB6kg6xPeBU4OqFIxZcrQ==
X-Google-Smtp-Source: AMsMyM6yY4CK9NsSbytLANDXLTPMxXWpp7DlCuc55Y1okx+IBJzb2bnFGAZhHR7h3SXAF54sWwT64A==
X-Received: by 2002:a05:6512:3584:b0:49f:517a:19da with SMTP id m4-20020a056512358400b0049f517a19damr1222244lfr.25.1664454432040;
        Thu, 29 Sep 2022 05:27:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z12-20020ac25dec000000b00493014c3d7csm765503lfq.309.2022.09.29.05.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 05:27:11 -0700 (PDT)
Message-ID: <65c5ee36-8651-8a42-b6b1-3b8041c7edb8@linaro.org>
Date:   Thu, 29 Sep 2022 14:27:10 +0200
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
 <f54377f0-a152-9367-1b06-f49df7466282@linaro.org>
 <3fa19362-118b-232e-0baf-ee365fa2f2e2@linaro.org>
 <07c75827-b8e5-7c70-315b-48617b9818e0@linaro.org>
 <9067ca94-cd5d-6883-d0e0-374ed7f599ad@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9067ca94-cd5d-6883-d0e0-374ed7f599ad@linaro.org>
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

On 29/09/2022 14:21, Neil Armstrong wrote:
> On 29/09/2022 14:02, Krzysztof Kozlowski wrote:
>> On 29/09/2022 13:59, Neil Armstrong wrote:
>>>> That's not really an answer... Bindings are correct because they are
>>>> correct? What is exactly correct in the bindings? How they reflect the
>>>> HW in a proper way, while DTS does not?
>>>>
>>>> Or let's focus on actual hardware - what are the properties of the
>>>> hardware which indicate that DTS is wrong?
>>>
>>> The actual PMIC is an PM8018
>>
>> And DTS is saying PMIC is PM8018, isn't it? I see clearly in DTS:
>> qcom,pm8018
>> qcom,pm8018-rtc
>> qcom,pm8018-pwrkey
>> qcom,pm8018-gpio
> 
> And this is why I pushed the removal of qcom,pm8921* fallback compatibles,
> except for qcom,pm8018-pwrkey because I didn't managed to get it documented at the time.

This does not explain at all why you wanted to remove any other
compatibles. There is no connection, relation between these.

We are making circles and discussion takes too much. I asked to bring
the arguments about hardware that point devices are not compatible. You
just said "PMIC is an PM8018", and that's it. Nothing more, nothing
about hardware. Based on that you want to remove compatibility. This is
not valid argument. It's unrelated.

You could as well say "The actual PMIC is Qualcomm PMIC" and you would
be right. Still not an argument.

Based on lack of arguments in this entire discussion, the patch itself
is not correct. Use the approach I wrote some time ago and quoted one
more time.

Best regards,
Krzysztof

