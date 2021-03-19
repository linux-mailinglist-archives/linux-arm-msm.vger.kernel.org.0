Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C59341FC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 15:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCSOkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 10:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhCSOj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 10:39:56 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACACC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 07:39:56 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id o16so9372580wrn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 07:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZoqWXP/V3WLtx6b82eSZ18zEGdu+ELeHI92zYjQlVlw=;
        b=hpoQFBQ/jhs/9wnYQgMd66znVviny9jd/FIw3gd79H2mp5bd77fm50waCtVzeDG7WQ
         vUxVVWOXLJ0dmww0TAaDOo03QIQKMQs5CuTN0iVrXwrjTStdHJicBwojTt4xbljFIs9M
         CFeyOy11oom0pOfMHcDGeNpCmgyzgEjYzuoUi/gtHlsb9sYLwG7KbgAQC8luqnnx6oG4
         kBosQ3NpH2s2BUoVuCiG/FAz/ihpmBfha6bqeZer0RYZoa4pGbylA5LoHtRlz1kw+Yfw
         XDTd8XhPNtnrIFMeojGFlZxW3AdzTijR3brK4M0gTTJruxSb7Jam0hAb4nuE+W/OWaip
         /gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZoqWXP/V3WLtx6b82eSZ18zEGdu+ELeHI92zYjQlVlw=;
        b=d8GPAi1duBv45SX40Aw6fbPP5AzKzLJ7i521ie5bbSuX8c070sDt/LwLY5biMuV4y3
         ztVi7KvKT0fBlJg7j3mV6F0snOBvQoct+AoWF689vLs45Hh0e6k9K5hvtJEjgo4TB0sU
         GQLk21umNTK0Et7F+mrCDMbbar6fyYzuJxd/Lr6VU4umqvyTot62l+Y1gFIgoqDWqi5X
         sKVNQoMUoE/ygrL511u3AkkTeQVaTv9ihokvdmkv3gfY0fa1Jw8ULMOUdiyW+Ogj0ZG6
         wRI1GS+bhJm/gScKQZFhUXbIbE7Lz3mnSpee04sMRF9sCPc+HnVXu4vdJGhwHkWsqUVu
         1u6Q==
X-Gm-Message-State: AOAM533l06ngErwq00YvoDAyye6ARZfydKv5rkIZ99PSIp3ZWmuAO75Q
        gVvPkkbm4+umZBHj+s1ffmUJBg==
X-Google-Smtp-Source: ABdhPJxHGCGcyu/t3eP25M8WuesResjre6x95sD6wnidHPAvYNpJEoTYYoJAqDtcI8DAOV2z4OtbOg==
X-Received: by 2002:adf:b609:: with SMTP id f9mr4705658wre.223.1616164794956;
        Fri, 19 Mar 2021 07:39:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n6sm7700611wmd.27.2021.03.19.07.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 07:39:54 -0700 (PDT)
Subject: Re: [PATCH 5/5] arm64: dts: qcom: msm8916: Enable modem and WiFi
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
 <20210312003318.3273536-6-bjorn.andersson@linaro.org>
 <f03b639f-f95a-a31a-6615-23cd6154182d@linaro.org>
 <YFNozCCa4fdR5kSb@builder.lan>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <2da2ee91-f3f9-bab7-1d38-e01300fcdbc5@linaro.org>
Date:   Fri, 19 Mar 2021 14:41:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFNozCCa4fdR5kSb@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2021 14:50, Bjorn Andersson wrote:
> On Mon 15 Mar 07:01 CDT 2021, Bryan O'Donoghue wrote:
> 
>> On 12/03/2021 00:33, Bjorn Andersson wrote:
>>> Enable the modem and WiFi subsystems and specify msm8916 specific
>>> firmware path for these and the WCNSS control service.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
>>>    arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
>>>    2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>>> index 6aef0c2e4f0a..448e3561ef63 100644
>>> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>>> @@ -305,6 +305,12 @@ &mdss {
>>>    	status = "okay";
>>>    };
>>> +&mpss {
>>> +	status = "okay";
>>> +
>>> +	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
>>> +};
>>> +
>>>    &pm8916_resin {
>>>    	status = "okay";
>>>    	linux,code = <KEY_VOLUMEDOWN>;
>>> @@ -312,6 +318,8 @@ &pm8916_resin {
>>>    &pronto {
>>>    	status = "okay";
>>> +
>>> +	firmware-name = "qcom/msm8916/wcnss.mbn";
>>>    };
>>
>> On Debian I have to do this
>>
>>
>> index 2a6a23cb14ca..597cdc8f51cc 100644
>> --- a/drivers/remoteproc/qcom_wcnss.c
>> +++ b/drivers/remoteproc/qcom_wcnss.c
>> @@ -33,7 +33,7 @@
>>   #include "qcom_wcnss.h"
>>
>>   #define WCNSS_CRASH_REASON_SMEM                422
>> -#define WCNSS_FIRMWARE_NAME            "wcnss.mdt"
>> +#define WCNSS_FIRMWARE_NAME            "qcom/msm8916/wcnss.mdt"
>>
>> so I guess wcnss_probe() -> rproc_alloc() wants this fix too.
>>
> 
> Can you confirm that you're saying that you want below patch, which I
> just merged?
> 
> https://lore.kernel.org/linux-remoteproc/20210312002441.3273183-1-bjorn.andersson@linaro.org/
> 
> (Which makes it possible to specify firmware name per platform/board)
> 
> Regards,
> Bjorn
> 

yep

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
