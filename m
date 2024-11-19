Return-Path: <linux-arm-msm+bounces-38372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7759D2D9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7A92B3D8E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092641D223B;
	Tue, 19 Nov 2024 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CRPInILZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154661D2234;
	Tue, 19 Nov 2024 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732037265; cv=none; b=u8WNl1acQBosaJ58q5u9dVsFVRqucWrV152ap6WO3dWIUrio8jYbNK+7wmTvmTscGjLd53zfTUYHme3DtjxjTqyIuyOVrf02WL6A1jwqD3nLIa3bSZF0Mie5zUzSco3+M1IHIYVXiA2dWXH4iTDKKVO2ogj8BY+kHxxOqsZYo3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732037265; c=relaxed/simple;
	bh=wg4ks+EVkmDrdeol1OvSSJmOtzK7sOF+2NN6Lp6kzhc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCHClblPebBhXnj6ojpKp28O4pGowhi/yTIaHlpFfRhOWsJ+I04EAsNABVIXrkTQPLXDM0hFrYZIAf1LV89TRxy+f+bSuRSpzvwPBb3cliHCmofWiDanBI5OFuFcRVUXiRHax1W13N9vIX2ILtcuwWAGdQzoS+gGq618tZxw9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CRPInILZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7cJX2005043;
	Tue, 19 Nov 2024 17:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XKA301jNB9X2BD4pPMYNjSSp
	vi8lm7+m1RnjBOF0L2A=; b=CRPInILZpMaHBU/C6a/mY8/JMTQ6Q286al/QaQ6b
	8J/5qDMy00FvKFnt6y+8HOwchFBL7yKUhOjE/emrfXRBwDb51EVo06mTLvZhz6mD
	U+VyhZyOynAk8SnlDPU6MT9YL65HFJw2brHBUmPAr9XLCarh7xcyk8qEuQiShmGn
	Yj1c8DStb8xyp9p7aaFJOFS5p1XLi0Im3CI6NQaEsORzBWRjpbrZ/2wbSHQAfRlt
	cQU8yA5xQmadNnDp/6RY1NkwRmaHKcnHKKBIBenFiKNvxzLEXJi7rkdcoW7KZ0ae
	nmAN9At3awMxzP5YCMlrTVaoJTdFK/qV4vvE4ms+fvHJtQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8kafd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:27:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJHRco3020745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:27:38 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 09:27:31 -0800
Date: Tue, 19 Nov 2024 22:57:20 +0530
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
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: Add support for QCS9075 RB8
Message-ID: <ZzzKePPcjDAhiaM3@hu-wasimn-hyd.qualcomm.com>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
 <20241115225152.3264396-5-quic_wasimn@quicinc.com>
 <5r4m3p3kwix2jjp23l5eqk74mbt2dusozwxml4um2i773qxb6g@swzszlybrqfa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5r4m3p3kwix2jjp23l5eqk74mbt2dusozwxml4um2i773qxb6g@swzszlybrqfa>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Fp-OKId1hM0LWofbuBJly40OC9osuP2b
X-Proofpoint-GUID: Fp-OKId1hM0LWofbuBJly40OC9osuP2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190129

On Sat, Nov 16, 2024 at 01:53:00AM +0200, Dmitry Baryshkov wrote:
> On Sat, Nov 16, 2024 at 04:21:51AM +0530, Wasim Nazir wrote:
> > Add device tree support for the QCS9075-RB8 board.
> > 
> > Basic changes are supported for boot to shell.
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile        |   1 +
> >  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
> >  2 files changed, 282 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 9bb8b191aeb5..5d9847119f2e 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -115,6 +115,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > new file mode 100644
> > index 000000000000..e4307ff1e2a7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
> > @@ -0,0 +1,281 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "sa8775p.dtsi"
> > +#include "sa8775p-pmics.dtsi"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS9075 RB8";
> 
> Is this going to be an actual product name? Usually RBx boards are named
> differently.
Will update it in next series.

> 
> > +	compatible = "qcom,qcs9075-rb8", "qcom,qcs9075", "qcom,sa8775p";
> > +
> > +	aliases {
> > +		serial0 = &uart10;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +};
> > +
> > +&apps_rsc {
> > +	regulators-0 {
> > +		compatible = "qcom,pmm8654au-rpmh-regulators";
> > +		qcom,pmic-id = "a";
> > +
> > +		vreg_s4a: smps4 {
> > +			regulator-name = "vreg_s4a";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1816000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s5a: smps5 {
> > +			regulator-name = "vreg_s5a";
> > +			regulator-min-microvolt = <1850000>;
> > +			regulator-max-microvolt = <1996000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s9a: smps9 {
> > +			regulator-name = "vreg_s9a";
> > +			regulator-min-microvolt = <535000>;
> > +			regulator-max-microvolt = <1120000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l4a: ldo4 {
> > +			regulator-name = "vreg_l4a";
> > +			regulator-min-microvolt = <788000>;
> > +			regulator-max-microvolt = <1050000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l5a: ldo5 {
> > +			regulator-name = "vreg_l5a";
> > +			regulator-min-microvolt = <870000>;
> > +			regulator-max-microvolt = <950000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l6a: ldo6 {
> > +			regulator-name = "vreg_l6a";
> > +			regulator-min-microvolt = <870000>;
> > +			regulator-max-microvolt = <970000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l7a: ldo7 {
> > +			regulator-name = "vreg_l7a";
> > +			regulator-min-microvolt = <720000>;
> > +			regulator-max-microvolt = <950000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l8a: ldo8 {
> > +			regulator-name = "vreg_l8a";
> > +			regulator-min-microvolt = <2504000>;
> > +			regulator-max-microvolt = <3300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l9a: ldo9 {
> > +			regulator-name = "vreg_l9a";
> > +			regulator-min-microvolt = <2970000>;
> > +			regulator-max-microvolt = <3544000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +	};
> > +
> > +	regulators-1 {
> > +		compatible = "qcom,pmm8654au-rpmh-regulators";
> > +		qcom,pmic-id = "c";
> > +
> > +		vreg_l1c: ldo1 {
> > +			regulator-name = "vreg_l1c";
> > +			regulator-min-microvolt = <1140000>;
> > +			regulator-max-microvolt = <1260000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l2c: ldo2 {
> > +			regulator-name = "vreg_l2c";
> > +			regulator-min-microvolt = <900000>;
> > +			regulator-max-microvolt = <1100000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l3c: ldo3 {
> > +			regulator-name = "vreg_l3c";
> > +			regulator-min-microvolt = <1100000>;
> > +			regulator-max-microvolt = <1300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l4c: ldo4 {
> > +			regulator-name = "vreg_l4c";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			/*
> > +			 * FIXME: This should have regulator-allow-set-load but
> > +			 * we're getting an over-current fault from the PMIC
> > +			 * when switching to LPM.
> > +			 */
> > +		};
> > +
> > +		vreg_l5c: ldo5 {
> > +			regulator-name = "vreg_l5c";
> > +			regulator-min-microvolt = <1100000>;
> > +			regulator-max-microvolt = <1300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l6c: ldo6 {
> > +			regulator-name = "vreg_l6c";
> > +			regulator-min-microvolt = <1620000>;
> > +			regulator-max-microvolt = <1980000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l7c: ldo7 {
> > +			regulator-name = "vreg_l7c";
> > +			regulator-min-microvolt = <1620000>;
> > +			regulator-max-microvolt = <2000000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l8c: ldo8 {
> > +			regulator-name = "vreg_l8c";
> > +			regulator-min-microvolt = <2400000>;
> > +			regulator-max-microvolt = <3300000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l9c: ldo9 {
> > +			regulator-name = "vreg_l9c";
> > +			regulator-min-microvolt = <1650000>;
> > +			regulator-max-microvolt = <2700000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +	};
> > +
> > +	regulators-2 {
> > +		compatible = "qcom,pmm8654au-rpmh-regulators";
> > +		qcom,pmic-id = "e";
> > +
> > +		vreg_s4e: smps4 {
> > +			regulator-name = "vreg_s4e";
> > +			regulator-min-microvolt = <970000>;
> > +			regulator-max-microvolt = <1520000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s7e: smps7 {
> > +			regulator-name = "vreg_s7e";
> > +			regulator-min-microvolt = <1010000>;
> > +			regulator-max-microvolt = <1170000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_s9e: smps9 {
> > +			regulator-name = "vreg_s9e";
> > +			regulator-min-microvolt = <300000>;
> > +			regulator-max-microvolt = <570000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l6e: ldo6 {
> > +			regulator-name = "vreg_l6e";
> > +			regulator-min-microvolt = <1280000>;
> > +			regulator-max-microvolt = <1450000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +
> > +		vreg_l8e: ldo8 {
> > +			regulator-name = "vreg_l8e";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1950000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-allow-set-load;
> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> > +		};
> > +	};
> > +};
> > +
> > +&qupv3_id_1 {
> > +	status = "okay";
> > +};
> > +
> > +&sleep_clk {
> > +	clock-frequency = <32768>;
> > +};
> > +
> > +&tlmm {
> > +	qup_uart10_default: qup-uart10-state {
> > +		pins = "gpio46", "gpio47";
> > +		function = "qup1_se3";
> > +	};
> > +};
> > +
> > +&uart10 {
> > +	compatible = "qcom,geni-debug-uart";
> > +	pinctrl-0 = <&qup_uart10_default>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&xo_board_clk {
> > +	clock-frequency = <38400000>;
> > +};
> > --
> > 2.47.0
> > 
> 
> -- 
> With best wishes
> Dmitry

Thanks & Regards,
Wasim

