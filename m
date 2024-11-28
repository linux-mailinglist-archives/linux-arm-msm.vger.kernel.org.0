Return-Path: <linux-arm-msm+bounces-39496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2B9DBCCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 21:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9894B2819BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 20:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9AF1C2443;
	Thu, 28 Nov 2024 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geRFYmz/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF41C07F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732824872; cv=none; b=oObqZLrb9LmTEaeu/WQGmiP1XqiKv0NVrXo30AcwqdkiAhw2z7SgzF00larUwXAA6bFFRyToPxParNVrDNeXJR/iJiPqJnITtYs43BiMi+8CeXhqxTIBHtOT17KgasTi5U+q0w/U/ZgGgpgi69kaK4cMgH1KynSabM8icSeuamQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732824872; c=relaxed/simple;
	bh=+zXs3aELrrOdcH7l0CkDK1T02KJWAx6tezV7yYDVGX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRGZ/PdI/vF67b+3bQ02//brfYN97gjSi1z1tWYyN0qgfBgCGs6AWfoVpVnSGiduNJRpaxrNPM9IY104rypN8KNQuTudqlrcSXfsz978EoIBZrICd/DM4XBLDvisYZYeHsfLY22bn8Vzk+Oe7Qq0I9qhpx0Ob0PFF4I1lzbjVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geRFYmz/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASI02lr025832
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjg0vsL9PIQrJqQc1ErY87Ss0UkRH1ifFtchX/4u0ic=; b=geRFYmz/taaZ3vJk
	7vD6y0TyGs2eA6LSduINCHTOQALBNDZxPk57TDvKyowo96olEnJrG8mlBbWugAjP
	+sBFSbl1RwbsEvUBIuVxm54TwxNAnrzH9THp1OgkO60GSWLtrNONsXvVDxAWXtKG
	BtZLam2eFnNh9g0Q8zseHoZdVfcCihq58zAv3A9dhwXwY9+Msh7bB6OW/YLYgoD1
	MHav5nJhz+6kMcP1t/2ACR27/X4MkP8vhkZaPqKvimTXRR/GTarp/2XhrAmH4ry5
	xBkUisLEoCIw/u57QNAJnbqFWwnQtH1tiEJuSVKBigeEcjVIqmYk9u+yuGTCJtP3
	9t6/Xw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43673jbkp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 20:14:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46699075dd4so3313161cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 12:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732824869; x=1733429669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjg0vsL9PIQrJqQc1ErY87Ss0UkRH1ifFtchX/4u0ic=;
        b=dR94n6LagVgJMDTZrj1YgWgHHhqkwArVd3ui9YF5KrUniPLEXPPtkV2+utV9PSkHnV
         7J6NUf2292Kmkdd35rp72jYNhP0efNpFJzZebPBHhzAGlA3IcxJCYg/FHAbOkEWZ+ff4
         sbVSHG4SOEDJy9LfwI6OEzruP2kh4inWk9VNygD1kTDTyGYk1hGCrm15hiRcP2M/+cin
         yKRoHVOEgMa4hP6MdXeAbA1YGVS2xrMRE9o+pboI5p/NTES1EcY/f5Mc93fly5WwkkjG
         OEZ6nWXLj0H65DBedgC4H/KB8LAzix9zgb1oR7s+OFe+/7wzJvaERQmcv7NWgSNZroPn
         LTIg==
X-Forwarded-Encrypted: i=1; AJvYcCU5J6N/8EAnjUYEsY8g/sG8uJho5YCYKz5G/hKroVEeE1wlspkJYy55IPoqivXm0rsq/xdT4bnx8ap3RSUT@vger.kernel.org
X-Gm-Message-State: AOJu0YzvU8ilw4WTRzjI3f2hO4e/8O4YZIKOTgWRtdOGXGilZGz8OYT3
	OqMAZW2vAgQwulXFUF4Srt/Z84HA7L43oMOE8dbmEGTTpU7a+iimjQNXpQvaNPb9WXzKRuIKxoc
	jBle1EAG/RuerX3dyISmaW26W6IxsnxUqbhgxARfOIU7l0lMGJYQHYj7SK3ww9e5I
X-Gm-Gg: ASbGnctPSqXu0tPcJSwwOCeh+HSqPFGhEoOWLtbKSiAIPLX5fzFhmcSJ/bRp1lLDDLl
	JF4h82M6pfoRi70MTpopGaB2EwsP6cnC6hAZWsmQ07tLKV+nmWaIlOP+Vord8cJmcoUCI4MnogE
	q1iFIV96K9K4TQSmU+uERkyK/P+7cDiKHKb6AZlQMp+d/UQNzl/KmESWYJNdZxWNy8NJsfoltWr
	E9Q+7Vxmjj3q2okfUYRRJ/o5d6VPjAshDYFP2XMkJ8YJZJ7Aw8ilbl5so36GE48W1SDpmDDPL0C
	tZ5KNLlU+RcsabMQxuPA9pRBE4y323I=
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr55782651cf.13.1732824868864;
        Thu, 28 Nov 2024 12:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJQMzZTd/mwyBiurFVOcv8v+qrOUQ80czSiwqfTqiVtFonMiHL9Th3LiaU5QNqC3afeeXn/g==
X-Received: by 2002:a05:622a:1a13:b0:460:62a1:70be with SMTP id d75a77b69052e-466b36737d2mr55782461cf.13.1732824868440;
        Thu, 28 Nov 2024 12:14:28 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e716fsm99165566b.108.2024.11.28.12.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 12:14:27 -0800 (PST)
Message-ID: <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
Date: Thu, 28 Nov 2024 21:14:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add QCS8300 platform
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: owg1ansLTeupV-uRzNB36r1f5B0PfVR9
X-Proofpoint-ORIG-GUID: owg1ansLTeupV-uRzNB36r1f5B0PfVR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280161

On 28.11.2024 9:44 AM, Jingyi Wang wrote:
> Add initial DTSI for QCS8300 SoC.
> 
> Features added in this revision:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with uart
> - SMMU
> - QFPROM
> - Rpmhpd power controller
> - UFS
> - Inter-Processor Communication Controller
> - SRAM
> - Remoteprocs including ADSP,CDSP and GPDSP
> - BWMONs
> 
> Written with help from Zhenhua Huang(added the smmu node), Xin Liu(added
> ufs, adsp and gpdsp nodes), Tingguo Cheng(added the rpmhpd node), Kyle
> Deng(added the aoss_qmp node), Raviteja Laggyshetty(added interconnect
> nodes) and Cong Zhang(added the INTID of EL2 non-secure physical timer).
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

[...]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core4 {
> +					cpu = <&cpu4>;
> +				};

The MPIDR_EL1 register value (CPU node reg) suggests they are not
part of the same cluster (as you confirmed in the psci idle domains
description)

[...]

> +
> +		ufs_mem_hc: ufs@1d84000 {
> +			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +			reg = <0x0 0x01d84000 0x0 0x3000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <2>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +
> +			iommus = <&apps_smmu 0x100 0x0>;
> +			dma-coherent;
> +
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0

QCOM_ICC_TAG_ALWAYS, file-wide

[...]

> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
> +			reg = <0x0 0x01d87000 0x0 0xe10>;
> +			/*
> +			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
> +			 * enables the CXO clock to eDP *and* UFS PHY.
> +			 */
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 <&gcc GCC_EDP_REF_CLKREF_EN>;

Are you sure about this, or is this just copypasted from sa8775p?

[...]

> +
> +		intc: interrupt-controller@17a00000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */

Drop these comments

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			redistributor-stride = <0x0 0x20000>;
> +		};
> +
> +		memtimer: timer@17c20000 {

Unused label

[...]

> +	arch_timer: timer {

Ditto

Konrad

