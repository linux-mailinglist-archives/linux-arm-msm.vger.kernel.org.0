Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17926573EFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 23:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiGMV3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 17:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbiGMV3R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 17:29:17 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF75322526
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id t11-20020a4ad0ab000000b004356ab59d3bso7857oor.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DAIvkORMY0eHuzO0UF6055+MNm4d5HssuHFf88BN1UI=;
        b=EZHKhsguEAPEJy9bBeWQHr2VgpR//He8sO1V7us4Fzth0GlBVpYEHAbDtuFKNlH9AX
         ny4twiBDh0XOIO+FoW/82qhpHPTv68i4wjXJbIBMsIgYhSEndRHS2N9oXDmFTmXDcvLi
         LSjGvIngTBa94+CxCH9h3iTSF+Mz99KUszPUGVie1LtGTQgPeVkqBLVleOhpa3U9UI7m
         yuRyEbLU3Up0vor3aU8X9Rkqq9KqU27n20PBYMPAKdkj3ADB1Y11r73Bc+B6GleagTY2
         h9TqQFEQkZ+W0RPjFPj2tN4CtAmo1dhIozLNP9tlwXbZIF/9jmnszVbaCq2bekApqi7p
         CliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DAIvkORMY0eHuzO0UF6055+MNm4d5HssuHFf88BN1UI=;
        b=Og3+lvXk2AsZ5Ud3a7qQ91upJk++Q4JtRjqgdYbIIJbT5oGvMV8IK+OfkE1nGRB/Ia
         QYQC8pxTU3mZIEFekvk1owzOBMyw/FlpJXdyZJ1vgichc0OaT5Lqp5Vz4tS9oWyMjlv5
         2YmfBtZ4zZuVkJZkeLFyBPCTT0Vh9j3KDqzlpfBUGp5oRZ7S5ehN0tlmB03SJMImYtI3
         LI7keMyrhfm6/43biKqwfubjfbISXdGzbLNh2JmK6LHsnya0+YkbQWOAiZsZnP6ETRHn
         KoTuMg9285AosonC8TL+EcEQ6Pm0tYCbUs0nme64p/G7BthH9TwBalFiCVFXVeQHr2s5
         w/Gg==
X-Gm-Message-State: AJIora+sf7N9UyJJtdUdXNMuSUA/L3be35Zc2iukJqiu5NuDbq302T4G
        aaYkZI2C/0EdRahRM3sbLoJ1jg==
X-Google-Smtp-Source: AGRyM1tHTIAmGVl8qjAwCJwYZFFQqlZezy4v4mw7f2zjYYHeDaow0QxrcsOXFWlylngpaVlqoaEBMQ==
X-Received: by 2002:a4a:8f51:0:b0:425:a539:f876 with SMTP id f17-20020a4a8f51000000b00425a539f876mr1973480ool.88.1657747756247;
        Wed, 13 Jul 2022 14:29:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r31-20020a4a9662000000b00431d44849e9sm4907783ooi.20.2022.07.13.14.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:29:15 -0700 (PDT)
Date:   Wed, 13 Jul 2022 16:29:13 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Message-ID: <Ys85KUGnlXlUI+zE@builder.lan>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Jun 06:07 CDT 2022, Dmitry Baryshkov wrote:

> Add pxo/cxo clocks to the GCC device tree node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index 47b97daecef1..61e3ab0ebfd3 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -50,13 +50,13 @@ cpu-pmu {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {

As requested by Krzysztof, please use clock-output-names to specify the
name of the clock, and rename the node "cxo-board-clk".

Thanks,
Bjorn

>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
>  		};
>  
> -		pxo_board {
> +		pxo_board: pxo_board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <27000000>;
> @@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
>  			#power-domain-cells = <1>;
>  			#reset-cells = <1>;
>  			reg = <0x900000 0x4000>;
> +			clocks = <&pxo_board>, <&cxo_board>;
> +			clock-names = "pxo", "cxo";
>  		};
>  
>  		gsbi6: gsbi@16500000 {
> -- 
> 2.35.1
> 
