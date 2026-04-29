Return-Path: <linux-arm-msm+bounces-105145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJbZNI/H8Wn+kQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:55:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9249166E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C005B3004623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC771DF25C;
	Wed, 29 Apr 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZiNcvG+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvkstfQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6803A5E78
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452941; cv=none; b=ZyYBSjm3uHUfVmwITBst5zzDZXr4T9WbDKLMUOzGBwZavJywe8lCLYBGiTZGe5WNqFQWcXoonRXpnlaRzooSY//pgzOFDOpHoL5853WRKxESrQwe1Ur1TNvjRAgoBSZnmH2bQodgXO/xyHbAihZKfi0nZz+/dHBt/+lw5li09jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452941; c=relaxed/simple;
	bh=SsTtMbbTxuB5hB45DpDySwjlsle8LLNNoVSnpFlYWDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uj7k6aFleeVjFD4qpabVuvAbzEpsZk5lw0kxzgZhcyCAMpbevKt5S08/4vpVjvidh8XrPpmxc0M+6yaWiXrXChja3F0R8XVH9RBVK/QpQLr3vYu4Yp3S/9adI2muSl+7eLOxYLa9q9eUuA5J3Pb64rN7iBbZMSfN6dQhc2FpUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZiNcvG+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvkstfQJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8po9W901766
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IiUqcsSbUFeSqI44l0FUgFlUNzldUc41Ls0DEJQw1I=; b=eZiNcvG+jfL3M20i
	443BEuTj/iuq5th8B1fCFuGfqCuVEszl4Op/iLHEbzi6Eox3R4Rql7Kg1x1FA3/c
	scRe9MqUh5c7SAJ6Gr6IJ+XFxIAdyi+q5kMiFMkTgKNmVPz2ZINsjjzfOQ7UcUwj
	EBO1K+L8FEluZKeaAfRVaTWxHdE4sAjG8Bh6vtix/UWU54H2kb4cm0ywqaHOKm93
	02pJFpBSAWQ6ChsfsACSRABHQfXooMzJtXSu90N0jDg8xVV8vZVuBxXqGeon3tkq
	IW1EOsK2lG8OT68haSrH7LDf/uE5WUF6gZ5PhYGg6CCtGfs2ANyCMBjPiHU16Zzk
	Oac7NA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9gve4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:55:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95406d3f998so815098241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777452939; x=1778057739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IiUqcsSbUFeSqI44l0FUgFlUNzldUc41Ls0DEJQw1I=;
        b=kvkstfQJKLAgy8BsoS1kW7paPpAQr4Pk8vuZaD0OO7ewQnzGkCcgBvZe/w7JvT0dik
         FsbWeo4cC50bivIbWy6lXCqTUwN0TJ5odMZznZkA6eDNrvA8t85tqT/Q6pr1H/g78wYl
         qNRxCHv+i6lzUVhNg576jEPuyu9+xgtZ1QNoSRK7moYPh2GTPZseMC8cogTOsBCNLT4L
         lZ/j5H5A8Hkww7OTG3NNH/FEcNf3vpnY4/PJGnHiGWMdD9dUuG33EUlJq6Ar8cksDGQT
         byYUCD/oOr6sjzFxPuqrYm/uVFLk/XFqqvjsKf3rXE+5VUEDJRQHnwYPPvAI/TF1dBU0
         ixUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452939; x=1778057739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IiUqcsSbUFeSqI44l0FUgFlUNzldUc41Ls0DEJQw1I=;
        b=dENpbsXM9fZbjDNVBeAxE97TvAt6XlxBLyLeX3tYJRIxG1NEd4dq8Ayp5UaqeX81wN
         cQG3adQszsWayEttknLG3McmhpOkTq6YHj+ejhwtqqJi7SG2bKjeS2pILfLJKsx3kjJ3
         4s/Z4ybUJ/UBjSUHxYtIR9kjYI/1pNdoZoZI2J7NNJkhwUfkMftZdj0Zzlrnn21WRIcx
         Knd5aA0ZF+dDjwLfdnErR6IUBKVphQtGnjjaL14R1TptKuKXAjLRioiJB189tvm8NDQz
         3TlfnGlbQGlNAu5jqt53FR+uH7AHNiAz9n1TruPEX046OKBJiZmWs9LwX0bPbCCyWqic
         3dUA==
X-Gm-Message-State: AOJu0YxW9L11ZD8GY9E1a1jO197p3AoqcbzNxEyHf5ME38+Ag3vFopsA
	9BmYiwdpryufhm1jxwQioLLpVTPn0v+6WEXOPDJ7yqGcwDOOVvKveGweZkSxPtxzs+ADrXrxMB5
	DmRMcJxe4FOA6lgbOnv0lNCvB+fxuZ5yxh0Rw0gMTJ0lTfwNpYeB7S/Ci1yKtGUe3Hor0
X-Gm-Gg: AeBDieuTgpRVzIMTa0VV1W501nXQJGMYDDilK1zc9DxS1bf3mClxKp6dL68VqCWFYbv
	JrC5X1yOAFah7X/V/VoYaZ31B+QFGpzlhPEnWmBHp9VpHfU/6jEIe3pmu36So/GH2vkulIdWU1i
	eYOCrHNpaAgJlE9sGal5uJc8rc+zVhGfqWSv26o2aj5y1q1Hkv66GY5/NA9/MdtyhNjiZytbU7U
	p3a5hk2pzAfOUKV7dULgpxx3OYtB7nYov4AgmyKcn7f21bcvxBNTNlrnYqtCeX4YJrkQjKl/1Gp
	/nBgUIUgG8wcV38GMMZ/qNDI48AWWnBsrylA66wiX3WJAE0wyd1X7ozlQmEMxnFAYnFqM981fvu
	/iGRzD89cdYkKjU97Y1Q+6jW3OkslT9ofBdcl39A5vnvSbjuZMtq5z9f2ssRtatyo+/8hALBkRB
	pqb+Lq+RDvTdJLnQ==
X-Received: by 2002:ac5:c985:0:b0:56f:8cf9:33bc with SMTP id 71dfb90a1353d-573a2ba0fe0mr1301871e0c.1.1777452938727;
        Wed, 29 Apr 2026 01:55:38 -0700 (PDT)
X-Received: by 2002:ac5:c985:0:b0:56f:8cf9:33bc with SMTP id 71dfb90a1353d-573a2ba0fe0mr1301862e0c.1.1777452938311;
        Wed, 29 Apr 2026 01:55:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98593774fsm61116966b.42.2026.04.29.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:55:37 -0700 (PDT)
Message-ID: <e33c2b46-d65a-47a0-8595-b2d42dbc47c4@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:55:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: don't dump registers past the mapped region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260428-msm-fix-dsi-dump-v1-1-5d4cb5ccfac7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-msm-fix-dsi-dump-v1-1-5d4cb5ccfac7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9wUe438Ma2py7C0h1JM7VQLz9gYzjx_u
X-Proofpoint-ORIG-GUID: 9wUe438Ma2py7C0h1JM7VQLz9gYzjx_u
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1c78b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pSQ9VKN1VO86L-afhjsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OCBTYWx0ZWRfXwXkI/2wP9Ai4
 34A3rbuzNu3TC9MtqjjZMug0d+yPmPJM5MEtLEPjEAEJf8d8i7L2b4NKcLhU1ek5d1KBfX4Iu4R
 pB1r6Sl1A+E4EGVNhCoLl/GsJzUKdsOX04rnRcSAPNHEYCV+KUsMMKK6xzWFzSkkxLgkJ35bdHj
 IIyOP65oSFujxz+KOeZvX2czFVXs//DErBqqNbG7aCf6VJW11MphFLlEHTCQ6s+8gbQ69O/vV43
 1AuRCtuxUCldzkS3thxjHXBZxL4DVvqod4CUJuA5KcrUiV0VpVMlDB9XHy+G0QGXpfCgoGjxtAl
 607dyhn5qfyAVaAaSK9kgvrsi90DAWNDlgP6qID3Ox4tSAafuPfCfpaYVDlLnvHJVqgg8XCk8A1
 N+cz8l1ohzseeJSmQAk+jSNcN1iEs3zm7OUt57tGVMZJJBSAs/15Z+tiBfx+FgYFWrEuM/B386L
 GIZsKHL8UFBEjzJwomw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290088
X-Rspamd-Queue-Id: 69D9249166E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105145-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/26 7:21 PM, Dmitry Baryshkov wrote:
> On DSI 6G platforms the IO address space is internally adjusted by
> io_offset. Later this adjusted address might be used for memory dumping.
> However the size that is used for memory dumping isn't adjusted to
> account for the io_offset, leading to the potential access to the
> unmapped region. Lower ctrl_size by the io_offset value to prevent
> access past the mapped area.
> 
>  msm_disp_snapshot_add_block+0x1d4/0x3c8 [msm] (P)
>  msm_dsi_host_snapshot+0x4c/0x78 [msm]
>  msm_dsi_snapshot+0x28/0x50 [msm]
>  msm_disp_snapshot_capture_state+0x74/0x140 [msm]
>  msm_disp_snapshot_state_sync+0x60/0x90 [msm]
>  _msm_disp_snapshot_work+0x30/0x90 [msm]
>  kthread_worker_fn+0xdc/0x460
>  kthread+0x120/0x140
> 
> Fixes: bac2c6a62ed9 ("drm/msm: get rid of msm_iomap_size")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

