Return-Path: <linux-arm-msm+bounces-62795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA34AEB885
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59CA63B13F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17B42D97A5;
	Fri, 27 Jun 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hocJDutv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09196202990;
	Fri, 27 Jun 2025 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029831; cv=none; b=VaMYUrlvYfHUrca54UBCRItHFq6nMoRV1dPOJRz4/53dFClkVadyfCmT6YmBlqgZlSv5MAnMiUHZ+fbxhX7v1maWTzmQpzS4GHjgXHsW1HcmOjtiEaz9Qzi813z4uWhzAqXVGoW+lEoJp8SF8BC3AzPk1nIZwnXQ4TmO9nKkNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029831; c=relaxed/simple;
	bh=EU6rzZpIo4j5dlTyXyTHIhEa0pO8W4YYw7qOOJcTbcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IkJ6gAqBzwcAJ2fS+nhXxcTFdKuOgS4b5Im7JkHA+l4sy3FHIQXcf7ZHAxnbJjGpm2UT0WA+SbMdERWlXQIkjOt/3KWlI5qoS7qZtWsY+TMzBIylS1qJs8zXg5BjvtBvqQlYzoyC2t7cazKuGbBr+GpdTI2q9gSlLnPab/cfaH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hocJDutv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCVi4j017788;
	Fri, 27 Jun 2025 13:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDG00EkjEh3bma8Q4f9gmlreWFewikr8gPDiqssRLkY=; b=hocJDutvmHI9+JM3
	5pkvhurfljuXjpD5QQ8eZQ6VotDllbwdctnzwZ9utDXOXCRkWZLB4SNOQJerc8EC
	Mk1NjwD3C1D1uULIQyhCNOLYKpTW8X2eHazvhZvPPRTCpGfn1D34JfA3aiIQWpat
	vesGYlzjVmwF9u653QyzoLm78BDIgO5azPY7/srwxe9Nc4Y8s1jX/wOvp+VXCeyZ
	Pgbap0XQnC7kg8AVk4Eafi2BuhQ5kyEzcPjW8d/iTVJLON0kaq7nfzaxN/mz5rZC
	DlMs3Ff+cyefsdkBB+LlE0xjV4zCzJ5VaxQAYxJqRsmOfwVs1fddQC7NtgO16KVg
	T2YJ8w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5893-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:10:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RDABxX017812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:10:11 GMT
Received: from [10.253.72.156] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Jun
 2025 06:10:05 -0700
Message-ID: <1540e0e2-0965-4f75-a1ee-3c7932dc6856@quicinc.com>
Date: Fri, 27 Jun 2025 21:09:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 02/14] docs: networking: Add PPE driver
 documentation for Qualcomm IPQ9574 SoC
To: Randy Dunlap <rdunlap@infradead.org>, Luo Jie <quic_luoj@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suruchi
 Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, "Simon Horman" <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees
 Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-2-95bdc6b8f6ff@quicinc.com>
 <7553d675-622a-4eb6-a216-2eff2f5fe3b0@infradead.org>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <7553d675-622a-4eb6-a216-2eff2f5fe3b0@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nXP9cA13AiSX-LUWaPOx63iW6Xh2_DYC
X-Proofpoint-ORIG-GUID: nXP9cA13AiSX-LUWaPOx63iW6Xh2_DYC
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e9834 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=agGY99B2A-NLY_Y6YGoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOCBTYWx0ZWRfX93EDd71st98B
 6iTamst464UNzP/Tb16Qjo58atvQnga6dbkNTJsWU770/Fjm0e2+rZm/roj1sYHVyYtZlLoQ2c/
 PTuk614ToLlEj91kNG9IkxddF6wy2Hk2PmzIBM5jaUZy3eNMh37iKv4/YKj3wKyIiRJ/spUOnkL
 i1AaH/UcvnqU5RP/kwacdClbiMJwnR0mZWDM2GgPF7PYv6RKEyABtRuV+DsKdXs4mjju6IpY+Dh
 mxaY52y+Usi4TkIxH9hGh9zLRHDbcWgT62o0qSTQjJgsPU7C1GjVQyBNycIn9HxprovnNsuU7P+
 LVc9WIp9BXRc4JzUIrYtJurDd7fe7UlQru43nbGJegWNDbuN2Q/P/8Gmw8VYpLdciQJZmFppYYV
 fRJyKajQZ2tIjsgsnzCXQJBLRmdQI0o+jz93w62IqXr+uEtlVO4ybZ1U9OHwHfD0lV/iQPDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=920 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270108



On 6/27/2025 6:02 AM, Randy Dunlap wrote:
> Hi--
> 
> On 6/26/25 7:31 AM, Luo Jie wrote:
>> +Below is a simplified hardware diagram of IPQ9574 SoC which includes the PPE engine and
>> +other blocks which are in the SoC but outside the PPE engine. These blocks work together
>> +to enable the Ethernet for the IPQ SoC::
>> +
> 
> [snip]
> 
>> + | |              +-------------------------+ +---------+ +---------+         | |
>> + | |125/312.5M clk|       (PCS0)            | | (PCS1)  | | (PCS2)  | pcs ops | |
>> + | +--------------+       UNIPHY0           | | UNIPHY1 | | UNIPHY2 |<--------+ |
>> + +--------------->|                         | |         | |         |           |
>> + | 31.25M ref clk +-------------------------+ +---------+ +---------+           |
>> + |                   |     |      |      |          |          |                |
>> + |              +-----------------------------------------------------+         |
>> + |25/50M ref clk| +-------------------------+    +------+   +------+  | link    |
>> + +------------->| |      QUAD PHY           |    | PHY4 |   | PHY5 |  |---------+
>> +                | +-------------------------+    +------+   +------+  | change
>> +                |                                                     |
>> +                |                       MDIO bus                      |
>> +                +-----------------------------------------------------+
> 
> Does the 'M' on the clk signals on the left side mean megahertz (MHz)?
> I guess that it does, but it was a little confusing when I first saw it.
>

Yes, it means megahertz (MHz). I will update 'M' to 'MHz' in next update.

> Thanks.


