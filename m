Return-Path: <linux-arm-msm+bounces-58944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19085ABFA13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 17:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D32A24AD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 15:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0D1224AE0;
	Wed, 21 May 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y9LwLGqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F694A3C;
	Wed, 21 May 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841930; cv=none; b=sBbiMVeVuBVQvcdxIuyPjE485eBuyqni7UvT1CAZHq7M+RFY6CUis5zZ1V4VjvCXEpMgvXCKL7qfAR35AmxUXcAYHoDVUY9a6pxVSdE5YHfmI/0QDQXc/YnZcOTRYqrYp6GNqE92mnBJA4nww+7uO6vtsZcDBiLbifPPWl7GyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841930; c=relaxed/simple;
	bh=kHuK++9HMgLjapjuQKtcm9X+dpYMfoIDuNEtOqEqibM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7JkZ8rU8aiGNeRJT2gfhslGpdkXr1orTBuxfSIS26RwWBwofIzJKyJtK+ohYlBHIpfEFWxyIUpIz7IaReBQ/5J2MgM7hcPxCOZOMOiGTXIgN8Y66p8pwpJpmlD9pB8e39mgfuqg1lg0XmB5DxRtSBH/USNpJd3W7nWBN85w/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y9LwLGqf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMQZ031724;
	Wed, 21 May 2025 15:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozf3M6Cugc/aFg0Zyb/ipIxb
	QdK6KrPFdnId1xoXVv0=; b=Y9LwLGqfK43ouc9oFEjpqZZzQdC0+oPiXTd3wXF4
	GmaRvzC8PYentcajQ/oaK4G3WGv4FVNPZZxzO+uZ7sQyNLorqRsSgEsA9C5vEAhy
	zobLuyrwUw33l2GmJ4KlXe276wkHA+rLoWURahKDk3P/rbu6NzF4FfckAXyf+Igc
	IZLEo3lMqJpuEmW3GSGT3TWr7stLurK8g8dew5rivHsX9JsJlP0Cdkk1aW13mcSN
	SpPBy94fFK9/3Hu2br5njDBTPpxc6LqkCEfn5dFrQbxqBoPclylGfxoYIDNtvQvF
	MhP5g2EaMbHlLREDO4HrX5HtUgizePg9nDm+HCKJGstoKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21ycv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:38:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LFcXnO004314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 15:38:33 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 08:38:27 -0700
Date: Wed, 21 May 2025 21:08:23 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add UFS support for qcs9075
 IQ-9075-EVK
Message-ID: <aC3zb72vEqJ2+fp9@hu-wasimn-hyd.qualcomm.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
 <20250521140807.3837019-7-quic_wasimn@quicinc.com>
 <e34a9a27-de57-4cd8-892f-6a3fcd447b9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e34a9a27-de57-4cd8-892f-6a3fcd447b9f@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE1MyBTYWx0ZWRfX85dqplcV3NB+
 dDOMgTBqeIulNnx3BL6zz8NNg7nCWlKU46wBTvp8oyTK3Csp0rpyh/LHEgny2JrGwhZlksXkSB1
 5jT6yejLPnWhdCsdexvFYo+RE2+qlceU2gUSw9qEe+9pefrNbux7rHnaqX4DTd0p932hYsaWwVL
 NXY5EoHKKzkR5qGEY5SXKrcXY+G/jq5YS3yVafpdl/m8XOtPKdTptkrpvsQTZ3FB0QCh6G83srF
 xF369EYdgUgXOJP10TMC7ic2FhHGRjuYmoLJYx/Jc52wbmuU5K6givFItB6rPbRCdgFN+reTfvq
 j/sDrKoOdZBeU5UJXhKVuLV8nv+qRu9/WxIATjuh+5neCa+slsF+x/klaWJgpOSMdY2BNyES764
 O301ulQXAQ/eLqjC2KvdXKXu20LGxQbA0wKu6Hiz2OODfD03RvzLwp6ykrUo+CZiS4gkxq4x
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682df385 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=D8dkqmddnnDp_BZcoEAA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SGyZBcfWsEyJ5i8p0j91LxJWS7Bar2Br
X-Proofpoint-GUID: SGyZBcfWsEyJ5i8p0j91LxJWS7Bar2Br
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=550 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210153

On Wed, May 21, 2025 at 05:33:52PM +0300, Dmitry Baryshkov wrote:
> On 21/05/2025 17:08, Wasim Nazir wrote:
> > From: Sayali Lokhande <quic_sayalil@quicinc.com>
> > 
> > Add UFS support for qcs9075 IQ-9075-EVK board.
> > 
> > Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> 
> Squash two last patches into the previous one. Use Co-developed-by+SoB to
> denote all contributors.

Thanks Dmitry for the clarity, will push another series accordingly.

> 
> -- 
> With best wishes
> Dmitry

Regards,
Wasim

