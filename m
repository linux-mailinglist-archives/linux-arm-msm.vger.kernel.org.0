Return-Path: <linux-arm-msm+bounces-100180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NibGabNxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:21:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E933D861
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0513043000
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0623C4F3;
	Fri, 27 Mar 2026 00:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJ1cRI6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsvzohIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F4115C158
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570683; cv=none; b=hJnnkQi90Tylemw5M5nkOr0Rx+qkHgRc6zIaJNGoWHGmLoLmWf4nMLqy1SDzlw3fXtjrE7IgBOtkY4EzOHNdrcuoovlcXFUCTSwuHGfvugYsYt+9tlKX2Y+1rRe4ULtQR9wImELkA+m2ThpK/ED+YEmf1+LW1ifvw5FsBMkhXU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570683; c=relaxed/simple;
	bh=IWRpc8UG5aAzDHbxUBBEGX+ouLTTMCUDS5wShhL5Orw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KGo/P7tyngLrDzAU+W4TRTcDEe7jo5dh73Ud37bSXHnY4z/VSW2U2NxfXL8Ll9ddA0Vt+V/YmDmLnLgqXpdRZlIkXjZpocdIz02H834nITrqqbyC4Nu6JsK03/slerUf+TX/Jd+Dt7lbwcPiFeTTS1IEUwCQ9LmjVdW+jjhBPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJ1cRI6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsvzohIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QKYEEi518499
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vh8ik5Yl+pBvNFbXoIfyhUJq3wlpS+a/bJ7UQeBXlWQ=; b=dJ1cRI6Ca6X+/VOg
	Zieb1aWwkKAanPOpas1sjVntbhgqH6osC71dNlkBKnbO1oHl/vi0TX1yr1FlCOsG
	CtnLHbNw5V75d0p6zupTwSovJ2ZDC/PHuemoo4wRp8yGKGY5ey8BV52QOtYf5m69
	sTqLcAGev8lMRz8JoM8TGk3OIH/UFTJ78EJnC5tqVX2kVLftJLMvPR6XAlJHQfX5
	G7XCe7I4qhGENtEbbYsbixKVNgY7nTfXVWbfOj9i3Nlx38jmEK5i61M1rMPAh6Ho
	jOgR3KwbeIePdppjs/hbvZdcinkCyjHVpP8loEBdR1PwyesCj+Hb8JlTFisTl7ua
	k4swmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv0hcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:18:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738b1f630eso3507917a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570681; x=1775175481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vh8ik5Yl+pBvNFbXoIfyhUJq3wlpS+a/bJ7UQeBXlWQ=;
        b=VsvzohIFYGwvEkJ4D+o4ikz+TegcBjZZwofLOOh9Zz2cm0LGdX2O5/on3JvuI5eLsE
         HX1UFhKmMn8vVSu4Cuxkaq5VKoJtltDc+v+wWqcLlTn+oDmPQJteucPJjr6MSoZji2Cp
         9wyE3AlIG3y/cUA1SWvj63ND8FTqARQ5WVUfllpGhA4/CLQaerPILmm1bVFGics0H8N6
         6n48wc9ji/BmUUlmofCqVdhGvJYs1r0xEdEJzejWWgCGY9BA4O7VsSmBUMCS8fpkGfFZ
         6KH/3CvT2Zt0TY4ZtKAamlRmMPNA3yLlf4dkRWLzETtEqpUZiy9n/4wqRT2DKYiFxiZy
         I/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570681; x=1775175481;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh8ik5Yl+pBvNFbXoIfyhUJq3wlpS+a/bJ7UQeBXlWQ=;
        b=QRum9lVOy6cCL+nsz8q09QsAoLt7YWp5LdZnkxNAt7B7XGlpc+q7I1SODjFrittTHt
         R88GTQmb90ubZDKlm9gZON5JNnKZX3Hy6m6ThBgjNBfcS60U+I9UO70RQ2n1mdzR9Y8t
         m3ShWVUmBE5L5D9J1MRtSpAYYys5TfE8a6DdBFUm98xAdJVX4qlGjYe3HuDLAyi9SvQW
         p/AvrsAQVVA9da9h8NjeYjDA7Ni/e9LXY83pHYVOkRghOeA7aknTb0BfWYEzvnBy3MA8
         vvLpYGPAcDWhZ/Y1iijcuxCUJpM+1JCyII4G4aa0cZjFHv9mjulaOHjhvP+itxE/e9JD
         1bGA==
X-Forwarded-Encrypted: i=1; AJvYcCXyWFgosVb3pjUZt6KAkXqvJVBQGPlQKsYH9cKBAXo1AS4phNLW1Cs5R9dfu6LxbnCBLEvBeRs1DfFNqF8L@vger.kernel.org
X-Gm-Message-State: AOJu0YwRAM7McSpyHj/6gATj75U8ElsBrsFqj5hkj1A/vaHMZpCtnQq8
	Mdt2TNLeRphPFWP1zXFK9xyAN0Ll6ejHyMrz73CYH5mcD5cSP5DYKhouKlR3WFMImA0jyR/Yi+N
	FNL7zZggdoE7lB6r4jeWloXT5nT28MwfXzEfnWZ9Lhm9jow2ctF9m/WKlN7lsWItVRyXe
X-Gm-Gg: ATEYQzwYwWq6RDBoKpp/2dy68Pm+nYl38ufvST/FnhkXlxUU6boPKxKXa8nV/1N2XJM
	5+PmDLkxeOI7z5SCpzd7BMiow/+31OUJ3NfJ1swUU/rnfRz6MTjzwYRRFcd0TgCONfipiYl+Bwp
	CrRJsgkiuJ6mjLcrXL9MFo3iCzhYetnjJhwHWiRbVvDR35m7VW1AiHyDL3ajOV4wsVxgPsyrG6p
	ewlQR1P8rmcaWFwsucVRIdnQtHbyrZUV6WFrbhhIrSKtchUilGmLuw80vuoHaqo7Lj7e7Yr+ThZ
	mf5Q8hJSYVCmCkNHR3LaD5WHrjzW59ZS7I136KRgRpRFvmeajBr1gN8IUQatM2197fZeqGnqV/K
	Qaxw5mcqfQ+4JxqF0ByezjgNIIs/Erq7QViMuFR1uFZf2
X-Received: by 2002:a05:6a00:3698:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-82c95af13f9mr405552b3a.1.1774570680876;
        Thu, 26 Mar 2026 17:18:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-82c95af13f9mr405532b3a.1.1774570680352;
        Thu, 26 Mar 2026 17:18:00 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.235.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3ff085sm3575721b3a.57.2026.03.26.17.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 17:17:59 -0700 (PDT)
Message-ID: <fe3177bd-a3d2-4c0a-ab6f-9752eaf32fc4@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:47:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
 <acSRDNA8fCP7qAFJ@google.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <acSRDNA8fCP7qAFJ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c5ccb9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yg4K9g8yQ9z8uKSC4i4MOg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=cm27Pg_UAAAA:8 a=iIcgFftJmQX6hLS7D9wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 3n5yQTAGjIqro2qsKKMiCFxkrln7o34C
X-Proofpoint-GUID: 3n5yQTAGjIqro2qsKKMiCFxkrln7o34C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXyREbuxZKkCy7
 03ifb1XQo33HY7BP+G/DAOXChlUjQRmErS/gL5wqNjVoDgHoLtEOooM/0ITALvv1L1ABxjU/NMv
 GIGVcXNkW2ufu222iQc1x12TZ6sSct6t9qvA6ZChQeyb1jU0dH9JXC1EMRLjMXJfsrzCSpsRqqZ
 r2O5xoodJMLrypuzXhK8mHB/Oioti5rxJDzoqzs5j5BYrEkgMvYIUW+FJUqMCrPIXXVS9nZvw7u
 hWBVe1tefXpWTNgkLfwFvpHTa/j76PjEOyYDyBkEVXPrVJOK8VfRcIircGKLyVZ03MPT9bXbMSo
 DkWCyv3xa9JG7MIbxC3T3PqOtyPIgfpfa33bQ7Gos/kA9SxMtKCqloDtsMoHq+IFgm6Zvpr7aoE
 vXBsQlO0ESB/4ADBpkjzczBxH/POBZSgBZJXHNhlHF8M9yKbK7Lo2ojEPnhVQgSzRk2MjMQpJ5a
 Ik8+9BOjVAN0zoyqfvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,vger.kernel.org,lists.freedesktop.org,chromium.org,oss.qualcomm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100180-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email];
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
X-Rspamd-Queue-Id: BC6E933D861
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 7:24 AM, Sergey Senozhatsky wrote:
> On (26/01/27 16:33), Sergey Senozhatsky wrote:
>> We sometimes get into a situtation where GPU hangcheck fails to
>> recover GPU:
>>
>> [..]
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
>> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
>> [..]
>>
>> The problem is that msm_job worker is blocked on gpu->lock
>>
>> INFO: task ring0:155 blocked for more than 122 seconds.
>> Not tainted 6.6.99-08727-gaac38b365d2c #1
>> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
>> Call trace:
>> __switch_to+0x108/0x208
>> schedule+0x544/0x11f0
>> schedule_preempt_disabled+0x30/0x50
>> __mutex_lock_common+0x410/0x850
>> __mutex_lock_slowpath+0x28/0x40
>> mutex_lock+0x5c/0x90
>> msm_job_run+0x9c/0x140
>> drm_sched_main+0x514/0x938
>> kthread+0x114/0x138
>> ret_from_fork+0x10/0x20
>>
>> which is owned by recover worker, which is waiting for DMA fences
>> from a memory reclaim path, under the very same gpu->lock

I am still thinking if there is a better way to handle this. Btw, Rob
had a few fixes related to this area recently. Do you think those would
help in this scenario?

-Akhil

>>
>> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
>> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
>> Call trace:
>> __switch_to+0x108/0x208
>> schedule+0x544/0x11f0
>> schedule_timeout+0x1f8/0x770
>> dma_fence_default_wait+0x108/0x218
>> dma_fence_wait_timeout+0x6c/0x1c0
>> dma_resv_wait_timeout+0xe4/0x118
>> active_purge+0x34/0x98
>> drm_gem_lru_scan+0x1d0/0x388
>> msm_gem_shrinker_scan+0x1cc/0x2e8
>> shrink_slab+0x228/0x478
>> shrink_node+0x380/0x730
>> try_to_free_pages+0x204/0x510
>> __alloc_pages_direct_reclaim+0x90/0x158
>> __alloc_pages_slowpath+0x1d4/0x4a0
>> __alloc_pages+0x9f0/0xc88
>> vm_area_alloc_pages+0x17c/0x260
>> __vmalloc_node_range+0x1c0/0x420
>> kvmalloc_node+0xe8/0x108
>> msm_gpu_crashstate_capture+0x1e4/0x280
>> recover_worker+0x1c0/0x638
>> kthread_worker_fn+0x150/0x2d8
>> kthread+0x114/0x138
>>
>> So no one can make any further progress.
>>
>> Forbid recover/fault worker to enter memory reclaim (under
>> gpu->lock) to address this deadlock scenario.
>>
>> Cc: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> Folks, can somebody please review/pickup this patch?  It solves a real
> (deadlock) problem that we observe in the field.
> 
> // keeping the patch body just in case
> 
>> ---
>>  drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 995549d0bbbc..ddcd9e1c217a 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/string_helpers.h>
>>  #include <linux/devcoredump.h>
>>  #include <linux/sched/task.h>
>> +#include <linux/sched/mm.h>
>>  
>>  /*
>>   * Power Management:
>> @@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *work)
>>  	struct msm_gem_submit *submit;
>>  	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>>  	char *comm = NULL, *cmd = NULL;
>> +	unsigned int noreclaim_flag;
>>  	struct task_struct *task;
>>  	int i;
>>  
>> @@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *work)
>>  			msm_gem_vm_unusable(submit->vm);
>>  	}
>>  
>> +	noreclaim_flag = memalloc_noreclaim_save();
>> +
>>  	get_comm_cmdline(submit, &comm, &cmd);
>>  
>>  	if (comm && cmd) {
>> @@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *work)
>>  	pm_runtime_get_sync(&gpu->pdev->dev);
>>  	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
>>  
>> +	memalloc_noreclaim_restore(noreclaim_flag);
>> +
>>  	kfree(cmd);
>>  	kfree(comm);
>>  
>> @@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>>  	struct msm_gem_submit *submit;
>>  	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>>  	char *comm = NULL, *cmd = NULL;
>> +	unsigned int noreclaim_flag;
>>  
>>  	mutex_lock(&gpu->lock);
>>  
>> @@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>>  	if (submit && submit->fault_dumped)
>>  		goto resume_smmu;
>>  
>> +	noreclaim_flag = memalloc_noreclaim_save();
>> +
>>  	if (submit) {
>>  		get_comm_cmdline(submit, &comm, &cmd);
>>  
>> @@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>>  	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
>>  	pm_runtime_put_sync(&gpu->pdev->dev);
>>  
>> +	memalloc_noreclaim_restore(noreclaim_flag);
>> +
>>  	kfree(cmd);
>>  	kfree(comm);
>>  
>> -- 
>> 2.53.0.rc1.217.geba53bf80e-goog
>>


