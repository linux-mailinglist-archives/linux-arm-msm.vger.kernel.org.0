Return-Path: <linux-arm-msm+bounces-90662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPGvGTtyeGnEpwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:07:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56A90EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AB82301AA6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59990225775;
	Tue, 27 Jan 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4xJfR1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFIOor1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18421F63CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501108; cv=none; b=CmLaKmyCrs6wMbXAKs72NEov2RMUxboFbJEsdnILcfhDBkXRTVG0lM5+2vbjrQmnDKLNnA5YsUu0CvZ/t29CsX78B2gXx/6B0tTnCdy9K6oXbcmfTCJfJzAcRRuf+ClXEKln5LJkZFHB7C9KIBOBHyQwqenbv/J99Bqu1D7tkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501108; c=relaxed/simple;
	bh=gIR8cUiGYJsmVPZtg1/rHSe9Ncu39joHItC2y2OPITY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZM8gY05zjZFp3ANGapXixOJY7xmCK/ErDtTae8ImBVb3ZN/IjD/szv4EnMFK+Beg5pNkY/TVrflMCgO1R4biFic6PpEfP/OZqG4h8DdZCviTCRcA6sk7EPlcUrjpVTQDwjrIlbEIcB7fOKnx+ny34BjGH/8SCMf8K1UcO+Yud+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4xJfR1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFIOor1L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4TxA1786322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SJfhciaIrpY72Z27IrlqAdQNDG53IWIDzw4DYheaalk=; b=Y4xJfR1Id8LX3asZ
	iYnb4X9vU13jc70hkdcG6ebyMijM+LOl0nlb1Eo6UeUc7fOR2dJZdH0Owqzttytj
	Iq8+IrJuJ9XXQp0FHGVflG+HhuuJ95lWqdhaJTmmmlKyE+BIkeT2nGazLlfyJXxn
	Gw8lo6A+NiMq7YArgORLgolJdYdwqux2sSKoIeb1U+VK42jXyDq/GIuz9y/C8EsQ
	aYqnZP2YLSUOCs3hmLXbW/FlzIhAh9nEFW0jyD6LUvs80TWlXgXdED8bI4CkNxp6
	zDlCVEE6/T+q53ZOuBN2pzYJM7xWi/OkzARm9874S3xjIQd+EtrSDeu1x1PjOZrD
	nP9K1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93hpha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 08:05:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6310f81285so7636309a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 00:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769501040; x=1770105840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJfhciaIrpY72Z27IrlqAdQNDG53IWIDzw4DYheaalk=;
        b=kFIOor1LsASGpXqDPS2w8tFoVDz9PFJOpkbuvKRosoQ7S7/XK6p1jTtEhlsWYmVopn
         XI+efH6vd8d0Vv52N2C/EnMCG976WgOidUQNujn9UNn2UEGRXhWr7ZH6Mnctyeef1lkr
         5lq6KhCLJUnpSSdQmNt9gBx7EVyew9Geba4sSusHu/RpqzrEABWZweI+f4MTyVFYZh7A
         5yxQiu+FoljK+SjLj/h5H8V4ziMWE0DbHkdTkYgog3MM9r3uCyTSMcVoqBP1FaNgJ4ek
         OcY9fElMDbCElorR6nAh9ZfpGimAiIIWiuIrOqQBQ0b3plFs60ps/ZR4KiR1xqfrwCms
         dlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769501040; x=1770105840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJfhciaIrpY72Z27IrlqAdQNDG53IWIDzw4DYheaalk=;
        b=a2R9nhVmsj2SUBgKQzsQe8yEkeA98Dr+b09znDxtwH2TMkx03Fo1utkl4ip+u5QB0N
         Dwk4ZrFMOt/Dt9Jzey0IfDcZ1fCnB2+kpgKGpY8ZyO3m7yuwdOQ77Bok9WaGrSzwb3IA
         YGT08tYoMCJVCpU9+qAF6KcfItMHf5NzD48SM7GGvDqxw5CqNHjU3LdUZEqhydMW3evQ
         nfAgVqCsx3GapHIh3CSoBLvjRuJ0WfH1fFnP/k3RPEzLkplPdF0E7vFESqdFUPs0YUI1
         BdgkVkxpjmjke7I84udUH7mMOKo+0FRSTiY68TLU+ZsfNbu9uNX95l0FHB+xAAp2OfCa
         Sqyw==
X-Forwarded-Encrypted: i=1; AJvYcCUd+1eXMwU8uFk/dYmTexKp6hkA+janYW/r7TJ4XgolVagGkBKnp1e7MqF2d+u2SR5l1QxteSduA/EChCbP@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwH6hmSTqBz9tw+i30KneakoEesaaCfQz+VLhjNjMlGPdcBrS
	0tIJTZnStTv/EHqFZjPrmf3830Md/QqsTzH8LTnOSg8KS3KOcv3P319Tvk+mJkAWzp9RG5xLsCp
	9N4yrqIW3U1nv8qSDneye/VmU/Y4mohMmtXgzMChlsemvl+hDT4wL5NrUMJkAsFjobhQB
X-Gm-Gg: AZuq6aLhFk2Vgj9ZSLKrJP6uOb2Jb5lXzwxI7U1OX4FNBTkCTDCyrso0Zu97P3Ocz4i
	gmdT5FVOApRve2TcUonRiXir08KSUXcVgoEBbnLdyH366FnolMUM9qa3DUxFcJc6VlLdLUElczp
	9xuK/IEiJZsA/hA4pl77m9pNwLXKroV0PxEeurR1+ccfruZtGE3wjuNYf/BfG6VL/7e6X7Zv9Yv
	I8Ce6uWzNs+VYXuN8bipFjQAMoQFJLd8JTToQd0F36Q7zNMo2sGJLq2jbM2lPZiT5SQjt/kcnSD
	TXDUuSJN/H+uRb1AAe82qTXbOFWuqisTVtVygpWAQe+G52/uPjAV0QQ8+zpMEZmGHV8hGV2aPjs
	hQZovrdyKhDAxipn0zBfRd/vQBjJ3BoPDtbI5IqZUV2Cd/rfgUwqGhlNV1XvJ
X-Received: by 2002:a05:6a00:3988:b0:823:1519:3c70 with SMTP id d2e1a72fcca58-823692cd2bdmr967246b3a.49.1769501040128;
        Tue, 27 Jan 2026 00:04:00 -0800 (PST)
X-Received: by 2002:a05:6a00:3988:b0:823:1519:3c70 with SMTP id d2e1a72fcca58-823692cd2bdmr967228b3a.49.1769501039608;
        Tue, 27 Jan 2026 00:03:59 -0800 (PST)
Received: from [10.133.33.189] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e903sm11257744b3a.51.2026.01.27.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 00:03:59 -0800 (PST)
Message-ID: <aa4f73a0-9342-4b02-aff6-df88abf836db@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:03:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: qcom: pd-mapper: Add QCS615 power domain
 mappings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260122111318.500262-1-le.qi@oss.qualcomm.com>
 <913bb253-f040-46d8-ad27-51d7485a8ddd@oss.qualcomm.com>
 <czyzzq33huzyemqjkicfimmcdrkh3a3dvmxd6wub7q2huoi2uy@ifasxehwrb2o>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <czyzzq33huzyemqjkicfimmcdrkh3a3dvmxd6wub7q2huoi2uy@ifasxehwrb2o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2NSBTYWx0ZWRfX3CRL9stBWRhK
 d07SXRAs9rXjt0c+rcAHFKNEOXI+FfZeanBlGMwaNASH8WxF+d8rskns7sGpRMdHa9MXikSk4n6
 mI9oqGrwmDYPulWKf9ldp465GwNGJQ60+d5D7d26aZUPfmfsl8r6IIbK+0jqE9QDGRWtS9OyuZV
 vl/DVbKlIVr2SVVk292qP7Gl5myTpUbZaGHZGap8bBH/1uvtfCUaQvCJfJbxfa4k6ZZKg5o1EOG
 YjKgGK+wPLwFVZaukEbH5/GAuVA92r7LS5ia8rHrVkr2vTnflhTPAJCWwiLnC5L5eIndzipnahB
 Msbsd/TPL1dVPT+c2eQjuMBI6bCRigBG8ZpsAEKKophHs7idfd2SInRJOh5jm5vx4T8dJSVGy9F
 v6sri5JeMUHsbR4ms5TTLUQnSJPFuu3a5su4qViHIolq740bXdJ73STG+aF+LIYR76RJIeqdmdH
 TpRxenNid8rvyp2b43A==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=697871b0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1cuzXJARxHYiSA0V8VgA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: wO6Usheplyyq6z2hcRKXfPGKKYZQ3k0H
X-Proofpoint-GUID: wO6Usheplyyq6z2hcRKXfPGKKYZQ3k0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90662-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA56A90EDB
X-Rspamd-Action: no action

On 1/24/2026 4:03 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 22, 2026 at 01:07:45PM +0100, Konrad Dybcio wrote:
>> On 1/22/26 12:13 PM, Le Qi wrote:
>>> Add the QCS615 domain table to the in-kernel pd-mapper so that audio
>>> subsystems no longer rely on the userspace pd-mapper daemon.
>>> This enables proper initialization of ADSP and CDSP domains directly
>>> from the kernel.
>>>
>>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/qcom_pd_mapper.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>> index 1bcbe69688d2..884a2db9bb08 100644
>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>> @@ -401,6 +401,14 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>>>   	NULL,
>>>   };
>>>   
>>> +static const struct qcom_pdm_domain_data *qcs615_domains[] = {
>>> +	&adsp_audio_pd,
>>> +	&adsp_root_pd,
>>> +	&adsp_sensor_pd,
>>> +	&cdsp_root_pd,
>>> +	NULL,
>>> +};
>>
>> No modem_xyz?
> 
> There definitely should be mpss_root_pd / mpss_wlan_pd, otherwise modem
> will not load WiFi firmware.
> 

Hi Konrad and Dmitry, This board does not contain an MPSS. WiFi is 
handled by an independent WLAN module, which has its own internal PMU 
and is already supported.

-- 
Thx and BRs,
Le Qi

