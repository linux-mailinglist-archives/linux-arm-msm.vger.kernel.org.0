Return-Path: <linux-arm-msm+bounces-104413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG1KFDE762mMKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7379145C645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77DDD30015AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7DF38AC92;
	Fri, 24 Apr 2026 09:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0kWWs0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3mNySgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CDE38AC78
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023787; cv=none; b=rC43mhvkBAzbhRTlm2FLt8uwGBxE7I4SBGVCwZUKTF2rwF/yy5nqLujXk0xxz1zZk4IBVgcq3SLfQuvgM6YQ7BgAEcODxbWbZi66/y2q4rkrIs7oNlCKaRxn4CKoE4XZ57u5jVFDXkm5jRSK4KTR5Bca0TO9isjAvllAf0eLbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023787; c=relaxed/simple;
	bh=1GBQR8G2n6aMoWw0TMUO+qQMoVYADfYP0sxtdfMQREs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5rsmnI5BvlJsiggm1K8Y3cwgs2u+4bkz9jNlDHEInvJPhz6EysHZKI++3clBJ310Y0goBFWXWgh8b9t/uEKUMZCvFPpBOHhuq22/8ooYtq6WK/iDJD+yxCMDVwKXJ9Bw0Rh4T2Eoh8xbeNyluZ5IaO45P2DTz4xSTrtTBVam9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0kWWs0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3mNySgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9AdOa1532371
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=; b=Z0kWWs0HRRHhUCDh
	Bj6R0qs+G7JWX8+lBRaEq+R9aXQLYHqrINVCvQRw336uX+FhlREq2010BSNcPqOm
	j7ZQ2LygmT6ON8+r2IROtmo2LViFdmASZsEVwN3P7ZSsN/lo+d/CC9rV46X0NUrh
	+81SU5dsinCXFbzAKMXwSYeyc0z2E5H7f86O938PbuqKhI2lwKS2TePmw6sPS7uQ
	o4+Cqsi2yBQkv32EpFVb6qBwxMARcV/+Tzj88v+uuvznTz3fWrMImRHq9cYhNboY
	yMiYLPkTsLtPcVXej6Z+KSBYuhdtITJs5tmmikoQvv9+qs7EsFZ0XFS/Bnb8tC5k
	XfcqlA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kedu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:43:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so12560901cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777023784; x=1777628584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=;
        b=V3mNySgWRC3Nr5NDVctXzzfrv8X0cZ+r2I5tW51cXj1SKCbrMqgx+KIzydmwR+Vr3Y
         0GbWSgHwBnC80EmFQBFLGU0pubhlm9pZoAk/3qWtuySP+y1JEG+pAaj2k18T6XruRojS
         bfb4W6NrgrfQf7J6fdUcztTjIBHGD4CmjA72uKMiMp+UttVbnTa3kxAACaZnueyLyYMJ
         FoFcmBVV2vxXrAelJQp9jMlgiiYM+V6ACr65SNnN3uBc2dhlTTPIWtiKFNQk0YISEGvF
         HlvD9UjR99NygWxjjCIY9XL54JCYBiiOSVaE+zpQbnxkQuEk8gi5JQfYbj90Z5/cF++p
         LP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023784; x=1777628584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=;
        b=g0jIIj312b1KaL+QryD3+DeAJn6CbLjrnKgwjChShGgXCoEJHG72pcUAKUDMBhAnw8
         D8Mk8HOZpY9sxPStGpE4H521XUnM207fVd6kN4milDDboZwVjWEoS0Nf68NmMBqwss95
         knVr6wAQugchGSq9yRot95E87WKJih7GQTMQSJcyL8YBWs/Vj9tCMvgteiWbCrb6JuxO
         Yhzu+gDkB5GY191VR/u4XaSbUxznabooTH5TvIbDOB10HzgOtNa7RoiloW9bClE4doxC
         b4mFHvIRE4sD/WvYe1TIuBgzYGlg0+74nYmwoNsXfrHMYtmYaAfDe6N9G6jL1sYrOiPv
         J+Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9QQrnF9wgiSxnsheKirVXtL4rZuHvaPwLT2KJJanf3l+j4uh6YVC5DBS0lyl8W5SuRKU4VbZFY7bpqpq/0@vger.kernel.org
X-Gm-Message-State: AOJu0YyH9iZDNFzNDvvUh5sWKjrZ0QCzpuSWUBie0ZWW/A1Gxyc7bK7W
	aHe6/m2HFiNHQZXQ/iwWqCqF4227pVI78bJt5B6jo9mhusa8b3J1qhaNAWM6e+2Bn0PE2wUopJP
	M2YyeLEHLd28BAY1Kh50Im1QeOgedBI8YGIAhOAahaXnI8wGbn2NMgFRCoBCdPNsGSx4t
X-Gm-Gg: AeBDievz2Oe0AMi4A6FDnFqZZavMd1b9ghamF1G7kDFsmWwxjQeqU2qBwkvAqBLMWT4
	ig6QcSiDNcYlUjaqz6IEOIH33jBOhEM1gYaito7t7U7ODjKuIgtQpoG+aOZQVa/cRHyJWU6/GOD
	kiKyJnXUKcAzP6wH3gLDC8ctLYUzkJqwnvLxO1BX7BWcov0GVvgfJTRyKZlH+0qPttwAw+BlmuY
	Y65rzC1qbBhz9mKqX1ZIogzj7L1JYFHgjNch6ZZN8EfSQIYFUk47PplzrQSC1AFwFCY+zKuqbVV
	/i3bEMtZmBvsVgIkEoQelZPZy2f0s8atT7VT64wzhpKED3u+yJMOzjebZKzKM/eTtHi7AnZFSXu
	2teJwGWgUZpOPMQ+FX95g0y01UjwdHcAhTx/Qao5ZHdnOCQhJ/iw97zjzksUbVBwsryvDbOlxJ8
	F03x9qCucqvpAiVg==
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr207534311cf.1.1777023784279;
        Fri, 24 Apr 2026 02:43:04 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr207534041cf.1.1777023783763;
        Fri, 24 Apr 2026 02:43:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4516f7b11sm754655766b.14.2026.04.24.02.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:43:02 -0700 (PDT)
Message-ID: <1706c9ff-8c05-4855-be1a-1ff4c6792996@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
 <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
 <RxsrYj7kE1fS38uw9Frlum-uhzNhpKl4jkrZhaTmBCLLg5ZXTIG-2qdD8HTAyeyHfGMxjV8BAtwwsJJx28J6XApr3P2cFFmNMux3uKTUKgo=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <RxsrYj7kE1fS38uw9Frlum-uhzNhpKl4jkrZhaTmBCLLg5ZXTIG-2qdD8HTAyeyHfGMxjV8BAtwwsJJx28J6XApr3P2cFFmNMux3uKTUKgo=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TRnsnnZbrV3YYRGwHayVV34QjZRy2bdR
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb3b28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mNBZ_Hp9KTgF1tjAaBMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TRnsnnZbrV3YYRGwHayVV34QjZRy2bdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MCBTYWx0ZWRfX4uRI4HN9UH51
 H3ohegOfH4pWdQxxDAOenCOtq8kc4rJ+Jwg8fENkwM5kOfKVIbK9RPc5hQ30jqW6F3Ko8S7WOWT
 iZwrlImGkyiSoIErp1NrDUbZ7BQuxSOWfpgks0cAcsnGJcFh6Cjv2CR22O4XtKWbNZqZjy5vBDF
 R77fCcBTtWbUdxjxKq2LuKLKpYNsoowJ6sPDCeiYx4bUP2li5NNCeSopi+1hDpyK2mn+XrAwvEa
 NKqpc1j7NUOj3RpM0GWyoWj1hqTWazbXPCeAn8rPUL4ZCkw3rxMnfMPhwmDABFWUgAkfbosW6wV
 yqyNUUR394ijQiDyqWhGQsWdGGEMySNX1jBTYvO9cWl4++EHwXfaKxZioC0nSpQMRYkZFa9sTOQ
 OrnbBS6l9t1XZ+gN+RGwnECs9khpSfXtNbfMlJXRMpktN7DZ9URDNz9oudupeIeOo8wN73HIb36
 6+Omdgt2H02r43DX8Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240090
X-Rspamd-Queue-Id: 7379145C645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-104413-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 10:27 PM, Alexander Koskovich wrote:
> On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 16-Apr-26 13:05, Alexander Koskovich wrote:
>>> Add catalog entry and register configuration for the Adreno 810
>>> found in Qualcomm SM7635 (Milos) based devices.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 296 ++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>>>  2 files changed, 301 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 550ff3a9b82e..1190804632d6 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1799,6 +1799,259 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>>>  };
>>>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>>>
>>> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>>
>> To align with the latest kgsl which includes all the latest
>> recommendations, remove:
>>
>> { REG_A8XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },
>>
>> and add:
>>
>> (below RB_CCU_CNTL)
>> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
>>
>> (swap in place)
>> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
>> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>>
>> (below UCHE_CCHE_CACHE_WAYS)
>> { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>>
>> (below RB_GC_GMEM_PROTECT)
>> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> 
> Just wanted to clarify if this was a typo, since you also asked for RB_CCU_DBG_ECO_CNTL below RB_CCU_CNTL as well.

Looks like kgsl has a duplicate entry here. Just one is enough!

Konrad

