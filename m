Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630C751995A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346091AbiEDIOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346088AbiEDIOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:14:43 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA2022520;
        Wed,  4 May 2022 01:11:08 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AD9153F7A6;
        Wed,  4 May 2022 10:11:04 +0200 (CEST)
Date:   Wed, 4 May 2022 10:11:02 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/5] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy
 by default
Message-ID: <20220504081102.g36yjajytvuaba7r@SoMainline.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
 <20220503220927.960821-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503220927.960821-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-04 01:09:23, Dmitry Baryshkov wrote:
> Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
> They should be enabled in the board DT files. No existing boards use
> them at this moment.

This practice also seems to be applied to dsi0/dsi0_phy across other
boards.  Should this also be applied to sdm630.dtsi's dsi0/dsi0_phy
nodes, and them subsequently re-enabled in sdm630-sony-xperia-nile.dtsi?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

- Marijn
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index eccf6fde16b4..023b0ac4118c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
>  		phys = <&dsi1_phy>;
>  		phy-names = "dsi";
>  
> +		status = "disabled";
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
>  
>  		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  		clock-names = "iface", "ref";
> +		status = "disabled";
>  	};
>  };
>  
> -- 
> 2.35.1
> 
