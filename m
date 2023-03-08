Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E405B6B0193
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjCHIea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjCHIdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:33:50 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C106B4A1FC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:33:14 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id o12so62448792edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ue0NqDmKrjgpyNEx5D7GNBoWR2ZdRspc55ofKNDbaw=;
        b=C8SNgoJ/P6E60Py0cw5PYuEs80mFIR9Wf8aoG4b95aZpDnbLg69MXom/fSLfaGO2GJ
         z6KDDfgc3PRo/Zd8r/pqWQR7cpQu7b/lZiScEgULeBDUn//+7nlC3bER3y+wP9aSKoS6
         qrLQtBuJQaqk+VbSb8FCnCOTESErvHfQPpPJ/L6xC5rKjfauETnj0cywgb44mK1rCTru
         kQoJLdqP2jPYPjUtNv80uO8iv/978zHV2n0qQc+klDnO3dGW0w8GKEhUOyqGL+vvcd/7
         nWgSxeVBVtBQ2I8d4Jb6IEkFG0M88Rg1RaRqxvTV8+YixtmOgWVu70F2Sgle64iKl5gq
         D58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ue0NqDmKrjgpyNEx5D7GNBoWR2ZdRspc55ofKNDbaw=;
        b=DwhpEn3SEZ09ND0kbwinTR+ERK6zMvmYlsRvzgZgU3DCnqH1Nelqw6JsphyrYZ+5qU
         jVLMq0xuTH5w4T5JV7VzP9Kz4O3xy9JQFAKaIS9dYCvfVS+dXX6QOkS74KIzJsMwu1VJ
         RYxSEbc7haDAa96gHI6lnGLsMrRWx9cfI0CWwb7VexirXX8giJjMn3ezHw3lITUwGwAZ
         oHYidPLm/VqW69GwPUL7v02hkXfVCCs3EsXu80LwB38nquq21ojdKfBgQHfJCt690lOL
         CTrJ/UEYFbxmbO3wWDoqI/5o6blm5qLEqYurU1M2GPwyaMb1ZJAhKCHdua5RtaRaiBEb
         o+6Q==
X-Gm-Message-State: AO0yUKXl8E0Dq0YI7aHbRHprf3xQAZ+X9RogwL8IsPKwO03UJYl7+Xg+
        0EwaXbE89MV/QYAuZ0cEgBAqZA==
X-Google-Smtp-Source: AK7set9nTlKFw37WTDFhuyvxUVC/TCbnN4R/TKLSbNeBQ/9zLgDXA9as1YOus3xU65mYSxvowAm8iQ==
X-Received: by 2002:a05:6402:687:b0:4ac:d90e:92b with SMTP id f7-20020a056402068700b004acd90e092bmr22535880edy.10.1678264391957;
        Wed, 08 Mar 2023 00:33:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id k26-20020a508ada000000b004af6b93f00asm7761947edk.23.2023.03.08.00.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:33:11 -0800 (PST)
Message-ID: <0c1ad8a7-a0a7-9a92-369c-3ede2ef82e58@linaro.org>
Date:   Wed, 8 Mar 2023 09:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 16/19] arm64: dts: qcom: sdm845: Add "mhi" region to the
 PCIe nodes
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
References: <20230306153222.157667-1-manivannan.sadhasivam@linaro.org>
 <20230306153222.157667-17-manivannan.sadhasivam@linaro.org>
 <1587de60-244a-d97f-dea0-36fe8a5be2c2@linaro.org>
 <20230308083152.GD134293@thinkpad>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308083152.GD134293@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 09:31, Manivannan Sadhasivam wrote:
> On Tue, Mar 07, 2023 at 09:20:23AM +0100, Krzysztof Kozlowski wrote:
>> On 06/03/2023 16:32, Manivannan Sadhasivam wrote:
>>> The "mhi" region contains the debug registers that could be used to monitor
>>> the PCIe link transitions.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index 479859bd8ab3..0104e77dd8d5 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -2280,10 +2280,11 @@ opp-4 {
>>>  		pcie0: pci@1c00000 {
>>>  			compatible = "qcom,pcie-sdm845";
>>>  			reg = <0 0x01c00000 0 0x2000>,
>>> +			      <0 0x01c07000 0 0x1000>,
>>>  			      <0 0x60000000 0 0xf1d>,
>>>  			      <0 0x60000f20 0 0xa8>,
>>>  			      <0 0x60100000 0 0x100000>;
>>> -			reg-names = "parf", "dbi", "elbi", "config";
>>> +			reg-names = "parf", "mhi", "dbi", "elbi", "config";
>>
>> Indexes are fixed, thus this breaks other users of DTS.
>>
> 
> Are you suggesting to move the "mhi" to the end and do not care about sorting?

Yes, any new entry must be added at the end. What sorting do you mean?
Entries are not sorted.


Best regards,
Krzysztof

