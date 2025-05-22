Return-Path: <linux-arm-msm+bounces-58996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB60AC03D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9EC51664CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 05:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E6A1A3172;
	Thu, 22 May 2025 05:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nksMvm3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CB91A23B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890585; cv=none; b=GdBfFAGmfjVvCVTsVKptchI2gcJ6dg/mVqscB9oVA1VDG2tr83db7ix6nwtc7FqTf3f9ayM0f4FvZ705fqFdl+5mlilyQKtmBtyhgZf48xS41X+2lD39K9s/3SqY8rYZmZ883DGy2Ut6ccqZmb+MGiH+SsM/vOZPyzw37daLzSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890585; c=relaxed/simple;
	bh=U5jac6NTWbR+Hang0H3T9ju4oZKS0PrLaMr4ibJeQw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZo797ne+bwT6RNvH1jLJY663u0uBjaLWwZQMMuX5bdHhR/EaGkLsnGUsdFMT5oZjiJfzxVR6udizTrp2EuUvoM9S/OpH+T6w0z4LTPoqWOe5fs6soIKwYZJ8CdOHCz9l/LguRdIDB0YQVXnTDhJYg9rWktvesnh6j4fPWONh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nksMvm3O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIVOEl011326
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=; b=nksMvm3O+iEwUqSp
	X0rkTPz3mcnIVVZlm19BkX0QdpJA84vi6oXyGVabhhwBwxxDfTdHxi9Ha9/ZXv8K
	/SR23mM9fSth8TCnsGMK+19XttHIu2Zs3qm+1AgKu/rxeOpFxR8usjl5CT6UflLG
	gPWREWicmoL1w4DAE1eftqVGTlS5poGf1c//Wa1Q2QLR6VoHlwyb/yyC4vgPlo23
	QqbA72QQ7ck4eK4/JeWrNd8W/m+6I5oc/MvuR3qiRaD0PkPzsfnkvaZB9WTkaA9y
	FDOT1kNc9JvnHB92FqRN1fa0ip0i6Wbyyt/ayFdIoJkIQVoCiMCFdMgXBffI+4vT
	RYzn3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb50m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 05:09:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-310a0668968so1317195a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 22:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890581; x=1748495381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=;
        b=jIAR+GJDn6epi/5JFrzKjHOogukhIznzk2mo6VvawoHTviA1gfPpWBWhxc+FQbkx1s
         1Ch49E/LCpazzEsc/Wx2vhHPaWWz2G63/0of3ljlKd79Gl3ot4lsCOwHGb7g7hrj0rwR
         OBW5TVtAE4SAliS57kBjxlZVy6k/eb4iDRAlUR6osUpaXKOgLNzTareSlq8cWK46b6RZ
         dk5ANQ/sto/RTC61YOPDrw0izEZAhE9d2JonkQUSN/8kHole1FRpGFiLdmOXNt0LF5AK
         hLYwEYG9o2oDgR1FBkfpglYt9joHsb8UystQaehES3dUJ8YZSA4M8i7BWXHHrxzpp7+J
         DCLw==
X-Forwarded-Encrypted: i=1; AJvYcCXcZcsyYYC8n3r0+WaqQmjYg+NanZc+ZYWSu6YXlshItxaHED9SzCcgOqVywR4b/64tl4l+Nzlennj5JPEC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2qbEVjskkBM7EXos0n1daHEgTWlDGbG6/sm7sZDtv4n6mCCbC
	EiJWeQj6k8TBPYyMb+FMVwWMO535wZn4c+5PlmSzBdejINae25bvhCJq+eFsEhqK/cwnz9Mxffn
	tymHoycoipgnAkUqpJ2N3M2e6P/4gy/5MOH8Wonhg2uo73KB9ZUAdzQngjZp/eF6FhmeV
X-Gm-Gg: ASbGncu9qf0xkzq1J2zyjnMSOqFtVvl+01c2/NXcsGS5ZOhj6qEcfJj3v+c5pr45D9V
	VS1yUTejqr0anoqWLdDgZRHZoZ6PkxkR04FWxf33qJFM04wRwI45M7aD17PE7EogFq1jMPmUibq
	mKqOygvPf3fpCwXNkrdM1z5Z4Z5nm+GlAAFCmvuYDGRawtD2VCivpy/DXLZFYoc56K2X8Dy2yXH
	mVMwSrBpqWxBMFSU5EKdAamcm+ozRqAsTUJHj31ieY9HkkUArC2CxdNjXAkT9xXENqoVNUJW8cv
	mIfr8/6bVUic+Kl27cE2j4OfuyVWjpIDlHDco5A=
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id 98e67ed59e1d1-3108db01678mr8386461a91.17.1747890581046;
        Wed, 21 May 2025 22:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR4vGALxJNkiMpd5v9TwbWnbybVsuJ8/gUIoFTGuevTfvyKNKQ+h5H5GJWUa6LSnsO8mG89g==
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id 98e67ed59e1d1-3108db01678mr8386425a91.17.1747890580586;
        Wed, 21 May 2025 22:09:40 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36513bb7sm4630878a91.46.2025.05.21.22.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:09:40 -0700 (PDT)
Message-ID: <c970fdd9-4dab-4e02-865f-7f8e6a830088@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U8tHPHSDylM4qonYep4-YjWISX4KAAlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OCBTYWx0ZWRfXzV5qcov5npSR
 ruYipuQBmhWkJU+8YOgeJZuaM3pmE1PcU949NPwm7mSMbssZMxnlpiNZQaBoZte+j58vt3BRkIQ
 5Z8tPbqmFVslZV4pmeajJTJp+/wSv4aG50TFEAQ1Ph6DsqBis4TC78cngpTDweWJVeJBoz9glI1
 gSVsDArWgQ4B3pcChDj+hJY5Zadjn1Mwj93bY8kOPZLA332ZmCGM8xTf6faQiFNJCfJJmIqU2B5
 1t5GSeLe+4epNGC8Lrd0Hv/jCwUCdV5tRNk5CByXKtcexJLwXAwRUauRk9RaEbZaGkjOr0Apina
 6JAkBraAoj66I6HScjefoSdYfFRn2+SS6Djb0o2bexs94nE6BzsEP+XRpHw6F39IpYQtGAzdoVZ
 SQyDQ5HmJMm/0kKrv8IYjHM8Z12ejU2LC9E+HkB10w3gbZNh5FYPIrhG2eafDLMi+tLMwxsU
X-Proofpoint-GUID: U8tHPHSDylM4qonYep4-YjWISX4KAAlG
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682eb196 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MzRfKa0KFu4D08wbYRYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220048



On 5/19/2025 5:05 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ca3721365ddc..d4e38b5e5e6c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>>  	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>  	struct fastrpc_device *secure_fdevice;
>>  	struct fastrpc_device *fdevice;
>> -	struct fastrpc_buf *remote_heap;
>> +	struct list_head rhmaps;
> Other than Audiopd, do you see any other remote heaps getting added to
> this list?

With current implementation it is possible but that is not correct, I
will include a patch to restrict remote heap map and unmap requests to
audio daemon only.

>
>>  	struct list_head invoke_interrupted_mmaps;
>>  	bool secure;
>>  	bool unsigned_support;
>> @@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>  	return false;
>>  }
>>  
>> +static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
>> +{
>> +	struct fastrpc_buf *buf, *b;
>> +	struct list_head temp_list;
>> +	int err;
>> +	unsigned long flags;
>> +
>> +	INIT_LIST_HEAD(&temp_list);
>> +
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	list_splice_init(&cctx->rhmaps, &temp_list);
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
> Can you explain why do we need to do this?

To avoid any locking issue. While clean-up, I'm replacing the rhmaps
list with an empty one under a lock and cleaning up the list without
any more locking.

>
>> +
>> +	list_for_each_entry_safe(buf, b, &temp_list, node) {> +		if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +			u32 i;
>> +
>> +			for (i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (err)
>> +				continue;
> Memory leak here.

I don't see any better way to handle the failure here as the clean-up
is called when the channel is going down and there won't be any
way to free this memory if qcom_scm call fails?

Do you see any better way to address this? Or should I add a comment
highlighting this limitation?

>
>> +		}
>> +		fastrpc_buf_free(buf);
>> +	}
>> +}
>> +
> --srini


