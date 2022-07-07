Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2905656A3E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 15:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234799AbiGGNlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 09:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235833AbiGGNlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 09:41:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33D42870C
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 06:41:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a11so22285600ljb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=jRAjZXY6+UUMfN9anTAWHy/uwmogMIm8H3PLiHy9OEI=;
        b=nNBRS+FZwsMAmv+unQDonMckzxWyz51mGvxoj5yAx5CBRCb1ZAlNEP4YGf0HIQB7Jj
         xzLlWnvMnTQ1LsabcoJH6BEzf6slgc8cjTwSn4KkCm5lOW03zo8juX8AwcwOee9RhnNk
         8KHlFFAjDimv0YupF2OA6QTJ/yN77Tvq7WkMyQ4J0BCduoT64mvaVfGlog1xQrLUtizz
         te475qDsuU8gJFcRQMiMsg/dtTOvhJw+7w1YHNyg1Jhn0LA5Wi8LqgxdNRCA5xk47Xqc
         zJDU7HtTYt9HT6oaIv0wukY83stC9PGpul9zEL08tkFJErE+t1GlpOS5tYIStKOwWzHk
         oK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=jRAjZXY6+UUMfN9anTAWHy/uwmogMIm8H3PLiHy9OEI=;
        b=7l3VLUekhsR4u+mICcyFiV4iPgxay4Xe/DWqI06y1XbYMUQM1ZjN+A08kuyOsKY4XO
         PRoScA8TyItQTtArRDQFb5EHssWpAMlJWV7NaEx6rm+lNI46Cdk4BxbyXYRid7l3Lyii
         x+SnYPoy5+URFUYjBWZin6aeNkqOIic8b5bZccE6oHjY2hsN4NVIUNiedHiCsRFRBMZC
         OGIKcuBQfbh+eBVc8kIKTjTFr9Pi9JBhaNulu2JfUnKYEvek6zVXDTsKdv0kCrOU335A
         jzZHsKHELxOlYHraNCMicCm0vfKuRIG+pjoq961BVyweOr2L74sVGSGLPZED80X1ufkz
         BtUA==
X-Gm-Message-State: AJIora8kO9c63Kjo6/w0iIfApN27/CYLOvzGNsCz1HJ2pTdaW1qXPMlt
        djtPe/HtgiO/vrkHzNDgVF85YA==
X-Google-Smtp-Source: AGRyM1t4UqVaNKTbjrPlQkcNgoKuyx+oGPkBeDq++hP317Wk1kHIWC4XtoISid7vnJuGGeLqCFO/dQ==
X-Received: by 2002:a2e:92c6:0:b0:255:84cb:4eea with SMTP id k6-20020a2e92c6000000b0025584cb4eeamr25815297ljh.204.1657201264047;
        Thu, 07 Jul 2022 06:41:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e20-20020a05651c04d400b0025a64093a9esm6794026lji.117.2022.07.07.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 06:41:03 -0700 (PDT)
Message-ID: <2fbe9cf7-7ed8-ccc8-b0bc-26d358cec927@linaro.org>
Date:   Thu, 7 Jul 2022 16:41:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/10] dt-bindings: PCI: qcom: Fix msi-interrupt
 conditional
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629141000.18111-1-johan+linaro@kernel.org>
 <20220629141000.18111-3-johan+linaro@kernel.org>
 <cab173ce-9c7c-9985-277c-3498d82b8400@linaro.org>
In-Reply-To: <cab173ce-9c7c-9985-277c-3498d82b8400@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/07/2022 16:34, Dmitry Baryshkov wrote:
> On 29/06/2022 17:09, Johan Hovold wrote:
>> Fix the msi-interrupt conditional which always evaluated to false due to
>> a misspelled property name ("compatibles" in plural).
>>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Fixes: 6700a9b00f0a ("dt-bindings: PCI: qcom: Do not require resets on 
> msm8996 platforms")

Ugh, I was thinking about a different chunk (which also has this issue), 
so please ignore the Fixes.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
>> ---
>>   Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml 
>> b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>> index ed9f9462a758..a1b4fc70e162 100644
>> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>> @@ -628,7 +628,7 @@ allOf:
>>       # On older chipsets it's always 1 msi interrupt
>>     - if:
>>         properties:
>> -        compatibles:
>> +        compatible:
>>             contains:
>>               enum:
>>                 - qcom,pcie-msm8996
> 
> 


-- 
With best wishes
Dmitry
