Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEDEC6F3DF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 08:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbjEBG4o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 02:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbjEBG4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 02:56:43 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4518A1997
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 23:56:42 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso4234952a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010601; x=1685602601;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AI9rc5KwuY5oT4qIViG2rkqPsdw8rNAxwD+s/BYmp5s=;
        b=FM/oAqfPNnba5pCq64q2mzyHhHJzWuJzGDhKw5pbNa971RbJEtE1HaNuymk1RjLkQZ
         7j/curhT62kEnwDm+KijaZv/T7dvjpjHFweACXkFi0kxvwuxMV4+7zvCtvGkN8hodJOK
         4eVebPVkvNminPY3W4/QXywa9A+aUls07CNHFH7c/40BxotL57+dqxEbdtKYJyv+h/af
         Rsp6kOKXhiDc5WkLw3oQb+5D32nh/bmLJqWl5pa6ng5A1aC32E3pC2MhiaAIuVHPhw4B
         DnMlu2zF91+2A/etQ7ExQngoQXffFMTgRrUR+rNKgIofNFbf4oba2f2G2+5j2G8US0sM
         jD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010601; x=1685602601;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AI9rc5KwuY5oT4qIViG2rkqPsdw8rNAxwD+s/BYmp5s=;
        b=NqTpys6+rtYlpbs05Wz4TGhJv0l19bpI1YqOU1Jtfp7vRa56QeyOsdOM4+nDktAWb7
         3P3Eh5k8X2zdohtV9vZl0KAZKyfvmyvpwvj8kZGngwjXvsTfe1MUPNQHNkjtzGZosjuC
         r1YkYN+YTmF8qCuElc3EEfkymXpZCReRh0yZ2uRcLkQVeIcOOQfe1gxVHXFjX4/2DRPE
         35G6Kh6jNc5hDBmXbQV2ZgUdX8f6IvEi52vA7eqXh6xbcy3S2KSndjgptXzi7Ays/mUC
         Z/3emyP7gHN4q0/qdVd3gvpc1OBtCKmJASCxOb0x0pyMr8ScN2VE+HkcNIw/4XnKYt0J
         pMnw==
X-Gm-Message-State: AC+VfDyPBcKebtWepGu1RIVmDrJCvw72YGzfDeGyDn4uuihIygS367jr
        SghiQHVVXufWpccBRxWtQhvYMw==
X-Google-Smtp-Source: ACHHUZ5eeLv/mWJwuqjWwQpdcg4UWUO7wj1tLFMA/8N6R1hOJASloUvhN2WqDsZp+n2P+0jWTkWV7g==
X-Received: by 2002:aa7:d5d9:0:b0:50b:c3b1:9790 with SMTP id d25-20020aa7d5d9000000b0050bc3b19790mr5326865eds.16.1683010600642;
        Mon, 01 May 2023 23:56:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id ay16-20020a056402203000b0050bcf4d1a52sm657631edb.54.2023.05.01.23.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:56:40 -0700 (PDT)
Message-ID: <3483476c-97fa-cc41-617c-96807d3e047e@linaro.org>
Date:   Tue, 2 May 2023 08:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add IDs for IPQ5018
 family
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230429193336.600629-1-robimarko@gmail.com>
 <8feae59c-b762-8cc8-7aa9-237ce4af5b1e@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8feae59c-b762-8cc8-7aa9-237ce4af5b1e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 14:51, Konrad Dybcio wrote:
> 
> 
> On 29.04.2023 21:33, Robert Marko wrote:
>> Add SOC IDs for the IPQ5018 family.
>>
>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>> ---
>>  include/dt-bindings/arm/qcom,ids.h | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
>> index 802495b20276..c1283bad81e1 100644
>> --- a/include/dt-bindings/arm/qcom,ids.h
>> +++ b/include/dt-bindings/arm/qcom,ids.h
>> @@ -216,6 +216,9 @@
>>  #define QCOM_ID_SM8350			439
>>  #define QCOM_ID_QCM2290			441
>>  #define QCOM_ID_SM6115			444
>> +#define QCOM_ID_IPQ5010			446
>> +#define QCOM_ID_IPQ5018			447
>> +#define QCOM_ID_IPQ5028			448
>>  #define QCOM_ID_SC8280XP		449
>>  #define QCOM_ID_IPQ6005			453
>>  #define QCOM_ID_QRB5165			455
>> @@ -229,6 +232,9 @@
>>  #define QCOM_ID_SM8450_3		482
>>  #define QCOM_ID_SC7280			487
>>  #define QCOM_ID_SC7180P			495
>> +#define QCOM_ID_IPQ5000			503
> 
>> +#define QCOM_ID_IPQ0509			504
>> +#define QCOM_ID_IPQ0518			505
> Are you sure these names are in tact?

Good catch :)

Best regards,
Krzysztof

