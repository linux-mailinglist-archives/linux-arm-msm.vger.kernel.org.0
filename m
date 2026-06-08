Return-Path: <linux-arm-msm+bounces-111738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 871tAhx9JmpFXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:28:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A9654088
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 10:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YbgAiNTD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DRNRBPQg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111738-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111738-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E041D302A584
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 08:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1AE3A9013;
	Mon,  8 Jun 2026 08:16:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950D33A6B8E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 08:16:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906609; cv=none; b=EoDE8i0dhZrq7oZXYejhSSoCFX9jGF/+6d+cg3wMvrlUtDF6NtZ2y6m5Dnpi4aoPOTvLWFTgciknVO0Jp9KIIfXVDX8R0j2uGjYU4Gnu0HIXK5EBk90exAnyV4Rw1PYb/UTkKTiI9OTHci/AIfcBSmpGrGqcPKkM+alAuKIm9V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906609; c=relaxed/simple;
	bh=gJRYBEgOaGl2BIeH92hj9K0rA24WAa9AgrXCfWfGeeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+N0ryUHOTa9PS3FpiGOjwuYroRl3CWTzmVq7137xzXnq3BK+hAU55Md/wCaU3Fsc0aUl9/jltkUkGeFhEtCbOtDckqPpF7j1GR3Jv8pw7oYZmDxXvUgi+4kRdWHi6AmR7U3E8fxFMvQH9eQ3AQCJubY/M0CFO4iTcSuAARsdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbgAiNTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRNRBPQg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OfWu2385927
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 08:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AMCbCTPRI9tqD3oyXlXIADZYYKHqYbtOIHsuIoklMc=; b=YbgAiNTDvhc9jdct
	PmanbLRJZ4shvZoofRsmmTqcuOlAtVfcDOdfRraSIB/eSu29Nul8Yuen06VR9WfN
	g/lE53tyIh8YGafG/lNHRshpVZBAf50+u+85sx5dLt8PNhuvRaybkMfdCw5V7781
	fnTLX5GXRJ7w2iEYpzdlqeVXGz3ZmPruURBHW3bo6rmfiVP05drjCDsRgO14nwNI
	NLPUZlGly3p+tAwQZ7PLzaC1EIWDaf1MI+y8/aadgc0f3piAl2iDWIA6fqWOMp/r
	+oFHFwfxBd0IDd0dZZkca3mrz09QxuYssSdY2tnpCtRqfagJvEj3e4QVSVpveiv3
	/bPdjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8xhbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 08:16:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso117234685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 01:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906606; x=1781511406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AMCbCTPRI9tqD3oyXlXIADZYYKHqYbtOIHsuIoklMc=;
        b=DRNRBPQgHkahnklLtc6a/MP3lqZkeIqv4woIsusf38r0aQEIALnfrSPFNXs/tHpBj4
         jWc/EgqJuv0HX6dWheu6WrmAmlUY9WCndmPtEvdQ21RKYDkKZrw+TQhqElpbc2JhQdNZ
         fgO0yIbVlv5RpmKUHByK6smFoDITY9kNmys5L0yUP1dpqcmzm9jX6hl4P+kHWzQgzplJ
         8OxcCdawFV2rwIyojMYHR9/pxL0C55Ay3jTKTJR/zgDr8VkMt6z3ID5H/i/x9/5XC6cO
         ke6HfR01fXBMrucum8RZtSjeijJPLIWNNEMJtc2hUHnquY7uyKcGZd52LnXh1wBMiR/y
         GhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906606; x=1781511406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AMCbCTPRI9tqD3oyXlXIADZYYKHqYbtOIHsuIoklMc=;
        b=RPP+Y91Dv8cBYnbveozz+cVCfFJ1Mlb1GeaQ8B55JMwbkbVPkd3agrrj/29Jl0rWqb
         QiYCMwDv7JGQILEfAGMLLOm4+XtqK3Wa20ujIb6eQG0aRvKQ4phonlYtWUAVBfs+mDgI
         HhHQ3fehTDo5rn+s4QMDhS1aovjnm8cGaXnDESQjeYPGJ25bVZEhxXNsfaWX7mCna7kO
         1iqhSU5VkjvwI35hyNqsgHQuyOiMEwXU10Kx5lp9G1++9eJBS//+S4l4ygA/ToQhcbqu
         bXsHXCoc9OdwMvaV2zl1sozGmWrhoAOS9nBejuBFXSlQ7YoQHUd56FAOC97zMJaUxGaH
         e2bA==
X-Gm-Message-State: AOJu0Yy36GVzuIBBuJOoH5lXSi9yvLB1YmAt4IUWis7KwtI/E364S1vd
	REQxvqsTRun5DM37YX9gYajcrpepQ3Wb/VRzaDq43xEourVJHbZTMstzpUO0/+8EYIwRtrzjc8Q
	Zwt9/ztlMoX3TJdJEuEgaemU+KR/TFkJRHPSIVm1CgjoeZXAUZrWTzB3smq4Botgvge14WyrE9h
	KE
X-Gm-Gg: Acq92OEuBHTLU4hdsQYeNw4l1qhkfCcH0hOaRX0SbxwI/Y2OH3LVL199vupZL9Vhk+L
	tUw6Eb7HjM9gqRCJU8CIkwD3eXhD4T8oGfcbuFM6AfZX2bivb9eFUDJM7RqI1v2Yb3OBc/FCwXe
	FgwMU030PZ1nkJ50c39FhnAxPabdo3O7S/AxfZBaTZpID6noUrY1gSX31hKLyfBjlpPdYEoqCca
	8f4m4Rm/MrzbEkdFpQHBAd5kzmOoK2jecsecQpeMX6jxzAU7wLhJKONrWoQcgqr4xp0lF3Tvo1h
	KbcKQT+HQzCmYYafPGZChw5wHLHAK0sQuNmsUGDJfeaXTYqn93b6LWm2+8ub8kRrkR4W8qNYT4d
	fhWFLF/AbWrF1WcORfYMR226Me1AfhRdRT/kuLJ5UVWJHAMFnPNNMVpoU
X-Received: by 2002:a05:620a:178f:b0:8d7:ed38:8189 with SMTP id af79cd13be357-915a9a36533mr1322506385a.0.1780906605665;
        Mon, 08 Jun 2026 01:16:45 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:8d7:ed38:8189 with SMTP id af79cd13be357-915a9a36533mr1322504485a.0.1780906605125;
        Mon, 08 Jun 2026 01:16:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05208e897sm817822766b.25.2026.06.08.01.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:16:44 -0700 (PDT)
Message-ID: <943d792a-6980-4883-9644-904c6b4832d6@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm: Fix task_struct reference leak in
 recover_worker
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-6-2caa04f7287c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-assorted-fixes-june-v1-6-2caa04f7287c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JPDsaJVzNNIXbewgu4sDD75coqhzzDdb
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a267a6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iwmd1eEXldmoXfJYBtMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NCBTYWx0ZWRfX07AXXOec5dk2
 ViThqD3zZIaPvqjI6f33yjdoh5MBwgyUFyAPa1BCvVEYMri1wOhL5r3yEr7G+vvccdlhRQf4U+s
 NCSHjXxKAVO4mJU0+51bjaLjA/quNR/zBNFnIA+smV6dvtIk4ymT4/xupuMkKFcG9SZ3/GxDdKM
 Dam6Wa4E7tN8VSbjNEJtz1ybbkI1OICoTpDAPDCPGFLCQ4f0DR9ilNkl/d8eNIjaMn2rwGSDLTz
 f1OL45p4w69Ec97N/rlG6VL826Y2FUwE0tG5YKXbUvAbv+dvFC3mqkE7sjRGUlHroWQXOuC9/9H
 Onl7Fswk+zGX62p+3fpTqsE+4ZCRkbIVGQ4bQ3iKrOmhbgqFDlFeQIS2SJky7G0pOq1dSa2JAZt
 SyjW7aIO8LW1qdVknXW33qqJsafENsaGgY0yEdkxvz2SyyEIVttJAu9hGXitp2hMLgsNz8HjMLL
 tztzlEXGx6FOS/RiISA==
X-Proofpoint-GUID: JPDsaJVzNNIXbewgu4sDD75coqhzzDdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-111738-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 127A9654088

On 6/4/26 10:08 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> get_pid_task() increments the task reference count, but the
> corresponding put_task_struct() was missing in the else branch,
> leaking a reference on every GPU hang recovery.
> 
> Fixes: 25654a1756a4 ("drm/msm: Update global fault counter when faulty process has already ended")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

