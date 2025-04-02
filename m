Return-Path: <linux-arm-msm+bounces-53006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0AA78A1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74ABA7A287E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431E123535C;
	Wed,  2 Apr 2025 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hIUC9uBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AC0234973;
	Wed,  2 Apr 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583010; cv=none; b=fS99ewqn9sepqLYdbD46QThBcJZJP+YHaHVe7PuX5b+ofo8sCOwZWAoUSkngfi9m1ucahVYszvOKHCDUpzGVrZ1JAOdtHsltg5+QiEyQkITw5k781bmQcgl1BGQKFN/w93W66OJ3fxazCYExKswOyZOoM7aluXUmJBVqpgksJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583010; c=relaxed/simple;
	bh=xMDFVO13IET0puhB2hPIb7ZAxgTcZW/65nx8wRbcD1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J8nLqJnxZRnFW3kG9NZI+Zv4eNhb/i5PNFRdJHj50xe6NEUQPccmtuIt3XBm0yhq6caJAtzpuc47VyCNXRpyYqmBagW0cjbfl8A+fuyW3sMeX3bdefk6c7LBYxKoIIvO6d9aMY3MuMPL7T1jfTu/m3piIZiY2UG4i954w1/2PgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hIUC9uBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5324ZaRC012757;
	Wed, 2 Apr 2025 08:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cV/25+M3mVCF1xGJGR6r9EgMoCqdCNdpGsojXDr1yEU=; b=hIUC9uBYbE+K/2hx
	EiCV5R48bOepeVoediCtYby0kgElzgVOYY9ALXhlK7GmuMyxwjvCr9yF1ZayiuEO
	uHyG9vtkqcZ+OIv9GEGj/VLpo46olBgMFZd15V8BOatQN1DBU7UQkGpxD4iNpc0D
	lKvwNrUDi3l20xp/G7+OXD2LaRIg4Hz3LoJjdGU15zzB4PNIww2oXUBScD6mGd9M
	l5t0b4Y/r1PfdHnJn2ofl0RRyrEkkFLsOqKyHTvI63IloYBGbrnhGSMMW+J5wFZ8
	49uOPz2M7zNrlL7fLrQTrsktqEkK6uwraaTLTNG0CVWH3E/cX343l9hl8ZSwbEls
	eJezSg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxbf0ma9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 08:36:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5328acRO028342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 08:36:38 GMT
Received: from [10.133.33.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Apr 2025
 01:36:33 -0700
Message-ID: <731bacf0-a0b6-4dfd-aff0-01723a879a7c@quicinc.com>
Date: Wed, 2 Apr 2025 16:36:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in
 coresight_path
To: Mike Leach <mike.leach@linaro.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        "James
 Clark" <james.clark@linaro.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
 <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
 <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
 <92dc9b50-5e58-4cfd-a78c-e32a4bec8e26@quicinc.com>
 <CAJ9a7Vjhm5B=3mDHQpuRj2JSE1hfYzOx5wq-yQcC3k+QqEcvAQ@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <CAJ9a7Vjhm5B=3mDHQpuRj2JSE1hfYzOx5wq-yQcC3k+QqEcvAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h9cPj4DcIr7JbeRIHrqO8skenXZKCKkZ
X-Proofpoint-ORIG-GUID: h9cPj4DcIr7JbeRIHrqO8skenXZKCKkZ
X-Authority-Analysis: v=2.4 cv=F/5XdrhN c=1 sm=1 tr=0 ts=67ecf717 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rk3Ip3wbNkCNmIt9PQkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020054



On 4/2/2025 4:17 PM, Mike Leach wrote:
> Hi,
> 
> On Wed, 2 Apr 2025 at 01:50, Jie Gan <quic_jiegan@quicinc.com> wrote:
>>
>>
>>
>> On 4/1/2025 5:56 PM, Mike Leach wrote:
>>> Hi,
>>>
>>> On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
>>> <anshuman.khandual@arm.com> wrote:
>>>>
>>>> On 4/1/25 07:12, Jie Gan wrote:
>>>>> The trace_id in coresight_path may contain an error number which means a
>>>>> negative integer, but the current type of the trace_id is u8. Change the
>>>>> type to int to fix it.
>>>>>
>>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>>> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>
>>>> LGTM
>>>>
>>>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>>
>>>>> ---
>>>>>    include/linux/coresight.h | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>>>> index d79a242b271d..c2bf10c43e7c 100644
>>>>> --- a/include/linux/coresight.h
>>>>> +++ b/include/linux/coresight.h
>>>>> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
>>>>>     */
>>>>>    struct coresight_path {
>>>>>         struct list_head        path_list;
>>>>> -     u8                      trace_id;
>>>>> +     int                     trace_id;
>>>>>    };
>>>>>
>>>>>    enum cs_mode {
>>>
>>> There are many places in the Coresight drivers that assign a u8
>>> traceid from the path trace ID.
>>>
>>> e.g.
>>> In coresight-etm4x-core.c : etm4_enable_perf()
>>>
>>> drvdata->trcid = path->trace_id;
>>>
>>> drvdata->trcid is defined as a u8  - the reason being trace IDs are
>>> 128 bits wide with some reserved values.
>>>
>>> Will this not just trigger the same issue if path->trace_id is changed
>>> to an int? Even if not it is inconsistent handling of the trace ID
>>> values.
>>>
>>> Trace ID errors should be handled by returning an invalid trace ID
>>> value - were the trace ID value will fail the macro
>>> IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
>>> error return in a function.
>>>
>>
>> Hi Mike,
>>
>> The path->trace_id is verified after it has been assigned with the logic
>> you mentioned:
>>
>> if (!IS_VALID_CS_TRACE_ID(path->trace_id))
>>          goto err_path;
>>
>> So it should be safe to assign to another u8 parameter, like you mentioned:
>>
>> In coresight-etm4x-core.c : etm4_enable_perf()
>>
>> drvdata->trcid = path->trace_id;
>>
> 
> It is safe but will it not trigger a warning just like the one you are
> trying to fix as the types are mismatched?

Hi Mike,

It should trigger another type mismatch warning.

This patch aims to fix the situation like assign a negative value to u8 
will cause a integer toggle(it may happen and I think I should fix it), 
e.g. -22 for 234.

Thanks,
Jie

> 
> Mike
> 
>> Thanks,
>> Jie
>>
>>
>>> Regards
>>>
>>> Mike
>>>
>>>
>>>
>>> --
>>> Mike Leach
>>> Principal Engineer, ARM Ltd.
>>> Manchester Design Centre. UK
>>
> 
> 


