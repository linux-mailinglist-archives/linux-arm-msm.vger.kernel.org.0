Return-Path: <linux-arm-msm+bounces-95044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MLCIaFfpmlVOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 05:12:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 020141E8A59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 05:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC4C73013B62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 04:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5AA37DE84;
	Tue,  3 Mar 2026 04:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq3Bxdgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jbb8a0YW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD263806AC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 04:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772511127; cv=none; b=CSkJsLmna3K0V2eHxu8jjORtDXyA1hNJqkA7LX50iMUAj9SoVZVaeTFPLzG4lwng2BjT5zZ0Ka4aF6P2kV+Ia168NjwyD9IujNhBPZaWg5lwC2rsh7AFMwUV8T8oyT06nA7biyqnCt1iUxAa/CzDoTaUAlOyLLUmiJJsUM7TkIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772511127; c=relaxed/simple;
	bh=jv0Ppc9b/nRH4DuyNAk1Qw5DVsy1zDiysYv6TXbYVNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3LeEpV68t4Z6x85SYwOF95TrU3d6f+TWN29hOB1aRI9vDL3kyvIHYhjtAJnSjuOMNmeR4JQlvlSFloyB0VoCJ0c3U1NDr+GcZXSF2ljUaZeKvy8cxJEIXRzQcnIYuzlF4gtnBs3zgj7ABM+NNpAeZa+seCQXaNg77+vH3Lwj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq3Bxdgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jbb8a0YW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IukR11186953
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 04:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=; b=Eq3Bxdgjm/2AVxW4
	6yjXslPCJfagL15iGxk5eU6CCDkj4/USrhxGSC4flZLcwIlutiEPMzxWUvVyHdeA
	Pp7nfE+GdtpbfE/kj6bHZr4e4JFUl5gsQSKAs0yjbqGOiXgE19UA7p2PRfjMvocv
	Mmau26Uhi/SNt2UJzlgdtAumsc/CMIBM4y2uh5L6o6b41173WrLXutdPzfOyp02s
	nbucA5QDe6tBpMyWvMOJ1ViEbpA9rHDZDuFWwauw4UDWYU/gJaWujwi3lCT3GKwy
	Wc5hwyMOxFc0RGjPmQVwcqWmmD8b3EZfT2JwfkbZNCK6R2tpLqFfVx+Yv9F/te1T
	tydTow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96hj4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 04:11:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae57228f64so13948655ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 20:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772511118; x=1773115918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=;
        b=Jbb8a0YWLsERyvGwl9QG7Bv6yvhUUyQeog+U+zNLh8ejMdbqdINxtHKSKdoLpETR4F
         F3awFVt+T2MqOZM3lO+qJyVQizxxjsbPz5lNvQNTTySPnVtWo5PLmtNy72Q1VjqHVFKt
         vLW/oKKVmmiW8u7fLhPF7qZGQ1N6of10jbtqOReR+MB+Jl4AKD4qZeuFMTjdStjhlxeC
         B/UbRNGfqPAat0qcUsf3aCecPYYfy9uQ8UgdgBmjXMua4QTTR3GGSH+Q0jQX55m/F2wy
         CWeo0ixiKRLAw/w4CCPvD2TXzeNVhVkJYkzj8wOer2J0Cu1l1H0RjfYxYoOCddS6Ms+Z
         EaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772511118; x=1773115918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAXuw4WiHJ4I5hsmz1YeLDT4X8hqfp4XZsCr46xei6E=;
        b=vCh38RBCYqRFHdZKqY7xbTgt+SNCCFmcEMkrQ/LH97wuhJUF9C/pYohzTXKnpBZ4Bn
         fvCuC3UNdhsStOAAk1MOAu5gDaboMhEPDA+VdnCYswl2g6eARlIi0QWx2owB8I1JvZII
         TzQDyoiKU1OWGoBizs7V2fn5urfufGqYLfN8Pptxfio2hlJ4IJo9YHQd7oTlXVYJtUJz
         B8MvzO81w45dGpyMCf1WEVjsDIqax0kQF0dSkTvV3+aLx2IwrpojTsNYo+lnSek41vOu
         5vXA4f//MM5I2AUvABFTMU9G0jeqBDnAn82y4unysSKAgXZtP3ARpg95Hl39mV+MwzkN
         GkLw==
X-Forwarded-Encrypted: i=1; AJvYcCUggFz1CCQPs+LXx6OxTlbbllN9I7D/Sbjo3oL+WrVtrmawfiLHRbI24mFtL3c5Is8TJ7TKYsqkwQj3Ly58@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dkhieCXO9UgCmTU7DlsltLAX1LOla4wgzuPNaCPPhyru7sNW
	p68ejlUCr9dRYim7fMYPSUns2XTUbutWxkrBuNYK2bvRtg2tdTAbhfUkNBMedHTTz7Xg51jYwW5
	e25mSSK0Ew+7daTj9ex0DDbbIAAeyix1Wee8a5uiwcWhcgUrs5Jq3r8BwNZ5np+1hkrkl
X-Gm-Gg: ATEYQzxRPYZKAFfMIaw8Hg7NH32lY0gFNn5Xv8xSQJdUMMVo1sYDlQZUjHL/pU0mIgV
	gmpbVmfYlHHfsylpzCTV71Jc6hJZD3rsnh8xd6GBYM0hxaPBzKMHI7DJnz4aoxCArrMA8fjC4R1
	YB1/ccH2cnGrMnqxhQTX5UculNTj63qr/nPejnQ+UeXQQKuy64Bp7GUgdLre5yzibLs7NOA9PDo
	e2lwqwiliGQSoYapx6HMXLkDWTv4GXw6Rj7STx9RrvpDbuOncaQkTCGwLXlEXcHpazT+/e3gMLa
	EfTpCubL8OL1dr/wpeRBxXiy59myMSf2H7vPJdpxiyL7O/GyWkSBXv7YR0xGBp+RQfOGE6dJyzz
	ieQ0vnUdTfitTSz/tp5WmbT1yGRnJ71/vUpqCjAq7pti7K87JTvDh5w==
X-Received: by 2002:a17:902:da8f:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae2e4b0832mr169443835ad.32.1772511117503;
        Mon, 02 Mar 2026 20:11:57 -0800 (PST)
X-Received: by 2002:a17:902:da8f:b0:2ab:2633:d981 with SMTP id d9443c01a7336-2ae2e4b0832mr169443305ad.32.1772511116847;
        Mon, 02 Mar 2026 20:11:56 -0800 (PST)
Received: from [10.206.105.120] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm11570305ad.10.2026.03.02.20.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 20:11:56 -0800 (PST)
Message-ID: <ed94c95b-ad3a-d682-be3f-df3ba9640aa0@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 09:41:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: fix use-after-free of fmt_src during MBPF
 check
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <rUXTfoyGnkGklkQTcUpGww1LY3k1mQifzKFqJaChQkC1jTWg-_3dxJVTkYOp45jUmL45pc7DKHXZvEHaEm-Evw==@protonmail.internalid>
 <20260227-fix-use-after-free-of-fmt_src-during-mbpf-v1-1-307cdafffa2a@oss.qualcomm.com>
 <75a8b887-cbdd-4780-8262-1cc24a55bc90@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <75a8b887-cbdd-4780-8262-1cc24a55bc90@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a65f8e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xiCWW2qfg3M94FGKY5wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8cdqpIX0kvsxU868qd2_CS6XB1yUd6nV
X-Proofpoint-ORIG-GUID: 8cdqpIX0kvsxU868qd2_CS6XB1yUd6nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAyNCBTYWx0ZWRfXxUGE64iT63z1
 Cql0luK8y0r3zbHxITnufJBj3WqQaSJ1aTVlABki3EcxsASn+T34dV16lOnsU5UP6BUQl9OOqt5
 Fs7gwYT9W2YAK5O9FxhORCgXgmpNOTJTGim+wFN6i2+oASzSWSUlknAThCHLxYdpWh5DIqry+dJ
 pGeTCpJNyJ8cL9IBQnTk7HG1yNl6F6vJlzAO8i9cFYAxFnuGHZXwG2ymfd2MggFBicVRQY+lCyn
 rns5mdbdzJMF78Qe+AvMZOxA/D2iPfVhMehjDse7VWtPdxEPkjbb1qi+eZlT8BcDuY8UUEZtP9L
 qKhu0+lzuKBQrtdbfkRymR0yoLP9YpYLm1/c+Sl0jTkWorUsDKYm5oiv7R6w5txqfxpulAYsq2V
 e/wWNxxApaD++10V93WeVK1AkVuWTiN06961mSrMdI8UIlWeIc/3Emb4e5DFI0aNaGO5+W8YaPf
 MEMhppo7ZKCt4Wvks+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030024
X-Rspamd-Queue-Id: 020141E8A59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95044-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 2/28/2026 3:15 AM, Bryan O'Donoghue wrote:
> On 27/02/2026 17:33, Vishnu Reddy wrote:
>> A race condition was observed during concurrency testing. the core MBPF
>> check walks the list of active instances and reads fields such as 
>> fmt_src
>> height and width. 
>
> Where does that happen - you highlight iris_close() below - that's 
> good, what's the method or methods that can run concurrently with 
> iris_close() - you should state those in the commit log so that 
> reviewers like myself and people reading the commit in the future know 
> where to look.
>
> At the same time, iris_close() could free these format
>> structures before the instance was removed from core list. this 
>> creates a
>> use-after-free window where the MBPF checker access the freed memory and
>> read invalid values.
>
> Without looking at the code this description seems suspect.
>
> &inst->lock ought to protect inst && inst->thing if it doesn't, then 
> the lock isn't being used correctly.
>
During concurrency testing, multiple instances can be created in parallel.
Each instance has its own inst->lock, while the core list is protected 
by the global core->lock.

The race occurs because these two locks protect different scopes:
inst->lock protects fields within a single instance
core->lock protects the list of active instances

The MBPF checker walks the core instance list under the core->lock. 
While doing so,
it reads fields such as fmt_src->width and fmt_src->height from each 
instance.
Now consider what happens concurrently:

Instance A (MBPF check):
Acquires core->lock
Iterates over the instance list
Reads inst->fmt_src->width, inst->fmt_src->height, etc.

Instance B (iris_close() for a different instance):
Acquires inst->lock
Frees inst->fmt_src and inst->fmt_dst (At this moment, the instance is 
still in the core list.)
Releases inst->lock.
Later acquires core->lock and removes that instance from the core list

The problem is that fmt_src is freed before the instance is removed from 
the core list.
This creates a use‑after‑free window:
MBPF check (Instance A) is still walking the core list
It reaches the instance whose fmt_src has already been freed by Instance B
It dereferences a dangling pointer → use-after-free

This situation occurs because:
inst->lock only protects the instance internals
MBPF checker does not take inst->lock when reading fmt_src
It only relies on the core->lock, the instance is valid as long as it is 
in the core list

Therefore, ordering of freeing inst->fmt_src and inst->fmt_dest in 
iris_close() is incorrect.

The fix is to postpone freeing fmt_src and fmt_dst until after:
The instance has been removed from the core list, and
All teardown under the core lock is complete.
Will update commit description in v2.
>>
>> To fix this, the freeing of fmt_src and fmt_dst is moved to the end
>> of iris_close(), after the instance has been removed from the core
>> list and teardown is complete. This avoids accessing dangling pointers
>> during the MBPF check.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> Needs
>
> - Fixes:
> - Cc: stable
ACK
>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c | 6 ------
>>   drivers/media/platform/qcom/iris/iris_vdec.h | 1 -
>>   drivers/media/platform/qcom/iris/iris_venc.c | 6 ------
>>   drivers/media/platform/qcom/iris/iris_venc.h | 1 -
>>   drivers/media/platform/qcom/iris/iris_vidc.c | 6 ++----
>>   5 files changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..99d544e2af4f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -61,12 +61,6 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       return iris_ctrls_init(inst);
>>   }
>>
>> -void iris_vdec_inst_deinit(struct iris_inst *inst)
>> -{
>> -    kfree(inst->fmt_dst);
>> -    kfree(inst->fmt_src);
>> -}
>> -
>>   static const struct iris_fmt iris_vdec_formats_cap[] = {
>>       [IRIS_FMT_NV12] = {
>>           .pixfmt = V4L2_PIX_FMT_NV12,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h 
>> b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index ec1ce55d1375..5123d2a340e1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -9,7 +9,6 @@
>>   struct iris_inst;
>>
>>   int iris_vdec_inst_init(struct iris_inst *inst);
>> -void iris_vdec_inst_deinit(struct iris_inst *inst);
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc 
>> *f);
>>   int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>   int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c 
>> b/drivers/media/platform/qcom/iris/iris_venc.c
>> index aa27b22704eb..4d886769d958 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -79,12 +79,6 @@ int iris_venc_inst_init(struct iris_inst *inst)
>>       return iris_ctrls_init(inst);
>>   }
>>
>> -void iris_venc_inst_deinit(struct iris_inst *inst)
>> -{
>> -    kfree(inst->fmt_dst);
>> -    kfree(inst->fmt_src);
>> -}
>> -
>>   static const struct iris_fmt iris_venc_formats_cap[] = {
>>       [IRIS_FMT_H264] = {
>>           .pixfmt = V4L2_PIX_FMT_H264,
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h 
>> b/drivers/media/platform/qcom/iris/iris_venc.h
>> index c4db7433da53..00c1716b2747 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.h
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>> @@ -9,7 +9,6 @@
>>   struct iris_inst;
>>
>>   int iris_venc_inst_init(struct iris_inst *inst);
>> -void iris_venc_inst_deinit(struct iris_inst *inst);
>>   int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc 
>> *f);
>>   int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>   int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c 
>> b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index bd38d84c9cc7..5eb1786b0737 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -289,10 +289,6 @@ int iris_close(struct file *filp)
>>       v4l2_m2m_ctx_release(inst->m2m_ctx);
>>       v4l2_m2m_release(inst->m2m_dev);
>>       mutex_lock(&inst->lock);
>> -    if (inst->domain == DECODER)
>> -        iris_vdec_inst_deinit(inst);
>> -    else if (inst->domain == ENCODER)
>> -        iris_venc_inst_deinit(inst);
>>       iris_session_close(inst);
>>       iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>       iris_v4l2_fh_deinit(inst, filp);
>> @@ -304,6 +300,8 @@ int iris_close(struct file *filp)
>>       mutex_unlock(&inst->lock);
>>       mutex_destroy(&inst->ctx_q_lock);
>>       mutex_destroy(&inst->lock);
>> +    kfree(inst->fmt_src);
>> +    kfree(inst->fmt_dst);
>>       kfree(inst);
>
> On the face of it I like the logic of moving the kfree() after 
> destruction of the various other bits - however the description in the 
> log makes me question of the two locks we have are being used 
> correctly ..
>
> Please provide more detail.
Given details above and will update commit description in v2.
>>
>>       return 0;
>>
>> ---
>> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
>> change-id: 
>> 20260226-fix-use-after-free-of-fmt_src-during-mbpf-abc27f573400
>>
>> Best regards,
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>
Regards,
Vishnu Reddy

