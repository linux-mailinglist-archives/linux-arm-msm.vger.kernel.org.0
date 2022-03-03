Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4834CBE54
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 14:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiCCNBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 08:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233476AbiCCNBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 08:01:43 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE07186412
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 05:00:57 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4B66C3F67D;
        Thu,  3 Mar 2022 14:00:55 +0100 (CET)
Date:   Thu, 3 Mar 2022 14:00:54 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: msm8996: Drop flags for mdss
 irqs
Message-ID: <20220303130054.dxrwgq7vpzvgvip2@SoMainline.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-03-03 01:54:06, Dmitry Baryshkov wrote:
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Fixes: 12d540375736 ("arm64: dts: qcom: msm8996: Add DSI0 nodes")
> Fixes: 3a4547c1fc2f ("arm64: qcom: msm8996.dtsi: Add Display nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for adding the Fixes: tag.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index f0f81c23c16f..0597d865a4a6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -788,7 +788,7 @@ mdp: mdp@901000 {
>  				reg-names = "mdp_phys";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <0>;
>  
>  				clocks = <&mmcc MDSS_AHB_CLK>,
>  					 <&mmcc MDSS_AXI_CLK>,
> @@ -834,7 +834,7 @@ dsi0: dsi@994000 {
>  				reg-names = "dsi_ctrl";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <4>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_BYTE0_CLK>,
> @@ -904,7 +904,7 @@ hdmi: hdmi-tx@9a0000 {
>  					    "hdcp_physical";
>  
>  				interrupt-parent = <&mdss>;
> -				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <8>;
>  
>  				clocks = <&mmcc MDSS_MDP_CLK>,
>  					 <&mmcc MDSS_AHB_CLK>,
> -- 
> 2.34.1
> 
