Return-Path: <linux-arm-msm+bounces-84876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA1CB20E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C93230A417B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AAD30F930;
	Wed, 10 Dec 2025 06:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vwx1UFCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COHwsaJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DDF2FB99E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765347473; cv=none; b=kJlyy0oezjqfaW8MVK8pU0fiGhlttUXO3e5EqGi2eqA+Yf5E7nP3VpnPHBgOtRQLOaufwwbbpZnmebA1anf59PKUv3Kp+UVoLIJ6V1qtVr8NMz/0fFYIIgfsiEjGV6vxrT/aigpMLj42FONsfqjDTXUbcTJwTdEDyXr9VlmmMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765347473; c=relaxed/simple;
	bh=raaVH7DeubiiLy+SQ8F3Eea8apiakMkOQSOjpBTbEyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ebq8a6WqnnaKB2EIiE4F9aMvRtcurgDXTERzofaSpUFCpg31PGsYBBTbMU3uZH0K4BgkPkLO7SWJYxPcvZ3YirbC7R7yfA8LpROEttNE/sp5A0+lioG7ohMwRZ74FJPG3zKGtsLOpl1xXyEpvLHAl8jMIOZCGml1TKWVHgprMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vwx1UFCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COHwsaJr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6EaTT2462129
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1/aL7oKgCS648DVFkNwnBskxhWhvvNxqKsRLhVdPRg=; b=Vwx1UFCWblBd44Hf
	ZDbyjrI/dBuCQnGC7OqyTUloEmuQnaSqxf67asuhq9SyQDxwi5WuG7MgjiSj8qFJ
	OiTFi8yvy8Dq8cP8GRIhZVPPFlASuXOVUb3o6dTu65QKVCxmvV1Ph6/AgfgSQfKI
	U5buCIsBOaC2NMkiLGzggsfhja1O2AbeqPCCjpNPIhEq572mhZfb0+ZyCcxOC2mx
	T2zftqf+a2/kdB/crgl+YLAd05pXctMZP3YWEpwmX5BhR2V0egvz1PU4mTNpIyIB
	Z3yFbBw+W57VE/g4LNLK4HpMVOiyuD4fuv40CaYE1VcNfAYNKLFLXGO2mhrhM4eT
	u10wjg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu5a7nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:17:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29557f43d56so80802945ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765347468; x=1765952268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1/aL7oKgCS648DVFkNwnBskxhWhvvNxqKsRLhVdPRg=;
        b=COHwsaJrFbDKzaqe++VAxAhFx/SSE5yHidBmIFWN1XOmV+LB359a7YG3NEnzTIXoBC
         qTx7/jH+fQhED2RVDiQAnlMcdmhzdn3ioSJk+EWpHrKjJ8L+V/M0Jf6UeZnOO1T4iG04
         7qpgE+W9ixEpcZCfShvk6iSG8oZeh1ciV2Lgexjv+ybsUz/0IF/AmNgHyKOsjg2NzOgM
         H/aGHBtAfzHN7FKo4UAM44lOSms4fYMCQPfFR16z6BXf1GdyHFlnc3Tm0v5ufHqk2lDv
         okzIfoTH1qaEou4uNUPx5ukfYTiJIAjg+V+bKyMBklLR/WXvnSpitow/o3XZ9sUlv8Sg
         dPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765347468; x=1765952268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1/aL7oKgCS648DVFkNwnBskxhWhvvNxqKsRLhVdPRg=;
        b=r5BNpVvm2dDKA5K6QNnnJ9zmL7jsvp/Uvlh6CCFAKNRCn2k9z2T6oRVh3Z/OniQDen
         K6sK7+zN5HD4Ffb5o7O/vLzCZV+3YWb8Tw72ap6CgirbOvOLMPpvmsV4yh6voR89HNcn
         gSj/zrE07/qZ3/IUf451VPj5v3nCXr+7BlMiBCnqbeeG2c6J54fcKdYvzGwy8nosRHP1
         2kc+LZFZVISNS1giegZ+tD1RFh2cnueygjIn+x5J4/f/3P4ClrIy4abIdlus6CUDHyT3
         XsKyTYaJvWRz8NGlGPfB/W8BwaDyGzrGJbssDmoQMBSzxdb2ocHsx/Moxm7zHuazKcFo
         lveQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2Qmo+YuJWzQeLxnKYan0Gyf/tden90EjvFJmsP/f8XxRm1wt5LlOLMecJGOCHzTYJV2KGFW9sCUmGb7Uf@vger.kernel.org
X-Gm-Message-State: AOJu0YzK4Ptl+xBM2vFVWBJvN9JSJZUzc+VeWYnm7eeDIcY1C44c/fKC
	nDH3weTteohiDlnoE2dcBaC8ZjoxinH4VKmU7I9EkXJvYLyDXeZ9sToXj5tlOV+SBNJ2oRFSz3e
	zgBoUiM6H7cjk04garHnOieZkGXN5PrziFQXDbeVNuB/sdhucSbdrMX+irRkrQZ1VM2oa
X-Gm-Gg: AY/fxX66G1a9Thgh3HmtyEb9Q7wXjBiwtWUZwSja+uBY3w1zQqRpAVKlgot7+qhS4lR
	6HlpxKgyoF1/KoLheJBXvJ0wyWy667ahOl82yJpiT3tH3sNxqnYFKd2v3fCyJmBOZHAeMWjydh7
	QqsiHo00sRmzFR6ZPPG/TGblGuzHbzQl2Jt3osZMOdcMJfESBrks1ybJ9iiy68E56ZFSHo8dgBX
	346Jd8JTnYNwJrEOV340RGd1NZC/o89gfB28HQATYDZANz3JdaAf7tvzEPVd4KBmWGef1zGoT2q
	hP1o/n7lPj0p8xtVpYSceX8lAX9CwAobCY2utrmRDJ7Y7diTRzsF4yFu9kBVJI2PZqp0JXtPCAM
	GP19Wvlx2/sgYwPUSsywqHdLpWQh5vu5TRPwMAGdFEfBWHkQTVx7IjAFilXKuMXLqK92dlbT0Zc
	+xKaEU
X-Received: by 2002:a17:903:1aab:b0:298:5fde:5a90 with SMTP id d9443c01a7336-29ec280e3b8mr13625575ad.58.1765347468339;
        Tue, 09 Dec 2025 22:17:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn7XBk1lcXqK5b/Q+YYEKRWVIrnnWqBDpGrbfx1z86t5+ZNPmtoyqGm/HnFn3/YTo9gL/N3w==
X-Received: by 2002:a17:903:1aab:b0:298:5fde:5a90 with SMTP id d9443c01a7336-29ec280e3b8mr13625285ad.58.1765347467680;
        Tue, 09 Dec 2025 22:17:47 -0800 (PST)
Received: from [10.133.33.182] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f011sm174639355ad.59.2025.12.09.22.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:17:46 -0800 (PST)
Message-ID: <40fd3f7e-dd03-4f6f-99d2-919192b91434@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:17:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>
 <qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <qfls6xlvfppqw7p6rjpmzqesh6sbob4myfc6dz47qh3jywqrjk@5xiutkbybk5d>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 94yFpXQ_1tKwmHEFKtK3MgIgs4m7q_2V
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6939108d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2ybkzJfMrvde047oObEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 94yFpXQ_1tKwmHEFKtK3MgIgs4m7q_2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1MiBTYWx0ZWRfX6MBsnfGx28ab
 KlAGEoNuo06Vq22qgjvdiQJNS3RiyCGaDOoi0PxeGvHAPjX7tSHzl5hv6ndbQdEKiyjumA+hEuM
 puOvnwxfBn++GMG0/UD7csBAmiNq/V2IGjq4f90a5O21s1vgXPur60ksP3OA57wj0JwuaM58uz0
 BwvP9EJxtsn/V2vYKg4iOONi+LpqAGmCRmQBMFF317OKHyuSMBYbcII5Dc1waUokIyzpKCYWtEF
 ZFMQeR2xPrUVkn3uqTlM0wau1qEPsujZVky9W3fL2Ro7aFBEfXvALjnqVMujQPhL3qWqrhz9/u4
 R5cJc+Hbe/c+NyWuGQNSniq4eQIeKD2qHM+iHE+z20vaIZCvfzQ5yXQnEO2Pc5rJsNRsl0Wf2zJ
 cQhfr5+r67P9s7rJYV5UDB5fCAlTEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100052



On 11/2/2025 2:34 AM, Bjorn Andersson wrote:
> On Wed, Oct 29, 2025 at 01:05:42AM -0700, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
>>
>> Subsystems can be brought out of reset by entities such as
>> bootloaders.
> 
> Good start of the commit message.
> 
>> Before attaching such subsystems, it is important to
>> check the state of the subsystem.
> 
> Why?
> 
> I see three possible outcomes:
> 1) The subsystem was booted and is still running just fine.
> 2) The subsystem hit fatal error and flagged this in smp2p
> 3) The subsystem hit a wdog and I presume there would be a interrupt
>    waiting for us as soon as we register a handler?
> 
> Perhaps I'm wrong about the semantics of #3? If so this should be
> clearly documented in the commit message.
> 
> 
> Also, at this point in the commit message you've established the
> problem, the remainder is a description of how you're addressing the
> problem. A paragraph break would be suitable.
> 

will make the commit msg more clean in the next version.

>> This patch adds support to attach
>> to a subsystem by ensuring that the subsystem is in a sane state by
>> reading SMP2P bits and pinging the subsystem.
>>
>> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
> 
> I would prefer email addresses to be all lowercase, but more
> importantly, you lost the tail end of that address (same with author).
> 

will fix

>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 63 +++++++++++++++++++++++++-
>>  5 files changed, 165 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..4ce9e43fc5c7 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>>  	size_t len;
>>  	char *msg;
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
>>  	if (!q6v5->running) {
>>  		complete(&q6v5->stop_done);
>> @@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>>  	size_t len;
>>  	char *msg;
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	if (!q6v5->running)
>>  		return IRQ_HANDLED;
>>  
>> @@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
>>  
>>  	complete(&q6v5->start_done);
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>  
>> @@ -172,6 +181,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>>  	if (q6v5->handover)
>>  		q6v5->handover(q6v5);
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	icc_set_bw(q6v5->path, 0, 0);
>>  
>>  	q6v5->handover_issued = true;
>> @@ -234,6 +246,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>  
>> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
>> +{
>> +	struct qcom_q6v5 *q6v5 = data;
>> +
>> +	complete(&q6v5->ping_done);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
>> +{
>> +	int ret;
>> +	int ping_failed = 0;
>> +
>> +	reinit_completion(&q6v5->ping_done);
>> +
>> +	/* Set master kernel Ping bit */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
>> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
>> +	if (ret) {
>> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
>> +	if (!ret) {
>> +		ping_failed = -ETIMEDOUT;
>> +		dev_err(q6v5->dev, "Failed to get back pong\n");
>> +	}
>> +
>> +	/* Clear ping bit master kernel */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
>> +	if (ret) {
>> +		pr_err("Failed to clear master kernel bits\n");
> 
> Two dev_err and one pr_err?
> 

will fix

>> +		return ret;
>> +	}
>> +
>> +	if (ping_failed)
>> +		return ping_failed;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
>> +
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
>> +{
>> +	int ret = -ENODEV;
>> +
>> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
>> +	if (IS_ERR(q6v5->ping_state)) {
>> +		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
>> +			PTR_ERR(q6v5->ping_state));
>> +		return ret;
>> +	}
>> +
>> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
>> +	if (q6v5->pong_irq < 0)
>> +		return q6v5->pong_irq;
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
>> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					"q6v5 pong", q6v5);
>> +	if (ret)
>> +		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
>> +
>> +	init_completion(&q6v5->ping_done);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
>> +
>>  /**
>>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>>   * @q6v5:	handle to be initialized
>> @@ -247,7 +330,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>>  {
>>  	int ret;
>>  
>> @@ -255,10 +338,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  	q6v5->dev = &pdev->dev;
>>  	q6v5->crash_reason = crash_reason;
>>  	q6v5->handover = handover;
>> +	q6v5->early_boot = early_boot;
>>  
>>  	init_completion(&q6v5->start_done);
>>  	init_completion(&q6v5->stop_done);
>>  
>> +	if (early_boot)
>> +		init_completion(&q6v5->subsys_booted);
>> +
>>  	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
>>  	if (q6v5->wdog_irq < 0)
>>  		return q6v5->wdog_irq;
>> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
>> index 5a859c41896e..8a227bf70d7e 100644
>> --- a/drivers/remoteproc/qcom_q6v5.h
>> +++ b/drivers/remoteproc/qcom_q6v5.h
>> @@ -12,27 +12,35 @@ struct rproc;
>>  struct qcom_smem_state;
>>  struct qcom_sysmon;
>>  
>> +#define PING_TIMEOUT 500 /* in milliseconds */
>> +#define PING_TEST_WAIT 500 /* in milliseconds */
>> +
>>  struct qcom_q6v5 {
>>  	struct device *dev;
>>  	struct rproc *rproc;
>>  
>>  	struct qcom_smem_state *state;
>> +	struct qcom_smem_state *ping_state;
>>  	struct qmp *qmp;
>>  
>>  	struct icc_path *path;
>>  
>>  	unsigned stop_bit;
>> +	unsigned int ping_bit;
>>  
>>  	int wdog_irq;
>>  	int fatal_irq;
>>  	int ready_irq;
>>  	int handover_irq;
>>  	int stop_irq;
>> +	int pong_irq;
>>  
>>  	bool handover_issued;
>>  
>>  	struct completion start_done;
>>  	struct completion stop_done;
>> +	struct completion subsys_booted;
>> +	struct completion ping_done;
>>  
>>  	int crash_reason;
>>  
>> @@ -40,11 +48,13 @@ struct qcom_q6v5 {
>>  
>>  	const char *load_state;
>>  	void (*handover)(struct qcom_q6v5 *q6v5);
>> +
>> +	bool early_boot;
>>  };
>>  
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5));
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
>>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>>  
>>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>> @@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>>  
>>  #endif
>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
>> index e98b7e03162c..1576b435b921 100644
>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> @@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
>>  		goto disable_pm;
>>  
>>  	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_adsp_pil_handover);
>> +			     desc->load_state, false, qcom_adsp_pil_handover);
>>  	if (ret)
>>  		goto disable_pm;
>>  
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 3087d895b87f..ee9bf048820a 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -2165,7 +2165,7 @@ static int q6v5_probe(struct platform_device *pdev)
>>  	qproc->has_mba_logs = desc->has_mba_logs;
>>  
>>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
>> -			     qcom_msa_handover);
>> +			     false, qcom_msa_handover);
>>  	if (ret)
>>  		goto detach_proxy_pds;
>>  
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 158bcd6cc85c..b667c11aadb5 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -35,6 +35,8 @@
>>  
>>  #define MAX_ASSIGN_COUNT 3
>>  
>> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
> 
> "retry" makes it sounds like we're doing something in a loop, but as far
> as I can tell this is the "attach timeout".
> 

will fix

>> +
>>  struct qcom_pas_data {
>>  	int crash_reason_smem;
>>  	const char *firmware_name;
>> @@ -59,6 +61,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -409,6 +412,8 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  	if (pas->smem_host_id)
>>  		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
>>  
>> +	pas->q6v5.early_boot = false;
> 
> 
> 
>> +
>>  	return ret;
>>  }
>>  
>> @@ -434,6 +439,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *adsp = rproc->priv;
> 
> Why is this variable named "adsp"?
> 

will fix

>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	if (!adsp->q6v5.early_boot)
> 
> This would imply that rproc->state == RPROC_DETACHED for a subsystem
> with !early_boot. That shouldn't be possible, I think you should be more
> vocal about this. E.g. by making this:
> 	if (WARN_ON(!adsp->q6v5.early_boot))
> 
> Or just decide that it's too defensive and drop the check.
> 

ack, we can drop this.

>> +		return -EINVAL;
>> +
>> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (crash_state) {
>> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
>> +		adsp->rproc->state = RPROC_CRASHED;
> 
> We're attaching to a running subsystem, we conclude that it has crashed,
> and we're doing nothing?
> 
> Why don't we call rproc_report_crash() here?
> 

ack

>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ready_state) {
>> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
> 
> What does this mean? Success?
> 
>> +		adsp->rproc->state = RPROC_DETACHED;
> 
> Why do we just put it back in RPROC_DETACHED? What will happen now?
> Isn't this the point where we should mark it as RPROC_RUNNING?
> 

will drop this RPROC_DETACHED, but I think it is not the right time
to set RPROC_RUNNING as we need to ping the subsystem, moreover,
__rproc_attach will set it as RPROC_ATTACHED instead of RPROC_RUNNING

>> +	} else {
> 
> /*
>  * The early-boot subsystem has not crashed, nor signalled that it's
>  * ready, wait for 5 more seconds in case it's late.
>  */
> 
> That said, this begs the questions: can this really happen and why 5
> seconds?
> 
>> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
>> +		if (!ret) {
>> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
> 
> So, we gave the subsystem timeof(kernel-boot) + 5 seconds to show sign
> of life, and it didn't show up.
> 
> To me there are two possible reasons:
> 1) The bootloader never started the subsystem
> 2) The bootloader started it, it somehow ended up in a faulty scenario
>    and we're failing to detect that.
> 
> #1 seems like a perfectly reasonable scenario e.g. during bringup and/or
> development, and the path out of it seems to be to start the subsystem.
> 
> #2 would be a faulty scenario that we want to debug, but the user
> probably want their subsystem (re)booted in the meantime.
> 

per my understanding, for the 2 reasons above, wait_for_completion_timeout
will get err, I think we can then set the status to RPROC_OFFLINE, so the
user can start it manually and do further debug.

And this wait may get success if the remoteproc is recovering by itself
at the moment/the bootup is delayed, so we set a 5 seconds timeout just
like what adsp start function do.

Actually we didn't see this really happen when we are testing with upstream
kernel, could you share your suggestion, shall we keep it or just remove the
check?


>> +			return -ETIMEDOUT;
>> +		}
> 
> We didn't time out, the subsystem did tell us something happen. There
> are four sources of this event, one of those correspond to our
> "start_done" state during normal startup. Should we really treat all
> four sources the same way here?
> 
> For two of the events, we can immediately attempt a recovery, no need to
> ping the subsystem and wait for the timeout.
> 

ACK, we can do a status check here, only ping subsystem when we get status
ready. 

For wdog/fatal interrupt, we can rely on the interrupt handler to do the
report crash and recovery.

For handover, I noticed it is enabled in the qcom_q6v5_prepare called from
qcom_pas_start, may need further check if we also need to do this prepare
in qcom_pas_attach.

>> +	}
>> +
>> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
>> +	if (ret) {
>> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
>> +		rproc->state = RPROC_CRASHED;
> 
> As above, you mark it as crashed...and then what?
> 

will call rproc_report_crash here

>> +		return ret;
>> +	}
>> +
>> +	adsp->q6v5.running = true;
>> +	return ret;
>> +}
>> +
>>  static const struct rproc_ops qcom_pas_ops = {
>>  	.unprepare = qcom_pas_unprepare,
>>  	.start = qcom_pas_start,
>> @@ -442,6 +492,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>  	.parse_fw = qcom_register_dump_segments,
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -765,7 +816,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->proxy_pd_count = ret;
>>  
>>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_pas_handover);
>> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>>  	if (ret)
>>  		goto detach_proxy_pds;
>>  
>> @@ -779,6 +830,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>> +
>> +	if (pas->q6v5.early_boot) {
>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +		if (ret)
>> +			dev_err(&pdev->dev,
>> +				"Unable to find ping/pong bits, falling back to firmware load\n");
> 
> You already printed more specific errors in
> qcom_q6v5_ping_subsystem_init(), no need to print once more here.
> 

will fix

> Regards,
> Bjorn
> 
>> +		else
>> +			pas->rproc->state = RPROC_DETACHED;
>> +	}
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>>
>> -- 
>> 2.25.1
>>

Thanks,
Jingyi

