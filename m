Return-Path: <linux-arm-msm+bounces-43915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C632BA00E22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 921CB163FED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF2C1FAC55;
	Fri,  3 Jan 2025 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bix3DSTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C21B983E;
	Fri,  3 Jan 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930771; cv=none; b=FLjMH/jWbHYTAkXJX130Lz32bbNuzdo04kiqcnrXj3B3EKqKNWRA+Kegnu9znBmnW69aH7uOzvXEKxcB1G4HT8LL/gKdYuwA8AL0bfiavzIA/FRUqTPwdZEr6N1rGpm7O2aimmQVmR2mV0FEgjiSHYfX4GVUz2Y5ccgJOc4sEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930771; c=relaxed/simple;
	bh=hAng8NWuOWivqottZ7fXYtagj8wIGpUHK40EjCiOVns=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JB6QLuEd+7V4QcO9ahvKnIVp04/YL3bJqBXSqWtGGENvlB5L9MeVmUazpgmAlpVfK9sNvpSnIF4df/qk3xNFrxXj0sWF8BpE1QuKVkmH6Rk0x4lBdiIbATwir0n3/O4e9dtVRa9n0/hZW9xutnKI/bMgwSZiXZ8AOEXWzhYvW58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bix3DSTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503C4Y4x022458;
	Fri, 3 Jan 2025 18:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rEowyQot/JNKoGQzdXBR0sON
	mMFLbf04NYOADbA4TqI=; b=Bix3DSTfoOxBp7/Av9NFmagy/RmCXilCm2Ch9t8w
	CrDXxgSqFsFfM0ggX20T/S48pujHbJeNnfhcm3sisxR0NGMorBQnn1VoZO7sgtey
	tR0+rGmsB2PYjBQ3hfJSlX4SA5BJetBTjAuxCL8GZgOFuXhXmX/u3zDgAt1eS4Vq
	wA51RSb8ypJeYxuKpB3HCEhjUyrR83TDN9RRNQGfDLezw2tyDDyVl8dRC8DK7Ucc
	Ov2izhYKtPYOmrpxtry/FvKIDjzMGtr5Yp1Z/K5L8W5Bd4l8jvUEB1e0/4vIdmX0
	eN0QDRoR9Ah63ubv97yYnPDNOEJf8fNh632kevYgh2gRwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfk3gqw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:59:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503IxOYG011239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 18:59:24 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 3 Jan 2025 10:59:16 -0800
Date: Sat, 4 Jan 2025 00:29:07 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
 <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -LH2_WA6MmDvF5OVkjKXD5bkNRZkf7XP
X-Proofpoint-ORIG-GUID: -LH2_WA6MmDvF5OVkjKXD5bkNRZkf7XP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030167

On Fri, Jan 03, 2025 at 12:31:55PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 03, 2025 at 12:37:50PM +0530, Wasim Nazir wrote:
> > On Fri, Jan 03, 2025 at 07:50:43AM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Jan 02, 2025 at 02:37:39PM +0530, Wasim Nazir wrote:
> > > > On Mon, Dec 30, 2024 at 05:45:39PM +0200, Dmitry Baryshkov wrote:
> > > > > On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> > > > > > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > > > > > 
> > > > > > QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> > > > > > subsystem which is available in QCS9100, and it affects thermal
> > > > > > management.
> > > > > > 
> > > > > > Also, between ride and ride-r3 ethernet phy is different.
> > > > > > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> > > > > 
> > > > > Your board files duplicate sa8775p-ride-r3.dts and sa8775p-ride.dts, but
> > > > > include them. Existing qcs9100-ride-r3.dts and qcs9100-ride-r3.dts just
> > > > > include corresponding SA8775P files.
> > > > > 
> > > > > This is not ideal for the following reasons:
> > > > > - The approach is not uniform (between QCS9100 and QCS9075), which might
> > > > >   lead to mistakes.
> > > > > - The approach ends up duplicating DT code unnecessarily, which can lead
> > > > >   to issues being patches in the one board file, but not in the other
> > > > >   file.
> > > > > 
> > > > > If there are any reasons why you want to follow this approach, they must
> > > > > be a part of the commit message.
> > > > > 
> > > > 
> > > > Hi Dmitry,
> > > > 
> > > > Initially, we included the DTS [1] file to avoid duplication. However,
> > > > based on Krzysztof's previous suggestion [2], we change to this format.
> > > > 
> > > > Please let us know how to proceed further on this.
> > > 
> > > Krzysztof asked you to include DTSI files instead of including DTS
> > > files. Hope this helps.
> > 
> > Are you suggesting that we should also modify the 9100-ride files to
> > include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
> > However, this would result in the duplication of Ethernet nodes in all
> > the ride board files. Would that be acceptable?
> 
> git mv foo.dts foo.dtsi
> echo '#include "foo.dtsi"' > foo.dts
> git add foo.dts
> git commit
> 

We cannot convert sa8775p-ride-r3.dts and sa8775p-ride.dts to .dtsi as
they represent different platforms. In patch [1], we included these DTS
files to reuse the common hardware nodes.

Could you please advise on how we should proceed with the following
approaches?

a) Previous approach [1]:
Include sa8775p-ride-r3.dts and sa8775p-ride.dts in the qcs9075-ride
platform DTS, similar to the qcs9100-ride platform DTS. This approach
avoids duplicating Ethernet nodes and maintains uniformity. However, it
involves including the DTS file directly.

b) Current suggestion:
Include sa8775p-ride.dtsi in the qcs9075-ride platform DTS and also
modify the qcs9100-ride platform DTS files to maintain uniformity. This
approach results in duplicating Ethernet nodes.

Please let us know your recommendation to finalize the DT structure.

[1] https://lore.kernel.org/all/20241119174954.1219002-6-quic_wasimn@quicinc.com/

> > 
> > > 
> > > > 
> > > > [1] https://lore.kernel.org/all/20241119174954.1219002-6-quic_wasimn@quicinc.com/
> > > > [2] https://lore.kernel.org/all/8cf9edc0-a0cb-4fd0-b10e-2138784dfba3@kernel.org/
> > > > 
> > > > > > 
> > > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/Makefile            |  2 +
> > > > > >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
> > > > > >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
> > > > > >  3 files changed, 94 insertions(+)
> > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > > > index 78613a1bd34a..41cb2bbd3472 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > > @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > > > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > > > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > > > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > > > new file mode 100644
> > > > > > index 000000000000..d9a8956d3a76
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > > > @@ -0,0 +1,46 @@
> > > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > > +/*
> > > > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > + */
> > > > > > +/dts-v1/;
> > > > > > +
> > > > > > +#include "sa8775p-ride.dtsi"
> > > > > > +
> > > > > > +/ {
> > > > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > > > > > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > > > > > +};
> > > > > > +
> > > > > > +&ethernet0 {
> > > > > > +	phy-mode = "2500base-x";
> > > > > > +};
> > > > > > +
> > > > > > +&ethernet1 {
> > > > > > +	phy-mode = "2500base-x";
> > > > > > +};
> > > > > > +
> > > > > > +&mdio {
> > > > > > +	compatible = "snps,dwmac-mdio";
> > > > > > +	#address-cells = <1>;
> > > > > > +	#size-cells = <0>;
> > > > > > +
> > > > > > +	sgmii_phy0: phy@8 {
> > > > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > > > +		reg = <0x8>;
> > > > > > +		device_type = "ethernet-phy";
> > > > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > > > +		reset-assert-us = <11000>;
> > > > > > +		reset-deassert-us = <70000>;
> > > > > > +	};
> > > > > > +
> > > > > > +	sgmii_phy1: phy@0 {
> > > > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > > > +		reg = <0x0>;
> > > > > > +		device_type = "ethernet-phy";
> > > > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > > > +		reset-assert-us = <11000>;
> > > > > > +		reset-deassert-us = <70000>;
> > > > > > +	};
> > > > > > +};
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > > new file mode 100644
> > > > > > index 000000000000..3b524359a72d
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > > > @@ -0,0 +1,46 @@
> > > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > > +/*
> > > > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > + */
> > > > > > +/dts-v1/;
> > > > > > +
> > > > > > +#include "sa8775p-ride.dtsi"
> > > > > > +
> > > > > > +/ {
> > > > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > > > > > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> > > > > > +};
> > > > > > +
> > > > > > +&ethernet0 {
> > > > > > +	phy-mode = "sgmii";
> > > > > > +};
> > > > > > +
> > > > > > +&ethernet1 {
> > > > > > +	phy-mode = "sgmii";
> > > > > > +};
> > > > > > +
> > > > > > +&mdio {
> > > > > > +	compatible = "snps,dwmac-mdio";
> > > > > > +	#address-cells = <1>;
> > > > > > +	#size-cells = <0>;
> > > > > > +
> > > > > > +	sgmii_phy0: phy@8 {
> > > > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > > > +		reg = <0x8>;
> > > > > > +		device_type = "ethernet-phy";
> > > > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > > > +		reset-assert-us = <11000>;
> > > > > > +		reset-deassert-us = <70000>;
> > > > > > +	};
> > > > > > +
> > > > > > +	sgmii_phy1: phy@a {
> > > > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > > > +		reg = <0xa>;
> > > > > > +		device_type = "ethernet-phy";
> > > > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > > > +		reset-assert-us = <11000>;
> > > > > > +		reset-deassert-us = <70000>;
> > > > > > +	};
> > > > > > +};
> > > > > > --
> > > > > > 2.47.0
> > > > > > 
> > > > > 
> > > > > -- 
> > > > > With best wishes
> > > > > Dmitry
> > > > 
> > > > 
> > > > Thanks & Regards,
> > > > Wasim
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > 
> > Thanks & Regards,
> > Wasim
> 
> -- 
> With best wishes
> Dmitry

Thanks & Regards,
Wasim

