Return-Path: <linux-arm-msm+bounces-48508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A8A3BF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624FD167315
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976151E130F;
	Wed, 19 Feb 2025 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c7C0yDME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D511D1E25EF;
	Wed, 19 Feb 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739970082; cv=none; b=P9W926eh4kAfKpCKLcIRNyMdsOlchDh2RGSkPRg0JT3OGhKWg9gUwav0UTzDhV+Jnxj3C9pPWOx1Pcbyfhtf4U5NJppvepSJfCwaYPsYSXFPE183/LSs5rDe4xjK38BpImVvqo37upszmAgm1MOQWVjDGW+Fa1AGrXGeCC03znU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739970082; c=relaxed/simple;
	bh=QcccMRbXtdO3gmmJTjotleh7lPgIqkwTESnzznTvJvg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=DHjXB28Spg/XFDXDJOrRbPW5ihfoecSTkSjiGvKWrRR6pDbaPYIbfS/n11AWcx2ZaUCMpNqdV4BdM77H8eS/uB0hVWb4XpViaJLW5qGGy8UDI1nIn9mBhifA28HWdnpHyQEBLz5HPSVEm+dF9vRDAsXPXAqmxH4ulmj3hdKzhMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c7C0yDME; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8NRbm014898;
	Wed, 19 Feb 2025 13:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6KgOzMA8ihMoUxGj5Qw6lNE4j2AzNyOH0PA1NQsnhJI=; b=c7C0yDMEnkbIvyRN
	vctHbQmTt0jo6TD4MK2X2usM2lG8Cos1u6smvWAihNL4HXSkfYzCG+sEcJK0g8mP
	l5bjb3JahMY0dg1HLck5SARMvzK/+SzWD1ixqcss7ejrHGa8QbgG+1pm0oZFI+iB
	2bX38gGUCu8E9l9FREoKv6WXNUA3uoW/FgUZkOWAYbUpcAIexP4dCcl9bjTtztNh
	vP7yyyC3KvHEIGI/2iH8VOK8LU+VIs02PmYLLtEx9i2+JsqTQ7/Il2D4R7oykENz
	eUd/IiCdFHPpDT5C1sMhZup5v1iFP218A/xV54NcKqysbVBGvd9lf5ecjwg2XBKp
	MIl2JQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy12kuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 13:01:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JD1274015906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 13:01:02 GMT
Received: from [10.253.35.15] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 05:00:55 -0800
Message-ID: <2aa1c649-6fce-40b1-bbf7-1d6d756dbbec@quicinc.com>
Date: Wed, 19 Feb 2025 21:00:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Luo <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize PPE
 buffer management for IPQ9574
To: Andrew Lunn <andrew@lunn.ch>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
 <17d9f02c-3eb3-4bae-8a2c-0504747de6f2@lunn.ch>
Content-Language: en-US
In-Reply-To: <17d9f02c-3eb3-4bae-8a2c-0504747de6f2@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Oqth_QsftGBuhgXf9_XkLsBETwYRHjW8
X-Proofpoint-ORIG-GUID: Oqth_QsftGBuhgXf9_XkLsBETwYRHjW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_05,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=910 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190104



On 2/11/2025 9:14 PM, Andrew Lunn wrote:
>> +/* Assign the share buffer number 1550 to group 0 by default. */
>> +static const int ipq9574_ppe_bm_group_config = 1550;
> 
> To a large extent, the comment is useless. What should be in the
> comment is why, not what.
> 
> 	Andrew
> 

OK, I will improve the comment to describe it better.

There are total 2048 buffers available in PPE, out of which some
buffers are reserved for some specific purposes. The rest of the
pool of 1550 buffers are assigned to the general 'group0' which
is shared among all ports of the PPE.


