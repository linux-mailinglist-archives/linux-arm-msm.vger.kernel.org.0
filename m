Return-Path: <linux-arm-msm+bounces-50306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 525D0A4F4FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 03:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6671A188F6F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D191153800;
	Wed,  5 Mar 2025 02:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MRwbldEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9615350B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 02:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143479; cv=none; b=j/guSJfuBLk0g7QA+h0syhZrYFB/f397Md/h5A7mTJ/XRQCJRNsnQ2gSdtjq3OTp+RUBGC1aB82MBeGQDdw3bag3d5o698PWssh6bjyj57Ig3gdgGFdmzTRsrK8oLi7a0+9mpGk2DiX/q2ZH91gcgT7/p1/VK5ADNLdyMKLtbCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143479; c=relaxed/simple;
	bh=y7bMw3N+68dF2gots6s3j4ZbxaLrFGvk8JUQ//skTXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7NOarXvY3W4oCCyGXenm7oyp65wn6Rqqn+VUIEsuRn0YpEnqGwc6ys6L+Eb6fSrWWWk+p5ORsI5RxnioK8GHJkKFl33YHUsO0yL+Zq2Kni9CMKVjQQyD8gJNJChEFCmxhIg/+1992q22t9RoOe6ycZXIUxtgd+jsrWN4Kv2OiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MRwbldEA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5495078cd59so5176802e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143473; x=1741748273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=;
        b=MRwbldEA57KcJhDX+SrkJg1FQxa3kFG7QIOne+i2iH05bzCydH8C/4yAuyJLFEyRqL
         IDx4TzaEG6TG3MRmTOVEQB6HW+WI2+jQm7ywYxUg3KgOtZSQnTxHbF8orXgR2aqIkGXa
         qy/WV51MoazPOn20HjtLlonAQ6Wqpp9MA5kdoYJyvLfh0mtKkb3+EbX/62+8MxAGxXOI
         kHwKpqpbe5boU7GyZr8vxd3IVQlbWTC8oAYbB90wSw8rgi6zA+Uo+l2N41bFQDQuK0Io
         51Kit/3fCJx4PKVHDhz7HiySMGeLQKdnoakKjnjd20Yea10lpAWq4ZqEeG8SriMRg7b0
         Llqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143473; x=1741748273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8qDHMP0/psqxw/XtRcA0VzgZ/XpGSLC12c3xrF1aPA=;
        b=eK57BikjdsXPO77/QafzDGigPEyRe3BFXNr4HqmZxjMLNBhEIW9CG9tIcFE1GmmgfJ
         zCccgYodmvZo5r0WuF8RgRCMxLfk85XVFW3LfYzuvuUzWmIXDXhpmaIBSzSG4A+xkyJR
         kldISyjk2WIm4N2IsoZtuY9UsPZfjXzW1WY1jmC3HQngMCwg2IICBB+KBDWa878gPnVf
         WvcoQA00H2ATuK7w6i6ZPmT3P/PMmM0cxMmMeHwFhc690BFxLI8bY1V7gqaBRchh0s11
         ULaFOB5SCcFFc9+asXIFzwPiH++bpZ6pyqFlXIZAZT+tY8fPpKdtnXeilD+E0cjsznMw
         6k8A==
X-Forwarded-Encrypted: i=1; AJvYcCU5Z6h783kb7Jzi+q0UJAnP6jdPd3VXCl7WuAJjPGah+yLtuBrNJPEEcilqQcuwQbBS0aK6usoOUpqarwkw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1qwUInqiWZo3EzyDBbTivYeI9n7v+z5m+u6iQQswel0e6KA6
	LJxOAIF11FBRs4J/2BCK3gVLj0wya21EkktSPNYmIEmVT+6UwPUFaaY81LqykD0=
X-Gm-Gg: ASbGncs0vYSo60D5wFuqGssS8cKu/LR/IdHAV8UbnEdImnYcOlFe8znU31M4aIBSNrL
	/7o959d7PWn5PGc7Gm45HU8skTsgYh10C4AVSqtkCg8nPC7BrZ6xn6iRo+8g1EHE4NqCJytH5Ej
	DSUFXPyf1iaAdMo8+McyWxrfQ+T/xpP8jKR7SkBYOug8Esq7xs9dFRAc+miXFAGQQffJdh0e6Uf
	u6mWyHU80TTzAGROcIIyUtROg06+xa2dfJBhEBcmaMES+uJa+cSuwqMAYJOvRriLpV9iAj8Y1zj
	kTjY7yk6fQxaZ4xGmSmV0QV8Yk9wslLORl98qLVUjdqmz1IlyKH1JdfT0KkZ8X3lLTP6zetgcTT
	fOmHSvgw2Rd+3sZuzP8gszgUg
X-Google-Smtp-Source: AGHT+IHGOGwNINTW4ac1tC6VSgjqBJC0+1KyVOaHFcHtINPFKwdR1g09IOAfwlXr5N6PwikUjAqrUg==
X-Received: by 2002:a05:6512:ac7:b0:545:2335:6597 with SMTP id 2adb3069b0e04-5497d383726mr462845e87.50.1741143473438;
        Tue, 04 Mar 2025 18:57:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494efff26esm1486481e87.73.2025.03.04.18.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:57:52 -0800 (PST)
Date: Wed, 5 Mar 2025 04:57:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Message-ID: <qr5vsq5b4pf5po3uq4esrozfjkmzq5q55tqlxxc74fh2pcygzi@vb7txcm5wpst>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-7-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:40PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> 
> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 163 +++++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..e543e65c7aba3213ca0b8a8f6dbaf1371ed8317e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
> @@ -1966,6 +1967,168 @@ lpass_lpicx_noc: interconnect@7420000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		usb_1_hsphy: phy@88e3000 {
> +			compatible = "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x88e3000 0x0 0x29c>;
> +
> +			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_dp_qmpphy: phy@88e8000 {
> +			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
> +			reg = <0x0 0x088e8000 0x0 0x4000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_dp_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					usb_dp_qmpphy_dp_in: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			status = "disabled";

Status should be the last property

> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +				 <&tcsrcc TCSR_USB3_CLKREF_EN>;
> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +						  <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,

Misaligned

> +					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event",
> +					  "hs_phy_irq",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
> +
> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			resets = <&gcc GCC_USB30_PRIM_BCR>;
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,

QCOM_ICC_TAG_ALWAYS

> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +

-- 
With best wishes
Dmitry

