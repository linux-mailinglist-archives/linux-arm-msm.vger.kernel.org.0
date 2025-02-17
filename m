Return-Path: <linux-arm-msm+bounces-48279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09565A38C4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 20:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F443A46C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 19:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EEE23645F;
	Mon, 17 Feb 2025 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icZKC+jD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9702F158545
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739820225; cv=none; b=p+t0Iv8ms4LYCJwPJaOI6vo+kjjgh25Np4faJ1W3UUcP1AyJt6m/4hB+lXJoaiuCmOwxJbw6SawiozFJFDvwepARvWTnpbrKPvm20GR6boM9fVNxklZjGFhsMFY5PYraPnGm1hQ2PMHLq4mj+TLgkFIy6QIiv/m9Mhv09d5Qsww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739820225; c=relaxed/simple;
	bh=2Nq3JUri+KI/06XtoGRs5UIrCElEWxYTvjfNOTr8uMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwmFAY6NxsdziZvi/ugAsdvm92KySAV7i6KwOo+J+JzjOUMxS4D4j0yCKyGJk5Z6bKR/aNv5pDXhmiLrCX4JzCnXwzotkjpR0clGJACKhgwY5GyIHfgqCm+Ahybo2M4waIxg8URuuGJjQv7SarDPZOfhUN4bPFhBMIFgI5fqR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icZKC+jD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAcNFc026654
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3R0RsP0qxokYAsUiXTvj2ecPRgqSEuNFAQ4ClnwXpI=; b=icZKC+jD4T/KkWYA
	gTMeDv6qsvGIZyOunAsNrZrqPkNtYqgZ7lVOdryXcTT6P47IrMiiu+ULBSfLoi5j
	gMPDGjRiDBxILNhdthAKocdJOi4AGxNYb9cP1mpy5PNr7l+bp/Ak4A5juIxPWVng
	MZXnUY5cItjh1Xfb42/ahY86in7ZN0pwNccmL5UcIonUmCG1Jz+4jxuD/8zsEwWi
	DgCnqQ07FPJ4snpDPUBI9L8AiKQ52O0mlkODIBJwW335jEogIP/iNa22GXzycypS
	MvGKNkceL6c/BFsA6cqYBbY24vknSZpGtX0KyshTmaadDZzb5Hpq+Qrrag+RuE/N
	eq6xxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sjn6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 19:23:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a70510d2so8632185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 11:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820214; x=1740425014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f3R0RsP0qxokYAsUiXTvj2ecPRgqSEuNFAQ4ClnwXpI=;
        b=Axw/N4F7VI+vmS1PQKA6WEfGEx89MPxTGYXP99ffMFRaaDG7FZUWLcvfl4e3JYzJAv
         PVeXEsYnWjs4SF637HE9FbNls8qAuCOH066+RQ6UKgbc8rIoP/qqX8DDg3FkPrEKdlVt
         tnkqkUUPu/PmAyqolO6YjG/jLb/xy3/IaiaJJ9MDFivctL1wkiaTktIYw59/m/SUJXQC
         Wiiqw47st+MUunGfWe9O4k2uCIcGZKs6nVoYOLtu1LFwKLAWt5JYCddxUPimnmq0zIIL
         /58HGConWn/l6lnG5wsAtUO/hVZpyRBKuVTGtaeHK1iSJ6bAegkTYP4vgJQE5krpchGz
         XQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVF/YhAnJzmh1KSeJRajQyLEyATyTZukD9pLNDn2niASF3jGM3Di9aLCH6EfTZpRkK4iIbQc/F7FeDyxJJE@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbNkjCSeOYEytH4LBtd6JMsvqOtD6YLbl1DFx6jYOPo9LbvXw
	OC9TRtXtco1uBi4p973k3rqg8Bl6LT4UG5fvnHq8N1e2rXhooiJJI5wBfG80a3XcuJG7EUSXFXs
	jfHe3usKss/u4CQnLyrD+FgCbiQx37tzq6sq1+Mgf4HFb/tEpFI/ifTkGAdTzyAXi
X-Gm-Gg: ASbGnctN1DK7/CWsfiwIJYJMBY1n2nElcC1CKAnUjdhLwhFqkSrSCzSN7Fur1vFqefq
	5mtf2Arx57/6tbOIz0isZ+7Xsd72extqGHmpYAI8ggyaobAQcdAt/b9zHeD79Kjxko1UyjXIUhQ
	XGS7BEDXP/VDALwigOkQAOB5//maNkoYaIGCCtLfHu4pa2CmJJBq+CisiGRr8stClG54PYSXE7n
	3gKIA3lv53mhCHjzyBQT7lpCMpDRR0Sji4PHgGIHC/6KQAO2lBAgoMB2ffkGRSmROUJE9TkUHmK
	RW87FLnhAgwV7bTGm7fjti4BF/llJxaISKtzHbu6W/Ev1gLMXPmuAtAGw98=
X-Received: by 2002:a05:620a:4114:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7c08a894ef5mr568444985a.0.1739820214232;
        Mon, 17 Feb 2025 11:23:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzRMmoNE160cgaxdnNq2csM6qzlbbuPrQJrTqF0PQj/u94i3U0EsIFyC0sFwqX+gBrUlh8yQ==
X-Received: by 2002:a05:620a:4114:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7c08a894ef5mr568442385a.0.1739820213788;
        Mon, 17 Feb 2025 11:23:33 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09ab65sm1702580e87.82.2025.02.17.11.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 11:23:32 -0800 (PST)
Message-ID: <17aa47df-1daf-4ec2-8f6a-48c3bc375dd3@oss.qualcomm.com>
Date: Mon, 17 Feb 2025 20:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sar2130p: add PCIe EP device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217-sar2130p-pci-v1-0-94b20ec70a14@linaro.org>
 <20250217-sar2130p-pci-v1-5-94b20ec70a14@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250217-sar2130p-pci-v1-5-94b20ec70a14@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L5boTF-D2gHp-IVz1M_c8z1T75tIhAEZ
X-Proofpoint-ORIG-GUID: L5boTF-D2gHp-IVz1M_c8z1T75tIhAEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170152

On 17.02.2025 7:56 PM, Dmitry Baryshkov wrote:
> On the Qualcomm AR2 Gen1 platform the second PCIe host can be used
> either as an RC or as an EP device. Add device node for the PCIe EP.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi | 53 ++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> index dd832e6816be85817fd1ecc853f8d4c800826bc4..7f007fad6eceebac1b2a863d9f85f2ce3dfb926a 100644
> --- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
> @@ -1474,6 +1474,59 @@ pcie@0 {
>  			};
>  		};
>  
> +		pcie1_ep: pcie-ep@1c08000 {
> +			compatible = "qcom,sar2130p-pcie-ep";
> +			reg = <0x0 0x01c08000 0x0 0x3000>,
> +			      <0x0 0x40000000 0x0 0xf1d>,
> +			      <0x0 0x40000f20 0x0 0xa8>,
> +			      <0x0 0x40001000 0x0 0x1000>,
> +			      <0x0 0x40200000 0x0 0x1000000>,
> +			      <0x0 0x01c0b000 0x0 0x1000>,
> +			      <0x0 0x40002000 0x0 0x2000>;
> +			reg-names = "parf", "dbi", "elbi", "atu", "addr_space",
> +				    "mmio", "dma";

vertical list, please

> +
> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
> +				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
> +				 <&gcc GCC_QMIP_PCIE_AHB_CLK>;

please make sure this one is actually required

> +			clock-names = "aux",
> +				      "cfg",
> +				      "bus_master",
> +				      "bus_slave",
> +				      "slave_q2a",
> +				      "ddrss_sf_tbu",
> +				      "aggre_noc_axi",
> +				      "cnoc_sf_axi",
> +				      "qmip_pcie_ahb";
> +
> +			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "global", "doorbell", "dma";

and here

> +
> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;

active-only


looks good otherwise

Konrad

