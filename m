Return-Path: <linux-arm-msm+bounces-99952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEqpOfhSxGljyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:26:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DF32C66B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 611AD3024524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B964538F253;
	Wed, 25 Mar 2026 21:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq1nt6pb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3Z/Mejb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F638E5D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473895; cv=none; b=tXhaQyFY2YQFCus3wNVZfX6M9XnbbyKKOH1BlSOTtPoJXNfPo1wCQYqsKt8NnMbCx6qDjJXV0BcF2kHLhZlXrt83agr2rCPiRj+USUtTxMPYXLTWeZS8raQO/hVJmYw5+sNuS5P/j8q/nNtrJrTBSYLwoh1A/6bKLdtQ/+duIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473895; c=relaxed/simple;
	bh=W5aiuxyMZuG5qye1n23wmZe/UkoiIM+s2bn37Qi23dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siv6iMyo3p2DBTcbmqBK+i32YbV+ouBV1koXEOhRAA1xqA9jglOECWhXtTgkFEEJAgFbBKzL/AyLeWde5o774Rcmd6TleZUoMklfn5zjzNeZqUbom/Rl5pSoDjGH+NSt8CXaqIACxAaeRxKma0rv6YYATRdFAGXem44L5SU18vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rq1nt6pb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3Z/Mejb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9Qu2432203
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AfCGYJqubvQ+hqpDUprihSdfOOzSMrvZeD+Kh62V36g=; b=Rq1nt6pb8oU4qEef
	RAShjodPQO94i0aiKlFLToSHQH2fqIb12iFf3+Yqiq/ikrVolMrX2p1hdHV7P3gW
	NpaU3WR9ZYDAwZn0OZcynlAWdc34m0+XJzHQjBsJ2hxLxcYvvYe5DEXbVIPoRpuV
	edSW8gwczSR7FQ30l56367bRKRSm6y4hzY4C1nKQ3nJfps4Yim7DvS6OReEYjGqT
	aVVqio3+LVY5OQqWElQ6rgMmAxztA+slWC8IXZT5rpsXQFVR4rtWRhD3dZJ+q4+X
	txBbE8qF3Yu62bn8IIcIF4RIdlENYhaucjYtZuqlXXJKK9ptqijp3ASaoo+P281u
	jEqSnw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mkp0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 21:24:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35842aa350fso1343643a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 14:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774473891; x=1775078691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AfCGYJqubvQ+hqpDUprihSdfOOzSMrvZeD+Kh62V36g=;
        b=C3Z/MejbEbhw5ZfdfaFpju4BlEEbd8efElUSNfmx6yWsalW2NJIVQcq/NJ8LrnCb6B
         Q+W06la6T2GFM6UJwVnmScVw0skywj4KdrYGGKClSxEDnS3Z6hRRSvQ71By/4GxUmPPm
         KFCoqakg7tS/ZuaGwnyhrCymO5aZXN7xt9HdE0yd+6Rq5UUHNDKixTMgdqZvd2wYzadd
         9+IwBxZoMD9C0oEnXDE/zyJ1fY9yASPpxl+uN0yBPdMLF2L7kVEx2EgTSeYZ6iguXKD2
         WxHPXWrdFsucd1iFcS0dt6jxKeK2jcBSLefMBvGnkIJ2q9zP+WEwL/v6pPD0SK2CXkgc
         K0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774473891; x=1775078691;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfCGYJqubvQ+hqpDUprihSdfOOzSMrvZeD+Kh62V36g=;
        b=HEL396UjRez5/Uu1kb8ZscmejHltgZGblsf5CUvmr19d3+VXas5IWaXRmvlfTsQz55
         h7Jye71zvzHa7qv/Yd68poutu/fLAfm2nJnCE7s1M2tZe7whX2jRGtyND+XYOB/JHAMo
         gFAkwXlGKEaM2zD3s7qs6X59WGSp+P8nNnxT63985VRmV1qOZJxOjbrqUBzcEymCzud/
         s3E0OnbzmQCifLxuI1WTauhoqtcga/Zs6kSFj0LkB70VSw6bKt+McrVReVK/xIKZUtoc
         2otkVKoupQZei9OBIwuJE4eYR+4K/P/LNLtbaeJPNDu6U6r2CfGediUDvWyMgR7ozU6c
         Bjdg==
X-Gm-Message-State: AOJu0YzrbWvUSP6Uil6ZOuS+EtHMjp4QqsZpGkRMtQF6GtKiJ0dvvpIa
	/v3jVbKQf48dsfaQwNhXkoAAdjsgTyJqOU8VnxTTSa1n/KqyS6Cspf5TK2i1ieSo9w/3FYr4+zX
	KN7P/FarlvAUzqwyQZpl1kloluGy+aY74FhWWQZbOoAlYny/1V82/bDt8yjjCKdZBuvgR
X-Gm-Gg: ATEYQzwuGicRTzrd3foAYsY+vzSmBsCRcz1nJXrs4ta4PPtPGD/xaTcSuf5vakSKE8X
	idNOk/53k1UVrQB2EjrIn+IahS1kBL9cxGMmhllPCHUD0jlXDF57Zyw44mhdKdnS4cnTIBqu36V
	KiXwD6znEpvVdqY7Nv5MZaalmmsJXo9XA1wmf9wzM6VTC5LmW2EVJ8rL6zETSinJBHfOyRqj6TJ
	QuLyUR1oZJcFkHArHYwDWvZ7usuniWAumKc72iL9vPWXQ262/0boBDBry1KRNTjqxvpHNKG2I2R
	EMGxKPlD/VqvCd7TgsA/TUub5gSF/Qcy2pTVApDU8lq4fWEgLwFbw/NQi2Y8FFEQQeaj7eFI+Ke
	1h9QtHMvQe7RoXUAs46w9qA0/2bWHTSvIn2gsyclf7RYX
X-Received: by 2002:a17:90b:2645:b0:359:ff8a:ee44 with SMTP id 98e67ed59e1d1-35c0dc8ee2bmr4558436a91.2.1774473890988;
        Wed, 25 Mar 2026 14:24:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:359:ff8a:ee44 with SMTP id 98e67ed59e1d1-35c0dc8ee2bmr4558400a91.2.1774473890521;
        Wed, 25 Mar 2026 14:24:50 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.235.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e150e47sm61548a91.1.2026.03.25.14.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 14:24:49 -0700 (PDT)
Message-ID: <6ca731e8-3876-4a9b-b54e-4d6609ae77a9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 02:54:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] drm/msm/a8xx: Fix the ticks used in submit traces
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-1-fc95b8d9c017@oss.qualcomm.com>
 <b0ce15a6-b2b4-4059-93fd-9b4b0b4360c8@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b0ce15a6-b2b4-4059-93fd-9b4b0b4360c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE1NyBTYWx0ZWRfX07HgIgx64U7D
 U6xaQf9oqgs2gDN0YnVsb69LfDmLqVu3YM6nZFkgoo8N6DKn3KpnkXWgoRVVOTezILgGTdkcX84
 cRMZ1GETYrgQRn1ealIpDNRoYc+jM91rC95gXzkYM9SWOoAxnWPFSFo29D3EKEJjspf0Lt64Gb9
 asFv34VrFCiJqPjXfks3rY5LLDtA9sotEDynFZKJX0Pd8eKdloQBNWQxgEOvHM0dYQwF2ahTEiG
 6GpUtP7ILXTPLAP16M/ETM4tneUHykr8qr0Pq81XzzjX7+ZmATMo5OiR3JW49/C7+96tyQT6Eg3
 2pltEvzru0fm0c3tRDKMdebMxoUmAYPf2LQLoqCnZ2r7yh6ueDdg31dQTuvCdc34oF7UdvKP2tv
 bQwXHXj786J7f5wgkfZQnIvb3T79a4Uexee4IimCiHx1b/SpOKkjXABlqxouGEtRTWFZWagogvn
 4wdnzKyq2SsvvVgl0ZA==
X-Proofpoint-GUID: aarvR5b-AqE4dToBsQaXhJSfbg6dAhoG
X-Proofpoint-ORIG-GUID: aarvR5b-AqE4dToBsQaXhJSfbg6dAhoG
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c452a3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=yg4K9g8yQ9z8uKSC4i4MOg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=XS4MtbDpHg606iH8EgQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250157
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B2DF32C66B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/2026 3:18 PM, Konrad Dybcio wrote:
> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>> GMU_ALWAYS_ON_COUNTER_* registers got moved in A8x, but currently, A6x
>> register offsets are used in the submit traces instead of A8x offsets.
>> To fix this, refactor a bit and use adreno_gpu->funcs->get_timestamp()
>> everywhere.
>>
>> While we are at it, update a8xx_gmu_get_timestamp() to use the GMU AO
>> counter.
>>
>> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -static int a6xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>> +static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>  
>> -	*value = read_gmu_ao_counter(a6xx_gpu);
>> -
>> -	return 0;
>> +	return read_gmu_ao_counter(a6xx_gpu);
> 
> Can we instead make read_gmu_ao_counter() take a struct msm_gpu * and drop
> this wrapper? Other callers also already have a ptr of that type
> 
> [...]
> 
>> -int a8xx_gmu_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> 
> Similarly here (also I know this is a static symbol, but keeping an
> a8xx_ prefix would be nice
> 
> [...]
> 
>>  	case MSM_PARAM_TIMESTAMP:
>>  		if (adreno_gpu->funcs->get_timestamp) {
>> -			int ret;
>> -
>>  			pm_runtime_get_sync(&gpu->pdev->dev);
>> -			ret = adreno_gpu->funcs->get_timestamp(gpu, value);
>> +			*value = (uint64_t) adreno_gpu->funcs->get_timestamp(gpu);
> 
> "u64", I think checkpathch will also warn about whitespace after a typecast

I didn't see any checkpatch error (with b4 prep --check), but we can
just remove this unnecessary typecast here.

Ack on all other suggestions.

-Akhil.

> 
> Konrad


