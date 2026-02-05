Return-Path: <linux-arm-msm+bounces-91875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPpQOJpehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FFFF05E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6984F304DA8D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400837B415;
	Thu,  5 Feb 2026 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RFOVZWrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjJCjXvN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E237AA92
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282035; cv=none; b=tdG6nHU9i3JeIP/xsqanu94RMAIUSmScal1Jzx0/KIsPEW0dhiSFwEpIfduBRH9CD9af4pQYjq0m/5KN2zlHY8LQhSo59MUlhon2tDCarcAxBWe4czlEMDVcFLgzXimT2zOis+/s2tvwx0m6hBEd7m/QknfdxtTUug/iIyQWR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282035; c=relaxed/simple;
	bh=voN/0pWQ3buzqYGZxsdWoxWzefIAUzFRZJVeXwWV/Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Ktb8jXDhGKintVngRI1fYB0okHOMN9oiFeEwAg1xTNub8cewisJt9pR7S8UIiz/r1/ZHcQtjPD/ZGlBfU/3QEYVNZWIDrht0wybemwy96iw+UtYbKbnZQ4vly8udBa+NQ23vaDMc3ieQwe+kBVIBmOlbdY358VRGcAmrL1bPsIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RFOVZWrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjJCjXvN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153e76U3246381
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=; b=RFOVZWrVLk+ThXCL
	4JVXxUz6zWQhUNxNMYPtpqhIRp9Sui0eg+dNY0kyhInhUZiTH9GpzNVu16O5ks+n
	n7XU/HlyLsc5Em27919kVN9cY5D1I2dxsiqcXSLBi52oEaJKKbtltjckrNNjc9bz
	zhWoU7zOG5Wv9bWFVQYojeTWvxNEteGIpioglUE+eve/hHT612iTxNdXbR3MZfDI
	G8xqIxcuVet2Wn9+9BxUa0eVNEJNUgZwrm0pgJJ//wnMdNXSzfsoQRQsnkAFwzaF
	J58HOOf14iqfmhHXVWUX0Hn+CtUzWibQr5wePOU9PT60BuRPh2UuSCE1U1SwAWJs
	WshVow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp51xj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:00:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-822426d844aso659644b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770282034; x=1770886834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=;
        b=TjJCjXvN719ykLur68kkQr3yUaTRjTxBeVhVkzdcYyV8VKC9OGEVJAq9l06OA78ikX
         EcVuOb/6//k4orDYf5elITh+ujgjpDQRNW0SOTqzy+RnTASFVOerSDJvUpepYaF8t1eY
         hb2R6JVHqLnp3+jdwXPV5Fxci1ZexEWOYiL/rU8uT/r2YKq9MFq/ch0GgJoavvsriyo/
         eZknN1AWE4FBcJzoU8EHMK8L0I2dlPnnAPcSFGA97pLXhRLE/d8BlFpkvQeLcSuOwFBm
         VzUC1ISJkkCkDos2bQa2ycjTEAq33GevTZzIGeaBubMPEphBYN0DXDIMapIbsGNEbnEb
         yB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770282034; x=1770886834;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5X3M5cTVffEVgtyk6KP7I9guD337bpVzGU53BIZUPc=;
        b=K4DfFQZ31vPR5cVKCVZe+B1AS93Mt3eKVaCChsaSulMDjfWUZCgB6jFHHkJbI62RnC
         pRN3ryTSmRwCThtfnKbGH+gMzkY6YCRp/fTO7rixUJmX4lxoWyutqhZYuhGNSLa89glX
         cbpvHosF/CPmjcp2ymPvFgzma2lnS6kCFyCDd/BZd7LTMuMGJ6D/NeZ4vevLw1+xqsns
         TW2DclXba79R2tj8vgbdDrlPt1CWvs5fbWIv6HTZB58DCjzPYp74dTYN7w+Lk4QqwOIg
         ER+iw8kVtwMcEouMFx5BHCkJkrvxdedX5L95aFdu2OwtUlbNiwbyigYX2p+5ZHrvo1pY
         iQow==
X-Forwarded-Encrypted: i=1; AJvYcCUpg06ZC7pjfCuQGbG4K03DAUQ82qabkSQ36LdsZpho4kM5VKzay495nHSvu5SpOu3e4n3vXWImLlL6uJ6M@vger.kernel.org
X-Gm-Message-State: AOJu0YyMJutHsgn8qJo5baKp++QT2BDqQu18Dl9m/nIChX6Ci1mZYmYk
	6jpgwP6kSdECl2DiawCqVA1/njQlkclVNqSIkGG/EabjNTalWooiY0wkgd9hUhGDXe1hqFdLIcz
	YWJfkaUyNcLo8zAQIkObAvNSnhMmrJPN4t3BQlImDb6sA5ydxCHsy7Nc8YGFXzUV+1Z43
X-Gm-Gg: AZuq6aIzYpPSWfGsgo11E5Jbc8a+kzIDJjqh2T0bzP/rg8onkXm2sIdQNVOnIN8nXnm
	kkVV69sZqV9WNbpGVqMNNupJGuOV0IPyACyuhG5YBpwKoIlz5q2mt/8A7NWpBnXXgM3tka+WJ5t
	2dIL4+HlSSZiJcog3QUtxdYQh3HrmW7MLhqaDt+3q3ziHtTzL0pdY61PgQeCMp1hk6PhgSE1rOI
	DfeQH/XtMkrE45DjIlWnHRcJHduUvh75GyIGNWj04N0uNZImqP4yOrWYkftOkoh6/TteUkOWDkD
	8ZWoIauHjFsprMMwcyb0k+JmzPAtvel1U5Xj+azP8b8DyemIcKIHDtuomwKCLGw8dAXWCV72HPM
	/Zu8f3keXrh9kYnivWgss7sg6xq0UGA2LWsdoeU+Ykcp+9dbN0HmhSlspKo+1IvZFQLkeAprUxT
	La7ECO
X-Received: by 2002:a05:6a00:ad8e:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-8242d87fbb1mr2042933b3a.1.1770282033491;
        Thu, 05 Feb 2026 01:00:33 -0800 (PST)
X-Received: by 2002:a05:6a00:ad8e:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-8242d87fbb1mr2042897b3a.1.1770282032984;
        Thu, 05 Feb 2026 01:00:32 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1a7793sm4946737b3a.17.2026.02.05.01.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 01:00:32 -0800 (PST)
Message-ID: <70ce1dd2-2345-4d5c-bab1-683c8c634c1d@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:00:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-4-jianping.li@oss.qualcomm.com>
 <3p4quidza7rwxng74fxcfoflo62tgakl7hummwsqmisaqmkwwp@nae55u2ehza4>
 <ed46e539-8cbe-4d7f-b6dd-5fd4123298fb@oss.qualcomm.com>
 <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <wmq356u5rqdjzp27zvvvjwgzsf3ft4j3gpv6fuewxm6ohg5h4s@kuf5j7hxved6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69845c32 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dWLI_mats7cmKkoWj24A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: pN03Mv3-iB3oLOXUO4PjdkZspT2kPCHN
X-Proofpoint-GUID: pN03Mv3-iB3oLOXUO4PjdkZspT2kPCHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX4hPAlD1dT1eM
 6X9be7lO/QlMJMMW6fou6Ru9/s0kF0rBUBPIvxF6zSVuKNPrb3Hmpt5yr4EEWsRKwS29EsY9Uub
 dJAZSh/nT9ynE937L0VW7nzI8UKl5EWe9ajK3bVnst3NWlvRmg3fux3zSEow/oAi/QwI7NTg9HT
 wNpuVqwSGWKOSfBFz3qEtOoxFTVc5GO9pBtTD4RIonZqU68WzADNLAP1qiuxwi653m+470sc7qh
 E+Iq3thCU0LJjyHtjmtDF7UaNBUhG9a3dvllo11ZLnfWRu3dZBJp3VoVWVfXgeP6ozsnjp0oOnn
 rbegUgLxwoRdSqmaBXGjCL54dchOjKfnBJdy5mTS/OlEYK0iYaxOjishZHse1WlSs75vzXNqz+/
 nurguHRE7hBR3P5eCXfaeL9jhK1juJBzlyCiwbeMmrfAVPJe3zfUZtaAMX9n/fxCDZ6FLvZ26wC
 GrnU0IjjMusRYJAyEQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91875-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88FFFF05E0
X-Rspamd-Action: no action



On 2/4/2026 5:15 AM, Dmitry Baryshkov wrote:
> On Mon, Feb 02, 2026 at 02:51:33PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 4:47 AM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 15, 2026 at 04:28:50PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>>>> getting removed from the list after it is unmapped from DSP. This can
>>>> create potential race conditions if any other thread removes the entry
>>>> from list while unmap operation is ongoing. Remove the entry before
>>>> calling unmap operation.
>>>>
>>>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>>>> Cc: stable@kernel.org
>>>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 28 ++++++++++++++++++++--------
>>>>    1 file changed, 20 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 4f12fa5a05aa..833c265add5e 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -202,6 +202,8 @@ struct fastrpc_buf {
>>>>    	/* mmap support */
>>>>    	struct list_head node; /* list of user requested mmaps */
>>>>    	uintptr_t raddr;
>>>> +	/* Lock for buf->node */
>>>> +	spinlock_t *list_lock;
>>>
>>> Why do you need to lock this? Isn't fl->lock enough?
>>
>> According to the discussion in v1 patch:
>> https://lore.kernel.org/all/p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg/
>>
>> The lock is stored in fastrpc_buf here.
> 
> That was a separate topic. So, why fl->lock isn't enough? What is the
> race that isn't prevented by it?
"Is fl->lock not enough?" — At the granularity of the lock, fl->lock is 
sufficient. And you can see buf->list_lock reuses fl->lock.

The purpose of doing this is to pass along lock together with the buf 
via the buf->list_lock pointer, so that all operations on buf->node no 
longer need to look for fl, reducing coupling and lowering the chance of 
errors.

If you think buf->list_lock is unnecessary, I can remove it and use 
fl->lock that makes more sense.

> 
>>>
>>>>    };
>>>>    struct fastrpc_dma_buf_attachment {
>>>> @@ -441,6 +443,7 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>>>    	buf->size = size;
>>>>    	buf->dev = dev;
>>>>    	buf->raddr = 0;
>>>> +	buf->list_lock = &fl->lock;
>>>>    	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
>>>>    				       GFP_KERNEL);
>>>> @@ -1865,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>>>    				      &args[0]);
>>>>    	if (!err) {
>>>>    		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>>>> -		spin_lock(&fl->lock);
>>>> -		list_del(&buf->node);
>>>> -		spin_unlock(&fl->lock);
>>>>    		fastrpc_buf_free(buf);
>>>>    	} else {
>>>>    		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>>>> @@ -1881,6 +1881,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    	struct fastrpc_buf *buf = NULL, *iter, *b;
>>>>    	struct fastrpc_req_munmap req;
>>>>    	struct device *dev = fl->sctx->dev;
>>>> +	int err;
>>>>    	if (copy_from_user(&req, argp, sizeof(req)))
>>>>    		return -EFAULT;
>>>> @@ -1888,6 +1889,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    	spin_lock(&fl->lock);
>>>>    	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>>>>    		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>>>> +			list_del(&iter->node);
>>>>    			buf = iter;
>>>>    			break;
>>>>    		}
>>>> @@ -1900,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>>>    		return -EINVAL;
>>>>    	}
>>>> -	return fastrpc_req_munmap_impl(fl, buf);
>>>> +	err = fastrpc_req_munmap_impl(fl, buf);
>>>> +	if (err) {
>>>> +		spin_lock(buf->list_lock);
>>>> +		list_add_tail(&buf->node, &fl->mmaps);
>>>> +		spin_unlock(buf->list_lock);
>>>> +	}
>>>> +
>>>> +	return err;
>>>>    }
>>>>    static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>> @@ -1985,20 +1994,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>>>    		}
>>>>    	}
>>>> -	spin_lock(&fl->lock);
>>>> +	spin_lock(buf->list_lock);
>>>>    	list_add_tail(&buf->node, &fl->mmaps);
>>>> -	spin_unlock(&fl->lock);
>>>> +	spin_unlock(buf->list_lock);
>>>>    	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>>>    		err = -EFAULT;
>>>> -		goto err_assign;
>>>> +		goto err_copy;
>>>>    	}
>>>>    	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>>>    		buf->raddr, buf->size);
>>>>    	return 0;
>>>> -
>>>> +err_copy:
>>>> +	spin_lock(buf->list_lock);
>>>> +	list_del(&buf->node);
>>>> +	spin_unlock(buf->list_lock);
>>>>    err_assign:
>>>>    	fastrpc_req_munmap_impl(fl, buf);
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 


