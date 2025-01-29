Return-Path: <linux-arm-msm+bounces-46440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA9A215BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 01:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED523A7173
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2452AE7C;
	Wed, 29 Jan 2025 00:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i3efGM9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE91802B;
	Wed, 29 Jan 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738111647; cv=none; b=OKuejs0usj9+xb7CPPEeywybXnDd8mzIYexr5CqAwWJqGTl4++VQFyw7dQvsRR+rkSh7K7PJko19X4TVB2Vgnz0Dnb8nAxNigqpFwP9BREufpl5KNJR+HtgUdzBL6KvtSO4RXUI+ucTjLK26eS7RTWayPbGr5XYhfDzVONLRlHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738111647; c=relaxed/simple;
	bh=W90pJzvFtlNgQLSBlNBH8PDFd9jfQ3hlQfpwJBcYYt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RCaczFXFKr6u37lWfcH1jWApPOKnflCKaHOf28vNQwtsaAInciRzV/UWCXVEkcU880N1rAsXUlLnJ5n7plVy1Ma3fIU9IqM4a+bLRMQPmjqZmJEM0DzZHy/ZzU5zOadNJhhpsQyXcHS2RuoG1cOtFmss1d4VkS90UBUxNwLNAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i3efGM9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SJgTsf013440;
	Wed, 29 Jan 2025 00:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fssEY9K692umefuNXiIQ7wUUyWXXgJxI8Dl5TjoqpQo=; b=i3efGM9tSfb8j3fS
	Xzzw+X8f5oA/jL/xlVLzMoK8lpvObH513cJr2kW175MNacn5exteNGJUA1WXi4l1
	vAIUu68SWOF6xbu8tzUcAEGvXRcI6zxCVgxU1KHwwA/2OpP56WOlaG6DcFfb4Cnm
	H/EQpV51J8K/hzKor8cHK6b7GbbphpHriNrhO+tG/HvLv0YndixWV8wb+qpX+wxh
	yGSmF4oX442jFwR82X9IdYlhX6pKrErU25tEogTvAfnOQF+40eMmC7fql2UuH2nI
	ZwcsV+0ZlXgxIan02TmTrLmgb5pyialihaZeu5SCkdEuwbTKfz5GiiU2iGufTUV7
	MZc2Eg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f5mrgh7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 00:46:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T0ksFM008953
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 00:46:54 GMT
Received: from [10.133.33.41] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 16:46:47 -0800
Message-ID: <b3d9e4f0-cca8-45a5-a5b7-239cdeed2751@quicinc.com>
Date: Wed, 29 Jan 2025 08:46:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
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
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
 <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8WMvGvEoB1sxqK5fvkuKZoZqoaVRREfW
X-Proofpoint-ORIG-GUID: 8WMvGvEoB1sxqK5fvkuKZoZqoaVRREfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501290004



On 1/28/2025 7:55 PM, James Clark wrote:
> 
> 
> On 24/01/2025 7:25 am, Jie Gan wrote:
>> The Coresight TMC Control Unit hosts miscellaneous configuration 
>> registers
>> which control various features related to TMC ETR sink.
>>
>> Based on the trace ID, which is programmed in the related CTCU ATID
>> register of a specific ETR, trace data with that trace ID gets into
>> the ETR buffer, while other trace data gets dropped.
>>
>> Enabling source device sets one bit of the ATID register based on
>> source device's trace ID.
>> Disabling source device resets the bit according to the source
>> device's trace ID.
>>
>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/Kconfig          |  12 +
>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>>   include/linux/coresight.h                    |   3 +-
>>   5 files changed, 321 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
>  >
> 
> [...]
> 
>> +/*
>> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
>> + *
>> + * Returns 0 indicates success. None-zero result means failure.
>> + */
>> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, 
>> struct coresight_path *cs_path,
>> +                bool enable)
>> +{
>> +    struct coresight_device *sink = coresight_get_sink(cs_path->path);
>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    u8 trace_id = cs_path->trace_id;
>> +    int port_num;
>> +
>> +    if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || 
>> IS_ERR_OR_NULL(drvdata)) {
>> +        dev_err(&csdev->dev, "Invalid parameters\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    port_num = ctcu_get_active_port(sink, csdev);
>> +    if (port_num < 0)
>> +        return -EINVAL;
>> +
>> +    /*
>> +     * Skip the disable session if more than one TPDM device that
>> +     * connected to the same TPDA device has been enabled.
>> +     */
>> +    if (enable)
>> +        atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
>> +    else {
>> +        if (atomic_dec_return(&drvdata->traceid_refcnt[port_num] 
>> [trace_id]) > 0) {
>> +            dev_dbg(&csdev->dev, "Skip the disable session\n");
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
>> +
>> +    return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);
> 
> Hi Jie,
> 
> Using atomic_dec_return() here doesn't prevent __ctcu_set_etr_traceid() 
> from running concurrent enable and disables. Once you pass the 
> atomic_dec_return() a second call to enable it will mess it up.
> 
> I think you need a spinlock around the whole thing and then the 
> refcounts don't need to be atomics.
> 
Hi, James
Thanks for comment. I may not fully tested my codes here. What I was 
thinking is there's no way the refcnt could become a negative number 
under current framework. So I just added spinlock in 
__ctcu_set_etr_traceid() to ensure concurrent sessions correctly 
manipulate the register.

As the trace_id related to the bit of the ATID register, I think the 
concurrent processes are working fine with spinlock around read/write 
register.

I may not fully got your point here. Please help me to correct it.

Thanks,
Jie



