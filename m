Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 461B46DEC71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 09:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjDLHUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 03:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjDLHUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 03:20:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0766530CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:20:48 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id qb20so25968509ejc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681284046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdkHlkygyrByQg419aDNV3ptLNHr8rYQerwRNj8xGA4=;
        b=v0uRJwn7bc6kxMR9t3SsAK+Zoagch1miml9frz5BLuwoQYRIjv7E6gWB4YLDiKdAgz
         uWGZRc8ACc4mm4bMZ5icLviRsegesJ0xpV8AqkQup3pQFAao1cNFbt68FKsNSXH4+fnj
         WnlfuYWkXkwhK6fvlb4G+ux1GMysMsrsJsVQeTf3YSFhkgUCY37WyJL95WzADCQnbj+9
         Re+DLE689ZfQs3YJV8k9X0FfmLYpqVF70lJ9RlLvw9Hk1NolJup6gfFr66bkH6jA3xZU
         owYKWR7etQXRbko4rNa7XcBtgsSmAMRaQjY+KOaDy3qxUJ9e9ljZFzaek9sq5Z+fQJEM
         OaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681284046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdkHlkygyrByQg419aDNV3ptLNHr8rYQerwRNj8xGA4=;
        b=VHClwGIyTjLK4MhECw1uyaFcKrial6SaqMPfjRxqwl35y5R/ac4HuktNW9RKlp2r7a
         Iuc3Q3H5QSJF6Z1ULbb8rVtlOYdJovPOVYt739OQNPET1QNVKGaHCUM9hhOAp5cGDld6
         ZOhqScVH0RDXBMINXjqW98blEv7VAuuozuOXPhivtrFc94gnfsxFdmSKhi9IrF+3BSpI
         GeuTsieCGgI78CfwF4QmsXs52OjUIUcsa8N7pT+mGXDSPRtvl7YrWm6xKrCRCTpQq+vS
         kFJcUqjFaPtgSDEvL8wIFe2RoipXNdRCO3LlVmOJmxu/sQagtgywmJgSjKFCleLvE2au
         DU/g==
X-Gm-Message-State: AAQBX9dXNogXQlyAXDsJDDZjaTeVdtLZmITfYeEmEORXsK/xWKWcvbrI
        2j5Yc2/VKslMkLbp7UFcEfpZwA==
X-Google-Smtp-Source: AKy350YdNCYxr5cEeE31YLwqV48xPDU/gshyAN4umZzLpG8BlrVAvwZZh+9yMvOS/rcahNhPtVgirw==
X-Received: by 2002:a17:907:3fa6:b0:94c:2548:395 with SMTP id hr38-20020a1709073fa600b0094c25480395mr1394352ejc.52.1681284046498;
        Wed, 12 Apr 2023 00:20:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id sb2-20020a1709076d8200b0094a785e362dsm3248934ejc.141.2023.04.12.00.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 00:20:46 -0700 (PDT)
Message-ID: <a47f2066-bc7b-bc62-b936-77583135e291@linaro.org>
Date:   Wed, 12 Apr 2023 09:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] dt-bindings: power: qcom,rpmpd: Add SA8155P
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20230411-topic-hanaau-v2-0-fd3d70844b31@linaro.org>
 <20230411-topic-hanaau-v2-1-fd3d70844b31@linaro.org>
 <f12d50a2-a9b0-5659-4224-2b7039ba058e@linaro.org>
 <2ce26f3f-f746-ce15-c490-288628c7645c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2ce26f3f-f746-ce15-c490-288628c7645c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/04/2023 20:03, Konrad Dybcio wrote:
>>>        - qcom,sdm660-rpmpd
>>> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
>>> index 1bf8e87ecd7e..867b18e041ea 100644
>>> --- a/include/dt-bindings/power/qcom-rpmpd.h
>>> +++ b/include/dt-bindings/power/qcom-rpmpd.h
>>> @@ -90,6 +90,15 @@
>>>  #define SM8150_MMCX	9
>>>  #define SM8150_MMCX_AO	10
>>>  
>>> +/* SA8155P is a special case, kept for backwards compatibility */
>>
>> This is a new binding, thus I don't understand what is here backwards
>> compatible?
> Check the DT structure, 8155-adp (so, de facto 8155) included
> 8150 before, but that was not exactly the correct approach..
> It bit us after we accidentally discovered 8155 advertises MMCX,
> LCX and LMX PDs in cmd-db but triggers a bite on access attempts..
> 
> By mimicking the indices to match the ones of 8150, we only have
> to fix up the domains that were axed from 8155 (in comparison to
> 8150 which has the full fat setup).

> 
> Konrad
>>
>>> +#define SA8155P_CX	SM8150_CX
>>> +#define SA8155P_CX_AO	SM8150_CX_AO

The DTS diff (the patch here) does not show it, I would need to check
the context by opening other DTS in linux-next. Therefore it would be
great if commit msg explained this.

BTW, using here directly numbers matching SM8150 values, would also be
backwards compatible...

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

