Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E146FA166
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbjEHHsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 03:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbjEHHsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 03:48:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE181171F
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 00:48:21 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4eed764a10cso4609950e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683532100; x=1686124100;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kre6qWKGNcjeM+iThCvTDJwFCUHgVmlK0SAmHcQy0AE=;
        b=hOzGiR18dYlNKOaD0IWoyHPQVtb5yxUQLPG/xCrxGx/JvtgvNH4mIy3oJIncWALBTv
         N/eFB5Yh79rgBINFL7807kaoQBJhP4axsXBO7H1fv3SOloLDsRL2GfsnwVoS2PRSBLyr
         kyuRF9n2nbAZixqZa6j6gITS/FMQ0sDaCjxNHcgtmSxTy6+c7p66y9arFJgnIWhXHuIh
         88G029UcMnh/N0XPxS/mAiaXL0mfNdb9O/Z45OMKalCR1R2NmlkujSv8/EqwqE42S7ZP
         SMtlVtJRlXcDd1gH7VfntypcVpkyqP5dxrJnjWZgqVCEBd9a6Dl8iwmjJYVeQxQ69mUf
         4VYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683532100; x=1686124100;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kre6qWKGNcjeM+iThCvTDJwFCUHgVmlK0SAmHcQy0AE=;
        b=VqZ1NZnphdsl/vi1+EbVudrplIsBGd8nCfqw3lXk+pWg+CUxoPUVltlPbnIZE+xGWn
         KJs439VUEEuiUwU/QCsQV3Pfvr+2dC37uLVXuBPUls/rQjtdZVpRI2yNBAO4jaZ+OlVm
         OzMmtexFp65BZ8IP5wieztdg7zUo1Ltjbo6pei/QEH3kEuTPcSQEaAV7w801JpW9nQjW
         IkBotL/Ptiz1aIjTYTygWZs3A31YLeFxpy9WFoAXtd/uBBio4REZ/eni5Ho7dkx+38U6
         bmmTHRc0wgYVyNfO0VO3zWnrYXtbRtxrGP6wZx0DQthurLIMcvVR/WjK67w0Wzx+ThJS
         Mi9Q==
X-Gm-Message-State: AC+VfDy3UdYHd019tvMNjNpjCtq5wlYuIAZSP43sTw6ZkGMHTrB6HPem
        Cp6yTr9eyFKgCzmZSmbO9ONwvQ==
X-Google-Smtp-Source: ACHHUZ4Sy9seY2TUtAfRj+f9YmJ3Jrb1VAY5uFb/4F86HCNYKlD3iDZgKj6hxFBEbyvFrfeXuzCE5w==
X-Received: by 2002:ac2:54a3:0:b0:4e8:5e39:6238 with SMTP id w3-20020ac254a3000000b004e85e396238mr1990707lfk.42.1683532100166;
        Mon, 08 May 2023 00:48:20 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id h14-20020ac25d6e000000b004d8546456c6sm1199876lft.195.2023.05.08.00.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 00:48:19 -0700 (PDT)
Message-ID: <7bf5a2c1-ae97-ae8c-5621-25e06d186a65@linaro.org>
Date:   Mon, 8 May 2023 09:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996: correct MMCC clocks order
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230507174516.264936-1-krzysztof.kozlowski@linaro.org>
 <20230507174516.264936-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507174516.264936-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 19:45, Krzysztof Kozlowski wrote:
> Re-order the clocks for MMCC clock controller node to match the bindings (Linux
> driver takes by name):
> 
>   msm8996-mtp.dtb: clock-controller@8c0000: clock-names:1: 'gpll0' was expected
>   msm8996-mtp.dtb: clock-controller@8c0000: clock-names:2: 'gcc_mmss_noc_cfg_ahb_clk' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index fe9e1cb12a73..718007cfb10e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -939,16 +939,16 @@ mmcc: clock-controller@8c0000 {
>  			#power-domain-cells = <1>;
>  			reg = <0x008c0000 0x40000>;
>  			clocks = <&xo_board>,
> -				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
>  				 <&gcc GPLL0>,
> +				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
>  				 <&dsi0_phy 1>,
>  				 <&dsi0_phy 0>,
>  				 <&dsi1_phy 1>,
>  				 <&dsi1_phy 0>,
>  				 <&hdmi_phy>;
>  			clock-names = "xo",
> -				      "gcc_mmss_noc_cfg_ahb_clk",
>  				      "gpll0",
> +				      "gcc_mmss_noc_cfg_ahb_clk",
>  				      "dsi0pll",
>  				      "dsi0pllbyte",
>  				      "dsi1pll",
