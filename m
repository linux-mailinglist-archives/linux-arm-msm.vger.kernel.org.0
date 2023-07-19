Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C32167592F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 12:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbjGSK1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 06:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjGSK1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 06:27:10 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005C62D70
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:26:07 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b700e85950so99134321fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689762366; x=1692354366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLSLLfLfGkyZH0yjoTyn6PJy/RUjV1d8qkkgDc6QU+s=;
        b=JybiC/o3rXPgzagAEAnnN2dmY0GnVZAjHjAdu05xYkFxYMFmn7mKyKBvGd/2nRmjW2
         Vq660C4pMeIQyXqLwv0XIyzhYVyqtMfQ/GZux+LOrLLPM7pxhQq+XKkUthHCXuWBHrqg
         fIFHO1FMOkxuqiRJ2DHm/VCEvp2QUlqS9mIbO6kcmoeyKagXbKGRt9wKUeNNvEJnM+WR
         6A8jMiHTVTTRYVnGS6b7zS4khwDLJvz6yRbuTLYUQC9pTzvo/gs0ECBdnC8/TPc7Jtdp
         WlDbwM4i/VvYAo4rGHMc7pAArPMtFsDgMONMx5zZxzDXLjT8Ri01Wmec2nAbva9cqAaN
         +iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689762366; x=1692354366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLSLLfLfGkyZH0yjoTyn6PJy/RUjV1d8qkkgDc6QU+s=;
        b=Qv8pm+EbBZyg2gQ+rjd1St05u/aCvTUQoOEQ0rwsKf86SBPA6UHbenG5m6FcZaabD6
         ixUAAL2CfO9BIi4Wvo3kMMu/H6aNsSO4vhoyTbsII9T+aBdqu2x/DcLHAVegtLHtL20A
         kq8YbyRI5GasKUk/Jw939kZJS4mxHqZkGoyDLbfxxjmyJVbTwHlWJIBnMg640UJerBIz
         95fSFGDwgkWI54uTxwDf2JFjM4J4NgftTdz0b86oyjcX8zNHnW477Fzk74Ielfup2jgB
         C+6pwsWE9OJZkhS4KYtXMKgq27n8HAfmSZO7qPlNVTsBPA3vA6QYMJSaesZQIX6IqzWf
         UXqQ==
X-Gm-Message-State: ABy/qLZzSt0r+p3NSHOQ2knoM8syeIPyu/DOy2ykc9jzOdakdg3JDf88
        U3wPEjO/sJONe6MPQQjmPkItYA==
X-Google-Smtp-Source: APBJJlHeac+wBpkb+738ruf1UYkUyJ9pvySpiPwn4PRRxb52jswHUAR/7akNbkpM/QEo4HQZpm7Vlg==
X-Received: by 2002:a05:651c:85:b0:2b5:7f93:b3b0 with SMTP id 5-20020a05651c008500b002b57f93b3b0mr3881840ljq.17.1689762365727;
        Wed, 19 Jul 2023 03:26:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906351600b00992f8110a2bsm2129419eja.150.2023.07.19.03.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:26:05 -0700 (PDT)
Message-ID: <3d544c17-7aa9-bc68-c56d-6b6fad1c7b66@linaro.org>
Date:   Wed, 19 Jul 2023 12:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] soc: qcom: socinfo: add SM4450 ID
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230719100135.21325-1-quic_tengfan@quicinc.com>
 <20230719100135.21325-6-quic_tengfan@quicinc.com>
 <185cb945-4c4e-1697-060e-602a3af2fe50@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <185cb945-4c4e-1697-060e-602a3af2fe50@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 12:15, Dmitry Baryshkov wrote:
> On 19/07/2023 13:01, Tengfei Fan wrote:
>> Add the ID for the Qualcomm SM4450 SoC.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   drivers/soc/qcom/socinfo.c         | 1 +
>>   include/dt-bindings/arm/qcom,ids.h | 2 ++
>>   2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
>> index 4d49945b3a35..fa5e4c54207a 100644
>> --- a/drivers/soc/qcom/socinfo.c
>> +++ b/drivers/soc/qcom/socinfo.c
>> @@ -415,6 +415,7 @@ static const struct soc_id soc_id[] = {
>>   	{ qcom_board_id(IPQ5312) },
>>   	{ qcom_board_id(IPQ5302) },
>>   	{ qcom_board_id(IPQ5300) },
>> +	{ qcom_board_id(SM4450) },
>>   };
>>   
>>   static const char *socinfo_machine(struct device *dev, unsigned int id)
>> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
>> index bcbe9ee2cdaf..6201bfb1405e 100644
>> --- a/include/dt-bindings/arm/qcom,ids.h
>> +++ b/include/dt-bindings/arm/qcom,ids.h
>> @@ -2,6 +2,7 @@
>>   /*
>>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>>    * Copyright (c) 2022 Linaro Ltd
>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> I wonder whether a single define is copyrightable.

If you carefully choose a place, like out of order, then probably it is
a creative work. :)

Best regards,
Krzysztof

