Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172A673EADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 21:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjFZTFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 15:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbjFZTFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 15:05:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B80E74
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 12:04:57 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so5125281e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687806296; x=1690398296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deZVau4vnGCryCtP1wz+ofzuj/LVcP0dhkPcKiwljFs=;
        b=rI8Pfn4y+xGBS6nt7R8REOJGV1XapjU2sSo4gryKE9OTUqKwZeSOnXVvO957KlMV0T
         5227nTGO9pGSsjH/2YZ51UFWBiKAb4MefwrUf1Zo0JUAryEWZRANdC5Dre0SpPhqDS1y
         UpFw1zNzj3RhK8KSsoFeIgCbwfVMFC/IQcPkGQMaxJ6G5s0+yelIrgw7tl0NyxYwzC7o
         uPSWjBCirtHWHIxkWZp5k2HHoTZHG4KoHxbFeS+uSJuBrSYDUNWt2deokKRoAm1WMGWr
         xYwKNjMKq6BH+9DYwnBL+8EnVP4LL/ODrBV9C4fcSEEpnVnJAH63rtme45N4hjlg6AQW
         wfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687806296; x=1690398296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deZVau4vnGCryCtP1wz+ofzuj/LVcP0dhkPcKiwljFs=;
        b=iKFgbTvHYIuo2Nfz5vlpBr2maHWwZdKddmikkRnRTxghUWH4b2Ub6wBIaBKXy9xb2C
         V06BuWuX/cirnWbI6IO/OcSkOSa1S0klSK6/WUm6PockGtmxZvZKNVwgGrjTcGUyjhyo
         N+eQ4XE/hEFg5vPxuu/l8RVKt/FVLLVIROjAGMPBVVQbD4YkJXdrwIN/4uvVRaGwn7GN
         tGRs/PF7eWcHyXVhzF5YlNXjt8VNDistTqsBZG0v+GAt5q8OHEneP+gSfR5Mp1ulsnzZ
         PIqc8o8foZ8Ic01KuXHpjvr3RpMSY2uJm5mUDV2BCC+AifXxFkpEK5otqmw9cu6PmYws
         i4kQ==
X-Gm-Message-State: AC+VfDxE3HxdmGVFRD/LJ3u7mW81uzWSEZxVjpDklW24WSyVNn2gVqpt
        RF41ab3rKnv6Bd7uaPn48qgYFQ==
X-Google-Smtp-Source: ACHHUZ5/L2keYdN/Bsx7dSyvWvpcbHc0n5VOKIeCB+4PBcRrKhQyHZpX01Tlhrkq4zAIcKZu2M83XQ==
X-Received: by 2002:a19:6755:0:b0:4f8:57b8:8efe with SMTP id e21-20020a196755000000b004f857b88efemr18020956lfj.55.1687806296050;
        Mon, 26 Jun 2023 12:04:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id t24-20020ac243b8000000b004f625831d85sm1227444lfl.126.2023.06.26.12.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 12:04:55 -0700 (PDT)
Message-ID: <c18df0c5-c136-8790-0493-c42c47f50f11@linaro.org>
Date:   Mon, 26 Jun 2023 22:04:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/26] ARM: dts: qcom: apq8064: add L2 cache scaling
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-17-dmitry.baryshkov@linaro.org>
 <9d49ecb6-1efd-0f19-c787-9baca79846fe@linaro.org>
 <98c55d93-3971-513c-0f3f-4d4ac373aaac@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <98c55d93-3971-513c-0f3f-4d4ac373aaac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 19:46, Konrad Dybcio wrote:
> On 26.06.2023 18:37, Konrad Dybcio wrote:
>> On 25.06.2023 22:25, Dmitry Baryshkov wrote:
>>> Populate L2 cache node with clock, supplies and OPP information to
>>> facilitate scaling L2 frequency.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Are the L2 voltage ranges independent of speedbin?

Yes. Only Core freq and voltage seem to be a matter of speedbin/pvs 
classification.

>>
>> Konrad
>>>   arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 101 ++++++++++++++++++++++-
>>>   1 file changed, 100 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>>> index 1eb6d752ebae..ac07170c702f 100644
>>> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>>> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
>>> @@ -81,9 +81,108 @@ CPU3: cpu@3 {
>>>   		};
>>>   
>>>   		L2: l2-cache {
>>> -			compatible = "cache";
>>> +			compatible = "qcom,krait-l2-cache", "cache";
>>>   			cache-level = <2>;
>>>   			cache-unified;
>>> +			vdd-mem-supply = <&pm8921_l24>;
>>> +			vdd-dig-supply = <&pm8921_s3>;
> Another thing I've noticed.. we've grown out of referencing
> PMIC specifics in the SoC dtsi..
> 
> Do we know what PMIC configurations has this one shipped with?

It is either pm8921+pm8821, or pmm8920, which integrates pm8921 and 
pm8921 dies in a single module (but keeps software interface).
In theory splitting pm8921 to a separate file would allow somewhat more 
sharing between msm8960 and apq8064. Let me take a look.

-- 
With best wishes
Dmitry

