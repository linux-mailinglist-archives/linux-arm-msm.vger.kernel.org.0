Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D5D382896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 11:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbhEQJnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 05:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:46878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235911AbhEQJnW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 05:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 216ED61005;
        Mon, 17 May 2021 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621244526;
        bh=Z8OXhIfGFQeLSw6Ti2tA4FkfLSbhFA00yCID19JwS+Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KRZalEdinOKoKQ+9WqrEFqHEOCNz+VpaKG+080Edla2HYD3msp3bFLLXEucB+skWt
         j1YhmYHymwesse8zWc4FMq9ZwkZ8lUSBe9mqixkgO0K0xe4lrISO98ibLzgJyPIsX5
         WfGqH1By3Q3ESQ5T9m1NAXBIeZ+sOTn+rFuFOoGTji7spjJYdtmxxsgYT7TTDn7Tpx
         gybvhcHHAEzW4ip7Uvey5jhsOetfSEsgQ3oPL1BwM/pFu+y7avR0TsPRsxknu8slo/
         dQ7ftYsGefaIn8U30HUsJeTUBEmb7cEkLjWCyO+d0YpEhDdmWQFh+E1eWWO8d8O0B4
         vKna5MlF+lCkw==
Date:   Mon, 17 May 2021 15:12:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: qcom: Add tsens details to ipq806x
Message-ID: <YKI6amMC8Rg6Kb1I@vkoul-mobl.Dlink>
References: <cover.1621097174.git.noodles@earth.li>
 <cbcac8439d3fcaaf17df041cab12d904c8058189.1621097174.git.noodles@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbcac8439d3fcaaf17df041cab12d904c8058189.1621097174.git.noodles@earth.li>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-05-21, 17:52, Jonathan McDowell wrote:

>  		gcc: clock-controller@900000 {
> -			compatible = "qcom,gcc-ipq8064";
> +			compatible = "qcom,gcc-ipq8064", "syscon";

Does this belong here

>  			reg = <0x00900000 0x4000>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			tsens: thermal-sensor@900000 {
> +				compatible = "qcom,ipq8064-tsens";
> +
> +				nvmem-cells = <&tsens_calib>, <&tsens_calib_backup>;
> +				nvmem-cell-names = "calib", "calib_backup";
> +				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "uplow";
> +
> +				#qcom,sensors = <11>;
> +				#thermal-sensor-cells = <1>;
> +			};

We have sensor under gcc node..?

-- 
~Vinod
