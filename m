Return-Path: <linux-arm-msm+bounces-23847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B0914100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 06:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9864F28367A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118C7525E;
	Mon, 24 Jun 2024 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymHNHAvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C340D26D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 04:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719202720; cv=none; b=uK5TJJ1171S1QjS+wBxP5pVvoPdV3JUC0KW4bcwzeqcGiFZYBEQO9wdKSSwTxDHdBNa0Si+odGGW5fIcsXtVm1nIHeRQlOBbtsA31hfiRejyzwuMTEEzrfl524H3CZLJbLaUVoX0w42vlqqihVEZTXM4cS2qvjvXYeO0AAlBASM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719202720; c=relaxed/simple;
	bh=QHptJpTf4CEpWUZfasWuXdrCC1FkI7Rinr8Lsy/90FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhzVPICw2VHAosqHHqbOA74gedSRyhrJ8DpTEIqpvZPPlAzPkZOUM6suCSru5PSu8iKK66SUDnVGLDouPeyMRQesntUueR49ejp13+dYdNySDioMRW2iiwibdBCuzPnI3JQuRW9BOE5Bc4B17vqHsnmA3AhRrxp5oDDygGtMYK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymHNHAvC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70665289275so770244b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 21:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719202718; x=1719807518; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U38KLYsER4VbQ7nDCjAjQhTITw1TrupApnMGdM5CCg0=;
        b=ymHNHAvCp/3/YlPDVbylG4DhMYeb0hEz3II2GO0OWsOU0UxD6hWFl42SPfac8NzBzY
         1jMyDWlOsFckKvsqn5U4gL8QYxA/VJoXJ9I3O0jcKPC7qkBIhMJxUC/J7yUGt77R8jKa
         6QyAZMYuk5/L9mOXGP+cMAn10e997eIMmlZ7zws7g19KVafbzofLn7Z0YZyB6wwsul7r
         KZ2Ms2pqEOvTQBDDqbHQtdIYLJBs7rK/+YT3UldTkMG8FcmerEnckEm2fNsYWfyJfudU
         anbLxgPsome/2Cz7vEjxA+PSWsxFbBy0S0DES0eQQKle20tiuEJLSAIE4U8GPuCctsHz
         hfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719202718; x=1719807518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U38KLYsER4VbQ7nDCjAjQhTITw1TrupApnMGdM5CCg0=;
        b=EAWOuCci5Ie9xAIYc39vKdslMpFUZJ+Nm2O8xDkVp6P6Pc6XLvknFWx9yCnZ78KsdY
         B7IgWGHiLL0PR4QtMvdyNbE+tt4PJN3B+152fOrG2FouttHNsZCMz94zDzYcE61U8ccH
         81MuU5hPlv7c9nJOjdvMZb6pbLDvHRpCNKstSaRxnQxltpTa9Jwqj+OcjTA24ifeWSDX
         Jq54wThGN0/TxPKhYMGXNgjLtRxA7n2HFrDrXXuH7UXXukrTEEGTAqcaX1M1/J6oDK6F
         4yEa3wuQ/ATu/gRQAeDHAENePUiMcNoQ/xLt81hJRY5NEZp5+EUu852Sf6BCGOD7S566
         jANg==
X-Forwarded-Encrypted: i=1; AJvYcCXK7Ru+omrqlpetqXIOtgWCu+z0rEq1okts+pwZTG/IvQ5IoaGFQIc8k+dOLIuCCLfuqsIu/Y6BNyJ1xxVcS0WT+rPTYDbDsFolA6iB1w==
X-Gm-Message-State: AOJu0YwFU+CgRc0C/Y2oGeB5g0THgtBcXhsaGr1J/2R6QUyvvDAXZX7F
	lKYxowczn9ckRcHtjAipcufKia87jH220uTGKnhvX8T6S3JL25VokPlGs59cqw==
X-Google-Smtp-Source: AGHT+IG5aZRko6hoy4n7mlSFt0nA5iuRBGpg39pJxTLF4lHUvglFzZJoyPvuxRC4khbg4Fk9bjUkZA==
X-Received: by 2002:a17:90a:428e:b0:2c8:6a6e:add6 with SMTP id 98e67ed59e1d1-2c86a6eae0amr2998315a91.31.1719202717595;
        Sun, 23 Jun 2024 21:18:37 -0700 (PDT)
Received: from thinkpad ([220.158.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e4f03c4esm7805404a91.6.2024.06.23.21.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 21:18:37 -0700 (PDT)
Date: Mon, 24 Jun 2024 09:48:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: ipq9574: add PCIe2 and PCIe3
 nodes
Message-ID: <20240624041832.GD10250@thinkpad>
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-9-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501040800.1542805-9-mr.nuke.me@gmail.com>

On Tue, Apr 30, 2024 at 11:07:50PM -0500, Alexandru Gagniuc wrote:
> On ipq9574, there are 4 PCIe controllers. Describe the pcie2 and pcie3
> nodes, and their PHYs in devicetree.
> 
> The pcie0 and pcie1 controllers use a gen3x1 PHY, which is not
> currently supported. Hence, only pcie2 and pcie3 are described. Only
> pcie2 was tested because my devboard only has conenctions to pcie2.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 178 +++++++++++++++++++++++++-
>  1 file changed, 176 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 7f2e5cbf3bbb..c391886cf9ab 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -300,8 +300,8 @@ gcc: clock-controller@1800000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie2_phy>,
> +				 <&pcie3_phy>,
>  				 <0>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> @@ -745,6 +745,180 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pcie2_phy: phy@8c000 {
> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x0008c000 0x14f4>;
> +
> +			clocks = <&gcc GCC_PCIE2_AUX_CLK>,
> +				 <&gcc GCC_PCIE2_AHB_CLK>,
> +				 <&gcc GCC_PCIE2_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			clock-output-names = "pcie_phy2_pipe_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_PCIE2_PHY_BCR>,
> +				 <&gcc GCC_PCIE2PHY_PHY_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +			status = "disabled";
> +		};
> +
> +		pcie3_phy: phy@f4000 {
> +			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
> +			reg = <0x000f4000 0x14f4>;
> +
> +			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
> +				 <&gcc GCC_PCIE3_AHB_CLK>,
> +				 <&gcc GCC_PCIE3_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			clock-output-names = "pcie_phy3_pipe_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			resets = <&gcc GCC_PCIE3_PHY_BCR>,
> +				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
> +			reset-names = "phy",
> +				      "common";
> +			status = "disabled";
> +		};
> +
> +		/* TODO: Populate pcie0/pcie1 when gen3x1 phy support is added. */
> +
> +		pcie2: pcie@20000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg = <0x20000000 0xf1d>,
> +			      <0x20000f20 0xa8>,
> +			      <0x20001000 0x1000>,
> +			      <0x00088000 0x4000>,
> +			      <0x20100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +
> +			ranges = <0x81000000 0x0 0x20200000 0x20200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x20300000 0x20300000 0x0 0x07d00000>;

Please cross check 'ranges' property with other platforms.

> +
> +			device_type = "pci";
> +			linux,pci-domain = <3>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +			max-link-speed = <3>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			phys = <&pcie2_phy>;
> +			phy-names = "pciephy";
> +
> +			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 186 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 187 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_ANOC_PCIE2_2LANE_M_CLK>,
> +				 <&gcc GCC_SNOC_PCIE2_2LANE_S_CLK>,
> +				 <&gcc GCC_PCIE2_RCHNG_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "rchng";

Why only 4 clock names?

> +
> +			resets = <&gcc GCC_PCIE2_PIPE_ARES>,
> +				 <&gcc GCC_PCIE2_AUX_ARES>,
> +				 <&gcc GCC_PCIE2_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_S_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AXI_M_STICKY_ARES>,
> +				 <&gcc GCC_PCIE2_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "aux",
> +				      "sticky",
> +				      "axi_m",
> +				      "axi_s",
> +				      "axi_s_sticky",
> +				      "axi_m_sticky",
> +				      "ahb";
> +			status = "disabled";
> +		};
> +
> +		pcie3: pcie@18000000 {
> +			compatible = "qcom,pcie-ipq9574";
> +			reg = <0x18000000 0xf1d>,
> +			      <0x18000f20 0xa8>,
> +			      <0x18001000 0x1000>,
> +			      <0x000f0000 0x4000>,
> +			      <0x18100000 0x1000>;
> +			reg-names = "dbi", "elbi", "atu", "parf", "config";
> +
> +			ranges = <0x81000000 0x0 0x18200000 0x18200000 0x0 0x00100000>,
> +				 <0x82000000 0x0 0x18300000 0x18300000 0x0 0x07d00000>;
> +
> +			device_type = "pci";
> +			linux,pci-domain = <4>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <2>;
> +			max-link-speed = <3>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +
> +			phys = <&pcie3_phy>;
> +			phy-names = "pciephy";
> +
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "msi";
> +
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 0x7>;
> +			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;

Cross check 'interrupt-map' as well.

- Mani

> +
> +			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_CLK>,
> +				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
> +				 <&gcc GCC_ANOC_PCIE3_2LANE_M_CLK>,
> +				 <&gcc GCC_SNOC_PCIE3_2LANE_S_CLK>,
> +				 <&gcc GCC_PCIE3_RCHNG_CLK>;
> +			clock-names = "axi_m",
> +				      "axi_s",
> +				      "axi_bridge",
> +				      "anoc",
> +				      "snoc",
> +				      "rchng";
> +
> +			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
> +				 <&gcc GCC_PCIE3_AUX_ARES>,
> +				 <&gcc GCC_PCIE3_CORE_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_M_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_S_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_S_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AXI_M_STICKY_ARES>,
> +				 <&gcc GCC_PCIE3_AHB_ARES>;
> +			reset-names = "pipe",
> +				      "aux",
> +				      "sticky",
> +				      "axi_m",
> +				      "axi_s",
> +				      "axi_s_sticky",
> +				      "axi_m_sticky",
> +				      "ahb";
> +			status = "disabled";
> +		};
>  	};
>  
>  	thermal-zones {
> -- 
> 2.40.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

