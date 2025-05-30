Return-Path: <linux-arm-msm+bounces-59873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2D1AC8C1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 12:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4FC1BA16FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBA42222C1;
	Fri, 30 May 2025 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OqwPchuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42471DA5F;
	Fri, 30 May 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600907; cv=none; b=egunZRfq4HJlKLnLygsr3eJLqtLEB2r2XcikjI/rIZBDmCK1KJLoDZp3zTtN6NHe5whKgBuz9OLsj2gNmljr0qqOoIM5PBRbO2KzUhJTrGVoKjMsR8NBsXW8aBR10rsER5saxEKUbdGJRsp9BSs+VzhbDM1jFbASfDQbYBVpHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600907; c=relaxed/simple;
	bh=45d9iV4MqNSrG586a9RU27aF4aPbOpcp4hQDGkfnGxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kElDALmttN9KDJTLA4RFUOs2ekaN3U3LTy3nPLH3kc8dshJLlHFX5s+2BwyxaqvQgQvC0hoWLCBXLkek7mhdmcsrKnoEy8CICQYqkCJ6pxqtUEkZguA9IBhERBKJ6k9+DJIxad8P8QSmoXE74FO5Q91XHby+C0/fpks64G3mGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OqwPchuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0dhw6031636;
	Fri, 30 May 2025 10:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A51p7QqjaXVhq/X6ZId6qxk/TZtmy9x/0PBeEDiqRug=; b=OqwPchuX4ruA4Is+
	fWPQeqkXbn5AdVNH0OZI+Of8ObYImuqrPB26lMmOi0RimzTMwy/HPHRRMPA7a90k
	+zahYakljIiHOue5qvptLmz2cONxm6i00E1Ys2PHHrEsCRsFJOJxaA6H+evsXHbo
	1/EtW9B8KGfsn0j1PqLjZESv+N+EVURRVoExrFLap8ob2vShfEeL8/YpmfYVGfl+
	xdGsNbVTmK8FTlQ1WX1P0XUNe70YSYRh5Aml4whBYaGQlBuH3ptiBS4a6TD+Kda+
	+AsSnlpjriPdDwqfG9RdsC4VA2yJMhTij91Gai4GYh+nVBDLhIuAb6AhApzHIDOr
	7BUkwg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk0qg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 10:28:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UASD9I009759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 10:28:13 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 03:28:10 -0700
Message-ID: <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
Date: Fri, 30 May 2025 18:28:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>
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
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839883e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=r03utmzGDo6xATuXh-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IW1NTlKSK6P1c9yx8AtZwPR1z2zQiOt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA5MCBTYWx0ZWRfX+hgg0vSkh/9I
 UooJahbzKz+/d79vt0JomJfOtdXN04i+OIocJI2NfHTgmz95teSKUR+5BirWFFdv/h4QyWnDpFL
 UtnrnOnIs+tz0ZIkORtqRbAn/TAk42k6aEXB0XzgwjylUPCIgIP44Afh/EGW2gMo7y/zqnH8o09
 Gu2oC1Q3eb3Wer6+T/y9N2SuIw87qpHDPGDsFBgg4VvBZVfzPvuRCBQAgy9mbtV3CVU3LohNZVA
 QroHeHuJNV4VPt6C2//7wHxv60WROK7CJUd4Vm0ZpDBELLccFIfD72CJGbU2w9Oi/iZ3jEcTlYn
 pZ20YQVOn7GJiMdpHDpSLOF1XZHHC+zbXbrS/yAFxgyjFRtWf1AAMttSNg2MeWMqFaLuCihuAu2
 agYZrhu8nio03cUD1PbyQm+MKusxZkJKarMwWrA85bueBehneptlW7Le/muoAmcvL4KMYNH3
X-Proofpoint-GUID: IW1NTlKSK6P1c9yx8AtZwPR1z2zQiOt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300090



On 5/27/2025 6:19 PM, Suzuki K Poulose wrote:
> On 23/05/2025 09:56, Leo Yan wrote:
>> On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:
>>
>> [...]
>>
>>>>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>>>>> +{
>>>>> +    int atid;
>>>>> +
>>>>> +    atid = coresight_trace_id_get_system_id();
>>>>> +    if (atid < 0)
>>>>> +        return atid;
>>>>> +
>>>>> +    drvdata->atid = atid;
>>>>
>>>> Do you need to expose this via sysfs ? Otherwise, how can you map
>>>> a trace to a TNOC at decoding ?
>>>
>>> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
>>> this TNOC. so dont expose it on this driver.
> 
> But why ? How does that work ? The packets that come via TNOC (irrespective of the source(s)) will have the same ATID as that of the TNOC. So :
> 
> 1) How does it help if the source exports the ID that was allocated in the TNOC driver ?
>
The sources connecting to TNOC will have the same ATID which allocate in TNOC.
This is convenient as users do not need to know which source is connected to this TNOC, 
to get ID can through reading the trace_id sysfs node in the source directory.

> 2) How does the source driver know the TraceID for exposing via sysfs ?
> Does it expose its own traceid ?
No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.

Here is the patch to expose id in source:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/ 
> 
>>
>> If so, why the ID is not maintained in coresight_path::trace_id?
>>
>> A source device allocates ID and maintains in coresight path, then
>> this ID is passed (when enabling the link) to TNOC driver to consume it.
> 
This is because there can be multiple sources connected to one TNOC, and these sources share one Trace ID, so the ID is allocated in TNOC.

> Good question, since we have the "path" maintaining the TraceID, we
> should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
>
 
yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC. 
To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.

> Cheers
> Suzuki
> 
> 
>>
>> Thanks,
>> Leo
> 
> 
> 


