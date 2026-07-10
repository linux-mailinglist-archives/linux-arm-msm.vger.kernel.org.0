Return-Path: <linux-arm-msm+bounces-118173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dGQfMBGXUGpu2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:54:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E1737D75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:54:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nQFGASQK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kqkiPC5n;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118173-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118173-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8312E303F466
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6074A3B42D9;
	Fri, 10 Jul 2026 06:52:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075E3B1016
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666354; cv=none; b=o5Gc1XAtkayqJNXuJhDp3nAnYB5LuZmeDAqakFu2YtKQipV6YI5K3GK9PkM+68CNoVDLNiP/hYp82aREdvo0lYWYZq4Mtnfq691mhJEh5ms0+moS/vxeeBmgTMkqegyTR+ZxpExThp0X1wT5HHpFQ50pfekK/PcYLGvP/Jj2XCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666354; c=relaxed/simple;
	bh=Mv9GgaDQNtRYGWTm1gQ1mOi3EDQMpCPvxhm+2f/VXS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iRDFI/TE8ztH59AT3+n4/zsdqru0rWzuegV8+2WErdbwz2Bu8tplt3Tbe62HjHXPOygdJicIp7t/imdTPbuGeusYoEjLU1ZfjBCjNo1rzV2L8vx93CFbWSaqxf4drALTC58MBYAdL41zpevILhGzBnc8p4xXYbYQJRySrD0yYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQFGASQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqkiPC5n; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3ovE03854989
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrgIQqUK3QvZGUscE0xgRqyYIXIAIug38pWr4S569hs=; b=nQFGASQKFBt5JKz2
	a0cvyXcYY9LWmx1+NIh3qLQSYp21vAnfq+np9JYotZ4qZR8FbQ7ZbPZl2MTJy9kD
	IQnDoUN4Rhgf8dap/5aakFzTBh6Yq3nLjtWA8FC/YQcWmgpHZwcPSQQSsHhfTNmp
	LjfN6uGP6aKbkGncNX7fnMyH8wv34Gasti5E8Fj8JqKbGi8/w4F2OVg1eLwhDuMO
	tISQMv4dEt4AQ/HdL2xzDItKViuRWz531CHz5HbTJzhaGLhMRpcoRRruiHwNFfaV
	QAO1GRA38gy+LT/4xB0j8OtNZj1/5KgkDHeJ4v0HltiMuB5FMozc4FOXby0N2JRP
	yC64gg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n0mu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:52:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso824757a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666351; x=1784271151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrgIQqUK3QvZGUscE0xgRqyYIXIAIug38pWr4S569hs=;
        b=kqkiPC5nsfgGE+cCNik1+4DaSBvxQlcPJk6hvZPJy+LyTwfQcPddzHYG/LKddKjo67
         oAPzzVTImqNFvnXp06wSxnuO7I5u6WFUj5UUsgWbdqPktmrJR6NuwtyMFwAcopAWHUfN
         RnMkNpeRd9g7A3NQBS2zTJxU6cPVfpOuIPp+3dtUr9z/Ga7XzY8asEoWFxR/c7BrEqu5
         xnccPItBeUy812j9v1JCZKS2tgZdG4P0undxG+hf3FaF6zcy8Gm1n4bGlu1cgHdLkTEE
         rwttDqfnV7bfkhv1x1GVV3fa6kyhKFK2mXE1ttnrqlU/OBscpxOohvoGwQqdKcs04SUf
         zdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666351; x=1784271151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrgIQqUK3QvZGUscE0xgRqyYIXIAIug38pWr4S569hs=;
        b=Yt/C8IN+fy/+ji8Kef6YD+GlCHF8vOeWV7XKiGp5rPP4vwCJo+olHnR4ZjTIqFuoSg
         mLi8ciiVfHmja52iyZN/U7HEkCQpg8F7HuXoVgnqS4eH09rOfC+GwBsfGdaKoeGu6KWR
         kUg1RGOBjcL/3G2qatLIJ3RHP6JtQuc4jhU+IMTQJyUAPeupsegkmfjDonz2Ph4d2M4w
         vTuCxjQZmghcLblTYPZA0/CBeKw1fTMtpk/IbrQDXOV3pGiIA/XxLi13Ogq4AnBGVSn/
         x4bzLjC8JsXZqMbOMkm1gxvTi9i4Pu2Nj2IzOyK8vfHZsIbzkUa3qmNQN5BWVIDxJd5b
         /aMw==
X-Forwarded-Encrypted: i=1; AHgh+RoSElE8+IClRFnbnMKg54xYsx0+Mr8rz1R3nJoGzv4bA1BpkANvVcKsBcK7kJoyL/+ufc3WLkUmuMCAlJAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7++qVhtcR+muBwpqBSH1STWq7+YzIDmIbkJ/CGtdCcxJhGeat
	k44O586DBDej5+B0CSGMkcEvrSnj2xIqbFhtIexL9a6AMTlpmu8d8lj4LfVC9GyiZLMx0NArCXC
	nqMhlJniT2ZTVhajhDqSCIeBWgDR2m/K9YHDwPsFl7N3GiyvbRXAYd5KnsgExIvSP8RIi
X-Gm-Gg: AfdE7cmN42eT0jIe6DTyBQfAEuHZx83JmI50t1hH+D1ktIxCfL/6OeQ7cjdvS5B5PDC
	cy70ELH9F0U4M56wCLB9ZWo5Jto8XJtKWoORQlHJUfwDLJ2ULrljRqFBk5jkdsDnUpxW5HU2YeZ
	Lr0srHBlgs5Obdz+QXieRTJtFRVZRjX9eYb5wwdw/O+YayiZI8lDbvMc1OXW9Nkcxdh0V3BqPkg
	jdwRUidyhcvlSdL9KScD2DKsZjwGrM+ub2FYaUbsydgq+GYVQFUz4NI4XQXLR18YNQ2RQLi630+
	jwvZ+gx3/czletZSUmmbMW1Ql/A69n1XkcEGWWI8dE5iHB54ZlmnBzUOZTVD5cG22lbNmvFp6lK
	j7gzGBwCFRg1hTRTtE2KvdMlHhRjGQAbueIuxcDOU
X-Received: by 2002:a17:903:41c9:b0:2cc:dacc:fe27 with SMTP id d9443c01a7336-2ccea45ab1fmr102817265ad.30.1783666350600;
        Thu, 09 Jul 2026 23:52:30 -0700 (PDT)
X-Received: by 2002:a17:903:41c9:b0:2cc:dacc:fe27 with SMTP id d9443c01a7336-2ccea45ab1fmr102816995ad.30.1783666350060;
        Thu, 09 Jul 2026 23:52:30 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm55577545ad.15.2026.07.09.23.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:52:29 -0700 (PDT)
Message-ID: <dad25802-2a26-490b-9488-650d5f78b018@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:22:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] tee: Add kernel client object invoke helper
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jenswi@kernel.org,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-2-f659cbd5d04c@oss.qualcomm.com>
 <651db8ad-ff57-4369-8401-f51bb7ea46f5@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <651db8ad-ff57-4369-8401-f51bb7ea46f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfXwa296UenXG3D
 tuqzBsib2abvB0l/CxYYEAu1xnj9zanDm8NPsgci6+md6xhAquzHzbkDk2QGRhKKQeTaVQlrVuK
 HNKptzMlQQL0W6eEEblOAPXjA2c6RAQ=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a5096af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=1nvLbgvQa2DmmGW0PDoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: jH_qqNwGhBVDrbFvT9XOpEGHPFUPSAvK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MyBTYWx0ZWRfX9y/XttVAfGeM
 rlDDAzUo6nKJomHsAPygYzF0YyZOajUhrVZF5N6U75pLa1h7RU0OUP7jDT14AyP89Y551eeSGoQ
 BqwaxqD3luSI4TcBw/1NehMLjiK8U96tFKYqSq8fvTjVoZBSupau9Qd7c6YKh0nK2A4Yob68nkR
 +SnnlRDavpUb37nl82+JmY/+d7amg9na+NWC58iT3NwcrUmBRn8224yj5gwN0pXkqu3jog9SCjf
 wKseWg2pM5m/pTxA/ZzIJzeMG8xG31u/rj15KjdMi2aZjp4kevRLE2DFBxPFdIGb+tPC9ig/LRY
 /HHb8W/nZzIJv2fTrXTG34nJYsJJos6xME4Kd0EDdKR/pQDvK3e8nGQBPBQL+6GL3jSinprch+C
 AmuHNnt4jvk+59H/Zms3FUOAJA1ZZoM/+umvRp9Mcw5FMyslpZoRMNVWNTQlVtrVDC2S6AeV1Fg
 zs05BYLJey8aSX+gVNQ==
X-Proofpoint-GUID: jH_qqNwGhBVDrbFvT9XOpEGHPFUPSAvK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118173-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:amirreza.zarrabi@oss.qualcomm.com,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jenswi@kernel.org,m:sumit.garg@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,bootlin.com:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D8E1737D75

Hi Amir,

On 7/8/2026 11:59 AM, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 7/7/2026 4:11 PM, Harshal Dev wrote:
>> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Kernel clients can open a TEE context and invoke regular TA commands
>> through tee_client_invoke_func(). However, there is currently no
>> equivalent helper for invoking TEE objects.
>>
>> Add tee_client_object_invoke_func() as a kernel client API for issuing
>> object invocation requests. The helper checks that the backend provides
>> object_invoke_func() before setting the MSB of the object-id and forwarding
>> the request. The MSB of the object-id informs the TEE backend that the
>> object is invoked from a kernel context.
>>
>> This allows TEE backends that support privileged object-based calls from
>> the kernel-space.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/tee_core.c  | 13 +++++++++++++
>>  include/linux/tee_drv.h | 13 +++++++++++++
>>  2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>> index 7f986d7fb47f..0783802fd010 100644
>> --- a/drivers/tee/tee_core.c
>> +++ b/drivers/tee/tee_core.c
>> @@ -1413,6 +1413,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>>  }
>>  EXPORT_SYMBOL_GPL(tee_client_invoke_func);
>>  
>> +int tee_client_object_invoke_func(struct tee_context *ctx,
>> +				  struct tee_ioctl_object_invoke_arg *arg,
>> +				  struct tee_param *param)
>> +{
>> +	if (!ctx->teedev->desc->ops->object_invoke_func)
>> +		return -EINVAL;
>> +
>> +	/* Indicate that this object is being invoked from a kernel context. */
>> +	arg->id = arg->id | BIT(63);
> 
> Setting this bit is a qcomtee backend requirement and should not be
> exposed to the TEE subsystem.
> 
> Kernel users of qcomtee_object_invoke() should use the normal object ID
> value. For example, access to the initial ROOT maybe represented as
> TEE_OBJREF_NULL | BIT_ULL(63), but the upper bit must be managed by the
> qcomtee backend for any return object, i.e. The backend should also set
> BIT_ULL(63) automatically on each returned object ID.
> Callers should treat the ID as opaque and must not manipulate the upper bit directly.

I agree with this argument. Since we only invoke QTEE returned objects from
tee_client_object_invoke_func(), the QCOMTEE back-end should set the MSB of the object-id
when returning QTEE objects to TEE kernel client. It should also drop the MSB of the object-id
for both invoked QTEE objects and QTEE objects passed as arguments by a kernel client.

We are already taking care of dropping the MSB from the object-id for invoked QCOMTEE objects
from kernel-space. I believe the correct place for setting and unsetting the MSB for QCOMTEE
objects being passed as arguments are here:
https://elixir.bootlin.com/linux/v7.1/source/drivers/tee/qcomtee/call.c#L181
https://elixir.bootlin.com/linux/v7.1/source/drivers/tee/qcomtee/call.c#L125

Once the object-id is allocated by the back-end, we can check if the kernel_ctx flag is set
in oic. If so, we set the object-id's MSB before marshaling the object-id to a tee-param.
Similarly, when an object-id is passed by the kernel client, and kernel_ctx flag is set,
we unset the object-id's MSB before marshaling it from a tee-param.

Do let me know if you're aligned with this approach for achieving kernel context
awareness without TEE front-end or client involvement. In-effect we're offloading this
context information to QTEE object ids.

Regards,
Harshal
> 
>> +	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param);
>> +}
>> +EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
>> +
>>  int tee_client_cancel_req(struct tee_context *ctx,
>>  			  struct tee_ioctl_cancel_arg *arg)
>>  {
>> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>> index e561a26f537a..ca99c6b747a8 100644
>> --- a/include/linux/tee_drv.h
>> +++ b/include/linux/tee_drv.h
>> @@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>>  			   struct tee_ioctl_invoke_arg *arg,
>>  			   struct tee_param *param);
>>  
>> +/**
>> + * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
>> + * @ctx:    TEE Context
>> + * @arg:    Invoke arguments, see description of
>> + *          struct tee_ioctl_object_invoke_arg
>> + * @param:  Parameters for the object invocation
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int tee_client_object_invoke_func(struct tee_context *ctx,
>> +				  struct tee_ioctl_object_invoke_arg *arg,
>> +				  struct tee_param *param);
>> +
>>  /**
>>   * tee_client_cancel_req() - Request cancellation of the previous open-session
>>   * or invoke-command operations in a Trusted Application
>>
> 
> Regards,
> Amir
> 


