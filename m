Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9964739ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 10:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjFVIyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 04:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbjFVIxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 04:53:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C3E2114
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:53:28 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b4745834f3so67026781fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424006; x=1690016006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOud5yiCf9vuKq5jIo/hllLQZNDjLVHZzylOU65GmJI=;
        b=rPDqi0R0+g8TBX9UA0smbbXRrnzrS3JCy/uN6yGpEPSuTzhD7prfpcIAPQ6cEe4RYN
         VG1yyUmw5VsK1Ea/D5hU9GgK0fUuVbbcEnqXLltVCpStAfg0ysfOdQJjMraKRMqKzgfN
         83pWFbYaDl+3HXgiV/67k/9zqkdIKK2/7wfQulv5SHg7QGbSGnGsCJjHqu1hq/K54cRR
         toRbVQEtJO3+r8ZqA06HGiLjYOHzftCvKtyHpIy7MfXifw0POjKTIpEmmn0SGWZ+Nv7X
         si30P2tJAHGyFlIC+rTlhq63xxu2m3pwZHMSm+0sU2vdqo6hs96AAalZhtDwGhLblsYa
         ZJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424006; x=1690016006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOud5yiCf9vuKq5jIo/hllLQZNDjLVHZzylOU65GmJI=;
        b=TpPCM4SpsAf+JRDJQyBHXpBM5hy7wuothvOw18M4AUS8cOnuDOm++wiar8UiarzJyJ
         x0Uty2g3detG6xS7PbV/2mpxh+HAl05LtcjwL+f/QYJ9ygLsF6ptDi0JuI2iQTJHBbav
         HzfUUgCnrkkRrSfFd2pOnsMqrBeg/VzDr1WXYte8rOZctwTLFLw9pkZ0fsXm3IZovmRx
         dRuT8FCHcdVJX9JLyGH6Fw4Dvwocr1p3hn9u8pTC/Wcgh2BaJt+ibzTG3W+SqOHVDi4j
         2JniiZnieGj4yCN3cy7GiLlq0pkdQTI1vSAq0Sb2gMSpJf9u1GvNFjyVqyRqYIaWkdd2
         WMxA==
X-Gm-Message-State: AC+VfDzRaX/g4h8xk02DqzE22aGUZGY399b5GXTmwxjkcxZWv/Gaixp/
        ZlA9yyHpgCwIMyR6UfjodxXLUA==
X-Google-Smtp-Source: ACHHUZ7B+URHvhGO5p5GI/nngSr4VyHHJZ/u5wLllsgAdajbEtUs+ag81KiCAsrL6pqfP4Z7hNxwSA==
X-Received: by 2002:a2e:8349:0:b0:2b2:104d:8f89 with SMTP id l9-20020a2e8349000000b002b2104d8f89mr11357862ljh.0.1687424006145;
        Thu, 22 Jun 2023 01:53:26 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id n20-20020a2eb794000000b002b47dabaaa5sm1209035ljo.121.2023.06.22.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:53:25 -0700 (PDT)
Message-ID: <7b614cd8-1b6e-519b-cc2a-acc1fa5f24b3@linaro.org>
Date:   Thu, 22 Jun 2023 10:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Use assigned-clock-rates for
 QUP I2C core clks
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com
References: <20230615084841.12375-1-quic_devipriy@quicinc.com>
 <1ab63d4b-6358-ce08-818a-b5751f88cdde@linaro.org>
 <d05c7b0e-6edb-bc0f-5875-fc5cb8ea6b8a@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d05c7b0e-6edb-bc0f-5875-fc5cb8ea6b8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.06.2023 08:25, Devi Priya wrote:
> 
> 
> On 6/15/2023 2:21 PM, Konrad Dybcio wrote:
>> On 15.06.2023 10:48, Devi Priya wrote:
>>> Use assigned-clock-rates property for configuring the QUP I2C core clocks
>>> to operate at nominal frequency.
>>>
>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>> ---
>> There's probably some logic behind this, and it almost sounds like
>> it'd be fitting to introduce an OPP table for I2C hosts, especially
>> given the voltage requirements.
>>
>> Konrad
> The qup i2c core clocks are not scalable and operate at fixed frequency.
> The assigned-clock-rates are used to configure the clock frequency
> if it is not done by the bootloaders.
OPP tables with a single entry are totally fine.

Konrad
> 
> Thanks,
> Devi Priya
>>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>> index 0baeb10bbdae..78bf7f9c455a 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>>> @@ -361,6 +361,8 @@
>>>               clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
>>>                    <&gcc GCC_BLSP1_AHB_CLK>;
>>>               clock-names = "core", "iface";
>>> +            assigned-clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
>>> +            assigned-clock-rates = <50000000>;
>>>               dmas = <&blsp_dma 14>, <&blsp_dma 15>;
>>>               dma-names = "tx", "rx";
>>>               status = "disabled";
>>> @@ -389,6 +391,8 @@
>>>               clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
>>>                    <&gcc GCC_BLSP1_AHB_CLK>;
>>>               clock-names = "core", "iface";
>>> +            assigned-clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>;
>>> +            assigned-clock-rates = <50000000>;
>>>               dmas = <&blsp_dma 16>, <&blsp_dma 17>;
>>>               dma-names = "tx", "rx";
>>>               status = "disabled";
>>> @@ -417,6 +421,8 @@
>>>               clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>>>                    <&gcc GCC_BLSP1_AHB_CLK>;
>>>               clock-names = "core", "iface";
>>> +            assigned-clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>;
>>> +            assigned-clock-rates = <50000000>;
>>>               dmas = <&blsp_dma 18>, <&blsp_dma 19>;
>>>               dma-names = "tx", "rx";
>>>               status = "disabled";
>>> @@ -446,6 +452,8 @@
>>>               clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
>>>                    <&gcc GCC_BLSP1_AHB_CLK>;
>>>               clock-names = "core", "iface";
>>> +            assigned-clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>;
>>> +            assigned-clock-rates = <50000000>;
>>>               dmas = <&blsp_dma 20>, <&blsp_dma 21>;
>>>               dma-names = "tx", "rx";
>>>               status = "disabled";
