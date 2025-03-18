Return-Path: <linux-arm-msm+bounces-51668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB5A669A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7093B93CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BF11D9A49;
	Tue, 18 Mar 2025 05:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJ3NmkGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D11C173D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276446; cv=none; b=s3cGsUCRnvCOrfZhfSH7Y29cP+GRY78wyEbwUxeIG+ARF3JysD0Ag2ix8n5JhlDd6oy9jfb5TrNwKwU0j5ct7+P5ExI2rYI4AslVT9w/eutCg1CsCOYIMcQIMljhC50UChvLQJjgQEKIa2D6C3pgoQa55W2cRNIbeRn8EE5p58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276446; c=relaxed/simple;
	bh=MpIk7BRCgw+gm892J/nU7G2TinIJ/UFGYmq2yBO9sAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olN0spqaHHvUaZnXgKRY9jdEn2byBFQiXUk2UmkdVl939IKRq//GGdF3ZhX2agoB1AIxWlsA4fOUz9vhcnJCQjI9JVr0gesfypnghcRXUUgQLovDc8fZqmATCJouJFWf3GDt9y3f6uhXWFQ1RqKdwsA/w2vgv8/usigfGk97wt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJ3NmkGm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2260c91576aso32002165ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742276444; x=1742881244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d61VNKEGG4SYzJHDC8a9AH+5UzzX6XxwSbiiNO09NtQ=;
        b=ZJ3NmkGm/3dG9Q9CJU7iaLapDjB4tq/JXcvUwu64tejUOx3w2OJlJ1ktbdT0/Cfp2K
         cxmdNTuC3S7skBLWo+PeSXHrw0ktLlSsiotjWLROeM49fH17lebtqR00i7Zj4TjLpvp0
         6E3+lcg3v7xdtm1kKQjHiasfuGNMVetzzRy8Re7UZyVjNXOrRHqj2LifZVGTiP1Ch592
         u6JSF6ubkUn1zRcO/c25qmiJofKCk2/ehRou0IfXolKT/7fppsuUXzoBv8fMd8YmV6pu
         3Sk706mbcnZiLAL6wLKFlmR7e79fk9f1GgeLmpVDNulwBkv8FGTOt0eH1TwkkxFuSL8O
         mMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276444; x=1742881244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d61VNKEGG4SYzJHDC8a9AH+5UzzX6XxwSbiiNO09NtQ=;
        b=wpmedNIRi+nRu3avAqukme0JNos4Z2w09r5WLcKl8Bss1Ybct9fwKYOYk1Nle21b9Z
         aztycAuzIreC15yN1zlFgJ76gayYEFRA3xscFTwAb3k6XSZ5hw6/mfIpV6wZcg5C2BBR
         sGr8MGeCqur8uV+cwclXBcQFkzzZBAho0lMpwFzJ7ZpDbov4wKkeEzThyZ+58EwUKphm
         Kvy5e9U6SX4IxXxGLi6ediS7HCbXYXBxPzbVdvLnU9d/7kIjmGgniT6b/wL+Z6NCg4EI
         QBi7zT0QHzuKOsnKX8PcGILND7XZxldBq43/LhJ/s2bVQy4tOheMhXQVF2rI6/UyyVAz
         PW+w==
X-Forwarded-Encrypted: i=1; AJvYcCXLSKJmnoqczaeaLL2skd+B8fAxC2Cme9nYFkjkLZqdp8Z5hVZFRhQI+91u9UVeVWSj1ZWga0jLaeLlrdRz@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/Pgnt8C6+dQ5i5im8qA1/Ck1xYQ+4WH09AoVGiQUE8jpd4ox
	iM3M69d4Sl7posIUn50RXdJNcOhf3mx0rkcu+q2IKwxwo6fnK8GiF2utxZ5FoA==
X-Gm-Gg: ASbGncsoEw6j5cemLgdfzy4VbERKtnySzCGv9qaY1YiK9+Zjdp9wbVsVsvBmLn9ITwz
	yCEWcYX6cB4XbpUDhMasTnQZzRkUDaIWQwn9kYx7zoQJMRcRy35E3TyPOORYVZ95M8r13e6sUib
	wsZtsbdcBlDXQ4Z51SNd+g8/H/UspDI7G8yBw0Mm9stHE01+d+9ZYmQ31LU/8XjA3lfu6tjwgt1
	6lzeIwGSudEn5D2+gIIuIEGOgDQPL0qg52pyPrGGSvTMjWVTqSMZ+2ILTmt8W+zN+knaW5MISIA
	mbpGS77pKAVnZfxXrJEKfyQM2+rolKHdtpPTiBGcw+r/AJy7MH9VuqID
X-Google-Smtp-Source: AGHT+IGev7ELRVZf4flc+rKyHHXoq4f9Y0nLxBuMxE6xcZ/cQ+wlQxQHB4W0kvEiOt8Denm0JmmFgg==
X-Received: by 2002:a05:6a20:244a:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-1f5c1327783mr23903526637.35.1742276444249;
        Mon, 17 Mar 2025 22:40:44 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56ea7daddsm8224643a12.54.2025.03.17.22.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:40:43 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:10:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, quic_krichai@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/8] arm64: dts: qcom: qcs8300: enable pcie0
Message-ID: <20250318054034.j5stptttkoiutbk5@thinkpad>
References: <20250310063103.3924525-1-quic_ziyuzhan@quicinc.com>
 <20250310063103.3924525-6-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310063103.3924525-6-quic_ziyuzhan@quicinc.com>

On Mon, Mar 10, 2025 at 02:31:00PM +0800, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 168 +++++++++++++++++++++++++-
>  1 file changed, 167 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 4a057f7c0d9f..5d05640c5e21 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -601,7 +601,7 @@ gcc: clock-controller@100000 {
>  			#power-domain-cells = <1>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&sleep_clk>,
> -				 <0>,
> +				 <&pcie0_phy>,
>  				 <0>,
>  				 <0>,
>  				 <0>,
> @@ -711,6 +711,172 @@ mmss_noc: interconnect@17a0000 {
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		pcie0: pci@1c00000 {
> +			device_type = "pci";
> +			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
> +			reg = <0x0 0x01c00000 0x0 0x3000>,
> +			      <0x0 0x40000000 0x0 0xf20>,
> +			      <0x0 0x40000f20 0x0 0xa8>,
> +			      <0x0 0x40001000 0x0 0x4000>,
> +			      <0x0 0x40100000 0x0 0x100000>,
> +			      <0x0 0x01c03000 0x0 0x1000>;
> +			reg-names = "parf",
> +				    "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "config",
> +				    "mhi";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +			bus-range = <0x00 0xff>;
> +
> +			dma-coherent;
> +
> +			linux,pci-domain = <0>;
> +			num-lanes = <2>;
> +
> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
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
> +			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
> +			assigned-clock-rates = <19200000>;
> +
> +			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "pcie-mem",
> +					     "cpu-pcie";
> +
> +			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> +				    <0x100 &pcie_smmu 0x0001 0x1>;
> +
> +			resets = <&gcc GCC_PCIE_0_BCR>,
> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
> +			reset-names = "pci",
> +				      "link_down";
> +
> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
> +
> +			phys = <&pcie0_phy>;
> +			phy-names = "pciephy";
> +
> +			status = "disabled";
> +
> +			pcie3_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				/* GEN 1 x1 */
> +				opp-2500000 {
> +					opp-hz = /bits/ 64 <2500000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <250000 1>;
> +				};
> +
> +				/* GEN 1 x2 and GEN 2 x1 */
> +				opp-5000000 {
> +					opp-hz = /bits/ 64 <5000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <500000 1>;
> +				};
> +
> +				/* GEN 2 x2 */
> +				opp-10000000 {
> +					opp-hz = /bits/ 64 <10000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <1000000 1>;
> +				};
> +
> +				/* GEN 3 x1 */
> +				opp-8000000 {
> +					opp-hz = /bits/ 64 <8000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +					opp-peak-kBps = <984500 1>;
> +				};
> +
> +				/* GEN 3 x2 and GEN 4 x1 */
> +				opp-16000000 {
> +					opp-hz = /bits/ 64 <16000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <1969000 1>;
> +				};
> +
> +				/* GEN 4 x2 */
> +				opp-32000000 {
> +					opp-hz = /bits/ 64 <32000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +					opp-peak-kBps = <3938000 1>;
> +				};
> +			};
> +		};
> +
> +		pcie0_phy: phy@1c04000 {
> +			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
> +			reg = <0x0 0x01c04000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_CLKREF_EN>,
> +				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
> +				 <&gcc GCC_PCIE_0_PIPE_CLK>,
> +				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>,
> +				 <&gcc GCC_PCIE_0_PHY_AUX_CLK>;
> +			clock-names = "cfg_ahb",
> +				      "ref",
> +				      "rchng",
> +				      "pipe",
> +				      "pipediv2",
> +				      "phy_aux";
> +
> +			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> +			reset-names = "phy";
> +
> +			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
> +			assigned-clock-rates = <100000000>;
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "pcie_0_pipe_clk";
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>  		ufs_mem_hc: ufs@1d84000 {
>  			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>  			reg = <0x0 0x01d84000 0x0 0x3000>;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

