Return-Path: <linux-arm-msm+bounces-39174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FA9D93DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01D7165D19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E6A1B394E;
	Tue, 26 Nov 2024 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aolo43+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7318F2DA;
	Tue, 26 Nov 2024 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612335; cv=none; b=pEheGsTjXQGhZkPGQhY1gMiKvUWVSpDjHMKr1LFvq02pXf0viyWLbLDAUOwp8A3DJdwYqoroaq39lPrkZN0qiscggoqB4aDkwU08LQwLatE02bXMMnpaQvChzx50uNDzfxh/cwl3zZ5bK/4Ws+2q2RcyqS0yKb7xCD5UPfUNdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612335; c=relaxed/simple;
	bh=pgxmLvW9WLvgyz7HGd8H/GF8TfGm0yXATnuchUZHPAA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRobWSiOXQIJ1SEZuL3uj1yXIy11kSJOMXFjz+cSx2kyFoP5apBW7jOONAqIRJIddcijG7ULOS0Kqze77ysrSBjRM/p9076Il6UQd9MIU8TTvBiRHHO8MNWDJghaaysQXDzWrue/XRWBRvuD+EqpFv52SYWPH1d55Hkf9AbPan4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aolo43+F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APKotq9007724;
	Tue, 26 Nov 2024 09:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MkD+Z6LHmgclGH3CFg9mcX2y
	iQceJOzzPcOnUTDDwyQ=; b=aolo43+F9zkZn4MPfV809nhF7KxSzqIsrIm3Y2zn
	s38VAjwt5B7bEsXIZ70yLYhiP5Cll0ORBEZZqylsL3zc357DEJhg6SnwlJp2fYnY
	D6/Ejzw9RvzzNIbxsvwWm9ZNki75dFX3J+Uk+hdfgdY9g/zxxkaGmFVbwlg78bOJ
	7iaIwpJJEire1yOxICN1UjENvSNGkOGepYdw1mbtQ60Pc0+fgeOb51rw+/nB9UH+
	jlWTsmfKZxVFi2cW3YG5oK43WB6/f5IFnH0izQmlOy7EygEgTT9eBlMuF1O0qMHJ
	4t0sBMpq+Q/o2LlSsAkiaXpUCLdU0ASxvcelVszoO5nAvg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626fj12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:12:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ9C1i1007065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:12:02 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 01:11:57 -0800
Date: Tue, 26 Nov 2024 17:11:53 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z0WQ2evD5AmhF4nr@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
 <Z0WPv3ygWQa/G+mD@cse-cd02-lnx.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z0WPv3ygWQa/G+mD@cse-cd02-lnx.ap.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uZbjmKjYUsmvQQXFba7ESStf18Yq8LOp
X-Proofpoint-ORIG-GUID: uZbjmKjYUsmvQQXFba7ESStf18Yq8LOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260072

On Tue, Nov 26, 2024 at 05:07:11PM +0800, Yuanjie Yang wrote:
> On Mon, Nov 25, 2024 at 02:13:22PM +0100, Konrad Dybcio wrote:
> > On 22.11.2024 7:51 AM, Yuanjie Yang wrote:
> > > Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> > > 
> > > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> > >  1 file changed, 198 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > index 590beb37f441..37c6ab217c96 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> > >  			#size-cells = <1>;
> > >  		};
> > >  
> > > +		sdhc_1: mmc@7c4000 {
> > > +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > > +			reg = <0x0 0x007c4000 0x0 0x1000>,
> > > +			      <0x0 0x007c5000 0x0 0x1000>;
> > > +			reg-names = "hc",
> > > +				    "cqhci";
> > 
> > There's an "ice" region at 0x007c8000
> Thanks, I check doc again, I miss "ice" region at 0x007c8000.
> 
> > > +
> > > +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "hc_irq",
> > > +					  "pwr_irq";
> > > +
> > > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > > +				 <&gcc GCC_SDCC1_APPS_CLK>,
> > > +				 <&rpmhcc RPMH_CXO_CLK>,
> > > +				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> > > +			clock-names = "iface",
> > > +				      "core",
> > > +				      "xo",
> > > +				      "ice";
> > > +
> > > +			resets = <&gcc GCC_SDCC1_BCR>;
> > > +
> > > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > > +			operating-points-v2 = <&sdhc1_opp_table>;
> > > +			iommus = <&apps_smmu 0x02c0 0x0>;
> > > +			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> > > +			interconnect-names = "sdhc-ddr",
> > > +					     "cpu-sdhc";
> > > +
> > > +			bus-width = <8>;
> > > +			qcom,dll-config = <0x000f642c>;
> > > +			qcom,ddr-config = <0x80040868>;
> > > +			supports-cqe;
> > > +			dma-coherent;
> > > +			mmc-ddr-1_8v;
> > > +			mmc-hs200-1_8v;
> > > +			mmc-hs400-1_8v;
> > > +			mmc-hs400-enhanced-strobe;
> > > +			status = "disabled";
> > > +
> > > +			sdhc1_opp_table: opp-table {
> > > +				compatible = "operating-points-v2";
> > > +
> > > +				opp-100000000 {
> > > +					opp-hz = /bits/ 64 <100000000>;
> > > +					required-opps = <&rpmhpd_opp_svs>;
> > > +				};
> > 
> > I'm seeing 25/50 MHz OPPs in the docs as well
> Thanks, I check doc again, I miss 50MHz OPPs, but I don't find 25MHz.
> 
> > [...]
> > 
> > > +
> > > +		sdhc_2: mmc@8804000 {
> > > +			compatible = "qcom,qcs615-sdhci","qcom,sdhci-msm-v5";
> > 
> > Missing space 
Thanks, I will add space in next version.

> > > +			reg = <0x0 0x08804000 0x0 0x1000>;
> > > +			reg-names = "hc";
> > > +
> > > +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> > > +			interrupt-names = "hc_irq",
> > > +					  "pwr_irq";
> > > +
> > > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > > +				 <&gcc GCC_SDCC2_APPS_CLK>,
> > > +				 <&rpmhcc RPMH_CXO_CLK>;
> > > +			clock-names = "iface",
> > > +				      "core",
> > > +				      "xo";
> > > +
> > > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > > +			operating-points-v2 = <&sdhc2_opp_table>;
> > > +			iommus = <&apps_smmu 0x02a0 0x0>;
> > > +			resets = <&gcc GCC_SDCC2_BCR>;
> > > +			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > +					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
> > > +			interconnect-names = "sdhc-ddr",
> > > +					     "cpu-sdhc";
> > > +
> > > +			bus-width = <4>;
> > > +			qcom,dll-config = <0x0007642c>;
> > > +			qcom,ddr-config = <0x80040868>;
> > > +			dma-coherent;
> > > +			status = "disabled";
> > > +
> > > +			sdhc2_opp_table: opp-table {
> > > +				compatible = "operating-points-v2";
> > > +
> > 
> > Similarly, it can operate at 25/50 MHz too
> Thanks, I check doc again, I miss 50MHz OPPs, but I don't find 25MHz.
> 
> > 
> > Konrad
> 
> Thanks,
> Yuanjie
> 
Thanks,
Yuanjie


