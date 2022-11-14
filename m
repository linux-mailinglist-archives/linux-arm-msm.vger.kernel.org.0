Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB765627C1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 12:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbiKNLVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 06:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbiKNLU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 06:20:59 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE69F3AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 03:17:25 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u24so16727437edd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8pES7IsZVUbl8+LhDhShwm4arEjrSbe83lTsNM+KPg=;
        b=D5kzxychZ3pxexlom2JaTTTusM/qK3F46+bwz1+x2vE4AF0ViC8ZyMy7rCo4g7biGI
         5YiRYKgDZ4aBz9x5T8VnasUSaW6pNkUZ6WBEE8sifJ4bhLbbGAQqKGkFpqOptApIEWJr
         XrADxeS2yDGw3qA0VCp4EJ+ol06eZMyTlA2pAodHxBwOU30sll8ITTgn5AiiC+PrCm81
         YgIEdN3L1mWnSptDtSz4Hdr0ngrkn9ytLsq+RRiWF0liqfrJSA+NQSN1a5Jjcvwb+wVd
         XfBwmQO3tWA7VInGYLdi4lhr3sj7SToOug7MMN3Yyp5X24CQXNZ0dOREI1f+l6g9mrOG
         Tqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8pES7IsZVUbl8+LhDhShwm4arEjrSbe83lTsNM+KPg=;
        b=1gXq5ZczzJQ+wJ0x41bKr0K0mxWfJA/cdejGvngstlyvo5+31rI4CYJT+gPG4+XsdG
         sSc5abH4cQ45PckU/k5owd4xNh6Yx5cVOnY8U+hUFYXLuhO/MVOvD7/hBJWcx/cLakh1
         O7mzy8Uw98b5dPa1mS3SSb1cyRHKVIh70Vy7KiT8Y0+6ydLvPvwecmMmlP/9qo5JqaoQ
         C7dKWWWdYp6xVCk8/hLJMSXauewEuMYSZQT+S1o/FIdPy6OtFvadw7QR7iAFBiKIYQCg
         ubsv1c+YqQGx2SSrw/PHBUbme0bjTPOuvq5FiKAkZahifxxPsxBlBh7nlpxLr6YvCudb
         +DMQ==
X-Gm-Message-State: ANoB5pnG8BuB4bL77xK/6wGKjxxmO5IxN7DfMwfjg3kud9z+LHjG/KFE
        DcKRvIKHZc86A55msbWcGKTM9bel42a5DrJh
X-Google-Smtp-Source: AA0mqf7qHDoSYh2IZeKUknP+RpTfX9q5RR3hokssKyLTQg/5n3ZtUd5tXeiCIxPoqFpzolkJiz//Dg==
X-Received: by 2002:a50:cc83:0:b0:461:9183:834b with SMTP id q3-20020a50cc83000000b004619183834bmr10617422edi.196.1668424644385;
        Mon, 14 Nov 2022 03:17:24 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b007ae0fde7a9asm3975901eja.201.2022.11.14.03.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 03:17:23 -0800 (PST)
Message-ID: <a4b160d8-0faa-3f4c-a925-0beaf6ace721@linaro.org>
Date:   Mon, 14 Nov 2022 12:17:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/9] dt-bindings: arm-smmu: Allow up to 3 power-domains
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221114104222.36329-1-konrad.dybcio@linaro.org>
 <20221114104222.36329-2-konrad.dybcio@linaro.org>
 <6fa8e3ea-2113-d930-96bc-3726d53e5bcd@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <6fa8e3ea-2113-d930-96bc-3726d53e5bcd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 14/11/2022 12:01, Krzysztof Kozlowski wrote:
> On 14/11/2022 11:42, Konrad Dybcio wrote:
>> Some SMMUs require that a vote is held on as much as 3 separate PDs
>> (hello Qualcomm). Allow it in bindings.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Changes since v1:
>> - Add minItems
>>
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 9066e6df1ba1..82bc696de662 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -159,7 +159,8 @@ properties:
>>             through the TCU's programming interface.
>>   
>>     power-domains:
>> -    maxItems: 1
>> +    minItems: 0
> It cannot be 0.
>
> minItems: 1
>
> Anyway you still need to restrict it per variant, as I said in previous
> version.

Hm.. I'm not entirely sure what you mean.. Should I add a list of 
compatibles
that are allowed to have 3 power-domains and leave it as it was before 
in the
'else' case?


Konrad

>
> Best regards,
> Krzysztof
>
