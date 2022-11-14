Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56DF628660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 17:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbiKNQ7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 11:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbiKNQ7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 11:59:09 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDB4DDF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 08:58:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g12so20333912lfh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ky6pMQvRONZVOpXOzzVJ/Yrj7b7SsY3DwGhKO3TyKDI=;
        b=KiwHvFvs5FTx2Ns2wjm8nyJt/2QGsG7J1I7jBrEP8ulyplTvam57JpsemWKsa4IANV
         Vh9WZTRlIH/pQdxw9+Y63655uGk6pKeomGl0pLOIV5DTbBEjyBlj+xxpETDp3Ot9qeS3
         E0eEDnFkvnEoPylvCbwCzAhla68kLvZ0rFnVbGK8zWDKHONgsuGP5pv92+CXcS2SNYLz
         heNYKB6k7A5WLTVqhcORRCNueXz/CsoDcgBEaV1WFDWgxZ5sO0JnKHkgMO3F9q8RSIcY
         BDFFVO80RKSWQT35AYbyX3yoYGNVydUCTIfKu3yVFOh/jy6s6Dr2foCqWpyk4NSaTqvH
         9MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky6pMQvRONZVOpXOzzVJ/Yrj7b7SsY3DwGhKO3TyKDI=;
        b=wpVIqW2LWdC5ol6qOBLgMeWaphmbVg4XNSktG1OvN3VDJLOaiZys/kjUBjw+r9Az74
         XXLuI8BTeOSIBDSOFk2oCYTPwzsZ1Bj0S+wG/Yz+0s8U/xGReNBuwJerhUjBT8dslC8w
         eN+Nb03upBVbpRxFt4RPb71ZOl9AG3ZLYx4Em8bU2++duht5sdmwkFqxf/GCbyT6INOV
         aV86Q+5/TYza0vdmXDu1kFcg9T1UXSbMhyEycRXPmAeEF5rkrWaZtLIB7aFugdZLR0ye
         qyE8DC7t3RlL/QvjpYtENVP1d4CkMZDbDM+jIJzK2gOXP3y3FuuaeLpMgu5I8fWxHnVV
         dw4Q==
X-Gm-Message-State: ANoB5pkTyfwnbFNdhN/lgO2WT+abWq+f1RL2eaj1VO14CRlzTFpLJgPW
        CT/ZAUB8v73YHgfkgXoIyIGrBw==
X-Google-Smtp-Source: AA0mqf7/d/ExzMhN+Xf9uSDjhga3dRHbNfCb1ccpBEzobEMejcOy7EpBl3YlBur6KVu73zCB44OYgg==
X-Received: by 2002:a05:6512:718:b0:4b1:b7d0:21e4 with SMTP id b24-20020a056512071800b004b1b7d021e4mr4701191lfs.72.1668445102292;
        Mon, 14 Nov 2022 08:58:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a0565120ea700b004a91df49508sm1897033lfb.177.2022.11.14.08.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:58:21 -0800 (PST)
Message-ID: <878402e7-7f80-31c7-3a6b-989a6ca29841@linaro.org>
Date:   Mon, 14 Nov 2022 17:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/9] dt-bindings: arm-smmu: Allow up to 3 power-domains
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <a4b160d8-0faa-3f4c-a925-0beaf6ace721@linaro.org>
 <0121fc03-b027-7659-5e6e-b42089c9888d@linaro.org>
 <12578e05-ced9-e5f7-7922-0af2f2159333@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <12578e05-ced9-e5f7-7922-0af2f2159333@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/11/2022 16:53, Konrad Dybcio wrote:
> 
> On 14/11/2022 14:00, Krzysztof Kozlowski wrote:
>> On 14/11/2022 12:17, Konrad Dybcio wrote:
>>> On 14/11/2022 12:01, Krzysztof Kozlowski wrote:
>>>> On 14/11/2022 11:42, Konrad Dybcio wrote:
>>>>> Some SMMUs require that a vote is held on as much as 3 separate PDs
>>>>> (hello Qualcomm). Allow it in bindings.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>> Changes since v1:
>>>>> - Add minItems
>>>>>
>>>>>    Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>>> index 9066e6df1ba1..82bc696de662 100644
>>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>>> @@ -159,7 +159,8 @@ properties:
>>>>>              through the TCU's programming interface.
>>>>>    
>>>>>      power-domains:
>>>>> -    maxItems: 1
>>>>> +    minItems: 0
>>>> It cannot be 0.
>>>>
>>>> minItems: 1
>>>>
>>>> Anyway you still need to restrict it per variant, as I said in previous
>>>> version.
>>> Hm.. I'm not entirely sure what you mean.. Should I add a list of
>>> compatibles
>> Yes and limit it to maxItems: 1 for "else".
> 
> I tried adding:
> 
> 
> 
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
>                - qcom,sm6375-smmu-500
>      then:
>        properties:
>          power-domains:
>            minItems: 3
>            maxItems: 3
>      else:
>        properties:
>          power-domains:
>            maxItems: 1
> 
> 
> Right under the nvidia reg if-else in the allOf, but dtbs_check throws 
> errors like:
> 
> 
> /home/konrad/linux/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: 
> iommu@5040000: 'power-domains' does not match any of the regexes: 
> 'pinctrl-[0-9]+'
> 
> 
> Any clues as to why?

I don't know what code do you have there, but generic pattern is:

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L38

Best regards,
Krzysztof

