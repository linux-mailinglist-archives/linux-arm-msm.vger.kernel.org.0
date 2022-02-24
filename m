Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A51B4C22E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 05:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiBXEIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 23:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbiBXEIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 23:08:36 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791CF6CA79
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:08:07 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id d134-20020a4a528c000000b00319244f4b04so1729285oob.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 20:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Azle15C+HoEiGQXdHDwGYXJ11gS3sDUHSc9GrVhTbSA=;
        b=S10ygTHEizq9Ut3ACtHJUKsFSGBMY2mhEMSYUoTxQR2sU5Z4UJ6uCtsC4dVOGsmUVX
         zY2yUK/UGfkzSHY2lxIMaYfrGOr0Ta8p/f+8pjXw5zj3W7tn6dKBnaztEXrFeeeN6hhN
         SjUUTX1mw46dNS9lk1XmGP01MkJXRLKetxZKZcAxQG5vhu6VB6iI6eAHywZZ7WmszXDi
         fm9wnMWs+i2bkTbyiBDAYQznLDqi6fwNe7cm2evCdmG4Yyiv+lOAg2Iw17NLiN+Je0pL
         gjqnL2V/ffPBSLgP/LqHz6zXaoaN14CF5v0ihzEC9Hnk5huWe1HqEKZLDUu8FAVDQER+
         Vjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Azle15C+HoEiGQXdHDwGYXJ11gS3sDUHSc9GrVhTbSA=;
        b=GCSeJdODLBpULEE6AGzBC9hyEQlSCe/og8s4uA2KbQx2Buch5fxg+kRWmr+PG9GHln
         gs4TT6rCnz+SVWEYTml3gV9vmwwmSqdkkGLakw3r8CdTT2gTFdnRT3EtsPmhiXQ0vC5R
         +9NgrI2MUdYaLqPaDJgcll6rP7Fs9PjGNB0vkGN9TIZ3oX2fNZFKYa4JXKGex/OErI3o
         t88Ate6L0pw8C2NnN6+CBcH93iCfrq1KjWOXMUPlCAhlBcbG2l+7F4BDCj7Y9yHRdxo7
         cmrydef5xZbl1h7UecMqHzGnuEhBMZF20oNEBKTbeeKY2wNB/Jq3kFVuc+7S95Xl20Iz
         8CLQ==
X-Gm-Message-State: AOAM533apj6tQe+JJMRHtlFIRd6MVBfxcbflIICiezMVBVrpr1ETDPKh
        1h1ga8vWfdvB7lCwrxIEpqZk6A==
X-Google-Smtp-Source: ABdhPJyHDBdx3uCvBa9lbNhGaZj5nle5F8yurA92Tyqnxts8gDdmci2JGTGC8NHKgGwQH4jWqrMI0w==
X-Received: by 2002:a05:6870:b69a:b0:d6:d137:2734 with SMTP id cy26-20020a056870b69a00b000d6d1372734mr258982oab.199.1645675686876;
        Wed, 23 Feb 2022 20:08:06 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id j32sm672603ota.59.2022.02.23.20.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:08:06 -0800 (PST)
Date:   Wed, 23 Feb 2022 22:08:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] ARM: dts: qcom: Add syscon and cxo/pxo clock to
 gcc node for ipq8064
Message-ID: <YhcEpGTN2Gm4VJEn@builder.lan>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-17-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217235703.26641-17-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Feb 17:57 CST 2022, Ansuel Smith wrote:

> Add syscon compatible required for tsens driver to correctly probe driver
> and access the reg. Also add cxo and pxo tag and declare them as gcc clock
> now requires them for the ipq8064 gcc driver that has now been modernized.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 11481313bdb6..5524a68cf3d1 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -298,13 +298,13 @@ smem: smem@41000000 {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo_board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <25000000>;
>  		};
>  
> -		pxo_board {
> +		pxo_board: pxo_board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <25000000>;
> @@ -736,7 +736,9 @@ tsens_calib_backup: calib_backup@410 {
>  		};
>  
>  		gcc: clock-controller@900000 {
> -			compatible = "qcom,gcc-ipq8064";
> +			compatible = "qcom,gcc-ipq8064", "syscon";
> +			clocks = <&pxo_board>, <&cxo_board>;
> +			clock-names = "pxo", "cxo";
>  			reg = <0x00900000 0x4000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.34.1
> 
