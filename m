Return-Path: <linux-arm-msm+bounces-68975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39619B2489D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E6A6189E1C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907972F7445;
	Wed, 13 Aug 2025 11:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lTiqdsfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FF74420;
	Wed, 13 Aug 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085189; cv=none; b=kpdjPlv5B/ZjBuer1aFv/aaInQQy6wWGJMHLzupCZzNFWn5plVdZJqAtCBEnVffyLAgmpbjthnpTyUnFUEVyiiS1tMDWSt3qiP4+sybzk5ZjatPUX7oBtrmJzFYmclh59bQX2wIXWNzVC7icXojI5z0keeJUfM5wm5lrhy3ZES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085189; c=relaxed/simple;
	bh=Zi6Z75oIMtn8beKtFputqAn8NKkyXzfJHRrfLH3JN/w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=FVtjUWZ9+WGlPEHEBahvRrsW2pivIK59IMwHqbKr8eKUd3ez8uaQCrfuBWZJkhIBzlgS/PiwDp5BM2GcjPFnRYbqIjVXAEVgc9TPRP4PhI+VgF5fjh3QrRffwifZXQBVEO44vZcZKY/0mjqIg8YBakGgup29/pD5wXCZ+FIwMQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lTiqdsfR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLbgk002778;
	Wed, 13 Aug 2025 11:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJq5xl9wnlbTfrwZF8n2U+4EQciaitdnUfm2jP4aBNY=; b=lTiqdsfRl1pFVuwm
	yg/nPzzH+T/3ZpVcXGcBcKvj6W4CUgQt3GrsWAXt0o25/nzrEC/gWww87fvRxrjy
	wkykHSme6IyOui/BEd2p6kDz3FySkuGb2mUcmj/Fl7V+mSa7i+btrZKEL8gE9oTq
	TUJP3Jt68qZ11KxOjR52tATYHhFCBVlcTtWyqMBGnipDC+5ETpUwEcfWNFrHf8kJ
	y1DJJi/0cSD122xtpTMXWa7jMqgN9NaHxV2vicnfJhiqDBN7vsWYBbxnZf1yHRG1
	l9SKICOO5cULnBCgKkljTu7u22HJka8Edre01kUYg1lbSxyfo+IEDwRFyMHRE/rG
	+JA73Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv3kk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:39:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBdUQo008472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:39:30 GMT
Received: from [10.235.9.75] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:39:25 -0700
Message-ID: <ccb022ab-45a8-4e97-8b63-4d2921ebfadc@quicinc.com>
Date: Wed, 13 Aug 2025 19:39:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Luo Jie <quic_luoj@quicinc.com>
Subject: Re: [PATCH net-next v7 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Randy Dunlap <rdunlap@infradead.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Lei Wei <quic_leiwei@quicinc.com>,
        "Suruchi
 Agarwal" <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
 <20250812-qcom_ipq_ppe-v7-3-789404bdbc9a@quicinc.com>
 <5ee33ac3-c23e-4da7-87bc-2a5ea6e93afe@infradead.org>
Content-Language: en-US
In-Reply-To: <5ee33ac3-c23e-4da7-87bc-2a5ea6e93afe@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c7973 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=yauDWUx4ckUadswYq4AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HPXd7wzleDymh-hJW_R1aw-SCfLCbgzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX5i13+qW4nDqh
 usNlwPqDoA5CNuTNowKAdonAV7zadljzx9q3fqcxT+1U2TJ07AUN/7VCjWN15jv3mbCvze9A2Uz
 QI4CwGUmrc62E2ULgQkvAOJuGB9UCEj7XUtOTo8ReP8uZjXUj7Bgn5qTfTCa+dbzSNWi5iCzo2a
 z6VUSqtH1stODts+15mlPPTJ4kD9k1TJh9yonz9Uqhceyx9MaoD5cbPclc6gAq9ArsbZJp44udY
 OjHGH8SMve90uCrZo52J30m8Rj3hHkOaiwQUYbLe94ZZ3e9vZS/j/J1JnOpnzk9gCVhyXBwKNmS
 GkodGwC94senKvc1Sy2Cv6boQGsLhbMsz2WwD0EI//G8DsPU1vRzGiR8Ws+yPTJxzv2/JQWBGrm
 nwqGpvKy
X-Proofpoint-GUID: HPXd7wzleDymh-hJW_R1aw-SCfLCbgzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/13/2025 12:54 AM, Randy Dunlap wrote:
> 
> 
> On 8/12/25 7:10 AM, Luo Jie wrote:
>> diff --git a/drivers/net/ethernet/qualcomm/Kconfig b/drivers/net/ethernet/qualcomm/Kconfig
>> index a4434eb38950..6e56b022fc2d 100644
>> --- a/drivers/net/ethernet/qualcomm/Kconfig
>> +++ b/drivers/net/ethernet/qualcomm/Kconfig
>> @@ -60,6 +60,21 @@ config QCOM_EMAC
>>   	  low power, Receive-Side Scaling (RSS), and IEEE 1588-2008
>>   	  Precision Clock Synchronization Protocol.
>>   
>> +config QCOM_PPE
>> +	tristate "Qualcomm Technologies, Inc. PPE Ethernet support"
>> +	depends on HAS_IOMEM && OF
>> +	depends on COMMON_CLK
>> +	select REGMAP_MMIO
>> +	help
>> +	  This driver supports the Qualcomm Technologies, Inc. packet
>> +	  process engine (PPE) available with IPQ SoC. The PPE includes
>> +	  the ethernet MACs, Ethernet DMA (EDMA) and switch core that
> 
> Please use ethernet or Ethernet consistently.

OK, I will update to use "Ethernet" consistently throughout the code.

> 
>> +	  supports L3 flow offload, L2 switch function, RSS and tunnel
>> +	  offload.
>> +
>> +	  To compile this driver as a module, choose M here. The module
>> +	  will be called qcom-ppe.
>> +


