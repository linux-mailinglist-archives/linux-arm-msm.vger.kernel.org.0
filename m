Return-Path: <linux-arm-msm+bounces-100274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGOQEGZlxmnnJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:09:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA83431D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5045D302D5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E8E3E8C7D;
	Fri, 27 Mar 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnZNiARR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvpJp7+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332033E3D87
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609687; cv=none; b=quZA6Vk5edNuiG3VRi6tqZoeclFYgYJaXfjfGYlr5w4uspwdAmYgQHgKUTt2nMmJT1bzZScYtZqV4sd42/wVWvitJln3twkfTif+sa6LgUDIiohAWhUkZPVAMTqaLpRBqt9fgntIR0eAUiWKNfGbqwGsbnNiD4byz5dq+2qwKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609687; c=relaxed/simple;
	bh=hLZmfInzWybRQijtiaCfGXJOhzev/JOJoQo8h6KI4yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8RLQr+Uy8b5QLSc1YevlhHTmx1r8+E8z7my5ior5v2olPAx7XcFa7dCQZupku3I/H8eBAO7qyouGXZ919AowB7yB3lklT+Rb6G1ZiQEgqKxfWM6NUASs7c6UycOyWQxV+GKbbn9X3YUeM5+2Aw51jRcJbd/0A+QDVReX8W1+nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnZNiARR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvpJp7+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6viuB731325
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hH6XCXfU1cU4MjgGg+hvW26AzW9Ed7EUeCJbH4+sBf8=; b=FnZNiARRNURmkMMS
	QXVXc1OEtgPfIFoGi+gzagm9/p1NE4ZvGWvHhv/b7Bt+xiYEx6PuFpIwpGSxr7oB
	FpYSpzOj6n2xI+UJO4QOZ/oEsUD1v6qlZtGer/SENLZndAeBRAKW4Let9K4gGHd+
	16C6/PUgEK846h8dH58s+vL+ctqXFV26vbCqLp5VGsR7ZUbBAa5zDb78+7jn6eHK
	t6RwFeSIpoybD1r+ZhWSLn6IqajzpZDJyr3UvFZhlj3oV0jnJCsqSvL4eo6ozJaA
	8X+UcY6RyzCLwK/o1ePDOdLuvCY/Ljoz9Kh77Lm/5/UiuptvbQFFB6gsW57Gswt8
	0qDNTQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q332w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:07:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fcb63705so5505706d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774609679; x=1775214479; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hH6XCXfU1cU4MjgGg+hvW26AzW9Ed7EUeCJbH4+sBf8=;
        b=gvpJp7+5Coc4OKYfb72ymfa74YPwrYHDjt2klxjtzceE1G7CobsUAWynZ4WEUmSwV/
         +7fdKPPksZMvuoBH0xFAhuUPV3epuE/goGky5JB6GZHXsbBFir81dHEMhwNR5eymLl5V
         TCKbWEGMhqy6UxuKXfK6DRM0YDWKLbdx21CXoeZKhi2Axgdnqy1q7frKVxEWxP0SGG/8
         l+hhxX1bPXJLiJuGs3dniWiIrgiw35y/sGkfPvcgtOxMq9asexxchV4HZ7gUrpQv/zvP
         7SlnPrm9lOPoxuebWxrkW/cz1NoJKLzrIqffffGk+3nj2EtAENZVy8DC0LQ2J5voVa4u
         vCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609679; x=1775214479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH6XCXfU1cU4MjgGg+hvW26AzW9Ed7EUeCJbH4+sBf8=;
        b=ExHChfR0FqGUjNk8sYV7/D+KFcfFX4146jHD3wVMqMwFZrzRcqbnYJFoU1a6Tw4KFZ
         0d/vJ9fykL3/e3djenqsHz5hEbgKfYuHnq53slvvl5kFocrsc9FqLJIJfh7Qw2OA5cz9
         HOQZ9B+wgdBbx30BjXXFN1JKH+4bdNFtaIt23oCRi18DFVniPbNDvzQ0mbj+QDYrP9F6
         b7Je+acaXgqpSYXg9oUoY/FDkgyuVk9XDneFvqBMc9BgeKaQLYpFndOEtCstx9vmFAnI
         /5lZXlOhTtTdUeVTqMAEoyXLs6xrKKmK8fGsmb6K55PVEW33U2xV4zE8lw/+p/JA2FUM
         96yg==
X-Gm-Message-State: AOJu0Yx5XI49K/VunlRMV+af3A/y29+tH/KVuRHdCEjW95eRiRXq96ce
	R6V7o7wj5Z1PWTizF5hdFpZ6xHPWjNUuAhzRSXvCbGk704AivZdk+P56uTylNpapNIRGf8sLvw2
	VxkbMR1pMaLfna80MU5pxPFx+LLdlsI3rwHLvt7oZSeyCnyyUrCqDRLW8MWE25Fea2Ojc
X-Gm-Gg: ATEYQzzdBE+i4qRctUPb2nBhOd7pB761KBdqLC3KSITHKd14ZhXut1BXFMTX5D1bVTO
	2IYNjPapaDE/Btfd94voQF0oC54zhwOLen94JwhwO8lZK5dhnqFEvejm1VP7GgScxTsgMxQOylt
	L+vLrp20x8BTURnVXXXBAao4TJ8muBzet3agGNun+fV/LaPOY3534Y06+b2FByYXahiEjzPgZN0
	+Qc6seTgB0ja4V59GrbgUI0DC6UiZXEzqgJFs8y98TZAd8VAxaVjzdSCet0npbp+OMAi0kUz0qx
	wkTy13fQJxnZCeyc5cYXOYLi4pyoEI2O/ul10X+9m5geK1xSxOauioxRUUi5hTn8VEp7j7Upbrc
	K5k4+V+vcMnZDXfRf3Y+m3VhNMoNUhivirwIq4CHIOx/6OXF+CtnmB/w21YuZ8zIvqQoXDTOevV
	4cUBc=
X-Received: by 2002:a05:6214:4111:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89ce8ef05a7mr16678776d6.8.1774609678788;
        Fri, 27 Mar 2026 04:07:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4111:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89ce8ef05a7mr16678416d6.8.1774609678368;
        Fri, 27 Mar 2026 04:07:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c1104sm240530966b.33.2026.03.27.04.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:07:57 -0700 (PDT)
Message-ID: <b9f8d016-e22c-45ed-a50e-51e18f5d6e6d@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] drm/msm/a8xx: Implement IFPC support for A840
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-14-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-14-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nX5WnmdIFIQlNXcSC2YeGb5eyboLtZNQ
X-Proofpoint-ORIG-GUID: nX5WnmdIFIQlNXcSC2YeGb5eyboLtZNQ
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c6650f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0lWO4tzWYGIBUrK3vqAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OCBTYWx0ZWRfX1bNjYazb7bWm
 mdTGNztS603GKaMv+jLKLe1D3LVvrFw7bUBBZrsKyI0PddlLVHJr1rsBdQ6LgDpCodsX5D+tpjU
 g3toPFWvUc7F1ACpoaor8IKP0Ft1FvOA9dHNl4+vZIEQi3FzbMGEjuRCj9LEPlhvd/b9OVn0wE2
 C6Uxqip5vYS7B9+PbjQZCKeb7VQyCNWzUqqR/gBSax57LLEh540tw9uRSSU4nip9PozvQDq7twv
 dqNC2ZQNC7WTuhEl/0wZd7wxBY0u7q0I0jQMI3f2WP17eRGEua/l4bmVS14KqeRSve/l0JLAIcB
 32Wkb5/DvJu6wGGhRZv1ig9hrbxJcHPLYr0hjQhaJ26tM6UW1BvFWGJK4iCgmCRotmJ4ZuC7rSw
 pZNgdPggIdX92c7n83xAGOdUF7h8gtReck02kC3ibORdfrkWpHenrndwg6ucADNO7XgF/QdCi8Z
 RYHIib4EJD0ubpyJoXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97BA83431D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:14 AM, Akhil P Oommen wrote:
> Implement pwrup reglist support and add the necessary register
> configurations to enable IFPC support on A840
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	REG_A8XX_CP_PROTECT_GLOBAL(51),
> +	REG_A8XX_CP_PROTECT_GLOBAL(52),
> +	REG_A8XX_CP_PROTECT_GLOBAL(53),
> +	REG_A8XX_CP_PROTECT_GLOBAL(54),
> +	REG_A8XX_CP_PROTECT_GLOBAL(55),
> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
> +	REG_A8XX_CP_PROTECT_GLOBAL(62),

53..62 aren't listed by kgsl, but I suppose this is more robust

Similarly for:

SP_CHICKEN_BITS_4
RBBM_PERFCTR_CNTL

The other reglists look OK

[...]

> +	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
> +		for (i = 0; i < dyn_pwrup_reglist->count; i++) {
> +			if (!(dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)))
> +				continue;
> +			*dest++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe_id);
> +			*dest++ = dyn_pwrup_reglist->regs[i].offset;
> +			*dest++ = a8xx_read_pipe_slice(gpu,
> +						       pipe_id,
> +						       a8xx_get_first_slice(a6xx_gpu),

IDK if the compiler is smart enough to pick it up itself, but
you could do const u32 first_slice = a8xx.. beforehand to save a
couple cycles

[...]

> +	if (!a6xx_gpu->pwrup_reglist_emitted) {
> +		a8xx_patch_pwrup_reglist(gpu);
> +		a6xx_gpu->pwrup_reglist_emitted = true;

Would this flag be better set in the function above?

Konrad

