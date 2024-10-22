Return-Path: <linux-arm-msm+bounces-35477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1313A9AB7C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 22:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F537B230A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 20:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10791CC8BB;
	Tue, 22 Oct 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwopQ6jK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE081A2872;
	Tue, 22 Oct 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729629554; cv=none; b=uIE79c0bSrciJlI4gHrxj7TSPSiXHW3+HqkEVqR6LI0fhY01quwQMUxDccd0i+qOvhCl39MFcPnqFnvS5gkDr0XtDdKj0EARWOvd7V4vRgSCWObR9D47J0ktX+rR5EiDokLfYdAB6BiLUQPFQdtaFCSXU4fV7FrKbI4fC0MqKec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729629554; c=relaxed/simple;
	bh=zf6B/ocO5rbhrIZkHOYoAi8TUWwKG7prjtVoNUvcNdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFvcngXD9MsegtpUif0oCoDQ4ujcCu0NkHrXfBPM4sBJmYl4CYq/mxg1zLIjHS/AKGdyY8Pcc7UlldIyd1DnvUeSy9vAy59BNiUErtNErwp2b4TmuKhC3pnoIMxUgHv1CDRmO0LIeVaqUEaIQwgExXiq2sMp3hhC8pkhfvUw64U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwopQ6jK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3556BC4CEE3;
	Tue, 22 Oct 2024 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729629554;
	bh=zf6B/ocO5rbhrIZkHOYoAi8TUWwKG7prjtVoNUvcNdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwopQ6jK8j551ft4Ffnd8+g5V+/cSIoacdXljYxBJStAQVOYzAAPRC8F0vi/pB2lP
	 GY9sjRbIl57FJ3AW8bm9Z+wGPcN1BDeEwUBG29nC3XxObs7J7OUoXnGxHNNmLuhWGR
	 4wBPIchnDnYRduGCxOCwvcGSTjGKnGksfHnPf5RVzSfd7xDAXqT92VCk43W4ga/krg
	 iP6HSWfe3hZAVPcpMUjdK2QeORhdXe3UqrjKlt/kVC1u2gDeofSqZiFs6pazGkqQ0D
	 R9IPfyMIXkv+VwYdTnDZFynUBzS5AhyfOoI8VD3RmFZ4xseXAVuvpzF5OwSmHJdrkw
	 7vCcvxoJTLo6A==
Date: Tue, 22 Oct 2024 15:39:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add GPI configuration
Message-ID: <jyed22cc3lrrvmfyyywccz6cr5tfdl2bs57zdjlbiizcjwkyxt@mbm4adbf66ds>
References: <20241021102815.12079-1-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021102815.12079-1-quic_vdadhani@quicinc.com>

On Mon, Oct 21, 2024 at 03:58:15PM GMT, Viken Dadhaniya wrote:
> I2C and SPI geni driver also supports the GSI node based
> on client requirements. Currently, in the DTSI, the GSI mode
> configuration is not added.
> 
> Therefore, add GPI DT nodes for QUPV_0/1/2/3 for I2C and SPI
> for the SA8775.
> 

For future patches, 
https://docs.kernel.org/process/submitting-patches.html#the-canonical-patch-format
clearly states that lines should be wrapped at 75 characters, not 60...

Regards,
Bjorn

> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 246 ++++++++++++++++++++++++++
>  1 file changed, 246 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 07b3d9f65684..47b5fb4d83a9 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
> @@ -852,6 +853,28 @@
>  			#mbox-cells = <2>;
>  		};
>  
> +		gpi_dma2: qcom,gpi-dma@800000  {
> +			compatible = "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00800000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu 0x5b6 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_2: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x008c0000 0x0 0x6000>;
> @@ -882,6 +905,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -903,6 +930,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -939,6 +970,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -960,6 +995,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -996,6 +1035,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1015,6 +1058,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				status = "disabled";
> @@ -1053,6 +1100,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1074,6 +1125,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1108,6 +1163,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				status = "disabled";
> @@ -1131,6 +1190,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1167,6 +1230,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1188,6 +1255,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1224,6 +1295,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
> +				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1245,6 +1320,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
> +				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1265,6 +1344,28 @@
>  
>  		};
>  
> +		gpi_dma0: qcom,gpi-dma@900000  {
> +			compatible = "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00900000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			iommus = <&apps_smmu 0x416 0x0>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_0: geniqup@9c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x9c0000 0x0 0x6000>;
> @@ -1295,6 +1396,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1316,6 +1421,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
> +				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1352,6 +1461,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1373,6 +1486,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1409,6 +1526,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1430,6 +1551,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1466,6 +1591,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1487,6 +1616,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1523,6 +1656,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1544,6 +1681,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1580,6 +1721,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
> +				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1601,6 +1746,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
> +				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1620,6 +1769,28 @@
>  			};
>  		};
>  
> +		gpi_dma1: qcom,gpi-dma@a00000  {
> +			compatible = "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00a00000 0x0 0x60000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&apps_smmu 0x456 0x0>;
> +			dma-channels = <12>;
> +			dma-channel-mask = <0xfff>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_1: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x6000>;
> @@ -1650,6 +1821,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1671,6 +1846,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1708,6 +1887,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1729,6 +1912,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1766,6 +1953,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1787,6 +1978,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1823,6 +2018,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1844,6 +2043,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1881,6 +2084,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1902,6 +2109,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1939,6 +2150,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1960,6 +2175,10 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
> +				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -1996,10 +2215,29 @@
>  						     "qup-config",
>  						     "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
> +				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
> +
>  			};
>  		};
>  
> +		gpi_dma3: qcom,gpi-dma@b00000  {
> +			compatible = "qcom,sm6350-gpi-dma";
> +			reg = <0x0 0x00b00000 0x0 0x58000>;
> +			#dma-cells = <3>;
> +			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&apps_smmu 0x056 0x0>;
> +			dma-channels = <4>;
> +			dma-channel-mask = <0xf>;
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_3: geniqup@bc0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0xbc0000 0x0 0x6000>;
> @@ -2030,6 +2268,10 @@
>  							 "qup-config",
>  							 "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
> +				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> @@ -2051,6 +2293,10 @@
>  							 "qup-config",
>  							 "qup-memory";
>  				power-domains = <&rpmhpd SA8775P_CX>;
> +				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
> +				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
> +				dma-names = "tx",
> +					    "rx";
>  				status = "disabled";
>  			};
>  
> -- 
> 2.17.1
> 

