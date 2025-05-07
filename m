Return-Path: <linux-arm-msm+bounces-57042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11065AAD465
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB884E72CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 04:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C641D5170;
	Wed,  7 May 2025 04:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cYsthnEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E22AD20;
	Wed,  7 May 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591990; cv=none; b=n1SGkuiCL6dbFwn0MxT1ldxULWmKlnnBZalHqSKWkShtsYbvYbXrcwYw7WUAf7AtO3dsJwjZFVUf6Qw2S2VAB4iaYd9+C4rFUueszKeWP+HoqvU3y3Sy6W+7hK2adaYUnfTVuEsqPRrJrHj5aPXpv3pz2NVlnDvYKSThUex8lFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591990; c=relaxed/simple;
	bh=biF5yZ3vpTesxPZQ/tMvL//RmTWjtQ1ORzVQuydb0NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UB0s17UYoMdEyOY2vsYdyNiUU2r5NuHuVP1YgDQyRSir4U4kbO6ykeZychK6liv7rI+eJsfTGZhcPOK7lC7fB8X60URjgac1hm7wlY/BmgDWAoADpRH1zBwZYq2n/VKX9CQJBNSWhpZFGdmbGeM5dMbFRCg2cH3JQ+Ujew9DJpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cYsthnEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H7as022467;
	Wed, 7 May 2025 04:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5+yz2q+hUjul7s+z3seVWpaNFf3JvMrntHxV3Q7ywU=; b=cYsthnEgQT6uuH85
	voUoWZX9T64x/CmZfJIsMuSk+jtd0lhIB0416//UWsT1hlzD5fR2VepAo/O5VYBg
	ruRxySyVdsdkP1BsQtXtc5IgqGdqxyGekrLu1Si0iTVHdceA1YA5iBUux6psAw4V
	ihA/LhTzd9SCsJ1RPrnoNPVZkGNUwbRvtSV6m1kKXXRR3xiPVeil8lSqkxFT+AWe
	VFiunBxKhC3M7qPJ/VxQXjrxE6H4/cLQMaU82r+G84gN8zkpqCHZLSH7KE4P9M7q
	8twsANwqRlT9GNHFqJWj1si04dNWjDQSw7jo1Aviyonk7fLtZRXIHyIxL2Y0UiaM
	ilm6Rg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuvf4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 04:26:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5474QFb8006724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 04:26:15 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 21:26:12 -0700
Message-ID: <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Date: Wed, 7 May 2025 12:26:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
 <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
 <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681ae0e8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=8OJl2JkUM1ULYFJJg_AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kIw5FctbMkclmRq0boSizRbNIFFYcxRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAzOCBTYWx0ZWRfX7DEhrK4ha02a
 otfpaBPjG9HTwWMRjm99Wtn+0dYOimkZd+rNDcRZJEVJtvXkEKks21o6IDvUnC804FZZt9TuzPf
 BDU4wfBEPIacRrAMiHoJQE8OEbbipMmN4N9vIAEBBGiCOgSOQPbFHsqepeOGt0/yPF9o8+YgzpZ
 fyco5V+MbdIcvGKt7ITQCL3YXcFgUFUuOF67ThJMeciF86jQOmAUHMMD26cab/aOhcV5gnjvoUM
 DJBEDw4eHCHGr/r05169oX0BC5o9XvY6OdEPhp7+O6mAp/9mUnTYNDugH2kjU11XkEsqeyoU675
 ICDQdJNfU89az8rmdshWvSbub5CAninyNYPXZwl/7nEeSNsr35JJ0XwOIbLjFuG7Bn+hQFj6kGc
 yRebftKHoxCnPKSwRKAzDZZH64Tvmnzx3/XzuxZPLiC8QszAvIVHUUW9fhFRpmPKeqyyKm9U
X-Proofpoint-ORIG-GUID: kIw5FctbMkclmRq0boSizRbNIFFYcxRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070038



On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>
>>
>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>> and funnels. It aggregates the trace and transports to coresight trace
>>>> bus.
>>>>
>>>> Compared to current configuration, it has the following advantages:
>>>> 1. Reduce wires between subsystems.
>>>> 2. Continue cleaning the infrastructure.
>>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>>
>>>>     +------------------------+                +-------------------------+
>>>>     | Video Subsystem        |                |Video Subsystem          |
>>>>     |       +-------------+  |                |       +------------+    |
>>>>     |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>>     |       +-------------+  |                |       +------------+    |
>>>>     |            |           |                |              |          |
>>>>     |            v           |                |              v          |
>>>>     |   +---------------+    |                |        +-----------+    |
>>>>     |   | Video funnel  |    |                |        |Video TNOC |    |
>>>>     |   +---------------+    |                |        +-----------+    |
>>>>     +------------|-----------+                +------------|------------+
>>>>                  |                                         |
>>>>                  v-----+                                   |
>>>> +--------------------|---------+                         |
>>>> |  Multimedia        v         |                         |
>>>> |  Subsystem   +--------+      |                         |
>>>> |              |  TPDA  |      |                         v
>>>> |              +----|---+      |              +---------------------+
>>>> |                   |          |              |    Aggregator TNOC  |
>>>> |                   |          |              +----------|----------+
>>>> |                   +--        |                         |
>>>> |                     |        |                         |
>>>> |                     |        |                         |
>>>> |              +------v-----+  |                         |
>>>> |              |  Funnel    |  |                         |
>>>> |              +------------+  |                         |
>>>> +----------------|-------------+                         |
>>>>                    |                                       |
>>>>                    v                                       v
>>>>         +--------------------+                    +------------------+
>>>>         |   Coresight Sink   |                    |  Coresight Sink  |
>>>>         +--------------------+                    +------------------+
>>>
>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>
>> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
>> from Source to sink. In the example, only the aggregator TNOC has traceID.
>> Decode trace relying on TraceID + Inport number.
>> It can has mutiple TNOC/TPDA in one path.
> 
> So do we only describe the TNOCs that need traceId in the DT ? (e.g., Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
> trace id for it by default, when it is described ?
> 
> Suzuki
> 
yes, now only describe the TNOCs which need traceID, Video TNOC is another type, it is interconnect TNOC which collects trace from subsystems
and transfers Aggr TNOC, it doesn't have ATID. Its driver is different from this patch, I want to describe it when upstream its driver.

Yuanfang







