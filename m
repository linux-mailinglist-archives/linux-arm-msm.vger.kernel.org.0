Return-Path: <linux-arm-msm+bounces-107079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAF4NBwTA2r20AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:46:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4851F8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 880923055437
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A68360EDD;
	Tue, 12 May 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egVwBkRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpO0XsTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947AD360EC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586246; cv=none; b=kik7Hwll12C5LIDp9tTPhDnSgcKy9ycg3ANVsPouH37iiQd4tXfoT2Uw2n/gDikubaqxdzLq5sasT5vMgIxSs3pqba9Nu6HywbO/rXgr1wjhWDDK4KzXTH8J30E0EQj8iwRwBDt4n5ak0/nZfLSjKZZsWhROF3ifms6CVgmpdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586246; c=relaxed/simple;
	bh=3UD84u46ReNbEROsTVI8rp5vjKydSNtZDqLl5v5ZGTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvmGCLkR5BKCeKf4EuINVtg8ZZgpN2lnzgkWLaou2Mn2YEnq7J/KninGmGUFox6ZO4phhu/Vm93Ro8Z8wDiiHmSGAlMEI8tgeSfxL/OJ+Fiqnw8ozhOE9tdvBMLMC9TrEK8t20YJwehfA7ES83eiISYdhBDb5GAp9TVllpbcRTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egVwBkRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpO0XsTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAcH1h2519063
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=; b=egVwBkRq+vGDJD+F
	K8Ncxrr3jOAI1dv/DTahBBZeJrZs+m0wRBRZA0jNts5P5PeLx3xsHsetJdIaDdM5
	eBoe/Vfg7Jr2S8J5gNXssoZTFmMcZNMFTv6RT205yPFjItiupNicTHpEw+SUtjJj
	jE/GVktkoo/j4fqY5xOCuoknMnu2zwIRnXHZaSWlCTz+Y5xemgACYWb/4+sHg8bq
	a9lwO32mz13IIdIdj4e7WF4/2zJrGQxasJkkFcVVVitJo8t8tglMrlGbhTXl7uOL
	JAZdqtB6wogd1slBe3QDbJJyJtVwNY3MWRqaCpF/evZUDTItDOAIKLrEcb6cPZ2d
	fvF5kQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1k1wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 11:44:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b220c72bbso98450631cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 04:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778586242; x=1779191042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=;
        b=RpO0XsTlRkkxCiW4dgjOV/mcIY9WajeroEwizOQNVuMwzQq2gicUDvcMhJWHFK9hBy
         AtBCeD2M1WeDM4JpRgtZkYtwaGiPxkwqmpvizVa8hpZwYwbV+sF2YFO0FJ2rhHVFydom
         GyKSKKpl9B5k09ujrlJpGNvrCWv73Bgxub4dMsKkeoCPfOZgxpejtYcje5+14HKB0Hsu
         QjzMqKGqASdpAF5p4no76zbSuZMqk3k36yPmqyeJksiQjv3+RwbrcbXZQU293a2dsoWW
         f0IeP80eCTlKMOHlXhs5JOQCoafrPfMR8msqLEewzUuQAVtVKN8BycP3JXiMN90hLomm
         pieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778586242; x=1779191042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXqX0AgmphHDjjun0t9ZwnaKL20p51pBnMk5v/6dln8=;
        b=GUWQ0IjvkNUERefWhjT+/TDDatUfsgNrtKwdaAVngZGPZzQ3UpCKh812+V7ziiotsm
         fuKt5fbLKS+U53WIDq+ND4bt3RR1hMm3/FxlMWsFLdnq9WJ+40hM/VtxZUb8WF+BuQXH
         CVK3PWTIF8/kjhfVyHKsNCr2KeNfm6LI2liKAGaMvefNf8eWMp/sl7yL40kUwFguobRI
         DsHqYo3WlHfw9UBNqzRrnkMyHj4/irIzEPPxuZuMSRpgfSik1KkE35ztL4dkGkbJcm5n
         7zkHIcY2afEsLc36h7WiWP9ca0g47dt294OQCjpUrMGywp5pJR/mnfZObZIeUJpbaJVg
         o1FQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1Oz0eio64HxsyyBlItUuDN3VwkTwmGtD/gK4c8HWso6oIU6WciLwxh/g1vCuMXC2VA4MOjsV6G6sbtrgq@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbdAtYIewj37KqEwD4tq31pEessALMv70hcK+Tfa2vjVLdSSq
	XPulKRsXPC8JMC0lq7VMvsvwa7NRjZSXJTNGtb2kb9ncs0V+AMLIeYpJpZJMnY4cbyf4Thnxz4V
	6WxDEKSdmqqyuvdLXj29opja1nZytuxp5PGBLXZ08jvhYybVwkLEZo5ua/KuiubDQWbyS
X-Gm-Gg: Acq92OGfEMO+chFN7+Zy44XDSacc0zTJ1r0jLKbxDjAhsklK2OJZt9dGwU1XqIzqTZ4
	Og5dJ0uqRU1ls6EMqm1fXQ+jVNnm4MmzLydFKKLh82m/2Bdm1oCZv5Kgac2f/4vtky1dieMcNrR
	izqUCsu0xrDh5O5l1jn/mZEXeXOF7CLamt7ekoe4O4njS/5o6ckKwhe83L36KhONbtGIvm5jNwN
	AW5Hmt6Fx/lve9z3zjwbodUbBP1ihCZiWlcxfjmJ/qReMpCfZTWLP94A2jzVSNy2Z/+btUoO70a
	W16T/SsQ02fdG1UKI6zn92arKOJlaX0QUkA0+dz6HDpE1nOKxon6kjTldu0qOjhwz8CTNn4i9wg
	PlPIloybyGR3M+JfHWYsdqmxNb7Wn8B9hFO9AJWoG41Gvxe+S
X-Received: by 2002:ac8:7c44:0:b0:50d:a26e:1e95 with SMTP id d75a77b69052e-514d2237efemr36799751cf.47.1778586241789;
        Tue, 12 May 2026 04:44:01 -0700 (PDT)
X-Received: by 2002:ac8:7c44:0:b0:50d:a26e:1e95 with SMTP id d75a77b69052e-514d2237efemr36799311cf.47.1778586241337;
        Tue, 12 May 2026 04:44:01 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e9052c9fesm85887155e9.1.2026.05.12.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:44:00 -0700 (PDT)
Message-ID: <0c6c8db9-b54f-4df0-ae1f-306b7feb6d67@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:43:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260402081118.348071-14-srinivas.kandagatla@oss.qualcomm.com>
 <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5HZDNa3ayunbcvcEskLNrRQcNkGuBbwk
X-Proofpoint-ORIG-GUID: 5HZDNa3ayunbcvcEskLNrRQcNkGuBbwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyMSBTYWx0ZWRfXwKkFn/UiP3In
 5xLstaKFi8HEyHedPROHq//Sc/rICEawb57N1QKt0DJIGnB6bZ+5AsF7T/P3v9miKSRwRQZ30At
 JQjX7vm80H24zWpY1NRG3Q6iFVcUWM77/BzN19ZiRPzLpwutclVWUwqvJrKwgkO8zowqL7oBF1a
 xp5pNEgCSmdlTFf11wvrY933NF63Pk70YMeU3cPfICSwXxyZnQbMu2nEpCAyZQS0qxWgWfDAZOA
 EdnNql3IXkafQ6W/rDCXtQSvBtf1YoRtmOu2J1Hzp2iXL8jezOn4I3SnW2BwqAol+d7+g0Dd+Ey
 J/8q8CeBWB5zc0GETaUIS4LONup6ytjo/SK9r7u9EuEoRbhGcOt5Js4Q7vQ+KemhvIUNHQrL2xN
 FOaoaYv3dDRWhoWBqDTLEn5/58J48feO01jmp7g3FflUOJheixizIbzN+UO17/+TKHtGpOLn98+
 drzGjSInYLTF+KucO7g==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a031282 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uTuHR2d3_KI6eGJ4HmgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120121
X-Rspamd-Queue-Id: 2DC4851F8CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	TAGGED_FROM(0.00)[bounces-107079-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.1:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/12/26 5:09 AM, Jens Glathe wrote:
> On 02.04.26 10:11, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c |  60 ------------
>>   sound/soc/qcom/qdsp6/audioreach.h |   5 +-
>>   sound/soc/qcom/qdsp6/q6apm-dai.c  | 107 ++++++++++++++++++---
>>   sound/soc/qcom/qdsp6/q6apm.c      | 151 +++++++++++++++++++-----------
>>   sound/soc/qcom/qdsp6/q6apm.h      |  14 +--
>>   5 files changed, 202 insertions(+), 135 deletions(-)
> 
> Hi there,
> 
> I had to revert this patch from the series to get back working sound on
> sc8280xp (Blackrock) on 7.1. And hitting the right patch was pure luck,
> tbh, since I integrated the series on 6.19 and couldn't apply the last 2
> cleanly. But figured these are cleanup/refactoring and left them out.
> 
> The errors I'm getting on Blackrock are these:
> 
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: Audio Start: Buffer Allocation failed rc = -22
> Mai 11 21:26:32 volterra kernel: q6apm-dai 3000000.remoteproc:glink-
> edge:gpr:service@1:dais: ASoC error (-22): at
> snd_soc_pcm_component_new() on 3000000.remoteproc:glink-
> edge:gpr:service@1:dais
Could you please test this change on your setup and let me know if it
helps? If so, I’ll send out a proper fix.
This is a workaround for a known issue, I will add more details in the
patch that I will send once we know if it fixes the issue.

------------------------>cut<----------------------------

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c
b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ede19fdea6e9..8a1a3d8a3398 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -497,7 +497,7 @@ static int q6apm_dai_pcm_new(struct
snd_soc_component *component, struct snd_soc
 {
        struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
        struct snd_pcm *pcm = rtd->pcm;
-       int size = BUFFER_BYTES_MAX;
+       int size = BUFFER_BYTES_MAX + 4096;
        int graph_id, ret;
        struct snd_pcm_substream *substream;
------------------------>cut<----------------------------


--srini


> 
> Since I'm way out of my depth here, I won't cite from the Great
> Hallucinator's analysis. Only reporting that this refactoring breaks
> sound on sc8280xp.
> 
> with best regards
> 
> Jens
> 


