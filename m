Return-Path: <linux-arm-msm+bounces-92893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP0JOd3Rkmk1ygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:14:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4514014173C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA39F3006B4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A03D2FD1D6;
	Mon, 16 Feb 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnTJFBjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzJ5Den+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E02EE617
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229659; cv=none; b=lj1yWM9733hF3D7Ilz/MTH4T/YRBdMDaR059SlvPmB6+J1Qxf4Qhpq6LGn/PvlVvQbFUyIx9uX9Ya2I09h45wrMCdNdotSnAK7yDUi/cDIByJ6N4ce+pspf+SE0nzeVKsL6txtuafs+9H5CVrWrNI1CYTVypN6HK2+AYw9qrN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229659; c=relaxed/simple;
	bh=qS1T5b3Cz3DbktLCixMx85oyT4SIGZmhPLeucYkL4T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=no9nw5RgZU3Ngn00AvQkVJ59R6oIsLH2ISs17leXGUOxRT7bQav5lRYuRcnTmC9aCBTmUszj673HaRqhuB21790oP+PuBFPicQgit6KlOWAEZnI5r2DwZeHHhkrU6UZEXemqX/MvJAf7sFMhjAfVStuFzOBtZUZ0/4SYig3mt8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnTJFBjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzJ5Den+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FDZW2L1224615
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PZ7QzpHFD4tsxeAGD3MG3atS5r0xeaLvwHvCFQ9qnI=; b=dnTJFBjVnU2UDeNc
	3826OEhvMqBhHbIarsyj4LRhrB/Ed2avuVjGqaq70WAtGC1jY9cDf4GHFNknPGRD
	bjGnp8ASytY3D41kgQ38J/DrPvE0NLitKcEkt32RNZHyO6wZ2Ip6+aWB4Ir3Vawk
	mgtmaI2JAX1X7xvv7WUW0VbX+kv+V9CTsj7EATdeCFdhmixIfwEW8PIn8lQ5q7fj
	ah5vC2GBwU/NFo8ZDfvELIeqIDLa3yjuA+TH4Y4ARmvE4ssuSS+Pl3vSSx/pXC/R
	I+Etfm4fmN5hD1+Q3zedg0g7JYiEV7lz9o4Q+5VCKDt1fg2DsR6Ki6+VxHHVVbPD
	rp5VkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf3wb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:14:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso2559524485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771229656; x=1771834456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4PZ7QzpHFD4tsxeAGD3MG3atS5r0xeaLvwHvCFQ9qnI=;
        b=IzJ5Den+0hFMezWDmYv+CenpwFuEWm5A0FPA+pefLmq3dSpb0DyeoEtAKMPILHuvfC
         okFsFO0q7xIK5VX95hpijh6uNDuCSAlm6IeTu6Uim/5sOC/3BFiVTlAu7XFMr6ARZQoh
         3VZ2aqGMyQTZtrstKwwwX1uhD9X0XS55apu3U7KUO6BBz20biT4Se0m2JFDDtiwo403j
         EzRT5Qthd1Liemg33OEqq0hNA/tNcFR7ZaTpOjPyEJxb9sFEW45Rcd8pgCb3pldTwRbe
         viQ3SqUswTbbBhU2tienGAJurAesd7MP2WCw98pUSdxrV7UVMvmIkoCF6rL5PIN55oar
         NEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229656; x=1771834456;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PZ7QzpHFD4tsxeAGD3MG3atS5r0xeaLvwHvCFQ9qnI=;
        b=eVIiH69HVUG1yieFiiDZh1FdyM6gHkYNGBQ6g5Kx5V2azOMQ3192J1Xv5Hi8wfMraf
         ZeIRAr78LjZoP5T7fcUV3/UiinCucT3+I6fjvJFAsA3TKuA/FbvWwSR70R9y4doqXtU6
         OwfUVHRHAd8wYUtwdjm8kRseJIn0Ws2KJuITbNTaK6C1LLm3ZVyxzUfS9LPdLjyK4JX1
         6Eo6DEsilUHn41Y+ru617YaeV2MtjikeOLUtS92L8WdfnjUWdmjcV9xYAoHqGnrnp7YS
         8wRkz3pVPE4DuvwDGK89rFRMYxxTkC+wXRyFeaKurvJQEzB/aO5M+eu/Sleso7yXM/oh
         vgPA==
X-Forwarded-Encrypted: i=1; AJvYcCUkUsYFRyk2tGnd3+VRqJJ0Vp3iPql7UQP2YyENnoNI9n2+9fpPNOg3U4SMRzrDYsr8go8IMyi+7DGRLf/j@vger.kernel.org
X-Gm-Message-State: AOJu0YzTeUYCjFRsnf4sO1QdqfBy9sHMECRdeDbO0EycyS3jUvPYT39T
	mY7Pd70l135bEVyuYCcpLKmBKMNWUzHJ3OipXUNUXguEsbPu03HMUf6uZAfvBOFzVRkZGhQ/pfw
	NGQ+rRvSvddvguInq3/RyY1U7m9B4Vtk3M55ksI6BR6tedYNunIOtNp838sT48m7uCpKR
X-Gm-Gg: AZuq6aIiobYN1s9mLneez8vfUpUQPNlgJhu79t1B4xLgvFWrggCq+6LEOWI5ETXsoSi
	y0rAwpCmSeILbFxFvxovPwmOHQ8w7Tf8u1ZynMF+mNTCGxYDOhlMUg9hhPiK/fv7Q+oG6Z1eVMc
	JPsUWbREIMCELLN/FuQtI11EdgYCPiLrDwPFqz3yEZVVUKmGBfWaviuLJEjFi1BekP0PP+OUKc1
	IKDnv/KIO1x864gfrsh/0ud/gk6W3gKj3oZZdVBzTgBq1CAAvA5D1Svve5Q1gGNUYyn385YaIs4
	NJhJbasErJiwHtRx6dchQPTYidfANExl4BhV2jsRser/e0tHJnvN/IUol5Su4Qrl1+Vt2sJYqpA
	y7H+328fMLW0wM5D2V47P1iI1fHCrsDv/zZ8VTjNYUrGVWj3JEQ==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:e922:529a with SMTP id af79cd13be357-8cb4bf871d3mr881158985a.19.1771229656376;
        Mon, 16 Feb 2026 00:14:16 -0800 (PST)
X-Received: by 2002:a05:620a:2a0e:b0:8b2:e922:529a with SMTP id af79cd13be357-8cb4bf871d3mr881157285a.19.1771229655973;
        Mon, 16 Feb 2026 00:14:15 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm24965597f8f.22.2026.02.16.00.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:14:15 -0800 (PST)
Message-ID: <dfb72ee5-0576-4b9d-b109-e763273cf39f@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 09:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] firmware: qcom: uefisecapp: Annotate acquiring locks
 for sparse
To: Johan Hovold <johan@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260215110548.34152-5-krzysztof.kozlowski@oss.qualcomm.com>
 <aZLOo3tMAWhXhdkR@hovoldconsulting.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aZLOo3tMAWhXhdkR@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _3GB1oa8n4eX5OC-J4-NYFsMGmC1LfgX
X-Proofpoint-ORIG-GUID: _3GB1oa8n4eX5OC-J4-NYFsMGmC1LfgX
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992d1d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=iTd_ExjKW5fnJ_jK19gA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OCBTYWx0ZWRfX3YxIIdgdT4/Y
 irx200yfQgHoBIZbHmogk6/zWjKNK0neLpIhOdyHP36/PBL6Jf7R8rsLhvmG+/EJpyIAbuDXvnB
 sQ+1cOs9TlnaYctggX9njOAWMSf3dbMYNiWO6064fhrhU9mu43KH0IxC28ozVkuHYUfR4srRKcf
 c3yTdnCVdA1vChXliZ6RPstUpzI1tUUVmXTO/gMyB5pH61y9U2MokfTxTGf8CyWOHW5121ZORwl
 rGMp78LuLgF9Cdf7MrovPX5i6GKp6kfdMa3IGecnvhN11PKIm4VQGiVOSmJd1TrHZ//HFPXTdzu
 LPn+D9KMe0reVCBPQBxOIfpMJKbmTQogJQcodJGRZIOsa6zM8NwnqHoh1It93hNOAGrrFhO1Rct
 is9s44bqhTuPorluP4KSnQgEBSJSapFrQQ89QD94+sRfqSRlBfentG5lYuhsFf2dTkn/fBEYW/R
 pQuYr7xieJBSqDatdgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92893-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4514014173C
X-Rspamd-Action: no action

On 16/02/2026 09:00, Johan Hovold wrote:
> On Sun, Feb 15, 2026 at 12:05:50PM +0100, Krzysztof Kozlowski wrote:
>> qcuefi_acquire() and qcuefi_release() end with mutex locked or unlocked
>> respectively, so annotate them so the lock usage will be tracked by
>> sparse.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> index 21be447374aa..befa68d1dcaf 100644
>> --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>> @@ -710,6 +710,7 @@ static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
>>  }
>>  
>>  static struct qcuefi_client *qcuefi_acquire(void)
>> +	__acquires(__qcuefi_lock)
>>  {
>>  	mutex_lock(&__qcuefi_lock);
>>  	if (!__qcuefi) {
>> @@ -720,6 +721,7 @@ static struct qcuefi_client *qcuefi_acquire(void)
>>  }
>>  
>>  static void qcuefi_release(void)
>> +	__releases(__qcuefi_lock)
>>  {
>>  	mutex_unlock(&__qcuefi_lock);
>>  }
> 
> The mutex implementation does not use sparse annotation so this actually
> introduces sparse warnings (unless something changed very recently).
> 
> See 
> 	
> 	https://lore.kernel.org/all/ZJ11H8btBhvCx9gD@hovoldconsulting.com/
> 
> for what his looks like for the code in question.
> 

I checked with sparse and there were no warnings. More importantly,
mutex uses __acquires, so this apparently changed:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mutex.h#n214

Also clang v22 has context tracking, which I should probably mention as
well, and it supports mutex:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/context-analysis.rst

(this I could not test, too old LLVM, I need to set up containerized builds)

Best regards,
Krzysztof

