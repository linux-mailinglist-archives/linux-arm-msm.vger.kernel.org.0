Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD639A667
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 18:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhFCQ5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 12:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhFCQ5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 12:57:46 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8F8C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 09:56:01 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v142so6506748oie.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mX0haAANX9Ohl4Z8WOCYfoEFijudUEJiwohJAuQC02c=;
        b=E7gdFcfwwZk7HmQ39zxmvX/yTsBZjXSyT/Yh6ZyK3X2oG5Bw6amUuTiTPrsOwy6kgZ
         B5tW/iWZvcNhruetACGyvRTD0P7EP+pM/4pEhrwTbkdVEFcqoWmBI+nbTzfUzXvm6tId
         QCDfi7lTrixquP/z55TlYmB+GxG6PB4DmyPJXVEj2dL/4K5XDCEJ90HQlxDV6xa6KT0z
         W7fkr1RnCW+Hato7dLIZsIGe+vP8u/lM+JRDb5Aw60xNBjoZBWxCV7M+pRVKfwnEeepl
         kR64NgQ50fSStAbaU0ooPvLmuPoP/QqnSNkkytaSiZmHWGEp1AhH4RmRQGYwlw/dMtxk
         MdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mX0haAANX9Ohl4Z8WOCYfoEFijudUEJiwohJAuQC02c=;
        b=sbCMCV4+UnwBxrJb8rTRVfJnBE4vj+VX2eCm6WQw9hAvL8fbqVsfCxzwJhg5UKnWFp
         ISSW3083Okh3enUVegY4UNE5jf1otGAYPsL7fEziQEy+B27N57KM8z5zcbZt1GQIh0hn
         46fhtC8LM4KdN03fX7wpSUtjAhZ06X032rg1bgViwgr8IL1UzUNskG6W3z90zeN2FtP8
         kfRV6CJ6Cag8f39k1iFMESd4Q5Xe0ZZslCh41MwH/aUuI4gh0dTznZh2RQYHDttW3pmH
         4Qp+mQnd/bGzLvVVV5Lhy4u5LKlXSDi2uMB9x6wZ/ANcSPzcbjZiirr6SIr9sLB4155C
         /46A==
X-Gm-Message-State: AOAM530zDOtBMlyM+JwwSx27y6Wh5YUHRhpdHsqugDLJ2DSTQqENus/q
        VwYCu+IlhEPJmmQ6CnIU8gPBAw==
X-Google-Smtp-Source: ABdhPJyH8XlibAf+nkUPd+aUoPXdrt4Uu4nVZEpvj3KHhEHg0ADoVLdvXpEkcF8+yqTYU3JWMkFp1Q==
X-Received: by 2002:aca:be8a:: with SMTP id o132mr7819096oif.3.1622739361220;
        Thu, 03 Jun 2021 09:56:01 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z25sm818070oic.30.2021.06.03.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:56:00 -0700 (PDT)
Date:   Thu, 3 Jun 2021 11:55:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add DisplayPort  node
Message-ID: <YLkJnmYujyPu1Zzu@yoga>
References: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Jun 11:37 CDT 2021, Kuogee Hsieh wrote:

> Add DP device node on sc7180.
> 
> Changes in v2:
> -- replace msm_dp with dp
> -- replace dp_opp_table with opp_table
> 
> Changes in v3:
> -- correct text of commit title

In addition to the feedback I gave on v2, please also remove one of the
two spaces between "DisplayPort" and "node" in $subject.

Thanks,
Bjorn

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78 ++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..40367a2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  };
>  
> +&dp {
> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&dp_hot_plug_det>;
> +        data-lanes = <0 1>;
> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
> +};
> +
>  &pm6150_adc {
>  	charger-thermistor@4f {
>  		reg = <ADC5_AMUX_THM3_100K_PU>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6228ba2..05a4133 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3032,6 +3032,13 @@
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&dp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: mdp-opp-table {
> @@ -3148,6 +3155,77 @@
>  
>  				status = "disabled";
>  			};
> +
> +			dp: displayport-controller@ae90000 {
> +				compatible = "qcom,sc7180-dp";
> +				status = "disabled";
> +
> +				reg = <0 0x0ae90000 0 0x1400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +				clock-names = "core_iface", "core_aux", "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +				phys = <&dp_phy>;
> +				phy-names = "dp";
> +
> +				operating-points-v2 = <&opp_table>;
> +				power-domains = <&rpmhpd SC7180_CX>;
> +
> +				#sound-dai-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						dp_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dp_out: endpoint { };
> +					};
> +				};
> +
> +				opp_table: dp-opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
