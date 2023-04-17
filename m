Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942DD6E4088
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 09:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjDQHRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 03:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjDQHRp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 03:17:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF64740F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:17:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4ec8149907aso1180422e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 00:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681715857; x=1684307857;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OR5eT9VnzB8iC9lmd78WCiWUCSzoPnYyNJk6lQC8Oc=;
        b=B8e0BXhwU4lqGmdezCmNtposCPWNDQsrr5U8BuPRXI99DeyUt/CICr5FjRWWtD0ZCO
         B6sVXpU3n4W1y1ijhh5Gp62WWoOcJGcAwUEW5n1ukLr4y/b8aryEHiiBRoi2lMGiry8v
         jZ/RWKOzasftEEE6rzZXV/Gli/JmCNAA1bM0/+oocvjobrpWOrE63+sls3P+4MT6tncn
         m8G/VfCfVW9aIahT4Qrn5TzJnZ6K70gLv7swFTUQ8KZ3k4tRYuBPUPjTEJpr2foOUqUV
         7Ruicx7/gIqumpoDrQNpmLpPWV29pULliByxrxgRYNOu1gbg9UaEn8T70T2WGbazG5LP
         lwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681715857; x=1684307857;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OR5eT9VnzB8iC9lmd78WCiWUCSzoPnYyNJk6lQC8Oc=;
        b=V81DyDaQaetXAubq+oUQUEWbuzBvbGh6Jz+zv+uCTWkNui/PJ17wOm7cyefMEvka6s
         hDgKttSwuPAiR4PSR8Q323if7Ed0BLeeHrH9+ahi5wLAXZHuK5Yu2fpjCWfUc/68k4c3
         E5Vk8PYccLwDudr6t4DA7gCnCzyu7iV6kFPcBTBd7vAXgT0hlBOlZ5k9TtZWUGXf1jbT
         J5XOvMKr2Z2YHU64MW9BOO1KPixF0z/TtPcA4nU5pD3cy8iYLhJ2c9wMmDLJ0OfahQ7o
         IV7skk+t5PvqCjB6rWbuoH3cA6zh9IwXqCK3wRel1CjRSQgsPfKFzDEbpqAieA1Y3oYv
         1oZg==
X-Gm-Message-State: AAQBX9dbx5a3Bh46eqXxjeKaMw2HsPhIKEZlPDZHXvz10sd0CSYOB6X1
        RT2TRGQ9oMIAldjG+0bjqRBHFg==
X-Google-Smtp-Source: AKy350ab+wKkL8gb4ltrCcM9tnhiEY2HkIoaBTwD+PoQh+qh2OILwYOXIQ3SdEWHJwapl/UE+lfJ2A==
X-Received: by 2002:a19:ad02:0:b0:4db:3a92:2c85 with SMTP id t2-20020a19ad02000000b004db3a922c85mr1157217lfc.67.1681715857157;
        Mon, 17 Apr 2023 00:17:37 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id u6-20020ac251c6000000b004d85f2acd8esm1948698lfm.295.2023.04.17.00.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:17:36 -0700 (PDT)
Message-ID: <0e5cf9e6-bfcb-ff79-d94c-97c46735e12b@linaro.org>
Date:   Mon, 17 Apr 2023 09:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: correct GIC child node
 name
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230416151311.346596-1-krzysztof.kozlowski@linaro.org>
 <20230416151311.346596-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230416151311.346596-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.04.2023 17:13, Krzysztof Kozlowski wrote:
> GIC child node is supposed to be named msi-controller:
> 
>   sa8295p-adp.dtb: interrupt-controller@17a00000: gic-its@17a40000: False schema does not allow
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 6d3780a75024..5532bf8af211 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3907,7 +3907,7 @@ intc: interrupt-controller@17a00000 {
>  			#size-cells = <2>;
>  			ranges;
>  
> -			gic-its@17a40000 {
> +			msi-controller@17a40000 {
>  				compatible = "arm,gic-v3-its";
>  				reg = <0 0x17a40000 0 0x20000>;
>  				msi-controller;
