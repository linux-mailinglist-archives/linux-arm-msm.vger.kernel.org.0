Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEB045953E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 20:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbhKVTFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 14:05:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231418AbhKVTFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 14:05:41 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F583C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 11:02:34 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id j17so17539226qtx.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Nov 2021 11:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kBpXytAzQOrR99XHaH1+0ENKC++IaMvvkd2HL9FLmDM=;
        b=v4W7QOGy8F2YhyeuUeOPOePlsyW9AUPUc+OG+/EFR1YBVqvGfmpMJFIsPLMEndCtVI
         YGda/bGcwaUcyI0JWsM4rKcubyDgi4I0iyQBMsWGKBXLNBliRr8iIWXvz5DgvnOVc6AO
         N9nurGC8AIEHlRZKjqWi/tRgLw3iFy3ObbyR47QydRuQ564Kzw7FSMzupo+JtHYBQeCV
         /l85kO9G1yvlik2h4emwGGNzpPjaPspD5BiOmiiMW/1vBvU5Rh6Ab594iaeC8xDACDD1
         ptNT4ZP0jyPMI/J9qEbgkTb1nMF8K9HMxvdAY/oX+wdooZj6o5NSDMsahgAHlykYgTm5
         P1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kBpXytAzQOrR99XHaH1+0ENKC++IaMvvkd2HL9FLmDM=;
        b=XIJX80WAWMuB+gjiWV3+YaD2dzsd5oj7JQ5UGaIC6ZzMBA2qhgTibXTHM57fGqBdDn
         d5vDL5Lqecm/sOTn5yD+ZP4hRqiXHBg/HaaPlHLpu7LHQ00ln0p6LrPdNxhq3kuuHVpr
         +f06Emjc7wzPJPz80nLpaX9YyvzP1gXqy3QYPCUYvBbR5YOoHJEIkkTVUEdIEmX2qpG9
         CI1cA6QO53xJ8CP1pbZZ48QKjcNHEQt2QMMn6tL001x6P3WiKBuQ3RXZhynF+m/PX+HO
         KU69vinfhSFQTYLFCMW4GUkba2TfqNvqPjKNEUJLDN6QmOJKpYD2/DgzNCvIghhOitKQ
         CL7g==
X-Gm-Message-State: AOAM530gazcT/yzMrJ9bt3O3FVjIX0ORL9S3X04JsWV7HwsGuEKvhWRK
        OA5ILpZXSk7hvhiw4sLEr9TRGQ==
X-Google-Smtp-Source: ABdhPJwcZtekkNIUs+HfPqaFBu7jzNmcir8UQo38Go9pn5lmznRdmIK3c8wP6+K/OuiqwqmnWNOBXA==
X-Received: by 2002:ac8:7e83:: with SMTP id w3mr34592572qtj.160.1637607753338;
        Mon, 22 Nov 2021 11:02:33 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id x4sm4988078qtw.44.2021.11.22.11.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Nov 2021 11:02:32 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add CPU opp tables
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211110215330.74257-1-thara.gopinath@linaro.org>
 <9bb87351-9a1f-6171-5788-92c41075869b@linaro.org>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <033ff218-bdae-0759-2837-38863341f62a@linaro.org>
Date:   Mon, 22 Nov 2021 14:02:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9bb87351-9a1f-6171-5788-92c41075869b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/19/21 8:23 PM, Dmitry Baryshkov wrote:
> On 11/11/2021 00:53, Thara Gopinath wrote:
>> Add OPP tables to scale DDR and L3 with CPUs for SM8250 SoCs.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

-- 
Warm Regards
Thara (She/Her/Hers)
> 
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 314 +++++++++++++++++++++++++++
>>   1 file changed, 314 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi 
>> b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index d12e4cbfc852..7c35415a05be 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -100,6 +100,9 @@ CPU0: cpu@0 {
>>               dynamic-power-coefficient = <205>;
>>               next-level-cache = <&L2_0>;
>>               qcom,freq-domain = <&cpufreq_hw 0>;
>> +            operating-points-v2 = <&cpu0_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_0: l2-cache {
>>                   compatible = "cache";
>> @@ -119,6 +122,9 @@ CPU1: cpu@100 {
>>               dynamic-power-coefficient = <205>;
>>               next-level-cache = <&L2_100>;
>>               qcom,freq-domain = <&cpufreq_hw 0>;
>> +            operating-points-v2 = <&cpu0_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_100: l2-cache {
>>                   compatible = "cache";
>> @@ -135,6 +141,9 @@ CPU2: cpu@200 {
>>               dynamic-power-coefficient = <205>;
>>               next-level-cache = <&L2_200>;
>>               qcom,freq-domain = <&cpufreq_hw 0>;
>> +            operating-points-v2 = <&cpu0_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_200: l2-cache {
>>                   compatible = "cache";
>> @@ -151,6 +160,9 @@ CPU3: cpu@300 {
>>               dynamic-power-coefficient = <205>;
>>               next-level-cache = <&L2_300>;
>>               qcom,freq-domain = <&cpufreq_hw 0>;
>> +            operating-points-v2 = <&cpu0_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_300: l2-cache {
>>                   compatible = "cache";
>> @@ -167,6 +179,9 @@ CPU4: cpu@400 {
>>               dynamic-power-coefficient = <379>;
>>               next-level-cache = <&L2_400>;
>>               qcom,freq-domain = <&cpufreq_hw 1>;
>> +            operating-points-v2 = <&cpu4_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_400: l2-cache {
>>                   compatible = "cache";
>> @@ -183,6 +198,9 @@ CPU5: cpu@500 {
>>               dynamic-power-coefficient = <379>;
>>               next-level-cache = <&L2_500>;
>>               qcom,freq-domain = <&cpufreq_hw 1>;
>> +            operating-points-v2 = <&cpu4_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_500: l2-cache {
>>                   compatible = "cache";
>> @@ -200,6 +218,9 @@ CPU6: cpu@600 {
>>               dynamic-power-coefficient = <379>;
>>               next-level-cache = <&L2_600>;
>>               qcom,freq-domain = <&cpufreq_hw 1>;
>> +            operating-points-v2 = <&cpu4_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_600: l2-cache {
>>                   compatible = "cache";
>> @@ -216,6 +237,9 @@ CPU7: cpu@700 {
>>               dynamic-power-coefficient = <444>;
>>               next-level-cache = <&L2_700>;
>>               qcom,freq-domain = <&cpufreq_hw 2>;
>> +            operating-points-v2 = <&cpu7_opp_table>;
>> +            interconnects = <&gem_noc MASTER_AMPSS_M0 &mc_virt 
>> SLAVE_EBI_CH0>,
>> +                    <&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
>>               #cooling-cells = <2>;
>>               L2_700: l2-cache {
>>                   compatible = "cache";
>> @@ -260,6 +284,296 @@ core7 {
>>           };
>>       };
>> +    cpu0_opp_table: cpu0_opp_table {
>> +        compatible = "operating-points-v2";
>> +        opp-shared;
>> +
>> +        cpu0_opp1: opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            opp-peak-kBps = <800000 9600000>;
>> +        };
>> +
>> +        cpu0_opp2: opp-403200000 {
>> +            opp-hz = /bits/ 64 <403200000>;
>> +            opp-peak-kBps = <800000 9600000>;
>> +        };
>> +
>> +        cpu0_opp3: opp-518400000 {
>> +            opp-hz = /bits/ 64 <518400000>;
>> +            opp-peak-kBps = <800000 16588800>;
>> +        };
>> +
>> +        cpu0_opp4: opp-614400000 {
>> +            opp-hz = /bits/ 64 <614400000>;
>> +            opp-peak-kBps = <800000 16588800>;
>> +        };
>> +
>> +        cpu0_opp5: opp-691200000 {
>> +            opp-hz = /bits/ 64 <691200000>;
>> +            opp-peak-kBps = <800000 19660800>;
>> +        };
>> +
>> +        cpu0_opp6: opp-787200000 {
>> +            opp-hz = /bits/ 64 <787200000>;
>> +            opp-peak-kBps = <1804000 19660800>;
>> +        };
>> +
>> +        cpu0_opp7: opp-883200000 {
>> +            opp-hz = /bits/ 64 <883200000>;
>> +            opp-peak-kBps = <1804000 23347200>;
>> +        };
>> +
>> +        cpu0_opp8: opp-979200000 {
>> +            opp-hz = /bits/ 64 <979200000>;
>> +            opp-peak-kBps = <1804000 26419200>;
>> +        };
>> +
>> +        cpu0_opp9: opp-1075200000 {
>> +            opp-hz = /bits/ 64 <1075200000>;
>> +            opp-peak-kBps = <1804000 29491200>;
>> +        };
>> +
>> +        cpu0_opp10: opp-1171200000 {
>> +            opp-hz = /bits/ 64 <1171200000>;
>> +            opp-peak-kBps = <1804000 32563200>;
>> +        };
>> +
>> +        cpu0_opp11: opp-1248000000 {
>> +            opp-hz = /bits/ 64 <1248000000>;
>> +            opp-peak-kBps = <1804000 36249600>;
>> +        };
>> +
>> +        cpu0_opp12: opp-1344000000 {
>> +            opp-hz = /bits/ 64 <1344000000>;
>> +            opp-peak-kBps = <2188000 36249600>;
>> +        };
>> +
>> +        cpu0_opp13: opp-1420800000 {
>> +            opp-hz = /bits/ 64 <1420800000>;
>> +            opp-peak-kBps = <2188000 39321600>;
>> +        };
>> +
>> +        cpu0_opp14: opp-1516800000 {
>> +            opp-hz = /bits/ 64 <1516800000>;
>> +            opp-peak-kBps = <3072000 42393600>;
>> +        };
>> +
>> +        cpu0_opp15: opp-1612800000 {
>> +            opp-hz = /bits/ 64 <1612800000>;
>> +            opp-peak-kBps = <3072000 42393600>;
>> +        };
>> +
>> +        cpu0_opp16: opp-1708800000 {
>> +            opp-hz = /bits/ 64 <1708800000>;
>> +            opp-peak-kBps = <4068000 42393600>;
>> +        };
>> +
>> +        cpu0_opp17: opp-1804800000 {
>> +            opp-hz = /bits/ 64 <1804800000>;
>> +            opp-peak-kBps = <4068000 42393600>;
>> +        };
>> +    };
>> +
>> +    cpu4_opp_table: cpu4_opp_table {
>> +        compatible = "operating-points-v2";
>> +        opp-shared;
>> +
>> +        cpu4_opp1: opp-710400000 {
>> +            opp-hz = /bits/ 64 <710400000>;
>> +            opp-peak-kBps = <1804000 19660800>;
>> +        };
>> +
>> +        cpu4_opp2: opp-825600000 {
>> +            opp-hz = /bits/ 64 <825600000>;
>> +            opp-peak-kBps = <2188000 23347200>;
>> +        };
>> +
>> +        cpu4_opp3: opp-940800000 {
>> +            opp-hz = /bits/ 64 <940800000>;
>> +            opp-peak-kBps = <2188000 26419200>;
>> +        };
>> +
>> +        cpu4_opp4: opp-1056000000 {
>> +            opp-hz = /bits/ 64 <1056000000>;
>> +            opp-peak-kBps = <3072000 26419200>;
>> +        };
>> +
>> +        cpu4_opp5: opp-1171200000 {
>> +            opp-hz = /bits/ 64 <1171200000>;
>> +            opp-peak-kBps = <3072000 29491200>;
>> +        };
>> +
>> +        cpu4_opp6: opp-1286400000 {
>> +            opp-hz = /bits/ 64 <1286400000>;
>> +            opp-peak-kBps = <4068000 29491200>;
>> +        };
>> +
>> +        cpu4_opp7: opp-1382400000 {
>> +            opp-hz = /bits/ 64 <1382400000>;
>> +            opp-peak-kBps = <4068000 32563200>;
>> +        };
>> +
>> +        cpu4_opp8: opp-1478400000 {
>> +            opp-hz = /bits/ 64 <1478400000>;
>> +            opp-peak-kBps = <4068000 32563200>;
>> +        };
>> +
>> +        cpu4_opp9: opp-1574400000 {
>> +            opp-hz = /bits/ 64 <1574400000>;
>> +            opp-peak-kBps = <5412000 39321600>;
>> +        };
>> +
>> +        cpu4_opp10: opp-1670400000 {
>> +            opp-hz = /bits/ 64 <1670400000>;
>> +            opp-peak-kBps = <5412000 42393600>;
>> +        };
>> +
>> +        cpu4_opp11: opp-1766400000 {
>> +            opp-hz = /bits/ 64 <1766400000>;
>> +            opp-peak-kBps = <5412000 45465600>;
>> +        };
>> +
>> +        cpu4_opp12: opp-1862400000 {
>> +            opp-hz = /bits/ 64 <1862400000>;
>> +            opp-peak-kBps = <6220000 45465600>;
>> +        };
>> +
>> +        cpu4_opp13: opp-1958400000 {
>> +            opp-hz = /bits/ 64 <1958400000>;
>> +            opp-peak-kBps = <6220000 48537600>;
>> +        };
>> +
>> +        cpu4_opp14: opp-2054400000 {
>> +            opp-hz = /bits/ 64 <2054400000>;
>> +            opp-peak-kBps = <7216000 48537600>;
>> +        };
>> +
>> +        cpu4_opp15: opp-2150400000 {
>> +            opp-hz = /bits/ 64 <2150400000>;
>> +            opp-peak-kBps = <7216000 51609600>;
>> +        };
>> +
>> +        cpu4_opp16: opp-2246400000 {
>> +            opp-hz = /bits/ 64 <2246400000>;
>> +            opp-peak-kBps = <7216000 51609600>;
>> +        };
>> +
>> +        cpu4_opp17: opp-2342400000 {
>> +            opp-hz = /bits/ 64 <2342400000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu4_opp18: opp-2419200000 {
>> +            opp-hz = /bits/ 64 <2419200000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +    };
>> +
>> +    cpu7_opp_table: cpu7_opp_table {
>> +        compatible = "operating-points-v2";
>> +        opp-shared;
>> +
>> +        cpu7_opp1: opp-844800000 {
>> +            opp-hz = /bits/ 64 <844800000>;
>> +            opp-peak-kBps = <2188000 19660800>;
>> +        };
>> +
>> +        cpu7_opp2: opp-960000000 {
>> +            opp-hz = /bits/ 64 <960000000>;
>> +            opp-peak-kBps = <2188000 26419200>;
>> +        };
>> +
>> +        cpu7_opp3: opp-1075200000 {
>> +            opp-hz = /bits/ 64 <1075200000>;
>> +            opp-peak-kBps = <3072000 26419200>;
>> +        };
>> +
>> +        cpu7_opp4: opp-1190400000 {
>> +            opp-hz = /bits/ 64 <1190400000>;
>> +            opp-peak-kBps = <3072000 29491200>;
>> +        };
>> +
>> +        cpu7_opp5: opp-1305600000 {
>> +            opp-hz = /bits/ 64 <1305600000>;
>> +            opp-peak-kBps = <4068000 32563200>;
>> +        };
>> +
>> +        cpu7_opp6: opp-1401600000 {
>> +            opp-hz = /bits/ 64 <1401600000>;
>> +            opp-peak-kBps = <4068000 32563200>;
>> +        };
>> +
>> +        cpu7_opp7: opp-1516800000 {
>> +            opp-hz = /bits/ 64 <1516800000>;
>> +            opp-peak-kBps = <4068000 36249600>;
>> +        };
>> +
>> +        cpu7_opp8: opp-1632000000 {
>> +            opp-hz = /bits/ 64 <1632000000>;
>> +            opp-peak-kBps = <5412000 39321600>;
>> +        };
>> +
>> +        cpu7_opp9: opp-1747200000 {
>> +            opp-hz = /bits/ 64 <1708800000>;
>> +            opp-peak-kBps = <5412000 42393600>;
>> +        };
>> +
>> +        cpu7_opp10: opp-1862400000 {
>> +            opp-hz = /bits/ 64 <1862400000>;
>> +            opp-peak-kBps = <6220000 45465600>;
>> +        };
>> +
>> +        cpu7_opp11: opp-1977600000 {
>> +            opp-hz = /bits/ 64 <1977600000>;
>> +            opp-peak-kBps = <6220000 48537600>;
>> +        };
>> +
>> +        cpu7_opp12: opp-2073600000 {
>> +            opp-hz = /bits/ 64 <2073600000>;
>> +            opp-peak-kBps = <7216000 48537600>;
>> +        };
>> +
>> +        cpu7_opp13: opp-2169600000 {
>> +            opp-hz = /bits/ 64 <2169600000>;
>> +            opp-peak-kBps = <7216000 51609600>;
>> +        };
>> +
>> +        cpu7_opp14: opp-2265600000 {
>> +            opp-hz = /bits/ 64 <2265600000>;
>> +            opp-peak-kBps = <7216000 51609600>;
>> +        };
>> +
>> +        cpu7_opp15: opp-2361600000 {
>> +            opp-hz = /bits/ 64 <2361600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu7_opp16: opp-2457600000 {
>> +            opp-hz = /bits/ 64 <2457600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu7_opp17: opp-2553600000 {
>> +            opp-hz = /bits/ 64 <2553600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu7_opp18: opp-2649600000 {
>> +            opp-hz = /bits/ 64 <2649600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu7_opp19: opp-2745600000 {
>> +            opp-hz = /bits/ 64 <2745600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +
>> +        cpu7_opp20: opp-2841600000 {
>> +            opp-hz = /bits/ 64 <2841600000>;
>> +            opp-peak-kBps = <8368000 51609600>;
>> +        };
>> +    };
>> +
>>       firmware {
>>           scm: scm {
>>               compatible = "qcom,scm";
>>
> 
> 


