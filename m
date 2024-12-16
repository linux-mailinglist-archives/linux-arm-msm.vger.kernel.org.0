Return-Path: <linux-arm-msm+bounces-42293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685E9F29EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F111668A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 06:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6899A1C54AA;
	Mon, 16 Dec 2024 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kArt6tXc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAB1509A0;
	Mon, 16 Dec 2024 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734330014; cv=none; b=PtoJdiDITr4QzV4YsE9voWO0LDhHcUEBULe18mLS1FkRzEVTAo2dkymOHo7Ara1ImvIJu1/L4w5umUU0fcWzHpgemU5dc7EbKeGwo1zp5wnVW96i1VRTHN08pKmlLES8+K9Pjp3tsX+X/hNwtuN9hxKWf7LX+QN0p5eVOzFwR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734330014; c=relaxed/simple;
	bh=pkyvtopd8Y1EAVHDdlqMb8aBQcGcAMsF3ndTQyJzBPY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP1xqVGmNftveS3CGJfsIS5fntjkB2UwM5Lf6A8V/VYhS++nJMWfz4qFBr0bqGlxequkIDrn52G4qCoYgQcARWWWT6B2PvoEtJmyt7t10ILOd+mlvSxnTqykwsbdXa5Sh1Ju2IReT1YhnDOGM0iQSPPQ/FQTQ3uY1OppHkD7wrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kArt6tXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG5ZR9g024089;
	Mon, 16 Dec 2024 06:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=epIePoMAiXerde7OcGYbNWm8
	N5lo+1DxyIPb5Ys38WY=; b=kArt6tXcUScygQnGbDvKmp9kbAwAad5IywPAP/Bz
	BajVk3ARInYvAHlA7PCXkJAhg6Na7as5XeR8Of8RNEzB30O2o+TwskrZf4pMky4g
	N+EFsfWSAHOU7wwl/g27tXbAGcYR1TzzhbMiXivOu4sZ/UWkLopIn087N2moA9lt
	XkvvLEOXQHg0IpekSzvhJz95nOTkYJk7EF3MSNLrM0LT5hkhcoLo1GM5aB6yXtrN
	Whj9uJIdHusIjeA/xUIA02PQ+6weTQQFMnwXhY25gMUutD6tBuHOD3V67H2CpdFO
	3MynLLo66m9RMkqtzGZ5HrVIfa16+cdHo9vbBYElE6by7Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43je69838w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:19:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BG6JsEh028720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 06:19:54 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 15 Dec 2024 22:19:50 -0800
Date: Mon, 16 Dec 2024 14:19:46 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z1/Ggklt4x0D/CoD@cse-cd02-lnx.ap.qualcomm.com>
References: <20241206023711.2541716-1-quic_yuanjiey@quicinc.com>
 <20241206023711.2541716-2-quic_yuanjiey@quicinc.com>
 <dac91ee1-4e1c-47d2-ba7b-6ab47582731f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dac91ee1-4e1c-47d2-ba7b-6ab47582731f@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wK_5kkYM0373_DNMUynYso8GRqRt3TFd
X-Proofpoint-ORIG-GUID: wK_5kkYM0373_DNMUynYso8GRqRt3TFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160049

On Fri, Dec 13, 2024 at 01:56:04PM +0100, Konrad Dybcio wrote:
> On 6.12.2024 3:37 AM, Yuanjie Yang wrote:
> > Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 209 +++++++++++++++++++++++++++
> >  1 file changed, 209 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > index 590beb37f441..e52bf8c77884 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > @@ -399,6 +399,72 @@ qfprom: efuse@780000 {
> >  			#size-cells = <1>;
> >  		};
> >  
> > +		sdhc_1: mmc@7c4000 {
> > +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x007c4000 0x0 0x1000>,
> > +			      <0x0 0x007c5000 0x0 0x1000>,
> > +			      <0x0 0x007c8000 0x0 0x8000>;
> > +			reg-names = "hc",
> > +				    "cqhci",
> > +				    "ice";
> > +
> > +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq",
> > +					  "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > +				 <&gcc GCC_SDCC1_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "xo",
> > +				      "ice";
> > +
> > +			resets = <&gcc GCC_SDCC1_BCR>;
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc1_opp_table>;
> > +			iommus = <&apps_smmu 0x02c0 0x0>;
> > +			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> 
> QCOM_ICC_TAG_ACTIVE_ONLY for the CPU path
OK, I will fix it in next patch.

> > +			interconnect-names = "sdhc-ddr",
> > +					     "cpu-sdhc";
> > +
> > +			qcom,dll-config = <0x000f642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			supports-cqe;
> > +			dma-coherent;
> > +			status = "disabled";
> 
> Nit: please add a newline before status for consistency
I will add a newline before status in next patch.

> (both comments apply to both controllers)
OK I will fix both controllers(SDHC_1 and SDHC_2).

> Konrad

Thanks,
yuanjie

