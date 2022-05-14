Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256A452711D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 15:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbiENNAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 09:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiENNAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 09:00:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938F065B3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 06:00:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j4so18727742lfh.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0anGjs+PbGX5Dd3ajX3kwo7VYHkTLZAuxgjJqcwByDQ=;
        b=KTCiubIxZXJhj15IyGoPF0SImESQ7XhBikSjePJu8/EnDjH0HkjW0CkD+IVOek6dfU
         EZ5NbObiAxS5IpP/s7EYyJdwvEnObLDTqXMDcZqfEnPsMbo1FOuHg6Y4I1HRtI4FdiKf
         +Xps8hY1CMDH/3vvDtg7BMaMjH9lyDq2rqMH6vBUCZd8buP+8OzyGk6mtB6jtj8A6Y6b
         ClduTgdPyNfWNUQoDzvxyDXr2eIDizGLakLqwEr/AmafRaiFGDDjA5mrz0ytzMaJRAUg
         XrBERoEafWQmIlbE703dHiaFWNDjI5Toamz8ekLKaGj3TU7fjhoEo9aBl1gdHJ4JDQqk
         KWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0anGjs+PbGX5Dd3ajX3kwo7VYHkTLZAuxgjJqcwByDQ=;
        b=jMmhYbRIDeIEXeJ3Qvb4XM1vbCc4msf7VBA2/7rb5K+ULyCIHvL2cFehus0c4UL+os
         fOXAeRZYivqtO7IwnPz9UTRtx7N7Oqb4cfUAyYSgbtYgB1ytrgeei5JoI8V5ijE4lB2F
         ePhzv5YDjrH9Qe4g7w7CZZgwSMmAf3RsI+KktcSsD/F808y30Ym9q6E8c7Pj/B7GKM+F
         fcJlQKkOvISLeS0D4QuE6TYRZKvi7ZLry7ydMVtFbKpLfS8ZIAjbMgxGE+htx/X4I6LE
         t/VEk9M/S1Pyl2JQn2I8CtVbGScaWumgrtNqPg8h/cTbEIJ+6BU68GLHs46MjXlEcMWh
         hREw==
X-Gm-Message-State: AOAM531R/YGExJTWP/jnNp1G/B4Nom0MAIE+RmugrWRMM4JruDH/cGIC
        twA/0Ollh0KQF1SBof5U3jL7dA==
X-Google-Smtp-Source: ABdhPJyfOtOjJPBlagZEIFnYEycdAcJcez3WkOYanlJ/e+FVg2TtyyondVVRU1tWNbDDYExbnVxTyQ==
X-Received: by 2002:ac2:51a1:0:b0:472:154:4065 with SMTP id f1-20020ac251a1000000b0047201544065mr6440996lfk.590.1652533233905;
        Sat, 14 May 2022 06:00:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l22-20020a2e8696000000b0024f3d1dae87sm839111lji.15.2022.05.14.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 06:00:33 -0700 (PDT)
Message-ID: <70abbfba-3f9b-8f82-7648-1acb9f75fe93@linaro.org>
Date:   Sat, 14 May 2022 16:00:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: sdm630: fix the qusb2phy ref
 clock
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-5-dmitry.baryshkov@linaro.org>
 <20220514095620.us5wemwsmi2gbqaq@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220514095620.us5wemwsmi2gbqaq@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2022 12:56, Marijn Suijten wrote:
> On 2022-05-14 02:45:14, Dmitry Baryshkov wrote:
>> According to the downstram DT file, the qusb2phy ref clock should be
>> GCC_RX0_USB2_CLKREF_CLK, not GCC_RX1_USB2_CLKREF_CLK.
>>
>> Fixes: c65a4ed2ea8b ("arm64: dts: qcom: sdm630: Add USB configuration")
>> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> One nit below.
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index e8bb170e8b2f..cca56f2fad96 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -1262,7 +1262,7 @@ qusb2phy: phy@c012000 {
>>   			#phy-cells = <0>;
>>   
>>   			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
>> -				<&gcc GCC_RX1_USB2_CLKREF_CLK>;
>> +				<&gcc GCC_RX0_USB2_CLKREF_CLK>;
> 
> While at it, should this patch fix the indentation or shall I or you do
> a one-off patch correcting the entire file (either before or after your
> series)?

I'd prefer to land these two series, after that we can indent the rest.

> 
> - Marijn
> 
>>   			clock-names = "cfg_ahb", "ref";
>>   
>>   			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
