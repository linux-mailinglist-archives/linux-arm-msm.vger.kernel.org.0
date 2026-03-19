Return-Path: <linux-arm-msm+bounces-98614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF4tO+x5u2m2kgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:22:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E62C5DD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFFAF302B23B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6849034DCCA;
	Thu, 19 Mar 2026 04:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNIuyGEx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YD78Pz4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111B32863D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894122; cv=none; b=C2T/5s+BBtn1rergF9rNXu8wfHnSgDjyeCIDsj/bz9WX3AoDiTrkae9flSSBGTL1W+zf+Rvo8Hj9YJLpFfgAjBUnkfizloWZzwqwElNzETa4CwmQy8McwzTJ72HfK23tEZB68Wqc4BM7p6iWBDexnBJdw4GBrfhCPImlQzqxVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894122; c=relaxed/simple;
	bh=eQDhZ8cNMRA/PjD4JXh2dD07JIPTk6ZmwkDsx48VvSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEyCqlrCVwih/b5o9e5YLDofwqbD2Fu5zUHky+lGrog1Lt35ZD+v6aVFtQ0oqpwBKfMGH/nX46aOybeQpfKP7DIBBNmeDsAYS0kb+7jiZJI+djuky2+dyQaW3eH5MkToQJKbRYCRgoVmKvvuQI8CEwYUva4qy6ngGMbJ7JIngD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNIuyGEx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YD78Pz4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J3K4C22067034
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTMWTpUdri2zIVu/+9L5yItV
	x8lusEUECdAO46qVzu4=; b=mNIuyGExJOJFPFgngx7rbgM4SQEzza2chrTLOy0K
	bOd1+vOYZY2G5J5FVIxlGCs/W1nTV8WqLGPNxdz9Xt1BhhHybqfmQQJhQLqhLL2S
	rIxIKoIbbrEvtuTeIV6xJwxQXb5Pv50iYaBEwRQ+xlcuf7oDimw4u3Kwc+GOhAts
	ZGoy0y/Q0pUXt1AdOU3nVnqct89ZiU3+damYnfjF78Mjub0UeHwnAF+Zp1euwRf/
	NILUL+nJza2vHY3y8C0Iyu+xW3DyOPRSi8yH/G8gPbbBIqJjBw6s9sVEeei+DywK
	utYxKEQl3PxNtteCLetZP4ziFJh3j5pp21mk2jH6Uq27Lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0957r4u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:21:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so10005941cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773894118; x=1774498918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iTMWTpUdri2zIVu/+9L5yItVx8lusEUECdAO46qVzu4=;
        b=YD78Pz4AQizmeo54C9bGZ1P2lUFKKybiGbrQMh1y59hyN8evGR25qe5g1gytrJrlss
         IFYt/Cq1bp51LOG6CmscZtW146ozPgCqP64OefHSAz3bI73Ga64P3yA6Ox4h3UGaHsGE
         mu2xUJMl8WMV6fz8t8joW2SRYdI+h3OQsIdTJIdj1bfbrkb3Icvm2wPfayNe+w081mHk
         Kye62NCvU521z1a+XTjBBu2dZt8L6xT7DTCA8/H7ImwqVjSR0p0BP0hYg9S5nZVt/tZN
         jLhvvvo10E/NMQKniCW8Xrb6s5w07aAluWeeAyLaOx0vX02lpmq09mnqnEdLD4m8AWK8
         yVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773894118; x=1774498918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTMWTpUdri2zIVu/+9L5yItVx8lusEUECdAO46qVzu4=;
        b=Ti1gDlot8rlgnCrXAi1NOy82qEaSMg76X7eBcHeU/E9DG1ntJsaOiQcV5Okj/C0+BU
         kTtVCFiD+nnYk7pEqNUzTxdaMgfWvgyjgdr8vnpn8TgJ+H+I3/K9daFeAYdU8ffhNVfb
         DuL89G7NclnGDjRPHtb5zrvEmDW0NVQ2OKdyB9yjmh6Vjq9LBeVYDpoLQSSwX4fMzl54
         A08jRaVsavQ+Ee1LQV+Y9Rh1lx03f/mcWoGr9Uz5I1ZLL/HWF6ZFNMHQuSGUj/eHXiEW
         JJgTFjQk1PZWWd1xJYPSf3p5mXl1AAKkU/HN45hJHsGK+8uJqhNTQaFmaGiLojGCFTCO
         s4hw==
X-Forwarded-Encrypted: i=1; AJvYcCXJCGf2R9vjxHjKAG+PoYvAImUl0v/S1IscCmAzN4I/JX1AWbnDxa6xnhpn+FalhmJGK2qbhLL1TO6ssaQn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZzBJ01wQV3BAfySFqgCf0Ef9rQFu2mhHjsTv37NM6z4NaNpB
	cLjtlHO+cE66Jm0SV89pSmmfWMy4gQXExoIWHj1EXy1etVQ7Ki2AdzQZO3yr5JwlUXfS96HUBUo
	njzEeAOij/gnsqBGI2eOKTfzHXwTEII4CTHVeXev/BXVaWYFm2B+cNVBgzwNwgsyD4TTR
X-Gm-Gg: ATEYQzzK72JPkSaK9zFD5AWOmtkvHFv9qT8xjabY4xqC5IQfS1M+fP/z6OCVxuruiNy
	+dTWVgMM+9jjQKdadEox12aZxNtciHDoy2AHzjIc5ulOI2hL4dVOZl8I8hj9wJnO5VAvAjS0yHn
	XV+OG3YzacpQ5a02OtJLmLHFU1PJHt7cP1clL+f+xpALPiHhj632QE4VtNlicduZO1V2Qeepik9
	VwVKo96XG06R3tuXQJzLLMH/HiEYcQOw/jX2vkI3725SgbV+MP9SAQObVMD9DOjsTljooJBCY9t
	UNUaGdr3vdBu9GhagMIL3De/547nV0sDOMW8DaO4AYIYvRGtrAZjrP1Pz4bQpiK7jJsC57xx/zu
	p5q8NaoaU16r1x1rULWM7Cj9rnok1wJOlqoZ0otZBNchgT7NsVl6o5UcrFecq8RNnSUxhqdCdpN
	2/EqZtwIIvnHAI3Os+4r4g6VFqQys/CW1nhPE=
X-Received: by 2002:a05:622a:547:b0:509:764:2f03 with SMTP id d75a77b69052e-50b148585a5mr74315031cf.37.1773894118406;
        Wed, 18 Mar 2026 21:21:58 -0700 (PDT)
X-Received: by 2002:a05:622a:547:b0:509:764:2f03 with SMTP id d75a77b69052e-50b148585a5mr74314791cf.37.1773894117868;
        Wed, 18 Mar 2026 21:21:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c27346sm934721e87.16.2026.03.18.21.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 21:21:55 -0700 (PDT)
Date: Thu, 19 Mar 2026 06:21:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Add support for RGB101010 pixel
 format
Message-ID: <5zfn5cs5atdgiv5nztxc6d5f4dcbqqrpdiafnns62m3mzwh7vk@ga4mb7oo3fmz>
References: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
 <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-rgb101010-support-v2-2-698b7612eaeb@pm.me>
X-Proofpoint-ORIG-GUID: VM4TvQ1hMm-DRk3gZq7A3I8DCzY0Rru-
X-Proofpoint-GUID: VM4TvQ1hMm-DRk3gZq7A3I8DCzY0Rru-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzMSBTYWx0ZWRfX+ZbBDpKia7tA
 q24sOmcoIGW8b73Adm5xDRWqRTsrId/T1QSTj44L88kAqconmTf8/DM3yA0zUx1QVT2ruDFBh4a
 zpYtwelnBE+SOQe92PFk82e5W96onhyAp9/+khZOgMS/5Hu/44FQwvXxZz4abjpqHgEAbDwHzrc
 OTSnECNtkA/MOweuxvfjDg9gN8nrQJeVQD9tYhBfU6tFyZgNhVHmzgcErlQ8qoUti8IPHE16qv7
 We7ttuHpDfTy4mwCV/60ppgn82lAz9snOkRJZd80UjV8fdP6hvyW41VisCg352ED8dz+vyEiAcJ
 Jil8O38LC2squnTHiLbg8I0xYgkVro0E8clDglYd40JIDhZ6yvFoeZW2q6CDPJGGi1XiuRZB/Qr
 k6q5BFeFc5xgvJn1TfK2kdMXMpm89ZjHQUkxDPl9T0jSNXl91CN86cQEPCH3OKMjQos0JsIyOqr
 gwlCHDCy9WA33Kx2eKw==
X-Authority-Analysis: v=2.4 cv=RZedyltv c=1 sm=1 tr=0 ts=69bb79e7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=dHkJIz5KlUVh9OC2PNkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190031
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98614-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D8E62C5DD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:00:05AM +0000, Alexander Koskovich wrote:
> Add video and command mode destination format mappings for RGB101010,
> and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
> the new format value.
> 
> Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
> older does not support this.
> 
> Required for 10 bit panels such as the BOE BF068MWM-TD0.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 8 ++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c            | 9 +++++++++
>  drivers/gpu/drm/msm/registers/display/dsi.xml | 5 ++++-
>  4 files changed, 22 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

