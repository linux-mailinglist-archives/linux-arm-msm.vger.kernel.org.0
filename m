Return-Path: <linux-arm-msm+bounces-37120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 258059BE292
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CDA41C22FAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FE81D9329;
	Wed,  6 Nov 2024 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dJCbaX2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53371D27BA;
	Wed,  6 Nov 2024 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885599; cv=none; b=lKZ87mimyqB/9tkFjFP+0n2yY5wxENbIO2l/C3IWT3tTA2HteuP8Drr5PgBrtG2jiQWdS0vVL2E1dfdp3Oqet8tFSqqPGOf1CbK3k/itKMWoYpxfBP7z23PwkXXGBrkuOuvtckYcHnE/264eR8l4ZtNNdT3Ul/4sYd42r6O0HIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885599; c=relaxed/simple;
	bh=QiEDB5mi8W/VjNnRPEmKrLelOzqBFEdzV3sB1MVs9/U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUOn3Gv1h78y3SmikvEYJ4iltDvL8g67YUWtO0l0tykZXsucx7Wksnhr3TpoH8g8VIOimLMzancXk7SGsyiOScDj0IiTzmtqrt/TIGNEEcQuaqQ0wkuy6X47uIFVRzVvPF3OVaYP50zSr7o4rgEWp8GzR8L29co1APmecuEK664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dJCbaX2C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Lr3fG015895;
	Wed, 6 Nov 2024 09:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g2hmAisisJ+9Ub7aj6jl4dRQ
	PL81uW+0wOCEjJo02DY=; b=dJCbaX2CgmcoY0VTCe/uZH85TxfamcZIegL3Nsyg
	BOflMrqznyAGcXjnID808pfIMHBSLYTOsnW7lmlw/WICeOqR7IkyOJkh/X2IWLhE
	apSiFoRlRjCE9KtNJ+q+KehTkF301aN6GcSJCcsUDmO9dIIxykDS0NA4GL1YReEU
	oIiBOKVeAyLAZdo+kVmZpLDapoIJGoKguOoZX2yxtcuY3b3j31zqycw1YSHeAurR
	qxBk8ri3qXeO12ElkWzjrgU4dYX620YR1gEBzGNl7YjgOooTuaOgbIOzAQBjQYoz
	/derzL1ZOmzY8yb8gqRGA4dBt9okdOehDpUSlTWQqf3/Eg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8n3qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:33:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69XDFg006098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:33:13 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:33:08 -0800
Date: Wed, 6 Nov 2024 17:33:03 +0800
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <ulf.hansson@linaro.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <bhupesh.sharma@linaro.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_yuanjiey@quicinc.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <Zys3zwMAA+dWuGby@cse-cd02-lnx.ap.qualcomm.com>
References: <20241106072343.2070933-1-quic_yuanjiey@quicinc.com>
 <20241106072343.2070933-2-quic_yuanjiey@quicinc.com>
 <347uhs7apex3usmfpzrpwakrzchxactwtc7gs45indkzez2vfj@n75dc3ovl3g2>
 <ZyshSbJgLHTRaps1@cse-cd02-lnx.ap.qualcomm.com>
 <FF5BD9CD-8E5E-4C40-906C-8552C067AE8C@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <FF5BD9CD-8E5E-4C40-906C-8552C067AE8C@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pzvn6bKvwG4HwTzo0T3vWw5xa1zXrc8a
X-Proofpoint-ORIG-GUID: Pzvn6bKvwG4HwTzo0T3vWw5xa1zXrc8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=961 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060077

On Wed, Nov 06, 2024 at 09:10:57AM +0000, Dmitry Baryshkov wrote:
> On 6 November 2024 07:56:57 GMT, Yuanjie Yang <quic_yuanjiey@quicinc.com> wrote:
> >On Wed, Nov 06, 2024 at 09:36:56AM +0200, Dmitry Baryshkov wrote:
> >> On Wed, Nov 06, 2024 at 03:23:42PM +0800, Yuanjie Yang wrote:
> >> > Add SDHC1 and SDHC2 support to the QCS615 Ride platform. The SDHC1
> >> > and SDHC2 of QCS615 are derived from SM6115. Include the relevant
> >> > binding documents accordingly.
> >> 
> >> Which binding documents?
> >Thanks, the binding documents is sdhci-msm.yaml.
> >I have modified this yaml patch in patch v1, and this yaml patch is
> >applied, so I remove this yaml patch in patch v2.
> >link:https://lore.kernel.org/all/CAPDyKFr-Gzd3Mzn+vN6DXO9C4Xrvpv4z5V2G_VRTzOa=89Fd3w@mail.gmail.com/
> 
> The question is why do you mention bindings in the DTSI commit message? Please don't just C&P your texts.
Thanks, I will adjust commit message in next version. I will optimize my language expression again.

> >
> >> > Additionally, configure SDHC1-related
> >> > and SDHC2-related opp, power, and interconnect settings in the device
> >> > tree.
> >> > 
> >> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> >> > ---
> >> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >> >  1 file changed, 198 insertions(+)
> >> > 
> >> 
> >> -- 
> >> With best wishes
> >> Dmitry
> >
> >Thanks,
> >Yuanjie
> 

Thanks,
Yuanjie

