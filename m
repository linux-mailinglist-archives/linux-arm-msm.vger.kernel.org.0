Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426F8622A84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiKIL3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiKIL3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:29:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD7D11A3E
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:29:38 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j16so25134477lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/eHh0xL7CYIGUWhXivIMtZvb/iQgqEYZzutitDq/uw=;
        b=skGItY1IwzgEVh/gH9rczDuQsQCD+X2FPOsjkHbDxfuivgxTCL3n0F2lDKH1/ejMoX
         zcPJJhztokjTBG59HPvjd5dlBg+9LKpDQxnNGzCQOcFJqi8x3DcHyQqOOULoKk5dLoHq
         VIhdnf+ErS7heItJ/JBl3aW8rtO83vdwOWrA7MSKeJ0lZk7H/9QvF6F5AGuqCa3KrWGz
         UACakJCtDC/kcENZgXk5QMKkESc4CLDLiR8Lg+Q7kckpaWULXvgMnkSvVg4eN/hW/TZO
         tUuPLWpiuPqVQudBpkMJT4Z2x4zNmHwDvZ2DKs+jsuuieekme4l0PTf2kTZKXjYkUo8/
         Pj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/eHh0xL7CYIGUWhXivIMtZvb/iQgqEYZzutitDq/uw=;
        b=su9VOWdLOzAi3eF2U2pUl8hqJvR0eAqNixA7taGVFSFNKbgabx69dQlH2Mm8ECpZ8G
         s7b2w3iWaGLlCFFO7ZqKhCbX8ht4TmFn3heOeKEStJsgDPrlhC8cNop4SQo5QxEhQAEG
         1RTLsfejM2taR1nqY6+erhiDhvRSz8Z0w4nDAz3JFnqvS25XKL6nsG/Ux40oF0LpaF7R
         AAa/Ti7I7efWJY6MpEqBMoBvEnbcDBU5Xdv9edyduJkY63RC0/K+coG+EdOuQmpq8c/b
         UBBtfO21CHMtbht/+YKWw19+dYu4oX6kcry14mHrlorOdyHeSm7r1W8h/FUJKR0BJsB/
         ngSg==
X-Gm-Message-State: ACrzQf2OcA9eiuuf1UkeLKMSKyEnzLBz9yM/pNsI48puPuZHoJf0HqOK
        BZ/AORzn/U+cHFHqySWclbtpkA==
X-Google-Smtp-Source: AMsMyM47GhZ9W4QWXH0F1Vug99kOljw1oLTlABCtgSPJgadLN6kSpqOoyYZftgTYbhANovH9RMQjuQ==
X-Received: by 2002:a05:6512:b0e:b0:4ae:23c9:1b32 with SMTP id w14-20020a0565120b0e00b004ae23c91b32mr19763685lfu.246.1667993377128;
        Wed, 09 Nov 2022 03:29:37 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id e12-20020a19500c000000b004a2cd6d5ad6sm2178537lfb.19.2022.11.09.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:29:36 -0800 (PST)
Message-ID: <1749c742-5908-2fba-fccd-2e03d83518c8@linaro.org>
Date:   Wed, 9 Nov 2022 12:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND PATCH] dt-bindings: PCI: qcom,pcie-ep: correct
 qcom,perst-regs
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20221109105555.49557-1-krzysztof.kozlowski@linaro.org>
 <1a5b2c83-dad2-3683-d374-d431d2049b67@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1a5b2c83-dad2-3683-d374-d431d2049b67@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/11/2022 12:06, Dmitry Baryshkov wrote:
> On 09/11/2022 13:55, Krzysztof Kozlowski wrote:
>> qcom,perst-regs is an phandle array of one item with a phandle and its
>> arguments.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>> index 977c976ea799..5aa590957ee4 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
>> @@ -47,8 +47,10 @@ properties:
>>                    enable registers
>>       $ref: "/schemas/types.yaml#/definitions/phandle-array"
>>       items:
>> -      minItems: 3
>> -      maxItems: 3
>> +      - items:
>> +          - description: Syscon to TCSR system registers
>> +          - description: Perst enable offset
>> +          - description: Perst separateion enable offset
> 
> typo: separation.
> 
> With that fixed:
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

Best regards,
Krzysztof

