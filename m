Return-Path: <linux-arm-msm+bounces-38373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0B9D2DAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AD53B282DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D391D0F79;
	Tue, 19 Nov 2024 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RVSfWD9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017B1D0DE2;
	Tue, 19 Nov 2024 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732037902; cv=none; b=X3Qtcd/ioDEM6U1R9T1ogHzPdtL0TuOq72d+cF8B6VBTy7cRCS3C68yTPUXl5ZF9W5hlxvepcKQOvUjEsNmwbN4nfb3llikeTbBINbByjGRCArSwjfYBH8nTh4zhmvY48iNOGDjagNJcgeHZOCt+Xw///yuUjIsH6LHaqMGLFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732037902; c=relaxed/simple;
	bh=+nq/+tRwoSFNW+EoK2pWSX8cxt4Pd0wqeFV9b8P+NlE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsP2TyWWB7mXMJAJcjQ8sMwMZjbUpCpvXAPOZSJwEOzJu2eB8rYldBAn7A/Yc2DFl+QlgBezlKIPELWQD4ddNHoyNo/ls2wZ8i7aU4bUC5teMhmNASrHjEBQJRHoKBEJoUO3DvtBrsxdl+Xhd4nYrtR+Gn1F7xw3uHlpUaFATIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RVSfWD9y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7Svar005048;
	Tue, 19 Nov 2024 17:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xUcf9sPZL9BJYbnUB8VEmGpr
	rh86lGq6QHbgREjvU+w=; b=RVSfWD9yIf1mq80rJzI1y8gndFU+RSbP8N0N1x2N
	TTc+0ZlC/KCPqWwAr18M5LT2QAcH5zbXgGzdK/HF1CqI06Dgva9jAiY0EJ0SamdS
	jz8pvbdjqmXY4CPvOGSTuK5obOnhvU6d+YlphCK9Of4/9o2EBPQHrRfO7uYgopLK
	PMNb296exqIMpkegZwnyM58rfV3za09GK0ocoyIm6zET9k1cTiaJpr1p7khuPblH
	ze9BKT3OEGemUpWmB10oVDfk8exnYJ/KctiiL4Ng16Om5oct+7Q/idL6zOjcX9+9
	2SYQaKG6agowlSZEsDgIMkyrp/gateo4JeSX27JqS8M+ng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y8kbc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:38:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJHcGWF031643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 17:38:16 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 09:38:10 -0800
Date: Tue, 19 Nov 2024 23:08:06 +0530
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
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <ZzzM/iXyZOzGDu/U@hu-wasimn-hyd.qualcomm.com>
References: <20241115225152.3264396-1-quic_wasimn@quicinc.com>
 <20241115225152.3264396-6-quic_wasimn@quicinc.com>
 <wfc6nkkm53tkruixgidhyqkcddcay4cxby5uq7lhh6gut6u7su@ok3lqh6fcxge>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wfc6nkkm53tkruixgidhyqkcddcay4cxby5uq7lhh6gut6u7su@ok3lqh6fcxge>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n3cjdqejTwCqTqvSshMqg5lOVkJ-8O69
X-Proofpoint-GUID: n3cjdqejTwCqTqvSshMqg5lOVkJ-8O69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=977 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190131

On Sat, Nov 16, 2024 at 01:54:23AM +0200, Dmitry Baryshkov wrote:
> On Sat, Nov 16, 2024 at 04:21:52AM +0530, Wasim Nazir wrote:
> > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> > boards but without safety monitoring feature of SAfety-IsLand
> > subsystem.
> 
> Why do we need another set of DTS files? Should we expect more changes
> to these DTS files?

Ride/r3 based on qcs9075 and qcs9100 are 4 different boards with different
SoCs, so different file is used to represent all the 4 boards.

> 
> > 
> > Difference between ride and ride-r3 is the ethernet phy.
> > Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
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

