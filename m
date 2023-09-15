Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18107A1A0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 11:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233489AbjIOJLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 05:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbjIOJLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 05:11:37 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073E035A5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 02:11:04 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bf78950354so30836091fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769062; x=1695373862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqTeh00riXaBjNescHiFGhXjL1S5jjpClV66tpjmVfI=;
        b=nTkLXp/iw5Jy5fMjZkKVR6u37u+mb7TFRgJFat0bWpDakMZ5uxj2CMA57CyRU8W715
         0QIZ7op9VNMaleh+msQrvCf2iS4UgPOXfG8vJtDNMyaNbUv1FZ84ZkCM/TsE/bdtksRj
         vc9gJN80R1kub4L72NDUdl4lMSmpyJw50Fi5cFfPfEZ+9EotYy6CRPAAh6R1Om+QAsy+
         vUMSdIFb10Mb7qzFEOloLrpQNrzV1VCy9kF4EKAb/fCVNRi4JhczR2unqYqg3jiC2dhM
         BkH/aKo5xesgusbDsIl/OfWS67E+CRPNHWhjmA7I0QHDAYI4jT+7DTjBaPVhiZHQvzxw
         edhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769062; x=1695373862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqTeh00riXaBjNescHiFGhXjL1S5jjpClV66tpjmVfI=;
        b=Gpd3mgPGnxdX2Viy86ZFCHDNbCyZ8HLjZ/4fdFo6ux/sUhqMOcuK89okp404XRQA6c
         FGm0PLUgPaG8sKg6HXa06os+90N4PdK/FUpQYhoH85B2VEqrLhmCBVg0pSCiGOApsj80
         AZNgjhtPx4ca9/LjbISJcNPBytn8hmepziLs7gKn1p85msEMaTuBBsa1pWbJfQGq3drh
         +AJXR8PeWMYl4W8AUtFuC/32dIMI6sJIpc1RQO3Mylod09jl91I1SywWCIl2pY1yrz2K
         gej4EBuln8FQ3zAwSkildKX3u8Y4AC20pDe6i1PPJHMUvv6L5u4krBKeO/qN9iVvPmQx
         P73Q==
X-Gm-Message-State: AOJu0YxmXhCAs2G+08EY0vnzCqe21i6pnh846gYJT6h4Rp11Jdj9I4HK
        Y/jSrG5pHK/UsWTI2E1D9kubaA==
X-Google-Smtp-Source: AGHT+IHo7+SxnYzd0/bI0C3S/ETu/ji64wJvleV9efcp2lx53ggD6d7oaLyfrVGa7I3B7WTP908rSQ==
X-Received: by 2002:a2e:8ec1:0:b0:2bf:cbff:7017 with SMTP id e1-20020a2e8ec1000000b002bfcbff7017mr1089791ljl.11.1694769062001;
        Fri, 15 Sep 2023 02:11:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id oq14-20020a170906cc8e00b0099e12a49c8fsm2142599ejb.173.2023.09.15.02.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:11:01 -0700 (PDT)
Message-ID: <e026878f-9303-4cae-bcab-7ee69e32db2d@linaro.org>
Date:   Fri, 15 Sep 2023 11:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 4/8] dt-bindings: arm-smmu: Add compatible for SM4450
 SoC
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        catalin.marinas@arm.com
Cc:     geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
        quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, kernel@quicinc.com
References: <20230915021509.25773-1-quic_tengfan@quicinc.com>
 <20230915021509.25773-3-quic_tengfan@quicinc.com>
 <5a386be4-facc-8aef-aad7-da6508aa0505@linaro.org>
 <2c42d2b6-a838-4d8e-99f1-c08b0c8e4457@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2c42d2b6-a838-4d8e-99f1-c08b0c8e4457@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2023 09:15, Tengfei Fan wrote:
> 
> 
> 在 9/15/2023 3:11 PM, Krzysztof Kozlowski 写道:
>> On 15/09/2023 04:15, Tengfei Fan wrote:
>>> Add the SoC specific compatible for SM4450 implementing arm,mmu-500.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> index cf29ab10501c..b57751c8ad90 100644
>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>> @@ -47,6 +47,7 @@ properties:
>>>                 - qcom,sdx55-smmu-500
>>>                 - qcom,sdx65-smmu-500
>>>                 - qcom,sdx75-smmu-500
>>> +              - qcom,sm4450-smmu-500
>>>                 - qcom,sm6115-smmu-500
>>>                 - qcom,sm6125-smmu-500
>>>                 - qcom,sm6350-smmu-500
>>> @@ -70,6 +71,7 @@ properties:
>>>                 - qcom,sc8180x-smmu-500
>>>                 - qcom,sc8280xp-smmu-500
>>>                 - qcom,sdm845-smmu-500
>>> +              - qcom,sm4450-smmu-500
>>
>> Isn't there comment just few lines above your edit? Comment saying DON'T?
> yes, I saw this "DON'T" comment, but if I remove "qcom,sm4450-smmu-500" 
> from sm4450.dtsi and this arm,smmu.yaml, will get DT check warning about 

Why would you remove it?

> this, this warning cannot be find after add "qcom,sm4450-smmu-500" from 
> sm4450.dtsi and this arm,smmu.yaml, so update this patch again.

What does the comment say? Why are you adding it to the enum which asks
- do not add to this enum, but add to other above and below?


Best regards,
Krzysztof

