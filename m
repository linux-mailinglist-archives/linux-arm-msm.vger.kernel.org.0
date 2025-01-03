Return-Path: <linux-arm-msm+bounces-43830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D91A004C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 08:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0E8F3A391A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B41BEF7E;
	Fri,  3 Jan 2025 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gHyXPj9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D2C191F94;
	Fri,  3 Jan 2025 07:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735888094; cv=none; b=jWwxrBXcrdoC7irCfDO/j3dG0Q10r/+QehBMzFZLntIPwERiyqqjV+EAGYFUfHVGa2jT1x2ivMXrY4EqTgNfUh0HVzE4VDTJLBk9fTlYw6lBz0FlAtlkW5CRLHVsjZUO3fZ6STlYXBdkWGlEjJAvvXXs5m5Zlb3yqnMAIYOT4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735888094; c=relaxed/simple;
	bh=kbFlEPJF8cAR7F5UBVzj5jJUqzEu2t1mk/qlc1+ZEqg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdxCD0T0h0NrFIzhC/Yrldo5wcfv5FBIfw0BKvvbuvLXklfs5v22yRqRlWIthIq5qXCnI+WXZZfzvGnqecMwBOoTWyHQwEuzFdpCUi2gB1aOy10SPD2yadReIERPo1OLgalVM/eYpmwUtJULzmsAeUDJFvTRNJSylaRkC5XvMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gHyXPj9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50376kRG000354;
	Fri, 3 Jan 2025 07:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zca4XGvTKVBHHYTmSImRaSIC
	Ock1Ii0P5VF2/T4dixs=; b=gHyXPj9OMVQm4QLiiNIY5s0te3HVed1gI/w7Gn9j
	14wPTgODutVOEuBwRZa0u4D2710M+N2tbuNdXSJh1zVDwmqK+M1MUq416WGexurY
	OOqyp6qiTMbFdoNs1LlVFkHGVX8kB+f4ojXoYftFe+cHei4k+XGBhePEk8XH0y3a
	v0tKB+xgl+ADFBws7ZW3dMc9r6rfhcHh7Y9/+YT33mqzuyKoEJpkuT1a9SWKmsff
	ddHTKHCCMa/CzJnwAtLVbACUX1OnvgbrG5wU2L4eAXSiNNYTSvqQ1inFT7vPG73W
	ptAFxlQaYyKAIxon1ClfAcK3cZm1hhLMTWPYzeS7Di91uQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xb70004g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 07:08:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503786US027467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 07:08:06 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 23:07:59 -0800
Date: Fri, 3 Jan 2025 12:37:50 +0530
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
Message-ID: <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <tjrg5zqggupjo36udpyv3vynsij76f4qlus6lkbqotuimusqgq@hosmksp77sif>
 <Z3ZXWxoBtMNPJ9kk@hu-wasimn-hyd.qualcomm.com>
 <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eqPfvJpAg9XeXMGjFumS5isxObj3A3eE
X-Proofpoint-GUID: eqPfvJpAg9XeXMGjFumS5isxObj3A3eE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030060

On Fri, Jan 03, 2025 at 07:50:43AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 02, 2025 at 02:37:39PM +0530, Wasim Nazir wrote:
> > On Mon, Dec 30, 2024 at 05:45:39PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> > > > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > > > 
> > > > QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> > > > subsystem which is available in QCS9100, and it affects thermal
> > > > management.
> > > > 
> > > > Also, between ride and ride-r3 ethernet phy is different.
> > > > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> > > 
> > > Your board files duplicate sa8775p-ride-r3.dts and sa8775p-ride.dts, but
> > > include them. Existing qcs9100-ride-r3.dts and qcs9100-ride-r3.dts just
> > > include corresponding SA8775P files.
> > > 
> > > This is not ideal for the following reasons:
> > > - The approach is not uniform (between QCS9100 and QCS9075), which might
> > >   lead to mistakes.
> > > - The approach ends up duplicating DT code unnecessarily, which can lead
> > >   to issues being patches in the one board file, but not in the other
> > >   file.
> > > 
> > > If there are any reasons why you want to follow this approach, they must
> > > be a part of the commit message.
> > > 
> > 
> > Hi Dmitry,
> > 
> > Initially, we included the DTS [1] file to avoid duplication. However,
> > based on Krzysztof's previous suggestion [2], we change to this format.
> > 
> > Please let us know how to proceed further on this.
> 
> Krzysztof asked you to include DTSI files instead of including DTS
> files. Hope this helps.

Are you suggesting that we should also modify the 9100-ride files to
include DTSI instead of DTS for consistency between QCS9100 and QCS9075?
However, this would result in the duplication of Ethernet nodes in all
the ride board files. Would that be acceptable?

> 
> > 
> > [1] https://lore.kernel.org/all/20241119174954.1219002-6-quic_wasimn@quicinc.com/
> > [2] https://lore.kernel.org/all/8cf9edc0-a0cb-4fd0-b10e-2138784dfba3@kernel.org/
> > 
> > > > 
> > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile            |  2 +
> > > >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
> > > >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
> > > >  3 files changed, 94 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > index 78613a1bd34a..41cb2bbd3472 100644
> > > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > > > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> > > >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > new file mode 100644
> > > > index 000000000000..d9a8956d3a76
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > > > @@ -0,0 +1,46 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + */
> > > > +/dts-v1/;
> > > > +
> > > > +#include "sa8775p-ride.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > > > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > > > +};
> > > > +
> > > > +&ethernet0 {
> > > > +	phy-mode = "2500base-x";
> > > > +};
> > > > +
> > > > +&ethernet1 {
> > > > +	phy-mode = "2500base-x";
> > > > +};
> > > > +
> > > > +&mdio {
> > > > +	compatible = "snps,dwmac-mdio";
> > > > +	#address-cells = <1>;
> > > > +	#size-cells = <0>;
> > > > +
> > > > +	sgmii_phy0: phy@8 {
> > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > +		reg = <0x8>;
> > > > +		device_type = "ethernet-phy";
> > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > +		reset-assert-us = <11000>;
> > > > +		reset-deassert-us = <70000>;
> > > > +	};
> > > > +
> > > > +	sgmii_phy1: phy@0 {
> > > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > > +		reg = <0x0>;
> > > > +		device_type = "ethernet-phy";
> > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > +		reset-assert-us = <11000>;
> > > > +		reset-deassert-us = <70000>;
> > > > +	};
> > > > +};
> > > > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > new file mode 100644
> > > > index 000000000000..3b524359a72d
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > > > @@ -0,0 +1,46 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + */
> > > > +/dts-v1/;
> > > > +
> > > > +#include "sa8775p-ride.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > > > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> > > > +};
> > > > +
> > > > +&ethernet0 {
> > > > +	phy-mode = "sgmii";
> > > > +};
> > > > +
> > > > +&ethernet1 {
> > > > +	phy-mode = "sgmii";
> > > > +};
> > > > +
> > > > +&mdio {
> > > > +	compatible = "snps,dwmac-mdio";
> > > > +	#address-cells = <1>;
> > > > +	#size-cells = <0>;
> > > > +
> > > > +	sgmii_phy0: phy@8 {
> > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > +		reg = <0x8>;
> > > > +		device_type = "ethernet-phy";
> > > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > > +		reset-assert-us = <11000>;
> > > > +		reset-deassert-us = <70000>;
> > > > +	};
> > > > +
> > > > +	sgmii_phy1: phy@a {
> > > > +		compatible = "ethernet-phy-id0141.0dd4";
> > > > +		reg = <0xa>;
> > > > +		device_type = "ethernet-phy";
> > > > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > > > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > > > +		reset-assert-us = <11000>;
> > > > +		reset-deassert-us = <70000>;
> > > > +	};
> > > > +};
> > > > --
> > > > 2.47.0
> > > > 
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

