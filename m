Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F24B658BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 11:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiL2Kpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 05:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiL2Kpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 05:45:53 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C091274A
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:45:52 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id j17so17505702lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 02:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTIWrY/I9iznPzbsuEZTHxW4AmSb2jAgZYmVDCvvcHM=;
        b=Swr2zkRQfivt3MiiJUmjule/G9pOEKThwbZllV8yDBQBXo4zhD31f29Fbj0LTKCY6S
         CCluJMmtMso7KZfL6YeXrRSI8FDe8wkw4yX92GhVr/Ra4IpfnlPncfbQVzQSgPPVfuCx
         9RI989CoIPlGdq9D9JArkAAiIaZvnJoqOQnxGNrKTGa4/dZXu2xHWPfGTcdYiiVwUrOq
         +Uztn+lfWQJPWdqXJENG91hXcmtGPuv7XfgD/197l2OtCCu1J5dwUd2GRphD7bjyam2e
         g+sCkqHY8NCJII82cLViYjhLdyouAXHj70KFrqb/JikO9sKasdqrBOHOFJQ33Xc872E/
         tqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTIWrY/I9iznPzbsuEZTHxW4AmSb2jAgZYmVDCvvcHM=;
        b=h08Y8x6YRxZq8dEDgAjQpoHapc3ykDi2fqq5xFc1sQyne1pqTzNxZnghDT6hzKlbHC
         I3kCwXZIRG7+y2nsOrKyC2GthrSnLVRkrub9MLXDUlru9HSnSGnlOqOgIob1OTLnNZ+t
         SI66ypQz8sUuIbjkF3k80oRcxxVEkqvWv2UZu3SLvoz2akza/m+TyFL/UZAe2v2s1hGv
         7ttbrTj2ZBgukSZ5pg1bWnuDYZdAhCk/12KT/d3C6iGPw5IXZ5AGwAw3Dob5Q+bbfIkJ
         Y7UTi/v7Ugw2mHrEFo/q+oHY3SvaHBW9eHvfAeorRmu0C3jJKUtN5D0tM9U5bKRAYB45
         Hj0w==
X-Gm-Message-State: AFqh2kqJsIRsoC4EqnCZ7+MCWj0jVuSoJwXpBI4wRtzjQ4YAIgkL7pIe
        EtdCSEqM6g3mY8CYIqvekBnSyg==
X-Google-Smtp-Source: AMrXdXtRTwT3Y1PV0nYirk3i9PKbnQoJFfVhyUcj6OWn5YAfUdVHJnWQd3FNE+qq0i8vDTRYgSl9qg==
X-Received: by 2002:a05:6512:340d:b0:4b6:ec96:bb9a with SMTP id i13-20020a056512340d00b004b6ec96bb9amr10753400lfr.60.1672310750662;
        Thu, 29 Dec 2022 02:45:50 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id u20-20020a05651220d400b004949f7cbb6esm3023225lfr.79.2022.12.29.02.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 02:45:50 -0800 (PST)
Message-ID: <71d7a162-569d-1443-9e53-3ba374d06ccd@linaro.org>
Date:   Thu, 29 Dec 2022 11:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: sm8450: add spmi node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221229103212.984324-1-konrad.dybcio@linaro.org>
 <7b32e414-96a9-7265-efee-f872badb32b2@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7b32e414-96a9-7265-efee-f872badb32b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.12.2022 11:42, Krzysztof Kozlowski wrote:
> On 29/12/2022 11:32, Konrad Dybcio wrote:
>> From: Vinod Koul <vkoul@kernel.org>
>>
>> Add the spmi bus as found in the SM8450 SoC
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> [Konrad: 0x0 -> 0, move #cells down, make reg-names a vertical list]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> v1 -> v2:
>> No changes
>>
>>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 570475040d95..b9b59c5223eb 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -2715,6 +2715,28 @@ aoss_qmp: power-controller@c300000 {
>>  			#clock-cells = <0>;
>>  		};
>>  
>> +		spmi_bus: spmi@c42d000 {
> 
> Hmm looks different than reg.
> 
>> +			compatible = "qcom,spmi-pmic-arb";
>> +			reg = <0 0x0c400000 0 0x00003000>,
>> +			      <0 0x0c500000 0 0x00400000>,
>> +			      <0 0x0c440000 0 0x00080000>,
>> +			      <0 0x0c4c0000 0 0x00010000>,
>> +			      <0 0x0c42d000 0 0x00010000>;
> x
Hm, my guess would be that Vinod chose to put the "cnfg" reg
instead of "core" in the unit address, as 8450 has 2 SPMI bus
hosts and they both share the core reg, so it would have been
impossible to have two spmi@core nodes..

Konrad
> 
> Best regards,
> Krzysztof
> 
