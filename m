Return-Path: <linux-arm-msm+bounces-41141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142F9E9E30
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1E2163133
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A23167DAC;
	Mon,  9 Dec 2024 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GJwk3YOD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC2B7080B;
	Mon,  9 Dec 2024 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769543; cv=none; b=poQ1/jz/MoIoi5o3FaQmlYyd1zPZld+Jhx7OokH5kJ3Gr/4SVSAb7EwqJ7kAn5cmp0aIC4+bEiUEbXdEZp0TZIIGa1wtYIf1r6038rT7ou/K6/XiWgn9iUXgtu+3hmwtW5f4vIMdBxaY6c78ALEcNJJ+GjdwJdXcgaOrFxmoCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769543; c=relaxed/simple;
	bh=+s8Lf5eQa2ock8WzPcEMFPU3mzjbS5k+y8JlzF6nro4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mzxr+nOcsU23kTNjksEXKnu2T+TlxcW+Y5iLVtvLyrERTsj1G8P7+DM2gifndsBVGhnvV90Qb3iSk4MLm8+BYsWCM+OIalh20fmLTL3TgOFpbnWFxjRevcTbHCo2N2dxN1TPMV61EcnX/JFGiEF8Ppp2Q2Vd0DcB97Dr1nXqe1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GJwk3YOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9FKuaF019489;
	Mon, 9 Dec 2024 18:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5rIj1q/B44booWRa+2MLQ4SvFGg6OhM5P7y4kUU+n4=; b=GJwk3YOD1T3SasH5
	r+SfkKujeClJIBairzCZG4ouoH+jIGVqm/2cgtit4by3FGOCwriaYUsrD8FEZZCM
	z0ia0+pQuwqNEOMmatBwksk6sM5spn7tJqwe7xIAemJVuvDh3YqH0v9sjVrE9XuD
	MyxebFG5sbfragDK8dbhdxvBlo9fhEtiE9OBuA3Kmd4zWRG1Q9GvwHJmyt1EDL87
	lpLZqTK5mtFljcdiXO3Ovco/DTbwsqGYmotSEF2W8ZVOdA7Apoc+loe/1RcyrgYH
	S/WOjHi5054ex7w9vcl9V5q7laWxIQUOCjjhJ0iEMn0C+2YGrcr1VGJfoHBA63SF
	aDagrA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3418k58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:38:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9IcwM6032262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 18:38:58 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 10:38:52 -0800
Date: Tue, 10 Dec 2024 00:08:48 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z1c5OBXyETf9TXp8@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <20241119174954.1219002-6-quic_wasimn@quicinc.com>
 <9e351979-be01-4d38-9b94-cc23efac4c3f@kernel.org>
 <Z1LaN9nFr5msfq61@hu-wasimn-hyd.qualcomm.com>
 <cbed17c2-d839-42cb-8a33-b59538bfccf3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbed17c2-d839-42cb-8a33-b59538bfccf3@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KJqglNvMhloqaSyaZeMIPKgply727xOf
X-Proofpoint-ORIG-GUID: KJqglNvMhloqaSyaZeMIPKgply727xOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=893 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090144

On Fri, Dec 06, 2024 at 01:14:26PM +0100, Konrad Dybcio wrote:
> On 6.12.2024 12:04 PM, Wasim Nazir wrote:
> > On Wed, Nov 20, 2024 at 05:44:11PM +0100, Krzysztof Kozlowski wrote:
> >> On 19/11/2024 18:49, Wasim Nazir wrote:
> >>> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> >>> QCS9075 Ride & Ride-r3 are similar to QCS9100 Ride and Ride-r3
> >>> boards but without safety monitoring feature of SAfety-IsLand
> >>> subsystem.
> >>>
> >>> Difference between ride and ride-r3 is the ethernet phy.
> >>> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> >>>
> >>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/Makefile            |  2 ++
> >>>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 12 ++++++++++++
> >>>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 12 ++++++++++++
> >>>  3 files changed, 26 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >>> index 5d9847119f2e..91c811aca2ca 100644
> >>> --- a/arch/arm64/boot/dts/qcom/Makefile
> >>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >>> @@ -116,6 +116,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> >>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> >>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
> >>>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> >>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >>> new file mode 100644
> >>> index 000000000000..a04c8d1fa258
> >>> --- /dev/null
> >>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> >>> @@ -0,0 +1,12 @@
> >>> +// SPDX-License-Identifier: BSD-3-Clause
> >>> +/*
> >>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>> + */
> >>> +/dts-v1/;
> >>> +
> >>> +#include "sa8775p-ride-r3.dts"
> >> No guys, you are making these things up. This is EXACTLY the same as
> >> qcs9100.
> > 
> > 9100 & 9075 are different from “safe” perspective. They differ in
> > changes related to thermal which will be added later in devicetree.
> 
> Since this can't be inferred from just looking at the changes, please
> make sure to add that to the commit message
> 

Sure, will add more details in next patch series.

> Konrad

Thanks & Regards,
Wasim

