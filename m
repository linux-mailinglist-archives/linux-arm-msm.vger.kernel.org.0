Return-Path: <linux-arm-msm+bounces-52502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 649ABA7111F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 08:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EF783B61CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 07:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14608199230;
	Wed, 26 Mar 2025 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mhkpZlNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50661C8FE;
	Wed, 26 Mar 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742973036; cv=none; b=Pum87A8YySTH/X8NcjZO0nFKQdMR3w2XRcJVr2AfJSbgiEKDptHZLa77+/A19Xz+6i1HyCLaT27fn7XE50eNiYCCvex0ZwPzxmRJDPWSwnLPNEuQ+IRJZ5xCAKY2xSbBsHir/Gl6EB3+M96osfQZU+vjppRr/Hxx6EcyMDzXJD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742973036; c=relaxed/simple;
	bh=eVOuDLsGbzGfXXNLVoe91/fIxbJ86kKBaQL/DLx1KYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g1sU6jCn8eZCrLAeKU29meSwSEIYGdM12nrwTLSjus9xFar/l+Phee097f3+noC/z2HA+OYlu//2//HY1TeIWHDoZ7I1LtoXdXLJ5feV1ZGuGS7dltYIjEAqtLeSa0qzTEIm06NieuOI3SFFxXNOKLzK2UPAJjbrvEdiC5ADmLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mhkpZlNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73H4O026884;
	Wed, 26 Mar 2025 07:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lp+AanYNpBXVQJd/FYZc8LhN+GUrk+Zl95cszDC493I=; b=mhkpZlNxXqYq727w
	PVcLGLMgk+bgmcSbHHtLHXFdiPHhpj+kWa9vuFluEgZ3CHi1dHyQ8KQoMIjnjZi3
	0ReVa1N4jGXgb6AOXG+XR34WbfiaGyzBVqfvvCMlzk2YHezafzuVzTBPO5upIqDv
	l/QNjp3IHgJVpXpUZghE/V/4FxOjOTVqDwRiSnpklaJIMWfDL+K2ABtQNfsGNmRU
	zpxKQRlAQ+Nf69+7YK294JTc1VoTThurx8CKPix/d8AnG/V1xnksukt9vRGrscYK
	5NfFSPzg4rKPe9DbE0YdWPLiGN/Kn7dWgn7CLDr1IkrgOQ06DHn4NA+WcIdkSQbO
	i/jhbQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdshcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 07:10:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q7ASm4004973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 07:10:28 GMT
Received: from [10.253.12.41] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 00:10:24 -0700
Message-ID: <08874014-3685-4446-82c0-e14ab57d304e@quicinc.com>
Date: Wed, 26 Mar 2025 15:10:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-1-3ea8e5262da4@quicinc.com>
 <55eada15-222e-4b97-a519-95b5e3aa7c23@oss.qualcomm.com>
 <ba6cbf94-3e78-4c77-8c4f-908d3d90a1b1@oss.qualcomm.com>
 <20250325-victorious-flamingo-of-destiny-c778a3@krzk-bin>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20250325-victorious-flamingo-of-destiny-c778a3@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OZaeH7oXE_p9PnmCxB5ub83L0K5hUB5R
X-Proofpoint-GUID: OZaeH7oXE_p9PnmCxB5ub83L0K5hUB5R
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e3a865 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=4zMwUWS1HWHBw9p5HkkA:9 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=887 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260041



On 3/25/2025 4:22 PM, Krzysztof Kozlowski wrote:
>>>> --- a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>>>> +++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
>>>> @@ -1,6 +1,6 @@
>>>>   /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>>>   /*
>>>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>    */
>>>>   
>>>>   #ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
>>>> @@ -19,4 +19,12 @@
>>>>   #define ETH1_50MHZ_CLK			7
>>>>   #define ETH2_50MHZ_CLK			8
>>>>   #define ETH_25MHZ_CLK			9
>>>> +
>>>> +/*
>>>> + * The CMN PLL output clock rates that are specifically applicable for IPQ5424
>>>> + * SoC. For IPQ5424, the other output clocks and their rates are same as IPQ9574.
>>>> + */
>>>> +#define NSS_300MHZ_CLK			4
>>>> +#define PPE_375MHZ_CLK			5
>>> Not a huge fan of this, such differences are only relevant to the driver
>>> part in my view - bindings only let a consumer reference a specific piece
>>> of hardware
>> Oh I the bindings are stepping into the frequency department already,
>> hmm.. Then I suppose it's fine if the dt-bindings maintainers don't have any
>> concerns
> 
> Nooooo, it was said these are output clocks, not rates. If these are
> rates, then NAK.
> 
> Best regards,
> Krzysztof

Yes, rates themselves are not defined here, they are defined in the
driver data structure.

The output clocks of CMN PLL are always fixed clock rate, so the clock
frequency was added into the clock specifier macro names defined in
this header file for clarity.


