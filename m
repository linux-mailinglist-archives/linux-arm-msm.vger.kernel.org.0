Return-Path: <linux-arm-msm+bounces-39173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B499D93CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6069A286549
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088B2187FE0;
	Tue, 26 Nov 2024 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F1raRLwm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED4F28FF;
	Tue, 26 Nov 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612047; cv=none; b=NB/4gG/p7eSoD3uNk0S1Z/hf6vL4fOWg9/Ch0uyILAVPoH8TRdJR50QU5idMXcY6AJQ2PbUA06i4rLYcQUvxPSgAfaUoO3guSgZgcZvP/vIv6PzOneehamTITlEckUscLpyOUZ2pO9/T4sUMg3x2fYH12wNKOW7JLJUWRLfzKAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612047; c=relaxed/simple;
	bh=xULVQjrC5FN70C24V3L87qEshkisQnbiI7UbLBE55hI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CF6MV+BpIV1sM4eKyPFot0M+omWBjCpjcxLVnIbGlYlCz80bf3JI6CLmuF5sORIaYWyvER/yxzLHIiUikYN+7Z0NddhPT3HO82ZFPPxC0RBIx62Wo0OIsIpuxvle2h06xUst/hTRuw5guXFCJQY8vaPEq3Mq6sWCEGd4L2RvrpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F1raRLwm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ5oh80014555;
	Tue, 26 Nov 2024 09:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FBuJ1UMR/kOQvf2/eSzQ6od0
	G7TjNPZu2O5v9sCnCKQ=; b=F1raRLwmXfebAaEx15amSnoC8HFqviMOlmehxk4I
	0nRFdbBe3Gb0XW3d3odKlbehQ0aSa/WhuzLvGLgrseh2WdzxRbFK5oBT7ImpRylk
	epkFBLPLoqJZGYdnHXurjHTDx35tImMnuhzxGLS0/1VoWOdX3ng14wAZHxcR5mPJ
	BI3mrCCXTt16/CqjuSax536sx0KgBDhdQOCvbhzw4lErO1bZQ/OGJT8W7eEksJtL
	INbnJx06Mje7tSDnMUJnOvn6i8SoBBZ7YiAEh21Pb4HAfpIFytv5ZYYBOl9dlRl4
	AIH276CP0Kh2sL+o9zjLAd8DOCQ8Hn4ROPKm5lmSrB6cOQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg3n8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:07:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ97Kxs032557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:07:20 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 01:07:15 -0800
Date: Tue, 26 Nov 2024 17:07:11 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z0WPv3ygWQa/G+mD@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yJH8hpAix6ZR08acBxRtkNiMQKheC77v
X-Proofpoint-ORIG-GUID: yJH8hpAix6ZR08acBxRtkNiMQKheC77v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=979 clxscore=1015 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260071

On Mon, Nov 25, 2024 at 02:13:22PM +0100, Konrad Dybcio wrote:
> On 22.11.2024 7:51 AM, Yuanjie Yang wrote:
> > Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > index 590beb37f441..37c6ab217c96 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> >  			#size-cells = <1>;
> >  		};
> >  
> > +		sdhc_1: mmc@7c4000 {
> > +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x007c4000 0x0 0x1000>,
> > +			      <0x0 0x007c5000 0x0 0x1000>;
> > +			reg-names = "hc",
> > +				    "cqhci";
> 
> There's an "ice" region at 0x007c8000
Thanks, I check doc again, I miss "ice" region at 0x007c8000.

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
> > +			interconnect-names = "sdhc-ddr",
> > +					     "cpu-sdhc";
> > +
> > +			bus-width = <8>;
> > +			qcom,dll-config = <0x000f642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			supports-cqe;
> > +			dma-coherent;
> > +			mmc-ddr-1_8v;
> > +			mmc-hs200-1_8v;
> > +			mmc-hs400-1_8v;
> > +			mmc-hs400-enhanced-strobe;
> > +			status = "disabled";
> > +
> > +			sdhc1_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					required-opps = <&rpmhpd_opp_svs>;
> > +				};
> 
> I'm seeing 25/50 MHz OPPs in the docs as well
Thanks, I check doc again, I miss 50MHz OPPs, but I don't find 25MHz.

> [...]
> 
> > +
> > +		sdhc_2: mmc@8804000 {
> > +			compatible = "qcom,qcs615-sdhci","qcom,sdhci-msm-v5";
> 
> Missing space 
> 
> > +			reg = <0x0 0x08804000 0x0 0x1000>;
> > +			reg-names = "hc";
> > +
> > +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq",
> > +					  "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > +				 <&gcc GCC_SDCC2_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "iface",
> > +				      "core",
> > +				      "xo";
> > +
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc2_opp_table>;
> > +			iommus = <&apps_smmu 0x02a0 0x0>;
> > +			resets = <&gcc GCC_SDCC2_BCR>;
> > +			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
> > +			interconnect-names = "sdhc-ddr",
> > +					     "cpu-sdhc";
> > +
> > +			bus-width = <4>;
> > +			qcom,dll-config = <0x0007642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			dma-coherent;
> > +			status = "disabled";
> > +
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> 
> Similarly, it can operate at 25/50 MHz too
Thanks, I check doc again, I miss 50MHz OPPs, but I don't find 25MHz.

> 
> Konrad

Thanks,
Yuanjie


