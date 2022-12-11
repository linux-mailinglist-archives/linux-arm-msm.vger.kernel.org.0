Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79436649623
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Dec 2022 21:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLKUOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Dec 2022 15:14:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiLKUON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Dec 2022 15:14:13 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD609DF7C
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:14:12 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id s25so3269297lji.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Dec 2022 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCp/ySieBpCE0UL8/+M7g87XSws+FKSOLAOo3fkvAo8=;
        b=Z/Ok37gdW6n87LSCqY3Oh/FjlezWwkQPeGq1YBGhUX5EJzi/9MC9Iia1CNg+ZSDsHs
         8DcUiTFJ9UCs/FeptXhE30dKxhe1IrtkNwsqAaiGiYZNe7YGS9wtU/bYiP5ov2AD9Em6
         0sM6oER8xBrNLClZzbBHM1SdVZwAI4XQ7tso4bQRnl/HfOFULomayMwaFFusa2tCpHUr
         3kPAmkEW3Ku06hvJn9V4/2rN7c1Qr1E8fz/fXbgLXH7wiR0tfchVWOjhtNVpeWqh9Fdb
         51wzuzpUPY1pzbeTukRrFFnb43418oCaBraf3Kpji7VFQmk5bLYvsL8fP8U016RjXn2B
         vuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCp/ySieBpCE0UL8/+M7g87XSws+FKSOLAOo3fkvAo8=;
        b=UIdfOLker4HJlLeK3jePrbtkdnEyZ8UrIYEddn4LTg+Txh77r7mxC1Oy/q7GaUqu6v
         Ij3rlXi+RbA4+3Gqvr/eihgqMcIWCIJvSTSxy4jFUqXiDEEhOMp3tq2Pwjl9dHKdBET5
         kbtCTHPs69z5VOtXY475ghQd4uhTMVXYvN17enFvvtUV4KGmdwQuls/EkwaU7eZ4C7Si
         tnDR2mn2qJPdpJCyHuUVg81RgbvkMVSG0cNeSGu85fzIE9qXkpQwYYuZp1u6CP6g+zC/
         6RbTGsueY7BddPgvQHmhtf5l0Dni8hK+8I6HJCB6S+ZX39+UddFgmz+7OHxNhIkFzB6o
         2BDA==
X-Gm-Message-State: ANoB5pmqJCDR1Jn7JPxec9innVasvy0Ba/wXn5uWGY++BUD8YpYQjaRo
        C49C4aS0bO7kGPWyN/BILWVulcDTaT0TKJv8FjE=
X-Google-Smtp-Source: AA0mqf6ZkXaUX517TPhDoTIMcpiZ7QOvyT6c6mwnySepEZP6z6Bcl0AC+mnlzx59k8GxZ0ZZI+UNqg==
X-Received: by 2002:a2e:bc1d:0:b0:279:ee82:e0f4 with SMTP id b29-20020a2ebc1d000000b00279ee82e0f4mr5059813ljf.32.1670789650961;
        Sun, 11 Dec 2022 12:14:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m21-20020a2e7115000000b0026dce0a5ca9sm1029544ljc.70.2022.12.11.12.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 12:14:10 -0800 (PST)
Message-ID: <77246ee3-8ff5-1049-6b2a-d8925bc87b33@linaro.org>
Date:   Sun, 11 Dec 2022 21:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: move QUP and QSPI opp
 tables out of SoC node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221210115704.97614-1-krzysztof.kozlowski@linaro.org>
 <f38f0bfd-858e-1995-167c-de747e57597b@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f38f0bfd-858e-1995-167c-de747e57597b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/2022 13:29, Konrad Dybcio wrote:
> 
> 
> On 10.12.2022 12:57, Krzysztof Kozlowski wrote:
>> The SoC node is a simple-bus and its schema expect to have nodes only
>> with unit addresses:
>>
>>   sc7180-trogdor-lazor-r3.dtb: soc@0: opp-table-qspi: {'compatible': ['operating-points-v2'], 'phandle': [[186]], 'opp-75000000':
>>     ...  'required-opps': [[47]]}} should not be valid under {'type': 'object'}
>>
>> Move to top-level OPP tables:
>>  - QUP which is shared between multiple nodes,
>>  - QSPI which cannot be placed in its node due to address/size cells.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 76 ++++++++++++++--------------
>>  1 file changed, 38 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index ea886cf08b4d..735581097295 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -538,6 +538,44 @@ cpu6_opp16: opp-2553600000 {
>>  		};
>>  	};
>>  
>> +	qspi_opp_table: opp-table-qspi {
>> +		compatible = "operating-points-v2";
>> +
>> +		opp-75000000 {
>> +			opp-hz = /bits/ 64 <75000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +		};
>> +
>> +		opp-150000000 {
>> +			opp-hz = /bits/ 64 <150000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +		};
>> +
>> +		opp-300000000 {
>> +			opp-hz = /bits/ 64 <300000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +		};
>> +	};
>> +
>> +	qup_opp_table: opp-table-qup {
>> +		compatible = "operating-points-v2";
>> +
>> +		opp-75000000 {
>> +			opp-hz = /bits/ 64 <75000000>;
>> +			required-opps = <&rpmhpd_opp_low_svs>;
>> +		};
>> +
>> +		opp-100000000 {
>> +			opp-hz = /bits/ 64 <100000000>;
>> +			required-opps = <&rpmhpd_opp_svs>;
>> +		};
>> +
>> +		opp-128000000 {
>> +			opp-hz = /bits/ 64 <128000000>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +		};
>> +	};
>> +
>>  	memory@80000000 {
> Sidenote: memory@ should be moved above opp-*, alphabetically
> 
> For this:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

You sure? Because before there is already opp for cpu...

Best regards,
Krzysztof

