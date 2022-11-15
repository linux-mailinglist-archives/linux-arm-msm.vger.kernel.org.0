Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45CD6299C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiKONOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:14:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiKONOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:14:21 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80530C65
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:14:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id c1so24339487lfi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TnpZNB3yY2sHehmo/ZWkSWGq3Xs6SVEAPhAgGjO2Uk=;
        b=nL+PPcww964CyfJSCS0///oWfwoFvkKh00kPZDMlynkU+sy2hzoKq9ifRQeNSAGxe0
         1eJjHQphyb6QX7IRdvDLztP98ri8JeWti0meT4DT5Bt+Fb8qA46hrY/fap4ykz0cVWGQ
         vKBkWVPYSHuItFYU1DD8c6L6Q+C4gI+Efy7u4A4IJZpIOMoAIYBhtp9DPIUWiAlnDHVy
         e5ihv7iOcuu5g+1pvYKhlshcLDHDkyBfC92f8nJBE1CUvd3AIX0cDf1sb2zls8ukZ0c9
         IajiqPo3pCTft/FIcTB+9WwnIF1Iy0J53774nwp3J8Wnn2xMMhiJBFg1UFdue1OFk29S
         osHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/TnpZNB3yY2sHehmo/ZWkSWGq3Xs6SVEAPhAgGjO2Uk=;
        b=ImSPWUJkzMQAODnoEZRzSVwGoLPHc0BB6Ag6j8pGc34syDKf+yBjrPbbtU+zrcoJAA
         6Fp2S+6nkZVr37f4mhQm+2jZNbiFxlw6jCquFNZOu6hiuP2y822U2w6FLTzU4RhlmpgD
         tsOuGdnb2Nwo1VsmJUTd6Px3gJbNKsgzQi35qyvSyFoiq0YrKRWIfnpZLPrRV5hYIf6c
         P0/7WxJ1CCUJYRyFJk4SiHNim+FR7dwPqsNlpjT/w1qFgidJGOL0ywVDQT437r0pzo3b
         2XE6WVNWOxf2pjAb+Xb4qlloEyjBfNVffFRW5kTRIzwB37ZhuC2/XKOEnnqnprm/9TGw
         AE/Q==
X-Gm-Message-State: ANoB5plOI8ODTT3feu5o0D0uyvsfBQAbWFUk4zb3pDLPWEBjRY4XAZm5
        wp/qhyD78sYiX2NX129offZfSA==
X-Google-Smtp-Source: AA0mqf4YV/jzEwWzrzKvbefxTYEvQaQEti0/34/86ewugz0JCol/nnCLCELUYbRDl4hmnDF8cs5jaw==
X-Received: by 2002:a05:6512:1398:b0:497:456d:890 with SMTP id p24-20020a056512139800b00497456d0890mr5081108lfa.687.1668518058876;
        Tue, 15 Nov 2022 05:14:18 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651234c800b004b19f766b07sm2219694lfr.91.2022.11.15.05.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 05:14:18 -0800 (PST)
Message-ID: <42d173ae-d085-a6e1-86ee-6de02071aac9@linaro.org>
Date:   Tue, 15 Nov 2022 14:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] arm64: dts: msm8998: add MSM8998 specific compatible
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115125310.184012-1-krzysztof.kozlowski@linaro.org>
 <20221115125310.184012-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115125310.184012-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/11/2022 13:53, Krzysztof Kozlowski wrote:
> Add new compatible for MSM8998 (compatible with MSM8996) to allow
> further customizing if needed and to accurately describe the hardware.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index da2dd87e3f4f..320a28232a32 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -900,7 +900,7 @@ anoc2_smmu: iommu@16c0000 {
>   		};
>   
>   		pcie0: pci@1c00000 {
> -			compatible = "qcom,pcie-msm8996";
> +			compatible = "qcom,pcie-msm8998", "qcom,pcie-msm8996";
>   			reg =	<0x01c00000 0x2000>,
>   				<0x1b000000 0xf1d>,
>   				<0x1b000f20 0xa8>,
