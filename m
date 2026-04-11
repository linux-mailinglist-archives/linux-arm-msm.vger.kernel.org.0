Return-Path: <linux-arm-msm+bounces-102821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA6EBce62mlc5wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:19:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 946033E1B96
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 23:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B74F23008D59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 21:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BF733066E;
	Sat, 11 Apr 2026 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwdNXjpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M43tduUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E221DFDA1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 21:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775942340; cv=none; b=uCrTHq5Ps8uHfg6s7EY1TfacArJUVeGzZsWx+RuQyQOZzCnTCiV58cKLcXYMH44+SANd82XpOZcQs72FjsdwJMltJxH4S7rK+7YFxsehSo0T6Sd10SvLQiMgXGMFBO4SRYJ73eMXpClZYtHCSjeVUVujvRP20ENjRSQ84TmbzJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775942340; c=relaxed/simple;
	bh=LUIqAWUBhl6g/I3c9Qg1ADRHmjmie0KEFAoGDd1xKZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXMSsnYqthGlbOhkX1Kq5EDEnL7ykhhJKn39DPpJwjD4FjU9gE/tY8EMn6LuLEeDig8A3kxo2+x5TnsiH7Z5+7FQhAO3/ATlm5LgQimFT9+m26/8egHWH3bXiXA6hWpGjy0c5BxIYswyAp8NLaclnRibn7oJIOmYZuuaWkwxGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwdNXjpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M43tduUh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BJnNTo457749
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 21:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BnhmHdOVt1XlDe6LmZ91H7GDDfYKRMBNLn8WZ95x1Q=; b=OwdNXjpdfdrQUNKm
	w/8r9jhTu6fAltxnxyfcBuq+FZ4CbybOzNbb3CyUjsJg9UXMm1mKqUZZ+sf5L7yt
	vIbKRJ6y1+NadUHWNT8S8jfQT/cBmt/gwI4/guxxbXdVmhlxrPRVs421RZ2snR73
	pSpH2UKElvZWxTMnvxsGPsqHczLPbgpZSvdAmf6IEZFzCxjNnjSQ1aK2FqPsBKUi
	sD2zLg0ExiQzNdrhltTFf7yBUhK6JjBYiJDFbhZpJMCbu2A4VsqnnaN57/THpyD1
	nG/8joKOya+7WQVcKxpmb0MZnE8KCsuJI+0tgc+yND6fwp+2DIPD7qzyO8D/7lHj
	jnZM+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcsd43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 21:18:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b258636d16so32429085ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775942337; x=1776547137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/BnhmHdOVt1XlDe6LmZ91H7GDDfYKRMBNLn8WZ95x1Q=;
        b=M43tduUhmDYa0K94tLu9nNt/d6PPMw9H9rC6o/ukQ9i2DvlRG3Byu2fwFHXmfEVbiw
         p/MzCjzmc2L9/TrZ9usBzqbqHN2oB2730DUkGK9UzOezho4NjS/a6ySVUPpaI4GXhUv3
         HmXppE7UCJpYBhP/D9tNYcrtJJ+M82trSdfNF9ybmI2G11PFhuEBxObT36qnffdxbPak
         RD8z1yx+qhVV9oGDKBNUwOZNCWwAMYnmVoACUOSXATDIiqtJWjcAjw6gLUfdS8y4iVn8
         K5E6Aio5XXfdb8LWI72Mdc6Qx2UL95RjLAAvbqe3dK5J8V7ugVVYfAaEqguHxjwVqvva
         9wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775942337; x=1776547137;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BnhmHdOVt1XlDe6LmZ91H7GDDfYKRMBNLn8WZ95x1Q=;
        b=mOZrCH/s5jEUVkI/JO7I8tyfQ8NeB2VzKOaRqF+c1z4fWECS7NI6Zt6i7YJQAxY/U6
         4AtB4J6WwPyJhp1Y4FHYeHZxQih4OGlpGOgka7jzt5AFJtTaRxKwfvxtomrZK9wDdLBa
         AGEk4Xg+6aS6ligesDJffSJY3rX4NSDF1Px6TCd4j9QfY1fxQZvvUzqPzlJmw4hcFZFh
         WWSu2Dc0SwALvJo5JsAErggLLxGmf/RyMtNZ9fkBZoBszTPBjdoLRZnTP6NgZ0u6l9pR
         bOkGJMT8RVp3oGPpXdD/apHDIzBNGszLpcUXKb0ZDHyxwPBJZSLb++ThNX4zCruQK/hI
         NJig==
X-Gm-Message-State: AOJu0YzZdGbk09Pnlkw0k8sVvTECU2/GewP1xiXv+T2+Evp2N7R1A1L0
	k6Xs0Rk8hNMCLz6AZ8pINzkMUXKZ0lQiuJwSmEETHbazQWVVnladXtOqsR85sZXwmxirJnN4QX9
	qtW3CJ9Ygt/PoX29iSyogw8gBmP+QIzqZrhY90hinJYdaCiHqwdyCg0Vvi3msc2xXKuUU
X-Gm-Gg: AeBDietYcdiXh7qxG84FOsL3msvGneHOrCJ4VVjMrnvFm0yDPPAaiSdrKNPubzJGZb4
	/mIrKf5jr3bAGYliiuC5jII8M02VWQqBayNdad6xu1sElrCxUpUlJ/2Wk4VcshG8CHlq95qLyCD
	3FbssCQ0XK7yAG3zbfHCfA2N6M2UW+9JoNp5xM+R9FoyYY/7tv6E+c/pruqvfb5/fUcC3CT927Y
	m+bnl2CEVld+uXMYSkvEwXm1AIt1UaSd1zK8Ks+K+4AF3PVQCvsW6+AgoSrtblbQ9iGYAeViSkl
	W94APL7nq3QoSf3H51eHuzwfvAoIsvP0HA3g5ZPBrvLrPmZ/yyhN7czMMq3kAUhMmYV4eVrXX/q
	90VGGOWbP2HZX7nhCvANQD6PLZf4qrWFjCEtKeudwxGh8
X-Received: by 2002:a05:6a20:9155:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-39fe3d1f6c0mr8379550637.21.1775942337054;
        Sat, 11 Apr 2026 14:18:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:9155:b0:398:a76e:4ad4 with SMTP id adf61e73a8af0-39fe3d1f6c0mr8379521637.21.1775942336586;
        Sat, 11 Apr 2026 14:18:56 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.228.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a1ef00sm5719024a12.28.2026.04.11.14.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 14:18:56 -0700 (PDT)
Message-ID: <8c84b6df-ad0a-4d7b-83f7-e87e9b2934a0@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 02:48:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Restore sysprof_active
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260411150312.257937-1-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260411150312.257937-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE5MiBTYWx0ZWRfX674BJpymf979
 w7cWkn82R8r7VcfpdGSwhBGr65y+bk89b1l36L9yq/KkP4zO2PEvmPIk68O1ANzvLSzFZvyuXKQ
 bah1Mm3cfSTE9AmMV7JeCC7IKFQ/KtVjCeaMF3PXyK55fDIThO1McJlb4nV+wQRCrr4O6O5pnhx
 3kSCFqakNuEWJbqjVq79P+q0Ue19S8/GO23D/qTRIfNkuS/kB+DIzHocR60TtnA4rE82cGolYhF
 7ElhIA3B5UreCJ9G/Sfv2zMzPaWchE83tnhhVxz/CvCHsbPR/Jp3VoNSXiF/wTGw84wmapU8EBq
 brsSy48lGy6LTt/sO8hFw7KOtdC0gQXpzsvSIrMzC/K4mHAfLOw0PWzd872ZHtXfNjByOF5YH2I
 5miPK+/aruoARLOFbs9lVnzfKBUSN7dUkKcVDqoh+qnVRcAiSaMn9om9X6s4bljcwt+qVSygDd3
 69AZIdJP3isCUpaVQeg==
X-Proofpoint-GUID: WXlw6A9R5LC0SkMM7JGq_JGrZYKWSWx8
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dabac2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=rTHjoFeudlETzLztVtW01Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aK1OVFfb90g1xg_bP4wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WXlw6A9R5LC0SkMM7JGq_JGrZYKWSWx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110192
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102821-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 946033E1B96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/11/2026 8:33 PM, Rob Clark wrote:
> This got lost in the shuffle somehow when moving the vfunc table to
> catalogue.  Fixes inhibiting IFPC when userspace is collecting perfcntr
> data.
> 
> Fixes: 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to catalogue")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Looks like this got messed up during a merge conflict resolution. :(

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 85607706779b..14b4f4921991 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2751,6 +2751,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  		.create_private_vm = a6xx_create_private_vm,
>  		.get_rptr = a6xx_get_rptr,
>  		.progress = a6xx_progress,
> +		.sysprof_setup = a6xx_gmu_sysprof_setup,
>  	},
>  	.init = a6xx_gpu_init,
>  	.get_timestamp = a6xx_gmu_get_timestamp,
> @@ -2819,6 +2820,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
>  		.create_private_vm = a6xx_create_private_vm,
>  		.get_rptr = a6xx_get_rptr,
>  		.progress = a6xx_progress,
> +		.sysprof_setup = a6xx_gmu_sysprof_setup,
>  	},
>  	.init = a6xx_gpu_init,
>  	.get_timestamp = a6xx_gmu_get_timestamp,


