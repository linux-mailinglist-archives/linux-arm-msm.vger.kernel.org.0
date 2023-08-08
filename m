Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D717277450D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 20:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjHHSgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 14:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbjHHSfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 14:35:47 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C65129
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 11:02:28 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9a2033978so92406461fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691517746; x=1692122546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkxbaJE1w03H/idk1NWqMQgLO1L7biBsn5GEkh/lQVQ=;
        b=HNydF0WB/LnOyhTes9xnZ3tSYDgW5FSNUJ2KGpbCPXv6n3ejmNQ6MQTIBKcoYcE5kA
         OpZrnQvwwJj2gRilzXUkK904zLml7dp1hNCNMZzeXuHMCn6hNWftZv0UEYp3MOJj/is5
         qzpkEFNTp9nR3btLZTWv3SphE3BTMTcgtTmzkF+tvpEg6+dqCrbg29QcHuvLnbXEVFTh
         TzqVgGP6Z1bIbYGDxOq+cOe1sneA9UUFiWVDTIHuIwK5d3BUIHTb8nwWun6VTPY6Zxnp
         q5eNWFohmE7Uwmnb4KvKoHhnwEQvIv4LAMIHNkj5HMSw9qbnb/1VmPz1hCRepMfZRR49
         PO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691517746; x=1692122546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkxbaJE1w03H/idk1NWqMQgLO1L7biBsn5GEkh/lQVQ=;
        b=NnLQVh8+Jr6fbLD4ggnp0ilEwuw1XdlwMwVk/1kp25wX2WUyVVclr7x5XFhRQETGHy
         hfT85P4ubkqHVd30m1Txdl1yYLDj5cFvKA7KwpcglfWPbl0ty1lqphRBSrvq4ICGzzjj
         Y5Hjl+l9SmPVKCMAR+saRZJvh+k7n32iEnd1LmfZZs9qvmHDbIlUFtCkCu48liJdDK8Q
         kMHkngwHIFMS5D8VSCM+mzAR4bUtuhdlElSmYp0tUJ1NwSCM6SOafqS7uEediVnDarVQ
         Vt6WBXunFAS6U2XAnET5DHE+UfA71XmoeTFMs0ME3X7yvvJBr3yLsmANJCApkhOPymxf
         6ACA==
X-Gm-Message-State: AOJu0YwnsREeSFrvRNXdMl9/HIes005Nc/XANFsZlSbnCvxWGaKfBHzO
        KCKm4rloqFle3xfmBANYiPws+exNhaPXKUyDBHs=
X-Google-Smtp-Source: AGHT+IGd2EkYnVmcbGVqenoYmJMzDW0/GB/8EFYGT8j/Y3vIO8hIfyRd/OSu9mbr2kbuJOvTwsbF3g==
X-Received: by 2002:a17:906:cc0f:b0:99b:d440:bf0b with SMTP id ml15-20020a170906cc0f00b0099bd440bf0bmr8097863ejb.67.1691477192381;
        Mon, 07 Aug 2023 23:46:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id c24-20020a170906155800b00993004239a4sm6147808ejd.215.2023.08.07.23.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:46:31 -0700 (PDT)
Message-ID: <1f20d778-cdae-d6d9-ac86-744dd45176d3@linaro.org>
Date:   Tue, 8 Aug 2023 08:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: clock: add qca8386/qca8084 clock and
 reset definitions
Content-Language: en-US
To:     Jie Luo <quic_luoj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230801085352.22873-1-quic_luoj@quicinc.com>
 <20230801085352.22873-3-quic_luoj@quicinc.com>
 <ef996a7e-6eba-4366-c3ea-0d08f2768e98@linaro.org>
 <cf9788f0-a115-5ff9-1195-f4f302551e04@quicinc.com>
 <d1172ed6-ee3b-83b6-1656-c91e35fbc2df@linaro.org>
 <f25e1043-6dfa-2dcc-2948-88025f4881d8@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f25e1043-6dfa-2dcc-2948-88025f4881d8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/08/2023 08:31, Jie Luo wrote:
> 
> 
> On 8/8/2023 1:57 PM, Krzysztof Kozlowski wrote:
>> On 08/08/2023 07:19, Jie Luo wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,nsscc-qca8k
>>>>
>>>> SoC name is before IP block names. See:
>>>> Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>
>>>> qca8k is not SoC specific. I don't know what you are documenting here,
>>>> but if this is a SoC, then follow SoC rules.
>>>>
>>>> If this is not SoC, it confuses me a bit to use GCC binding.
>>>>
>>>> Anyway, this was not tested, as pointed out by bot... Please test the
>>>> code before sending.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for the review comments.
>>> qca8383/qca8084 is a network chip that support switch mode and PHY mode,
>>> the hardware register is accessed by MDIO bus, which is not a SOC.
>>>
>>> But it has the self-contained clock controller system, the clock
>>> framework of qca8386/qca8084 is same as the GCC of ipq platform such as
>>> ipq9574.
>>
>> OK
>>
>>>
>>> would you help advise whether we can document it with the compatible
>>> "qcom,qca8k-nsscc"?
>>
>> For example:
>> qcom,qca8084-nsscc
>>
>> Best regards,
>> Krzysztof
>>
> Thanks Krzysztof for the suggestion.
> 
> i will document the compatible below.
> "qcom,qca8084-nsscc" for the PHY mode of device.
> "qcom,qca8386-nsscc" for the switch mode of device.

The clocks seem to be exactly the same for both, so use only one
compatible in the driver (the fallback) and oneOf in the bindings like:

https://elixir.bootlin.com/linux/v6.3-rc6/source/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml#L31

Best regards,
Krzysztof

