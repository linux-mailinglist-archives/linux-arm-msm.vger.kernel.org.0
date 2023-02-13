Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E390C694DC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 18:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjBMRMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 12:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjBMRMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 12:12:20 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE7D2B470
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 09:12:17 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id nh19-20020a17090b365300b00233ceae8407so5316484pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 09:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EKMkxCSBt1daduBxN91tfS7EXIyN4ih9xz0ONJyhj2w=;
        b=bykOFJzd3cj/FkdgDryJESiP5UsFHZwPDgqkeBE/u4BlN7WJKxoA68TljgQUEUtCRp
         IsTHDPOjLQ4nTPeIs1OUrB8D4jdS03GzZ3YtXx8/Henb287BNY8jFiBEbYcqBd561Nzb
         on89bCLGNhoFz0eVcMvQcUWGikLdfcYS89qR9d4x+KPW9NpZJi5B/TMK11JHPmiGqJQR
         3TlxBvoqPQbYUaN2WoFm7r15OL3+OcLfwJmfKcmoYz5vvmoFnDql73cmtVh9kJ0WIIL5
         ILoyz7Qmf8h38/RsoSqTkEo88ff4CUvdlsfWfGEazpmjvupPH05G+DdaAlDb3/x7Uz48
         4wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKMkxCSBt1daduBxN91tfS7EXIyN4ih9xz0ONJyhj2w=;
        b=rfZ97T6D3lea6w6UpGj4gdr3lg5D+vwl7sGXYEgNN8hnU4IBqmwFSFoL2CiZMLLH6p
         xHT1b5aiOfRp3TBBUSTvVMUR459nUuJG4SL/sejQMfbPfL1UoX9+gsy6EkZshvPdliM6
         jioyNp1AG28xxhoRR3gdzGFZX9MSNGC9ob552jkHKywRLi4tIAkIeReiDgIdp3OM6d0V
         seb7nHsbhsW+FDK6AZtQX4ilZw4WcgRkgfUghc2xVaZJS/zSfH4ljm8RiMcnrHth1GH3
         MZZ6iklVX7dN5JNwj6EcZxQlZmqUXYHPyb7wF8B/TSM8KAjq8ejMNpuTxHh4eqNCjX/M
         JIoA==
X-Gm-Message-State: AO0yUKUn80+Ng8eqrShWa6xw1P/0SdDZHo8G3S3XxRQ4oJV4HiB7kBk4
        roFQTg+p/EGgOZ7pUDsffslSEQ==
X-Google-Smtp-Source: AK7set+RuwCaZVWLLB/xLfmyY36OAq/hYz+CM4pCNgAMk1o2P0Qe/nyzXgohCpn9XJCl9gJQYcmXrQ==
X-Received: by 2002:a17:902:c613:b0:19a:743e:b152 with SMTP id r19-20020a170902c61300b0019a743eb152mr10620246plr.63.1676308337292;
        Mon, 13 Feb 2023 09:12:17 -0800 (PST)
Received: from ?IPV6:2401:4900:1c61:e00:1f91:2:8c63:d600? ([2401:4900:1c61:e00:1f91:2:8c63:d600])
        by smtp.gmail.com with ESMTPSA id jj9-20020a170903048900b00198d5c7cafasm5047395plb.156.2023.02.13.09.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 09:12:16 -0800 (PST)
Message-ID: <a93b0dac-6a5a-309a-e4c0-7b0d0911bd4c@linaro.org>
Date:   Mon, 13 Feb 2023 22:42:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v9 11/14] arm64: dts: qcom: sm8250: add description of
 Qualcomm Crypto Engine IP
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
Content-Language: en-US
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <ce42e852-fb73-08ca-48c7-9826ab087289@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On 2/9/23 8:00 PM, Vladimir Zapolskiy wrote:
> Hi Bhupesh,
> 
> On 2/9/23 14:21, Bhupesh Sharma wrote:
>> Hi Vladimir,
>>
>> On 2/9/23 12:07 AM, Vladimir Zapolskiy wrote:
>>> Add description of QCE and its corresponding BAM DMA IPs on SM8250 SoC.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++++
>>>    1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index e59c16f74d17..d8698d18223e 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -2215,6 +2215,30 @@ ufs_mem_phy_lanes: phy@1d87400 {
>>>                };
>>>            };
>>> +        cryptobam: dma-controller@1dc4000 {
>>> +            compatible = "qcom,bam-v1.7.0";
>>> +            reg = <0x0 0x01dc4000 0x0 0x24000>;
>>> +            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>> +            #dma-cells = <1>;
>>> +            qcom,ee = <0>;
>>> +            qcom,controlled-remotely;
>>> +            num-channels = <8>;
>>> +            qcom,num-ees = <2>;
>>> +            iommus = <&apps_smmu 0x586 0x11>,
>>> +                 <&apps_smmu 0x596 0x11>;
>>> +        };
>>> +
>>> +        crypto: crypto@1dfa000 {
>>> +            compatible = "qcom,sm8250-qce", "qcom,sm8150-qce";
>>> +            reg = <0x0 0x01dfa000 0x0 0x6000>;
>>> +            dmas = <&cryptobam 6>, <&cryptobam 7>;
>>> +            dma-names = "rx", "tx";
>>> +            interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 
>>> &mc_virt SLAVE_EBI_CH0>;
>>> +            interconnect-names = "memory";
>>> +            iommus = <&apps_smmu 0x586 0x11>,
>>> +                 <&apps_smmu 0x596 0x11>;
>>> +        };
>>> +
>>>            tcsr_mutex: hwlock@1f40000 {
>>>                compatible = "qcom,tcsr-mutex";
>>>                reg = <0x0 0x01f40000 0x0 0x40000>;
>>
>> This patch was part of the v7 arm64 dts fixes I sent out - see [1].
> 
> thank you for pointing it out, so there are two different v7 series of 
> related
> patches, as it's stated in the cover letter I based my v8 on top of 
> linux-crypto
> changes [*], and this particular change was developed independently from 
> yours.
> 
> And so, there are some differences, can you please comment on them?
> 
> - My change does not have 'interconnects' property under 
> dma-controller@1dc4000
>    device tree node, I believe it is not needed, but please correct me 
> here.
> - My change uses DMA channel number taken from the downstream code [**], is
>    there a reason to use different ones like in your change?
> - My change has a shorter list of IOMMUs also copied from the same 
> downstream
>    code, is there a reason to use a different extended list like in your 
> change?
> - On my end I have to retest your change without 'num-channels' and 
> 'qcom,num-ees'
>    properties, since this also seems as an important difference between 
> two patches.
> 
> Nevertheless, thank you again for bringing my attention to a different 
> patch
> series, I'll reuse the changes from it, and also publish all of them 
> together and
> in a separate changeset as Krzysztof suggested.
> 
>> Probably you can use it as a base and make the changes (interconnect
>> property for the BAM DMA node and qce-compatible names) directly there
>> and include it in your patch series.
> 
> [*]  
> https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org/
> [**] 
> https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/arch/arm64/boot/dts/qcom/kona.dtsi?h=LA.UM.8.12.3.1&id=f3dd4aaeb34438c877ccd42f5a48ccd554dd765a#n2979
> 
>> [1].
>> https://lore.kernel.org/linux-arm-msm/20220921045602.1462007-3-bhupesh.sharma@linaro.org/

Now that you mention it, I am a bit confused. My v7 series had 3 
sub-series (one each for the arm64 dts + defconfig, crypto & dma tree):

- 
https://lore.kernel.org/linux-arm-msm/20220921045602.1462007-1-bhupesh.sharma@linaro.org/
- 
https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org/
- 
https://lore.kernel.org/linux-arm-msm/20220921030649.1436434-1-bhupesh.sharma@linaro.org/

Where do you propose the v9 of the dma tree patch? I think you have
already clubbed the v9 arm64 dts patchset with this series
(you have left out the defconfig patch from there as it is already 
merged and the sm8150 dts change, so that I can send it later), right?

Having said that, with only the v9 crypto series you shared, I am not
able to bring up crypto on either sm8250-mtp or (with one dts patch 
added) on sa8155p-adp board(s). So, do I need to make other changes 
(include patches from my earlier series) to get the same working?

Thanks,
Bhupesh
