Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B493B473E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 18:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFYQQK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 12:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFYQQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 12:16:09 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E118CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 09:13:48 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id m6-20020a9d1d060000b029044e2d8e855eso7829916otm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MWWpxotgdBre27isI3DwZKQ334uPd/zecV0Lcyc3n7Q=;
        b=N7zn6P76h5T81mOnWCupIHAcZvozSOjxZGTu/yWBXAFYQ7KtjfLycqT4XiBEFUrId1
         xuFky7NkApH6BPvpnPP0zRNbC/4HgA3jtVvNGI+RUnb24WxoZeD9R+pzeMjUpHHNOo64
         tHsRlMmWYgu6iwZ5Y1+vzK6RUg+S1UytBwSb/jEKBmT4hkrEWavEbxCZoV8vrmNjpV+R
         WjDZQspCHpjwecQvvyvEw3rK09fdE1nXSzAmX3hc1Mn/MId88dV7sZ6g6dO+M1Eg6b/+
         aznWTPJMenw99Iu2z8iwu/CLCOCmax7ptRtYD5oxbeGmSDu4wg2B69pO0hmJ5I5xAQrT
         VxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MWWpxotgdBre27isI3DwZKQ334uPd/zecV0Lcyc3n7Q=;
        b=OQG/pAauYkObzCpsh8Khf5Ge/RVYoCpa2/KTxEBaKZLnM2TzBv1VcTDN3N8VzLtSjp
         q4sC5x8Vc9t/NkVPdmdROOzmEbU9kJtaL+knphZ3CE7uTIzEgNaN1hOk3PEcKmhEMIsy
         UD79kCKQp5gZbDXIJQz4MQ5sQSy1aG/YdqpmyBHYWxQT6sdZkfdk+hG7M7Gd58efIKnA
         fdVPphaC/uh0XPUxPEZQkX+gGs7qEIBSkPvHqg4SrNfoZSehn52Lo6VDtnCu+LjZ6KFa
         eW7h5c9c+bAhSTLH2msYgYaV/5oXgbTYqWNBT4CqyVJLsRAOoKfaOMWausutxkCgzwD7
         O7/A==
X-Gm-Message-State: AOAM531nrLgy8MyQZ5x9avQwOB6g+hX+omdmwTRN5K3ZnEU1+sFOoj/U
        UOn6jLCF9xxq19xLaSPIABGTww==
X-Google-Smtp-Source: ABdhPJxTOT8pJDLAz3xdWNJ/+53maozvDLTDh1AQoHyWbRZamb70O7ND1oumpz1JDJMQrWT5GODECg==
X-Received: by 2002:a05:6830:1309:: with SMTP id p9mr10338163otq.209.1624637628209;
        Fri, 25 Jun 2021 09:13:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q9sm1509884ots.1.2021.06.25.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 09:13:47 -0700 (PDT)
Date:   Fri, 25 Jun 2021 11:13:45 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add DisplayPort node
Message-ID: <YNYAuaBrGgdtToph@builder.lan>
References: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Jun 17:22 CDT 2021, Kuogee Hsieh wrote:

> Add DP device node on sc7180.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> Changes in v2:
> -- replace msm_dp with dp
> -- replace dp_opp_table with opp_table
> 
> Changes in v3:
> -- correct text of commit title
> 
> Changes in v4:
> -- replace dp with mdss_dp
> -- replace opp_table with dp_opp_table
> 
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 78 ++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..051fb40 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>  	status = "okay";
>  };
>  
> +&mdss_dp {
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
> index 6228ba2..c779ad3 100644
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
> +			mdss_dp: displayport-controller@ae90000 {
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
> +				operating-points-v2 = <&dp_opp_table>;
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
> +				dp_opp_table: dp-opp-table {

I forgot that our discussion about the node name here was on the
previous revision, _this_ is the patch I will drop the "dp-" from and
apply.

And as I've looked at this quite a bit now:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for following up on the other feedback!

Regards,
Bjorn

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
