Return-Path: <linux-arm-msm+bounces-78105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F84BF5367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB7518A67E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41CA2ECEAC;
	Tue, 21 Oct 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZV8wfA4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F1298CB7;
	Tue, 21 Oct 2025 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761035000; cv=none; b=oZdmAvr5ZBFVepx5QUpd4nGfsRs+awru1JIxS+VD7DvoU/Rw7sz69jUQWuzVhbQUb0h7TZMqOvt8lyTSgapCKzQn4E7UKk7aKN+Rxzhc6cuiZg2SUBHiIPf6f1IIb9B75y1G7kK0Q5xmlLGRRknhtTICf81uAhG289Jd9+V/YJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761035000; c=relaxed/simple;
	bh=F22bHwYKPSzN4zjP+p99QdmH8DXqT/yvNivaihOh6iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZAwi4OR/j0Nun+N+887i9PlrAF7nZVWhm3X2HjNvfLq9KA3Pu2t2yzD/+sopyfEWp2cJ0374cVrFj17uSdmIblEewWYNVjZFCs5Q+kGyxBGqHcaNbOXhwPzJ0T4xyRfwDTmrvlXSD3yOyBRnxjDK9oYnjw4DP1V4voVgVgg/2tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZV8wfA4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8EP6Q032755;
	Tue, 21 Oct 2025 08:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F78RPtllNnXhXUSY2V9DLkUzBCsTGmzWtEdBdnJK0u8=; b=ZV8wfA4mn5F4l94I
	HSDiNC+mWm/9edxa0Vo0PSRoOISioKKySuq1AozDgwmC6kloE4Pozchtc+5QiQpx
	Jn9cpGPCcEJmaQFN2hE5wIp/jzmtH44KmQqO2QKPWgnuyV8G/m2iUEiePRrQ9e2g
	Kz8rOo43lc7TaBF4eqtbr26lYoYvxIC1523GD5124kmLhpWUYmDX9S2VhIA6hgcX
	dJP/nr5HLuuhKojzAPoKx4ZsWzz6f1u5gZSICWzRhrUtICsVMBrEH11wV657t7Ee
	AkOkMVVYk9Z2iNQMtUXsxoIoJQa+Gxvpaq6zzLQcSqe8W/Til3V37Pbz60K8ACJN
	e1yPQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w5agd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:23:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59L8NGDh020284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:23:16 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 21 Oct
 2025 01:23:13 -0700
Message-ID: <ff382661-4d05-4f9a-8b9e-55fa9932a22a@quicinc.com>
Date: Tue, 21 Oct 2025 13:53:10 +0530
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
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <bb25208e-a6a6-4a81-9dd5-5c5eb1cf16b4@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6toj0w1ete4PvMHjsYVGDyfDURbbsMn3
X-Proofpoint-GUID: 6toj0w1ete4PvMHjsYVGDyfDURbbsMn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX1ikofsfvirIN
 KxM1WgRc3gOx6mnbN/Tu9Vf4y/7p/zLB8b7ZihlaQpC92J2BanA9gV0sLPpUfIeIfckNb3Kvdrj
 UwnZWszqq3m5cVgJPIL0nSlS9o6NbkTgWe+jKtmmu+Oeylz7mYRgk3STZatqu6fyo7YOCcAaZ4j
 8XX1BPbraR1R7tfVWDfSkb3NxQdy73NONnqYO9pl9TKSb/4JHh6q50O8UdH7KiSWKoQTWSAghIT
 GQo3n3SPkeKIjh08RyqZTivpff2Y50fZE0PNnb5zdHZITXub5yKr8VCMNZhENYzztrsbq2PYE9U
 uayjEyfwqGGvwB9KCh6lyr3nuuNYyvHrpqAxUafMDmDvMTwJo1gy/K9SqSFKjH+WcdXdCTciyL6
 OqA+WBQKk+Zr0MpTWLnLn6F0YcdHtg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f742f4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SMMCJtFpidMdBd4wOSMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090



On 9/24/2025 8:27 PM, Konrad Dybcio wrote:
> On 9/24/25 6:18 AM, Jingyi Wang wrote:
>> From: Chris Lew <chris.lew@oss.qualcomm.com>
>>
>> Some remoteproc need smp2p v2 support, mirror the version written by the
>> remote if the remote supports v2. This is needed if the remote does not
>> have backwards compatibility with v1. And reset entry last value on SSR for
>> smp2p v2.
>>
>> Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
>> +{
>> +	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> +	unsigned int pid = smp2p->remote_pid;
>> +	struct smp2p_smem_item *in;
>> +	size_t size;
>> +
>> +	in = qcom_smem_get(pid, smem_id, &size);
>> +	if (IS_ERR(in))
>> +		return 0;
>> +
>> +	return in->version;
> 
> are in and out versions supposed to be out of sync in case of
> error?
> 
I think that should be ok. If we return error smp2p connection will be 
completely broken. With default version 1 partial features can be 
supported even if remote is using version 2. Some features like smp2p 
connection after subsystem restart may be affected by this.>> +}
>> +
>>   static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
>>   {
>>   	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
>> @@ -516,6 +542,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>>   	struct smp2p_smem_item *out;
>>   	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
>>   	unsigned pid = smp2p->remote_pid;
>> +	u8 in_version;
>>   	int ret;
>>   
>>   	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
>> @@ -537,12 +564,14 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
>>   	out->valid_entries = 0;
>>   	out->features = SMP2P_ALL_FEATURES;
>>   
>> +	in_version = qcom_smp2p_in_version(smp2p);
>> +
>>   	/*
>>   	 * Make sure the rest of the header is written before we validate the
>>   	 * item by writing a valid version number.
>>   	 */
>>   	wmb();
>> -	out->version = 1;
>> +	out->version = (in_version) ? in_version : 1;
> 
> = in_version ?: 1
> 
> Konrad
> 
We want to assign in_version when value is 1/2 and 1 if value is 0 i.e. 
error case.

