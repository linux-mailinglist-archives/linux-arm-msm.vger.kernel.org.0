Return-Path: <linux-arm-msm+bounces-47596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B602A30D93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76ADE7A1A86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9E824C66E;
	Tue, 11 Feb 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fV7q/2hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA71F891F;
	Tue, 11 Feb 2025 14:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282569; cv=none; b=VxEScjwyNF3y/srtqF+nhfzvnB0N+4U3FPERdbnoP/fYXTylKPQqm0Srh3SlC70Chyav5YEM+uq/6dzYoosL+IsQPXcMpJhZg4fMIRdZqMMmqUPw7pHgBu5XFw/6ddUrMbFex7qQJHES0Yfj62NdoMDU77spX91/JyFGs1LexxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282569; c=relaxed/simple;
	bh=7jlfU3ip+GMUxJ36MXpx96ZSflQHiVP/ve9BKsz1H3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PuXeVH/7THtc3jYH81Pf5JlyN0BJD6TE4378a30VtJSkrCEyTnFz6VZmHL8Jx2HJV07tfxsEsRoAOl+UHwSS/j+bh/E45dMgqmaMdK1fpZyKCcoAciHL4XVE5w+Bg88e8zN2vr9yedeROasHx1Bj4ULRVTYin2B8y3ZRfPbXZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fV7q/2hr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHxQH026628;
	Tue, 11 Feb 2025 14:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUBY0PBT5tLd/VwJCOYY9xpuE/V5lD5RoJMSdRYbAAI=; b=fV7q/2hrxTQixCzw
	qMNYpCeMWNWekSO+uUa0y1sfeqbagJZhSsrWnzYxJmbUFtx1+sDnMFAsXjqHxRve
	sMzb891Hs9zKJVbWaAtaSr0H6mXcH7AKAqnsw+BuGJf23oMSgJWuZfbZxc1VmaMY
	EKxFqmhxQf0Q2M4/h9rHK6OjHfuKgYlCkvNYy6oq7vq0ar8Vu/17r4rAFmMDb4q+
	8YnuaVtdeWE9lKaA+8935X8+F9JciCk61l8C/aqW/DBv45fJKPN7I0IXvijYuYOB
	vxoDPjyCVv45RFTnT5fm28hwQfjsFRuQWAyyK/8U9y4h7ElBa5kyoezwAjxvzoPP
	UdQyhA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58h55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 14:02:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BE2VTW025918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 14:02:31 GMT
Received: from [10.253.10.118] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 06:02:25 -0800
Message-ID: <67a85d26-fc4a-4203-91e3-bf57a8f3a23e@quicinc.com>
Date: Tue, 11 Feb 2025 22:02:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Jie Gan <jie.gan@oss.qualcomm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-1-453ea18d3271@quicinc.com>
 <383599d8-d124-4c5a-8253-43502702e748@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <383599d8-d124-4c5a-8253-43502702e748@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hx7mFNYuU1xdrnEYVqd15h-2egBCuk59
X-Proofpoint-GUID: hx7mFNYuU1xdrnEYVqd15h-2egBCuk59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110094



On 2/10/2025 10:47 AM, Jie Gan wrote:
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574- 
>> ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> new file mode 100644
>> index 000000000000..be6f9311eebb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ packet process engine (PPE)
>> +
>> +maintainers:
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +  - Lei Wei <quic_leiwei@quicinc.com>
>> +  - Suruchi Agarwal <quic_suruchia@quicinc.com>
>> +  - Pavithra R <quic_pavir@quicinc.com>>
>> +
>> +description:
> You have multiple paragrahs here.
> description: -> description: |
> 

We do not need '|', as this literal description does not need to
preserve formatting.

> Thanks,
> Jie


