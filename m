Return-Path: <linux-arm-msm+bounces-39008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1539D7A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 03:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE49162A42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E6E3234;
	Mon, 25 Nov 2024 02:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VESBtHs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60E539A;
	Mon, 25 Nov 2024 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732501221; cv=none; b=D71aBjX24Q28s9M20Sr49LMSwwjdwOcCFOH/LwWKHKWy5H+6uq4qJVYT/3p2xBPd7tbpK0mcA7waDIK5yhe9PjKSU27ORtGgxgNr6/g7qsJ791CCQvQsqOJ1dTqUDF5gHCQmV5DOUOsg1MnhwvmXF1vwT0zTbxuFdXM1OQFlqnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732501221; c=relaxed/simple;
	bh=aKFcQ/fHtdKz0ODHzEPNO4APsuqME9RMV3b2C4hSq10=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n79Z9kfssHMpMiQY6ygUUielq7Dn7an1yec4Yfb8qgLtzVMZzhrxWQ020XFe0d1ZZ7DzOSWA/T5w/IvE+Z+btfyCEuPkkip1u6zaVel+DPnAJHlxBGzzS4T5MfP8qW3dJKihPk9dAooOh5eVXBE6HnNrhglaR1JtzlbTZxciPRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VESBtHs3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONBuvl026562;
	Mon, 25 Nov 2024 02:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=weMK2IPGHtlB2h8VJY4ZkVIc
	0uwz1nC6r5XORnvCWRU=; b=VESBtHs3f2906F6kYTX+TPJ9MSnfXQVSNTDOjwDE
	0CEaYWCpN6vpT1m6i/dNWwq2hEj4E7ZubGF3Yh6pUf7wWYc5LxN8L55VuS+Lb+gs
	nOXImB4hIPK5RpqrB3k464ibHI3z209Jigpl+tuXItXJPEtd6LBdyoAJnWrDA0Dc
	tbXHCGtqgcnzfn4GJKDse1NpL1ZmrGqfBrgwEK0QM140ETOve2ICO1VJhxqLGGtp
	tBjVkx24XOl54+KowQtp1RSWEdhBNEGM0BHS+bc+UoOcfMEYomkM1Cf+81qfc+vJ
	j/v/ujoIXT+kbTwgO3ghmjuwtgfI+FJXAGqsXCyXHfG5fg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4338b8b174-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 02:20:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP2KCo7020522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 02:20:12 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 18:20:07 -0800
Date: Mon, 25 Nov 2024 10:20:00 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_zhgao@quicinc.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Z0Pe0B9LsjpRHkkS@cse-cd02-lnx.ap.qualcomm.com>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <f9b01690-8940-4f8b-b142-6c2ec4db3e83@kernel.org>
 <Z0BDYiVaLQXaMsle@cse-cd02-lnx.ap.qualcomm.com>
 <ccbc6324-0dcb-405a-901a-12dc33a8130c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ccbc6324-0dcb-405a-901a-12dc33a8130c@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jchMbIhawoy5L2ZIk6ukDaaSae-GO7rT
X-Proofpoint-GUID: jchMbIhawoy5L2ZIk6ukDaaSae-GO7rT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250018

On Fri, Nov 22, 2024 at 01:35:28PM +0100, Krzysztof Kozlowski wrote:
> On 22/11/2024 09:40, Yuanjie Yang wrote:
> > On Fri, Nov 22, 2024 at 08:04:31AM +0100, Krzysztof Kozlowski wrote:
> >> On 22/11/2024 07:51, Yuanjie Yang wrote:
> >>> Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> >>>
> >>> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >>>  1 file changed, 198 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>> index 590beb37f441..37c6ab217c96 100644
> >>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> >>> @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> >>>  			#size-cells = <1>;
> >>>  		};
> >>>  
> >>> +		sdhc_1: mmc@7c4000 {
> >>> +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> >>> +			reg = <0x0 0x007c4000 0x0 0x1000>,
> >>> +			      <0x0 0x007c5000 0x0 0x1000>;
> >>> +			reg-names = "hc",
> >>> +				    "cqhci";
> >>> +
> >>> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> >>> +				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> >>> +			interrupt-names = "hc_irq",
> >>> +					  "pwr_irq";
> >>> +
> >>> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> >>> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> >>> +				 <&rpmhcc RPMH_CXO_CLK>,
> >>> +				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> >>> +			clock-names = "iface",
> >>> +				      "core",
> >>> +				      "xo",
> >>> +				      "ice";
> >>> +
> >>> +			resets = <&gcc GCC_SDCC1_BCR>;
> >>> +
> >>> +			power-domains = <&rpmhpd RPMHPD_CX>;
> >>> +			operating-points-v2 = <&sdhc1_opp_table>;
> >>> +			iommus = <&apps_smmu 0x02c0 0x0>;
> >>> +			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> >>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> >>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> >>> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> >>> +			interconnect-names = "sdhc-ddr",
> >>> +					     "cpu-sdhc";
> >>> +
> >>> +			bus-width = <8>;
> >>> +			qcom,dll-config = <0x000f642c>;
> >>> +			qcom,ddr-config = <0x80040868>;
> >>> +			supports-cqe;
> >>> +			dma-coherent;
> >>> +			mmc-ddr-1_8v;
> >>> +			mmc-hs200-1_8v;
> >>> +			mmc-hs400-1_8v;
> >>> +			mmc-hs400-enhanced-strobe;
> >>
> >> These are properties of memory, not SoC. If the node is disabled, means
> >> memory is not attached to the SoC, right?
> >>
> >>> +			status = "disabled";
> > Thanks, I think qcom,dll-config and qcom,ddr-config are properties of Soc,
> > they are memory configurations that need to be written to the ioaddr.
> > And mmc-ddr-1_8v,mmc-hs200-1_8v,mmc-hs400-1_8v are bus speed config,
> > they indicate the bus speed at which the host contoller can operate.
> > If the node is disabled, which means Soc don't support these properties.
> No, that is not the meaning of node is disabled. When node is disabled,
> it means board does not have attached memory.
> 
> Move the memory related properties  to the board.

Thanks, Ok I understand, I will move the memory related
properties(qcom,dll-config and qcom,ddr-config) to the
board dts in next version.

> Best regards,
> Krzysztof

Thanks,
Yuanjie

