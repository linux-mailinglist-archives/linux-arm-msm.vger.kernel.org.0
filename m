Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A9744F494
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 19:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbhKMSkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 13:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbhKMSkH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 13:40:07 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15BEC061767
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:37:14 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so19403838otm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lBHywRpokRI7Qe0yqZeJ3KaigI4SOFSs5dfQfhbid/Q=;
        b=n1Bbd2g97KuW6F0KhlT2d8/u7S3SzQ9h1l+jiq5mLG0HPYkc4OyWjNYEV9X0SV2Dbp
         M/plKr0yeDFS0tjcMrLk4TDr9b0+errpXnIT3GaG3G6XmaGdtBd+fbX4XBVjjOXqj3n5
         tMd+xKtadRWsakVCMFeZZ9/NI1d/mzx76nenzz3xzjSrLFBowpwZ+BTh6VsWoTbEY2OU
         Y0hvHFJOq5K0GY+TOgRJNaTUC3Rgz8EkhIDdejHYnxa8NJJdCpFSz1IVrrATX/9n4nDK
         thaDi0b7kXP3XC2Q46i2Mt5G4ffyAAoRN6SyrkuaIlDBveccWp/U64vfP5Xl2HDQvY0N
         V3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lBHywRpokRI7Qe0yqZeJ3KaigI4SOFSs5dfQfhbid/Q=;
        b=e/6rkz/j3Fl81n4GsLKcBItR9bt/CpCi3W22+1rwuWF+tSKPcg+etL3KaLn7X013+E
         h7GVHavoveC3TkSMXXcdt+eeMf3Ktsm790+2QXlN4u0bKDMu0AqmDOJNYhZVEO2pnw27
         AZrxkgZr/lQ7/08nxN9mFwGxREk6tz9HEUkWS6xxtexYxmzxM0EvTLmnSfPZVLwHGf11
         2QnoFaIuLfiGpVCCTIBUoJYXmVAbgzyB3AGj1BXQC8PgPryignJ2EdJbKMB7iwyAiEG6
         b7xmMG0j3baSJRA5ivXCy3Jkf/ldwcL0h9hOZYFhGdLHbYv+SsqXjaNsFdMCYj3jq7/X
         1H7A==
X-Gm-Message-State: AOAM532iJYTr6+JFK7S+sKAEhzOaR0PNDCc93R8N6I+ZHiTblwwUNzGK
        MTeuIPTy9DMcMLh3M/1uJ8STJQ==
X-Google-Smtp-Source: ABdhPJwp+XC6gkEXEpj4MRUN3kMw2rTiCX3unC++4Yk9g5MbGEkw+ILZiQXo/fn9K6gzS99leZYYSg==
X-Received: by 2002:a9d:6641:: with SMTP id q1mr20172517otm.323.1636828633822;
        Sat, 13 Nov 2021 10:37:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g26sm2014455ots.25.2021.11.13.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 10:37:13 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:37:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] arm64: dts: qcom: sm8150: add DSI display
 nodes
Message-ID: <YZAF1OWJsIq9wGP2@builder.lan>
References: <20211113023955.105989-1-kaperez@linux.microsoft.com>
 <20211113023955.105989-4-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211113023955.105989-4-kaperez@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 12 Nov 20:39 CST 2021, Katherine Perez wrote:

> Add DSI controller and PHY nodes to sm8150.
> 
> Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 183 ++++++++++++++++++++++++++-
>  1 file changed, 179 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 38dbc39103ba..afa612daefa1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3261,6 +3261,35 @@ camnoc_virt: interconnect@ac00000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		dsi_opp_table: dsi-opp-table {

As this isn't a mmio device, can we please move it outside of /soc as
well?

> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-180000000 {
> +				opp-hz = /bits/ 64 <180000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-275000000 {
> +				opp-hz = /bits/ 64 <275000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-328580000 {
> +				opp-hz = /bits/ 64 <328580000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>;
> +			};
> +
> +			opp-358000000 {
> +				opp-hz = /bits/ 64 <358000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};
> +
>  		mdss: mdss@ae00000 {
>  			compatible = "qcom,sm8150-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
> @@ -3351,6 +3380,152 @@ opp-460000000 {
>  					};
>  				};
>  			};
> +
> +			dsi0: dsi@ae94000 {

If you change the label to mdss_dsi0: instead, they group nicely with
the other mdss related nodes in your device's dts.


Apart from that I think this series looks good.

Thanks,
Bjorn

> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SM8150_MMCX>;
> +
> +				phys = <&dsi0_phy>;
> +				phy-names = "dsi";
> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0_phy: dsi-phy@ae94400 {
> +				compatible = "qcom,dsi-phy-7nm-8150";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x260>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
> +			dsi1: dsi@ae96000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae96000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SM8150_CX>;
> +
> +				phys = <&dsi1_phy>;
> +				phy-names = "dsi";
> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1_phy: dsi-phy@ae96400 {
> +				compatible = "qcom,dsi-phy-7nm-8150";
> +				reg = <0 0x0ae96400 0 0x200>,
> +				      <0 0x0ae96600 0 0x280>,
> +				      <0 0x0ae96900 0 0x260>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
>  		};
>  
>  		dispcc: clock-controller@af00000 {
> @@ -3359,10 +3534,10 @@ dispcc: clock-controller@af00000 {
>  			power-domains = <&rpmhpd SM8150_MMCX>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi0_phy 1>,
> +				 <&dsi1_phy 0>,
> +				 <&dsi1_phy 1>,
>  				 <0>,
>  				 <0>;
>  			clock-names = "bi_tcxo",
> -- 
> 2.31.1
> 
