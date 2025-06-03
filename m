Return-Path: <linux-arm-msm+bounces-60082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D22ACBED9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 05:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64EA93A203E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 03:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D95217BED0;
	Tue,  3 Jun 2025 03:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B3hhedS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC7154BF5;
	Tue,  3 Jun 2025 03:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748921003; cv=none; b=LJgIfrbDV01B02+Hc7bH0du4w9t/brKw8ac5q0xTtBPCZZ9ebG/8rpM3wlAZV+uVYW36LaNCJkRbrGlU/N7ULhKnAYolzRfvBviI20lcvV1QN1ro8b2ZYREivXc+58e9+0VLSpXiR9VX11pze2TCmhDWjXS/AXuzxQwoFnOH2oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748921003; c=relaxed/simple;
	bh=0rEg4DrplYKhUWOwuGj5vyZesTcBcoXsJW2uFI5e+pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AVeqizCZfah+mVz3G2WjT0pr5bMwu15h+YyJvKCZkYykE6csmiLtXAJDCJ8OK8mBCkGXHKHNxg+AckKl13DP3QQm0TyjQKuI7TdKMskxQFeAu39iRAP6VpUf/7RDv6zJHpqoVVpDcT7+EvcQrxOyJ5ii/GCQI46YyCyrxGX3Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B3hhedS/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJp0J030985;
	Tue, 3 Jun 2025 03:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B6I9aT70ThpCc4Zm1RlBMipp1lBbPvY+r5gRPRkVScQ=; b=B3hhedS/CcDX82iD
	e2s36lpftIWnhrU1i8zqdexrzpdkRGoUiLrJ4Gz1OTNJodqoEF41SM6RQETSia1u
	hJ5oMJi1lz/uODyY5Vw2eK27wanW0nr0ASonfWKBQ8UUpxXyjugz34Uq4zRkrvQS
	UPJtbjVxa/L4U+7W7MvO2XMRI+pfbjRUseVeyPeLI73GMWl6KeOGXW3PfV83+8XB
	IQ28tD0qCEEmBjcmnZwU+imWKu/nLNoYjAZhg7S437y2eSymSzTj+w9EbkyfvBz4
	tZzSBsJQeCD/4kwtJ2B8FoORDamx2M9sihdq5aKa4UHiFO8oI55NY+VfDYpshPaL
	OgERTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ts56v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 03:23:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5533N4EI001090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 03:23:04 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Jun 2025
 20:23:00 -0700
Message-ID: <eb7dbabf-d878-468b-9945-36d8b14a4e65@quicinc.com>
Date: Tue, 3 Jun 2025 11:22:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
 <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
 <20250530125944.GB666854@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250530125944.GB666854@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zxbsBjZotBgpF1CDtEDMk5fOTP9tTSlt
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683e6a99 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=roaXpTnMcXxoyfGzR8sA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyOCBTYWx0ZWRfXxwg1tayofc/q
 3S7cFoWgTyC39NeeXOlsLXf9mWyGBQyI6YyVe14X9Fr/+5/hqT9COz4ZinJ9VIiHVnyqfqtitQk
 Z+udSGq2OIr19MRHXRm6IJL9V2f4nFDW6dnHZSwsVExW8yOpcV+ynL0YaF77/HhcIYfj17hkdtS
 7azvHwhWvBOnN9qUNRClLbEvZStx5ef7jTl0eEABNvE4clIAdovDNNB2VtW4qtQFkX/HacYxA8V
 wrKc8x5+5LIIpyAkVsbwMAch29yJjcOJx0fSWuAAcmmmefniPTX6FLzcPAMPKZj+/EInWnqtqTo
 4OHvhcMZOxE5cZG/qaubsGPc7wEAmTgl/wAsMAvpBe8xNcz+XZftoUjtrA0ow+kDMnwxXwXQVY0
 2/ASQhbEaoPzxEBq5s+zrZwG5r9vYKDJxOuqmcIzgj8LUpslHheD/uLXLO4s5rkvS/PGkzK/
X-Proofpoint-ORIG-GUID: zxbsBjZotBgpF1CDtEDMk5fOTP9tTSlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030028



On 5/30/2025 8:59 PM, Leo Yan wrote:
> On Fri, May 30, 2025 at 12:32:23PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>> 2) How does the source driver know the TraceID for exposing via sysfs ?
>>>> Does it expose its own traceid ?
>>> No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
>>> TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
>>>
>>> Here is the patch to expose id in source:
>>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/
>>
>> Please don't do that. We don't have to fake a traceid for all sources.
>> It is only of use to the decoder, with manual input from the user. So,
>> someone using the TNOC based system must be aware of how to collect the
>> traceid and as such expose it from the TNOC and not all the other
>> sources connected to it.
>>
>> Simply expose it on the TNOC device node
> 
> [...]
> 
>>>> Good question, since we have the "path" maintaining the TraceID, we
>>>> should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
>>>>
>>> yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
>>> To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.
> 
> If the Trace ID is only used to identify a TNOC, I am just wandering
> if can use self-contained method.
> 
> For example, you can generate a ID number based on the register base
> address, something like:
> 
>    /* TNOC physical address */
>    drvdata->paddr = res->start;
> 
>    if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
>        drvdata->atid = (drvdata->paddr >> 32) ^ (drvdata->paddr & 0xffffffffUL);
>    else
>        drvdata->atid = drvdata->paddr;
> 
> Then, you can get a unique ID for each TNOC in the system, and the
> ID is determined by the pyshical address and can be calculated
> directly by decoder.
> 
> Leo

Using both dynamic and self-contained IDs within the same system can result in ID conflicts, which may cause decoding failures.

