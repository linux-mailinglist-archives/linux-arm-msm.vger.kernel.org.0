Return-Path: <linux-arm-msm+bounces-71144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB1B3A373
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 17:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC16816C5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 15:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1797E3203BA;
	Thu, 28 Aug 2025 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aDvQ/oQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F431E110;
	Thu, 28 Aug 2025 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393053; cv=none; b=gETfkn8GFZFpqkvOh/7OjnIzMIXD9FBEMV4bcy6oOzbSlrCSrCJReLQCPVLj/uIyYq98kGb+969pdOmmg8/E4pcamUpjxjlOZeuyc3OGcUST0CROhGaypqcgLieNQ9nSxd/StU3Rlslq5epPNkFrQgLkvstU0QZF2NDKQEEoERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393053; c=relaxed/simple;
	bh=7R2T4hqg/FIoP9ne8ukdUQOjDO2+JnnYnRF5QFNIM0E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5AeVga12gDhHHEMqISNpc3vVpxB4ibPiJr67LwJFt2tN18/6AAgarDOtl/GAu5wKcyGvyXllhCG9An6f1jPscb0O7hAVgigjQLDC01rsFM/IMgqKSBf/AUN0N9KgFHuZxKiJndvEzHZ55B8Cx5xTnls7gd7qs/nimvA54hWyro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aDvQ/oQe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEkc0L029081;
	Thu, 28 Aug 2025 14:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F+dzBj38qMwidVY148Ub3IGG
	7iu4eOWGkjFcX+//Rmg=; b=aDvQ/oQe1Vpv8ZS+Xgl8Klyve3oXVjmqTRtFDCDR
	sDZqYvQP1A0Qf83LsyjdRKUUX9oxeBfxg+OnYBPIg5l5Bv4Z21m6eBtEw+c3G3Rm
	VZwc0r6yOVW0dcf16sI16Wor6Rv/VcB/i6rZiIrWyKUhrH47Y2spCRo/ARpWaBQ2
	TMvxjBxE/0NwiSD+MFz/x83/zjMgrssWcfhw6+OI6cSiSVXLNbbX1eZzRCqzk6jO
	VVDXvzBJY6CEsdCKOXmSYxtXSDqlyohYvDBuX+eE/yiPrEey2lLlA49lawJYAhps
	VNCLWo0nZrQE1LbrqQ3ZVCSAmQXRA0KClqqdC+W95gMXBA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umgr7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:57:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SEvQKZ013741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 14:57:26 GMT
Received: from hu-mchunara-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 07:57:22 -0700
Date: Thu, 28 Aug 2025 20:27:18 +0530
From: Monish Chunara <quic_mchunara@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Richard
 Cochran" <richardcochran@gmail.com>,
        <kernel@oss.qualcomm.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: lemans: Add SDHC controller and
 SDC pin configuration
Message-ID: <aLBuTvgKknaAINx9@hu-mchunara-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
 <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <rxd4js6hb5ccejge2i2fp2syqlzdghqs75hb5ufqrhvpwubjyz@zwumzc7wphjx>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b06e57 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lhZC9SOiX4wXll4ciBUA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX7pe+JznnpXVr
 QhhnFqgvImiOdeUzmtbA7coV87Zc2IbyccV06dtQk22h8I94EsiJidg9c3ercxYmH+QeWeZfDyW
 T/dUhXN5EVmXCmtZH8K8r4BgC+Op3a7Z5ZTd7HDBZdnX3WM3KIKqVZ6JpMpVEw1WkTx/neeVPLi
 VyoFDE8x9CK/V31ResawpIkVoWaZoe46h3R/iZnZEzROauxAmQxwOd3ceL335NhM+U1lEymVSxJ
 yFjxQAqk//VVRupV7dWU3TxepN+4x/Pz82abvym+gIw0JWJi8vKJvfwiGMSosLXndYslaj1XxaE
 G1P+CkL7wnXF5E6SRTkw7/te+HW+s2xPJ6KmeGk3PX94nnU2nfql1oE//uNd7efjlvlEdvuFZnH
 Cc5k0eYT
X-Proofpoint-GUID: ZxAqpAz-Luid5KwGkY8Oihb7WNu1V4kH
X-Proofpoint-ORIG-GUID: ZxAqpAz-Luid5KwGkY8Oihb7WNu1V4kH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Wed, Aug 27, 2025 at 04:20:20AM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 11:51:01PM +0530, Wasim Nazir wrote:
> > From: Monish Chunara <quic_mchunara@quicinc.com>
> > 
> > Introduce the SDHC v5 controller node for the Lemans platform.
> > This controller supports either eMMC or SD-card, but only one
> > can be active at a time. SD-card is the preferred configuration
> > on Lemans targets, so describe this controller.
> > 
> > Define the SDC interface pins including clk, cmd, and data lines
> > to enable proper communication with the SDHC controller.
> > 
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > index 99a566b42ef2..a5a3cdba47f3 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> > @@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
> >  			};
> >  		};
> >  
> > +		sdhc: mmc@87c4000 {
> > +			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x087c4000 0x0 0x1000>;
> > +
> > +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq", "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > +				 <&gcc GCC_SDCC1_APPS_CLK>;
> > +			clock-names = "iface", "core";
> > +
> > +			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
> > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
> > +			interconnect-names = "sdhc-ddr", "cpu-sdhc";
> > +
> > +			iommus = <&apps_smmu 0x0 0x0>;
> > +			dma-coherent;
> > +
> > +			resets = <&gcc GCC_SDCC1_BCR>;
> > +
> > +			no-sdio;
> > +			no-mmc;
> > +			bus-width = <4>;
> 
> This is the board configuration, it should be defined in the EVK DTS.

ACK.

> 
> > +			qcom,dll-config = <0x0007642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +
> > +			status = "disabled";
> > +		};

Regards,
Monish

