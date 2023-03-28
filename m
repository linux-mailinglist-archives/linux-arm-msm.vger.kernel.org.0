Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0CE6CC06A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjC1NQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbjC1NPm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:15:42 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7611AC171
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:15:19 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 20so12541905lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680009317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFUZOc8ZEwak8WRi0j0O+m3N0q/XFOkAwH3YWAw9NPE=;
        b=wPXe/B7bLC7Q8iYiFOpWBT0F0zTeB1KHNzr5A5wV9l5Iqifz/7PUXNaGg7jSbt5I8l
         u8J8kN/vmzS/ThoN6U6TR6P9XCp4E0UAc9t/XucYjGw0Xs3rSJ6w/YrCrssFJKpCdSut
         cB3W7VzqudfyW2aZrAmb+wmDroDWoszBkNhuVX88Y86BsQVWThaz1iAI94vztDGTiM+J
         m46CdmlJOOq+jjHSKDGqptZeVFl81hlBzD6vOs6uh+7mOls5jcy8BtgY7T57/8h2I2PE
         UlsHrI6Nu/MuJdXEEWgcjXnLVBMpBW8pIrpnPr7PtodKOdvbUgBJRJHCFe3/3gbJjhOJ
         +UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680009317;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sFUZOc8ZEwak8WRi0j0O+m3N0q/XFOkAwH3YWAw9NPE=;
        b=3Lm4paHdwwSpEGvbg5Nft8KkH5BMGltwVhJDkqskw9fTpthOBS+AZy24vhTD8vdZPY
         NdYTqQPOUQP50CF5IL6zeY9nNVQftdsXfV5prTTZ2B1+mMfbUtKpo8TcDIT7FjuemhUa
         wpptJ/DzaNtuSyXJszLciJaiMBENl5X+UMxDYDeLvWeIvQPY14F4EEsbZsA02Huz1kiZ
         oDE6xmEI9A3ss8B++db5nQVmw2S7mPY9PWV1wcHcmqjWdnYhuT16oqq34+NR7iuFU0N8
         VrbrmcJrDXemntcDcHHtMN60BlEAP0XRah1zN+JDT+j0TAgJCuKVGpM0ajOdwi53GZ6h
         M5cg==
X-Gm-Message-State: AAQBX9daOqu70hk3x3tQ3YirjJAhtLpNLExs182+By5ZKe6AwM7jG+M5
        0SeTsDmm+nL70J/PjGfgU94mWQ==
X-Google-Smtp-Source: AKy350ZjO6YnemiWQKPiw4cCrAPogTUdzVJJ/ojlAlrTHAix2E/a0mpL0mk1AbVYlaM6TY8UCft8uA==
X-Received: by 2002:a2e:b163:0:b0:295:d7a8:559b with SMTP id a3-20020a2eb163000000b00295d7a8559bmr4614100ljm.10.1680009317633;
        Tue, 28 Mar 2023 06:15:17 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id n14-20020ac242ce000000b004e81fdac4a1sm5034720lfl.278.2023.03.28.06.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:15:17 -0700 (PDT)
Message-ID: <c1cb2a16-6839-657d-1234-801b6a4fb66c@linaro.org>
Date:   Tue, 28 Mar 2023 15:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: Introduce the SC8180x platform
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230325122444.249507-1-vkoul@kernel.org>
 <20230325122444.249507-11-vkoul@kernel.org>
 <bfc64e55-3c06-e36b-70cc-33a0303681be@linaro.org> <ZCEr5WnbvA2jkHLn@matsya>
 <5ad54197-3638-fc75-02ee-5c285fe4dabb@linaro.org> <ZCLn/m8GKVo7p/Ga@matsya>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZCLn/m8GKVo7p/Ga@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.03.2023 15:13, Vinod Koul wrote:
> On 27-03-23, 10:49, Konrad Dybcio wrote:
>> On 27.03.2023 07:38, Vinod Koul wrote:
>>> On 25-03-23, 13:34, Konrad Dybcio wrote:
> 
>>>>> +	cpus {
>>>>> +		#address-cells = <2>;
>>>>> +		#size-cells = <0>;
>>>>> +
>>>>> +		CPU0: cpu@0 {
>>>>> +			device_type = "cpu";
>>>>> +			compatible = "qcom,kryo485";
>>>>> +			reg = <0x0 0x0>;
>>>> Please add clocks = <&cpufreq_hw n>;
>>>>  
>>>>> +			enable-method = "psci";
>>>>> +			capacity-dmips-mhz = <602>;
>>>>> +			next-level-cache = <&L2_0>;
>>>>> +			qcom,freq-domain = <&cpufreq_hw 0>;
>>>
>>> You mean this or something else?
>> Check
>>
>> https://lore.kernel.org/lkml/20221102065448.GA10650@thinkpad/T/
> 
> Good point, thanks
> 
>>>>> +		compatible = "qcom,sc8180x-camnoc-virt";
>>>>> +		#interconnect-cells = <2>;
>>>>> +		qcom,bcm-voters = <&apps_bcm_voter>;
>>>>> +	};
>>>>> +
>>>>> +	mc_virt: interconnect-mc-virt {
>>>> Please be consistent with your naming.
>>>
>>> Are you referring to adding -0 for this?
>> I'm not sure which is preferred (-n vs -name), there's a mixed bag
>> upstream.. Krzysztof?
> 
> Either ways this should be consistent, so camnoc_virt:
> interconnect-camnoc_virt makes sense rather than arbitrary -0
Yeah, just remember that underscores are forbidden in node names,
use hyphen instead!

Konrad
> 
>>>>> +		compatible = "qcom,sc8180x-mc-virt";
>>>>> +		#interconnect-cells = <2>;
>>>>> +		qcom,bcm-voters = <&apps_bcm_voter>;
>>>>> +	};
>>>>> +
>>>>> +	qup_virt: interconnect-qup-virt {
>>>>> +		compatible = "qcom,sc8180x-qup-virt";
>>>>> +		#interconnect-cells = <2>;
>>>>> +		qcom,bcm-voters = <&apps_bcm_voter>;
>>>>> +	};
>>>>> +
>>>> [...]
>>>>
>>>>> +	reserved-memory {
>>>>> +		#address-cells = <2>;
>>>>> +		#size-cells = <2>;
>>>>> +		ranges;
>>>>> +
>>>>> +		hyp_mem: hyp-region@85700000 {
>>>> the -region seems a bit unnecessary in all of these nodes
>>>
>>> This is reserved for hyp, I think we should add it here so that we dont
>>> touch this piece..?
>> I meant the '-region' bit in the node names
>>
>> (label: name@unit-address)
> 
> ack, thanks for clearing my misunderstanding
> 
