Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6BBE70C3CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 18:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbjEVQ7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 12:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbjEVQ7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 12:59:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA218F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 09:59:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af24ee004dso43368371fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 09:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684774758; x=1687366758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzsWyfzoAE9j9/qcfbANAi3R2yvm7zlyuIQR0Nd0YjY=;
        b=tHCeeRHy15E4/ew/ki4gAVyqNovM82BIW+WYCAhxnHU38KE5Z39XUzMUPBqTU72qms
         y70ciGVQjTSEZ4ALmLrKWURaMY14+qJoYMtGiJdRoJwCi9rn/QrrZ/1G+NFQqRMoaBeL
         Y1BySST3J7OjcGtpJqELy1OTdoFFyO3j1q99CfigSi1nUMB6+11s7JPzLThgMy5vxufG
         YAyNMMajNpBK7ryCaydmifw9wva6paRK7BH1wVfBLHHwaC3Q/av+mMsH1q1PBRfrE+6j
         rVCKqsjgq+xG77r8UuhoZC+pNUkt16uzcWl+D5gFHfQ6IC/1zxeD8fVRL4nmrDYUvFXP
         KQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684774758; x=1687366758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzsWyfzoAE9j9/qcfbANAi3R2yvm7zlyuIQR0Nd0YjY=;
        b=F/zy4eXpiGvMHRVJCFn45eTCf0TiQnIspKC6V3YWlmHU+9VWBf5uAtmOSTOot5RgKq
         quiAbjx20rXZ9kgedXaskKm6zNxIjEBTbrFUUUhN6JgeqlRO4ObRNz3Li30qYMxOHY+G
         QH7F7NTEAq/xcPidMZwpus91HQCxkn3bzNEjwxCc/l9vVyLT7TO6ZserD2NkDtFCLF/d
         +ymHQYQVzSmmgw/yZoO8zE/5wWMpGeJQmNUfkzXklxIGOKLB4xH5RVxNVve7O2p6l+iO
         tc9PZUiEYPWDAq12EmsWmUeqTN6N3w9N++hhA5B2K6NEc32BQCbVQrq+qBX14KP0PCJZ
         NnyA==
X-Gm-Message-State: AC+VfDyMsES1xnAY5kfOqlw6ToFnqrKOaSu8Le8AdgsnEZ1bzPB3EoYd
        0XAQMC4EWwXYCNY5hXJrP+OtYw==
X-Google-Smtp-Source: ACHHUZ5yz/rf+r+6ifmDYv6ARajemxz9B2+DB9synqhXzg3KVJjrY7XRMdKITzMcd4krd+AO8zdR6w==
X-Received: by 2002:a2e:9c89:0:b0:2ac:83bb:ab46 with SMTP id x9-20020a2e9c89000000b002ac83bbab46mr3662297lji.30.1684774758164;
        Mon, 22 May 2023 09:59:18 -0700 (PDT)
Received: from [192.168.1.101] (abyk97.neoplus.adsl.tpnet.pl. [83.9.30.97])
        by smtp.gmail.com with ESMTPSA id m15-20020a2e870f000000b002aa39dd9ad3sm1206706lji.125.2023.05.22.09.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 09:59:17 -0700 (PDT)
Message-ID: <fab222e5-3310-c346-fd51-6bc40515b498@linaro.org>
Date:   Mon, 22 May 2023 18:59:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/11] arm64: dts: qcom: msm8996: switch UFS QMP PHY to
 new style of bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
 <20230521203834.22566-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230521203834.22566-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.05.2023 22:38, Dmitry Baryshkov wrote:
> Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
> resource region, no per-PHY subnodes).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2b35cb3f5292..2b65c608a57e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -726,9 +726,9 @@ gcc: clock-controller@300000 {
>  				 <&pciephy_1>,
>  				 <&pciephy_2>,
>  				 <&ssusb_phy_0>,
> -				 <&ufsphy_lane 0>,
> -				 <&ufsphy_lane 1>,
> -				 <&ufsphy_lane 2>;
> +				 <&ufsphy 0>,
> +				 <&ufsphy 1>,
> +				 <&ufsphy 2>;
>  			clock-names = "cxo",
>  				      "cxo2",
>  				      "sleep_clk",
> @@ -1993,7 +1993,7 @@ ufshc: ufshc@624000 {
>  			reg = <0x00624000 0x2500>;
>  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>  
> -			phys = <&ufsphy_lane>;
> +			phys = <&ufsphy>;
>  			phy-names = "ufsphy";
>  
>  			power-domains = <&gcc UFS_GDSC>;
> @@ -2046,25 +2046,18 @@ ufshc: ufshc@624000 {
>  
>  		ufsphy: phy@627000 {
>  			compatible = "qcom,msm8996-qmp-ufs-phy";
> -			reg = <0x00627000 0x1c4>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges;
> +			reg = <0x00627000 0x1000>;
>  
>  			clocks = <&gcc GCC_UFS_CLKREF_CLK>;
>  			clock-names = "ref";
>  
>  			resets = <&ufshc 0>;
>  			reset-names = "ufsphy";
> -			status = "disabled";
>  
> -			ufsphy_lane: phy@627400 {
> -				reg = <0x627400 0x12c>,
> -				      <0x627600 0x200>,
> -				      <0x627c00 0x1b4>;
> -				#clock-cells = <1>;
> -				#phy-cells = <0>;
> -			};
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		camss: camss@a00000 {
