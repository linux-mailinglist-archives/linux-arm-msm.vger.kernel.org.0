Return-Path: <linux-arm-msm+bounces-51693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC0A66F29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1FA19A17E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD83D2054F7;
	Tue, 18 Mar 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QgpjOeyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6285F205E1C;
	Tue, 18 Mar 2025 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288265; cv=none; b=s1bNFekWyGs1nxOvpA4qs4NuRFdxODndb513/Ndb+E9PZSxxguUcelPYREJqt5Hh9cDq1FLA1MbdTdgMJWzh2pgK23o19AtTfYQCUOG9rmLPuhWJQfgprYoWlmvSGQ5IGLXJ+FaAAIWNBjvExj9XSmslBIlGdu34aFZzbBEWxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288265; c=relaxed/simple;
	bh=2f1C8R0hIz6n+6W0nH3Z+GVlBTjFR1v8fu0TPpXUMTQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfqwuszN9ZmFnNPVIXrkpvxk6togrsjIY/a+uXd6QrpfYpW7PeLkmyQOtlcK0aQq5tAG1LYGhMj3XQe8eMdXueejVa+tCaMYVPncn7tCW0ri9H6FsKroNEtMYd/UVQZPt/gnfpo6Yx+FIaJxPCuRsVzAGjVxxS4a4yakiI2vfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QgpjOeyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I191si027058;
	Tue, 18 Mar 2025 08:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lzyz/arj6w1l3DX59ZpBFxii
	X+gCYcK7Sb4orDZoWsY=; b=QgpjOeyiKtLNxe5Hr2tbRajqpXMEE5xRciNl0AKW
	irOM8Wi/Ekrhy4lNGiFf1CXiW/CIFyonuqCCcN/7EJ79l89yQ47woup2TjHr2/8d
	341ebLG0kiAN1kwBACtPxO6V+hzJMLOjCF4KYzNSUHxVs39DIlspyaKgSsSS4apR
	pTI9vunHTlWkDxs01ocgp8v0UqRIOTzXWI+eUmK+tQ4H51Bxnt/9od4wP+kwoRxe
	dteVL8abw4ANnHWvAgwAGwCWRdMxFTCSrX8ogXTdRuAszsMgeY5TcScvQpjdM48l
	ZvsQnpbjcqSWvBmePOsv8t219WZGTaH1/q7G0709wUU7gQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwth4w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 08:57:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I8vIkw013115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 08:57:18 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 01:57:14 -0700
Date: Tue, 18 Mar 2025 14:27:10 +0530
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: add QCrypto nodes
Message-ID: <20250318085710.zna6wbawbhb7kf44@hu-arakshit-hyd.qualcomm.com>
References: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
 <20250224-enable-qce-for-qcs615-v1-2-e7c665347eef@quicinc.com>
 <ac161039-af36-4e6c-90ea-ef858ea31e86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ac161039-af36-4e6c-90ea-ef858ea31e86@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 81D6mkMdXjmJwurUdxsoO0UK4yiQJS4a
X-Proofpoint-ORIG-GUID: 81D6mkMdXjmJwurUdxsoO0UK4yiQJS4a
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d9357d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=j5hbVoT8eKfuacexB9YA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=553
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180064

On Tue, Feb 25, 2025 at 02:52:36PM +0100, Konrad Dybcio wrote:
> On 24.02.2025 11:04 AM, Abhinaba Rakshit wrote:
> > Add the QCE and Crypto BAM DMA nodes.
> > 
> > Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > index f4abfad474ea62dea13d05eb874530947e1e8d3e..25e98d20ec1d941f0b45cc3d94f298065c9a5566 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > @@ -1114,6 +1114,31 @@ ufs_mem_phy: phy@1d87000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		cryptobam: dma-controller@1dc4000 {
> > +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> > +			reg = <0x0 0x01dc4000 0x0 0x24000>;
> > +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> > +			#dma-cells = <1>;
> > +			qcom,ee = <0>;
> > +			qcom,controlled-remotely;
> > +			num-channels = <16>;
> > +			qcom,num-ees = <4>;
> > +			iommus = <&apps_smmu 0x0104 0x0011>,
> > +				 <&apps_smmu 0x0114 0x0011>;
> 
> (0x0114 & ~ 0x0011) == (0x0104 & ~0x0011), try dropping the second entry
> here and below and see if things still work
> 

With dropping the second entry, as well qcrypto is still functional,
Will update in the patch v2

> > +		};
> > +
> > +		crypto: crypto@1dfa000 {
> > +			compatible = "qcom,qcs615-qce", "qcom,sm8150-qce", "qcom,qce";
> > +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> > +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> > +			dma-names = "rx", "tx";
> > +			iommus = <&apps_smmu 0x0104 0x0011>,
> > +				 <&apps_smmu 0x0114 0x0011>;
> > +			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> > +					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> 
> Please align the '&'s

Will update in patch v2

> 
> Konrad

