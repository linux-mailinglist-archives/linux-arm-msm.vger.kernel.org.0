Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2791738179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 13:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbjFUKmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 06:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbjFUKlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 06:41:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6EC2715
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:39:46 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f8fcaa31c7so62904035e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687343982; x=1689935982;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zjtcCvh/hkoBltrfU6NoFvQZYkuiZLIu53RCREg7WZw=;
        b=mXhMgbB1MsHck7ny5a1FnIAq+fWGafe1++qTd+8X22rBjJFQB3IgHS48dPwRFu7vA4
         pi9Ks05Ds2TzsFGk+jqNIwy4tudFOZY7L5qAggjG1THREyJNIsEPjiBktTD0I7VjS7kf
         1RkBy6iEZFuh1Um034PNvnfZ6GqnckcBQRjNbXtGLrwt4997j1zSpBUSmUcMAIfmO22H
         0tsSlfRJkr4rgr4Ko/2S+ZR+djyDMaVSfi9OKLDvd4eI1FsBEuF1cNqFqsh3biK/v6xt
         qgWCjSX8k+NUmjux5oieo41sZ86BcojL0xl5XkIDDep/GfR9porxROBOfQ/HyI4R2Mgc
         fpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687343982; x=1689935982;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjtcCvh/hkoBltrfU6NoFvQZYkuiZLIu53RCREg7WZw=;
        b=JELbce0oDYV0mzyf0uGcEFjCl+J0Xrgbxkbh+25GLU5PMOynXsIJl4y6BaSORDquec
         OtkAbdVJf6W3pVaRd0ocd/qGSnYBcpHNQMpwWhrrh7JkpR/UzQM2tjESTy9vVLzniat4
         Xd8iuPupxXrzZB/PCdEX7xjp/g1ei1DdtB2FWo9LK4U9BST6/WQsHQKhHLdBxBbnmD9K
         xYdY3Nqbz4nua5JEACHVQyTc7SkaNuQmx1ZBIbTvkghTY/1PQxzznHpDcKiu0Ai6sv6G
         Tm2doYmdCuVC8Ty58hZ2w17ie+bzjVGvSL4mZsLJZFP97PbgHXKYz1cajNFXrpAe9zoB
         iilA==
X-Gm-Message-State: AC+VfDxDqt2om+YRgBFtcrRpV6HNbc8cPdWpRE+rO/s5/oi5Jkgz5M9z
        /vmES20VShY+JKjNcDUvjwaPcA==
X-Google-Smtp-Source: ACHHUZ6144jGWYuXU2HYG173odFCPZn8Vd5kd4ZQTpTk5z0gomsiMDLlsH3tL5i2EGA2RtmCdjBN/g==
X-Received: by 2002:a1c:4b08:0:b0:3f9:c2f6:344 with SMTP id y8-20020a1c4b08000000b003f9c2f60344mr856644wma.16.1687343981984;
        Wed, 21 Jun 2023 03:39:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b158:3e69:8736:455d? ([2a01:e0a:982:cbb0:b158:3e69:8736:455d])
        by smtp.gmail.com with ESMTPSA id x23-20020a1c7c17000000b003f72468833esm4632219wmc.26.2023.06.21.03.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 03:39:41 -0700 (PDT)
Message-ID: <6180134a-2919-0f13-e37c-bb64b6403692@linaro.org>
Date:   Wed, 21 Jun 2023 12:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: add missing power-domains
 property to usb qmpphy node
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230621-topic-sm8450-upstream-usb-phy-missing-power-domains-v1-1-d850c086c43c@linaro.org>
 <e31ad5ac-77ab-cf04-2e3e-d0857ccfdecf@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <e31ad5ac-77ab-cf04-2e3e-d0857ccfdecf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 21/06/2023 12:01, Konrad Dybcio wrote:
> On 21.06.2023 11:55, Neil Armstrong wrote:
>> Add the missing property to fix the bindings check error:
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@88e8000: 'power-domains' is a required property
>>      From schema: Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> Are you sure about this one? Historically PHYs have had their own GDSCs.
> 
> May just be a wrong binding fwiw

Indeed you're right, forget this patch USB30_PRIM_GDSC id for the controller
and starting from SM8550 a new one is used USB3_PHY_GDSC.

I'll fix the bindings.

Neil

> 
> Konrad
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 5cd7296c7660..f921bd520e40 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -2046,6 +2046,8 @@ usb_1_qmpphy: phy@88e8000 {
>>   				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>>   			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>>   
>> +			power-domains = <&gcc USB30_PRIM_GDSC>;
>> +
>>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>   			reset-names = "phy", "common";
>>
>> ---
>> base-commit: 15e71592dbae49a674429c618a10401d7f992ac3
>> change-id: 20230621-topic-sm8450-upstream-usb-phy-missing-power-domains-499a3d6c725f
>>
>> Best regards,

