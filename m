Return-Path: <linux-arm-msm+bounces-38791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B5C9D5B1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2045DB21D43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD0217BEA4;
	Fri, 22 Nov 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f9axSdhM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4629165EE6;
	Fri, 22 Nov 2024 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264817; cv=none; b=SkjF8E+4k93/iPYZDUOoTGej1WkK8FIa4BVRaYE1KDiv8P4HC/4rpMqyyo6XZrKwCvfHn51Gb1UT9o78sE9Fy8YxJvPaKITKCiDjYFDUpecbK9Fh2vLY7UxKci1sKvsuCaswgkBceV+fF3Eizkwflkg5/iy9BsWSFZo2FUQ+nY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264817; c=relaxed/simple;
	bh=SAAv+IV2q4W/K/mgYgUrQcsuChODGIVW09y4HM6oVDw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2D7jncWjQcjq4cpEBtOyKkdH065U9kuBFOL9JvsG8gsltVOW4y2L0IA+3Zp3AUkhHXcEF8Pr7DL5j04HVCDsiZayi2uqGJm5LGl+kjmQkJLURkHYBnrX9lTL6zA/tNBrPkOlOV3JpxofoRtZNkfuOa4t2a6BctJKoOxADZ2j28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f9axSdhM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALLpq6r025682;
	Fri, 22 Nov 2024 08:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=haNWgxzgTjDgIowVFWR33CIu
	WYP1uxTxuQlgVv/OIaY=; b=f9axSdhMsGxumeszge7PRflEbiKvqf3k6tuDUu3p
	BsGBMNeqoGhmQ83OdS5UDzB8EwNmgZoW81mePdLuDMJrrp5QMOvKiAjFwQz+wSQk
	XGbRbzBd1db4N5IfZh2IlL+R0Uddl3WsnWOImbI65m9CzFzTOjyxmQKpohCpe9sf
	jAJGaHN3fNIS9OagA9H8yA8lKa5oXKM5I4PQ78jiK1DEQ+JQIUb2pea57gf7JeT6
	3Qc83H3J2EWfwzQBqLO0OE75PtHjgaqlUMSF0Mg5zAOA9Kqe7Kqr7FGvXOZplARG
	2J/HyPvf6/5qiN8dq4Jryar4ZnUcy2CyT1mlB1bjQhyPbA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b1bk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:40:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM8eBsF010407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:40:11 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 00:40:07 -0800
Date: Fri, 22 Nov 2024 16:40:02 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z0BDYiVaLQXaMsle@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <f9b01690-8940-4f8b-b142-6c2ec4db3e83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f9b01690-8940-4f8b-b142-6c2ec4db3e83@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O0RpfHuaPG2PlL20SvBDoP4UBuWkB1MH
X-Proofpoint-ORIG-GUID: O0RpfHuaPG2PlL20SvBDoP4UBuWkB1MH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220072

On Fri, Nov 22, 2024 at 08:04:31AM +0100, Krzysztof Kozlowski wrote:
> On 22/11/2024 07:51, Yuanjie Yang wrote:
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
> 
> These are properties of memory, not SoC. If the node is disabled, means
> memory is not attached to the SoC, right?
> 
> > +			status = "disabled";
Thanks, I think qcom,dll-config and qcom,ddr-config are properties of Soc,
they are memory configurations that need to be written to the ioaddr.
And mmc-ddr-1_8v,mmc-hs200-1_8v,mmc-hs400-1_8v are bus speed config,
they indicate the bus speed at which the host contoller can operate.
If the node is disabled, which means Soc don't support these properties.

> 
> 
> ...
> 
> > +
> > +		sdhc_2: mmc@8804000 {
> > +			compatible = "qcom,qcs615-sdhci","qcom,sdhci-msm-v5";
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
> 
> Same comments.

Thanks, I think qcom,dll-config and qcom,ddr-config are properties of Soc,
they are memory configurations that need to be written to the ioaddr.
And mmc-ddr-1_8v,mmc-hs200-1_8v,mmc-hs400-1_8v are bus speed config,
they indicate the bus speed at which the host controller can operate.
If the node is disabled, which means Soc don't support these properties.


> > +			qcom,dll-config = <0x0007642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			dma-coherent;
> > +			status = "disabled";
> > +
> > +			sdhc2_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> > +
> > +				opp-202000000 {
> > +					opp-hz = /bits/ 64 <202000000>;
> > +					required-opps = <&rpmhpd_opp_nom>;
> > +				};
> > +			};
> >  		};
> >  
> >  		dc_noc: interconnect@9160000 {
> 
> 
> Best regards,
> Krzysztof

Thanks,
Yuanjie

