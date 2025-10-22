Return-Path: <linux-arm-msm+bounces-78311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC2EBFB748
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92B95631D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FA91ADFFB;
	Wed, 22 Oct 2025 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fk1eGS7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA26287257;
	Wed, 22 Oct 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130233; cv=none; b=T/haaJ8TJU/AfrKr7xFdFcN94z8SEc3Ca0yUIGQ5dYyXR2dHy4wzzrRbCNU52IQ73hEfPN1zdedy21jgwP7xAqJfiEmUBOF6gr7bJ9W+2g742UrAQHSiPb90GO2C6l5BI18zh3LfM/Ra7b0rH42ej/AmAQ2N2usQWek/4Nu99/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130233; c=relaxed/simple;
	bh=zTRtMT8A8AL7+WLa68QI5Ji2EVwRsB79K/8LeKNmxv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q/yea0G3IZmQ4uvKjNVau/aVoPRG90PxL9KvAJZAOhJAtLAlAV4ZJ9ZEYCyQfCv3INICZ1gFO2i6EasXUn2blOV5YZgTQpDaKLIe94a4TmE4xSo/n5WHSNLdJZl1PaRNT7HLDRv7/6KHxicPDL7xSJDOqd96iOT+msstYVx054k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fk1eGS7E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA5Zcx005410;
	Wed, 22 Oct 2025 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	67R/Am/MLn/z0sUzSd2NMVnV6JzW8+wkS45v8jxjHJ4=; b=fk1eGS7EPfz4nzFu
	uBqtscHDGrZqCRtrTikqIuUgZB981bwIjsgVRNCini8KpF0XPn0iYcOBz/qY2Y3m
	ExcbHz7qI6QT7apsPXQp7AeLL4hGEv969R+8ygXZ+gt4wZt0d/XJ3/L4o9HXeIuD
	35KbNYZ99ngHNz7xxqr08h3hmWz5M99jvC6LuB/gdWq0SVqZNuAU8DfGw+pJG4Uz
	5b9ip6br0uN29XPMfd0JlSu8bhocd0vHXLuujoDtolQiVnZWIbfZJeoyT/+EAFxq
	F+lKEVbeFHqg0fiq4W5evKiD5w5w9z+zJljnHYnfEaUNNyQ8vnZPxNjQI1VEBxrI
	E64eXQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfm9y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 10:50:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59MAoSu9017419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 10:50:28 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 22 Oct
 2025 03:50:26 -0700
Message-ID: <aaff2cf4-5811-4cb5-860e-b9704d152da5@quicinc.com>
Date: Wed, 22 Oct 2025 16:20:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: smp2p: Add support for smp2p v2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang
	<jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Chris Lew
	<chris.lew@oss.qualcomm.com>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-2-2c045af73dac@oss.qualcomm.com>
 <bb25208e-a6a6-4a81-9dd5-5c5eb1cf16b4@oss.qualcomm.com>
 <ff382661-4d05-4f9a-8b9e-55fa9932a22a@quicinc.com>
 <15617371-0b20-4326-8e08-2c20b3d3c767@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <15617371-0b20-4326-8e08-2c20b3d3c767@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aFTsgYUjhJD5zzF4ia16fOwOod9tsRhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX8TG1Lm/E2+Nd
 yKVZ9wSMzFbQa3C14nMa/pbg9iwKdBvMlzSreyiQFEz2R/5oZahWVikOUp3hHEpci8HX6YA6G5d
 xwXnJLr9zPogMZaTVnftH3aDijjQW0xhnWrkd6Ry9gxgItxp03r0RuwjD8la1kCtnOZuMczqsrw
 1DLtjUznSPlRh9Ian2f6iVhqmnMC4W+sz6Sc58m/HRZ5kLr5wOmljLwO3p3E+DYjlqz4RF+aw5q
 Q1ATQpf8/cAq0eBlHzck+UNmlJ1sHTJ6Po4shhm61FcgGvhq53yFZb1FkT2EkrFF3MN47JOY2r0
 DDJAAw7axcxOaWniJ9rUvIqdVruTu9e2U69pJ4UX6hcdOx7ZxpwxJ+0aj8uSTEi62xDtXUVUFL3
 9Q7JIzn/Bu3miI2PZpklXeO8v0Q1Jg==
X-Proofpoint-GUID: aFTsgYUjhJD5zzF4ia16fOwOod9tsRhe
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f8b6f5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vr2n7OayV0E5LLaSdscA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027



On 10/21/2025 3:09 PM, Konrad Dybcio wrote:
> On 10/21/25 10:23 AM, Deepak Kumar Singh wrote:
>>
>>
>> On 9/24/2025 8:27 PM, Konrad Dybcio wrote:
>>> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>>>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>>>
>>>> Some remoteproc need smp2p v2 support, mirror the version written by the
>>>> remote if the remote supports v2. This is needed if the remote does not
>>>> have backwards compatibility with v1. And reset entry last value on SSR for
>>>> smp2p v2.
>>>>
>>>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>>>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
>>>> +{
>>>> +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>>>> +    unsigned int pid = smp2p->remote_pid;
>>>> +    struct smp2p_smem_item *in;
>>>> +    size_t size;
>>>> +
>>>> +    in = qcom_smem_get(pid, smem_id, &size);
>>>> +    if (IS_ERR(in))
>>>> +        return 0;
>>>> +
>>>> +    return in->version;
>>>
>>> are in and out versions supposed to be out of sync in case of
>>> error?
>>>
>> I think that should be ok. If we return error smp2p connection will be completely broken. With default version 1 partial features can be supported even if remote is using version 2. Some features like smp2p connection after subsystem restart may be affected by this.>> +}
> 
> Perhaps a different question is in order.. do we ever expect smem_get to
> fail under normal conditions?
> 
> [...]
> 
Good point, i think that should never happen for early boot processor 
which will use version 2. That can possibly happen for processor that is 
coming late than local host(version 1). In that case anyway we are 
setting default version 1 and proceeding. >>>>        /*
>>>>         * Make sure the rest of the header is written before we validate the
>>>>         * item by writing a valid version number.
>>>>         */
>>>>        wmb();
>>>> -    out->version = 1;
>>>> +    out->version = (in_version) ? in_version : 1;
>>>
>>> = in_version ?: 1
>>>
>>> Konrad
>>>
>> We want to assign in_version when value is 1/2 and 1 if value is 0 i.e. error case.
> 
> That's what this syntax does, with less characters
> 
> Konrad
Yes in_version ?:1 is short hand but i find (in_version) ? in_version : 
1; more readable and obvious.


