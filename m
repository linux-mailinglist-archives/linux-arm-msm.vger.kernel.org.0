Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E064651AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350295AbhLAPdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350182AbhLAPdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:33:05 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A3FC061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:29:44 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id s139so49179876oie.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 07:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HW0KKojhY1Kh9mSOPQm06pc8UeAfRw3x4seWBtg9Yyc=;
        b=jil87KB3ztPe3RD20gVEDKLq6HEAxx1FWdQSjmPdbsZZ7VxF75hQIREL7Hd98hZmAK
         /gngHrctIWE4T8kEPNPvMOCGxqENqN3kAUlhEKBhDbPRxi6IsL9X1UJx3PcVbAasxKkO
         3ij+ehtxLc/olhAdHEjFL38HHjwl3G01dgdQLNsJ1Cz7audkWyJFgxweLNtVQeAtIm/D
         Dg5P8gbPKoLNEig8b+51kJA5ucmYik9vLa8ID96b4ZKRT2bN+CD5zMU6fQuoCojjMIvk
         dBaqmxvh4yZZp53f5tnQr2g8CXzT2CWEMJB3w6U283/KnDaAMW9CknfX06/DP3VlnYCA
         5l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HW0KKojhY1Kh9mSOPQm06pc8UeAfRw3x4seWBtg9Yyc=;
        b=heyF6zyZlZKHqn5rJ1qD+ctcf1c6qZr6CsEnBMWKfWONVgN/WMDpOhQfSZ01jRaLEJ
         SYsz3ThKGxWxHw+8aRkWDX0JHhl64qXcO3DZOFgBSk+OGv39LO/8/m+zpNDRgcg+X7fc
         N2F2FMkJXWSpQ7w5o3+o+Kxter9wdEs4eXkwLIglbJivao4mSZNf8U1BjWXTW7PN/r7x
         3zGB3Gd55Jq787qpd358B/7Pw5sI3EgmXh4ZXt95QXIjdpnxrhgrtgbtZQZ+ySumhrZj
         RWECcAOG7IEALFawigwrIGl9RgiOrx+dhjAOAVS9jXNn1epXLfV6tzOwQA1rz6WSJPV9
         tvHQ==
X-Gm-Message-State: AOAM5312d8/FFfwoy/KTi8nvBUQXsIEnfTPbFj1/OB9Ccmxcsx2wSqzd
        /PME64JQt4YLKDHPIUgUex+Q2w==
X-Google-Smtp-Source: ABdhPJyNbK4vliEu8UiFcOQx8Ncv2S0Tcetj0f5Wisnf7Oi+/bfLsG5CWbTguBIApW/MMkZzrh0vBQ==
X-Received: by 2002:a05:6808:20a5:: with SMTP id s37mr6596269oiw.127.1638372584240;
        Wed, 01 Dec 2021 07:29:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t5sm5595ool.10.2021.12.01.07.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 07:29:43 -0800 (PST)
Date:   Wed, 1 Dec 2021 09:29:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        Rajeev Nandan <quic_rajeevny@quicinc.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sc7280: Add DSI display nodes
Message-ID: <YaeU4oG6WX9LouFd@builder.lan>
References: <1637580369-876-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637580369-876-2-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637580369-876-2-git-send-email-quic_sbillaka@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Nov 05:26 CST 2021, Sankeerth Billakanti wrote:

> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Add DSI controller and PHY nodes for sc7280.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v4:
>     None
> 
> Changes in v3:
>     - Add the dsi_phy clocks (Kuogee Hsieh)
>     - One clock cell per line (Stephen Boyd)
> 
> Changes in v2:
>     - Drop flags from interrupts (Stephen Boyd)
>     - Rename dsi-opp-table (Stephen Boyd)
>     - Rename dsi phy  node (Stephen Boyd)
> 
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 111 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a4536b6..12c4d32 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2691,8 +2691,14 @@
>  			reg = <0 0xaf00000 0 0x20000>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -				 <0>, <0>, <0>, <0>, <0>, <0>;
> -			clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
> +				 <&dsi_phy 0>,
> +				 <&dsi_phy 1>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_clk",
>  				      "dsi0_phy_pll_out_byteclk",
>  				      "dsi0_phy_pll_out_dsiclk",
>  				      "dp_phy_pll_link_clk",
> @@ -2768,6 +2774,18 @@
>  
>  				status = "disabled";
>  
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +
>  				mdp_opp_table: opp-table {
>  					compatible = "operating-points-v2";
>  
> @@ -2792,6 +2810,95 @@
>  					};
>  				};
>  			};
> +
> +			dsi0: dsi@ae94000 {

Please label this mdss_dsi0, to make it group nicely when sorted in the
dts.

> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
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
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +
> +				phys = <&dsi_phy>;
> +				phy-names = "dsi";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				status = "disabled";
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
> +
> +				dsi_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +
> +			dsi_phy: phy@ae94400 {

Why is above "dsi0" when this is "dsi_phy", drop the 0 on dsi0?

Also, please label this mdss_dsi_phy.

Thanks,
Bjorn

> +				compatible = "qcom,sc7280-dsi-phy-7nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x280>;
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
>  		pdc: interrupt-controller@b220000 {
> -- 
> 2.7.4
> 
