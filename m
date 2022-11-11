Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6D0625CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 15:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234087AbiKKOXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 09:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbiKKOWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 09:22:52 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF96391D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 06:21:52 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id x21so4668846ljg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lizn4t8CzEeOAb2NOrW1eGO8GRE54jSk5eHBfoX7CCY=;
        b=qir1itbo7SLIojVnuniP/lKKgJq9TuBceKLm30rtveqOll+AEFS4SYwDX4QIuW3shO
         x4jQasyhXZxNK8ihBC5IaSbf1Ljx3yzyW5V162Usc7AqfrOVidzgLPtuuHT02iGN3JkO
         vvkE6cs+a0r7VD5AT09LEk61y6Up0KR2+zspM0mhnP086VsRZyE3XDwbUvD4ia/CFMmA
         fV5iRUzLSUPA2brZROmg3t+gbc2j1NQ1IgzLyAac+9ZqqHiib1IkNQYRWoUvfOq8Ge/G
         fTDiT39cOrORSMM2/4utHqkBzg1eAAalO/kxDP/rXWYe3+htkHUkE0rXs7201C+LoVdb
         ATdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lizn4t8CzEeOAb2NOrW1eGO8GRE54jSk5eHBfoX7CCY=;
        b=TJMjSihkCdGsRWxFL5G13/6fVzGUE326qRVeYT0fbD6jL5fkzlF/rOPWSbCN4LPqjl
         AXHdHzboCcS2wDDsmzGlV09HKyK2+5E6YImsi7XgfCXVC6/3nb4rMbK00uwZbQ5mBHU2
         agdJLKh9s4tovvF2PmfERVncOHcnBVba9edZQqoDwWyBNIR63ln6l/M3IbMBz3WA3B17
         c3VOvfNgEwpIBOI2pknY7fHIrNR9pEamXLCh2B+0RZPYl4OcrZs8zT6DsOXyw8JEziVH
         q7bbwFOK4fPTJXJwxdGac1K02C7B7s3y7/+VuhG+AffjOqHmd81tHYtwnYC8UP6/9Iw7
         G7Xw==
X-Gm-Message-State: ANoB5pnykCsQ4ADgTYLcbqK1nGnefknmiT1FlP5ZBbCkvAmEUX6+uh7t
        +MzqyUGZ8NJSDeWqK/W35JSsnw==
X-Google-Smtp-Source: AA0mqf4u3FCA6Q7ZvIrElwMeHaK0OuMQqzCJGs2cKMdDsSQw3WGaxaJ6fIuzSGrVM7neb1mCUweWPw==
X-Received: by 2002:a2e:9d51:0:b0:277:1e3e:fa60 with SMTP id y17-20020a2e9d51000000b002771e3efa60mr675393ljj.496.1668176510760;
        Fri, 11 Nov 2022 06:21:50 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b0048a8c907fe9sm347374lfo.167.2022.11.11.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 06:21:50 -0800 (PST)
Message-ID: <f7be60a6-ea1d-838a-ef50-d324d918db86@linaro.org>
Date:   Fri, 11 Nov 2022 15:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/10] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@qti.qualcomm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
 <166817308876.3060199.17933327732327950670.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166817308876.3060199.17933327732327950670.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 14:30, Rob Herring wrote:
> 
> On Fri, 11 Nov 2022 12:35:39 +0100, Krzysztof Kozlowski wrote:
>> The APR/GPR nodes are organized like:
>>
>>   apr-or-gpr-device-node <- qcom,apr.yaml
>>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>
>> The schema for services (apr-gpr-service@[0-9]) already grows
>> considerably and is still quite not specific.  It allows several
>> incorrect combinations, like adding a clock-controller to a APM device.
>> Restricting it would complicate the schema even more.  Bringing new
>> support for sound on Qualcomm SM8450 and SC8280XP SoC would grow it as
>> well.
>>
>> Simplify the qcom,apr.yaml by splitting the services to a shared file
>> which will be:
>> 1. Referenced by qcom,apr.yaml with additionalProperties:true,
>> 2. Referenced by specific bindings for services with
>>    additionalProperties:false (not yet in this commit).
>>
>> While moving the code, add also required 'reg' and
>> 'qcom,protection-domain' to further constrain the bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 +++++++++
>>  .../bindings/soc/qcom/qcom,apr.yaml           | 108 +-----------------
>>  MAINTAINERS                                   |   2 +-
>>  3 files changed, 58 insertions(+), 106 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@3: failed to match any schema with compatible: ['qcom,q6core']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@4: failed to match any schema with compatible: ['qcom,q6afe']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@7: failed to match any schema with compatible: ['qcom,q6asm']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@8: failed to match any schema with compatible: ['qcom,q6adm']

This is expected. I should have mention maybe in commit msg that these
compatibles are being removed in this commit and re-added in further
commits. Change is therefore not entirely bisectable, but should be
easier for review.

If desired, I can squash these commits.

Best regards,
Krzysztof

