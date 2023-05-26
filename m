Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B586B712376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 11:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236842AbjEZJZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 05:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243066AbjEZJZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 05:25:14 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227391A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:25:02 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so527400e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685093100; x=1687685100;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52mmibDACLRMIh8RU4WtvXxPHcTWwwRXhF0d9Ge0SzQ=;
        b=SWafjm1ssOiBH2WLljAAYcgvuaVfMDWsHaWwXlgB3trlEbpz90v5jhW+rzV1ID/oP9
         g+rz1Kd+fS1laGsB+WJkDxOX853hiS4KwSKZQH4xkx+GuR3072NlkHNqFXdPcSTUt9bH
         ZIzDk93zC8iF5sLrG5A/1o1fa2ju/pZYsQpnYsixSzTB6OClm8Gk2sZBFbjTnvYH6VnZ
         rOFBrLVMuNWo4FcQFVV4mIqx/WEtgmw5ouIRXRVd7JU2QGBQdLfRgD+j86gf1G7vy4EG
         XKy81SmVn15z5rrafeaOsbRSll61Y0B0YfVl1OR/Wjgvr76PLsRE1Ysi4C6wEUto2Ewj
         i8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685093100; x=1687685100;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52mmibDACLRMIh8RU4WtvXxPHcTWwwRXhF0d9Ge0SzQ=;
        b=LFxI3MPCAuseHKf8nnVaM+Taqof3qF0HauWqxRF21kTFvRSwS5ZGJXbMy0vUywtEhI
         bRZGiy56d7Gk7k7s+H0Lc1VI+cIpx96sz1X8jsO4jP/n6d91EiHT+xRA/IQA0gTIJdaS
         choiC945IcN7nfkTGEKHEwm+Tf2gr0P4CIanJPPBtlLTrccs/L6OnKbkhDvk4qeHxby/
         KRgIURVDyg9rTBSeUz2CBwL/ZqCkGz6AyRkawFsJDUXHYJVPi0ZIpA2Jpy1xJLlD+t7M
         iGWlfNkz/gBx4H9v7iXNZLER6l+8v7eMa/x/GxrXm6kyO1/m1BOc1VV3cwjjNW3Z3jd9
         GYCQ==
X-Gm-Message-State: AC+VfDwkJbiONUnaxdJgAzBYrXnSUVkeXJtZoWlHLFUgeskOPqElJJ+O
        9yzUyAqdYiYRx/A983UlpPf2fQ==
X-Google-Smtp-Source: ACHHUZ5eWBjMxaSbV0u8cTeCUf97RgS+TuJiJQSMYefmEf93NwMwzC5UXlGziD1OlJG3xRdpw30qnQ==
X-Received: by 2002:ac2:4425:0:b0:4f2:7cb1:65fc with SMTP id w5-20020ac24425000000b004f27cb165fcmr281618lfl.64.1685093100324;
        Fri, 26 May 2023 02:25:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25109000000b004f252003071sm543346lfb.37.2023.05.26.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 02:25:00 -0700 (PDT)
Message-ID: <4e226295-e19f-9518-6dda-7f96665ada65@linaro.org>
Date:   Fri, 26 May 2023 11:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: ipq6018: add QFPROM node
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526070421.25406-1-quic_kathirav@quicinc.com>
 <20230526070421.25406-4-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230526070421.25406-4-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 26.05.2023 09:04, Kathiravan T wrote:
> IPQ6018 has efuse region to determine the various HW quirks. Lets
> add the initial support and the individual fuses will be added as they
> are required.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index f531797f2619..856879fd0207 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -206,6 +206,13 @@
>  		dma-ranges;
>  		compatible = "simple-bus";
>  
> +		qfprom: efuse@a4000 {
This should be a bit lower down (0xa4000 > 0x59000)

Konrad
> +			compatible = "qcom,ipq6018-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x000a4000 0x0 0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		qusb_phy_1: qusb@59000 {
>  			compatible = "qcom,ipq6018-qusb2-phy";
>  			reg = <0x0 0x00059000 0x0 0x180>;
