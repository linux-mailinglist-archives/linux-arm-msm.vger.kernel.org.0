Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10D43F8F7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 22:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243217AbhHZUJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 16:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240039AbhHZUJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 16:09:48 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DAFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:09:00 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id r2so3967875pgl.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 13:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VHDAlaTfHXt7FKs8c2LGFeGm+rtm8CR5b7sqru6Uaj0=;
        b=VZvCLjbcIcQqQWcDSeljuWzefS7PKmWkpsMta3enfmpNdYi4q/8jiXFd9pYCEIl1dq
         JD76iHG8/vOzw9NbVOzGynclP6TUMN+I9J3vaAAXoK1r29BH5DKfA1cT9B3ew7s8D/tH
         AvrCrLQVFGliSBlwhGubr/8YI1GhiGvA80B8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VHDAlaTfHXt7FKs8c2LGFeGm+rtm8CR5b7sqru6Uaj0=;
        b=V799Xpu5tCoEYAGVmhDdqWn5HAA1SqF21bHX45eKmYpyfI8+Fchyd30u3cyYrMWXFc
         enu5F7uo7Zpu/2OoV5xnrH2umluVrngdq0W/doit9uc0fmZG5u1FXSO19++Ck/jE2Dvq
         VhI9ef0TRaL8fIXgCYwEIQGo1H3VPGGCWqdYq2kulQrRMZXp92BAIsLWtZ8EoQ/VyrJ9
         XuHtgefOUoKsRZTV+IxaXZ4EvBq8dJqkkgF1ti649ynxpcfWp78Law2r/3sLh5dsgjsL
         LnEq1Vqk2Y9dafw7p2Mp1Uv322B1DxQV1PfE2n+hQJUOh4KQd77mZBGUD62VD2AbLvy9
         qKDQ==
X-Gm-Message-State: AOAM533T9iJpMNL5+NqZIP0EbO5Rplx7Me2F+S2zJLJeuxRRZNz2zblb
        nhX+xeglo7mIsMawMMUanoIMVg==
X-Google-Smtp-Source: ABdhPJwaH37zWLuWNEouCD1xD5dP5HXtxiGY0oIMlRyxgwwxyEPFpsxnqfmcLcPYO4apNp/yQ/o3fg==
X-Received: by 2002:a63:5013:: with SMTP id e19mr4775006pgb.63.1630008540062;
        Thu, 26 Aug 2021 13:09:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:bd0b:bcb8:ebdb:c24d])
        by smtp.gmail.com with UTF8SMTPSA id n10sm3895505pjp.3.2021.08.26.13.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 13:08:59 -0700 (PDT)
Date:   Thu, 26 Aug 2021 13:08:57 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V6 3/7] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Message-ID: <YSf02XebkyqT+8fo@google.com>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
 <1629983731-10595-4-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629983731-10595-4-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 06:45:27PM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 724 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 722 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index f8dd5ff..da3cf19 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -434,6 +434,25 @@
>  		};
>  	};
>  
> +	qup_opp_table: qup-opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-75000000 {
> +			opp-hz = /bits/ 64 <75000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-100000000 {
> +			opp-hz = /bits/ 64 <100000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-128000000 {
> +			opp-hz = /bits/ 64 <128000000>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -536,24 +555,425 @@
>  		qupv3_id_0: geniqup@9c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0 0x009c0000 0 0x2000>;
> -			clock-names = "m-ahb", "s-ahb";
>  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +			clock-names = "m-ahb", "s-ahb";
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> +			iommus = <&apps_smmu 0x123 0x0>;
>  			status = "disabled";
>  
> +			i2c0: i2c@980000 {
> +				compatible = "qcom,geni-i2c";
> +				reg = <0 0x00980000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +				clock-names = "se";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_i2c0_data_clk>;
> +				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
> +						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
> +						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
> +				interconnect-names = "qup-core", "qup-config",
> +							"qup-memory";
> +				status = "disabled";
> +			};
> +
> +			spi0: spi@980000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x00980000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +				clock-names = "se";
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>, <&qup_spi0_cs_gpio>;

as per the discussion on v5 (https://patchwork.kernel.org/project/linux-arm-msm/patch/1628754078-29779-4-git-send-email-rajpat@codeaurora.org/)
I remain unconvinced that configuring the CS pin both as CS and GPIO is a good idea.

If you think it is necessary in this case (maybe some kind of quirk?) please
provide a rationale.
