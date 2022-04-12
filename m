Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 020C74FCC2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 04:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244324AbiDLCJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 22:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244798AbiDLCJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 22:09:49 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A9033E1D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:07:30 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id n19-20020a9d7113000000b005cd9cff76c3so12525663otj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 19:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SCI03q6KO7RJ8Z0gQrLEcavVh4DD9/KhxNuCwaK92/8=;
        b=j9n/z9YTNVBTgBoufuLxjrlPhahiK7Y1pEkMlxFHdAn45f8wAwn2Q4pTg3k4vy5oa8
         AeHX9/XcI4VjU+rUBWo8GKubGHa/N4ACtQsa1G4HUR3t8o1zjlo3eMY3Ei6V3BYiCOfR
         te7JzGAaw+fIVt/+E+qiefPCh/3rgJiY1uOYGpwRWziG0aBUdnM94fvACKTIS9T/Dovk
         sMAVz4hvwWOAOGaS0/spD7SlonJX5iNxlEtS2X447SaOcCVxvWiVJ4HRjgZ3Hjg9235F
         K7MJLibHxeApa/fPUDfPLXZftKzfxpGms/LFb27JZpERXftJGIP+UR7YzizfbFhWf44n
         dDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SCI03q6KO7RJ8Z0gQrLEcavVh4DD9/KhxNuCwaK92/8=;
        b=k3juSVGXYuTav9XwO17eaou0UVojjPIHr7lKop/OOmTDMNKGR6XeofOLSDULJqyR2b
         pjyBIEbdeFWUGSA5MZKP9/86dvUNgED+08pdoMXGiM1k4k/C69oakC317LTnSgAA8jku
         nYRpO96g37CdLQ18UoX4YumTvjZ+Np5EpGSHUyaKwg/PZXg2+LLXrgxS4kXq+Ztg7nhx
         dbN5qgo1PMa/t2VV12+G+ybFJ8hhRhuyzVknSx03dIh38DNtCpBnliA1yHF1LoT6JDYa
         uvS2lREy6aBXwQu2OVAGH2OfzA1w5zFaUUL/2TinYItThVAIjoABtfU0QrKySQy9ogre
         qurg==
X-Gm-Message-State: AOAM530LNcBm35crTmS58Th1ixSRDs4WwA5aYdh3uWu1XQek4MkXOsFi
        aWTrTbGp22YdJrtRLtosY1ad2PSqIY7E7M9A
X-Google-Smtp-Source: ABdhPJztTgonoMLn9nU1x+YCwXavZRhiu3FBPzb5YXoVo7oYK3T88HqG7LAXOLMsG8REuabw3aQjMw==
X-Received: by 2002:a9d:368:0:b0:5b2:585c:da24 with SMTP id 95-20020a9d0368000000b005b2585cda24mr12485641otv.8.1649729249445;
        Mon, 11 Apr 2022 19:07:29 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id e81-20020a9d01d7000000b005cdbabcbab0sm12861668ote.22.2022.04.11.19.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 19:07:28 -0700 (PDT)
Date:   Mon, 11 Apr 2022 21:07:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm8250: camss: Add CAMSS block
 definition
Message-ID: <YlTe3/RSGwMNuwOJ@builder.lan>
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
 <20220409164556.2832782-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409164556.2832782-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 09 Apr 11:45 CDT 2022, Bryan O'Donoghue wrote:

> Adds a CAMSS definition block.
> 
> Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 153 +++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 906bc8ed25b7..3d6c617de045 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3150,6 +3150,159 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: camss@ac6a000 {
> +			compatible = "qcom,sm8250-camss";
> +			status = "disabled";
> +
> +			reg = <0 0xac6a000 0 0x2000>,
> +			      <0 0xac6c000 0 0x2000>,
> +			      <0 0xac6e000 0 0x1000>,
> +			      <0 0xac70000 0 0x1000>,
> +			      <0 0xac72000 0 0x1000>,
> +			      <0 0xac74000 0 0x1000>,
> +			      <0 0xacb4000 0 0xd000>,
> +			      <0 0xacc3000 0 0xd000>,
> +			      <0 0xacd9000 0 0x2200>,
> +			      <0 0xacdb200 0 0x2200>;
> +			reg-names = "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "csiphy4",
> +				    "csiphy5",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy3",
> +					  "csiphy4",
> +					  "csiphy5",
> +					  "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid3",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			power-domains = <&camcc IFE_0_GDSC>,
> +					<&camcc IFE_1_GDSC>,
> +					<&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY3_CLK>,
> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY5_CLK>,
> +				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_IFE_0_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AREG_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AREG_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "cam_ahb_clk",
> +				      "cam_hf_axi",
> +				      "cam_sf_axi",
> +				      "camnoc_axi",
> +				      "camnoc_axi_src",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy3",
> +				      "csiphy3_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "csiphy5",
> +				      "csiphy5_timer",
> +				      "slow_ahb_src",
> +				      "vfe0_ahb",
> +				      "vfe0_axi",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe0_csid",
> +				      "vfe0_areg",
> +				      "vfe1_ahb",
> +				      "vfe1_axi",
> +				      "vfe1",
> +				      "vfe1_cphy_rx",
> +				      "vfe1_csid",
> +				      "vfe1_areg",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_axi",
> +				      "vfe_lite",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			iommus = <&apps_smmu 0x800 0x400>,
> +				 <&apps_smmu 0x801 0x400>,
> +				 <&apps_smmu 0x840 0x400>,
> +				 <&apps_smmu 0x841 0x400>,
> +				 <&apps_smmu 0xC00 0x400>,
> +				 <&apps_smmu 0xC01 0x400>,
> +				 <&apps_smmu 0xC40 0x400>,
> +				 <&apps_smmu 0xC41 0x400>;

Please use lower case hex digits in the iommus property as well.

Thanks,
Bjorn

> +
> +			interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_CAMERA_CFG>,
> +					<&mmss_noc MASTER_CAMNOC_HF &mc_virt SLAVE_EBI_CH0>,
> +					<&mmss_noc MASTER_CAMNOC_SF &mc_virt SLAVE_EBI_CH0>,
> +					<&mmss_noc MASTER_CAMNOC_ICP &mc_virt SLAVE_EBI_CH0>;
> +			interconnect-names = "cam_ahb",
> +					     "cam_hf_0_mnoc",
> +					     "cam_sf_0_mnoc",
> +					     "cam_sf_icp_mnoc";
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,sm8250-camcc";
>  			reg = <0 0x0ad00000 0 0x10000>;
> -- 
> 2.35.1
> 
