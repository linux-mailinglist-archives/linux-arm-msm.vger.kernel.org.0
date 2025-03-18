Return-Path: <linux-arm-msm+bounces-51678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED085A66B65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2CD189CA0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116781DF723;
	Tue, 18 Mar 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQ2Dj7Fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573BF1B0412
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742282298; cv=none; b=qlsAacIlnuGNfJTJGJMnJbqWGm1qq3CD79C29BcIrV0sZxFcBlLcKW3QxZIf4b0iAo1icNfQHJFurV1lp+/8QHhVi6F6ZKwZrDMa+YTQbmzErlYFhBCJXI7TFDn89IbSvTEVqUIWnHpb19vXvzJ22n3eV03KBDOk84SqBHIxQIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742282298; c=relaxed/simple;
	bh=sHkWokmPrqXsdDV7+i8VB3rJOPWoE1XI438bG7S5Nlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1tLDpGuVG5JHGP/dq7YVMn+gQUm5KZ1ldD8V1rtbS233EU96RABeJ7Kw5nSNvrbf/X6ZRPwWDuY804z2O+xQj14CADz9NvF1gsLeZj9IsXvGgesX/n3OamhqfWq+efY9Ed9Xh9OzQmkYUnOp+tOPJ4qWjQVXYDr8AMcTxqmPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQ2Dj7Fu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fd89d036so104222955ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742282295; x=1742887095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uL3J0kJ07qCQwLi/H8v/Z+UezU+LpDO7hkpWTExk8ys=;
        b=MQ2Dj7FuHbOQVJ5YTk0xYiXvhy57ZnHOSkxAJ0yPyePEmJh9SaVwgup/Sc6Fq8A4v3
         7Mwe3Duhv/9grkY8khBxRl1JLymtWOG6oIBV+Z9acEtLjDNp6xvNAFeha/7Kp4xnZYsV
         qvpVlpGnAVZtKHmq1J7HqZigN8n5ETDmNxtiZGhP5ejtRlt92HBuUNU1n9R72ehYwIum
         BmQ3VTYZ+t7zsJuTozqLaK4193Xj9bTYZ7h4TOw0VOV2USV+Lw8SMZb7oCkT1qEBPTMU
         EokAipHKCrPZiY8Zkx/9csn8fQoUOmCvQoJ+epj8M4RTK7/QRPzJFj25ZC89Ab0KRD62
         FFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742282295; x=1742887095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uL3J0kJ07qCQwLi/H8v/Z+UezU+LpDO7hkpWTExk8ys=;
        b=uIrNCsXEI/STrD5Cw+MTsBEhnB12iJ246U1a+Hv3ZoNeKGGMpDb3t+9pxenyjeZyM4
         Puqsh5Dz2MQc0q7yBOhRZ4nxt+v5pJL1jLCfT2GzhyhXF999wMjFyaRUFIpkjmrXX2k6
         QDbna71VJMHn2K3AcuK2UEmQj6PBr/aZJg084Z9RvL32o/orceD+BfRibalZJyt/jqjb
         6Gpao6Cd1DSL3co3+gK+QLHgl+LalHM0+jFhawgqLygfAfOLCTU552gz2/hNOJs+WpSV
         a/an9kaHA9g9LOjycB4aPJz3WqDEPZP5RRcIckxrhUL0PPNGbeNOrEpQKV3p21LSJEgD
         SAJQ==
X-Gm-Message-State: AOJu0YzEtCx6Vx9WiIVJQatsix9LWYdhf9gZWRq25YjIlZJhWsLkCAK6
	XkiFTOn4DXQXiRY3lXLVo7GwQgWJaFKJQ+5A5gCf+t3e7fPv+n8CBg9fDGhQDg==
X-Gm-Gg: ASbGncueSRVo+eQ2PhlLAz+EACX2nWaE9K/p7lWpxI2m3Y84jBKOZn+CZJ+dKwyYcXW
	4lmDsQkL9K/aNWILk7Ke86Yw+g36zqdDqLALKedrSSeCdNglBbWkf7jM0d8EoNnDnAofkrDYWbq
	mkTbnVVN666xZS6/N4CIJC1H7zXRjEhh/zWlQMATcq/tfAnvaCLDmFZ7UQIJcl/sFph8K8Ty3dy
	h3k6WraCcN35irHHeatMbyerSCy4p60s0e/6RAQ49ISer/z/PBMDhBRGLF9czOArXH7UG5AMwey
	VsX9yz9/iRHZhKzV+sCPA1YERz2WJALMmbxsEhMxIIlSOFX1zfeYee1oNv8Nf7f02zc=
X-Google-Smtp-Source: AGHT+IEzVk5IzlQIC5VwuXRJuSpzspEea6bADLr7EeZbZUTj69tT3vTxsaaX4dqVtRwwYUxDGF902w==
X-Received: by 2002:a17:903:3bad:b0:223:2cae:4a96 with SMTP id d9443c01a7336-225e0b0fa67mr181209535ad.42.1742282295391;
        Tue, 18 Mar 2025 00:18:15 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7275sm87355885ad.115.2025.03.18.00.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:18:15 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:47:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	andersson@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org,
	kishon@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	kw@linux.com, lpieralisi@kernel.org, p.zabel@pengutronix.de,
	quic_nsekar@quicinc.com, robh@kernel.org, robimarko@gmail.com,
	vkoul@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <20250318071756.uilfhwfzgr5gds3o@thinkpad>
References: <20250305134239.2236590-1-george.moussalem@outlook.com>
 <DS7PR19MB8883E4A90C8AFF66BCAE14F49DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR19MB8883E4A90C8AFF66BCAE14F49DCB2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Wed, Mar 05, 2025 at 05:41:30PM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and
> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 232 +++++++++++++++++++++++++-
>  1 file changed, 230 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 8914f2ef0bc4..301a044bdf6d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -147,6 +147,234 @@ usbphy0: phy@5b000 {
>  			status = "disabled";
>  		};
>  
> +		pcie1: pcie@78000 {
> +			compatible = "qcom,pcie-ipq5018";
> +			reg = <0x00078000 0x3000>,
> +			      <0x80000000 0xf1d>,
> +			      <0x80000f20 0xa8>,
> +			      <0x80001000 0x1000>,
> +			      <0x80100000 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config";
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			max-link-speed = <2>;

Why do you want to limit link speed?

> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			phys = <&pcie1_phy>;
> +			phy-names ="pciephy";
> +
> +			ranges = <0x81000000 0 0x80200000 0x80200000 0 0x00100000>,	/* I/O */
> +				 <0x82000000 0 0x80300000 0x80300000 0 0x10000000>;	/* MEM */

These ranges are wrong. Please check with other DT files.

Same comments to other instance as well.

> +
> +			msi-map = <0x0 &v2m0 0x0 0xff8>;
> +
> +			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi0",
> +					  "msi1",
> +					  "msi2",
> +					  "msi3",
> +					  "msi4",
> +					  "msi5",
> +					  "msi6",
> +					  "msi7",
> +					  "global";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 142 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> +					<0 0 0 2 &intc 0 143 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> +					<0 0 0 3 &intc 0 144 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> +					<0 0 0 4 &intc 0 145 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
> +
> +			clocks = <&gcc GCC_SYS_NOC_PCIE1_AXI_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE1_AHB_CLK>,
> +				 <&gcc GCC_PCIE1_AUX_CLK>,
> +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>;
> +			clock-names = "iface",
> +				      "axi_m",
> +				      "axi_s",
> +				      "ahb",
> +				      "aux",
> +				      "axi_bridge";
> +
> +			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
> +				 <&gcc GCC_PCIE1_SLEEP_ARES>,
> +				 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_MASTER_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_SLAVE_ARES>,
> +				 <&gcc GCC_PCIE1_AHB_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_MASTER_STICKY_ARES>,
> +				 <&gcc GCC_PCIE1_AXI_SLAVE_STICKY_ARES>;
> +			reset-names = "pipe",
> +				      "sleep",
> +				      "sticky",
> +				      "axi_m",
> +				      "axi_s",
> +				      "ahb",
> +				      "axi_m_sticky",
> +				      "axi_s_sticky";
> +
> +			status = "disabled";
> +
> +			pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
> +		};
> +
> +		pcie1_phy: phy@7e000{
> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> +			reg = <0x0007e000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
> +
> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +

Please get rid of these newlines between -cells properties.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

