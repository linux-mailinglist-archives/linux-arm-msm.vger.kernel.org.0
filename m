Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227E7619B2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 16:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbiKDPPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 11:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbiKDPPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 11:15:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6282410D9;
        Fri,  4 Nov 2022 08:15:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F12076224E;
        Fri,  4 Nov 2022 15:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884BEC433C1;
        Fri,  4 Nov 2022 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667574918;
        bh=qxe9QLnJVFO3g780VADLn9uwp3GHTLedQwLcrp06fI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=boAdFwdrgL0yEL9x07dMDkx+KrTxVQ+VR4NJuHsjCQ2bkL9aE+Qx8XTJiVprqQc1f
         FjUfgBPHrEPahhxIo2yNOvbRMsPJSEPBvHY1gE7JCQtkgZRvqADNzFmx2RmfZoXh6B
         VOo86va/4vFb6AZYtXgDLeAQgValHH0bD6HvCeQcG641fe6lnWVB1hoMkfZgDxWuta
         N00uf5hp3FhbKhweBZPT9Z9rKFiUAvZBU33SPD8Te4qTJgM1DDLyQd7dAJz7otu/Yz
         8x8cEsq6z9BzS159ocTUETG1YgQR8CVBe5s2Jge+fwnzZgBSSs8u90KxTYy483J4Ip
         gVzglRNh+6tKw==
Date:   Fri, 4 Nov 2022 20:45:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
Message-ID: <Y2Usgs8XHgS/KkxN@matsya>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-11-22, 16:13, Dmitry Baryshkov wrote:
> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
> configuration (yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 38ccd44620d0..e1a4cf1ee51d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>  	vdda-phy-supply = <&vreg_l6b_1p2>;
>  	vdda-pll-supply = <&vreg_l1b_0p91>;
>  };
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l6b_1p2>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5b_0p88>;
> +};

This is missing dispcc, please enable that node too.

Also, sort this please

> -- 
> 2.35.1

-- 
~Vinod
