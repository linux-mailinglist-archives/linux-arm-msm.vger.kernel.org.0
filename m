Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9E33DDFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 21:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhHBTYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 15:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhHBTYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 15:24:03 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B765C061764
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 12:23:52 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so1453627pjh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B7DjdkPmiNfssE6oJFgPeeCfIkNhAcR7dx6Gq0zHJUo=;
        b=TKsjy8XEtnq+lBJdZsVEulqwq61tqWTOFQdtt236SJnYWAX0N38AnkKvYcW5se91Ns
         omBDgVmYo9H/Djau5cBepkNyUeW5Cn0HzVjVNuS7X7UZQagnPz+Q2LXUSAACe1OnFIpB
         ci+wKDhtcoBL30x4rdnvaJj9qtn/uBUzl0a1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B7DjdkPmiNfssE6oJFgPeeCfIkNhAcR7dx6Gq0zHJUo=;
        b=L3ylvO8DgZT/hB96QcU4caFufJASZSpUvNW30GnLFOoebT11jHMBp805TgOrSooe8u
         2w4yCZH5rt70j2POVW8EOw16izJ6ltZ6AAQKy3tOtTPNjzQ9qXtGKEfb4pQ6pVuLnElc
         VhP1MylQfFvbTRCJrU5bVomM5lpTNtgRMLUErnntKvOtiMd92Bu9ZYoDMv2c8UDri7h9
         DhwDQuDj2HJRtFDYkDzthPeEN12fJuYLK/pdfkPXPzvCfGODZCHe41la6XnaaZZcrfVu
         dfSgykuzcx2wX0x3S5OI1HsULDg1H8Noug8A2PuqIKyjZ4VGOf5H4KDh2eIKMMv/SGyq
         YxzQ==
X-Gm-Message-State: AOAM533ZI2qKFqT0JFs0j7i2Vm4EoafWDbN1SR5f39Hx4B0txgQtxt8c
        7M1Uyi4dDzIGOdyDKYmcT0B5Ag==
X-Google-Smtp-Source: ABdhPJzLbHxsNfPmg1MFTunQhRAZSeJez9H4MweaRSTh8SvN7/TcPdFHn9OO7RQ7MNoTLDCsiNcTGw==
X-Received: by 2002:a63:cf0a:: with SMTP id j10mr1642904pgg.4.1627932232140;
        Mon, 02 Aug 2021 12:23:52 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7a52:cd2f:35b4:3b14])
        by smtp.gmail.com with UTF8SMTPSA id y64sm13994788pgy.32.2021.08.02.12.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 12:23:51 -0700 (PDT)
Date:   Mon, 2 Aug 2021 12:23:48 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Prasad Malisetty <pmaliset@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY
 related nodes
Message-ID: <YQhGRB3wBgQ1Kw9E@google.com>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 16, 2021 at 07:28:45PM +0530, Prasad Malisetty wrote:
> Add PCIe controller and PHY nodes for sc7280 SOC.
> 
> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 125 +++++++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a8c274a..06baf88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -546,6 +547,118 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		pcie1: pci@1c08000 {
> +			compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", "snps,dw-pcie";
> +			reg = <0 0x01c08000 0 0x3000>,
> +			      <0 0x40000000 0 0xf1d>,
> +			      <0 0x40000f20 0 0xa8>,
> +			      <0 0x40001000 0 0x1000>,
> +			      <0 0x40100000 0 0x100000>;
> +
> +			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			device_type = "pci";
> +			linux,pci-domain = <1>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
> +				 <&pcie1_lane 0>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
> +
> +			clock-names = "pipe",
> +				      "pipe_mux",
> +				      "phy_pipe",
> +				      "ref",
> +				      "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "tbu",
> +				      "ddrss_sf_tbu";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			resets = <&gcc GCC_PCIE_1_BCR>;
> +			reset-names = "pci";
> +
> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
> +
> +			phys = <&pcie1_lane>;
> +			phy-names = "pciephy";
> +
> +			perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pcie1_default_state>;
> +
> +			iommus = <&apps_smmu 0x1c80 0x1>;
> +
> +			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
> +				    <0x100 &apps_smmu 0x1c81 0x1>;
> +
> +			status = "disabled";
> +		};
> +
> +		pcie1_phy: phy@1c0e000 {
> +			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
> +			reg = <0 0x01c0e000 0 0x1c0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_CLKREF_EN>,
> +				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +			clock-names = "aux", "cfg_ahb", "ref", "refgen";
> +
> +			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> +			reset-names = "phy";
> +
> +			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			status = "disabled";
> +
> +			pcie1_lane: lanes@1c0e200 {
> +				reg = <0 0x01c0e200 0 0x170>,
> +				      <0 0x01c0e400 0 0x200>,
> +				      <0 0x01c0ea00 0 0x1f0>,
> +				      <0 0x01c0e600 0 0x170>,
> +				      <0 0x01c0e800 0 0x200>,
> +				      <0 0x01c0ee00 0 0xf4>;
> +				clocks = <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "pipe0";
> +
> +				#phy-cells = <0>;
> +				#clock-cells = <1>;
> +				clock-output-names = "pcie_1_pipe_clk";
> +			};
> +		};
> +
>  		stm@6002000 {
>  			compatible = "arm,coresight-stm", "arm,primecell";
>  			reg = <0 0x06002000 0 0x1000>,
> @@ -1185,6 +1298,18 @@
>  				pins = "gpio46", "gpio47";
>  				function = "qup13";
>  			};
> +
> +			pcie1_default_state: pcie1-default-state {
> +				clkreq {
> +					pins = "gpio79";
> +					function = "pcie1_clkreqn";
> +				};
> +
> +				wake-n {
> +					pins = "gpio3";
> +					function = "gpio";
> +				};

This could be essentially any GPIO, right? Does it really make sense to
have this node in the SoC file? I would say it belongs in the board file.
