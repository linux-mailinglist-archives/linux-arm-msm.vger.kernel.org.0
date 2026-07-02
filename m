Return-Path: <linux-arm-msm+bounces-115866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sGahJSkxRmrxLQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:36:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A836F5562
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:36:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WXOHK9ek;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XvB0mfBg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 173E73070235
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397FE4252AC;
	Thu,  2 Jul 2026 08:44:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA39357A4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:44:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981847; cv=none; b=kAb5kkT8aBnwd7vCYkthrFuHy5rYddCuQsgnsEeOb7yWI0Pkj1t2uMVExTmZGcs2fpEHcYjllgn24jy7K7F1mGPe/KneOTSX/fU+sHxpky7jYQfhqVCtpvwWLxihQO9DultoJbC9Qh+gehD0y6K6s0kF+hT1rSkQ383gFpqBZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981847; c=relaxed/simple;
	bh=aFjPtbFaTbHr0nxBfP1HfHlfocAM+3tsSwxLphBgKi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4gK8NmtLDmuxXq8kfrR301EZSfDfJwFkV7/IU030rbe/QaX7E5smXRtCE8D7IqcquFMIe4IazeC3Lw0hhSjW84HzqDo6nyNKs7OJtgzP+UW3DNXW0vziO2DII6uGyDzgfEcgENs+ker6s2Stx394yQk3lA09gvy2Wt8TkZUSEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXOHK9ek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvB0mfBg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242sbI3460370
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iqb43rGi0YNDdCvsKO8e7oyCe1ZkrH5pxWX7o9Wo7qA=; b=WXOHK9ekTmFJgtdo
	V7tMlxdMTUzrpb3tlSe8uNUTBtKsC13TgM6GUuf87fmO9EgOUZGzUHvzExHX/hyq
	JLVgvfn8UvKOKipjsBwz+dYgvoScFgMFeYK+6pGX70l522p9V1M/frLBQjIbrnOL
	6P8+9z62LtI16mSgSRAAfKQLUzgFEzapO+oUHlbU8djLBaJmi3QFJ9/p3v+qRjbh
	HqyqLAuXiODMNOZYNy0ZSXPRl1rPAuAAiFkswlcxLA7C9JzKx8Tyabat0MbV1QEy
	KlO1CMHoJ/jXATAgKaYFKBOv4cMb5Y/jv71yn6qt/5WySne3VrxC7IdyC5pnb/4e
	2radxw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb0xx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:44:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so32064975ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782981843; x=1783586643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iqb43rGi0YNDdCvsKO8e7oyCe1ZkrH5pxWX7o9Wo7qA=;
        b=XvB0mfBgVnZGOHvHp3q6KJxOLnC0pwvyg+UsnpcKFw+BBSEy9EZWHITohuhSVHlKfW
         6KUuwbZz//uFQmB7H/ZWnLhvd0LbXYqErQntILaoRWWW78CC+AjiHHrmDt4txdasKIf9
         QxY5ej5PtB7QPd6dPDKj6s3Ic547LBVG36vboL4pmtDUAZiuNz4reeX3dsmTvwMyX+p1
         UsKpsF5+X7qNPhAUR4PeSRErmp0bopGoddYnTI40et5QMyn9oINjE/Tp+7vQ/6l1e/ho
         K0gYpOt27Eu810xQqFgDJWB1qg4LwU5afamM92NIsLSfRKrlLI4Oc2jY4znmDYB/MSGm
         IN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981843; x=1783586643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iqb43rGi0YNDdCvsKO8e7oyCe1ZkrH5pxWX7o9Wo7qA=;
        b=VmhY/6wMEhmlrKE2FghFoD7EmH1Lzbk8W4V3oali1D9otp4TlGHqyexGobI6/bNnbk
         jdFb5qnoau8pBhdtAyKBZNHgR23tUCyIM/0CUNKS2TctmgTewO0Z/XUimTggbxLobg5C
         h7PQUiQrBCffsCybqC2MO8/MuIVieErujARoEcm3x6HVQ7edp73Fo9Ww+8UMyQQIqWjB
         XxltGGP1lO1xWSNZHYUo0zq3MO8pxAZOAom91FQWpI68sZY7/A6VZmy0L6x9+1ikefEH
         Fq0FKCxwpxYYh7wVhHPeL/bf7vJW0sWwJuh2NEMhgc11hJ5LRqZVDCuu7vCMmVIhgIK0
         VSpA==
X-Forwarded-Encrypted: i=1; AHgh+RpOll831NO9UTtXAmFZ7KlR37v/24mlJ66rPPhkw7M9HvULTMRlJEttOQegKa09/86thWnvs/nFfN14Tt+A@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmLAaBOF9oinnxfCUAum9CUuPn/k9sICdN8eIcIALMUDZP1FL
	a5v2tctkxQBVvaj2mKAwFOEOUJ9uCgfLuRucdsd90m30TxNWmT2nohi8pMZnwrdtfAZXiXfhn4K
	D2BffcbRuswpGdX96b8nm2sxOk7hDlHhtOrkIRmbARWlGxLZspoVrvrM8fWImMTgDrIPr
X-Gm-Gg: AfdE7clfhDXr/e1W5MU4mxCMHgk82EV/NiQJ+NF/yyuhp8quXWVHxcbmUulm8oqW2o3
	ZC2j628y/YMJYXIgB03Vzm60FwrgdE9byYb+OfjE2sDnuOdqr//iPhyKlMpWcqwJzdb3s0j12r2
	+Yh1O65mNXNFDYiyHAFhrB5wkP217BHchp7jOogLNoQWs6OVmIX5Y4sAQNoumeqvFYzOasSmGMV
	V0chqsQ6/9d6is+vcFnerhcQtjDMmfpRzQlt3kvLCuqLU0JmOIFIOF76ZfhDTa4FJeOklS+SP3x
	Z1ueitFnuShJwjuTlViw0qvPum3+Rq602tMoIPEwixjMe++66qMcspbvOp1ik5PphVLwdOPW0La
	SmRNCs1CSsucvJWhzWxP4Wo1c6DyGZXCoRkEL/ki9/tlkmQ==
X-Received: by 2002:a17:903:4b50:b0:2c9:97a7:3277 with SMTP id d9443c01a7336-2ca7e8adaafmr57776795ad.40.1782981843018;
        Thu, 02 Jul 2026 01:44:03 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c9:97a7:3277 with SMTP id d9443c01a7336-2ca7e8adaafmr57776525ad.40.1782981842418;
        Thu, 02 Jul 2026 01:44:02 -0700 (PDT)
Received: from [10.151.55.41] ([152.59.198.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9fda23sm10229555ad.67.2026.07.02.01.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:44:02 -0700 (PDT)
Message-ID: <d817c5ac-79d0-43a6-ba78-e26d3ca474cc@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:13:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Srinivas Kandagatla <srini@kernel.org>,
        Jianping Li <jianping.li@oss.qualcomm.com>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
 <20260609025938.457-4-jianping.li@oss.qualcomm.com>
 <cca276af-3e6a-44d3-a1b6-c2bc401a28cc@kernel.org>
 <a79182b2-2582-4c77-a859-b4d013b700f3@oss.qualcomm.com>
 <51bad771-aa21-4394-8243-2fa7f275cb36@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <51bad771-aa21-4394-8243-2fa7f275cb36@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7xI3btocNXsF2ZVr6l7pVoI8AQtrjLd5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4OSBTYWx0ZWRfX2M5W94ZqfHjE
 PvzK60YFjw7DKiudqqJ79+ajHcT7BeUNBQMus7dJD7EWVP6406unvFwG5avnBHGidokMOZuZvGx
 WWcCjeRbM8dtxU/h10CAEUqb0iblGW8=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4624d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9m3hvakvPwWhOvli1bnDMA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HOC0WB5RhlNe5Vyk8xEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4OSBTYWx0ZWRfX1CdC/cqVK7xr
 J7rCahrBHH65ROkLVEKbUibClumlu9voVzgLMWR9MznoGdk+usftLc1FKTvMRIcvHFyhMJST7dc
 O/AsB5Ur7+pZHhJyf2+8AavurU8p2AFkXWxqucGj1S95lYCRNRj8cVHhqEKdCq8ZBK9B42OM0K+
 2/M66jFsidLKqyvLyrgqrT5EtSBqiOk84b3NCoaq3nAmd1AjeVlVFnUvr1+kixklgrv5rDsvU44
 XsBX31KCamO8eka0Yj3stD66gu/hJrpqDwWnpblzZ4aRHX1/m5Bo1NpTFSUGF/0MMNVDn01Byrk
 i36MiAVLGL0mW/JltIDGbRAJG+gdO5bdHs4LpYdoKcBiL1Dl1haxMbcUA0EInbsbi+EfBdlKA6K
 NkSMsXqJPKcJ87D5dEdKYi2u0/iG1hYLLsJ/ESA5E5l0t+r8T2HEgSEPIf0OkHp+Q6bDj6ELvuO
 rqgEekfr3x/nQ3Y7G1w==
X-Proofpoint-ORIG-GUID: 7xI3btocNXsF2ZVr6l7pVoI8AQtrjLd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-115866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:jianping.li@oss.qualcomm.com,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez-ortiz@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6A836F5562

On 02-07-2026 12:16, Srinivas Kandagatla wrote:
> 
> 
> On 7/2/26 5:02 AM, Ekansh Gupta wrote:
>>>> @@ -1409,8 +1395,17 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>>>  	args[1].length = inbuf.namelen;
>>>>  	args[1].fd = -1;
>>>>  
>>>> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>>> -	pages[0].size = fl->cctx->remote_heap->size;
>>>> +	spin_lock_irqsave(&cctx->lock, flags);
>>>> +	if (!cctx->audio_init_mem) {
>>>> +		pages[0].addr = cctx->remote_heap->dma_addr;
>>>> +		pages[0].size = cctx->remote_heap->size;
>>>> +		cctx->audio_init_mem = true;
>>>> +		inbuf.pageslen = 1;
>>>> +	} else {
>>>> +		pages[0].addr = 0;
>>>> +		pages[0].size = 0;
>>> What is the expected behavoiur in this case?
>> Audio daemon is expected to take the memory information to DSP audio PD
>> only the first time it goes and attaches there.
>>
>> This is the case where daemon was killed but audio PD session is still
>> running. In such cases, daemon is not expected to take any memory
>> information to audio PD as the earlier shared information is already
>> there with audio PD which it is using irrespective of daemon state.>
> Wow, this behavior is not documented or pl consider adding a comment
> here, Can we not query the dsp before creating new audiopd service?
Agree with your point about documentation, maybe Jianping can add the
information.

audio PD is generally not aware/affected by the state of daemon
process(other than the reverse request break) and there is no such query
supported to see if the audio PD already has the memory information.>
> 
> Does it make sense to attach instead of creating?
Calling it attach as PD creation is not done by the daemon, PD is
statically created upon DSP boot-up, the daemon just acts as a listener
for that PD to take up reverse fastrpc request.>
> --srini
> 
>>>> +	}
>>>> +	spin_unlock_irqrestore(&cctx->lock, flags);
>>>>  
>>>>  	args[2].ptr = (u64)(uintptr_t) pages;
>>>>  	args[2].length = sizeof(*pages);
> 


