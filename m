Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358E53F08D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 18:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHRQPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 12:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbhHRQPR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 12:15:17 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF721C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 09:14:42 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id w6so2086360plg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/XpeMbE0cedXmwuwUc/IBOQeV2qs0fBRVLWO6KJw4i0=;
        b=QVZS8hvaokW7Rt90QwrZr6OVmeqYKKPauf+0OHbWua3HvLKukt9vBjzQzxxt5jAe2H
         4CNdUz/mlx6KsUV5AVf0WVwze9hgUZozU4Zx7o5NTjcTZ1EF1K9C+wHQNTv8lRGdoEnd
         Iq0m6pMSmRBuLWXfnYNnRdw7NU4tKJaa3hqHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XpeMbE0cedXmwuwUc/IBOQeV2qs0fBRVLWO6KJw4i0=;
        b=HODPR4n6wI6KUGOmknv55PYBf0RghjoQ85Gy9P78gH1ygmGi3seJ2NFXhCTvAM9Xm7
         vmyoKVqEyElKjJccY2bIQzaHzgBb9ZVpjwqn+K5beKO13ORq5vI43ZCUgOkQ0JBEXu0V
         SS5p+IGABzZ8htq0ScvW10avJjYMKGlDg/6EPy5T34QAqOXaD9zxL+/qRxswzhgSlck/
         GcNuBKUYTaFL1ErsmHKcj+iiSIWqUqzvQzqZBSOjLX/r/8n6HemFhW10utS17ciEUPi4
         p5Eli3DC3SZSdISPyypnZHvqx22IqIJkPiHjA8VLcIUEM/EydtKYiuYkzbqCYITi+mfK
         Mqpg==
X-Gm-Message-State: AOAM5303R7caWyeUSt3FH6Yu7kJp8sX5h3KpbomiF8RBgVk1Uy+F2qzP
        B1K1gXplIj39APboPdeFyAb0U+Lou/JDYg==
X-Google-Smtp-Source: ABdhPJzNkC8cFHGOwPJN+VKQaqv1bzx4/CQLog8Y1S9d7RTSiSjA+HDu+dTUkyaI/W0BKb8LXl4D1A==
X-Received: by 2002:a17:90b:f17:: with SMTP id br23mr3488420pjb.60.1629303282317;
        Wed, 18 Aug 2021 09:14:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:1d24:fb00:9009:ffbe])
        by smtp.gmail.com with UTF8SMTPSA id 22sm179892pgn.88.2021.08.18.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 09:14:41 -0700 (PDT)
Date:   Wed, 18 Aug 2021 09:14:40 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
Message-ID: <YR0x8NQw/Do3L0Zz@google.com>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 18, 2021 at 03:57:04PM +0530, Krishna Manikandan wrote:
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
> 
> Add edp controller and phy DT nodes for sc7280.
> 
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 127 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index aadf55d..5be318e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1412,7 +1412,7 @@
>  			reg = <0 0xaf00000 0 0x20000>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -				 <0>, <0>, <0>, <0>, <0>, <0>;
> +				 <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
>  			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>  				      "dsi0_phy_pll_out_byteclk",
>  				      "dsi0_phy_pll_out_dsiclk",
> @@ -1493,6 +1493,12 @@
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf5_out: endpoint {
> +							remote-endpoint = <&edp_in>;
> +						};
> +					};
>  				};
>  
>  				mdp_opp_table: mdp-opp-table {
> @@ -1608,6 +1614,101 @@
>  
>  				status = "disabled";
>  			};
> +
> +			msm_edp: edp@aea0000 {
> +				status = "disabled";
> +				compatible = "qcom,sc7280-edp";
> +				reg = <0 0xaea0000 0 0x200>,
> +				      <0 0xaea0200 0 0x200>,
> +				      <0 0xaea0400 0 0xc00>,
> +				      <0 0xaea1000 0 0x400>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <14 IRQ_TYPE_NONE>;
> +
> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> +					 <&gcc GCC_EDP_CLKREF_EN>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +				clock-names = "core_xo", "core_ref",
> +					      "core_iface", "core_aux", "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +				#clock-cells = <1>;
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +				assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +				phys = <&edp_phy>;
> +				phy-names = "dp";
> +
> +				vdda-1p2-supply = <&vreg_l6b_1p2>;
> +				vdda-0p9-supply = <&vreg_l10c_0p8>;

These regulators are defined in the board .dts (sc7280-idp.dts), hence the SoC
.dtsi shouldn't depend on them. My impression is that pm7325.dtsi and pm8350c.dtsi
should include definitions for regulators that supply basic SoC blocks. If the
configuration can vary depending on the SoC there could be SoC specific includes
for each PMIC. If a board uses a different configuration it could overwrite the
PMIC .dtsi settings.

> +				operating-points-v2 = <&edp_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&edp_hot_plug_det>, <&edp_panel_power_on>;
> +
> +				panel-bklt-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +				panel-pwm-gpio = <&pm8350c_gpios 8 GPIO_ACTIVE_HIGH>;

The pins are board specific, hence they shouldn't be configured in the .dtsi of
the SoC.

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					port@0 {
> +						reg = <0>;
> +						edp_in: endpoint {
> +							remote-endpoint = <&dpu_intf5_out>;
> +						};
> +					};
> +				};
> +
> +				edp_opp_table: edp-opp-table {
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
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			edp_phy: phy@aec2000 {
> +				status = "disabled";
> +				compatible = "qcom,sc7280-edp-phy";
> +				reg = <0 0xaec2a00 0 0x19c>,
> +				      <0 0xaec2200 0 0xa0>,
> +				      <0 0xaec2600 0 0xa0>,
> +				      <0 0xaec2000 0 0x1c0>;
> +
> +				clocks = <&rpmhcc RPMH_CXO_CLK>,
> +					 <&gcc GCC_EDP_CLKREF_EN>;
> +				clock-names = "aux", "cfg_ahb";
> +
> +				vdda-pll-supply = <&vreg_l6b_1p2>;
> +				vdda-phy-supply = <&vreg_l10c_0p8>;
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +			};
>  		};
>  
>  		pdc: interrupt-controller@b220000 {
> @@ -1704,6 +1805,30 @@
>  				function = "qup13";
>  			};
>  
> +			edp_hot_plug_det: edp-hot-plug-det {
> +				pinmux {
> +					pins = "gpio60";
> +					function = "edp_hot";
> +				};
> +				pinconf {
> +					pins = "gpio60";
> +					bias-pull-down;
> +					input-enable;
> +				};

There should be no separate 'pinmux' and 'pinconf' nodes, see other entries
in this section.

> +			};
> +
> +			edp_panel_power_on: edp-panel-power-on {
> +				pinmux {
> +					pins = "gpio80";
> +					function = "gpio";
> +				};
> +				pinconf {
> +					pins = "gpio80";
> +					bias-disable;
> +					output-high;
> +				};
> +			};

IIUC this could be any GPIO and hence should be configured by the board file.
