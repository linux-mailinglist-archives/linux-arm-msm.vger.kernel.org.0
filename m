Return-Path: <linux-arm-msm+bounces-117052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id huOdJK8kTGpBgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:57:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF588715DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:57:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aSlxawR/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UzhdR0H4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117052-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117052-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79E59302F58A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C8D2E8B83;
	Mon,  6 Jul 2026 21:56:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC9175A75
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374985; cv=none; b=MSzpvolRM0jhLu8y/wGabEieMy/d3FZa5Wo+gJYBieHAvbA9t2ejElg5QSgr+o11zwYoz0D0rhMnHvi+VkMDCL/g1mjsTwFsaLwP/b2DwpcAZ1MpcFWhTKtyl6Kh1qKkkUJYI6pIf5S21hGB1bG1KiJvPIt1MUIIsu7JXrERYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374985; c=relaxed/simple;
	bh=UpO4tKWLM6NpkjaToU5bkuiwbjykqdoA95uxnkZptHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhqkvK8nJK8sZsbo/2EhsFQND9pAePJm9vRAxIB0wFGdeqjikP7jhLdlU17vMWdhMb78Js9ZJKRJ++rBP4dVE/7twm/uKkaz0CGqAhhhRETsU2vZvjUjVMa0ezdwjr26FbF+lLCOKvQs6SKJ+CsSi+tiYizT2kNUk5BzG9HGd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSlxawR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzhdR0H4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEoTd1652618
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=; b=aSlxawR/BBrrsLrp
	S3V4J3GgdBLFVH5XsOppLOymMo59D1CcyK+MsnVve7Xg8I93VdIAqy/Rb+2vPqjr
	qo4uc1b5gPUwyAagrMaFTdRWnCjyA8JXRU+Ip7WGUxq8dXhqxZ8ljDUCSvgRBZHc
	v3HN1fyYz/aBTB9jd9QYwx229j5YIT9hrUHTIniakWSL5de1l5DDGqjbFPPB0Usy
	ctjuHWEBvMsAIi3PIFQrGdnIRUWKEPo82upPFGkhkapz+jPJK/YB7Mutu7vmLS2J
	uXtkmaiJcgYuLaMCiV4VSNSLtKM1svV0ILMYxrVktt+/zD+eGP7+rwJulfaj8iG+
	vbvbfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgu78b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:56:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3840994b0d2so37629a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374982; x=1783979782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=UzhdR0H41mwTdEcaMJuoZjD/4RNpBeQ23AMvBIHyYiPRcCm0z4RH8/wM8Zuev469x2
         HDJM7JDmma9XBhiESb+LE9XR80v+GN7NaHrhFHjgzgFb93ciWk9nj/Xkb8NH5a+5N/qI
         fc1gGlkzigEq5b7B97u5gCXF0XvTxO9lSrz3mrqWvbeXp5wlFzdu2s6sNchFekzL53zH
         EHeH62UK4H4LfYMYp+7+kIKKqDKUmQsc/t0UebNQBeP1LyGy8Tv6b4XZ0Nr/8Pbdd7Th
         YTC8+D6BZYmJWBl8Pn0ytouKbHfDabd0v6sccqQiz3gxkj72byVBFRnYKty0/wt4MBGO
         5LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374982; x=1783979782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=U8GFWyXpxdI5nJvbsnn7xBATEUkfplDB0yn2XDqujXb/V05+CDGvwLcpQEqc6Gb2se
         X9QujpvqFH+jKRd82Y1XF4T4g8sC881E3Nr++8wPUEwudaqcNqLR27Y2PY3NkbnpohJD
         WDGmdUfXzsW2HjzM5LQ73qLN5Qc6AjqlXgO1qbQ8rOY5hTp6TNWsm2LHKWj2K4uEjDye
         WZUrlUbjjcaGXHGFexLGimMXfSBKo6AgMjdveSOsX/OKwYM5KRdPqrfhfV1UssBTZ4wC
         EoqiMv772x6d2Rgi2HRD7VoepfcVV6A7o8ZRkhmUCUOUAoh0Xg37mlqu02s3Fbd+j2Jm
         LW7A==
X-Forwarded-Encrypted: i=1; AHgh+RpwUvYE2DIrQ2DeN+w7V3Fi6hqKvkdGiBV9Eab3s2NkUjfb3P+RMlaEFG12m9LZw3StpAzDuWOONtwwRp0e@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYzZHbMOM2KNvre9XJMoDMSX+U26lbXxgWXFyuvuR91+3QI42
	zWTBwqGuXJI68MF6lii/EVcpGYK90N6DWBj6EQd0S3pRbzAkf7M+/Vkze3fFW3+efx/v7PLRd7n
	LCSGtvZnfyEjTDOp9XLTWt6AsIJ0+BxPv6BDmWOXtP//dWLMuR3UcQJaDFBKJgfVV1m3Y
X-Gm-Gg: AfdE7ckn/moHOpGRRexXCHTcZ3SL1carizg9U88r9LO2ZVCKYG/kcEpwrZR/u8ZQK43
	xH0IWcO9Wqtas61GsMwHa0HKOWa5i1ztRkRp8mMHTxoSFUtoogm7rRgJdXHNCbQ/Nrijui7Gu8h
	a2hYpcEO5iM07Rv8Klkocq5faPI6gG6tS0mcLGrinBlFlRg0bVvJeeZtmct4GJH4ok9Rinzeuju
	1tWehVa8ouPhfaZTMjwema3MmW7mrozxuP5Nqx+cZ+QUQUYzSz/6vPXmSI4Uyc9dUsc1NphTu4X
	I6hE07aDUW4TDu0V7b20Uyh7sOI5/E+cUb+21OMAQaOP9gtN1K45W7ZANhssQ51361KsHN2eDNJ
	eAOIutjCc8D9vAxqsNrBVp3bDoxCh0L/7WnY=
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102052a91.2.1783374982385;
        Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102043a91.2.1783374981910;
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311748394acsm762251eec.8.2026.07.06.14.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Message-ID: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 03:26:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fzhlh1-1Kc3P3jjKPLdHONoj5e9zyfaR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfX1p35Hp9AGhy6
 Sr3pnI8pyPMHJrHuDYD/si90u+nlPYI1JXFoctPjqYsPsoy2q3s5B1CR/Zb9FWsCDv/1PR0NM0V
 yOAzp43BiAd7Y/K+W+flT84DZdL/K5VBzAmK8utkq5J9LhkYr+uz3U6imsNo1hgEZoSp+WTtkcE
 o6IFPMR5tTviOJpsrrcUMQnCuXu9B8qEuNzzBq6KN8Hc/kKA9dyU1OwfL82AVhilP8Ydj21ePDF
 M69nc1ptl91pHYIgoIgSrFUuQJFAuFdbkGNWnLTZEUSHLGTLqCemRHC24E4+ez/MAqSN0PXnDGx
 u6nWu4ECx3FEKemTGfgzyY77UJllERMO03RMZW9gfPypm6Dv4szztNoC++NlQupbpx8XtVcqU3X
 sRpFeRYwfhPC7tUvupDI1Enr1YsxSCwbJ/2s82oab89JF3zC8NXVhsm83HVofP+9J3KqjLuEWQ2
 s6WX1AKOoh5drDcSvCg==
X-Proofpoint-ORIG-GUID: Fzhlh1-1Kc3P3jjKPLdHONoj5e9zyfaR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfXzLCe7Fcg3ZZ6
 IX2HNHFbdQ9sUtt63eiR3Zf7rw7BNek1DUNx0eiEAQx0xFBB68Fl4x4n2F257YDdEH9GTKuz2qG
 1h5HrETPT4e+JOYQg1kIME1wDV9X/2k=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c2487 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF588715DAF

On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>> Program all the register needed to start up LPAC and send initialization
>>> sequence.
>>>
>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>> I believe some/all of these writes need to be guarded by if (has_lpac),
>> as many GPUs lack these registers and there may be side effects on
>> others
> 
> That's correct yeah. I'm not sure what has_lpac should be though.
> 
> Something we add to catalog? Or checking if it is a gen that has LPAC?

We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>> >lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

How about nr_gfx_rings as those rings can handle graphics workload?

-Akhil.

>>
>> Konrad
> 
> 
> Best regards,


