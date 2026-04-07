Return-Path: <linux-arm-msm+bounces-102229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CzqKgtg1WkF5gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:50:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0E3B4082
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 21:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2BF6E303F08D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F95378D78;
	Tue,  7 Apr 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cq0HzqAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZDq/TVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044393783C3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591270; cv=none; b=PW05xNdC9K8yLz47o/Ww3Vv4K14MEE3h3wQj7trFtBcwkU3xm9qj/nGQ/anuVJhnVp0+tnqz5tuzCiVDfa0dCAR7WLn86fpxL5zOwk4EyH7kq3WwKB8I4B9z+SXsEwqJ2+VuJQbF6dpC1RVmVqhhpv783jHNbdK8Mw4Fc1SITIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591270; c=relaxed/simple;
	bh=fMEaVWRJWwr20DcJ5jJvBkYeW1L6rTR0eaWjDUW3rHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juYl+gpWtVXO0OpIuyBBrY5CB7IfXvwsrYPNza+1SJESpfZHu8HJilMiUVUVpU5DA50ot7ahzTODbCTpkD//06IaLmNucd5IwbNS5YaBFzPwQEO5Gv5Yi606QMkXpL+y+0w6v5eenIsAW4ZJ5AWzr5f46NA+rnIcc96vLM0Z6JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cq0HzqAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZDq/TVZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637JOHd52009903
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 19:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mx2nW3TGm+gbW2gkpnD1dEyG3W/yx0jbU/zDIexZ9Ug=; b=Cq0HzqAYmw4kUROf
	rz5ABSgHgK/uUTQLPXwVM/i8ggogtbgIpsO85e7iWdeKy5NT+2B5vEZPhE6cMO46
	vdSGqqValzd+vJlSNlz2OWtBpNdZ+0wc7Am1kxKpP7eud8ESoWu3Z9EsvYBT51e6
	rO94AVdYSUpCn6ipSz9meDbsxgESkUDn32aOE8iZLb2ric5BFrplx9LWXtor4LzF
	5LluhN4miAaEGN5pH23hp8dm+CFbhgCZC7ULC15Z+XdParolusuQBJPUckudWSbk
	qFvzAlLBpwgVtMHboPQ+z2OpbGVJ8Ywn9lzYvADU7ixiJTH929Jjww3gQlzWA43y
	vWdZSw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrvc4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 19:47:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so1647775ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775591267; x=1776196067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mx2nW3TGm+gbW2gkpnD1dEyG3W/yx0jbU/zDIexZ9Ug=;
        b=LZDq/TVZbWdTyXEexnSg9QhKm46astO3BYFyJlfsPNwWoJolJBxFMhuB6oZp5xa7vU
         Lo2Q5zD0SfhU08gZtrjcUbfUPwmfzMYOsFW7fA5SfV3Ep6eNao5ojwTBWy8c45gvE4P+
         qEJK7e26c4J40RozvfKYi1ZzTYx363ueofVVLSZLGwJ33oAKK3MZ0pmZ6hCmyNQ0PPYS
         VcUuMDrGAPiHdvi0Wf8p+ztfHjDMlTxgP5b1K2NafwdDqSvH7t5pQrGvUsXRAC9fV1lR
         /q878YLn/JQSynSBaaKTT0AEcc7LzPVW+bgWlSwj6x6KKqrVcYazmPk2TmRRAKOluxTX
         QsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591267; x=1776196067;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mx2nW3TGm+gbW2gkpnD1dEyG3W/yx0jbU/zDIexZ9Ug=;
        b=PikBOsPuHPE7VlrMLnRPUsJDgM+YfXKSwZtQTefs3e8Ai3zZwCOs82BIYrWJm352mt
         WNPKoyKjzrzYpyA70jDWo2doBPnJ1PfnNj0CBOdnkexZC+eesjJcLOPjzwkJsxGrVki3
         WkiEnnxohuQYDwOtmkrVVR5SXrsNvw8T/n6O1tc76O1uqoqY/+vcfl3tK9z8PDsabX7F
         TH3dONRgH6Z1E+KC6iBgfy9d9aib8AewBvJ0YXcOTfCxmcGTmgscQmIRNlq6SSvqQsjv
         lWdtq1WPPUUpGMo4q+Q4EehB+VrWViE6jyfDbfyLgamJFSKS7iOw2o+mOiLRGp3Qoo8X
         0tZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaH1j/dM6mvLZWdZwAQ/AZfiSj9TVmnOGGrH6cFqCuwIHEs/k5Ix6KA1q2tukzw8nv6VPnhwqFX0bKcTcS@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpEreczHAj/mwvq8balfhPdNlPJRPExG1wrwOt01v3PXNgwJU
	R9lYMYt+itln2A0LsTXFV/MmbePn35+u0K9TbO4rTJ/5wnb360IIMIxexiAbA6gHkolz+qSlv+5
	u3h2ObZg0vqsKlpBhbfKo3ATAYPxwH1OmhsId4npu+7PqCRzYUIRfzC53K0H2tIRx3cYQ
X-Gm-Gg: AeBDiesCTUm3iQ5Ffcflm5LFxeoANh12UD5aS3ZkuFZ41F82M1SOqb5i/Xzv97euKtC
	KRoIIZcwWaBsk606vVUkfUACdvbeOhmzIlXC4sh43QsADkzm8UXsAzjDi1GzU3kZG/N/Qk3dNki
	IfbOnjyoFI5FaC/moGRAlIcsXc82NF8RrqtVaQv5NrYZsp0kgcWxAqfheQE1R51PQdt7QRDQPhe
	eNHdFYBM/xdkeSRxaM7I5P3ObM4CKJibTNJOIMqyWRRg7GnRn0mnNAXh59uY1qMPsXkTjTWXTDR
	qNpqTKn8WL1fZMgW/3vwFtTNI4Du3PbdMlU2Vt888q6c1ZZFmhTUWcKg5IbD8DoQ14loVos/y1B
	cdPCLrzagHfvVcQCbgajPiCiUaHHcAOleDxYnLbuREh6oKQ==
X-Received: by 2002:a17:903:4b03:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b277d633f8mr200814195ad.2.1775591266826;
        Tue, 07 Apr 2026 12:47:46 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b277d633f8mr200813805ad.2.1775591266228;
        Tue, 07 Apr 2026 12:47:46 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979525sm220032045ad.45.2026.04.07.12.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:47:45 -0700 (PDT)
Message-ID: <40ef32f0-149c-4166-ac89-31254239ffa8@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 01:17:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] drm/msm/adreno: rename llc_mmio to
 cx_misc_mmio
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-2-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4MCBTYWx0ZWRfX4K7LsqFaIs6K
 3PXZ9XSORocpvb6nSrQ9zlphPAQxDceKr9WERr8C7Nr8C40SjP7PNppbssHq/59iiI07r9lgLQV
 R9UDElLjCKYLViam2femhyAV/GzJd6OleYhZh61gjIZdc2+edgCSWmgDvpT41FlJU2oA6Df02IF
 3MFeOnmb6AJW56gMJJdyQQMxNJtDIg715mHzR8F+hRiHaRQkkFEqJ8T+8aulomOsX3oEwy4gLC8
 ooLl6VyBC1wDgcsW68OOp8pcK5QXwLZIGrvYPYYlyYTs519VgLMNGxvb7vxXNr3rgnWmbrP3Eza
 PNvo07wyqYsZHplMDmWJ1ZT7jGcixh0jnrCPJY8kTcvisNEr+eq8lVvyauiFa06LBcQnrhL7l5z
 Pq+zMxiq8+SGpBH9q8yWnVWFG6LqA85gMoWjHy3a/g4lwYyn/v8zPecxAWWrBrlftO8EIjUlFsU
 hhgc7P3qC6t4Cb5+7FQ==
X-Proofpoint-GUID: 61m6zQWJjcIU5M7EKWmqdz5sANrjNte0
X-Proofpoint-ORIG-GUID: 61m6zQWJjcIU5M7EKWmqdz5sANrjNte0
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d55f63 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RkDKJPnwvwvc1UUQWacA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070180
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102229-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0F0E3B4082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> This region is used for more than just LLCC, it also provides access to
> software fuse values (raytracing, etc).
> 
> Rename relevant symbols from _llc to _cx_misc for use in a follow up
> change that decouples this from LLCC.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 ++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++--------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 14 +++++++-------
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  2 +-
>  4 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 916c5d99c4d1..23e5b3a22ea5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -947,7 +947,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  
>  	/* Turn on TCM (Tightly Coupled Memory) retention */
>  	if (adreno_is_a7xx(adreno_gpu))
> -		a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
> +		a6xx_cx_misc_write(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL, 1);
>  	else if (!adreno_is_a8xx(adreno_gpu))
>  		gmu_write(gmu, REG_A6XX_GMU_GENERAL_7, 1);
>  
> @@ -1215,7 +1215,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  		if (!qcom_scm_is_available()) {
>  			dev_warn_once(gpu->dev->dev,
>  				"SCM is not available, poking fuse register\n");
> -			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> +			a6xx_cx_misc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
>  				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
>  				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
>  				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> @@ -1236,7 +1236,7 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  		 * firmware, find out whether that's the case. The scm call
>  		 * above sets the fuse register.
>  		 */
> -		fuse_val = a6xx_llc_read(a6xx_gpu,
> +		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
>  					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
>  		adreno_gpu->has_ray_tracing =
>  			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> @@ -1299,7 +1299,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  
>  	/* Check to see if we are doing a cold or warm boot */
>  	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a8xx(adreno_gpu)) {
> -		status = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
> +		status = a6xx_cx_misc_read(a6xx_gpu, REG_A7XX_CX_MISC_TCM_RET_CNTL) == 1 ?
>  			GMU_WARM_BOOT : GMU_COLD_BOOT;
>  	} else if (gmu->legacy) {
>  		status = gmu_read(gmu, REG_A6XX_GMU_GENERAL_7) == 1 ?
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e1eae6cb1e40..9847f83b92af 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2039,7 +2039,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	u32 cntl1_regval = 0;
>  
> -	if (IS_ERR(a6xx_gpu->llc_mmio))
> +	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2078,14 +2078,14 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	 * pagetables
>  	 */
>  	if (!a6xx_gpu->have_mmu500) {
> -		a6xx_llc_write(a6xx_gpu,
> +		a6xx_cx_misc_write(a6xx_gpu,
>  			REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
>  
>  		/*
>  		 * Program cacheability overrides to not allocate cache
>  		 * lines on a write miss
>  		 */
> -		a6xx_llc_rmw(a6xx_gpu,
> +		a6xx_cx_misc_rmw(a6xx_gpu,
>  			REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
>  		return;
>  	}
> @@ -2098,7 +2098,7 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  
> -	if (IS_ERR(a6xx_gpu->llc_mmio))
> +	if (IS_ERR(a6xx_gpu->cx_misc_mmio))
>  		return;
>  
>  	if (!llcc_slice_activate(a6xx_gpu->llc_slice)) {
> @@ -2151,15 +2151,15 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  	of_node_put(phandle);
>  
>  	if (is_a7xx || !a6xx_gpu->have_mmu500)
> -		a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem");
> +		a6xx_gpu->cx_misc_mmio = msm_ioremap(pdev, "cx_mem");
>  	else
> -		a6xx_gpu->llc_mmio = NULL;
> +		a6xx_gpu->cx_misc_mmio = NULL;
>  
>  	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
>  	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
>  
>  	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
> +		a6xx_gpu->cx_misc_mmio = ERR_PTR(-EINVAL);
>  }
>  
>  #define GBIF_CLIENT_HALT_MASK		BIT(0)
> @@ -2560,7 +2560,7 @@ static int a6xx_read_speedbin(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>  		return ret;
>  
>  	if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
> -		*speedbin = a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS);
> +		*speedbin = a6xx_cx_misc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS);
>  		*speedbin = A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(*speedbin);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eb431e5e00b1..648608c1c98e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -102,7 +102,7 @@ struct a6xx_gpu {
>  
>  	bool has_whereami;
>  
> -	void __iomem *llc_mmio;
> +	void __iomem *cx_misc_mmio;
>  	void *llc_slice;
>  	void *htw_llc_slice;
>  	bool have_mmu500;
> @@ -240,19 +240,19 @@ static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
>  	return true;
>  }
>  
> -static inline void a6xx_llc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
> +static inline void a6xx_cx_misc_rmw(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 mask, u32 or)
>  {
> -	return msm_rmw(a6xx_gpu->llc_mmio + (reg << 2), mask, or);
> +	return msm_rmw(a6xx_gpu->cx_misc_mmio + (reg << 2), mask, or);
>  }
>  
> -static inline u32 a6xx_llc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
> +static inline u32 a6xx_cx_misc_read(struct a6xx_gpu *a6xx_gpu, u32 reg)
>  {
> -	return readl(a6xx_gpu->llc_mmio + (reg << 2));
> +	return readl(a6xx_gpu->cx_misc_mmio + (reg << 2));
>  }
>  
> -static inline void a6xx_llc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
> +static inline void a6xx_cx_misc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 value)
>  {
> -	writel(value, a6xx_gpu->llc_mmio + (reg << 2));
> +	writel(value, a6xx_gpu->cx_misc_mmio + (reg << 2));
>  }
>  
>  #define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 9e6f2ed69247..8b4b022d9a6b 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -103,7 +103,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
>  		return;
>  	}
>  
> -	slice_mask &= a6xx_llc_read(a6xx_gpu,
> +	slice_mask &= a6xx_cx_misc_read(a6xx_gpu,
>  			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL);
>  
>  	a6xx_gpu->slice_mask = slice_mask;
> 


