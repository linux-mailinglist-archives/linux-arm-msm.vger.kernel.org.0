Return-Path: <linux-arm-msm+bounces-40776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A119E6CB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 12:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1353C166DC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577EB1FBC95;
	Fri,  6 Dec 2024 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eOOPYcXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95C155C94;
	Fri,  6 Dec 2024 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483080; cv=none; b=WJDja/a+ZQ00VbBy0Ea3SDUshu3WhhiHkgO5okRPfyvPuCyaDxPSU22cEShmZHedCNmIeF3F/wkJRxIAGXab02mDA60MR9Jwvsz2MKKFH35FLDPqSDX/jxkyPm2FxieuOGujK5AfYhhNc1NbH4dRn+RZ1DZz17BpyBeDvbCF5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483080; c=relaxed/simple;
	bh=0NQHcKcA/lGzLsNFSaXSHfGyrL2zqGNg9b9wT7QGn2g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3bFMmc6pFk3bIaOkVqNyJC4GZPlY9WiT08mXa1VzogrP/YjE43u9HX0mgnVk7ChIrYbfrw0J8pvNDb89Mzad5LnkyXXeQ8wSipuxqdcS27V18LVai9DqVjuy2JJxGsFN4Fng4WXyC1wNbSK8FgMrc2u91urjUZu7PyvNNpEHzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eOOPYcXS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B68keOM020526;
	Fri, 6 Dec 2024 11:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qAWDc9ZzjlTESBGI0sKOtRqIHdQ2PdS9CfJbT653hnM=; b=eOOPYcXSeLoZLmAB
	0172f6EAxNUdEEjBmRQ6RWwrroaTfvBEuk3P4zA4ko2JX7U5a7p+nl82bHix5sGd
	O6Ad8ajTg0M+ETYgIScCccXSVa7h6AFRQW/pnuM2+tZn59U/1uqB1SvXO/II9OW3
	7bQ+PAk5FtwL5sENWf+ghBKrIExP3CbV1mWky+GKHA2AF2MEgwN6yXg+KKG3CcFc
	5nNfNq0FGqqn2RST1LCzPsCdAPtl1qZZqifIrRsq9Jh6yHVZygjpdPKuQaXrAcma
	+AzCs0UG8m/ZMen1NuxCBXvXxV3C4IF5JdZuVXN9udEVhocLQmeKTCSHjWadY4A+
	BK3KqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8t2ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 11:04:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6B4XWI021686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 11:04:33 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 03:04:27 -0800
Date: Fri, 6 Dec 2024 16:34:23 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z1LaN9nFr5msfq61@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-6-quic_wasimn@quicinc.com>
 <9e351979-be01-4d38-9b94-cc23efac4c3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e351979-be01-4d38-9b94-cc23efac4c3f@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nQ9LVPraClAtFh8MU31IiNUD0MOeCykD
X-Proofpoint-GUID: nQ9LVPraClAtFh8MU31IiNUD0MOeCykD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=868
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412060081

On Wed, Nov 20, 2024 at 05:44:11PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2024 18:49, Wasim Nazir wrote:
> > Add device tree support for QCS9075 Ride & Ride-r3 boards.
> > QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> > boards but without safety monitoring feature of SAfety-IsLand
> > subsystem.
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
> No guys, you are making these things up. This is EXACTLY the same as
> qcs9100.

9100 & 9075 are different from “safe” perspective. They differ in
changes related to thermal which will be added later in devicetree.

> 
> NAK
> 
> 
> 
> Best regards,
> Krzysztof

Thanks & Regards,
Wasim

