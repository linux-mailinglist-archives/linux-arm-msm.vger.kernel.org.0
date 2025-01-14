Return-Path: <linux-arm-msm+bounces-45004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F617A10569
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1CD3A42F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DDD284A64;
	Tue, 14 Jan 2025 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BZMf0cI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE3224B1A;
	Tue, 14 Jan 2025 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854202; cv=none; b=Kd7JVDNA8O4bQKrOhRU4HDHQOVByVRII6J+D4TeRjtbsBhw0RtlaeSz6TsWZLismffGM9v8FVqSe54p4w15zx8wylF9Z/VIuomO2q7cEO+3/O3tmGCsaAuXbxZiIflAj6Gr3H05UqCOTUQ7tK/p+n+G+0BeCUa5yqRamLiZbp8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854202; c=relaxed/simple;
	bh=jVoYk1AmULzhUU8WlSEvj9i7fgoomwuf9PP0j4l/piw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nbauK/yeD11WQ+VhDm/8dn3a5GitR3x02FTMQDvU1QN+F776O9fBDjlmhcO1lCbbKUlAH/muE7zvazrHp2B98S9s8MJqTTqzRqneolxxuZ9suQmBf1c1ili1ypzROm4vS95k61CSonmLgFHpLHxTQ/F7MVyKMyfXalkErEV34w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BZMf0cI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E8Conq028872;
	Tue, 14 Jan 2025 11:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2n3EadQ8u+lFGYjWg3XzykC7KMKSjEnNBtScXvNI6y4=; b=BZMf0cI/9k+ijul6
	U4F55LdE8JjDmwuRNgHOKFMf4vPdGivdec456UvisFF4Sbvptg1VddRmT7u+2S8t
	Md0O8pMajmIYP7ZmlYKMcwuYYN62sZHB8i19rLbbOkJG3bEnnG3CfmhM/4B3n6UL
	lliMKE8EzCPXuYKZXoTehPhOIvRnsDsnMXxIIWT9cmp1CE58AXWuUQE39/bQqOHS
	p5NQfiwDnX/6CDtxsDSjJXbZrPU4l6vsqltjIpxStJdSPmCEJGbj9RtAQ4KCSJg+
	tPWE9nMEXqe2U69Updsm5neUjVYoFIpSo96lpr4bOkq3LiiAe8lZKru4wjQBtwsF
	s0X0Qw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445m7b0d5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 11:29:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EBThfr031183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 11:29:43 GMT
Received: from [10.253.32.159] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 03:29:37 -0800
Message-ID: <4599e35b-eb2b-4d12-82c7-f2a8a804e08f@quicinc.com>
Date: Tue, 14 Jan 2025 19:29:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
To: Andrew Lunn <andrew@lunn.ch>
CC: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-12-7394dbda7199@quicinc.com>
 <4dbf1550-32e9-4cce-bf0c-8b92dbd49b50@lunn.ch>
 <c67f4510-e71b-4211-8fe2-35dabfc7b44e@quicinc.com>
 <8bdde187-b329-480d-a745-16871276a331@lunn.ch>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <8bdde187-b329-480d-a745-16871276a331@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xn8srb3T476UNFJ326d45w4emPi_uQ39
X-Proofpoint-GUID: Xn8srb3T476UNFJ326d45w4emPi_uQ39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140096



On 1/13/2025 9:37 PM, Andrew Lunn wrote:
>>> Why is learning needed on physical ports? In general, switches forward
>>> unknown destination addresses to the CPU. Which is what you want when
>>> the ports are isolated from each other. Everything goes to the
>>> CPU. But maybe this switch does not work like this?
>>>
>>
>> L2 forwarding can be disabled in PPE in two ways:
>>
>> 1.) Keep the learning enabled (which is the default HW setting) and
>> configure the FDB-miss-action to redirect to CPU.
>>
>> This works because even if FDB learning is enabled, we need to represent
>> the bridge and the physical ports using their 'virtual switch instance'
>> (VSI) in the PPE HW, and create the 'port membership' for the bridge VSI
>> (the list of slave ports), before FDB based forwarding can take place. Since
>> we do not yet support switchdev, these VSI are not created and packets are
>> always forwarded to CPU due to FDB miss.
>>
>> (or)
>>
>> 2.) Explicitly disable learning either globally or on the ports.
>>
>> With method 1 we can achieve packet forwarding to CPU without explicitly
>> disabling learning. When switchdev is enabled later, L2 forwarding can be
>> enabled as a natural extension on top of this configuration. So we have
>> chosen the first approach.
> 
> How does ageing work in this setup? Will a cable unplug/plug flush all
> the learned entries? Is ageing set to some reasonable default in case
> a MAC address moves?
> 

I would like to clarify that representing the bridge and its slave ports
inside PPE (using a VSI - virtual switch instance) is a pre-requisite 
before learning can take place on a port. At this point, since switchdev
is not enabled, VSI is not created for port/bridge and hence FDB 
learning does not take place. Later when we enable switchdev and 
represent the bridge/slave-ports in PPE, FDB learning will automatically 
occur on top of this initial configuration. I will add this note in the 
comments and commit message to make it clear.

Regarding FDB entry ageing (when switchdev is enabled later), MAC 
address move can be automatically detected and old entry flushed by the 
PPE. However for link change events on a port, PPE will rely on software 
to flush FDB entries for the port.

> 	Andrew


