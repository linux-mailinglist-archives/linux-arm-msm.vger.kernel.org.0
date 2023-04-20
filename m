Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FE26E90C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbjDTKqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235015AbjDTKqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:46:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D24A2108
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:45:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ec81773d50so452676e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987527; x=1684579527;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltIyOV+FI0CALDClXRcVhaZi8EdoXTwuv0Dyto61MWY=;
        b=y/5RB59VseVK1qBTB6W6VehjfMkIFcrDLVZKa9RD3XxcIr0lMJUDb+lKeB0hp0daGL
         9XzHEpMgBdGyNxp7XDlLE1+Sr6YJoSrC4kXpyfOVOcdfPwMEuUiCYV4WbSnrDCtY8EHz
         i2tZZ7VpZ8t+CcW30qBdfWG0947XmhC/4ZVqiO0h5nEdUtAFIKXU+HTJFWeoVnZdzaFe
         ZowYmzTGhqGopCi/qYgKyw0666tdsLLmehQ6vYemQtgJ/l/S+CvCQlSdYY4abBKIQ6Jk
         1AvtgVDmk/uLMhr5rp+r5Oy4C/fiqDG7sC9vvy1VXMpDfVXrgQFeKzSs5nDzBYBwz/gB
         7V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987527; x=1684579527;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltIyOV+FI0CALDClXRcVhaZi8EdoXTwuv0Dyto61MWY=;
        b=kYbnBsN22vUrZhvzM/dACGMluaqCpQhx5EF7SZEx+4++cSZHFM6F+pzuq1u7WYkImm
         2hOEVxTH0V8XPqaNp/1e32i7tLaMxyT8ZfUy41TVLrvh7r5vkoJfcRLpzqSAwpD535o0
         CtD2wcz/qiL/+4iYfj+IUpf2xKaXSIGSCzvyk5+w6kYIryKioxkyNyDrZA9sV1ta4svE
         VUlvF1kMOyb9q1MEpKk9B85OkZnSYnnrbInHmsJVV2z8Q1PBPc6RO1wUQHDHB8zuYWBc
         Rq3P/uw/B+v/PJhJMGdoCyfOOznq4B7zO7Yd+TINiZDp9rJPG0LsNKshJy9wGnLw51DJ
         XG6g==
X-Gm-Message-State: AAQBX9efWrx64CMSu5eB2Mr29zxI0f1lzpVICZszrEbyeAQHWK3WZOqc
        ArW4jcBQle6Ee9MTZ2oaWHPzStgwntN2FLCq8lg=
X-Google-Smtp-Source: AKy350YhKPJuzyz8Pb1JCmUW2DwZ2BBBy5bvahcbaGUnIpSUq+ytwpmIjg6bnbKR+XkL/GCPhGfMYw==
X-Received: by 2002:ac2:5103:0:b0:4eb:c85:bdc2 with SMTP id q3-20020ac25103000000b004eb0c85bdc2mr348146lfb.2.1681987527452;
        Thu, 20 Apr 2023 03:45:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id m10-20020a19520a000000b0048a982ad0a8sm179338lfb.23.2023.04.20.03.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:45:27 -0700 (PDT)
Message-ID: <14fd48d3-98e3-63b3-e616-6480e5131525@linaro.org>
Date:   Thu, 20 Apr 2023 12:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/10] ARM: dts: qcom: ipq4019: correct syscon
 unit-address
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:50, Krzysztof Kozlowski wrote:
> Match unit-address to reg entry to fix dtbs W=1 warnings:
> 
>   Warning (simple_bus_reg): /soc/syscon@1fcb000: simple-bus unit address format error, expected "1fc0000"
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 342c3d14001e..72d82a9a6cc5 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -515,7 +515,7 @@ tcsr_mutex: hwlock@1f40000 {
>  			#hwlock-cells = <1>;
>  		};
>  
> -		tcsr: syscon@1fcb000 {
> +		tcsr: syscon@1fc0000 {
>  			compatible = "qcom,sdx55-tcsr", "syscon";
>  			reg = <0x01fc0000 0x1000>;
>  		};
