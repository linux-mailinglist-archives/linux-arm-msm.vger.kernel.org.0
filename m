Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9908752784C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 16:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbiEOOy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 May 2022 10:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiEOOyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 May 2022 10:54:25 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8E09580
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 07:54:24 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A278B3F64F;
        Sun, 15 May 2022 16:54:22 +0200 (CEST)
Date:   Sun, 15 May 2022 16:54:21 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sdm660: move SDHC2 card
 detect pinconf to board files
Message-ID: <20220515145421.4yppctvcjcmed52e@SoMainline.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
 <20220514190138.3179964-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514190138.3179964-11-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 22:01:36, Dmitry Baryshkov wrote:
> This results in dts duplication, but per mutual agreement card detect
> pin configuration belongs to the board files. Move it from the SoC

... depends on the board [hence belongs to the board files]...

> dtsi to the board DT files.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi   | 16 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm630.dtsi             | 12 ------------
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts     | 16 ++++++++++++++++
>  3 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 00baacf28c63..ccde9951e4fb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -549,6 +549,22 @@ vreg_l19a_3p3: l19 {
>  	};
>  };
>  
> +&sdc2_state_on {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-pull-up;
> +		drive-strength = <2>;
> +	};
> +};
> +
> +&sdc2_state_off {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-disable;
> +		drive-strength = <2>;
> +	};
> +};
> +
>  &sdhc_1 {
>  	status = "okay";
>  	supports-cqe;
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 44f048934fc6..e6f06a548011 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -983,12 +983,6 @@ data {
>  					bias-pull-up;
>  					drive-strength = <10>;
>  				};
> -
> -				sd-cd {
> -					pins = "gpio54";
> -					bias-pull-up;
> -					drive-strength = <2>;
> -				};
>  			};
>  
>  			sdc2_state_off: sdc2-off {
> @@ -1009,12 +1003,6 @@ data {
>  					bias-pull-up;
>  					drive-strength = <2>;
>  				};
> -
> -				sd-cd {
> -					pins = "gpio54";
> -					bias-disable;
> -					drive-strength = <2>;
> -				};
>  			};
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 9280c1f0c334..2b1216502eb0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -363,6 +363,22 @@ vreg_l19a_3p3: l19 {
>  	};
>  };
>  
> +&sdc2_state_on {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-pull-up;
> +		drive-strength = <2>;
> +	};
> +};
> +
> +&sdc2_state_off {
> +	sd-cd {
> +		pins = "gpio54";
> +		bias-disable;
> +		drive-strength = <2>;
> +	};
> +};
> +
>  &sdhc_1 {
>  	status = "okay";
>  	supports-cqe;
> -- 
> 2.35.1
> 
