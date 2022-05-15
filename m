Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76461527845
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 May 2022 16:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbiEOOwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 May 2022 10:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237283AbiEOOwU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 May 2022 10:52:20 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99D32DF8
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 07:52:18 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EDEF33F64F;
        Sun, 15 May 2022 16:52:16 +0200 (CEST)
Date:   Sun, 15 May 2022 16:52:15 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/12] arm64: dts: qcom: sdm630: use defined symbols
 for interconnects
Message-ID: <20220515145215.h2l67h3r5nazuhgz@SoMainline.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
 <20220514190138.3179964-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514190138.3179964-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-14 22:01:34, Dmitry Baryshkov wrote:
> Replace numeric values with the symbolic names defined in the bindings
> header.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 6d0bc9e8fb5b..44f048934fc6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,gpucc-sdm660.h>
>  #include <dt-bindings/clock/qcom,mmcc-sdm660.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/interconnect/qcom,sdm660.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -1045,7 +1046,7 @@ adreno_gpu: gpu@5000000 {
>  			nvmem-cells = <&gpu_speed_bin>;
>  			nvmem-cell-names = "speed_bin";
>  
> -			interconnects = <&bimc 1 &bimc 5>;
> +			interconnects = <&bimc MASTER_OXILI &bimc SLAVE_EBI>;
>  			interconnect-names = "gfx-mem";
>  
>  			operating-points-v2 = <&gpu_sdm630_opp_table>;
> @@ -1299,8 +1300,8 @@ sdhc_2: sdhci@c084000 {
>  					<&xo_board>;
>  			clock-names = "core", "iface", "xo";
>  
> -			interconnects = <&a2noc 3 &a2noc 10>,
> -					<&gnoc 0 &cnoc 28>;
> +			interconnects = <&a2noc MASTER_SDCC_2 &a2noc SLAVE_A2NOC_SNOC>,
> +					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_2>;
>  			operating-points-v2 = <&sdhc2_opp_table>;
>  
>  			pinctrl-names = "default", "sleep";
> @@ -1351,8 +1352,8 @@ sdhc_1: sdhci@c0c4000 {
>  				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>  			clock-names = "core", "iface", "xo", "ice";
>  
> -			interconnects = <&a2noc 2 &a2noc 10>,
> -					<&gnoc 0 &cnoc 27>;
> +			interconnects = <&a2noc MASTER_SDCC_1 &a2noc SLAVE_A2NOC_SNOC>,
> +					<&gnoc MASTER_APSS_PROC &cnoc SLAVE_SDCC_1>;
>  			interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
>  			operating-points-v2 = <&sdhc1_opp_table>;
>  			pinctrl-names = "default", "sleep";
> @@ -1525,9 +1526,9 @@ mdp: mdp@c901000 {
>  					      "core",
>  					      "vsync";
>  
> -				interconnects = <&mnoc 2 &bimc 5>,
> -						<&mnoc 3 &bimc 5>,
> -						<&gnoc 0 &mnoc 17>;
> +				interconnects = <&mnoc MASTER_MDP_P0 &bimc SLAVE_EBI>,
> +						<&mnoc MASTER_MDP_P1 &bimc SLAVE_EBI>,
> +						<&gnoc MASTER_APSS_PROC &mnoc SLAVE_DISPLAY_CFG>;
>  				interconnect-names = "mdp0-mem",
>  						     "mdp1-mem",
>  						     "rotator-mem";
> @@ -2034,7 +2035,7 @@ camss: camss@ca00000 {
>  				"cphy_csid1",
>  				"cphy_csid2",
>  				"cphy_csid3";
> -			interconnects = <&mnoc 5 &bimc 5>;
> +			interconnects = <&mnoc MASTER_VFE &bimc SLAVE_EBI>;
>  			interconnect-names = "vfe-mem";
>  			iommus = <&mmss_smmu 0xc00>,
>  				 <&mmss_smmu 0xc01>,
> @@ -2097,8 +2098,8 @@ venus: video-codec@cc00000 {
>  				 <&mmcc VIDEO_AXI_CLK>,
>  				 <&mmcc THROTTLE_VIDEO_AXI_CLK>;
>  			clock-names = "core", "iface", "bus", "bus_throttle";
> -			interconnects = <&gnoc 0 &mnoc 13>,
> -					<&mnoc 4 &bimc 5>;
> +			interconnects = <&gnoc MASTER_APSS_PROC &mnoc SLAVE_VENUS_CFG>,
> +					<&mnoc MASTER_VENUS &bimc SLAVE_EBI>;
>  			interconnect-names = "cpu-cfg", "video-mem";
>  			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>  			iommus = <&mmss_smmu 0x400>,
> -- 
> 2.35.1
> 
