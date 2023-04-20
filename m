Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52D16E9137
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbjDTK5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235079AbjDTK4k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:56:40 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FC99752
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:54:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ec8143400aso472599e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988051; x=1684580051;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UejYUJO7RGOyV5fSgOC/bwuCGBr6yT7wcLYlNQ3uMkc=;
        b=L8kdRuCt/naQFfVkxaJe6lDda7O4TsSUBL+iblfQLk9h0zp/5AT9QNwBK0FUIT7kWB
         SyUIvTFJ//TtQm2U2FxELzapiKLMrS15kH+g2J3Y9ZP5DdD6yLxmd22GgEmko56+ugEc
         xDdzzrTQE/0k6PtD+pFTsEEo7AkdrjChulNG9J4RuD6tdqpUO5ALEwcw4U7rpmaYcy99
         1CNlqXHfNx0Mz43jb7ccJe7/1yaUaO8zjoDeSPQ5I+bVWrjLRTI4OadI7fipA+yOmLKN
         Rfrp8XCxtG74xAxYeb/W6ViGXC3zymnE8hJtN/IVGSdjdwXS2pPNL5kcUKbsCaVdB5d3
         11nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988051; x=1684580051;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UejYUJO7RGOyV5fSgOC/bwuCGBr6yT7wcLYlNQ3uMkc=;
        b=b+IUAoNJlKRF6b4n4MTRrJxu50inV0tdp1lFgzFQzE2KUO6JRSxZQvVcmMDAYMuC5N
         BiFnzxuHjcevDPMWyZp+hrDvmM1C6tYwlzvdmFRCUYeN/GJgMnjNUNe0Bb5BdWdCR9Z/
         FgEBAO8qFar1LLRlhRP9Elg34T+Mup2d6Do0qnhwCnE2bzLPE+618od3soDbBAeFRRW6
         /unlabovJ3B22sQ7cjguL8s8hDrTGsnUb05KYzAgJB+2eoAtS+mIlEkSjMJhV/w5ZFCh
         xlyRnAskW5+cM9O+Runs56V/2BTiA46FPRsBXwoHtBXokTIjk5eldZ6aHRCK0UqC88+k
         x9fQ==
X-Gm-Message-State: AAQBX9cctSOtLNLAMfMJVm0onjVbgy1LL/ByHb+rqnYoM8x0IzOW02yF
        uaDRQPlgP0pR9Q/DGJ0dKhX8zw==
X-Google-Smtp-Source: AKy350aK64i2S9TztBPtMlsnOIGDwJoBzMeQmbyRzFJSDFC37rZb/QrkY+KuW6713gWJhkGCs4UMwQ==
X-Received: by 2002:ac2:4215:0:b0:4ec:a9c1:27d7 with SMTP id y21-20020ac24215000000b004eca9c127d7mr329243lfh.67.1681988050907;
        Thu, 20 Apr 2023 03:54:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id q13-20020ac246ed000000b004da8d947c57sm179403lfo.149.2023.04.20.03.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:54:10 -0700 (PDT)
Message-ID: <57cf7269-94ab-c32f-2bce-b2afabe7cc03@linaro.org>
Date:   Thu, 20 Apr 2023 12:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/18] arm64: dts: qcom: msm8996: correct camss unit
 address
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
 <20230419211856.79332-9-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419211856.79332-9-krzysztof.kozlowski@linaro.org>
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



On 19.04.2023 23:18, Krzysztof Kozlowski wrote:
> Match unit-address to reg entry to fix dtbs W=1 warnings:
> 
>   Warning (simple_bus_reg): /soc/camss@a00000: simple-bus unit address format error, expected "a34000"
> 
> Fixes: e0531312e78f ("arm64: dts: qcom: msm8996: Add CAMSS support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 30257c07e127..25fe2b8552fc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2069,7 +2069,7 @@ ufsphy_lane: phy@627400 {
>  			};
>  		};
>  
> -		camss: camss@a00000 {
> +		camss: camss@a34000 {
>  			compatible = "qcom,msm8996-camss";
>  			reg = <0x00a34000 0x1000>,
>  			      <0x00a00030 0x4>,
