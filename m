Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E860660E70
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 12:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjAGLvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 06:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjAGLvq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 06:51:46 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D88C645C
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 03:51:45 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so5695313lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Crg29xL/y5cmt2utx8zQ3lcRFpJguNienRGyR+IvkUY=;
        b=TUQ9UF+qwD9TmBA4z0S6uWaXn4mEoS9z60HTsQ2BriDgNO6Dgt3hBZQ3cjkqNmmJOF
         kw8huUAW/6+PGLGfQ3SE4SaY5vjqedMTH6UJ+Uipl+BCFnhUmoyghnQ847I2Hm1o01Y2
         oydrc89nJDn1HjJ/obHn586t58mX5HA6xyjZVhM7pX7l+Y9OcbEVAPeqivsf1M0I1y/7
         ZLHYCb6DjMzLZOAqO0nM0D3LEWFb1zJsB/2LPU9HgUrORWqGz2WCNgtHhWzhRtA1lOPc
         Fk2IeMlqJ4o+vdEax6p89L0yeUvPfZuJnwyePsqTtQF1VMxeCWIReCgAZGji3nShN+3H
         BjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Crg29xL/y5cmt2utx8zQ3lcRFpJguNienRGyR+IvkUY=;
        b=cTpX07LpKyLwCZ//sV4ZnJtxIzFebehgcjhhciTXOBW2Tn7xiL/KZPQlykP9vOjUlG
         za++8N5Oons09Y84UFwM/BHpoKNKiLdDG3kpzh+2opvvcLpRbmWSgrR8fbIkLSu3yfYZ
         I2Ox+0gtXI1FXYtKQ78h+1XCFE4JA4Fn18EkUhhUM6oPpk6rJbSIrnSrMYEvRue1l7Y6
         2onOY+JirlkOPqihFN3hoLvWqJf66g31m0CPainBxbF4M1yzQ9mUnGmpoUTqi4iHKjid
         vDNBGMngramMcn7lz9+f99JBN0LNN5TMWdHu+Ig/BFKZcJlfSAuS1TIXE/m061UbHXLQ
         nqYw==
X-Gm-Message-State: AFqh2kr60VdSHlgIFcadZ5zvBz05Cots8yRlqoGu/0Zkyqt3yWmjT15t
        Usffnek8lkdRNgNqf7HNrisCSw==
X-Google-Smtp-Source: AMrXdXs0ofEP133W5pTmXh1oUhyW52i4BNpR4RGSm96XJP7uIrMaiDIHOd22lh9KVeDULgQgBi8Mpg==
X-Received: by 2002:a05:6512:108f:b0:4a4:68b8:c2e4 with SMTP id j15-20020a056512108f00b004a468b8c2e4mr18880003lfg.59.1673092303989;
        Sat, 07 Jan 2023 03:51:43 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id t17-20020a056512209100b004a4754c5db5sm551861lfr.244.2023.01.07.03.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 03:51:43 -0800 (PST)
Message-ID: <9be88ada-e373-7c08-8291-ba9afc4ba3bd@linaro.org>
Date:   Sat, 7 Jan 2023 12:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: Add DMA for all I2C
 controllers
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230107110958.5762-1-stephan@gerhold.net>
 <20230107110958.5762-3-stephan@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230107110958.5762-3-stephan@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.01.2023 12:09, Stephan Gerhold wrote:
> i2c-qup allows using DMA to speed up larger transfers. In msm8916.dtsi
> the DMA channels are already assigned to the SPI controllers but
> missing for I2C. Add them there as well.
> 
> This also fixes confusing errors in dmesg for each I2C controller:
>   i2c_qup 78b6000.i2c: tx channel not available
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 98da982548a1..daece6b9e932 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1559,6 +1559,8 @@ blsp_i2c1: i2c@78b5000 {
>  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c1_default>;
>  			pinctrl-1 = <&i2c1_sleep>;
> @@ -1591,6 +1593,8 @@ blsp_i2c2: i2c@78b6000 {
>  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c2_default>;
>  			pinctrl-1 = <&i2c2_sleep>;
> @@ -1623,6 +1627,8 @@ blsp_i2c3: i2c@78b7000 {
>  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c3_default>;
>  			pinctrl-1 = <&i2c3_sleep>;
> @@ -1655,6 +1661,8 @@ blsp_i2c4: i2c@78b8000 {
>  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 10>, <&blsp_dma 11>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c4_default>;
>  			pinctrl-1 = <&i2c4_sleep>;
> @@ -1687,6 +1695,8 @@ blsp_i2c5: i2c@78b9000 {
>  			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c5_default>;
>  			pinctrl-1 = <&i2c5_sleep>;
> @@ -1719,6 +1729,8 @@ blsp_i2c6: i2c@78ba000 {
>  			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
>  			clock-names = "core", "iface";
> +			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
> +			dma-names = "tx", "rx";
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c6_default>;
>  			pinctrl-1 = <&i2c6_sleep>;
