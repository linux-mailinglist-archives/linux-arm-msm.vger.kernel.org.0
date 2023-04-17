Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25286E41C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 09:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjDQH5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 03:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjDQH5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 03:57:24 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20B646AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:57:05 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id vc20so6817237ejc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681718224; x=1684310224;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7PpWiQ7b2Y4q/bVhWBzEUCFurmz9ANGD/u5kpg3cc78=;
        b=eCFaf5VYarfVdWKr0Q1BGA96mCmI7L6mpWOgbZX9xuWasmpgA3aKwGVHK9MEQ5a9Ef
         s4n8Epc1sMSSbJwrUCNETScJ2xxS/GuCosckd9ABpWh/JBdZS1TcRKDzH37TWoPo03kU
         ySikRyXrmZL0Ha69DRaX5bWyKs0dIylINmfazD/opQ1it09gzZcjkliFWiQn2l6B3sxP
         mzAaTsYtdIEKOyj0fORx+Yphej33/GET0zLLa+CF7Zlromy+bXL9JSfLK8tDQjnW+Gye
         4jXAesrHuSgYJeT6Yl2+HM4ncH2ufHAr4bG/u7xu7jHyrAKVtsIX4Ff/r6XiIj6cuJ5p
         zy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718224; x=1684310224;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7PpWiQ7b2Y4q/bVhWBzEUCFurmz9ANGD/u5kpg3cc78=;
        b=PJq6WZ8N130lmRGTakcOuZ8a6ahG0QB8I9m3asHu5K0Fju9LfPr2+UmuiOSOg33BDb
         a25oxtgO1ddDbe+yBSnQatXjHygnKQwjbpOZlxVxH8iUPBT4k+BUY2wQHrnKpOSUQsZf
         E85crvfersfu8Y5aClKlBVhKZlgxZXnv+hInJzmqjZ6GxZEH10wkWeFpFfKAnq3pisG4
         Q3tP12i39CYyqZGBcntu6jeqnFOM8hRJ1wWlUSq2fak+xy02jlistk2O/r2JeW9lZa71
         eyTkDT0Cz4dpbf5fD5dnW32fVxtCpoOOk+0hZ4UTU47l3RQ6RxCGHBbYbXCzzTwpoHtW
         mz1Q==
X-Gm-Message-State: AAQBX9cBiiI5BsNd2P785Z0sh4m3UQFXf7UoPw4+scmgY67eWjVf3CF6
        8uma3+O3owHzJ+M5KKYigqUtoA==
X-Google-Smtp-Source: AKy350ad6PJFy2EvQ4qLXp03bkkTd0Ysn4iQIY1+hgUYCnMornSK7Uw+I3NoWKyCSeY6WWiBC+B+ZQ==
X-Received: by 2002:a17:906:af63:b0:94e:6b12:caab with SMTP id os3-20020a170906af6300b0094e6b12caabmr8147626ejb.51.1681718224145;
        Mon, 17 Apr 2023 00:57:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id e17-20020a17090681d100b0094f2f1c5ea1sm2898753ejx.174.2023.04.17.00.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:57:03 -0700 (PDT)
Message-ID: <42982d5c-31f7-bb26-3970-c40a702af190@linaro.org>
Date:   Mon, 17 Apr 2023 09:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8150: add missing qcom,smmu-500
 fallback
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230416151311.346596-1-krzysztof.kozlowski@linaro.org>
 <20230416151311.346596-2-krzysztof.kozlowski@linaro.org>
 <00b18b59-0ecd-316f-41f5-05ee34e599b7@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <00b18b59-0ecd-316f-41f5-05ee34e599b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 09:16, Konrad Dybcio wrote:
> 
> 
> On 16.04.2023 17:13, Krzysztof Kozlowski wrote:
>> Since commit 6c84bbd103d8 ("dt-bindings: arm-smmu: Add generic
>> qcom,smmu-500 bindings") the SMMU is supposed to use qcom,smmu-500
>> compatible fallback:
>>
>>   ['qcom,sm8150-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index 3846f5e0f656..024b3c79ea11 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3983,7 +3983,7 @@ spmi_bus: spmi@c440000 {
>>  		};
>>  
>>  		apps_smmu: iommu@15000000 {
> Are you..
> 
>> -			compatible = "qcom,sm8150-smmu-500", "arm,mmu-500";
>> +			compatible = "qcom,sm8150-smmu-500",
> 
> "qcom,adreno-smmu", "arm,mmu-500";
> ..sure about that?

I supposed to paste here different one... thanks for spotting it.


Best regards,
Krzysztof

