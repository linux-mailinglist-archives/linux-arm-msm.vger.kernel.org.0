Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D836960A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 11:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjBNKYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 05:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjBNKYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 05:24:33 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC1111669
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 02:24:30 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id sa10so38788301ejc.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZHT6Rt4ZDtQeMBtQT9LeqSvKhh++IkPVxaFNqjM/b0=;
        b=fF7HcsM9R/9n4og0aw5vO4JbtYdD1f2zAjEz0rKOxzd91n+/JfbYXwhCjShiJ3oni2
         4ealE3Ukwaj1ve0BYr7u/BuShuzW7jOLICOJkWSk2igOFfr3bqrSYlQIOHaq4kVpi2t/
         z5n93zSZAE8Bo/zExlRg0y5Yvt6yozBvcF0WfrEU2L+Fj6tClB+T0uN4kqRmKluG8F4m
         Q3yTgZAMRFT3OMdk6Msy3ldZ4Fw/NIJ74+8LW94ESkhF2ZJ4AL2NQ1+4zzduH4pq7isF
         /LeipJUkKUjR/fyFfbdmafL2bULNDM/YlOPw32Z9TtlD638kv6OueBE4CbspLlK4nWTj
         OcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZHT6Rt4ZDtQeMBtQT9LeqSvKhh++IkPVxaFNqjM/b0=;
        b=Sd6fOCIifEfP8kWpzTkxKWC3RSkBRA/oyx98MZQwgOr6c2OiueBBTwUH0S939oiWV3
         +0ipgVT6mDhJaMoXj9JOpffrggi0Aq1aIN42GzGABCEswRXAPSlXm4Ob1/P8rVMLsd/n
         4rovz+MLrCHoDdtVvNnGI1/4cRtL0mc871JiaNJgZuPapLOslj4RtlrxVFb7VDQttBpw
         eYV6bHfeqP5KQqlIrZGHphYy2InYv4hK27hOC8IDXo+3zQlRwAvAooEOzDVw1rtC8sOO
         MONUoHSWQWtWOR3vA9u68RH/hWySIg6ldgCXdX3ndFerlPGINDXbWz8B8gfsjQvdKo/3
         RTsw==
X-Gm-Message-State: AO0yUKWqtvIUVVFqtWfZrFESmBif/hamBkcL8do5uVp18v1Uy2I6r8d6
        wBzYqM8hJcni8RTXkJrqGDtAvw==
X-Google-Smtp-Source: AK7set/4xkcfgqfnguoD7bUbGVid6jjWKjrlVNK0y/C5yxLuGODFu75sXV9DXiCEePPcN+iUKLPAog==
X-Received: by 2002:a17:906:739d:b0:8ae:a4db:ba6e with SMTP id f29-20020a170906739d00b008aea4dbba6emr1907627ejl.2.1676370269129;
        Tue, 14 Feb 2023 02:24:29 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id se26-20020a170906ce5a00b0086621d9d9b0sm8021581ejb.81.2023.02.14.02.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 02:24:28 -0800 (PST)
Message-ID: <731af3cf-6f18-caf9-ef65-ec73b0744ad9@linaro.org>
Date:   Tue, 14 Feb 2023 12:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v9 11/14] arm64: dts: qcom: sm8250: add description of
 Qualcomm Crypto Engine IP
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-12-vladimir.zapolskiy@linaro.org>
 <7b38331c-3b29-03c1-fbed-f5799d11ca1f@linaro.org>
 <ce42e852-fb73-08ca-48c7-9826ab087289@linaro.org>
 <a93b0dac-6a5a-309a-e4c0-7b0d0911bd4c@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <a93b0dac-6a5a-309a-e4c0-7b0d0911bd4c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhupesh,

On 2/13/23 19:12, Bhupesh Sharma wrote:
> Hi Vladimir,
> 
> On 2/9/23 8:00 PM, Vladimir Zapolskiy wrote:
>> Hi Bhupesh,
>>
>> On 2/9/23 14:21, Bhupesh Sharma wrote:
>>> Hi Vladimir,
>>>
>>> On 2/9/23 12:07 AM, Vladimir Zapolskiy wrote:
>>>> Add description of QCE and its corresponding BAM DMA IPs on SM8250 SoC.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>>     arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++++
>>>>     1 file changed, 24 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> index e59c16f74d17..d8698d18223e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>>> @@ -2215,6 +2215,30 @@ ufs_mem_phy_lanes: phy@1d87400 {
>>>>                 };
>>>>             };
>>>> +        cryptobam: dma-controller@1dc4000 {
>>>> +            compatible = "qcom,bam-v1.7.0";
>>>> +            reg = <0x0 0x01dc4000 0x0 0x24000>;
>>>> +            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>>> +            #dma-cells = <1>;
>>>> +            qcom,ee = <0>;
>>>> +            qcom,controlled-remotely;
>>>> +            num-channels = <8>;
>>>> +            qcom,num-ees = <2>;
>>>> +            iommus = <&apps_smmu 0x586 0x11>,
>>>> +                 <&apps_smmu 0x596 0x11>;
>>>> +        };
>>>> +
>>>> +        crypto: crypto@1dfa000 {
>>>> +            compatible = "qcom,sm8250-qce", "qcom,sm8150-qce";
>>>> +            reg = <0x0 0x01dfa000 0x0 0x6000>;
>>>> +            dmas = <&cryptobam 6>, <&cryptobam 7>;
>>>> +            dma-names = "rx", "tx";
>>>> +            interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0
>>>> &mc_virt SLAVE_EBI_CH0>;
>>>> +            interconnect-names = "memory";
>>>> +            iommus = <&apps_smmu 0x586 0x11>,
>>>> +                 <&apps_smmu 0x596 0x11>;
>>>> +        };
>>>> +
>>>>             tcsr_mutex: hwlock@1f40000 {
>>>>                 compatible = "qcom,tcsr-mutex";
>>>>                 reg = <0x0 0x01f40000 0x0 0x40000>;
>>>
>>> This patch was part of the v7 arm64 dts fixes I sent out - see [1].
>>
>> thank you for pointing it out, so there are two different v7 series of
>> related
>> patches, as it's stated in the cover letter I based my v8 on top of
>> linux-crypto
>> changes [*], and this particular change was developed independently from
>> yours.
>>
>> And so, there are some differences, can you please comment on them?
>>
>> - My change does not have 'interconnects' property under
>> dma-controller@1dc4000
>>     device tree node, I believe it is not needed, but please correct me
>> here.
>> - My change uses DMA channel number taken from the downstream code [**], is
>>     there a reason to use different ones like in your change?
>> - My change has a shorter list of IOMMUs also copied from the same
>> downstream
>>     code, is there a reason to use a different extended list like in your
>> change?
>> - On my end I have to retest your change without 'num-channels' and
>> 'qcom,num-ees'
>>     properties, since this also seems as an important difference between
>> two patches.
>>
>> Nevertheless, thank you again for bringing my attention to a different
>> patch
>> series, I'll reuse the changes from it, and also publish all of them
>> together and
>> in a separate changeset as Krzysztof suggested.
>>
>>> Probably you can use it as a base and make the changes (interconnect
>>> property for the BAM DMA node and qce-compatible names) directly there
>>> and include it in your patch series.
>>
>> [*]
>> https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org/
>> [**]
>> https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/arch/arm64/boot/dts/qcom/kona.dtsi?h=LA.UM.8.12.3.1&id=f3dd4aaeb34438c877ccd42f5a48ccd554dd765a#n2979
>>
>>> [1].
>>> https://lore.kernel.org/linux-arm-msm/20220921045602.1462007-3-bhupesh.sharma@linaro.org/
> 
> Now that you mention it, I am a bit confused. My v7 series had 3
> sub-series (one each for the arm64 dts + defconfig, crypto & dma tree):
> 
> -
> https://lore.kernel.org/linux-arm-msm/20220921045602.1462007-1-bhupesh.sharma@linaro.org/
> -
> https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org/
> -
> https://lore.kernel.org/linux-arm-msm/20220921030649.1436434-1-bhupesh.sharma@linaro.org/

Thank you, I will follow these series, the interconnects on DMA BAM
series is slipped from my attention, however I am able to run QCE
without adding interconnects to DMA BAM on available to me hardware.

> Where do you propose the v9 of the dma tree patch? I think you have
> already clubbed the v9 arm64 dts patchset with this series
> (you have left out the defconfig patch from there as it is already
> merged and the sm8150 dts change, so that I can send it later), right?
> 
> Having said that, with only the v9 crypto series you shared, I am not
> able to bring up crypto on either sm8250-mtp or (with one dts patch
> added) on sa8155p-adp board(s). So, do I need to make other changes
> (include patches from my earlier series) to get the same working?

No, the shared v9 is complete, and I test it on top of the linux-next.

I'm able to successfully test QCE by running 'cryptsetup benchmark' on
RB5 hardware, the involvement of QCE and DMA BAM IPs can be checked
either by looking at bam_dma interrupt numbers from /proc/interrupts,
by adding qcrypto.dyndbg=+p into the kernel command line or by
registered algos and priorities found at /proc/crypto:

[    9.515729] qcrypto 1dfa000.crypto: Crypto device found, version 5.5.0

I will be glad to know your opinion about the technical difference
between our two different sm8250.dtsi changes, please find my queries
in the previous email.

--
Best wishes,
Vladimir
