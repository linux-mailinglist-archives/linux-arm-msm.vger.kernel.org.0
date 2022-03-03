Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897604CBE5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 14:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbiCCNCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 08:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiCCNCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 08:02:42 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D418640C
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 05:01:56 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 587923F94F;
        Thu,  3 Mar 2022 14:01:54 +0100 (CET)
Date:   Thu, 3 Mar 2022 14:01:53 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: sdm845: Drop flags for mdss irqs
Message-ID: <20220303130153.fwg3vfz5ofvd5ary@SoMainline.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
 <20220302225411.2456001-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302225411.2456001-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-03-03 01:54:09, Dmitry Baryshkov wrote:
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 08c2a076d18f ("arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for adding the Fixes: tag.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 41f4e46e1f85..95e6a97c2170 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4281,7 +4281,7 @@ mdss_mdp: mdp@ae01000 {
>  				power-domains = <&rpmhpd SDM845_CX>;
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <0>;
>  
>  				ports {
>  					#address-cells = <1>;
> @@ -4333,7 +4333,7 @@ dsi0: dsi@ae94000 {
>  				reg-names = "dsi_ctrl";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <4>;
>  
>  				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>  					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> @@ -4405,7 +4405,7 @@ dsi1: dsi@ae96000 {
>  				reg-names = "dsi_ctrl";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <5>;
>  
>  				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
>  					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> -- 
> 2.34.1
> 
