Return-Path: <linux-arm-msm+bounces-44829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E472AA0ADFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 04:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00A57A3400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 03:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557891494A9;
	Mon, 13 Jan 2025 03:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oaja9uwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0B1465AE;
	Mon, 13 Jan 2025 03:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736739605; cv=none; b=Rb7S4o/y1IZ/Fff/+rbAPoTMiCnJyEE/YFrXzSPNd72QdGxY66N2n/xA+dJqZwqnOoi+UGfk29ZO5KnMsAkQVIPFywKcK/4VcgRiNUvraDerdGGxVhvkq45H7a55zOIPV/agOX8anZqnQROVcUIwQas5nqAhxz4GAOrMcCgK/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736739605; c=relaxed/simple;
	bh=OkYu8QtfWeI2FUHB8uxRKxkCO8XUDTF2vmK5MmhwTfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p3sCPzZ22aSVpAZWKhhjNXZPy1NYeu0fW8UsGasOOnbrDNk1iRw85f9mFKnlV8H/YxM5v+4qhlFQ22dQnjc4t6+ObKToWDwqgXiq6DEKJi33fPE+f0HBPJ1dPHAvQeaqn73PzXs7iUCk/yZCnBYfq1u95yseKob9pNcGMzR2iBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oaja9uwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CLxcBR000968;
	Mon, 13 Jan 2025 03:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G41VudNhZOLNdv9BEzJMaOPngvyidLagxXgJb6Cu6BM=; b=Oaja9uwC+b9EKbRY
	2iEJc8hd//Co9TapGM/Yb4CqenRw962hBRKmMapvSOykbtMm06rEgqZibfHxFt/e
	kPXTt66qmqtukM0jh3BlZD5Gfoic4yvMhpe+kJ9XjsHKG7MIYaumwAeUMsxC4H6r
	Pwg+C0E/8f5yK6tFJs+1iItfDiaVCXyFy70v3BtjK78B88/Y+btTUO1+NtvUpmPY
	aH3XBy47GeLkVnapZzexKD2ikaQC9sUmLWn5/OOaYS9XEfezcRDif1lo76hMsbZj
	N3xS6PEaj5PYMJ0w/OKqn9MOovuD/XtOdXXU22fKiPAQlPXNBG6O3oO0/peBqyST
	mLOxTQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hkfk2f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 03:39:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D3di6v003653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 03:39:44 GMT
Received: from [10.253.33.98] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 12 Jan
 2025 19:39:38 -0800
Message-ID: <c67f4510-e71b-4211-8fe2-35dabfc7b44e@quicinc.com>
Date: Mon, 13 Jan 2025 11:39:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 12/14] net: ethernet: qualcomm: Initialize PPE
 L2 bridge settings
To: Andrew Lunn <andrew@lunn.ch>, Luo Jie <quic_luoj@quicinc.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        "Pavithra
 R" <quic_pavir@quicinc.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva"
	<gustavoars@kernel.org>,
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
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <4dbf1550-32e9-4cce-bf0c-8b92dbd49b50@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B5LmC5PjFOmfpkabMs1GkQGiUwhPzDJ0
X-Proofpoint-ORIG-GUID: B5LmC5PjFOmfpkabMs1GkQGiUwhPzDJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 adultscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130029



On 1/9/2025 12:59 AM, Andrew Lunn wrote:
> On Wed, Jan 08, 2025 at 09:47:19PM +0800, Luo Jie wrote:
>> From: Lei Wei <quic_leiwei@quicinc.com>
>>
>> Configure the default L2 bridge settings for the PPE ports to
>> enable L2 frame forwarding between CPU port and PPE Ethernet
>> ports.
> 
> It would be good to have an 'only' in there:
> 
>> to _only_
>> enable L2 frame forwarding between CPU port and PPE Ethernet
>> ports
> 
> That makes it clear there is no port to port forwarding, the ports are
> isolated.
> 

Sure, I will add 'only' to make it clear.

>> The per-port L2 bridge settings are initialized as follows:
>> For PPE CPU port, the PPE bridge TX is enabled and FDB learn is
>> disabled. For PPE physical port, the PPE bridge TX is disabled
>> and FDB learn is enabled by default and the L2 forward action
>> is initialized as forward to CPU port.
> 
> Why is learning needed on physical ports? In general, switches forward
> unknown destination addresses to the CPU. Which is what you want when
> the ports are isolated from each other. Everything goes to the
> CPU. But maybe this switch does not work like this?
> 

L2 forwarding can be disabled in PPE in two ways:

1.) Keep the learning enabled (which is the default HW setting) and
configure the FDB-miss-action to redirect to CPU.

This works because even if FDB learning is enabled, we need to represent
the bridge and the physical ports using their 'virtual switch instance'
(VSI) in the PPE HW, and create the 'port membership' for the bridge VSI
(the list of slave ports), before FDB based forwarding can take place. 
Since we do not yet support switchdev, these VSI are not created and 
packets are always forwarded to CPU due to FDB miss.

(or)

2.) Explicitly disable learning either globally or on the ports.

With method 1 we can achieve packet forwarding to CPU without explicitly
disabling learning. When switchdev is enabled later, L2 forwarding can 
be enabled as a natural extension on top of this configuration. So we 
have chosen the first approach.

> 	Andrew
> 


