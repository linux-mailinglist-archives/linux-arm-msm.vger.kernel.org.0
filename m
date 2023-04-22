Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251B26EB929
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 14:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbjDVM3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Apr 2023 08:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjDVM3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Apr 2023 08:29:22 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F461BD1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:29:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2a8bbea12d7so25450041fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Apr 2023 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682166559; x=1684758559;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/sd8+90mWOvfj0mCOmTgWR1MxRpJMuPvMYRFU54ny4=;
        b=JwvxIRx7wnqJYQpaovZKej+sEnuMtC3tpvW7MnDhW8U9zwGPdlr6r5gTEwspjpZ3b/
         qoOvtO0swuoTixlSWKf17NdNUhzI33DpCcOASOkNr+ryREqQV3MDwbhIZPr2Gwln8Sx5
         ByIo5tSRHhux8+eOvFvNbz0TVUKRpOh1EA8zeYwxZOle2Mp9vzHrB8BDte21Uy9c4xl+
         sIjlvGAHzbfm8CKKaw4es4QqqTXwbAP4yJ56PZ3nWaERmRI8etDKQHyUeuAleyhUvPoB
         DlOKz1nOLVn1JN2+v4IqYDQGA5JGzlmRKJO/CbeFz8DXBa0fu+DeiXxA0AiUTOpdrTfs
         B2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682166559; x=1684758559;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/sd8+90mWOvfj0mCOmTgWR1MxRpJMuPvMYRFU54ny4=;
        b=WgWO5pgUQgn4/xahN7YFwvG8jvSb3rD/+lRNRc6z64MbkG5vFECiu7u/rGGKFSHyum
         JZobrhdpmTXFkVKZEz3FylzF5EXOsSw3z6PnT6rQxj/DbJgCC/ExRP0XuxFLSNyks6LL
         2cNvhWyJKlPXJ4j78YHXwj0wzWz3C8pbOxC/plVzc9O5/tyKS2xw4EldB4RxwhPOA6Nm
         ZKaZgshPzKLnqPpr7HIQioUcosdfxAOJd5oOB5BvMV22Rt0wFLjUMBpl8/nAtKOrBTYc
         p8etpW2X0rTOrUL/19wn8wmwfeQHatnP/yw8T5T3AVQJIa9IBRKYpxccCEIzOpRrF0Lg
         MgbQ==
X-Gm-Message-State: AAQBX9fGk5i5bvDAERBk5MEzTOWUVvS9oRt7VBoZrYP7sHTOfN3U6hiy
        pUzki5rQ3RqVCjlwf0uaughepg==
X-Google-Smtp-Source: AKy350ZnxLlEHGU0yVQpDZlzCuo1hlwMOdcu3otyXWFQM6LKiqgYXp8f1zOrb9MK9k1mA8vm/Smemw==
X-Received: by 2002:a2e:3213:0:b0:2a8:e642:8cdb with SMTP id y19-20020a2e3213000000b002a8e6428cdbmr1205087ljy.49.1682166558915;
        Sat, 22 Apr 2023 05:29:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm970784ljc.46.2023.04.22.05.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 05:29:18 -0700 (PDT)
Message-ID: <a3117f35-bf2d-09f9-439f-b656aa1278dc@linaro.org>
Date:   Sat, 22 Apr 2023 14:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFT PATCH 1/3] arm64: dts: qcom: msm8996: correct /soc/bus
 ranges
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420180746.860934-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420180746.860934-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 20:07, Krzysztof Kozlowski wrote:
> The bus@0 node should have reg or ranges to fix dtbs W=1 warnings:
> 
>   Warning (unit_address_vs_reg): /soc@0/bus@0: node has a unit name, but no reg or ranges property
>   Warning (simple_bus_reg): /soc@0/bus@0: missing or empty reg/ranges property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Please kindly test on hardware.
> ---
PCIe Wi-Fi still comes up and connects to the network
(it doesn't really work reliably but it never quite did -
brcmfmac is brcmfmac :/)

Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # MSM8996 Kagura
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index e160d5e6863f..a88d0a9bb7e5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1832,7 +1832,7 @@ bus@0 {
>  			compatible = "simple-pm-bus";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			ranges;
> +			ranges = <0x0 0x0 0xffffffff>;
>  
>  			pcie0: pcie@600000 {
>  				compatible = "qcom,pcie-msm8996";
