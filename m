Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29E97053C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 18:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjEPQ2S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 12:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjEPQ2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 12:28:17 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 451058689
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:27:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f380cd1019so3911727e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684254471; x=1686846471;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oIDovYmdir1hRdagWnu4jSmI2T1nqPjTwi5YwOyxgA=;
        b=ctlfHIfy/pnyBqKUcxnftaxk1UUJS2eFiOvHeGUtK07L7Tf1jD8ABLBEzvDeX93Dpy
         +QFBrqCddN0S7YK+j/O6496/pv7sQTnprUsYgiybABwctrDzzmbEC3uhSzTJsr0Jfedh
         5jbiXrUsw211upKE6NKNoAP+/km28mcGxUYBl8i0gPf5+25PwyuMR1jb0+UoynGK73Y9
         GrmjUojicvodTCbuUyCcughzt6QajjyjM3O4BCiuXP+/FPVrAwhFSpel6sn2NFDyy95y
         fuXtikpGWRkZAsbKXmNXB0lLG6O/aXLXXZK1bgP/9aF8pwtIC1/WYT8O6Hxx50cMKyaM
         I94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684254471; x=1686846471;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oIDovYmdir1hRdagWnu4jSmI2T1nqPjTwi5YwOyxgA=;
        b=co9+wgwSbuq999kh/XJ2fu4ekWyTCKCSySNnkgmHAf8tTPyndBvKTcgc3BNqt/mwwf
         JdmoWO2pXwjRjycyHHkX9UtBTyXyVKlHt63K+2RWnHWWUB61+8GXncEGM6xMYiN8ZcNA
         V2Yejr3zTJZH4hpIp/Qj33DWbfvPC7rVGULXdoLk6oowbVsQ8NhAt69MBMdZiY5pqHz4
         c4kP1+QYAVzKpXWAcBWpTPlUdwjET8YjWGkpbyzW9MhB8hDWGNHou4Z5VZt53cXG95V5
         ZKcv7Ns/LfajfNL7HqJmouxl2tCQfC5CmGEM1W3ZthEbwtb5QvSIEiJ9O0XoJ8yPEWU4
         MyiQ==
X-Gm-Message-State: AC+VfDwAFVGzeAsturBXswYjYY70CAts68B78xvE0e17YCuH9BJ9R+o1
        Y0rq+QNzmbPpEj+HQrBE4///kA==
X-Google-Smtp-Source: ACHHUZ4AVD8Q+jW2q8EIFDC2FRD+P++kfUUF24+pF6SuIp8fyLiIRxpYisuG978FxEBZUtcaNm5JCA==
X-Received: by 2002:a19:5214:0:b0:4f3:789a:b8a0 with SMTP id m20-20020a195214000000b004f3789ab8a0mr3194973lfb.18.1684254470866;
        Tue, 16 May 2023 09:27:50 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id h18-20020a05651211d200b004f138c4de81sm3034974lfr.149.2023.05.16.09.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 09:27:50 -0700 (PDT)
Message-ID: <67d1d171-d372-a11e-dc9a-73cc698e67a1@linaro.org>
Date:   Tue, 16 May 2023 18:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8550-qrd: add display and
 panel
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516154539.238655-1-krzysztof.kozlowski@linaro.org>
 <20230516154539.238655-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230516154539.238655-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.05.2023 17:45, Krzysztof Kozlowski wrote:
> Enable Display Subsystem with Visionox VTDR6130 Panel (same as on
> MTP8550).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Context in the patch depends on:
> 1. https://lore.kernel.org/linux-arm-msm/20230516133011.108093-1-krzysztof.kozlowski@linaro.org/T/#t
> 2. https://lore.kernel.org/linux-arm-msm/20230512160452.206585-1-krzysztof.kozlowski@linaro.org/
> 
> Changes in v2:
> 1. dispcc is enabled in DTSI.
> 2. Re-order pinctrl and regulators.
> 3. Drop mdp.
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 68 +++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 30b36a149125..ade6ba53ae6b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -431,6 +431,46 @@ &gcc {
>  		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l3e_1p2>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "visionox,vtdr6130";
> +		reg = <0>;
> +
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +		vddio-supply = <&vreg_l12b_1p8>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel0_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1e_0p88>;
> +	status = "okay";
> +};
> +
>  &pcie_1_phy_aux_clk {
>  	status = "disabled";
>  };
> @@ -532,6 +572,34 @@ wcd_tx: codec@0,3 {
>  &tlmm {
>  	gpio-reserved-ranges = <32 8>;
>  
> +	sde_dsi_active: sde-dsi-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	sde_dsi_suspend: sde-dsi-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_active: sde-te-active-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	sde_te_suspend: sde-te-suspend-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
>  	wcd_default: wcd-reset-n-active-state {
>  		pins = "gpio108";
>  		function = "gpio";
