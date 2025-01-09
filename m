Return-Path: <linux-arm-msm+bounces-44585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88AA077CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D925D3AA6AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6727E21882C;
	Thu,  9 Jan 2025 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cvB7scn1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3043217725;
	Thu,  9 Jan 2025 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429835; cv=none; b=OduRB6+1VINnprWac6L2Wc6KlBooLSB+6L9wFzdOucRoAH+lnL8ZzwXkHt1tZfQP0O7fKdIbSAXOcLdLjtnlfYm3/8ZHVtABK1qjIvKU/wkXJnxL5asT4DVZPse/wvns0qg4n41XgkhAQphhXg/vxn03y697rubRPYxrId6FjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429835; c=relaxed/simple;
	bh=uplEIuV3khfko+TZUPh8Vq/aTexmyB6ntdi/NdevVTw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB4OZU9og2WumfAvWxxefZPzH8a8LQtPc6F9wtF7lkBy1dtPw3gibNLn4MSEQptuWvRSrs1Kq8gQGtfZgaNktq7c3qz4LKWEZhOx7lq27pzUDgMzJj3Hjb3APk3CfAwKndH4D6I7A+RjT1Ow/vqy5iCjedKm99x88DabacJKZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cvB7scn1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5099NaEL007951;
	Thu, 9 Jan 2025 13:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrDyz3xuuE+suy5cpur/G7oA
	yy5vqLw8Cw3ZjLqRDIc=; b=cvB7scn1n80+dx6Bv97Ry+2H8qx/f4/37GCRp2N8
	PM2xRoLsRSXL0Cj0IyqxUysIECPV2gI6WN6CyDdn47/mbGDM4fRagAh1622luM2r
	l2AnV8u2R7YQk/h/xIvekaazzmCoYn7nUwpvQtC3MyBzCH/FOL+zDGCKbG6ngx8X
	RBJY4INGtWBfdz+yOX2FxSYkfOXfUDxQqCRNmtZmdabHGx8SRBGPKMisM+xu8OJx
	b7jhP4ffqbjB5igdTf2cAz/W/jVnIKYjkrWH/uPQnOEBnKR2tvVCd0Ngi/teB4YA
	b0vwHkNzSqQIVYgLuQptzV/vcQXyBI8Wb5CEpEykbfH1xA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442bsm8jw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:37:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509Db8oW002112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 13:37:08 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 05:37:01 -0800
Date: Thu, 9 Jan 2025 19:06:53 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z3/Q9SdpjrO4zS59@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <44tjbxjrigbfu4dfrlbvdprablyhf3i5u4fvg3iwucfvmvljqv@t43py5mb4rg3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <44tjbxjrigbfu4dfrlbvdprablyhf3i5u4fvg3iwucfvmvljqv@t43py5mb4rg3>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kMUdYNEfErYuff4I370RGf5BOYEZ5Hzc
X-Proofpoint-GUID: kMUdYNEfErYuff4I370RGf5BOYEZ5Hzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090109

On Mon, Jan 06, 2025 at 05:59:01PM -0600, Bjorn Andersson wrote:
> On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > 
> > QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> > subsystem which is available in QCS9100, and it affects thermal
> > management.
> > 
> > Also, between ride and ride-r3 ethernet phy is different.
> > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> > 
> 
> This commit message is written under the assumption that the reader
> first reads the patch, to determine what QCS9075 subtracts features
> from.
> 
> Please describe what the QCS9075 Ride and Ride R3 are, if it's just a
> variant of QCS9100 without SAIL, write that - and if that is all the
> difference, then Dmitry's request makes total sense.
> 

9075 is not derived from 9100 but from 8775, though difference between
9075 & 9100 is only SAIL. And in commit message I have tried to add
details to differentiate between 9075 & 9100 and most importantly to
highlight why we need sperate DT for 9075.
Will add more details in commit message instead of adding it in
cover-letter.

Also, I am convinced to proceed with Dmitry's approach to structure the
DT.

> 
> Also, subject prefix doesn't match upstream style. Prefix with the
> subsystem/platform/device and avoid "for XYZ". See "git log" on a few
> of the other files to see how it should look like.

Sure will change this accordingly.

> 
> Thanks,
> Bjorn
> 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile            |  2 +
> >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
> >  3 files changed, 94 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 78613a1bd34a..41cb2bbd3472 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > new file mode 100644
> > index 000000000000..d9a8956d3a76
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +
> > +#include "sa8775p-ride.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > +};
> > +
> > +&ethernet0 {
> > +	phy-mode = "2500base-x";
> > +};
> > +
> > +&ethernet1 {
> > +	phy-mode = "2500base-x";
> > +};
> > +
> > +&mdio {
> > +	compatible = "snps,dwmac-mdio";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	sgmii_phy0: phy@8 {
> > +		compatible = "ethernet-phy-id31c3.1c33";
> > +		reg = <0x8>;
> > +		device_type = "ethernet-phy";
> > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <11000>;
> > +		reset-deassert-us = <70000>;
> > +	};
> > +
> > +	sgmii_phy1: phy@0 {
> > +		compatible = "ethernet-phy-id31c3.1c33";
> > +		reg = <0x0>;
> > +		device_type = "ethernet-phy";
> > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <11000>;
> > +		reset-deassert-us = <70000>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > new file mode 100644
> > index 000000000000..3b524359a72d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > @@ -0,0 +1,46 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +
> > +#include "sa8775p-ride.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> > +};
> > +
> > +&ethernet0 {
> > +	phy-mode = "sgmii";
> > +};
> > +
> > +&ethernet1 {
> > +	phy-mode = "sgmii";
> > +};
> > +
> > +&mdio {
> > +	compatible = "snps,dwmac-mdio";
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	sgmii_phy0: phy@8 {
> > +		compatible = "ethernet-phy-id0141.0dd4";
> > +		reg = <0x8>;
> > +		device_type = "ethernet-phy";
> > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <11000>;
> > +		reset-deassert-us = <70000>;
> > +	};
> > +
> > +	sgmii_phy1: phy@a {
> > +		compatible = "ethernet-phy-id0141.0dd4";
> > +		reg = <0xa>;
> > +		device_type = "ethernet-phy";
> > +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> > +		reset-assert-us = <11000>;
> > +		reset-deassert-us = <70000>;
> > +	};
> > +};
> > --
> > 2.47.0
> > 

Thanks & Regards,
Wasim

