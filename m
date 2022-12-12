Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E21B649B11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiLLJZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiLLJYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:24:38 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838966332
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:24:36 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so17574176lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EznmZZW413d4IOuEq8wYFCNmDT9PHojOCYMBYHp2g5E=;
        b=IBh7ouhLXENe9SRGockZaGE5/s0f44opfNysFmKnHl3Uqq0BVOP27M8fW5se2eFjC7
         noCETxHcn5k59zOl1F2mY7QexyrEbKGWC8MW5ZzUX2SGAVBbNvlHE9cXwOlHQxn/ikNK
         53UbqzOSs80qESQXB01royoiPdSmTxHbSZsOYd/EhIjk/TCZj3vgA3xcDmrs0XC8wMpQ
         QOQvnvDXx/XXHYLBROLmANR285Up6VXFVnAQA0oQKD8OUzpKUDqreMVympvF84cPP9qa
         42FHAGL4zxVgYLyFamzR7M8gUY5LRi/crda8VgjKTYMQt1uSQdU4e1pvPYjNeyKitUSR
         IvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EznmZZW413d4IOuEq8wYFCNmDT9PHojOCYMBYHp2g5E=;
        b=rq9drezv28R/MIp2+wJh/MWyyePpN7bU9AAQjhXaWRH0iKI9XgXVT1kKHIPvVsENYi
         hKLBFIFfdnbqVeAsN/kKXdFu0W9KDavo0mFbTROC20Moun+dalBXpF0ynb/6RWKSPVt6
         Ru+p1ybFRZrOU+Te1MF8VnWexqNfQUMc8dmPZHVC3dRcRBdDZ5IY9MLNG5MD74Lq2ZLu
         5zWbH1o5kbO9tcmcZrWy2bL3PiNjIGWWNL5Cql01bVxTeLO/8Nu9V6Gv5tVzyWLpvC5H
         r9DsPAhLOnpQZigiaS2V1i3OjEk8TskVWnJ4QSaaOb4xfaS9l9i+j42sLpoVIf8djz/t
         riwQ==
X-Gm-Message-State: ANoB5plTGQD2l3Zugu82AhmMtpJXwcszSBCdJZm04Jbw/g9azpVZySqv
        sPPrVbd7o8UfAkGNCJzlTLv+CuiGkaaT8kK+eZQ=
X-Google-Smtp-Source: AA0mqf4jzGpnGv9kfjsXX4or7HmtRTdueSOnKS/rrmLlRNaoMtcN69rtZq1FrmlYXcUiEgSabdgr4Q==
X-Received: by 2002:a05:6512:2613:b0:4b4:e14a:ec80 with SMTP id bt19-20020a056512261300b004b4e14aec80mr5323580lfb.44.1670837074921;
        Mon, 12 Dec 2022 01:24:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e11-20020a05651236cb00b004b5241dc8cfsm1584986lfs.10.2022.12.12.01.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:24:34 -0800 (PST)
Message-ID: <f6c9c9f1-fc10-d9d8-fef1-c43c04d209a8@linaro.org>
Date:   Mon, 12 Dec 2022 10:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: move QUP and QSPI opp
 tables out of SoC node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221210115704.97614-1-krzysztof.kozlowski@linaro.org>
 <f38f0bfd-858e-1995-167c-de747e57597b@linaro.org>
 <77246ee3-8ff5-1049-6b2a-d8925bc87b33@linaro.org>
 <4522aa1d-99fd-66ad-70bb-d39d9f5ca878@linaro.org>
 <2cf2eae9-9f32-05c5-c802-1d8cec9b4802@linaro.org>
 <6df8fc01-9fa1-d63d-25fb-ffa6683f4cb6@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6df8fc01-9fa1-d63d-25fb-ffa6683f4cb6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/12/2022 10:18, Konrad Dybcio wrote:
> 
> 
> On 12.12.2022 10:17, Krzysztof Kozlowski wrote:
>> On 12/12/2022 10:15, Konrad Dybcio wrote:
>>>>>> +
>>>>>> +	qup_opp_table: opp-table-qup {
>>>>>> +		compatible = "operating-points-v2";
>>>>>> +
>>>>>> +		opp-75000000 {
>>>>>> +			opp-hz = /bits/ 64 <75000000>;
>>>>>> +			required-opps = <&rpmhpd_opp_low_svs>;
>>>>>> +		};
>>>>>> +
>>>>>> +		opp-100000000 {
>>>>>> +			opp-hz = /bits/ 64 <100000000>;
>>>>>> +			required-opps = <&rpmhpd_opp_svs>;
>>>>>> +		};
>>>>>> +
>>>>>> +		opp-128000000 {
>>>>>> +			opp-hz = /bits/ 64 <128000000>;
>>>>>> +			required-opps = <&rpmhpd_opp_nom>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>>  	memory@80000000 {
>>>>> Sidenote: memory@ should be moved above opp-*, alphabetically
>>>>>
>>>>> For this:
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> You sure? Because before there is already opp for cpu...
>>> Which are called opp-table-cpuN and not cpuN-opp-table, 'm' comes
>>> before 'o'.
>>
>> So you want to have broken order?
>> opp-table-cpu
>> memory
>> opp-table-qup
>> ?
>>
>> They are at least all together in my patch.
> No, I meant:
> 
> memory
> opp-table-cpu
> opp-table-qup

OK, I'll correct the opp-table-cpu/memory order in separate patch.

Best regards,
Krzysztof

