Return-Path: <linux-arm-msm+bounces-102236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDMwHJFv1WmN6QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:56:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBBB3B4C10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 493123010178
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 20:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D5733F38B;
	Tue,  7 Apr 2026 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kI0ESiuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWowOltw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A16346AC5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 20:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775595406; cv=none; b=PSOVBs5U90zRxCKTOm5Lo0eYMxjbP2uaGpi+ZnpznPZzSlXCV4nTdla5lyhyZZt+mwsjCT0yLCf9np6agCKEIJVSf+/xXuVpz/ML49kKAbModNYIQJx1WllytWSgOAkCvvdAoLcXlaUM78C6tw8AHYKtu+bDh3+wMbNTMJzlNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775595406; c=relaxed/simple;
	bh=fJf6lWY5qdoDHg+Q/rUNM7FcUnBneEq6+Mq2Z27SYBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOScS60RQDNUrUcOZSZsRK3gbBsZC/TD3S+SWTUmN9v3Z51UC948BHI0zRdt9XwhBT0N1YN72EkX1EEWQrq0scUgkMXTDWQ9jiSTDVzQmXGuIHpXHDUbBepv7RFyJaQpCtaIkT2SnRgb0hA2yNP2xxtWDvSBSIwnG/aQ//5KZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kI0ESiuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWowOltw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637KO8N3249488
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 20:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pRl6Dx6B0mkqFPDqATgvKDi3sD3DOCAUhWOBaLFM7Zk=; b=kI0ESiuTgYaqZYv8
	fU39vsX5s0KbZc0aFYzMwLlLoyr08/2YdV/CbgZIXdra7MeXhf/yPIf5LAZ5yzAP
	bASEO9rTT6WPkg/HV+iwvykx00S++Iva0dcOth/BLMSNFhN1+sysI9hie7lHJAAv
	bg+FuQFCGjvszG8TBOE6BqzhEO7+LUKx9NhrMaojOwLUJHQozDe1nppPBwnEaeUD
	QE56P2v32PEKaBAYF/qKQzmy+lfpYr4cTz6t6+bkxYgqE1/EyImCN8aYyHstDul5
	WPOjleWiViQAWFnR6k/HMN5uhG05cbr7TS3Jm7b/6WuUf/1dmxAxojx6f7HhlGnq
	xUmsEg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x982r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 20:56:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so3864885b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775595403; x=1776200203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pRl6Dx6B0mkqFPDqATgvKDi3sD3DOCAUhWOBaLFM7Zk=;
        b=QWowOltw92V1XvE3dyYEiOThJXp7cqULEz3bRuPV3eS7y0ZEvxh7HD/kUTDCA3N+Hm
         P46dKuMgA+gnS+XvlNcqmbA2TllcdFyUVC/EUNbIalnBAKg88v2SCnwvVBX3aqTNsimB
         CCyr7h6DGfv0HpvV8mVGuXxd9fMEVuRruMErQMAS/rgHChJ4dzah0rqzzDnV99eJPUoM
         p3VpkPmMRycRFYovMZHKeGQMB5FWSRyabn1GTzNeHQKcWyTjX627fTUG9imIeRztqXmr
         ysyJUh5vYvNrFtb7Jsxrax88ImiHyYya+9yq9bXow7ILYZFwiRmjFMpoUOWIPVlrydr8
         kr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775595403; x=1776200203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRl6Dx6B0mkqFPDqATgvKDi3sD3DOCAUhWOBaLFM7Zk=;
        b=LDnrJ5Y9VVJZsXQi/UXL9/MNOWbWCaQPo21TpY4s2P7qSDYyc3BZN9zz5z8u6fxC54
         N4jhgo/Vc2DbGo/oZSzQ3vKNRIevBiHKrAXe9XMsnjvRvI3aIMM5CI2BsyA4Q/+USA4Z
         o+sCXDGJNmybvuhpfJCkwciskZ9KkVZGaMuV+m5vEUGE8pmqKNxFd4HHaG8XD0zsd4LK
         /cl+a09AWTWGkwqkwOXQo9hzd84H3DKMgZOlg+GZfuKXR1x3kPRep0Pswp/Ikonwc/2d
         Kjxq6AlliOGEgwg3L4LFNJc19mT+MpbgPyUIZGgcoNokWwU34MXRCrv+tr9iXCFwER5n
         scqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbzWk33n41bUZeT+XBtfn5UClX+fB70wBT3/s72nA2qdGjIFE61KcV47bmhf29my5j/9ujJ93fEScgLz19@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcuM7KkBjpunTxnj3AlZDd2AX99EFwNOYgUyqxhhAuH3LJMf2
	zfCCgx937sqVP9/IGLHK4QKWJ2Rm+RfGPdEUdEOUIa9DqyrvGFKNEZe2HPgnjx3iJ8Gyzw96UeX
	n8o/VFAmfuEZiKk4yrDX5WB017e4RVFstco4nu5HYbJtpEHg/oY2v4K0VaLtSOtT0/hxm6Xbrhr
	9w
X-Gm-Gg: AeBDietrYBnhlzZR8BRBUKZGw57MTSVoOw1u8OyhvzO/Ouv35r0Bz35vOKQnBIp95e+
	6IBp9xvp+WVkcjDQjqQRNKCw16qzCZOSrbtyPHDtp+eu8Zvjma1kHUlXb3PYW/edSnHV+htRyIU
	YjpiyeHHIK+lSROalW+VHci6H6TcbjaJgTgZEjeXVK2XULE4HV8zUzsfFp8p+EFp3pOOUQdc62B
	hyolaSsw1TrprQyzuwHdN6D+KmHE4ATfI76IzmEKrg8/EX+yyJJJQmFCo3gz+doCKG3JffrMEjK
	OZT5tRiwnfmcZ2auU6kUlMNSXQ3Jx29afnHuU/4P2+uCLKQ1REqOmxes44b41yqr3QcgiZm3ZHA
	Vk2kmP1TqqpBxfEb2IeiD1bfwEd2y1+kQGyt6nUTVYtd+0A==
X-Received: by 2002:a05:6a00:3e19:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82d0db53f87mr17931234b3a.32.1775595403276;
        Tue, 07 Apr 2026 13:56:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e19:b0:81f:40e5:34c2 with SMTP id d2e1a72fcca58-82d0db53f87mr17931211b3a.32.1775595402754;
        Tue, 07 Apr 2026 13:56:42 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b60199sm16826049b3a.25.2026.04.07.13.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:56:42 -0700 (PDT)
Message-ID: <e069d7f9-e0ff-4908-b438-95689e577e3b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 02:26:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 5/6] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
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
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-5-ce337ca87a9e@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260402-adreno-810-v2-5-ce337ca87a9e@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d56f8c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vOJZ9D2E243KsEiWfycA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5MSBTYWx0ZWRfXwQaPVqK90wYt
 obqfQkOUfi30a/oH/iPB30sPBgcD+uJp8nhyzJdtIRN7Drg3KCEGNj5aMyDwA67cNIsNaLNCarm
 HZGDBadpeQVq7OZ3XwQCYC6Xj0X52ekEvaNpUlRG+BcpxtYldkASXJhkUai2BjF/gVqJ77f5tXX
 T/QUpe5e86Mi5vJiyEERDZE6eEfwAEqOsF1JvW+EUfb85N9Nx/8/WQgTvBpf81v6+2+9nlxfWGQ
 LkOg6JUtDTPWpgWaaOSylLruxfezje7jqrMly60i2TL7Y9ucV5y3FrizjCnAtFdjBmKx9jB7hRd
 v+6FpeKl40ABj3IhG2m6FXDKySgIZkjN95dCZakWq9PPJ+Q+CMgGRQ/i0380dL4dQj2aLeL2Q++
 mQfy+e7KoZxUBtV12ueTapFbS0V2LyMHQSq4fVHrNqIusO2v1EgVvxgHi2nPbjV6NdJ7Lh1y0j4
 PtS4ZH1b0qEggfFd2rQ==
X-Proofpoint-ORIG-GUID: h3NR9YsiEjmpZQ_ekrrgux6iFsXW4QDN
X-Proofpoint-GUID: h3NR9YsiEjmpZQ_ekrrgux6iFsXW4QDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070191
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102236-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BDBBB3B4C10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 271 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>  2 files changed, 276 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 550ff3a9b82e..8a57e6f9cee0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1799,6 +1799,240 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>  };
>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>  
> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
> +	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoid partial waves at VFD */
> +	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> +	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> +	/*
> +	 * BIT(22): Disable PS out of order retire
> +	 * BIT(23): Enable half wave mode and MM instruction src&dst is half precision
> +	 */
> +	{ REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> +	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
> +	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },
> +	{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
> +	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> +	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },
> +	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
> +	{ },
> +};
> +
> +static const u32 a810_protect_regs[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> +	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> +	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> +	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> +	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> +	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> +	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> +	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> +	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> +	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> +	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> +	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> +	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> +	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> +	A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> +	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> +	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> +	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> +	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> +	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> +	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> +	A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> +	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> +	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> +	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> +	A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> +	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> +	A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> +	A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> +	A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> +	/* CP_PROTECT_REG[46, 62] are left untouched! */
> +	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,

This is unnecessary waste of space. Were you trying to align with the
downstream code?


> +	A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> +};
> +DECLARE_ADRENO_PROTECT(a810_protect, 64);

Please add this to the __build_asserts() below.

> +
> +static const uint32_t a810_pwrup_reglist_regs[] = {
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> +	REG_A8XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A8XX_UCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_MODE_CNTL,
> +	REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE,
> +	REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A8XX_UCHE_TRAP_BASE,
> +	REG_A8XX_UCHE_TRAP_BASE + 1,
> +	REG_A8XX_UCHE_CLIENT_PF,
> +	REG_A8XX_VSC_BIN_SIZE,
> +	REG_A8XX_RB_CMP_NC_MODE_CNTL,
> +	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> +	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> +	REG_A7XX_SP_READ_SEL,

 GEN8_UCHE_CCHE_TRAP_BASE_LO
 GEN8_UCHE_CCHE_TRAP_BASE_HI
 GEN8_UCHE_CCHE_WRITE_THRU_BASE_LO
 GEN8_UCHE_CCHE_WRITE_THRU_BASE_HI

We need to include these here.

> +};
> +DECLARE_ADRENO_REGLIST_LIST(a810_pwrup_reglist);
> +
> +static const u32 a810_ifpc_reglist_regs[] = {
> +	REG_A8XX_RBBM_NC_MODE_CNTL,
> +	REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> +	REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A7XX_SP_CHICKEN_BITS_2,
> +	REG_A7XX_SP_CHICKEN_BITS_3,
> +	REG_A6XX_SP_PERFCTR_SHADER_MASK,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_TPL1_DBG_ECO_CNTL,
> +	REG_A6XX_TPL1_DBG_ECO_CNTL1,
> +	REG_A8XX_RBBM_PERFCTR_CNTL,
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> +	REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),

TPL1 registers should be in pwrup_reglist as the latest code.

> +	REG_A8XX_CP_PROTECT_GLOBAL(0),
> +	REG_A8XX_CP_PROTECT_GLOBAL(1),
> +	REG_A8XX_CP_PROTECT_GLOBAL(2),
> +	REG_A8XX_CP_PROTECT_GLOBAL(3),
> +	REG_A8XX_CP_PROTECT_GLOBAL(4),
> +	REG_A8XX_CP_PROTECT_GLOBAL(5),
> +	REG_A8XX_CP_PROTECT_GLOBAL(6),
> +	REG_A8XX_CP_PROTECT_GLOBAL(7),
> +	REG_A8XX_CP_PROTECT_GLOBAL(8),
> +	REG_A8XX_CP_PROTECT_GLOBAL(9),
> +	REG_A8XX_CP_PROTECT_GLOBAL(10),
> +	REG_A8XX_CP_PROTECT_GLOBAL(11),
> +	REG_A8XX_CP_PROTECT_GLOBAL(12),
> +	REG_A8XX_CP_PROTECT_GLOBAL(13),
> +	REG_A8XX_CP_PROTECT_GLOBAL(14),
> +	REG_A8XX_CP_PROTECT_GLOBAL(15),
> +	REG_A8XX_CP_PROTECT_GLOBAL(16),
> +	REG_A8XX_CP_PROTECT_GLOBAL(17),
> +	REG_A8XX_CP_PROTECT_GLOBAL(18),
> +	REG_A8XX_CP_PROTECT_GLOBAL(19),
> +	REG_A8XX_CP_PROTECT_GLOBAL(20),
> +	REG_A8XX_CP_PROTECT_GLOBAL(21),
> +	REG_A8XX_CP_PROTECT_GLOBAL(22),
> +	REG_A8XX_CP_PROTECT_GLOBAL(23),
> +	REG_A8XX_CP_PROTECT_GLOBAL(24),
> +	REG_A8XX_CP_PROTECT_GLOBAL(25),
> +	REG_A8XX_CP_PROTECT_GLOBAL(26),
> +	REG_A8XX_CP_PROTECT_GLOBAL(27),
> +	REG_A8XX_CP_PROTECT_GLOBAL(28),
> +	REG_A8XX_CP_PROTECT_GLOBAL(29),
> +	REG_A8XX_CP_PROTECT_GLOBAL(30),
> +	REG_A8XX_CP_PROTECT_GLOBAL(31),
> +	REG_A8XX_CP_PROTECT_GLOBAL(32),
> +	REG_A8XX_CP_PROTECT_GLOBAL(33),
> +	REG_A8XX_CP_PROTECT_GLOBAL(34),
> +	REG_A8XX_CP_PROTECT_GLOBAL(35),
> +	REG_A8XX_CP_PROTECT_GLOBAL(36),
> +	REG_A8XX_CP_PROTECT_GLOBAL(37),
> +	REG_A8XX_CP_PROTECT_GLOBAL(38),
> +	REG_A8XX_CP_PROTECT_GLOBAL(39),
> +	REG_A8XX_CP_PROTECT_GLOBAL(40),
> +	REG_A8XX_CP_PROTECT_GLOBAL(41),
> +	REG_A8XX_CP_PROTECT_GLOBAL(42),
> +	REG_A8XX_CP_PROTECT_GLOBAL(43),
> +	REG_A8XX_CP_PROTECT_GLOBAL(44),
> +	REG_A8XX_CP_PROTECT_GLOBAL(45),
> +	REG_A8XX_CP_PROTECT_GLOBAL(63),

nit: Better to include all protect registers here.

-Akhil

> +};
> +DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
> +
> +static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] = {
> +	{ REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> +	{ REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIPE_BR) },
> +	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> +	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> +};
> +DECLARE_ADRENO_REGLIST_PIPE_LIST(a810_dyn_pwrup_reglist);
> +
>  static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>  	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
>  	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
> @@ -2193,6 +2427,43 @@ static const struct adreno_info a8xx_gpus[] = {
>  			{ 252, 2 },
>  			{ 221, 3 },
>  		),
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x44010000),
> +		.family = ADRENO_8XX_GEN1,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen80300_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen80300_gmu.bin",
> +		},
> +		.gmem = SZ_512K + SZ_64K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			  ADRENO_QUIRK_HAS_HW_APRIV |
> +			  ADRENO_QUIRK_PREEMPTION |
> +			  ADRENO_QUIRK_IFPC,
> +		.funcs = &a8xx_gpu_funcs,
> +		.zapfw = "gen80300_zap.mbn",
> +		.a6xx = &(const struct a6xx_info) {
> +			.protect = &a810_protect,
> +			.nonctxt_reglist = a810_nonctxt_regs,
> +			.pwrup_reglist = &a810_pwrup_reglist,
> +			.dyn_pwrup_reglist = &a810_dyn_pwrup_reglist,
> +			.ifpc_reglist = &a810_ifpc_reglist,
> +			.gbif_cx = a840_gbif,
> +			.max_slices = 1,
> +			.gmu_chipid = 0x8030000,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(2),
> +					.perfmode_bw = 10687500,
> +				},
> +				{ /* sentinel */ },
> +			},
> +		},
> +		.preempt_record_size = 4558 * SZ_1K,
>  	}
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c0ee544ce257..d474d88b9152 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -596,6 +596,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
>  	return gpu->info->family >= ADRENO_8XX_GEN1;
>  }
>  
> +static inline int adreno_is_a810(struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x44010000;
> +}
> +
>  static inline int adreno_is_x285(struct adreno_gpu *gpu)
>  {
>  	return gpu->info->chip_ids[0] == 0x44070001;
> 


