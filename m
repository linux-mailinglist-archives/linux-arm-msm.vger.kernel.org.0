Return-Path: <linux-arm-msm+bounces-104122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC9PDEnK6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:16:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A66AC44697E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB360304D9A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE4E3EB7FA;
	Wed, 22 Apr 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAROdOi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QcfTdUvN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B093E9F88
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863078; cv=none; b=WGRfOCYrxQcT0AEHOdczdYO4OZBHOEJy40KOPYBeahmXnjCE8cjYSFlwDY7wnTXdq7xa/qgM5+7GJv7cDyr0UgXUG2L069SCosykhu5cczCT0aa1kzGBfgZDNGdo3cda1r9gtVBvSVqPkpLZodTHoqgEYNdnBO5I0YBsZTHufDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863078; c=relaxed/simple;
	bh=7H5wBaJe/R/hFrKmXZMsS+c4w56GQfd9rbPbyyNiwfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNL1CSl3AdStNqIrTofwQswG5vjRtQnt4RS2ZurRtYz2TxG83yJYZsBipLTXup8jsCRgDjamgyNokaeXNrYl70USLJm+Ip8DCb4B5iVixBGcaoQMPb8v4tyhWlxSOJHjQqotIKtxfiG8nVVrnrnXrFZqrtaNTD0hSUrTRrbhgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAROdOi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QcfTdUvN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAUpnn976175
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=; b=OAROdOi2XqNWLjrM
	osntcLVo29SccQ+37V6UNRiSxWdk5HyHgw+Zfk+9MlzOzODfIvkCdP9ClahxPMv2
	5zbqYjRj78JglBtTbVWNCZmEwqSC9Kxu3yXR3zqqEouR5ZxXXbBoaUhtHuVxcRCW
	5GbCWQ5x9/r516wZl3/Oj8DcPeunutM0bnOKUpajNOV8wO4GJugmGCYy8yk/RlnE
	6qQrGCLG10WgbWCSBxt+NRi6WCxH+BaO9oJg4ROc8sE8J4R23hlUHggZqDvgLYdD
	p1oVAwuSpM9kJ2wD2OMR5Kn46uF7sWdEiHOVucp3FEgzFm3yK3Dtv/VZtGhIKWBz
	1pMjdw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenebj98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:04:36 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4235025e38bso1277853fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863075; x=1777467875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=;
        b=QcfTdUvNT2b2bpxngAJfrlTSU0ITUgh/FAH/1gG2cIdXoLKAyFHasRifV7UfAKIPYy
         +3x0pSPDOb3vRIDx3I48GUYUluiZ0b0IXiaQ/o8x75qzfO7yoJN+J5FFiChf3rFJj2s8
         lmY2E50s+umUoVEf7jdJVF/j32l5PeoL0gmPblDCkPQi2fUCECtZ5wPaEQGzaHS2XMos
         wqi9nmQlqPXwrgHolc8onXC4ueVFUIUpzixlCW6DBCq+i6edW90o5atxDftV3Xgi/b4k
         txdIkcXltimi3inwGc0x6VBYPQtQi8l6PrHwESsEJzTwUOiK2RIj630XMuKltDEzBzm4
         AhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863075; x=1777467875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9eW7q2/yfswm/0EP7ohuo6irtJLMRsFkiVDHy32ekA=;
        b=eFwNf/WUO8wQG4ctrpQYXLTho6KaWZfH56Obu171ymaUrii1KsxhdeAFiQU+WYR4Sl
         Jp/IzuX3y9olpB7WCMJh96G1wFjqkqRJf4sEbY3F4jqhBL+uzbp7Xpk1OLwGg3UUx0fp
         +QTCnuv++SWx0Hwhf0ZVGVwbHp+k0XjEFc6PYd/ocDnGnzXUbcNhA4fdzGyNL0OFhlIN
         v1LTYo9EnDUj8hzkoYhuSq32sKLaM1PbjOcZbIwHPsbUMVpql1Wpwnmz0c0O++sQiXEy
         Mvu+Gsh0SSK3gBq6Kahi6OimzMgGgQ1BptXXljzUqUEn4Yr883DyFTMIGwLDgg/yxGOi
         TS5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PrrtHue1bbRd5bn2Qs9Os9XT3u9sygUC3zSZmRLIkZUB/2604QWkDZ8eBR32JBa2SJ/qZHgPWd8Kv2Qvf@vger.kernel.org
X-Gm-Message-State: AOJu0YwBeWjUtwgZYrvH9/WXUDj0d85EjrHP7DB3lmOIDjshYZpmI5Fy
	sxSufi8ZkqmZPbFxX94mlVBfyRCe91+s8NCmLdwvh/IgnlTbKn9YsG4cjSZcHlUvDFgX/UatWkd
	50uSgqDz5xpNBqH8EHlWdsi86crU7E9X8/c/DyxaWtLBwldQEQCcfT8ljgGsZsB0a+sTV
X-Gm-Gg: AeBDieuGiP3jZGlzMtr2rJE8Xv0OeMk9woSJWod34/cJK1LmttDU/l5wgKV9TYcN2xq
	wuBPatMqcY/wYq9a0vBZmfA/1SpxErSkovC8E4v99QZA9bmmaO5CdqCo1sJmsibf41WpdK87QBE
	Qhf7HJoNMXzwqyO8HS5q20z+LtobhOz/jfecOQxq/+M0WwwFNwjsx79qHjm2LChsYu73dXh70em
	bTPwaCXo6pnc7puEVk/xA8K3Ol9FJP49N7F89XYqdL2XOGKiwzHqTwFoxXwZvkppNs+C4A8m+vC
	mAXkLQ85AMzTjWJMrhrtpS3rm9qRnrKTT5lF7kaYaBNXk7iVFlpjRBgy5hDeMC2w+a3MFwTqwF+
	apZhz9unOj2qH63fkfz+tOSG8mKgz+Uyt/61dLnx3HzolbcloL6oJNH8j06OVg5TRVR2AIzO8ur
	KAZAYsWsjLPgI2zQ==
X-Received: by 2002:a05:6870:3269:b0:417:4754:c10e with SMTP id 586e51a60fabf-42abf209f86mr8474881fac.1.1776863075404;
        Wed, 22 Apr 2026 06:04:35 -0700 (PDT)
X-Received: by 2002:a05:6870:3269:b0:417:4754:c10e with SMTP id 586e51a60fabf-42abf209f86mr8474824fac.1.1776863074872;
        Wed, 22 Apr 2026 06:04:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e21fsm3263165a12.8.2026.04.22.06.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:04:33 -0700 (PDT)
Message-ID: <23fbb36e-56b4-4ecf-94e9-4038c6311b31@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 15:04:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNSBTYWx0ZWRfX7wSzsm6rD0jM
 WnW7lPao5Bgde89OKm1EAPcKEnmohJ+DGRBVAOHULINobPePX9XTDxqD1S28b8aKqbxSZ060rW/
 hfuTUVoq2ZEuAY6WsLjsx48QLjHr3KOP396PKc8xqLIcs79JPWHG3fwCEF2duMG618jRpMLsYO+
 VBPd48KN25hX12btiD4EsgI4uZVFpgDJJjEoBxvM/nz2SrrkO8pKEoP1nY0nWDi2PP0qQeKL1hT
 VG8LhG4SKfB6LoeD0fd8MAsnz6GXX2QZ5emsIPbNj1/9vrcLT1KIWlyqgH+BIx8UqcL5LFSKeQd
 G5xU0LVog3/X/lXr517tZuh2pIoDIcDyrPtf6yo7lucsxV6dlicYq3VpHADaWh+G89+VQoIvAjD
 WWCLqNMp3WAu/T93Q5h1fomZLzocd+5Rff+Vj2ijW+KH8Sm8P05KUkP5vKbhRgQl/t4bx6hKD1C
 RRlr1Z6X9x6j2JNo0Gg==
X-Proofpoint-GUID: byvjhoUZlSNMpf6LzjsGml-ea8ytreOg
X-Proofpoint-ORIG-GUID: byvjhoUZlSNMpf6LzjsGml-ea8ytreOg
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8c764 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RWVxF5DFbFL-aEys5QMA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104122-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A66AC44697E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 1:05 PM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +static const uint32_t a810_pwrup_reglist_regs[] = {
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> +	REG_A8XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A8XX_UCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> +	REG_A8XX_UCHE_CCHE_TRAP_BASE,
> +	REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> +	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> +	REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A8XX_UCHE_TRAP_BASE,
> +	REG_A8XX_UCHE_TRAP_BASE + 1,
> +	REG_A8XX_UCHE_CLIENT_PF,
> +	REG_A8XX_VSC_BIN_SIZE,

This REG_A8XX_VSC_BIN_SIZE is removed from all lists for all chips
in newer kgsl

> +	REG_A8XX_RB_CMP_NC_MODE_CNTL,
> +	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> +	REG_A7XX_SP_READ_SEL,

Somewhat similarly,

TPL1_NC_MODE_CNTL
TPL1_DBG_ECO_CNTL
TPL1_DBG_ECO_CNTL1

should be preempt+ifpc for all targets, it seems

[...]

> +static const u32 a810_ifpc_reglist_regs[] = {
> +	REG_A8XX_RBBM_NC_MODE_CNTL,
> +	REG_A8XX_RBBM_PERFCTR_CNTL,

This list matches the expectations, modulo this RBBM_PERFCTR_CNTL
and the registers I mentioned above that should be moved to the
first list

[...]
> +static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
> +	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },

+ RB_CCU_DBG_ECO_CNTL to BR

[...]

> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 242, 1 },
> +			{ 221, 2 },
> +		),

The DTs I have all point to SMEM-based SKU checks. Did you find these 
numbers empirically?

Konrad

