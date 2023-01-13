Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760D5669E56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbjAMQjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbjAMQio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:38:44 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E2F7D270
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:36:25 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id y19so1699477ljq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARv8figi8s8tzOaiWUNqrDKY0qlMFLJZerLwG1Dn71Q=;
        b=GIMjJeYw2sRdmjpSfsJLAn1uXc9fEuTS3vJ2oa7r7L1nY0jXhPGdw7eDN4tLVmwhjH
         D06XGzb2p9Fi8+MDlq//gSH2S/2BFlZ9NlrHPQFe+72cuy6ARrJ9CU+kH2dolYizXvIl
         /vJ3osy4aVL5oc/47ntphkaW8xnxUDPwiK4DZ9RTLBW8NKE8s4LMWP8PG9c1RYqG8tyg
         UJqBwBN5BFuxUH/yG8R3UV9wA61d0wUiK0d+1Y0VzlqA9MzfBm8cFyq5QOAsodnBidsH
         ESBTSkf69AC2mInhhPZ0mGvUifIRAMdQzrogyJqf8ShTl832a3AT4qGQKaKvpCuj3Jcv
         wIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ARv8figi8s8tzOaiWUNqrDKY0qlMFLJZerLwG1Dn71Q=;
        b=5U5+ic7OcXjFY58HV25KduQ/7v/+eiTwMXLXZftbNEQ69gv97O/sKwRBFPMU2PPk0g
         9p6rbnCeVcjYAUWM82qs0I2lkyhBtBD/d2n8U2U37KqWHdcUtBJ8pOLAu/Fl3Yc57fbt
         FyW3y/57+SZS57htQOLY/ieYtdiW7X/8N4sPQJf6c1immRaEaxVi+iPCd6aseGxXBZDi
         5dJSBk03deDtwZRyo0X423HXWWT5qZE9p906ODsnVSZRN5vrliScRofT5FegZZzm5+pb
         SKniYAOYVW/2AjWadpV+qSJOcUIwKt+8hyzG0A/1v5Njm2AcZzdqWJwPUAghQ/5YJ5RY
         6HKg==
X-Gm-Message-State: AFqh2kpR1Qw4rzO7wjS+jOdJa9zc1mM5ToMOvjvKKj2PuKW++DdJImRJ
        aH1J6O81O1QgGDCwrez1fUPPsaN9ZIKHSEFh
X-Google-Smtp-Source: AMrXdXvAZOnJv3+TZv3qsSSH/oIhauLNLKjuFBKgeVqizfejAhEkTwX+s1Skjlrm2k430qbAIc9Wqw==
X-Received: by 2002:a2e:87c3:0:b0:289:1305:6cba with SMTP id v3-20020a2e87c3000000b0028913056cbamr2739163ljj.27.1673627783532;
        Fri, 13 Jan 2023 08:36:23 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id z11-20020a05651c022b00b0027fed440702sm128699ljn.98.2023.01.13.08.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:36:22 -0800 (PST)
Message-ID: <92b7955c-bcac-20ad-ccde-3eef17f092b6@linaro.org>
Date:   Fri, 13 Jan 2023 17:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] Revert "dt-bindings: power: rpmpd: Add SM4250
 support"
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20230113152232.2624545-1-konrad.dybcio@linaro.org>
 <20230113152232.2624545-2-konrad.dybcio@linaro.org>
 <e1782f36-5a28-1fe4-47d5-b3bc00317b57@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e1782f36-5a28-1fe4-47d5-b3bc00317b57@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 17:33, Krzysztof Kozlowski wrote:
> On 13/01/2023 16:22, Konrad Dybcio wrote:
>> SM4250 and SM6115 use a shared device tree and the RPMPDs are
>> identical. There's no need for a separate entry, so remove it.
>>
>> This reverts commit 45ac44ed10e58cf9b510e6552317ed7d2602346f.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 -
>>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ----------
>>  2 files changed, 11 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> index 633d49884019..5bb9f59d196f 100644
>> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
>> @@ -39,7 +39,6 @@ properties:
>>        - qcom,sdm845-rpmhpd
>>        - qcom,sdx55-rpmhpd
>>        - qcom,sdx65-rpmhpd
>> -      - qcom,sm4250-rpmpd
> 
> Yet, dedicated compatibles are usually recommended. Maybe this should be
> used with fallback:
> "qcom,sm4250-rpmpd", "qcom,sm6115-rpmpd"
The compatible has never been used so far and it's really the
same situation as SDM630/660 AFAIK, so I don't think it makes
much sense.

Konrad
> ?
> 
> Best regards,
> Krzysztof
> 
