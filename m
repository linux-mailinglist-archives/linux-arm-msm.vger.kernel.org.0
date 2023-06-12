Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C4F72BC04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234475AbjFLJYI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjFLJX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:23:29 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1BC1FE4;
        Mon, 12 Jun 2023 02:17:33 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5599A3EEF4;
        Mon, 12 Jun 2023 11:17:31 +0200 (CEST)
Date:   Mon, 12 Jun 2023 11:17:30 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: use proper DSI PHY compatible
Message-ID: <jhdzw7sgfedwhld2ttqlykwomrfghlzk4mx2dgozizlz7rrmma@mvntbfz2rzgs>
References: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-12 06:16:23, Dmitry Baryshkov wrote:
> The DSI PHY on the Qualcomm SM8150 platform requires platform-specific
> handling. Use the proper SoC-specific compatible string for the DSI
> PHYs.
> 
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Unfortunate that this SoC still uses the "wrong" format, all other SoCs
are qcom,sm8150-dsi-phy-7nm.

> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 197c016aaeba..95d361443dff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3832,7 +3832,7 @@ opp-358000000 {
>  			};
>  
>  			mdss_dsi0_phy: phy@ae94400 {
> -				compatible = "qcom,dsi-phy-7nm";
> +				compatible = "qcom,dsi-phy-7nm-8150";
>  				reg = <0 0x0ae94400 0 0x200>,
>  				      <0 0x0ae94600 0 0x280>,
>  				      <0 0x0ae94900 0 0x260>;
> @@ -3906,7 +3906,7 @@ mdss_dsi1_out: endpoint {
>  			};
>  
>  			mdss_dsi1_phy: phy@ae96400 {
> -				compatible = "qcom,dsi-phy-7nm";
> +				compatible = "qcom,dsi-phy-7nm-8150";
>  				reg = <0 0x0ae96400 0 0x200>,
>  				      <0 0x0ae96600 0 0x280>,
>  				      <0 0x0ae96900 0 0x260>;
> -- 
> 2.39.2
> 
