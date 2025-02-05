Return-Path: <linux-arm-msm+bounces-46915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A49A28342
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 05:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E6347A258C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 04:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66422116F3;
	Wed,  5 Feb 2025 04:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KdKJ4DZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0BF25A650;
	Wed,  5 Feb 2025 04:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738728581; cv=none; b=AiKshQgHlOVvBnpS4hYKtOW30jDheBTI3is08MNa6pOy4D50cH+Pj5HsbV65KkvZXdbFMdtvNnUWkFYNf+I8UVS5eGUM9VQvVxQAOSkvi/rRuAn/UwEyjSyB4g1iO7XJ0Q9k1Nc4yeR1zBpuvO3ptEC89j+GJ1NbFYnTCL++kNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738728581; c=relaxed/simple;
	bh=HPxszt58YCLZGuuaLZNC6Y4P7MmUWGTSSLqQcdUQXTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r6szXid++2hYTBMBuNlyMTOWR1LL/ztbkrYsEOLCJ+ksTbMsaP4Hu0+fys9uInqmw1mWJcU3vVReid71InxQLg0nMXhjEOgh1LIIc6hsaIp8bkQELYYZ9BtC+EywYrKq1kcft0NLhYA3MMWipjEvBKhH62qCjNvPvhfEbCsCi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KdKJ4DZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514JXptc031904;
	Wed, 5 Feb 2025 04:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b052cIdAOJ6Sd2S9PBmtHs3u9dhUMPyc4HX3PJEe5Qg=; b=KdKJ4DZGuLZv8DMB
	05KDQNrLDa2i8WQGm7BJ84KyPgi2fsl0hX3ETjI3eNqZkfobQwA5rCuhR16rji/J
	COIG2z6iPBkkrbBxwSzScRKp2Tc91Bfkck+ss7YodPXTrxoMD3EtPRDqd9F3zDq0
	cv/DgOn0Kyi+iW1fCf1VQFXuMxe+SYkyPUG8H4DJBdK8Cf7H52kZER1pt8jxb89Q
	c7q2zlUKkr37hUyknMcvyXBGzZwGZ19OmeFwAyFUswqzVMthy+mvcjdJmGRe+fou
	Pm1uig/7bpOI+EEsgbfLrO65PozMeLeNZlGeXtwFea/qVBOhBhThLN4sXlikvef7
	IWOqVw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ks5kgwb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 04:09:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5154996B027503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 04:09:09 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 20:09:04 -0800
Message-ID: <edf3cea0-b3da-4eb8-9200-e3c4d6e19b51@quicinc.com>
Date: Wed, 5 Feb 2025 12:09:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
To: James Clark <james.clark@linaro.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-4-quic_jiegan@quicinc.com>
 <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0e3f8f35-7ab0-4c2a-b7ce-f5d4f1164af0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7sgp-wmKOtZqfRVHVAvdlnJ9WUQcaqCU
X-Proofpoint-GUID: 7sgp-wmKOtZqfRVHVAvdlnJ9WUQcaqCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_01,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=624 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050028



On 2/1/2025 12:43 AM, James Clark wrote:
> 
> 
> On 24/01/2025 7:25 am, Jie Gan wrote:
>> Add 'struct coresight_path' to store the data that is needed by
>> coresight_enable_path/coresight_disable_path. The structure
>> will be transmitted to the helper and sink device to enable
>> related funcationalities.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
> [...]
>>       /*
>>        * If we still have access to the event_data via handle,
>> @@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event 
>> *event, int mode)
>>       if (!csdev)
>>           return;
>> -    path = etm_event_cpu_path(event_data, cpu);
>> -    if (!path)
>> +    cs_path = etm_event_cpu_path(event_data, cpu);
>> +    if (!cs_path)
> 
> I don't think renaming 'path' to 'cs_path' is worth the churn. It's in a 
> lot of places in this change, but I think path is already good enough.
> 
Yes, agree with you. It seems unnecessary. Will update it.

>>           return;
>> -    sink = coresight_get_sink(path);
>> +    sink = coresight_get_sink(cs_path->path);
> 
> coresight_get_sink() is always called with cs_path->path, so we might as 
> well make it take a whole path struct. The same with any of the other 
> functions that operate on path like coresight_get_source().
It's make sense for me and make codes easy to read. I will update it.

> 

Thanks,
Jie

