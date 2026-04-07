Return-Path: <linux-arm-msm+bounces-102224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFmJCFJY1WmC5AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:17:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635F3B3529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4DF53015FDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3852DF717;
	Tue,  7 Apr 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVrPEXdO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bo91RWkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B7145FE0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589450; cv=none; b=Bc2JL7W56XMrkHoNNgvSms08guMgftuRmmAvm3l/VAUn56rebYigPTa3Pzh84TOob4dSiP5h+2f8xPYw06w9oIlkEKj81lkAj5axaHE4h+wk7AOe7EBRuDPJO8tMTqXNYo986OjkXqr344AOSc/f2QATlNXZ2z4UZ5/rX/xypQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589450; c=relaxed/simple;
	bh=QC4K0M3gFMu/ZZ46HgN0/TmG6+98bL2l3RY3GnUX2Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJqpGOGQxLQwJZu68j81kCUM12yX3r+xNvfMhNNiInpwNUKDVrcJS+LG6OLj84znkQ2GfGUEOOfz/o1veX4kbqFI4rwD6qpkmllKnL39GT5mxDb/nfncKiE8+GuoOzGnX12j8+Ixt9WFNml8iAmq2uBiqMsrpYIGLLHYfDj6nsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVrPEXdO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bo91RWkY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637FwBns1796076
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78mumGK398J9R90HCNz7x2LTJLiKD3WL0bIthEI3fxk=; b=LVrPEXdO7xzxlrnj
	0h37mDnSyDRUBpbbUUj4kpAp5BQSPkH62Z0ug8W2vFLLRA2S4czt/LVlqHLN+mjt
	2XFlDlHRKTnK2Cw0U9/Mj2bS8CxOGWDxT+DYdN5vQC67PdzmUIg1Wzf/Ik5m8Z+q
	cFoD0BXzhBUP4Zna6A2SG0gu9KodxslgluyHQG0Th9uE0HWgXg3eAIOEalYPBPgd
	r0Ec0ubAmPcXpTrQ5An83GUPzrdyXjvBEFVMEzH4qg4Uaelu4gzhrNVoKY+HF8Ks
	tYifdPSMhWrjpXNX+xEyDA4S6fjmvlVuMPHTqPNhfLarVxHkRdKdRNKaBXX0BIl3
	J5AKmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd51d8try-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:17:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24e45271cso53616475ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589448; x=1776194248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78mumGK398J9R90HCNz7x2LTJLiKD3WL0bIthEI3fxk=;
        b=Bo91RWkYRAgplkIqCFuTz8JFrHViDMxbX3TPacbujI4ElupbpyE7NO3zBkRUyoJGZS
         FN85KrRibl78guqGOAwvPNRwxAga2nggPNh+nidj9ox1YPBT3E6Acb7s6XID4Pocw2YK
         FqZ72Cewf9/PenPgyH4TIS0VWsE47v6JOSZEyBoedpUKKMUb8ZnxucXOp3tn7ieAwmC9
         FU+o3cQAgBHzImHgG/u2pq7swACA9Kz9ZuKZ0i1XIx06VmnlhQXBNFcmghQreRm3Qx4p
         w+XqUPmFPc6OcS8nLKB3czQB1EPM1ZRPVuuBW0Thp83f0dV6FN7MygGhQ2VbD8X1paiZ
         wCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589448; x=1776194248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78mumGK398J9R90HCNz7x2LTJLiKD3WL0bIthEI3fxk=;
        b=S1GzshnkEvJN3LAmCjpoAEvzhIpN57jwSUNgCXilClf0G3Jn8M7ZsMfrNUDHiH7OcQ
         UF2cSRwk0SXDjgM20NVOxVd6SA28iAN//E4JApJojBvLPe60/g0Hekqb1vzPTpaqNTRl
         wsfZ8Ol2rD5ALuCWtVvqHYx4CxS8cEAi37tcjrrblse5QMfcTaA5vueXfHNdDDDZcmtC
         DP69bHQg7KwqNayA1QzF2Z6q4Qq8g3AlufvVKlrXmRisiNOELL7rqllcCnzin+zB0lcB
         WGIQUeYA6GjKmfMVeSEkSvJwDMTtmXq7dN/K/d8NLGFAIvy9oaPoNCGUyPdSR6vmkqpg
         aLbA==
X-Gm-Message-State: AOJu0YwjFhb1WqeM0v9Wt2mM0imeLkON4x7hWrl/08D9EQ7ekxmw5Wn7
	4sz/w5M2xm9jiET9Ye/5k4PXG7hMJpb8wm1/+Z5qQlIYAk/0AbzhlLNE1EgWTGo5opohF7XBNP4
	4IZNWClP/dh0CSVLGrN0yv+/87yHIYL1oEOZz5nKadmkj2vreQe2EkFezdNAHB9Iu/TtF
X-Gm-Gg: AeBDievoXD6gtTTlOXYWRLcM/QQvJfOZ5gMKQF42/WfPNGmvLTIf4NtnHmep9JRRXh6
	LaFAjh1P6rF7/SzyEw2LvMYaic8VMzIsCMUCkA8F3R9zlAaHAnoRJkvBQI5TMM6JR1/+TS2KBZL
	A28BYXY27/wwh2V5GRV4MyUHxrkahHoEspPCXwhECVwocqHvPOZu4VWgZLEozqgg2hbacqrXpDO
	kvBaBMz85gTcaGYj5onaWn2aepZqFkwf8dka6x4FooPxYNyPGQNyq5hfRZbXZqVKWG6zvJLkyoF
	0NL6o0ks0ZCJM9py6Jq5RWq1uT9Nr7ptV8mZgpCruNgS+FdPWFXOMew1HYgQTmt5m3oN8EaPoGG
	7kd4n+7gcScNyT0nlmEBRg3ITS1g05JXqS5o0QLxLQ/EkpA==
X-Received: by 2002:a17:903:38d0:b0:2b2:5042:dd18 with SMTP id d9443c01a7336-2b281715eedmr185147165ad.3.1775589447588;
        Tue, 07 Apr 2026 12:17:27 -0700 (PDT)
X-Received: by 2002:a17:903:38d0:b0:2b2:5042:dd18 with SMTP id d9443c01a7336-2b281715eedmr185146775ad.3.1775589447090;
        Tue, 07 Apr 2026 12:17:27 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749e2e97sm240033735ad.82.2026.04.07.12.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:17:26 -0700 (PDT)
Message-ID: <d56c1af1-af46-44f9-a048-2b3f22529307@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:47:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: fix userspace-triggered crash on
 a2xx-a4xx
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260407-adreno-fix-ubwc-v2-1-7ff73624635e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260407-adreno-fix-ubwc-v2-1-7ff73624635e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H1OYWyQeLR1eolvUw4WXKfN-ohjPla5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NSBTYWx0ZWRfX+a4iRzAW5cO4
 a3zB9S5YL5D9iY/mNiT521o3/jX3F8xpKb9jw+RoKVBNyMEzdtIaW2hd6Lt7KZxfOtgJcruIncU
 YLo03p51dDyeqEoBTOPvuXEjPKuB6nKRlKwrU6GIKeb2bFtUliWFLmmhS6/994ml3n2HPeKWP12
 fXyjNegQ5a4etao7ivZ5bYnA87TXdm0+bZnv+6ilJYEngaPfrPs0bOU39LpFIDemM9xgxfcBRRa
 s6b7O61/D9fegnQ4uigtv4WtPYS1gvuA8JcruPY+v1wowAE0eWpwt3lfmC5DjrlTKKyHebD9xrO
 yk1HbFMjohC9yky8rlyRnufb64JA1Z2d8dU0EkUw6TjwpRqgHA4tDkx87oR2KObVEUFVEbfoHGQ
 T+MnwgRwiULz+0kCDgAVuddNvGWHXbvAFmA7d4EjAIK0217nNZdFUfXExslhSZHdxc4kSrygY5F
 gw9OEsqEzFQzXZqTKSQ==
X-Authority-Analysis: v=2.4 cv=AcaB2XXG c=1 sm=1 tr=0 ts=69d55848 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dQ27rmbLVP968nd230MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: H1OYWyQeLR1eolvUw4WXKfN-ohjPla5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070175
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2635F3B3529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 8:53 AM, Dmitry Baryshkov wrote:
> Before a5xx Adreno driver will not try fetching UBWC params (because
> those generations didn't support UBWC anyway), however it's still
> possible to query UBWC-related params from the userspace, triggering
> possible NULL pointer dereference. Check for UBWC config in
> adreno_get_param() and return sane defaults if there is none.
> 
> Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config struct")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Changed adreno_get_param() return -ENOENT for affected params (Rob)
> - Link to v1: https://patch.msgid.link/20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index d5fe6f6f0dec..34e4ab43b0f6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -426,15 +426,21 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = vm->mm_range;
>  		return 0;
>  	case MSM_PARAM_HIGHEST_BANK_BIT:
> +		if (!adreno_gpu->ubwc_config)
> +			return -ENOENT;
>  		*value = adreno_gpu->ubwc_config->highest_bank_bit;
>  		return 0;
>  	case MSM_PARAM_RAYTRACING:
>  		*value = adreno_gpu->has_ray_tracing;
>  		return 0;
>  	case MSM_PARAM_UBWC_SWIZZLE:
> +		if (!adreno_gpu->ubwc_config)
> +			return -ENOENT;
>  		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
>  		return 0;
>  	case MSM_PARAM_MACROTILE_MODE:
> +		if (!adreno_gpu->ubwc_config)
> +			return -ENOENT;
>  		*value = adreno_gpu->ubwc_config->macrotile_mode;
>  		return 0;
>  	case MSM_PARAM_UCHE_TRAP_BASE:
> 
> ---
> base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
> change-id: 20260407-adreno-fix-ubwc-6a2564710e21
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 


