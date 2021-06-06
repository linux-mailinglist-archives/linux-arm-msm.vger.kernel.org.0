Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B4339CC9E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 05:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFFD6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 23:58:48 -0400
Received: from mail-oo1-f44.google.com ([209.85.161.44]:44715 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhFFD6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 23:58:47 -0400
Received: by mail-oo1-f44.google.com with SMTP id o5-20020a4a2c050000b0290245d6c7b555so3287357ooo.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 20:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZBtJoxAXWSTkFltAdWrC9azDVoj0nja+FIn0Yd4cs9g=;
        b=k2q8oB4IHfDZQdohJj9qmF2/cTlamcKtmsJBzoGj3r8r5zrPe3RTS5geKmKL9A1DCU
         IJRkwFXb6uF2bQpfJu5bG8HDz2Nmq4fasu7X3MKTJOnI6DCC2ptO14RI8epbCuRF1XtP
         zI1LoA4RD2zg9Zg3TUafnI6m+FYWScb/TH7eLaorgbtyb/gf3B17bTH7iGSVdwCQOJuZ
         MSJDVyEI74Cnzf4n7P7hfnIyaU+ylyD50+vf060G0V4Pz1DmE7WQ2G8qZgEKHNdW8Y4q
         YdGbM/yruwSIY9FA/pobFRrt0E3a5VBSoiLX8gestbvMG/11CH9wUET1uNhiu3kuvcYt
         1NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZBtJoxAXWSTkFltAdWrC9azDVoj0nja+FIn0Yd4cs9g=;
        b=tnZNWc3RezsnqdGlmEz4c+m2cpAtg+eK1i1cp7+F7lx2x//6zkPu5WgnHICUlMyaTC
         4+gsJZh29CXbimwdqrV5ZOLWRDvyauBfCaW4s3LQtM98hlgBkNfuzScfT3ICCo//1jbX
         Mupyi4+rR8+WBO4NksnfoZJYf0b3EePpIuSqH6LjnyGI5uUTAOQLmKYyqXqKHaj2OErw
         WAD9mF8UOWj5bMSXntpK/VH7S0Biv7S5p53uqY1bO30n2ReXzBBzI0cMqaO0Wkl9YFlz
         g1UOcfVRf9s0+mFiNf25tAKPHOmyeMztlHCl56ixbWwe+fBP5vojuL80AttrWvvBhO/W
         YVsA==
X-Gm-Message-State: AOAM530j2npgCEGu32SkxsYT0/VBUHsUhEKDLZxaOA9ogVlQLuXbVi1R
        A+mbnr4zW7bECIpAKgKVS36gPw==
X-Google-Smtp-Source: ABdhPJyK3TXmS9Z6jDq4ERjyglCsKG/bJlgNjiYVTbqcVBS1F1xDkYKUHn6UukcTiyOHgzpJGNk+Aw==
X-Received: by 2002:a4a:d781:: with SMTP id c1mr9181424oou.23.1622951758431;
        Sat, 05 Jun 2021 20:55:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x9sm1415903ooo.27.2021.06.05.20.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 20:55:58 -0700 (PDT)
Date:   Sat, 5 Jun 2021 22:55:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
Message-ID: <YLxHTDxVcSvVxsd5@builder.lan>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604135439.19119-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:

> Add QSPI DT node for SC7280 SoC.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V3:
>  - Broken the huge V2 patch into 3 smaller patches.
>    1. QSPI DT nodes
>    2. QUP wrapper_0 DT nodes
>    3. QUP wrapper_1 DT nodes
> 
> Changes in V2:
>  - As per Doug's comments removed pinmux/pinconf subnodes.
>  - As per Doug's comments split of SPI, UART nodes has been done.
>  - Moved QSPI node before aps_smmu as per the order.
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61 +++++++++++++++++++++++++
>  2 files changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 3900cfc09562..d0edffc15736 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>  		};
>  };
>  
> +&qspi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +
> +		/* TODO: Increase frequency after testing */
> +		spi-max-frequency = <25000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -278,6 +294,19 @@ &uart5 {
>  
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>  
> +&qspi_cs0 {
> +	bias-disable;
> +};
> +
> +&qspi_clk {
> +	bias-disable;
> +};
> +
> +&qspi_data01 {
> +	/* High-Z when no transfers; nice to park the lines */
> +	bias-pull-up;
> +};
> +
>  &qup_uart5_default {
>  	tx {
>  		pins = "gpio46";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 6c9d5eb93f93..3047ab802cd2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
>  			};
>  		};
>  
> +		qspi_opp_table: qspi-opp-table {

This node doesn't represents anything on the mmio bus, so it shouldn't
live in in /soc. Can't you move it into &qspi?

Regards,
Bjorn

> +			compatible = "operating-points-v2";
> +
> +			opp-75000000 {
> +				opp-hz = /bits/ 64 <75000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-150000000 {
> +				opp-hz = /bits/ 64 <150000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-300000000 {
> +				opp-hz = /bits/ 64 <300000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};
> +
> +		qspi: spi@88dc000 {
> +			compatible = "qcom,qspi-v1";
> +			reg = <0 0x088dc000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +				 <&gcc GCC_QSPI_CORE_CLK>;
> +			clock-names = "iface", "core";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> +					&cnoc2 SLAVE_QSPI_0 0>;
> +			interconnect-names = "qspi-config";
> +			power-domains = <&rpmhpd SC7280_CX>;
> +			operating-points-v2 = <&qspi_opp_table>;
> +			status = "disabled";
> +		};
