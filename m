Return-Path: <linux-arm-msm+bounces-104069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDN5F5Wk6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:36:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7105444C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44EE430776BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218D23B27DB;
	Wed, 22 Apr 2026 10:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGJ9ffXv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lvl71SyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872623B7B9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853970; cv=none; b=bJesoPPlrWW3u5FkvTTYEOv7r5qMEuY8FNRb5Bb4Oikhe8AExrGqBPtYEJPa2tDExbWPI4523Fuzso83mluSf976d+UR56CowC6EktgtNZadGYEDSQmG5ccDpRsYHzpqhIUaAlAesKP0gwei8OqZdbEcmfxA7NihRxBKPh++9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853970; c=relaxed/simple;
	bh=dObQM6R/32cW3UHjNKhGo/HPqxPZrcDSPZUqCu5zNdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLQcI+zB0EacJL+VhzhTKdXReDki5ouJho1PPp7VYz+bOYuUER5aH1Q0XtHevxveuryIPyENNjxnzr+KtAVNQoo8ilkZrRcaYTzxbVUR+1i+6lpvGNFNmGUqhoavkFLXC4jqihvYOOKbJc+NADjTyqMv5d6Uaa8K/MdJOm2Kcjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGJ9ffXv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lvl71SyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5GZEl3083044
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1+18xNRgn9+Ez7xGrXINoqw7Xt1WZlAbcZjb5rCtck=; b=UGJ9ffXvVT/DFqeV
	4aDNynOAHN6FYTD++h3e5vgtbJL1wHnSX9U6rYlTeH4Pn234jUWGj7eefDCNfXQD
	rFTLUa5JFnXduvm+B4Jcr0SjcT3NwWIQurbj8zsWVNRIlvWTbvqbswwgQ9wSBm3T
	njScmfMte5VDiNrP7IsdFpOM4NZI/kX8qY1a79djZXBR1Vq2jXMu9nbW0dLxoTqr
	9Xjm7VqgloIIIruKa3vZR7u/mR+O/X1OmhU0mOmYyfGKEwyJdZH22E18Jn3uRDEU
	REUzg9VsPM8kW+Vqa9lvRhh+2FK7yYe69jPvrVUfF9r2LARvr84r5K06gJR1RDcX
	TLttYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmk30s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:32:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e91add2aso45717185ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853967; x=1777458767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b1+18xNRgn9+Ez7xGrXINoqw7Xt1WZlAbcZjb5rCtck=;
        b=Lvl71SyGUB23pJlOv9L4khufVlWJYovkIDPi04N7IugeESp/V9BQmSBcl9/Tp2hLka
         Ppa7ejbfFez7Ya6B28TclH8TjSHdcM3UAlosCt6rF9bhsumef2YcyPgWESbIJ0Z3czg8
         3iNL3X7uRmhrW7Lxsx+8FBjfLrE9TV4Iz4tYqBqdSD0PQaIdYoqi3obEcq8dUHrzzbKY
         vvS1V8H0qlJ041ZHF0o1f/80Ya04IyTlcyBQ1ZoL8vIY6BfnGLLUWfjZW/8iI3+fuwM4
         E2/ZDQH9Gj+bL34KrlciT8FnZzOqCsU9jQz3VC571sRPnAF7/9WnBI/StxoTfrgUJ4Y4
         sl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853967; x=1777458767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+18xNRgn9+Ez7xGrXINoqw7Xt1WZlAbcZjb5rCtck=;
        b=go611z8VNyiwwwKzKw1yRIFewISq4ktGwQqm35p5yO/FUXL1U+BJEXu2nylMtn5fMk
         OAhOH6wAzhMTpC/NTefh/LkPknmpwEXdLl6Ui3o68fVYpDy/aRNcGgs/7n1djbPhSF1N
         PeZxECXu657pDnP3XwXkP2mY8OkwzJEjGyp4jlkxUwgqOpeaxYIO7McJpBQdswvCLN7p
         kCmLjgFtPcXcGGdeo8xaytIfmiPt+PvETG9g401xvAuvkP6BZ7Sa/LZBNx0rBEP0SM4w
         YLsfawcMDku7BeWyVBuSpW0ETm/dIcAzf1OzTw7RlGJOZcQCzVzArJ94311FMwQF0ceu
         as2g==
X-Forwarded-Encrypted: i=1; AFNElJ+kiMmC1nE4hg3VBYzSLQcEwVBHk9S4LP4e1CHn1YasbTSaW1LUGlCIqGZE6waOO1KFktgMVs6/5Rsq80FD@vger.kernel.org
X-Gm-Message-State: AOJu0YxYpdtHpCTGp4+lUgCWuDVBiFdG35lhUbyHkoFhwiBcbuJK8Q4S
	5bb21tfKOsqezj70S8gAXrz76MKE15X9C1o2Sjvh5ckZW10vkcEoefJ0CXyUeM8XlwWn2iEMT0H
	UKxdj+6vzw+FvSbkA+lrkK6cD3+DtpPj8sWnUoxrdDwyTqcSGUD9OJY8WHwwm0y5VqX5uYjnia7
	Af
X-Gm-Gg: AeBDietlx5WaWDCCSFJK1g1jbANVkYnTSx96i739gsGV45phtI/PNy1FdIzG0AHDScn
	aaIcBF2SCHoUcb3Pw7NxgAnk35tDyG702kDJ4MnR+okUT/1N21+zUqHgeDnHNRlf2fPZqtmIDkG
	wYoUcm6EwWKzL9JMuhJIYPEWgBamYbuIu/t8JEuNl364SkOdaBwhX+e7QuBNGtwlYH17gHhpO/j
	jVHCPiG3XoUttaEbiMbnp0n0OD0UIvJqaPni9EVeBCb7zgQuthYnRmDgFeENtmGZtk2g+4ciAoz
	UeBxVH+DKNqaR3QSVV+rgP6Kf3jpmcghU5pktWt/N+idcVjyruF+y20A36T2UDRHFd/u4STZsDF
	6cmV/W8959QhAPWmRaOCSH0bBXwBsZ7tE16u/hoKqwVQvT5ZwNOAk31vQ
X-Received: by 2002:a17:902:f550:b0:2b2:4611:5dca with SMTP id d9443c01a7336-2b5f9f1c1edmr226337385ad.24.1776853966968;
        Wed, 22 Apr 2026 03:32:46 -0700 (PDT)
X-Received: by 2002:a17:902:f550:b0:2b2:4611:5dca with SMTP id d9443c01a7336-2b5f9f1c1edmr226337085ad.24.1776853966401;
        Wed, 22 Apr 2026 03:32:46 -0700 (PDT)
Received: from [10.206.98.126] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa16e72sm161353545ad.19.2026.04.22.03.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:32:46 -0700 (PDT)
Message-ID: <6e60a636-2693-4456-a63d-dd4165ec38ee@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
To: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
 <c0506a61-c5fb-4962-8bf1-6715178860b2@kernel.org>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <c0506a61-c5fb-4962-8bf1-6715178860b2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZROaw1icZ-1y7GmQcm7uTMLmri0gvNcO
X-Proofpoint-ORIG-GUID: ZROaw1icZ-1y7GmQcm7uTMLmri0gvNcO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMCBTYWx0ZWRfX8MXoEyNqar0g
 Tpmq5ARkNQABkiedAq75gszWtTvltNvCGLJXLPnh68W/esV/qFKXmEShjXo8s9BIRIHGEEJr6XU
 ZuVljGHGI6pRL9QhSo0ypC8cZvqcBOw7NYRkxtN9hoxp3FA9KnB/wRI52qmIH4vWkI6Nc2yqU/e
 TTU5sa6L4Z/xxNfdojjVBVzFqgFVN5xLOY7kyNxUv6Kkz1YD3cfysZ1NQ10OFed9CqYtS5nc1M7
 2JM/REdCAT3DNVpbyQ8vYphxUA1vSplRjfWXCAcmSBi+sgDurjnUXmQFWsNSXzrxVI7vrgQmpOU
 TtsgXfM63tj5BUtdX8BtW3hfu0MLUqKKjFISOou3Dq7uQXl10HrDhQHd0GjQURkqXFeW1Z1M8M/
 /cRZ1Umi1Bq4jkbdw6LvkDvt6NdbrwSjfC5sqKNXTuEh2dXwxf+NIrHAwaUohsGEfw3JnKrxN9c
 j5REC0wEFoHnj0BudUA==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8a3cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e1tWFlzL7xBfjK-YGPgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220100
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104069-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7105444C8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 13-04-2026 06:39 pm, Srinivas Kandagatla wrote:
>
> On 2/26/26 3:11 PM, Anandu Krishnan E wrote:
>> Add reference counting using kref to the fastrpc_user structure to
>> prevent use-after-free issues when contexts are freed from workqueue
>> after device release.
>>
>> The issue occurs when fastrpc_device_release() frees the user structure
>> while invoke contexts are still pending in the workqueue. When the
>> workqueue later calls fastrpc_context_free(), it attempts to access
>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
> I guess these are some of the pending invoke requests that are still
> processing and receive callback after user closes the device.
>
>>    pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
>>    lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    ...
>>    fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
>>    process_one_work+0x180/0x450
>>    worker_thread+0x26c/0x388
>>
>> Implement proper reference counting to fix this:
>> - Initialize kref in fastrpc_device_open()
>> - Take a reference in fastrpc_context_alloc() for each context
>> - Release the reference in fastrpc_context_free() when context is freed
>> - Release the initial reference in fastrpc_device_release()
>>
>> This ensures the user structure remains valid as long as there are
>> contexts holding references to it, preventing the race condition.
>>
>> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
>> Cc: stable@kernel.org
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 47356a5d5804..3ababcf327d7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>   	spinlock_t lock;
>>   	/* lock for allocations */
>>   	struct mutex mutex;
>> +	/* Reference count */
>> +	struct kref refcount;
>>   };
>>   
>>   /* Extract SMMU PA from consolidated IOVA */
>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>>   	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>   }
>>   
>> +static void fastrpc_user_free(struct kref *ref)
>> +{
>> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
>> +
>> +	fastrpc_channel_ctx_put(fl->cctx);
>> +	mutex_destroy(&fl->mutex);
>> +	kfree(fl);
>> +}
>> +
>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>> +{
>> +	kref_get(&fl->refcount);
>> +}
>> +
>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>> +{
>> +	kref_put(&fl->refcount, fastrpc_user_free);
>> +}
>> +
>>   static void fastrpc_context_free(struct kref *ref)
>>   {
>>   	struct fastrpc_invoke_ctx *ctx;
>>   	struct fastrpc_channel_ctx *cctx;
>> +	struct fastrpc_user *fl;
>>   	unsigned long flags;
>>   	int i;
>>   
>>   	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>   	cctx = ctx->cctx;
>> +	fl = ctx->fl;
>>   
>>   	for (i = 0; i < ctx->nbufs; i++)
>>   		fastrpc_map_put(ctx->maps[i]);
>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>>   	kfree(ctx->olaps);
>>   	kfree(ctx);
>>   
>> +	/* Release the reference taken in fastrpc_context_alloc() */
>> +	fastrpc_user_put(fl);
>>   	fastrpc_channel_ctx_put(cctx);
>>   }
>>   
>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   
>>   	/* Released in fastrpc_context_put() */
>>   	fastrpc_channel_ctx_get(cctx);
>> +	/* Take a reference to user, released in fastrpc_context_free() */
>> +	fastrpc_user_get(user);
>>   
>>   	ctx->sc = sc;
>>   	ctx->retval = -1;
>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   	spin_lock(&user->lock);
>>   	list_del(&ctx->node);
>>   	spin_unlock(&user->lock);
>> +	fastrpc_user_put(user);
>>   	fastrpc_channel_ctx_put(cctx);
>>   	kfree(ctx->maps);
>>   	kfree(ctx->olaps);
>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>>   	}
>>   
>>   	fastrpc_session_free(cctx, fl->sctx);
>> -	fastrpc_channel_ctx_put(cctx);
>> -
>> -	mutex_destroy(&fl->mutex);
>> -	kfree(fl);
>>   	file->private_data = NULL;
>> +	/* Release the reference taken in fastrpc_device_open */
>> +	fastrpc_user_put(fl);
> Now that we are trying to handle(wait) for the cases where wq will get
> callbacks after the fd is closed, how are we making sure that memory
> associated with these invoke, init memory and mmaps are not released?

I will move the cleanups to fastrpc_user_free so that cleanup wont happen until

all user references are released

>
>
> Also now that we have a refcount for the fastrpc_user, is it possible to
>   remove the refcount on the context, as this seems redundant now, we
> could just use the user refcount instead. May be other patch..

I will check on this and if possible to remove, i will share a separate patch

-Anandu

>
>
> --srini
>>   
>>   	return 0;
>>   }
>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>   	spin_lock_irqsave(&cctx->lock, flags);
>>   	list_add_tail(&fl->user, &cctx->users);
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> +	kref_init(&fl->refcount);
>>   
>>   	return 0;
>>   }

