Return-Path: <linux-arm-msm+bounces-48316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD282A39121
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 04:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CEF01894967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 03:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C142415C15F;
	Tue, 18 Feb 2025 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCHS8vnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF806155A4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 03:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739848294; cv=none; b=tDSY52b1dNDxQaIylPZc3B5QnYrZaJGjE/LdOy16kpThennHG1HnGD7kEfVKMRUA1AOK98pPvlqPIYkihkA6IBm8UEYbVVZDaMiSHTTnbNZVBg1ryFkvfxPSVg6J6TXNjgr/ZwWA6VBNrML0yjdOISkoVGy9qTEp/xDAHM5rGJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739848294; c=relaxed/simple;
	bh=RVJFrivssK5lOgAU2uZrT+MAH2UW87Q1ZpMgWOe+frI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnb1A7Nb0atuuD25fVzVIMnI1xsc9QdltDeGxZKXStj5Y+9umFHJT25falOj+MCOdV/N5VXTtI66ZW5MVyiyjvtp9qwCL9SeifiqBD4yCUr5DIeVZNkMUUjtb/V52DeGi77+IojoxR/0NUHqOOXnQmuX9RcdqYv07+q1dQ6HgOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCHS8vnV; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30227c56b11so53232111fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739848291; x=1740453091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGwBD2CFKUEGFcmXQk7UzQTdAax4FlaTNuTGP53zge0=;
        b=lCHS8vnVJisxNLpmYu/c5adI3cl3I8QApaXq9B+vuZ2rB+3kpNrJFTmqP5FLwPJt0a
         V9vPdlgfPtAQHgTLrxLRChguN4AziXNaBTwovT8rCaVIi4mBcdK6ZGo4xzaBJGeT8REn
         hhfBqQHjgQZmDvL/fvX5I9l/JRo7/zlrvi9LHhhr3MXvfpvPjVrcVUGtwNEaqHDBNdK9
         FNioYi8AFJQKFCIQxjnl7h3vbQW5glQ9Y7tb3gSmWVhUltbcL5749PZY79lym+SNRjAx
         ZdYGN09VH0lxlLmTMJT3aPn/Dk3hqIg3x9gUYaMHXKi9d88b7tPC8biIN2fTyhO3g38M
         rhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739848291; x=1740453091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGwBD2CFKUEGFcmXQk7UzQTdAax4FlaTNuTGP53zge0=;
        b=mmN9kzjzaNn+y0pGk6/jyhjqeT8tBX/SXhs6NCyxjrBL2ch5dSnZEb2L8Kah8vdrCF
         BLyhNaVxq/CNOsuav3EIbJmVXdE3ARD2XuSKi7VORgB2KQoiEEFFszq1FtW3oM7BDKb4
         ifkW3iKLynJ8CfWOWgJJ463admW0co9pDfigkzWcqvNQT6yyM0/QZWhoKx/bFCKlYoLV
         N1sir7aIlmX39HODkxYBDLR92JEfiC7fStvsQKxj9awBtGAT7PQ3cyMILcNGmE+wvlvv
         +kIFw6wsT6AkkStMomD6zysgjuBdQSpZ6h/ZwG6faA1o/veJ0nnb7ivFwI3P+5GZikaj
         WAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVn7PR8CMwbpbH667WpAtKZLWa3GtWUB1Xb+Ml2Bqak/10L/KK4U2AGmqROuWoYCwsVzzqo6IU4KZbimjU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Lbl/F2SZYPth+tMiNHwPYCLXyxQC/YNqlHDuxcg0qo1j/8n8
	jhJMdEA/zU6DOWr46dHQkJE3WstPCz/Vl4t0JqxaU67vQVk0NS1fJG/i15k3Yb0=
X-Gm-Gg: ASbGncsKjISP13QQd0JimLBNoKIzE+WVn10bovoEgYiSQ8Hlafq1aWuTEwz9ayF8bu7
	KpAEVS0QVkpgRHwa2o953gC7u+HIoZM4WsJasjDZpDrgjQXDROOvg/br3KLPpXHZ9f2AKnLaimW
	ICsJ+sOmxmqMGyojzjyVWtNkDCV2f08OLIKtC7d5AtezT4c46dWs/dPVHCg8MZtjjlTI/TQQSyv
	oMgZ+DmJ5ktKqOenm+hufw31G6kyLJZlyK7F0p+/lS4y0LvN/N3izcth8Rs2FDABIwoUb42Zcav
	XG/vZ8g9Ew0dKXuilhPKygOVrH0YVpT24Ca74Jbbm1Xhva9UklN4Wowxmm9WQkb+OV+mR3c=
X-Google-Smtp-Source: AGHT+IEQMhncm0WXNWgmzEzOnsIe6cxTWRiyx7IxSOBKCLrORD4BXpH0JP8Q/iLmPhvhFsftBlGbKA==
X-Received: by 2002:a2e:9cd1:0:b0:308:eabd:2991 with SMTP id 38308e7fff4ca-30927a3a12fmr32101951fa.1.1739848290806;
        Mon, 17 Feb 2025 19:11:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30922dc69bdsm15315571fa.12.2025.02.17.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 19:11:29 -0800 (PST)
Date: Tue, 18 Feb 2025 05:11:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mrinmay Sarkar <quic_msarkar@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sar2130p: add PCIe EP device nodes
Message-ID: <qafwztwsn3eiz76ot4ej7uv3ahprrri7u6x5jt3tvkx4j7xu34@5yeaj2d5a535>
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-5-94b20ec70a14@linaro.org>
 <17aa47df-1daf-4ec2-8f6a-48c3bc375dd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17aa47df-1daf-4ec2-8f6a-48c3bc375dd3@oss.qualcomm.com>

On Mon, Feb 17, 2025 at 08:23:28PM +0100, Konrad Dybcio wrote:
> On 17.02.2025 7:56 PM, Dmitry Baryshkov wrote:
> > On the Qualcomm AR2 Gen1 platform the second PCIe host can be used
> > either as an RC or as an EP device. Add device node for the PCIe EP.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 53 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> > index dd832e6816be85817fd1ecc853f8d4c800826bc4..7f007fad6eceebac1b2a863d9f85f2ce3dfb926a 100644
> > --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> > @@ -1474,6 +1474,59 @@ pcie@0 {
> >  			};
> >  		};
> >  
> > +		pcie1_ep: pcie-ep@1c08000 {
> > +			compatible = "qcom,sar2130p-pcie-ep";
> > +			reg = <0x0 0x01c08000 0x0 0x3000>,
> > +			      <0x0 0x40000000 0x0 0xf1d>,
> > +			      <0x0 0x40000f20 0x0 0xa8>,
> > +			      <0x0 0x40001000 0x0 0x1000>,
> > +			      <0x0 0x40200000 0x0 0x1000000>,
> > +			      <0x0 0x01c0b000 0x0 0x1000>,
> > +			      <0x0 0x40002000 0x0 0x2000>;
> > +			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
> > +				    "mmio", "dma";
> 
> vertical list, please

Ack

> 
> > +
> > +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> > +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> > +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> > +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> > +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> > +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
> > +				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
> > +				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
> > +				 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
> 
> please make sure this one is actually required

Hmm, this one seems to be present in pcie0 and pcie1 RC, but in the EP
deivice (in the vendor DT). Are you saying that it is not used for the
EP? I think I just c&p'ed RC clocks here.

> 
> > +			clock-names = "aux",
> > +				      "cfg",
> > +				      "bus_master",
> > +				      "bus_slave",
> > +				      "slave_q2a",
> > +				      "ddrss_sf_tbu",
> > +				      "aggre_noc_axi",
> > +				      "cnoc_sf_axi",
> > +				      "qmip_pcie_ahb";
> > +
> > +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "global", "doorbell", "dma";
> 
> and here

This is used for the eDMA implementation. Unlike the vendor kernel,
there is no separate device for eDMA.

> 
> > +
> > +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > +					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
> 
> active-only

Ack.

> 
> 
> looks good otherwise
> 
> Konrad

-- 
With best wishes
Dmitry

