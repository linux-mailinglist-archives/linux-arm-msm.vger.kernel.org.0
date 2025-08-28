Return-Path: <linux-arm-msm+bounces-71145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D594B3A385
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 17:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2A0B3AF563
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8225253F3A;
	Thu, 28 Aug 2025 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I6lcCzoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11976225403;
	Thu, 28 Aug 2025 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393565; cv=none; b=PX/KIjR+nwIC0YLvSDvEQl1uFhRTckp4aesZNAkmFX3eeu3ff6mptkIXh9kdutFLgNuEBkGzH/c32/oEWvrrGb15/BrndQXkmb1nCd7o9r9nh59l4kxNAPt/79vNZ7Iugzpj/dXXsu2zHP++iuy/lZkTIjvI83afCLz7Nd+rplo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393565; c=relaxed/simple;
	bh=QieCTB2OhbUlJkE8rHEy8bcwtp8tKNwQnc/vFJ8K6Ec=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqD2Vbj4rriJh2kLmL5TpKRLTXAn4iU8u/al7uwg1kI9gfvAzf1u6iSFShzjSYF22CzSeSusUq632OkERZC2hvf0XJTON/jUlQIoAMHtanjLJhR5Vbg4RO9k3AwY9cV+LVX837QBts53u1vhEOYN042rSBZHGLrrQx50MCbfZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I6lcCzoS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEHAxn008289;
	Thu, 28 Aug 2025 15:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=biXblON8ETT4KHt6o4R3rVwb
	juE6EvQAQ5kHB7tyfF8=; b=I6lcCzoSX5IH+GUBZ0dxBtAOTV+96mJ2X7fFbk+I
	9+quOM54pnlasCz3jONJADzP46QcathKDg6SDAAraT6XyFi5SWjJEam4JKQi3EnG
	Nx8MFMeV8AtTEl7SLfW3AHgqbRoKvRco+0tP4ciovSSoZ468e0p38PhBdOx91cQV
	4IgoJT4drq7Fk/PHx9GqyhFVi7G4ziAlufelocq7hWfeUxo2Rc4AP93/MJRhHEFw
	XAC/x+HhiKKwh6hUgIqea5VR6cGkxEGOIoVnHs+1qTGtm5aSPBd/b1ZVOCzibXrc
	I97aEHuGlyy3Uccf1kcBwZoRS+Krr2+MxOKbtkOgyOlRew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8apvr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:05:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SF5vXp006115
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 15:05:57 GMT
Received: from hu-mchunara-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 28 Aug 2025 08:05:51 -0700
Date: Thu, 28 Aug 2025 20:35:47 +0530
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
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Nirmesh Kumar Singh
	<quic_nkumarsi@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar
	<quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vishal Kumar Pal <quic_vispal@quicinc.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
Message-ID: <aLBwS6HgYVsIPndP@hu-mchunara-hyd.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b07056 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=V4FsjfOxsU99ilCI8qUA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfXwYOXlmrtilfJ
 4Y0UXfU5MCmn0fpEc5xeXLF0x9bYPGydmb+I6Gzr7AHqvD3FhKcN4BOe/DNxOhWlu4BZbSdPkBG
 6eWdPngVShly1HzWha1khqjY6v8mVKPF/1V7EYOJ2WqJ7Z5fxlqF6QgTgMwIE2Tcpx/H39o/bqp
 G/+YToAlP9F/eZWkvE78xcmjsRIE4eBJS5tcrZlbAZ9hpHgHrJDN//n9MVFWZueBUnal1bGMWdy
 vI/b3Zs/cyGarRYncpIy7g0byvlgt6R84/Pwq6zL7gua+zg9K0BQG7xk86s3tuzTHL1+qgAPWs6
 1oEtGZK2UcJq05lkSvw+iYXkILpgdfCXvGEkZexo+CXIMHTzsbXi9n4pXFDP3e9hU6z9UvcZRAq
 My9mPhUE
X-Proofpoint-GUID: d2_0MgMrCmlOsK91PDoM1IzMTQCPVIar
X-Proofpoint-ORIG-GUID: d2_0MgMrCmlOsK91PDoM1IzMTQCPVIar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

On Wed, Aug 27, 2025 at 04:35:59AM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
> > Enhance the Qualcomm Lemans EVK board file to support essential
> > peripherals and improve overall hardware capabilities, as
> > outlined below:
> >   - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
> >     controllers to facilitate DMA and peripheral communication.
> >   - Add support for PCIe-0/1, including required regulators and PHYs,
> >     to enable high-speed external device connectivity.
> >   - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> >     GPIO lines for extended I/O functionality.
> >   - Enable the USB0 controller in device mode to support USB peripheral
> >     operations.
> >   - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
> >     Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> >     firmware.
> >   - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
> >     and other consumers.
> >   - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
> >     Ethernet MAC address via nvmem for network configuration.
> >     It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
> >   - Add support for the Iris video decoder, including the required
> >     firmware, to enable video decoding capabilities.
> >   - Enable SD-card slot on SDHC.
> > 
> > Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> > Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
> > Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> > Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
> >  1 file changed, 387 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index 9e415012140b..642b66c4ad1e 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -16,7 +16,10 @@ / {
> >  	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
> >  
> >  	aliases {
> > +		ethernet0 = &ethernet0;
> > +		mmc1 = &sdhc;
> >  		serial0 = &uart10;
> > +		serial1 = &uart17;
> >  	};
> >  
> >  	chosen {
> > @@ -46,6 +49,30 @@ edp1_connector_in: endpoint {
> >  			};
> >  		};
> >  	};
> > +
> > +	vmmc_sdc: regulator-vmmc-sdc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vmmc_sdc";
> 
> Non-switchable, always enabled?

According to the hardware schematic, the VMMC supply to the SD card is connected
to an always-on rail. Therefore, it remains continuously enabled and cannot be
turned off via software.

> 
> > +
> > +		regulator-min-microvolt = <2950000>;
> > +		regulator-max-microvolt = <2950000>;
> > +	};
> > +
> > +	vreg_sdc: regulator-vreg-sdc {
> > +		compatible = "regulator-gpio";
> > +
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2950000>;
> > +		regulator-name = "vreg_sdc";
> > +		regulator-type = "voltage";
> 
> This one also can not be disabled?

This is a voltage translator regulator for the SD Card IO lines (vqmmc), so it
can be at either of the 2 mentioned voltage levels : 1.8 V or 2.95 V, and cannot
be disabled.

> 
> > +
> > +		startup-delay-us = <100>;
> > +
> > +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
> > +
> > +		states = <1800000 0x1
> > +			  2950000 0x0>;
> > +	};
> >  };
> >  

Regards,
Monish

