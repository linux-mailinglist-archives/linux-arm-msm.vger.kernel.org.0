Return-Path: <linux-arm-msm+bounces-38094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D9A9CFA5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 23:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17627B2AB3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 22:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACC9191F78;
	Fri, 15 Nov 2024 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xz6Mt27D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61917BB32;
	Fri, 15 Nov 2024 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731711009; cv=none; b=J2x7XW+IEpNoUe8rH9uJfiYJOvpWMU9Pk64KM/PC6jEW9b5cIVibKENes8c6Te9O41NaUsVEziFOzyQmEpObdhlSJP2FLFX/9qOxE5dfkjySOwLX3Z1SnTI34eK7mcMmSu9Qic7TGjUQxcPT/HhRe0ruF8CRmfjTldNeuQu0xSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731711009; c=relaxed/simple;
	bh=EPBhO/3fFFDG34vKMqFcFU48rUpYA4EvoMsttgim34w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g17fE3pT9urTGkQuQl0jEcPBMTrJw8iXn5hPemBd7vgMcmDZIueBcH2n6dSJrlozi5P0DKMupoAC4eiuhJRVaXfEFLhnDYUugRbXEpugzhGe4c7JdqHGXk6eA+VktOpcNRYC9fD0foD/MfN/DT2c3nd+P0kDqOE2/Up8SBIJ000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xz6Mt27D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFCMWR7012975;
	Fri, 15 Nov 2024 22:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6PNE6+OfMxWFT7FW0ro/WbHK
	WIUSDgbp8snCkqh0hic=; b=Xz6Mt27DrIsZvH5Xjq341X13BW2MlAmOpzHHAJhM
	rn3Sa+c1BlVvq2KKNk3c/a6BOxXxnGrygvy3NNAh8/LRbY+V5ic1Wjoc84DuxCDA
	Gwbs/+YwPGNTFTuOw+K3cWmECinJltzBa6JrTURNEy/k9QHPmRErGI45VLruG6BN
	PKsOTTcDAW+Ll7mKEU7imrp4H5f/22yLX7QRnFz4b3RwPunVgtWdBSAUQBSgWNHV
	S8yd+hrwMF0vAVJD//xq9prYce9/mhlJt+HQQXBiwjLgsycfqG6N7r1KRDNeVIqy
	C+hQ0frSOKBUd66xn251WDt+hURQ8xf43yc6G6fghP9iEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wwddb096-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:50:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFMo2UI032522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 22:50:02 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 15 Nov 2024 14:49:58 -0800
Date: Sat, 16 Nov 2024 04:19:54 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <ZzfQEgDm5xOOJ3E/@hu-wasimn-hyd.qualcomm.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
 <20241110145339.3635437-6-quic_wasimn@quicinc.com>
 <w43u62ikaixw6pkianhnnmlqutkkzsjomhnj7szgxriuh3jvvn@x5mhnnigrnls>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <w43u62ikaixw6pkianhnnmlqutkkzsjomhnj7szgxriuh3jvvn@x5mhnnigrnls>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PBzZ7YeFbrCLgH6IUn4Nsd0dxB94qpc2
X-Proofpoint-ORIG-GUID: PBzZ7YeFbrCLgH6IUn4Nsd0dxB94qpc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=960 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150192

On Fri, Nov 15, 2024 at 06:06:19PM +0200, Dmitry Baryshkov wrote:
> On Sun, Nov 10, 2024 at 08:23:39PM +0530, Wasim Nazir wrote:
> > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> > boards but without safety monitoring feature of SAfety-IsLand
> > subsystem.
> 
> What is the difference between Ride and Ride-r3 which requires a
> separate DT for the -r3 variant?
Difference between ride and ride-r3 is in ethernet phy.
Ride uses 1G phy while ride-r3 uses 2.5G phy and both has its own
corresponding DT nodes which will be added at later stage.

I will update the commit message in next series to point out the
difference.
> 
> > 
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile            |  2 ++
> >  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 12 ++++++++++++
> >  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 12 ++++++++++++
> >  3 files changed, 26 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 5d9847119f2e..91c811aca2ca 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -116,6 +116,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > new file mode 100644
> > index 000000000000..a04c8d1fa258
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +
> > +#include "sa8775p-ride-r3.dts"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> > +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > new file mode 100644
> > index 000000000000..9ffab74fb1a8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +
> > +#include "sa8775p-ride.dts"
> > +
> > +/ {
> > +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> > +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
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

