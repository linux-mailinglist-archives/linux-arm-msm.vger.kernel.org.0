Return-Path: <linux-arm-msm+bounces-116141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lqKNM6A+R2oOUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 272826FE7B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 06:46:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i6c+HR87;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HKtpLfjK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF82B3014BC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 04:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED7031F985;
	Fri,  3 Jul 2026 04:45:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A333191D0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 04:45:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053956; cv=none; b=h/odxZVA9OtfA4sUbTdM3tL8FeM59K4UQo96BbNfqwPnMKcq50c8+lIAm1wnRLEu2BvZpmVn76TYldM0tQ+ijppLgpG26HPOBX/pdf5MhixcnHf1tTYL+R62Z+kJdf8mNZEkwQ57NfayZuIo7SVz08YJH1zQpz9UVAkS+jqy2yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053956; c=relaxed/simple;
	bh=QL+b1Uv/Tr6IbU7khICMy0KbSNqhdxtZNbBtNoUgWVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=ZR4krIrytXrSXSnzAwImGGz7pcscWTbOOkf2YD+6w6gqMjS0mA1azafPXaDGKr3OXaS9/TRIuwSvgAw5jWz/WpUZN7wiOWiUy+grZrz9HujyDpL/3mTJOoQ40RUcH0+a3QODrCmmqvkDYKXrystxjVRPt/1Msbk86jgK93ARwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6c+HR87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKtpLfjK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342XUR2817760
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 04:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mK64gRUrP1jCi37aIEHAFmpI/+fr4iexNBUgM3vWG1k=; b=i6c+HR87E+mptGUT
	c6J73ULsKq4y2pb3ZoBgo5KOrCZezfUzcLZcA9jauzR31XS+BRxE5gYvBbVd/s/S
	BftW3VHjhc2yqIULhA9LxiN38VF7ZnD8qme4DbrMtYOlGvdc0tt/CZah3KQKN42s
	bY7PAFRCew6Qz03DSwS5T0HAhfD/C/oAVol3dvXNeUBN9T59qIDtw2CJDaFQLw1e
	Dd2fl86Z3/kZUlvvv+6UMB6wXaTffooGv2RAWCkc4EmNyC43X5IrPAI9He3Ytz3H
	DmPGCpGfRdsV6g6bZ3eM8Ic++i+yEIWRagqxkltjVt196P5hrAgLEoQyqR6N3n8c
	QQudNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnjh8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:45:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c9e994869aso2922765ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783053939; x=1783658739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mK64gRUrP1jCi37aIEHAFmpI/+fr4iexNBUgM3vWG1k=;
        b=HKtpLfjKgZfxm5xqt/SxHaCq+dRJFCLQfuIUoFn7FGcEjtSlcTowZO+paOPJkgxxAD
         lQyI6jyPd0qrd59OD8UqxEIIH7Hej8F79LGLa6zzLPTiTcYM70RpoYdZgR+Z1x4y4fR1
         qKf8i4PQLy6EbY0Lq1ZjFQXNiHlZQiYxWb0gTyKUV7Ul1ST10r2nEfdJOxJ+7Qu4QsNn
         kiQeF5C4UUGs2Vu5mn3MXqZEez2umh0N7aVxBkPlLokrXxUfIpdu98dt+HTBNzbZiJ85
         2zBouEjufJIKSKgW4MPs0C+OJta0B4P2NzqUKirgN4fOQBOMC7Q4CsnVrkkdYkUcXR2h
         f17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783053939; x=1783658739;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK64gRUrP1jCi37aIEHAFmpI/+fr4iexNBUgM3vWG1k=;
        b=fYgySQENqOztHZKhFbaBUylrseNgocmGAaGqNCmx2j4/nh9ES4nzGve+RoD2ptsdY4
         /FcRbFQDFcFvSO2JqvN5jkI2DTnyjTKGPr+DqMDBqkkNkI5Tt4Drz2TsYKUD6c8aX9sD
         YzBUhBYaFnDS+ulpcraRutrVRhuc6XTf6DhErv2ql16stR3umsEgl41GQYs+wDjU90Oq
         s7XwtRMK9w/ivNZN59XwvBanyr9yfjrmn1KnLKQzKgoaPHPiZNnah+JD7B8QZeJivUYp
         qStLKrnI8Yj0cdkFUx03Ef1M0Mj/hyDN1pU4P4D8L2W263ws1J4xUjJ4KHz2+C69vo/w
         TElQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhIq5UXzO13ojE9hstzfNcaYoUtwAGCJCRNLFA5PBTujYzkO0/C+ZtwvIECzI+FwZNWN9vBpHJTUrkWloX@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwSETyBF4ASOm6tuN+93hoEjNEVKOh7jYoAkbyr4hP/R35NNO
	rXt6VddINVbZUpeANOmDn4I8Wy5Tg/MrWEK13TJoOmWZoNCvkGBpamQckmSthlFA29jJSZWQ3ld
	xopLrc/EnBLg11GiY4TaTcgxuny7NzFsD0pr2/Gjza3GwkhGvD0GoNeBsFlSw2F2C8C/H
X-Gm-Gg: AfdE7cmJqOE1yW3Dg9okH9cZG1GIq81Mh82TLXm7UYnWxtqmxqufr5Q3VrXF7ghcDgU
	uB1ACzEXSxQ98LZVEJfQeDZm9jhPinDB6WIGXGmt+pKkg9MmqSpyEgpVKyPpVwLKcVL8sLzQLtH
	m3e+f4EkqxGG15XENikWAVlh1VWFsqSO36v49AnDNZCnfRViCqaX0RRMOY4UBeL6qw2wsWUpb0N
	Kme7MYwE0BBsDU+Tf9w6y104rJdFIb7W9jD7aYB72BQrhfm6oWQ8eTtfkVna/rOYzoVtoPW4L/R
	zs1KgBWFy6uW6MzAut3UTgEDh+Hl/z6vBSEs/HFCrsaaL9bG8cCRl75fWml7cJhaocTWocQo4j0
	jmAPo15jc9tFlqmohqyf4CJT/zxwhwUMV2drHtxHC04ANpVOs5+QAi9gjiY4rKxlTxOywESX/ut
	ECh4C9aQ==
X-Received: by 2002:a17:902:f543:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2ca7e882dd6mr98199655ad.39.1783053938705;
        Thu, 02 Jul 2026 21:45:38 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2ca7e882dd6mr98199175ad.39.1783053937967;
        Thu, 02 Jul 2026 21:45:37 -0700 (PDT)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad776589fsm3083945ad.43.2026.07.02.21.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 21:45:35 -0700 (PDT)
Message-ID: <056046b5-00bf-449a-8945-43fa11329286@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:45:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Srinivas Kandagatla <srini@kernel.org>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
 <20260609025938.457-4-jianping.li@oss.qualcomm.com>
 <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: amahesh@qti.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        abelvesa@kernel.org, jorge.ramirez-ortiz@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
In-Reply-To: <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LkZW-RnpehYn5YCzEfibuJOkWAYCWA3V
X-Proofpoint-ORIG-GUID: LkZW-RnpehYn5YCzEfibuJOkWAYCWA3V
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a473e73 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kdAfD6VJjniLw_QBAp4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0MSBTYWx0ZWRfX1IydHhVhQW/i
 z3RXAk4IecK36XT1D0xEsxP5YGKhqlYxvqFS7Qvl4tp862A+/MmYGL0SrwmROgLxFzij6bWs84U
 5C2rSWPzWHhNheibcZ9GBzF6APdnDl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0MSBTYWx0ZWRfX0svBPCdQhTUz
 ncOJtzN+4KLdtbvSVQph/QrfEVVltpg5ds7AXZmW5XPcEJXH+O6IptNAfWJiTWMLxKmA37P8bYU
 esNMhEKSFMPwHOIBR7QfgCoY8sRMw/KNSzf1TlYsFm1iZAEU4SYxlN1xQ4VWOn6FYKCP5b52a2U
 pmJduNdAeFu6/kcxYdyf6CCX1e9hguodReHsNblMM4yPvxPeUcXN9V4SK6LLcuTKL3qqMpc6H8h
 6+IRhvfqFOWp1sngPNjvYSRoZqKEMlo77/kQ/2P0oPhW6zbdUBvO32JCiBJpNpMlqBInbt2f67h
 GENYatW7+I4kUfsHB5NRH0IXFmqXJuJlCB+ME0OLUVa4FjBCgTdJ8gPlK9pAc0BoqPEuMQQ6ZYM
 sevTvpijOR3DMqNVS1UnHW9kIA4OQs6vqzeIUoAtkzOwldqxQzaiG1kCYYoY9mxQ/c3bBxgcZCq
 x8947eLljJ7nZmWdUHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116141-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 272826FE7B4


On 7/2/2026 4:37 AM, Srinivas Kandagatla wrote:
>
> On 6/9/26 3:59 AM, Jianping Li wrote:
>> Allocating and freeing Audio PD memory from userspace is unsafe because
>> the kernel cannot reliably determine when the DSP has finished using the
>> memory. Userspace may free buffers while they are still in use by the DSP,
>> and remote free requests cannot be safely trusted.
>>
>> Additionally, the current implementation allows userspace to repeatedly
>> grow the Audio PD heap, but does not support shrinking it. This can lead
>> to unbounded memory usage over time, effectively causing a memory leak.
>>
>> Fix this by allocating the entire Audio PD reserved-memory region during
>> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
>> userspace-controlled alloc/free and ensures that memory is reclaimed only
>> when the DSP process is torn down.
>>
>> Add explicit validation for remote_heap presence and size before sending
>> the memory to DSP, and fail early if the reserved-memory region is
>> missing or incomplete.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 112 ++++++++++++++++++++++-------------------
>>   1 file changed, 59 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 517884000331..1942e74535e5 100644
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
>> @@ -1341,15 +1343,24 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>> +
>> +	if (!cctx->remote_heap || !cctx->remote_heap->dma_addr ||
>> +	    !cctx->remote_heap->size) {
>> +		err = -ENOMEM;
>> +		dev_err(fl->sctx->dev,
>> +			"remote heap memory region is not added\n");
>> +		return err;
>> +	}
>>   
>>   	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>   	if (!args)
>> @@ -1373,31 +1384,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>> @@ -1409,8 +1395,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	if (!cctx->audio_init_mem) {
>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>> +		pages[0].size = cctx->remote_heap->size;
>> +		cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
> What is the expected behavoiur in this case?

You're right that this behaviour is subtle and deserves an in-code
comment. I'll add one in v9, right above the spin_lock, along the
lines of:
        /*
	* Audio PD is a static PD and retains the remote heap
	* information across daemon restarts. Therefore only
	* the first attach should provide heap information to
	* DSP. Subsequent attaches reuse the previously
	* initialized memory pool.
	*/

>
>> +	}
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1428,27 +1423,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>> -	fl->cctx->remote_heap = NULL;
>> -err_name:
>> +	cctx->audio_init_mem = false;
> this can race.

Thanks for the review. I'd like to clarify the intent here — please
let me know if I'm missing something.

The lock is not really there to protect 'audio_init_mem' itself,
but to make sure the following is only sent to the DSP once:

     pages[0].addr = fl->cctx->remote_heap->phys;
     pages[0].size = fl->cctx->remote_heap->size;

The flow I had in mind is:

   - Thread A enters the critical section, sees audio_init_mem == false,
     sets it to true, and proceeds to send the pages to the DSP.
   - If Thread A's invoke fails, we reset audio_init_mem back to false
     in err_invoke so that a later attempt can retry sending the region.
   - Once any thread successfully sends the region, audio_init_mem stays
     true forever and the false branch is never taken again.

So the reset on failure is only meant to allow a retry, not to be
racy with a concurrent successful path (there can't be one, since
only one thread is inside the critical section at a time). Do you
see a specific interleaving I've overlooked? If so, I'm happy to
switch to a different scheme.

>
>>   	kfree(name);
>>   err:
>>   	kfree(args);
>> @@ -2415,12 +2390,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>>   		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
>>   		if (!err) {
>> +			if (domain_id == ADSP_DOMAIN_ID) {
>> +				data->remote_heap =
>> +					kzalloc_obj(*data->remote_heap, GFP_KERNEL);
>> +				if (!data->remote_heap) {
>> +					err = -ENOMEM;
>> +					goto err_free_data;
>> +				}
>> +
>> +				data->remote_heap->dma_addr = res.start;
>> +				data->remote_heap->size = resource_size(&res);
>> +			}
>>   			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>>   			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>> @@ -2428,7 +2414,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   			if (err)
>>   				goto err_free_data;
>>   		}
>> -
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2487,6 +2472,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		misc_deregister(&data->secure_fdevice->miscdev);
>>   
>>   err_free_data:
>> +	kfree(data->remote_heap);
>>   	kfree(data);
>>   	return err;
>>   }
>> @@ -2509,6 +2495,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>> @@ -2526,8 +2513,27 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	if (cctx->remote_heap)
>> -		fastrpc_buf_free(cctx->remote_heap);
>> +	if (cctx->remote_heap && cctx->vmcount) {
>> +		u64 src_perms = 0;
>> +		struct qcom_scm_vmperm dst_perms;
>> +
>> +		for (u32 i = 0; i < cctx->vmcount; i++)
>> +			src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +
>> +		err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
>> +					  cctx->remote_heap->size, &src_perms,
>> +					  &dst_perms, 1);
>> +		if (err)
>> +			dev_err(&rpdev->dev,
>> +				"Failed to assign memory back to HLOS: dma_addr %pad size %#llx err %d\n",
>> +				&cctx->remote_heap->dma_addr, cctx->remote_heap->size, err);
>> +	}
>> +
>> +	kfree(cctx->remote_heap);
>> +	cctx->remote_heap = NULL;
>>   
>>   	of_platform_depopulate(&rpdev->dev);
>>   

