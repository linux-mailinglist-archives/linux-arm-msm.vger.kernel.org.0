Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06F8E6B3FFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 14:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjCJNPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 08:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCJNPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 08:15:20 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B33EE63D7
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:15:16 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id g17so6558317lfv.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b+n9NGdOuKJ/lQmTS5gpSL6Q6vZc7KKgv3f3l7G4SY4=;
        b=BqmiVCzl+i9PBTrf9o/LwDynbaz6bpaQmIZ7b0iuFloM/rZZyGLXZIMi/Tqk8r7kyv
         E3V0ICZOzTdCoZZvW6gMjg9Fc6n0hCku0MCJzmOo8qWzObZkrn3WCigvxX4480Ew1MBk
         bg0oA74zxCOD8fTTBGZjituG2F5XzwEp8L+qNCGvd6fPrENMWWFtNvywrA5I8HO34Pu5
         +UNLbGcl7X8e5IzIsx18H4uxi10pry3AmUYNMgPtvrXtSgkAwz96SwrdAOFOTPyGI1Mq
         86DrwG07BV9Y2UJajRVm1mR6189tMHA7wMPGzdbN9fP4SLQ6q1xOGjrlfbkq1CVwwsqZ
         H4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b+n9NGdOuKJ/lQmTS5gpSL6Q6vZc7KKgv3f3l7G4SY4=;
        b=Ru+GkiIIXeULfDYdcyqH0BhnjguT9AtxxKpaQb6gvE+9jUL4jO+Bv7lt+LPShDEZkb
         usOEoDZhyDdqNmlGRZFn6DE2Bt7etk3aCiQXkCjOqPEe5HNclDjfz2oRSQSa75ddzSWW
         cLVuX5tgHAIAizKWyJF37xg/YuPlvozc7Y041NAa7GSySUE1addqaHUNi77x46BA/0OQ
         RQAKU4rwZo+D+80vDSS+is5qky5QaBhPpSsTXLHR/0bieZi2c4cNmQViyNCjjY1+T5PI
         CajSA92pPclPmQtln/USXjXRenlXGridhaIV1k0ksm8Bz0hI3pAqbofdaY0wH+40BI66
         xZwA==
X-Gm-Message-State: AO0yUKVyFMe4ISXIyfvjqmskH/jaf6aG3a2lmd+JXhS/rw2StJ5crKLX
        ctgkTIfa31wAaUV+yFE8lEKYKA==
X-Google-Smtp-Source: AK7set8Te4gM0dM2pxmOufcNoL+0U6S5YJgvr/3PgwTvf15YEiH7lBfAWdLZwDNeKIkkvMltkHL/Vg==
X-Received: by 2002:ac2:549a:0:b0:4dd:8fd3:5cce with SMTP id t26-20020ac2549a000000b004dd8fd35ccemr8156383lfk.57.1678454114766;
        Fri, 10 Mar 2023 05:15:14 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m12-20020ac24acc000000b004e817c666eesm234056lfp.193.2023.03.10.05.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 05:15:13 -0800 (PST)
Message-ID: <4390532c-cf94-0030-8997-1a3522272f4f@linaro.org>
Date:   Fri, 10 Mar 2023 14:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/15] arm64: dts: qcom: sm6375: Add CPUCP L3 node
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
 <20230303-topic-sm6375_features0_dts-v1-9-8c8d94fba6f0@linaro.org>
 <139384c3-5ebc-84b6-9109-b98e4690ca68@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <139384c3-5ebc-84b6-9109-b98e4690ca68@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.03.2023 04:14, Sibi Sankar wrote:
> Hey Konrad,
> 
> Thanks for the patch.
> 
> On 3/4/23 03:28, Konrad Dybcio wrote:
>> Enable the CPUCP block responsible for scaling the L3 cache.
> 
> FWIW, the patch just enables the l3 provider, the CPUCP block would
> already be up at this point. You would also want to include the
> expansion for CPUCP at least once in your patch.
Right, I didn't think much about this, but I should probably reword
this and the bindings commit to mention that CPUCP != L3 scaler within.

Konrad
> 
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sm6375.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
>> index 90f18754a63b..59d7ed25aa36 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
>> @@ -1505,6 +1505,15 @@ frame@f42d000 {
>>               };
>>           };
>>   +        cpucp_l3: interconnect@fd90000 {
>> +            compatible = "qcom,sm6375-cpucp-l3", "qcom,epss-l3";
>> +            reg = <0 0x0fd90000 0 0x1000>;
>> +
>> +            clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
>> +            clock-names = "xo", "alternate";
>> +            #interconnect-cells = <1>;
>> +        };
>> +
>>           cpufreq_hw: cpufreq@fd91000 {
>>               compatible = "qcom,sm6375-cpufreq-epss", "qcom,cpufreq-epss";
>>               reg = <0 0x0fd91000 0 0x1000>, <0 0x0fd92000 0 0x1000>;
>>
