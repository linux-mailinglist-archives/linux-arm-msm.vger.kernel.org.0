Return-Path: <linux-arm-msm+bounces-90275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD8cFvnQcmnKpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 02:38:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3616F2B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 02:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375E230CB760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 01:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E363358D2;
	Fri, 23 Jan 2026 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhEKpvZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+A6feMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6B312803
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769131993; cv=none; b=SGNTq4cFw5A+6xw18T084ysAlPnO8bfswaDCpf1ZA+eq9nzB+TplRZem7Q9ceEjavYQ0rVVMTUSqeYhu9NKe0ecf5XueQ3DWCQ2g45/hToPNdXFZTJ/Yv1C7KTAn86pLyfxFxqSLWy/KoaJPAL0hSWVi+tzfBEGr7sGVn3wsCsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769131993; c=relaxed/simple;
	bh=Fm5jgkwY9e0jxqp+BuT8UHuaeaRuMCFAfam7FZkXC78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn1dCm9coOuEvA8/nWqmIda0TqFO6SGVb8p8DXFzGpfcRZcvPuzrZ8NvDiLDJ6H7vPBKij9v1oLnEbel1XIVZx0YNZKXeX3+XZ243pfvRBjuEqfrFYX6IGNlhCMtcZDtrisU2yTmE15uQbCO6C3cuz9r8Ou/Mzi/gDxs44kp3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhEKpvZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+A6feMS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1D75i3649083
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=; b=IhEKpvZRJx7ithfI
	cdKDNV28wmrVX2HOrkAN4YF+arGTCwgfvPGLEU83FOEl2iCrxBbyDYGjUC7dOffO
	sVCSXxM70BmOar7adko44s9AJ+/4ERjQ8vr00UhkeyoD/OI0Oc64J+dM1nxNyzHJ
	lDg3SUSDrw5yEB6fMRjQqiK8sJ4aDJ0w3ceSqDxBzdeP7VRXOm9Eu48rf59gcADY
	GVfC7Kd35oWxds5SmgZzLK1dv2qtcpr1bEteqqihk4bksMSGKDc4RB2iuKcLqFgE
	Nvnxd4tJypcVSPVJsLpX7QVMEzcrKESgG5khLUmBZofu6nhFZaV4Oe0eVXQo6BwH
	thCoVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nr1k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 01:32:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so1013411a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769131952; x=1769736752; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=;
        b=j+A6feMSVPUdDOdpongcuF8n8NMVL13nooxhumJe3fpA+jcqU6rmmGWsH6wo899soh
         3LdfZJgv81dHEwDnkuca/jM8Rs1Geg1XwT1CRGqrqpUUPC2G/w5V7rTgepZQY03+pB0W
         +x0obAo0QqJCKhsNx8nZ47jiwvPZoWKUOeI9R7N7TSD2A/UOeP20TEj4XGuvLqpBecGr
         susUFe+Q114cDPC4YjribZuD6vVVlL0LTaReQ1Bo3c1801uCSlGZgbZWLP2nSsvopnNr
         ksNlDT74m8tju+lk1aX1f5Fmh33Tai6bK+JqniHQnhWqLEVLHRkoKe/3PPLOIhCxAbQd
         zKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769131952; x=1769736752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uuLZHwmvu91uXKQ5s1MOyzkT50vhUhhXbA5LIukjvA=;
        b=T/cwJYAH47e2VCzfgIw3IqnqWDuJuKu5dSVE7LOnidjpDmI0fJ1Vk1bmThxaiBpGoL
         a40xFlvx6BpQH1HPMPw+OhsCTYl6jLxAv//XQKsj6XZu1XT0TSGj1/sHKlJ4Sd9iytB+
         t4HzjjchPmng405GLpvBwmi/J+eqbieOQBLvvXhgvDGfq27IQ/KRdnliCHYgVfKIoagG
         GezPoStFmFARHqwsZtrupEwj6o3eBgaMcFCETuSp4F8+TsjUZO4N72wU+vcVUqXITiS1
         n/ERfeIIOvJQ/ixrqRxPdLFpYBQ9siUN+wefntPtGHDPgtAoPh1ln5uTqVLoOSsyHuWp
         GH7A==
X-Forwarded-Encrypted: i=1; AJvYcCX2BEIbYVrgbGOVEE4A2N19uewbwuTsMDHc8eM+0fLUiU4aAPlWlq8Dl1v4rDgeGsNGQejcpO9RUEZDvwUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEmvvl0L1XL0Je7XwL3MP1//Xyh9Isn2t1wptedOLjAyo2sIn
	RD05SVQH7YjGPMro1hQ8GYON43oR2sjG4jefB1EMD5QcYokNrlKPd28w1fs71/1W+z7qVUDIInn
	AWjEGREWaUqz3574L1PrW7Dq7BDs/Un28LAKlWO9xZwyKSz1Xlv34kORjbVrjFC8v1k4MvFdNZE
	Sf
X-Gm-Gg: AZuq6aI097Dw9eyeg29tHXrtnOVmyXWgdDQ7RDYYGc7U8gpqlLDyDQKdv0xgf86+jwq
	4N9bqD6IkrjGw8/ED4/AtGYkmbFrYqE3yzftcPlK3MREessqRjy3I3OsA9P4L1W5IVIJGAqPyWL
	OJs/WNNl4UlpnOkeOsErrFkzp0BTwu7cuFBJiECuoWAJYRJdYu12xWLyqR6mCPqyuTLV25yS2BM
	k3vkd0Dv+y/iO3DTYueIMMh7w2sIUBW11ao5AgRaUxZvLpLIQ/WY6qERZk8pBpyzBCjjle1tnUX
	8Fj+7+mt4OnOov4nMn+DKqYwCXFV5YDS1BWXO2Nv8uaX3lHE32PwnYbHtA0JZms7rlZlx6uGtGL
	g54dxO6v+aAN7I9xM10oZUXwK2/rDhwlcNPjckxm6nvzE+bGf2+ZO4KiSrf10DCspsYa225NcJt
	s=
X-Received: by 2002:a05:6a21:700e:b0:35d:5d40:6d78 with SMTP id adf61e73a8af0-38e6f7d68d3mr1297861637.46.1769131952142;
        Thu, 22 Jan 2026 17:32:32 -0800 (PST)
X-Received: by 2002:a05:6a21:700e:b0:35d:5d40:6d78 with SMTP id adf61e73a8af0-38e6f7d68d3mr1297830637.46.1769131951588;
        Thu, 22 Jan 2026 17:32:31 -0800 (PST)
Received: from [10.133.33.105] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43fc46sm522690a12.36.2026.01.22.17.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 17:32:31 -0800 (PST)
Message-ID: <2c440398-fc03-4e26-a471-2c1a742b95c0@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:32:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-3-22978e3c169f@oss.qualcomm.com>
 <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f78f72ec-9b57-4373-a7f0-a9295326832b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8-ZzpEwedDd4GxNnt3BK5AExLKdVrLTa
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6972cfb5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VFazKpM1ZUkYcEefXmEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8-ZzpEwedDd4GxNnt3BK5AExLKdVrLTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAwOCBTYWx0ZWRfX7bQ+DYM+Iplv
 11QsCAjSKJanPXWiX5Bwao6IcNUu5QykTKgyf6a2Druo76ioFy+mwxhu8nEYRcBVv2qKHZirEQ9
 FeLTIgjsTKBzI7jzUvkRm7r5oKgHs2+zXmn99sXhsqvvnDb90eRKLpdPrz0APmdftUeidpiZIUA
 uEtmLAh2camd4ibRnk86YJP63N4OtSTqOSUWGtui3BT1mb8vHBs8Qj4Uv54gHD67DLSsxfvpIdT
 ogxnRJcOy5NeHNzAfcy2A3m4O7PmqAjs6S8Cilr0Z21Hf2OLTjFujl9IfO06NKaoAcZCIqu3Fx5
 76PVZx16oiCGsrFxkCtAZPhcyv037Opv5oRsxf16xUykEKWhMyLXRD/kb1r9ObkrJeXf+I1De2L
 zZu4otYa9a2QSGspg7OSAV8Zy1sozr42quMt2it4/haAWktMJ09DSF9Z3wmY1Hkmg9MTI7sV7o1
 WmmGwFLR6ZoIOtTFiwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230008
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90275-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[desc.name:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,103.229.16.4:received,205.220.180.131:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB3616F2B5
X-Rspamd-Action: no action



On 1/22/2026 6:07 PM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for 
>> reading
>> trace data from the TMC buffer.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 50 ++++++++++ 
>> +-------------
>>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
>>   2 files changed, 40 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 1ea255ffa67c..8b0397a77e57 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata 
>> *drvdata)
>>   {
>>       int ret = 0;
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        ret = tmc_read_prepare_etb(drvdata);
>> -        break;
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        ret = tmc_read_prepare_etr(drvdata);
>> -        break;
>> -    default:
>> +    if (drvdata->sysfs_ops)
>> +        ret = drvdata->sysfs_ops->read_prepare(drvdata);
>> +    else
>>           ret = -EINVAL;
>> -    }
>>       if (!ret)
>>           dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
>> @@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata 
>> *drvdata)
>>   {
>>       int ret = 0;
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        ret = tmc_read_unprepare_etb(drvdata);
>> -        break;
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        ret = tmc_read_unprepare_etr(drvdata);
>> -        break;
>> -    default:
>> +    if (drvdata->sysfs_ops)
>> +        ret = drvdata->sysfs_ops->read_unprepare(drvdata);
>> +    else
>>           ret = -EINVAL;
>> -    }
>>       if (!ret)
>>           dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
>> @@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct 
>> file *file)
>>   static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, 
>> loff_t pos, size_t len,
>>                      char **bufpp)
>>   {
>> -    switch (drvdata->config_type) {
>> -    case TMC_CONFIG_TYPE_ETB:
>> -    case TMC_CONFIG_TYPE_ETF:
>> -        return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -    case TMC_CONFIG_TYPE_ETR:
>> -        return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
>> -    }
>> +    if (drvdata->sysfs_ops)
>> +        return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, 
>> bufpp);
> 
> minor nit: Please could we bail out in tmc_open() if the drvdata- 
>  >sysfs_ops is not set. That way, we don't have to sprinkle it 
> everywhere. And also, we don't expect to see this case anyways.
> 

In tmc_open, we already have checked the validation of the 
drvdata->sysfs_ops, we dont need check it again here. I will fix it in 
next version.

>>       return -EINVAL;
>>   }
>> @@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct 
>> tmc_drvdata *drvdata,
>>               "Valid crash tracedata found\n");
>>   }
>> +static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
> 
> minor nit: please could we rename the struct type to :
> 
> struct tmc_sysfs_ops
> 
> and then use
> 
> etb_sysfs_ops = {}
> etr_sysfs_ops = {}
> 
> 
> Rest looks fine to me
> 

Well noted. Will fix it in next version.

Thanks,
Jie


> Suzuki
> 
>> +    .read_prepare    = tmc_read_prepare_etb,
>> +    .read_unprepare    = tmc_read_unprepare_etb,
>> +    .get_trace_data    = tmc_etb_get_sysfs_trace,
>> +};
>> +
>> +static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
>> +    .read_prepare    = tmc_read_prepare_etr,
>> +    .read_unprepare    = tmc_read_unprepare_etr,
>> +    .get_trace_data    = tmc_etr_get_sysfs_trace,
>> +};
>> +
>>   static int __tmc_probe(struct device *dev, struct resource *res)
>>   {
>>       int ret = 0;
>> @@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
>>           desc.ops = &tmc_etb_cs_ops;
>>           dev_list = &etb_devs;
>> +        drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>>           break;
>>       case TMC_CONFIG_TYPE_ETR:
>>           desc.groups = coresight_etr_groups;
>> @@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           mutex_init(&drvdata->idr_mutex);
>>           dev_list = &etr_devs;
>>           INIT_LIST_HEAD(&drvdata->etr_buf_list);
>> +        drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
>>           break;
>>       case TMC_CONFIG_TYPE_ETF:
>>           desc.groups = coresight_etf_groups;
>> @@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
>>           desc.ops = &tmc_etf_cs_ops;
>>           dev_list = &etf_devs;
>> +        drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
>>           break;
>>       default:
>>           pr_err("%s: Unsupported TMC config\n", desc.name);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 9b3c4e6f0a5e..c9a82ff6cd00 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -221,6 +221,8 @@ struct etr_buf_node {
>>       struct list_head    node;
>>   };
>> +struct sysfs_read_ops;
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @atclk:    optional clock for the core parts of the TMC.
>> @@ -258,6 +260,7 @@ struct etr_buf_node {
>>    *         Used by ETR/ETF.
>>    * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    * @reading_node: Available buffer_node for byte-cntr reading.
>> + * @sysfs_ops:    Read operations for sysfs mode.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -290,6 +293,20 @@ struct tmc_drvdata {
>>       struct tmc_resrv_buf    crash_mdata;
>>       struct list_head        etr_buf_list;
>>       struct etr_buf_node     *reading_node;
>> +    const struct sysfs_read_ops    *sysfs_ops;
>> +};
>> +
>> +/**
>> + * struct sysfs_read_ops - read operations for TMC and its helper 
>> devices
>> + * @read_prepare:    prepare operation.
>> + * @read_unprepare:    unprepare operation.
>> + * @get_trace_data:    read operation.
>> + */
>> +struct sysfs_read_ops {
>> +    int (*read_prepare)(struct tmc_drvdata *drvdata);
>> +    int (*read_unprepare)(struct tmc_drvdata *drvdata);
>> +    ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
>> +                  size_t len, char **bufpp);
>>   };
>>   struct etr_buf_operations {
>>
> 


