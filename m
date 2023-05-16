Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4DB70552F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 19:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjEPRoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 13:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjEPRoM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 13:44:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE6393D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 10:44:07 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f24d4900bbso13020650e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684259045; x=1686851045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPxG9OEXJzi0mq5orXGQK3gl3MuJF+YC45SDXGiRoTY=;
        b=E+rnDBxkH1mk5pL/dG6NE/Sz1lgiqAzBknUrixd5p13Wxwxb22oTo7x52VCpQoZNTC
         Ri8J0jEDz5tda9MoTbvvSxBsXdR0yXqAa7JoBrZno+ibp8AXei479tMdvy/3gVshMmBg
         /VyYvJ3IcAFjbik8H3kDGaEi67qcwSChcfI/mDoXt8/2vJVBdV01X8wFIp+30yqO2OKO
         QpxRvTNrcf0Bp9w4yGA2zIGGaPalVpBznoBS645macQzd+kgAxysrU64S9lJC97MQJX3
         4bRN2EHxcOXt/cpHbSuAKEeF5aMxrr2B41juGg8e7tpo43cFMo+VttMDrSCAGXXsUDpc
         H29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684259045; x=1686851045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPxG9OEXJzi0mq5orXGQK3gl3MuJF+YC45SDXGiRoTY=;
        b=Zf9laKpjJxln6jq5HLaJ9rVdhLFLpri7/xghkVfp21Q7D8sSFEbROoYamhnBU1zDob
         XauDpsgMNzh0le9tSw0+bPeV3ZPLw9ME0SXn4H3kSGNhiEE6Wiu2/Z2avCWBN2sU9E98
         z3Mj/NWr21RmHymDbL812vnuJSGZcbMUCbNWVbNGY6SnF5GKkFBWYEUVGNthkWLBfT1T
         yxOk3ANWUZV4M2+K8mnwl+t72groKG8EX6X4wmUDzlJ7sVu6S6Ou0k6genvGeDlNAJha
         E2lnAm3ivBPXsKJdf2YyvAu2Feb3V3QE+QpIj6LQs0hgrpXu6HISM8N2p0/EaDx5QhRk
         MXiQ==
X-Gm-Message-State: AC+VfDzolR/pcjOsYEpKQPQYMe7M9EBvShvk+X2jZf3kJoED3MmMKcYJ
        KMlz+BDreJDfAFv6Nu4FcBhIyw==
X-Google-Smtp-Source: ACHHUZ5hLbqm967CkAYCErIsUK527v2gOI016TViwBeWaifzWlHFdCyuBNsc0y1ohuo8LndxNsD5rA==
X-Received: by 2002:a05:6512:20e:b0:4f2:7b65:baf1 with SMTP id a14-20020a056512020e00b004f27b65baf1mr4195089lfo.23.1684259044956;
        Tue, 16 May 2023 10:44:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id h22-20020a197016000000b004e887fd71acsm3059697lfc.236.2023.05.16.10.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 10:44:04 -0700 (PDT)
Message-ID: <52005148-c0fb-8bf8-80b8-7c1077cced17@linaro.org>
Date:   Tue, 16 May 2023 20:44:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the
 lcc device
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
 <0954a80d-9151-4be3-dcee-e42ddc0b5300@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0954a80d-9151-4be3-dcee-e42ddc0b5300@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2023 12:20, Krzysztof Kozlowski wrote:
> On 12/05/2023 23:17, Dmitry Baryshkov wrote:
>> Specify clocks used by the LCC device on the MDM9615 platform.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>> index b40c52ddf9b4..556abe90cf5b 100644
>> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
>> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>> @@ -39,7 +39,7 @@ cpu-pmu {
>>   	};
>>   
>>   	clocks {
>> -		cxo_board {
>> +		cxo_board: cxo_board {
> 
> Maybe it is possible now to change the node name to cxo-board-clk?

This would break compatibility with the possible drivers using 
"cxo_board" sys name. It seems this is the last platform using old 
bindings. Let's probably settle that for 6.6 I can go and rename all 
fixed clock nodes. Would that work for you?

-- 
With best wishes
Dmitry

