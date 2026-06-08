Return-Path: <linux-arm-msm+bounces-111658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TcQdF4lGJmoRUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:35:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E86529C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:35:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Kd1l+XBT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bZFGwrqj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111658-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111658-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81DCC3015460
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 04:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6059E31F988;
	Mon,  8 Jun 2026 04:35:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86BB32B134
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 04:35:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893313; cv=none; b=o98X2nXSnuW8uDNXcJZyEJ3vpYqcLQbuFQ3bNh7eEVoT2vQsgtIj5UvVs4JWK787fhjCaT4XyMmcfm5qx1k42RZWD7fxVsCwcDHbzAjIA8e7Fn9B/Jp63WaRoMeVpIs6O8+Onwq/BYDXId/G332h+yfj+rexEjZEQ5/a8qrHikE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893313; c=relaxed/simple;
	bh=CozvAGRQPXGB9QjyXDl9viJS++NMGZ+Qd/wFr6Mjj0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=LoNqwNRl/1nesV3/F+G8XAWgGgrPCdOxkvW/BeQ/ZMaSdgAqRuz4pc9KuV3GNuu2Th07ecfEeNEqgJbmFwejyqTxpLDaK5KXen6l+arTBQrv+EDccLqxgxW4IRipdijFGwACRrNSN8pj5rYthuUG0fTaaE0FwMe1EWPTuOcDPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd1l+XBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZFGwrqj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580HPDi1993448
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 04:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foWwa/agnTOaYcmLBNq8rssldmrBJSpuoB845kBOVYU=; b=Kd1l+XBTNEgOvBoz
	F8pvzQAumWjiCDuZ8TWShetvk6qkzt4rFz0o9ZfjKMDZq9aWV9Y/5yAkcUjlq8GQ
	+zAPpplSuQqCwbh1RoiKNFn+vaESda/vj+D+vA+PGjKWgtNKQhUAF1VsorAd+BGC
	2wsviunnxPrGV5vlDVfuf2lQhKgm7OsUxqRMo7VFZoG86hWY5vMAWBQrKfx0+lV2
	BWzR2fMSQm04AqrznaU7EFIhhnNwt4xtVXT6IV/3iJN73DzoBxVPyZwzLGt5zRtw
	A1dEgndXYMYeGCtAPrboquMQdUWKgMtQFWMbQJ90ZZBrSv1uxRXQYO1jyKPT+ECO
	2UlMfA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3p728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:35:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c665easo3493887a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780893310; x=1781498110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=foWwa/agnTOaYcmLBNq8rssldmrBJSpuoB845kBOVYU=;
        b=bZFGwrqjpL5awvZGfQFbaZ2poBbZdxTa7Ta/a9wJfkVuSFYXlvYt3qMOe8VMxd4TZ+
         tt9LCdEeJ5ZGTEmsoUXfdDwvhFWachhE6KKR2uIbY9JCfmvO80oBHc2neQr2p32RtXAA
         rXNxTA3oqBSTeDDKE4IjwI1XSrq+KkXAGFy/CRtvBu5p0cfUJ3g6vLE/cdZSCfn/yVNP
         kqZjZr2pqDxkdClIASGw0snALNrFLcfbKiWs9pEhNIPr1L8D0nW781/HnfKyGrGYJaFJ
         2PH+PCBPukJIMt3/ve6b3Gs6jMWCJ1dopxy7HuSLfuXrqd4PmCJuKmIw2zwMnmWvLPzI
         w5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893310; x=1781498110;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foWwa/agnTOaYcmLBNq8rssldmrBJSpuoB845kBOVYU=;
        b=jTt13+YNzsUh86MY1KCK+nxWWhg4V9RVFD2usjJbxQUi9ZkDw/7yjOkJ63UeVa/Ett
         u2EwwsNh/22TZ0GnQJoI4kol08bwFhH+gQMXncglrRdi11pE+oCblP8oUQeKCleygM0Z
         VRvfoHCG8q8XCAUOgm6R6M15ZaEJ2Rgt60wLCKmaGu2UnS0zmrXO1OAR7lsEb1+K/Lvp
         n7MN1/JuWPGJ7AezgpJpGwL8NVu2iSDIsZ4aCe9yV0S2Z7JLcY0etEW0djM6CzdSRemv
         3ND1QcakFr5vrvBVtoUxHOcyXLGukAlBmMUTMLYxwjV0EvV3PR1FUOLTY2xX2TVgUT3t
         /kmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/91h4F42O68ZFE9toL2C02C2CkJk84G5PMV7ZpW7ga6BidRlm722GPOOeQk0Uc1ZzSg9RuCXyG9PxgUE8d@vger.kernel.org
X-Gm-Message-State: AOJu0YyVfaIQah2Y0SOBYmjShJyVt9thrdaJ/dRXiMkptpOYqmmSFJ7Q
	UykPUcxGri3EOr4pCXA826tJVDLGf8tXlW/cJg09jbYrODslJXCeVNAPXhcr1QynXRm8+ASuYBU
	CwbdlvNIqiUNs1SCJB19ixVscaVPSWsBkxHh1SEAPOUarNK5CDFcWsEh20PxzpUSkOrlg
X-Gm-Gg: Acq92OGkWN7+NN6bN0PzuR/OxPriMJBPTS2G56aYWG6thDIPjXjJkLFVVmrsKa18Aw+
	NNE4TMc+A02KHitljjzD8rxY6CfzERh+I3zPbA9L2VxSOVmJLXUQo9kFWNlU0gAvnY+UtGSFW3t
	ZJM9RNGfZe8V0Fx3b0T22QToMzMtGArk8wZgDhHZLoRH2pVFFeVo6qozXBYw/Sn6twWkCwS4+9i
	9x4i9Xyzyu2G+2M0bYZEwxoHZqmtNlxdzrGEndPamHWihrVgv5mSAAxCIDUlR+3TGqr3SLGgg3Z
	uXvCb6KfClXKL/dKiaeaId2+NlmdNqH8h0E8mMnCn9NQLK+DCO9RtD4cZB773Q+yMm3m9qSPoMm
	34V4I+rBZvdTBNYmVNplMlak+Plkb59vtYepNdh1CGCnombJk0Dl+PANQ8zTQxirOFGuSKgSJoN
	QKVV/W2xfoJsPOHt+R5OVwXAAv3x0=
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr16516199637.32.1780893309546;
        Sun, 07 Jun 2026 21:35:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:c783:b0:3b4:8f4a:3bc6 with SMTP id adf61e73a8af0-3b4ccff305bmr16516165637.32.1780893309084;
        Sun, 07 Jun 2026 21:35:09 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043ce0sm13914764a12.11.2026.06.07.21.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:35:08 -0700 (PDT)
Message-ID: <ba8252f0-5ec0-4c33-9969-e1acd1e4112d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:35:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-5-jianping.li@oss.qualcomm.com>
 <e0efec0d-b99c-4b71-bac4-4c04f243c4f6@oss.qualcomm.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <e0efec0d-b99c-4b71-bac4-4c04f243c4f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOCBTYWx0ZWRfXyP5SfUo3YqD4
 Vw+GZ1Jw3STpG9Br6jsZVJmWRumPqEWMVm1qxPahY1DSmzF4jz5R7wNUIhUl5WR2XF3WrD/XD5/
 UljFnPW2vsC030uAulV72LSRbg7nZ8tTx25vLW+hnJaIRqtwUTnFFe5WBdo8LEBO7FZjvg1FuKt
 ik3rPgHMOtrQfb21dq7SsR2dYOQvFc25qm23RfNMkngj3/RozarvvuBMQ5Eez5bQ4ZVBIxFg7Fj
 L+MPUjHOHWgZcB3Wy2fm8JlAUiP8XbNHVGCK+vcssQKvTRcyx0iEsGluaWDSk5l2OMKmNoh5Lfz
 1UM9t5jwssHhFhSaOh1kWPNv7t/QHca6OUOvyy0MoLwKZ9LnOWcoN3/jtu2/MNy5NFrbLtBnxgK
 8eY++xj2t4Xnt8QAXBpClRyIwkkYNnu+vHfhhzBiOuXCT41X+7gYkXK203Ib0A/K26VCJeIAYKq
 4gTn9As961LH4HNdfZg==
X-Proofpoint-ORIG-GUID: kshaIDloVNDmKojJYxvnGKQ7e9Q0f8C1
X-Proofpoint-GUID: kshaIDloVNDmKojJYxvnGKQ7e9Q0f8C1
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a26467e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zGuYPAm9eRiYiYFaMxgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111658-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A66E86529C1


On 6/2/2026 5:41 PM, Jie Gan wrote:
>
>
> On 6/2/2026 3:17 PM, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the 
>> DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed 
>> only
>> when the DSP process is torn down.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 96 +++++++++++++++++++-----------------------
>>   1 file changed, 43 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index f46a8f53970d..33be8bed6a0b 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>>       struct kref refcount;
>>       /* Flag if dsp attributes are cached */
>>       bool valid_attributes;
>> +    /* Flag if audio PD init mem was allocated */
>> +    bool audio_init_mem;
>>       u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>       struct fastrpc_device *secure_fdevice;
>>       struct fastrpc_device *fdevice;
>> @@ -1344,15 +1346,16 @@ static int 
>> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>       struct fastrpc_init_create_static init;
>>       struct fastrpc_invoke_args *args;
>>       struct fastrpc_phy_page pages[1];
>> +    struct fastrpc_channel_ctx *cctx = fl->cctx;
>>       char *name;
>>       int err;
>> -    bool scm_done = false;
>>       struct {
>>           int client_id;
>>           u32 namelen;
>>           u32 pageslen;
>>       } inbuf;
>>       u32 sc;
>> +    unsigned long flags;
>>         if (!fl->cctx->remote_heap ||
>>           !fl->cctx->remote_heap->dma_addr ||
>> @@ -1383,31 +1386,6 @@ static int 
>> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>       inbuf.client_id = fl->client_id;
>>       inbuf.namelen = init.namelen;
>>       inbuf.pageslen = 0;
>> -    if (!fl->cctx->remote_heap) {
>> -        err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>> -                        &fl->cctx->remote_heap);
>> -        if (err)
>> -            goto err_name;
>> -
>> -        /* Map if we have any heap VMIDs associated with this ADSP 
>> Static Process. */
>> -        if (fl->cctx->vmcount) {
>> -            u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>> -
>> -            err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> - (u64)fl->cctx->remote_heap->size,
>> -                            &src_perms,
>> -                            fl->cctx->vmperms, fl->cctx->vmcount);
>> -            if (err) {
>> -                dev_err(fl->sctx->dev,
>> -                    "Failed to assign memory with dma_addr %pad size 
>> 0x%llx err %d\n",
>> - &fl->cctx->remote_heap->dma_addr,
>> -                    fl->cctx->remote_heap->size, err);
>> -                goto err_map;
>> -            }
>> -            scm_done = true;
>> -            inbuf.pageslen = 1;
>> -        }
>> -    }
>>         fl->pd = USER_PD;
>>   @@ -1419,8 +1397,17 @@ static int 
>> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>       args[1].length = inbuf.namelen;
>>       args[1].fd = -1;
>>   -    pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -    pages[0].size = fl->cctx->remote_heap->size;
>> +    spin_lock_irqsave(&cctx->lock, flags);
>> +    if (!fl->cctx->audio_init_mem) {
>> +        pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> +        pages[0].size = fl->cctx->remote_heap->size;
>> +        fl->cctx->audio_init_mem = true;
>> +        inbuf.pageslen = 1;
>> +    } else {
>> +        pages[0].addr = 0;
>> +        pages[0].size = 0;
>> +    }
>> +    spin_unlock_irqrestore(&cctx->lock, flags);
>>         args[2].ptr = (u64)(uintptr_t) pages;
>>       args[2].length = sizeof(*pages);
>> @@ -1438,27 +1425,7 @@ static int 
>> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>         return 0;
>>   err_invoke:
>> -    if (fl->cctx->vmcount && scm_done) {
>> -        u64 src_perms = 0;
>> -        struct qcom_scm_vmperm dst_perms;
>> -        u32 i;
>> -
>> -        for (i = 0; i < fl->cctx->vmcount; i++)
>> -            src_perms |= BIT(fl->cctx->vmperms[i].vmid);
>> -
>> -        dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> -        dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -        err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>> - (u64)fl->cctx->remote_heap->size,
>> -                        &src_perms, &dst_perms, 1);
>> -        if (err)
>> -            dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 
>> %pad size 0x%llx err %d\n",
>> -                &fl->cctx->remote_heap->dma_addr, 
>> fl->cctx->remote_heap->size, err);
>> -    }
>> -err_map:
>> -    fastrpc_buf_free(fl->cctx->remote_heap);
>> -    fl->cctx->remote_heap = NULL;
>> -err_name:
>> +    fl->cctx->audio_init_mem = false;
>>       kfree(name);
>>   err:
>>       kfree(args);
>> @@ -2425,12 +2392,21 @@ static int fastrpc_rpmsg_probe(struct 
>> rpmsg_device *rpdev)
>>           }
>>       }
>>   -    if (domain_id == SDSP_DOMAIN_ID) {
>> +    if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>           struct resource res;
>>           u64 src_perms;
>>             err = of_reserved_mem_region_to_resource(rdev->of_node, 
>> 0, &res);
>>           if (!err) {
>> +            if (domain_id == ADSP_DOMAIN_ID) {
>> +                data->remote_heap =
>> +                    kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>> +                if (!data->remote_heap)
>> +                    return -ENOMEM;
>
> allocated data never free with directly return.
>
> goto err_free_data;
>
> Beside, we also need free data->remote_heap in err_free_data path as 
> you added new memory allocation.

I will adjust goto err_free_data, and add free(data->remote_heap) in 
err_free_data.

err_free_data:
     kfree(data->remote_heap);
     kfree(data);

>
>> +
>> +                data->remote_heap->dma_addr = res.start;
>> +                data->remote_heap->size = resource_size(&res);
>> +            }
>>               src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>                 err = qcom_scm_assign_mem(res.start, 
>> resource_size(&res), &src_perms,
>> @@ -2438,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct 
>> rpmsg_device *rpdev)
>>               if (err)
>>                   goto err_free_data;
>>           }
>> -
>>       }
>>         secure_dsp = !(of_property_read_bool(rdev->of_node, 
>> "qcom,non-secure-domain"));
>> @@ -2519,6 +2494,7 @@ static void fastrpc_rpmsg_remove(struct 
>> rpmsg_device *rpdev)
>>       struct fastrpc_buf *buf, *b;
>>       struct fastrpc_user *user;
>>       unsigned long flags;
>> +    int err;
>>         /* No invocations past this point */
>>       spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2536,8 +2512,22 @@ static void fastrpc_rpmsg_remove(struct 
>> rpmsg_device *rpdev)
>>       list_for_each_entry_safe(buf, b, 
>> &cctx->invoke_interrupted_mmaps, node)
>>           list_del(&buf->node);
>>   -    if (cctx->remote_heap)
>> -        fastrpc_buf_free(cctx->remote_heap);
>
> after removed the code, the cctx->remote_heap is not freed:
> 1. cctx->vmcount == 0
> 2. if (!err) is false
>
> we should free the cctx->remote_heap unconditionally if it exists.
>
> Thanks,
> Jie

You are right, after changing this to kfree here, the lifecycle should 
not be tied to whether the assignment is successful

so here we should kfree remote_heap every time.

err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
                       cctx->remote_heap->size, &src_perms,
                       &dst_perms, 1);

         if (err)
                 dev_err(&rpdev->dev,
                         "Failed to assign memory back to HLOS: dma_addr 
%pad size %#llx err %d\n",
                         &cctx->remote_heap->dma_addr,
                         cctx->remote_heap->size, err);
         }

         kfree(cctx->remote_heap);
         cctx->remote_heap = NULL;

>
>> +    if (cctx->remote_heap && cctx->vmcount) {
>> +        u64 src_perms = 0;
>> +        struct qcom_scm_vmperm dst_perms;
>> +
>> +        for (u32 i = 0; i < cctx->vmcount; i++)
>> +            src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +        dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +        dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +        err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +                      cctx->remote_heap->size, &src_perms,
>> +                      &dst_perms, 1);
>> +        if (!err)
>> +            kfree(cctx->remote_heap);
>> +    }
>>         of_platform_depopulate(&rpdev->dev);
>

