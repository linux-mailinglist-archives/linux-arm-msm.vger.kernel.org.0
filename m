Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D40B673A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 14:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjASNhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 08:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjASNhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 08:37:00 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F447EE7D
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:36:57 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id z11so2922271ede.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 05:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ul2QoxkNx6V65kWnLOrufKLqPcbvPbRP5IqxNTkmCWs=;
        b=ly7/ErrfnFARsBkd7LDXnsdKYGHdGD8IIXbMEun0t/RogWbaaXvq8T4fWJFYzAoLg5
         GmCNM5Msz6HSwSSHThUk5DrOKrHna/0OduFjnDpVpH15iA7hg6bBpt//2joyJrJFA7gi
         P67eVh/gloF6OG1Shqp1UN6sL8UZTZNo/dec0I0J5bMBrU06VEqdHhFxLo0SQMoSTKj0
         DyFT2IwFiy5PQwPRddeTO+d0ITetx8VitkzlyCh+JJ6M54gw4SiQlnu4hUy4qaf6D2WE
         /p/iPBXT/M/R8xF1UwqwKHN+pg+ttvgltCvgzHWHywhap2YsAHCr+0KpaOpko2n61u+E
         5mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul2QoxkNx6V65kWnLOrufKLqPcbvPbRP5IqxNTkmCWs=;
        b=N9NTm4tutAmG6PXpENioFA1JckBBGeSnP7FoejQePKJgA7ojAy+A+5lh1BxnHUt7pA
         quo+BJY/+mYRH+FmXzWUOkkexuJ0NGg0zQx0tAY5L/4Z4cbN5U/uDmt35zhV6nUPvdn4
         ay/EXlblSn30GXuzhbQP2Kz+C/LrfOtn5GXN7StSNXlsCtbmv8mETyHREFAhzXXkheFQ
         uFcCRno5xTlF1dC6Lg9NJ+ypAg/1tERjjh1PxTJJhX7/H3LhqvM6/lsEpwEPhxQPR7A3
         jM4Kn55EJ94FuHl3vwvLv0GmhzPXuOm6XrgO7JaHC+ReFwkAPJ8kgBuQxQ5mqsXqm3K9
         KVMA==
X-Gm-Message-State: AFqh2kpY1hcjiKlXRXpGOmPhD/iHarIWMHpts8R/9iun6qpR3h4XVTta
        ioqgcBh6ZFwm4WqUY7vsvXAXug==
X-Google-Smtp-Source: AMrXdXuIfyla87CmWJcxhOl5p2kzwJveDFvUR21VRAsZvgC5Elf6y8XbV71T51FQpl53s5GVCd1y1A==
X-Received: by 2002:a05:6402:e8c:b0:463:e2cd:a8b5 with SMTP id h12-20020a0564020e8c00b00463e2cda8b5mr10405163eda.11.1674135416361;
        Thu, 19 Jan 2023 05:36:56 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r8-20020a05640251c800b0049df0f91b78sm6928239edd.78.2023.01.19.05.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:36:56 -0800 (PST)
Message-ID: <4a4d8da9-4068-b74d-5811-759cd7d1b34e@linaro.org>
Date:   Thu, 19 Jan 2023 15:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-7-dmitry.baryshkov@linaro.org>
 <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2382c5f5-f57d-1fc6-497c-b355aed08036@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 15:44, Konrad Dybcio wrote:
> 
> 
> On 17.01.2023 23:58, Dmitry Baryshkov wrote:
>> Add device tree node for the CBF clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 150d13c0f4b8..7d8e31b84959 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3562,6 +3562,13 @@ saw3: syscon@9a10000 {
>>   			reg = <0x09a10000 0x1000>;
>>   		};
>>   
>> +		cbf: clock-controller@9a11000 {
>> +			compatible = "qcom,msm8996-cbf";
>> +			reg = <0x09a11000 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
> This should be RPM_SMD_XO_A_CLK_SRC, downstream consumes cxo_ao.

Ack

> 
> Konrad
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		intc: interrupt-controller@9bc0000 {
>>   			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>>   			#interrupt-cells = <3>;

-- 
With best wishes
Dmitry

