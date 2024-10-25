Return-Path: <linux-arm-msm+bounces-35765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E59AF7C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74155282FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B946518A937;
	Fri, 25 Oct 2024 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MJAGflzy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B3136326;
	Fri, 25 Oct 2024 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729825208; cv=none; b=GzS4PcPpuigYS+VsFPY6r5m1WGQCkf24n/8xnn5I5h/On7qF7sRw9v+m/9FTBq6Jsq7258S/CacqhS9umIBMkCQ2M94knO1d7t2ZFThfUynJ3aXPwhkpaN0FQq2NhODhGVNJXAfwM8sOLnySaQb6oPS/Vqc2/w9NpGz5oWk8fN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729825208; c=relaxed/simple;
	bh=AS8e/Nl5pwNV3BaA5zEKM1+4fcoc/cezX1VPg5Fbmok=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/vy3JnBMYAVC7yUP4+iIpWyVP18Y2XKODJ1qD+ZlzDVVuBZmH6g+OhYbz38xlHZCJYVx6n7EpBKtK1weNijRq5bdpWoAjb2V6YNhXuYxkDi8VRmVLRbKtvaEgmxPni0yH3JM3Kfg9tR0PcqR0RlrvNujg8GXZc/NUwmlDfqyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MJAGflzy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKcuqE029449;
	Fri, 25 Oct 2024 03:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zTvjHGQmHShqHVodkQLupmPJ
	uXE9pqqtxdqU5dalTG4=; b=MJAGflzyGDszkDswVZr37BuabSLQAZ77YWxDbOEM
	yV86uDyq8riqi0l0NjHFBpkpi6KJNGV2D3SB9FfD3dsgCTOPJMp7h77R+FHXkX0y
	qhI1UdtQqFKXP0AmcC+bmcjP5E470MiWSmpGdIvwMJPo+4XT5ZhDlwtmIfkegg69
	3kjeeLyfV+yTqSFatDZhsvPzTxmZLSC+ht8D4aagygOeCrYOUk0nuYCx+M1SfN8U
	Iw7n/RuO6PVQ5Tzd2TiLRWPatSNP93iwe/4EqZjQQSq79METY0a98LplsrHxiQyQ
	yj/wPtpLC64D5V6nQ4wZF10gQ5B8wONslHd3AuP35ry3PA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w7k3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:00:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P301iM007877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:00:01 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 19:59:56 -0700
Date: Fri, 25 Oct 2024 10:59:51 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: qcs615: add SD and emmc node
Message-ID: <ZxsJp6XtJSfnNJqH@cse-cd02-lnx.ap.qualcomm.com>
References: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
 <20241023092708.604195-3-quic_yuanjiey@quicinc.com>
 <xfy335jzh5t5a7fdrjfswerjdze3vaybf7rvkxnae3cv3xaii7@rn7iqwga2p62>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xfy335jzh5t5a7fdrjfswerjdze3vaybf7rvkxnae3cv3xaii7@rn7iqwga2p62>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3Xq7Z9kwTsThphRfzQvyR6Q6ZJjx7eBy
X-Proofpoint-GUID: 3Xq7Z9kwTsThphRfzQvyR6Q6ZJjx7eBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250021

On Thu, Oct 24, 2024 at 11:42:26PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 23, 2024 at 05:27:07PM +0800, Yuanjie Yang wrote:
> > Add SD and emmc support to the QCS615 Ride platform. The SD controller
> > and emmc controller of QCS615 are derived from SM6115. Include the
> > relevant binding documents accordingly. Additionally, configure
> > emmc-related and SD-related opp, power, and interconnect settings
> > in the device tree.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > index fcba83fca7cf..3840edf13fe8 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> >  			#size-cells = <1>;
> >  		};
> >  
> > +		sdhc_1: mmc@7c4000 {
> > +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0 0x7c4000 0 0x1000>,
> > +			      <0 0x7c5000 0 0x1000>;
> 
>  <0x0 0x007c4000 0x0 0x1000> (this applies to all address nodes, so
>  sdhc_2 too.
Thanks, in the next version, I will adjust all the values in the reg to hexadecimal.

> 
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
> Are these board properties or SoC properties?
Thanks, these properties are Soc properties, so I put them in dtsi.

> > +			status = "disabled";
> > +
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

