Return-Path: <linux-arm-msm+bounces-91427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP74KQVOgGlQ6AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:11:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E46DC917F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9AD030037C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9420B30DEC0;
	Mon,  2 Feb 2026 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="akFM5S10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwgHcPXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038730C614
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016028; cv=none; b=sgk9YFs+CItyJbRzMBb4UkVuiM+oZfcBDzkgxrqPblWYRocFbFfk6XMvMzUmrrFjKBVCFWRXYAIC27EPtYdrtb2UsnUgxB9XpahwiHXd1TDlm56qK3E+qJw50uYF916dsmg7fnNK1bHE7tfAymqFDNfP7HKNg0zpGGd4C09doAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016028; c=relaxed/simple;
	bh=TMYoYFPhx2ozlT21gOSPqqeF0vIQBNXDKOvyvCrRwig=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=kgLeWfhFDvCg8PuyncX7pvbmMo9VII0FJFHfKHGSRm//9T+60QlYDtVPYptsm28kRuE1NYyXJdNQbWaDZxy15Xuv3n46S6lLLFh68po40PfiPV61wURn3G+jo4oHg3RpKXYgbA9SgIUfARi4MJdZWZs7dovdEm7pSoHTWcdxpJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=akFM5S10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwgHcPXd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611Nk6H71423861
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 07:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=; b=akFM5S10KutWitgj
	hQz5mwhd5LGxpe5A74duCKVzeG08wUHBBEnoDe/j0rO2yFl5T599+qlEJF1ME4U7
	AZgDPKvkpAKuZTuyp7YcKImvvKoFIXWnaw1YFM0uufGvUgjYb43c/yl1YtP22+08
	1bFB1E57DN8vgrX6Exm0TQcLwJyI+5in4DJwRB7PE1Hp1+XHBWg7bbn3EZh7Bcqd
	PRy1jt3Ibs+icCMUJWieyW9et2vCpx75NWfh6ul19+P34ww7ufW4g910H/zVTvhY
	/atiWkGY/CqUODe6FSW6xJgh4/y7VOik5E0N6Yp6jRgZtXRwa4BpHCk3n+ulj0LI
	OMkEIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrvabk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:07:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c5d6193daso10232915a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770016025; x=1770620825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=;
        b=SwgHcPXdkieH9haZ6BDL8b+Ox1SY4kQV4SbNOfCc99qHeZagkzCXGAT0CRfNrmCynr
         doZtlBkyj90akjLYkxscDN1osipyie4ZvcE8eZQkNFhj3q+o2T7v5kSi2twTiBX4NT0Y
         jGCH6hbG5QtlgoYgd1aQ2pIvO/kA2wsmbZp0XP8WqPQDFS4T2DO4InSyqcSmp8hq9POB
         jDKvkVpYnjr6/EHngxbVhOG3z29Nj+9RJLF0aYWBH7hzSazx5tHvsgn+Rt9uHVx8ITPq
         80Btd1QkngOlDYqov8TVlaK82Zrx/RDkD8TJZXI0S5n2pt51OdUWu1xhnaoqktNkHSih
         h6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016025; x=1770620825;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8wAJw2mvNDaqQmH4BmcfF4peq5J1hUYKiatN2uAE7k=;
        b=ASjWspiadtcuCURe0jisJWjun7HDJcd0GPF6COS2nVNScdiwbrUrDi/K2lLD5+Liwd
         6ZVLHK0IR0m1EripJokBlR8A6vr1SJK4/HZuS/TFc7NsObIPvotnh3WBjvCS4uV6P070
         8v61F1aWuycq7wyFY6e25jnyKMfEZui6eWlLylU8/a3z0GIGyXUD/TVfq3BZcxmKkYk1
         ou8ZH7XL9THk9OVGiy4XP+hjEknpAQcOWQCZuglSaqgthqBOO/iO+qIlJtKL1IzOokry
         6KtFs3E4lsCcG0Oyo7KE/dIfkOxXcxcob08k1RdzSjqUVPI8bwjfDYRQPWZhnu2P2JBC
         PUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrgiQ2IOnmScUALBypnUuSI3r+DA18D5oHmjnx21wHmw8wHBNYfyNNN3F8yq1MYLjlvhnv9qCcXtmPf1Bp@vger.kernel.org
X-Gm-Message-State: AOJu0YzA45p+z5cPzX0mWhG/oSKXGs9ZscUD55kWOynBbB+s91X6RYZ1
	tunleGh9WyZyV0O0IFwnDHE0P0VQK+VNww2on0CaOrRAEwxbaFr6rocqIArmW7bvAevVigUHA16
	HVAvTm6FoR9RabDpvbf0h/7ti7EH9h0TFpeGhjFNj9AZVwEwK6fMVehhktbett0aJF4st
X-Gm-Gg: AZuq6aJ/iuVQ/y3ATk6h9en4+8uoDgiKEaWfd6RhH2qUBIb2jmVbeVgJFd/gZyj6IGr
	6hEUDx/LC1rcZr92Oy5q38xhzPgcXtikfkVZSGcggEhpeEcQ/al89P5nMguOr1+7fEeB1J0cxpk
	VL4O0br652cD6BF/PiQBKziTlaErEIRUjwMeLhiEMX0rMvCptqaLNu7Aj5HkiWtVe85NJQGt9cG
	6HnlETgqfqkH6n5s+rh/JUr+jGn+dZ7EFw0dKS6Kak2ij20os8C9UFn3wEX3zOUD5+fuuBIuFQm
	oXp0pGVFYVlr66ZvZ2tMtS2eoVG0gTvnDtir+Gq02IY6qgdsSq/iBT8o+doXYMGu0a7Ixq4gPwP
	2Y/oJVKEZoO2c4JpeB4ST3pkIg0vqvQKEMKw0j918uI3eYZO5kUKTZlnvWt4nq7t0N5alMJw02a
	FOxdT2
X-Received: by 2002:a05:6a21:338b:b0:38e:90ca:5a2b with SMTP id adf61e73a8af0-392e003618fmr11295144637.17.1770016024629;
        Sun, 01 Feb 2026 23:07:04 -0800 (PST)
X-Received: by 2002:a05:6a21:338b:b0:38e:90ca:5a2b with SMTP id adf61e73a8af0-392e003618fmr11295117637.17.1770016024084;
        Sun, 01 Feb 2026 23:07:04 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6558a1a5c9sm10616655a12.8.2026.02.01.23.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 23:07:03 -0800 (PST)
Message-ID: <3ba77da6-4a43-4e2b-b4d6-3d58c403ca0e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:06:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
 <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lnP83LIQ3HQ_l6SLDlWq8Kg_ExhMfBmt
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=69804d19 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sQQgYFI46jR9JefEgf4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA2MCBTYWx0ZWRfXwfOdbrA3LxQV
 iuyZg7lkp3G344eFI8Tu6VlHG5ntxA/k/fdal5l88anY0ZYPSYJ4/H9KHdYPWFMxMiDXnA35O23
 hdwGAb4nj2TlVpaUSPYWt/8/7ZKr9nNNMogY2QlYv5sF4AE7DuRwgYrAY3hPtsooNyVrNlFT/kA
 TZSmX6oict5/9wPBTlLfl9brIdt6YfhOtUOb/U6AbtiSMDE+98Kb6A3zFsHP+Ynl68eJvyhND02
 0TK1oznQ7VfWS052vGlgMw1Ub9IGGHn80gL/muYDeY/NsCzaX7VGPOhP/GvW5bL1S1JZG63nBmu
 f4ycuApmyRF6QyOCz8v89HNLTmwm3c6h0YxsnbdP2qkUlSk4JA+Pc8r1hKi2XhvjD4E8YNiw9te
 QYav+En3sy+KvhUhnzoAcDk1/YIfVIJ+rHXx1Lw21ZHvNot1gV1bVlMsEIPkdlILsIPr8DQWytx
 LOsQlaRyD680NIUIBAA==
X-Proofpoint-GUID: lnP83LIQ3HQ_l6SLDlWq8Kg_ExhMfBmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91427-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E46DC917F
X-Rspamd-Action: no action



On 1/16/2026 4:49 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
>> The entire reserved-memory region is now assigned to DSP VMIDs during
>> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
>> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
>> heap lifecycle to the rpmsg channel.
> 
> Why?
The reason for allocating the entire reserved‑memory region is to avoid 
unsafe alloc/free
operations from user.

This design(alloc/free from user) was fragile because:
Userspace could request free while the DSP was still using the memory.
There was no reliable, kernel‑controlled way to know when the DSP had 
finished using pages.
Remote‑side “reverse fastrpc” free requests could not be safely trusted 
or validated.

Allocating the full reserved region upfront removes the need for alloc 
from user completely.
This way the free can be moved to fastrpc_rpmsg_remove(When DSP is 
shutting down).

And I will be adding this detail in commit text also.
> 
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
>>   1 file changed, 45 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 833c265add5e..f9edca7a8de1 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
>>   	struct kref refcount;
>>   	/* Flag if dsp attributes are cached */
>>   	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>   	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>   	struct fastrpc_device *secure_fdevice;
>>   	struct fastrpc_device *fdevice;
>> @@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	struct fastrpc_phy_page pages[1];
>>   	char *name;
>>   	int err;
>> -	bool scm_done = false;
>>   	struct {
>>   		int client_id;
>>   		u32 namelen;
>> @@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> -	pages[0].size = fl->cctx->remote_heap->size;
>> +	if (!fl->cctx->audio_init_mem) {
>> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
>> +		pages[0].size = fl->cctx->remote_heap->size;
> 
> Do we need a flag? Can't we assume that remote_heap is always to be
> allocated to the PD?
We do need the audio_init_mem flag.
Once the PD starts and daemon takes the memory for the first time, PD 
will start using the memory,
meanwhile, the daemon can be killed and restarted. In this case, the 
memory is still with the PD and the next
daemon connection should not take any memory for the next request. This 
flag is maintained to ensure that.
The memory needs to be resent only if Audio PD on DSP restarts(due to 
PD-restart or Subsystem-restart)

> 
>> +		fl->cctx->audio_init_mem = true;
>> +		inbuf.pageslen = 1;
>> +	} else {
>> +		pages[0].addr = 0;
>> +		pages[0].size = 0;
>> +	}
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>>   	args[2].length = sizeof(*pages);
>> @@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
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
>> @@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		}
>>   	}
>>   
>> -	if (domain_id == SDSP_DOMAIN_ID) {
>> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>>   		struct resource res;
>>   		u64 src_perms;
>>   
>> @@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
>>   	}
>>   
>>   	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>> @@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	struct fastrpc_buf *buf, *b;
>>   	struct fastrpc_user *user;
>>   	unsigned long flags;
>> +	bool skip_free = false;
>> +	int err;
>>   
>>   	/* No invocations past this point */
>>   	spin_lock_irqsave(&cctx->lock, flags);
>>   	cctx->rpdev = NULL;
>> +	cctx->audio_init_mem = false;
>>   	list_for_each_entry(user, &cctx->users, user)
>>   		fastrpc_notify_users(user);
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> @@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>>   	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>>   		list_del(&buf->node);
>>   
>> -	fastrpc_buf_free(cctx->remote_heap);
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
>> -- 
>> 2.43.0
>>
> 


