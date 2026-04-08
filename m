Return-Path: <linux-arm-msm+bounces-102263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONisEO7+1Wn4/gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:08:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ECC3B7E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C29730027BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB89375ABC;
	Wed,  8 Apr 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/GP3zb1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgsSvn1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0313750B1
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632107; cv=none; b=nmj46f1FHXin0rj3bFdWJ4b3MdeHLGVVVXg+4hdoRIGekFmaoYM60QrFpi/qu1S6eWV8Ogh4Z2UAtFW6DWdJSa37pVragOgYBXqSQe0VqLE4WVM3+saihfbpYlrD5MtlxjLJFJhNdyb9h0mGuRwnfOoJhta5lSJ7olASL9s1PHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632107; c=relaxed/simple;
	bh=ygkagFCcHOKhRKudyQDogQTuSA9LRT7ld71Bw++WnvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=u4NlctWx+Y6hgpgUCjeUx2mhhetGJlQtRq5ph5iYmkaRHkAaGb6Rlvjs3a1wtrMKU50suVgEnC/z3N5h3jjWaFijm2i9JFvPUnf07qLpLql2TZ3zF2GyAgrrddDFcowAu2ehKufw3FYl/toeJSgbgxjntabedr0TiUIkkOwf52k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/GP3zb1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgsSvn1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63876ZK41619750
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	877FAvCbad75fd+5h6oAXuySSIAvrim3Wf54095qgz4=; b=K/GP3zb1E42IwxM5
	7DDbIrNMcH/h8Mpbut/WPG6PNgktZA1pqWaQax3p5TmPKxUQcHgGvEqN9ptJZhNE
	cvKW61oGEeN67rlFmJSNvMZxanbqaiA3etyttWGvZ7bHooIJNe4PRZ1gdiVlTBeU
	7M7E2hm+d/rm88L3cf8sOhXk+cQjmkiy3LPjUXj/oFwT0JhIfyIsL6QUVnF8h6Kc
	IoHbGj1l0o80MGvJmbd1DvBIS4bgD7UibkVEQozQGaI18nais2mK7BWkrscQb7MZ
	dEtG5rqobqZqCy+gJb/PqEGQN4RTl+3AzJJ3S61UKT0m6Y33FxQXIPrkgHd+QgLl
	37dDtQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrhfyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:08:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso9784777a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775632103; x=1776236903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=877FAvCbad75fd+5h6oAXuySSIAvrim3Wf54095qgz4=;
        b=HgsSvn1DqLpLEMhafG+G3NrrN0Mh6H87jKQhDi0QevKZNC5cgVCLc110ysJZ6Jv4be
         IoqlA3VpJbvB3LCRfYlVvX/ziA4mhc6F122nP+XXmC5Ij5qkqFwWsRGuI7fIImV2TJHA
         TWZHIIMcxzXducRypOQ/JZ/VGBFgrH8jxyRj4PVtgerrfprwOeoIhWJx5m7jGwieTizy
         octH612VWUsm9YT2I50kimbdHRGfwzboAZHMKkRldANS85jeM3LAclAdekeVijIx+y8Q
         tRBTnH9v5ums9PcXAi0riA2cRM8ttDGoHWT10KCG79PU9yGXk+mROVVcCriiClsvYicS
         vvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775632103; x=1776236903;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=877FAvCbad75fd+5h6oAXuySSIAvrim3Wf54095qgz4=;
        b=BWCgO8CsyoSgrW3OgyTNY/M9ym06AHEq6Yp0+RU0bw/J3anrOFsSbdjc4q0hRDpYWP
         K/XQ/fLXw6PdMPboBjGYV3FAfISP5EionqVDhIzovo0v4hyRGiW5dlC7CEhODk8EWddm
         JS7pRPHZjR69iWcytK4PUpFF3L74H6K/d8libTo/x/Ctn7GPQhCxWjh1ZYJTLyArIWH8
         FujDeY17eWhXu3JQdyVOHg4LpvFn+d1FCEZiOSWQelYgX7Y/2FqUQl7eaghvsalfabit
         x6RkmGOmQEe6gx/yYZcjf4rZqplKHHeRh+ki5MMevLmdRccUOIfel3z5SmTVcPS10dcm
         IISg==
X-Forwarded-Encrypted: i=1; AJvYcCWiY70OL1TyQB/FEqHke+L85ZfZ31vWpdgvd68T4x0ndJyEQ4RehuOPIrZOnmHV8Ph5sHW9gGckIzpIni0z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LPdCdQMY4jry/M735nA3LszCm2gZs3SQXUGD8HNpm7QYzSmd
	0sEKIx4JofYXmVr6CU89fGHAnHm3FIVYJ91SORbPT7easaRLawNE1VAVJ8oKSRElqidvFQDUnvD
	SrvY0AVb23QMv+pAku8emCb1a0fAJ002Ah5VXBjPlkGSkeZ2c81/rxHt+dac1fn/C1LKR
X-Gm-Gg: AeBDieuF7o4N2FkQ5iobtstVylfUq6TSn3WXXCPxXfh1PdbZ6Au4ZCb0B5H4HQf4Bq7
	WdkGPMorqQvQepaNeq64SQAoC6UeDBHMazlZYrpv+6xTMWhpkhDvGscXY+EsJdiHexTqQuj5A65
	qUrFxIjivsU3iSZJe19tqhcAatmOZditzTqaUjAoPbUncsXtOWK8XloqpPkYZqtg+75cgIAwTKA
	NJ9UQWuAUxVdT25QbaAnEInTtYrQlSeQvj1vKaTh8y5EwquaIQq4Lp1oL+4zgbxuZuWn+0L/V64
	D+1de0rR6f88ql744MHwr7qhHMY5TGuqjBTfQkkkN6Dl3Aq8KNUmR5jmygMwiD/3rALIyKyMPZ0
	Kb5fTXrvJTDjUvua40GgZyCDM7x3m3GN/d15836mcon10cXc/m1w2qUs7FZXx9UbE56SC7AXwOy
	59e6n9qh0dL3pSnA==
X-Received: by 2002:a05:6a00:13a8:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82d0da7f10fmr20781498b3a.19.1775632103210;
        Wed, 08 Apr 2026 00:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a8:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82d0da7f10fmr20781482b3a.19.1775632102752;
        Wed, 08 Apr 2026 00:08:22 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9cbdfsm25266732b3a.53.2026.04.08.00.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:08:22 -0700 (PDT)
Message-ID: <7fc707fa-28a5-4c2f-b2a2-76eafd088821@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:08:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com
References: <20260407100508.1027-1-jianping.li@oss.qualcomm.com>
 <20260407100508.1027-4-jianping.li@oss.qualcomm.com>
 <57bd3c2a-1654-4042-8a4d-b11c3c81fc0e@oss.qualcomm.com>
Content-Language: en-US
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_chennak@quicinc.com
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <57bd3c2a-1654-4042-8a4d-b11c3c81fc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: R9QqWZAblLg2-P5DExGuuiLANHNSH6QX
X-Proofpoint-GUID: R9QqWZAblLg2-P5DExGuuiLANHNSH6QX
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d5fee8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=M35pbfUnKQ_2U3rZCHwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2MyBTYWx0ZWRfXz+FGBGH6rhmN
 qx1kxIhBrIikugN0POsO83xAqXu7+IdEVMoegwV5YxcT1iQN1W2of9327mFZu90lTh0wsUSXLxS
 gI2IQDtSLlWW6YIEH1YgsxGw+Zy/3H4ycsdV6W2WBlCFWl5NcNlPOk38WOEqAhY2BxgwE0SuPFM
 NAyF4uJ6P8lCIO+n4AdjGNg5+lGqq8Iqip4PEq9K8SsyAShrLILy/y7b3itqt5oop4lqxB4grXH
 /hn09EU8J0fuudRl9UvvJCIVgL7Km8LCxYWSkV/bq4aUnqAqlhMCLw3LaiXdpqvwny5NyF+ewsu
 8UMeYr4KoaJrVLiGSZ3Tv59xtFQ7yQLZTpxrJl4yYQ5yqz1Jx2eejAYaFroMY7OmkCq/UTDHe48
 2/2NbUphZN4uWazy5nM4IM1bgqO5dmz9SliMqvXCLlBTgHjsRfhT51tMCxladCQ7gYIqViZbRXA
 499GhSY1otCzTMft3Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080063
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102263-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3ECC3B7E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/8/2026 3:00 PM, Ekansh Gupta wrote:
> On 07-04-2026 15:35, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
>> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
>> controlled alloc/free and ensures memory is reclaimed only when the DSP
>> shuts down.
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 99 ++++++++++++++++++++----------------------
>>   1 file changed, 48 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 148085c3b61a..3b2dc6a9e886 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_init_create_static init;
>>   	struct fastrpc_invoke_args *args;
>>   	struct fastrpc_phy_page pages[1];
>> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>>   		u32 pageslen;
>>   	} inbuf;
>>   	u32 sc;
>> +	unsigned long flags;
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>> @@ -1327,31 +1330,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	inbuf.client_id = fl->client_id;
>>   	inbuf.namelen = init.namelen;
>>   	inbuf.pageslen = 0;
>> -	if (!fl->cctx->remote_heap) {
>> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -						&fl->cctx->remote_heap);
>> -		if (err)
>> -			goto err_name;
>> -
>> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>> -		if (fl->cctx->vmcount) {
>> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -							(u64)fl->cctx->remote_heap->size,
>> -							&src_perms,
>> -							fl->cctx->vmperms, fl->cctx->vmcount);
>> -			if (err) {
>> -				dev_err(fl->sctx->dev,
>> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
>> -					&fl->cctx->remote_heap->dma_addr,
>> -					fl->cctx->remote_heap->size, err);
>> -				goto err_map;
>> -			}
>> -			scm_done = true;
>> -			inbuf.pageslen = 1;
>> -		}
>> -	}
>>   
>>   	fl->pd = USER_PD;
>>   
>> @@ -1363,8 +1341,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!fl->cctx->audio_init_mem) {
>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> +		pages[0].size = fl->cctx->remote_heap->size;
>> +		fl->cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
> This call should fail in case memory-region was not added. Connecting
> daemon might not be correct in case there is no memory region to get
> memory for module dynamic loading and other audio PD requirements.

Thanks to Ekansh for pointing it out, I will make modifications to it in the next submission.

Thanks,
Jianping.

>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1382,26 +1369,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   	return 0;
>>   err_invoke:
>> -	if (fl->cctx->vmcount && scm_done) {
>> -		u64 src_perms = 0;
>> -		struct qcom_scm_vmperm dst_perms;
>> -		u32 i;
>> -
>> -		for (i = 0; i < fl->cctx->vmcount; i++)
>> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> -						(u64)fl->cctx->remote_heap->size,
>> -						&src_perms, &dst_perms, 1);
>> -		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
>> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>> -	}
>> -err_map:
>> -	fastrpc_buf_free(fl->cctx->remote_heap);
>> -err_name:
>> +	fl->cctx->audio_init_mem = false;
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2390,7 +2358,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>> @@ -2402,6 +2370,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   				    data->vmperms, data->vmcount);
>>   		}
>>   
>> +		if (domain_id == ADSP_DOMAIN_ID) {
>> +			data->remote_heap =
>> +				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
>> +			if (!data->remote_heap)
>> +				return -ENOMEM;
>> +
>> +			data->remote_heap->dma_addr = res.start;
>> +			data->remote_heap->size = resource_size(&res);
>> +		}
> Allocate remote_heap only if memory-region is added for ADSP.
>
> //Ekansh
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2482,6 +2459,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	bool skip_free = false;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2499,8 +2478,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap) {
>> +		if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +
>> +			for (u32 i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +						  cctx->remote_heap->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (err)
>> +				skip_free = true;
>> +		}
>> +		if (!skip_free)
>> +			fastrpc_buf_free(cctx->remote_heap);
>> +	}
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   

