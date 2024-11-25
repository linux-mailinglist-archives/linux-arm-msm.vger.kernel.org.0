Return-Path: <linux-arm-msm+bounces-39097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B599D860F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 14:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2EE328776C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F4A1AAE0B;
	Mon, 25 Nov 2024 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix8HfmTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183D1A9B5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732540410; cv=none; b=KzOn9CiDES5PvBRV3mRN5zAQmGR+3HYtpPhzvXTURFultBRFLjq/xBhjIW4PaU6ARV6pf0nNCH+r3MzEEZ39FRcwq3YNx2yKK/jbv0IFntGz7ZnEPcEH63FlYdK4KlAvZbpI3aTr0Ce/ZhajBQ1z3+1U7yYujymCan9RMhL566Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732540410; c=relaxed/simple;
	bh=dhUis+L7Ycp0/25ZlPxU34H4a066EiAPbpjt5heCetc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWIfBlHSyqyyESh/dS2QL1k0VWLSOAFm1MXbK04rZQBh0t1rlKRormzXi62Rpwl3JHLTw5fVs5+7rT2b1+49nzf9k8NocjlkbDjI6x0hATjpA6oX5/lcN7GGgkuhFoUkI3arxrtn2wUESmmh5dg6aOPcEfI3TGRY091LbDBbsys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ix8HfmTL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBBKZZ032319
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 13:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r54gTYviKOwXlruq1v3O1F1bgn7zesVKS49rXzTVgUc=; b=ix8HfmTLUgbl55Ql
	d/2uebYuy3y/vMgnglH7XAuG08lUY2JnwrxY6cxAofNy2bVfxiBHdJnCzEHDiPIy
	4KA/j6IGkQK9eCBiaTummcosphmdgXKnYOtlVuPdTSCuRVSqppnHBzovwhcp+XK8
	FIXx3kUZCjGlPgWJaQqkWGjjMKjPqZHFcnHDuAQP9hoxbiJXCAr8f51W8nCZTmpl
	XjZC/KGisF/mELWKr+6iNoECy9jexcugSzMBOpDy4T8NjkRFTp38hUl4sfGKrgB7
	DZ+W2qjtNokTtq2q+ojsvYQuotperTNmUpIHrMYyegc7yTpqrAE4r9VIlnkfVeUD
	SnpzDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43374svw1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 13:13:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4668c9aa8c7so2608591cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 05:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540406; x=1733145206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r54gTYviKOwXlruq1v3O1F1bgn7zesVKS49rXzTVgUc=;
        b=WQPs1H7LJazrtqMyKv8d88JGFM1eqva6xIo2NzGMKnrBUwBnRcq64Iuez2K1qVm8xG
         DrsQywYrc0YP9jKRIkKp2E7/sgjCHGancaDrfvzljjYhFCWs92pE555fIaVOu2+njpfY
         S1F0QzrCBRasaZ4x0+19AvRNufDtNDJdDp4Gvs+IzLhFih1aWkp2WpXb2qVRlOhZBkLp
         zrL419lcX7qiXBU7VwYftJza2blkGq0qX9hn1+OnAXdAKEpTk7xboSM3yPD8t6Q56DcY
         ihNY2akfoah+rbO9VVtoFJjPYUZ1xSiot2B1A5DYUP1GL0ynv9jsJ7epwF4aVC7ppCKk
         OkGg==
X-Forwarded-Encrypted: i=1; AJvYcCV0xIrw5NbWqBVmTiOOgDhbkgN0Trrvbw64LPoY8DJ+s4Cg4KFd6KjtVxSW3T84AeZSIiXhV6N+rdy6JkFd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zlJ+Hr+1oWfZiHclN7ogXuZOSHBI/AkQ7gYqSZgZ2UJLJk/K
	CaKsUUC9eZV4eFuaiShLNPp5CFF+4beNq7nfamk2YMVzEsdKJSglJqIlQ7ywgzuoYnA/G8bpSgH
	/+FjKsbZvZQ3MGSQnn45mQbZ09cwGzOWoGs4Ik1gwLNf3+y0XiHRywd6rbk9b+vWG
X-Gm-Gg: ASbGnctg2VQ47d5g5TPfoohRs5Josc9U68MMSlY9JgW5e60G90vDNbh6vZR8yegYEHl
	wB7IDBc39a1rpppe5sZlHelrc8eyRTZz8qvSGrMZ19g1sqoQhwCjUXz7BCZQy5M87XnzSGc38NZ
	+n+Plc+PkXMOvqGeuR7B/l0bItuO1mDVg3MCorxR3GJOY0mrwQkJUUDlrZeDXLhZmydEKzoMMg1
	CKUCHpGHdzdAsER4+Cw8CtZkoG+mhcds2P0EBr6v/CAcub+2VcPuKUWoTQv198R97FF/OV6hGbg
	to7d6Z8B/P3V5mJe9mxp7bhTmeCJovU=
X-Received: by 2002:a05:622a:5a11:b0:464:af83:ba34 with SMTP id d75a77b69052e-466a176c64emr965291cf.10.1732540406300;
        Mon, 25 Nov 2024 05:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu15OrzuBffo2/0f07cUhKhr9ZQY4Z6CXgoi3UuBOLryZSdLxCtIaPUN/M9o9gnubIHVFfgA==
X-Received: by 2002:a05:622a:5a11:b0:464:af83:ba34 with SMTP id d75a77b69052e-466a176c64emr965031cf.10.1732540405892;
        Mon, 25 Nov 2024 05:13:25 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5414cb10esm236300866b.3.2024.11.25.05.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:13:25 -0800 (PST)
Message-ID: <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 14:13:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YzLiF6e-Z_RUY-tqipRtKSgUV9R0fjwx
X-Proofpoint-ORIG-GUID: YzLiF6e-Z_RUY-tqipRtKSgUV9R0fjwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250113

On 22.11.2024 7:51 AM, Yuanjie Yang wrote:
> Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
>  1 file changed, 198 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 590beb37f441..37c6ab217c96 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
>  			#size-cells = <1>;
>  		};
>  
> +		sdhc_1: mmc@7c4000 {
> +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x007c4000 0x0 0x1000>,
> +			      <0x0 0x007c5000 0x0 0x1000>;
> +			reg-names = "hc",
> +				    "cqhci";

There's an "ice" region at 0x007c8000

> +
> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo",
> +				      "ice";
> +
> +			resets = <&gcc GCC_SDCC1_BCR>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +			iommus = <&apps_smmu 0x02c0 0x0>;
> +			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			bus-width = <8>;
> +			qcom,dll-config = <0x000f642c>;
> +			qcom,ddr-config = <0x80040868>;
> +			supports-cqe;
> +			dma-coherent;
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +			status = "disabled";
> +
> +			sdhc1_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};

I'm seeing 25/50 MHz OPPs in the docs as well

[...]

> +
> +		sdhc_2: mmc@8804000 {
> +			compatible = "qcom,qcs615-sdhci","qcom,sdhci-msm-v5";

Missing space 

> +			reg = <0x0 0x08804000 0x0 0x1000>;
> +			reg-names = "hc";
> +
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> +				 <&gcc GCC_SDCC2_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc2_opp_table>;
> +			iommus = <&apps_smmu 0x02a0 0x0>;
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			bus-width = <4>;
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +			dma-coherent;
> +			status = "disabled";
> +
> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +

Similarly, it can operate at 25/50 MHz too

Konrad

