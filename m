Return-Path: <linux-arm-msm+bounces-44597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B26A078FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838A916873F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C02219A78;
	Thu,  9 Jan 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a/eldYoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04995290F;
	Thu,  9 Jan 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432391; cv=none; b=fhOvowxEEYYclS1kXJWhXwyWGrtIWWZ7gJE3rV1LB9pO8YIHGQ3CSIEc5/TLq/tWdRw/q9ZQnd3xTR74EBi14OzBGuv0gipvRrOcYipO2NwW7sZqkRhBUxevAPSKlH3Ay0xmNTBN6yAr4+yZXgVMW09uE2UmNReQPYWc1Ezqapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432391; c=relaxed/simple;
	bh=3Cyb/yJ0hGfRmTy1fJV1VCXGRfrohPiUGluaA5skCe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=psj+oC8jR9YHS2rZAybB79jNXhVz22NvulLjUm0ysfJDnpN6vRkrCvctdXQSaMpEj1bHrlLKn1NDm7br9Mj9UrbjTWN20UXxEII+JaqxLI+P9WOESDr0mhRKMHJt+58bSvwV1N0yTq89JTRxHI4LG0O6IVKS3WPEdcAHZYG33Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a/eldYoD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509CgcHU003818;
	Thu, 9 Jan 2025 14:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JlvcLHFoOuM9djjsq49NJBg4dAj2E4/lyqG4Bb/Pseo=; b=a/eldYoD4bg1Dp+Q
	mKtb6hmIIWBl4phqc5Vnl/a6e2nI72lQ7FHXEAugKc8MTPXqMYWef0rmxNy0DxYU
	hhMP9av460AbZ4IjQ1ECe2DMcZeKoKYfkcNfGLPRAkMeayeCgzZ0AFVxikXUkyxE
	Um91kGwIvgwHhtBy2B989y8tUn05YJh+Vj/F977YsuhebdJLltg+d2KCxSB2xKz8
	16xdSfXgbV5unfIOjj4wjn6zQQ3wapsvr4wSZIoy3Q9Io6KZmXI22HA3Q2C9ppeF
	gbMfF/NDALIxfydRsVk7a3Id/QPb4JEQbOcLwV/BVopsaVyOyn851MWRnoD6gbtN
	FvESYA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442epxg7b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:19:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509EJYHv029194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 14:19:34 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 06:19:28 -0800
Message-ID: <96f96370-2b33-467a-b7b4-d8d5d08f8227@quicinc.com>
Date: Thu, 9 Jan 2025 22:19:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 06/14] net: ethernet: qualcomm: Initialize the
 PPE scheduler settings
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>
 <4abc7542-df10-4bb6-a8dc-68e57789fc8e@wanadoo.fr>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <4abc7542-df10-4bb6-a8dc-68e57789fc8e@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a9DVOCI6RHkzn9TA1DMXc9LXKnJTHSqz
X-Proofpoint-GUID: a9DVOCI6RHkzn9TA1DMXc9LXKnJTHSqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090115



On 1/9/2025 3:27 AM, Christophe JAILLET wrote:
> Le 08/01/2025 à 14:47, Luo Jie a écrit :
>> The PPE scheduler settings determine the priority of scheduling the
>> packet across the different hardware queues per PPE port.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> 
> ...
> 
>> +/* Scheduler configuration for dispatching packet on PPE queues, which
>> + * is different per SoC.
>> + */
>> +static struct ppe_scheduler_qm_config ipq9574_ppe_sch_qm_config[] = {
>> +    {0x98, 6, 0, 1, 1},
>> +    {0x94, 5, 6, 1, 3},
> 
> This could certainly be declared as const.
> If agreed, some other arrays in this patch in some other patch could 
> also be constified.
> 
> CJ
> 

Sure, I will update to declare the arrays as const.


