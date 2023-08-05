Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F03771190
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Aug 2023 20:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjHESrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Aug 2023 14:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjHESrF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Aug 2023 14:47:05 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F72DFA
        for <linux-arm-msm@vger.kernel.org>; Sat,  5 Aug 2023 11:47:03 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9c55e0fbeso49163291fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Aug 2023 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691261222; x=1691866022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRWew4AjSMA2PJPO85LRIgQO2JC6RNeaCiEFmYqIM4c=;
        b=BnyFd8xifQ6rtK9QYBMCwx/OwAaowyisDDQOCl0z5EtkZGeGxJbM/iCFTas6urkCTH
         ZG4a+gI18MUAH1fQTzx115Wz3DSJmEDFXrODjeSYnVUThsqohW/iGg6S8LIhrkJEYJWD
         F5uIOYIL8cHfrMINy4VMCCj9q+d8GUDQN7mLxvdPf0Q62pS5U+vBhBZJFdKkSN1t0KEO
         J9sY+muUjKc1z6EEMzQs7Jinm8ZlFRRFgBK3iW5sijygM+EJ3chPh7I2mIjhwKTwZXcj
         wh/6jj8Xttr+MnC5A1QKhXXzV2t2ZATpkEQIHb0H+YictGjGY0E5/lYJGV1ZNvEAu+Qz
         vt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691261222; x=1691866022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRWew4AjSMA2PJPO85LRIgQO2JC6RNeaCiEFmYqIM4c=;
        b=JeHBCY+AtkaB7eKe2b0Uuylww1MiABCEZ0OAug+vu3kmsNm56BM/i7HktNFOfGkBDJ
         4QuEeZy+zaDWeoWGni6h6j6n4aXxJVDRvsVzztv+UfVqmg6hRRPMhEbtBJspG6vrSCWe
         lVXV0ZdS+iG/0UqVzcdPxUVqRtMZczdM4xcoURP8HUUlej3jDRe58PVGrZEXwYblRfAS
         HBHN9tis9deOt9i+eFJwTYS21UkYqK7nFYuiyo/pWFuU6PsBOR97+NFQR6DWQ8/Nzeh7
         Ve659oFrSUhovncgqwRdONB4jwdjlCURVcg+STxPvRfff5IV3LT5yLS5Kqz8QvfjSziI
         xTdQ==
X-Gm-Message-State: AOJu0YwzvqlocxtCVqHfuptOF9ayuSb2Y351ff8VMXAWTWqwOzrVGa8S
        ppmx6aSA6AMEJxCnT03TiK3gaA==
X-Google-Smtp-Source: AGHT+IErbzYeVqDMHMWw7UPa/LkZv8Yb6Q/761H7498JUq+FubflZvr1RIQlK3ZltjtyBepW7Nz9iw==
X-Received: by 2002:a05:6512:6d2:b0:4fd:f7a8:a9f3 with SMTP id u18-20020a05651206d200b004fdf7a8a9f3mr4282478lff.38.1691261221815;
        Sat, 05 Aug 2023 11:47:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id f23-20020a056402069700b0052333d7e320sm81194edy.27.2023.08.05.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 11:46:43 -0700 (PDT)
Message-ID: <38fbb9d1-f263-2ec1-a3d8-4b09a26eaf2d@linaro.org>
Date:   Sat, 5 Aug 2023 20:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 00/11] mailbox/arm64/ qcom: rework compatibles for
 fallback
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230322174148.810938-1-krzysztof.kozlowski@linaro.org>
 <6c0a7f12-10d2-4a07-a07f-67ec0d39b279@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c0a7f12-10d2-4a07-a07f-67ec0d39b279@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/08/2023 14:21, Konrad Dybcio wrote:
> On 22.03.2023 18:41, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Changes since v2
>> ================
>> 1. Split fixes to separate patchset which is now dependency:
>>    https://lore.kernel.org/linux-arm-msm/20230322173559.809805-1-krzysztof.kozlowski@linaro.org/T/#t
>> 2. Add Ack
>> 3. No other changes, as discussion with Dmitry did not reach conclusion on incompatibility.
>>
>> Changes since v1
>> ================
>> 1. Rebase
>> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
>>    actually might take some clocks.
>> 3. Two new patches for SDX55.
>> 4. Minor corrections in bindings style.
>> v1: https://lore.kernel.org/all/20230202161856.385825-1-krzysztof.kozlowski@linaro.org/
>>
>> Description
>> ===========
>>
>> If entire approach is accepted (and correct), there are no dependencies and
>> patches can be picked independently.  Although the best in the same cycle, so
>> there will be no new `dtbs_check` warnings.
>>
>> Best regards,
>> Krzysztof
> Looks like this was only partially merged, resulting in schema warnings

There was discussion/disagreement about the bindings. DTS was applied,
thus it's partially limbo state...

Best regards,
Krzysztof

