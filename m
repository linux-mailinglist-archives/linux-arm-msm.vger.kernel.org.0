Return-Path: <linux-arm-msm+bounces-107447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDdhMrHMBGrMPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB8539A36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 022F1309A91E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BAB3B3BE3;
	Wed, 13 May 2026 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUD614Ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ABY9VPzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704C3B1EC7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698598; cv=none; b=kwrYEb4e3ST6uvxpPFbSgCxZrRAcpxbisVJrKUfzJWZMQB/LeCVotySkzp0K88Mm/e77cjewXqRlP2hZUUcXLYZtkanHoYzQrUZ+rYDCoY4bFK9URXNrK7ktHPgsALH3WaOtC3v/HbhXvKbr8DtxpddxWl2mag9arkjg33ld+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698598; c=relaxed/simple;
	bh=hFLqiwQGF1R6ajr1d6+OOUFn4qtUxdIU5qZeI5bc3Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amQA8JrNI9pHB2xCpbTXgW9LpCaQxHhpq2Tezk129ahtBtW23mhXHPOi6l7VZdxb01bl+6nSMiRiKOJTtT83zEut+17YviImUY8+4jZHUH5JHzcgVV1pD6qlcMhoN5KRSR3WGlbePV4z6CwPitOdyMAZqHerVoMnMbs1C1v01Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUD614Ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ABY9VPzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DH4CaU3430137
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y+b5KahouhbwAIhBboZSol26
	da2D8dxI3ira6HX/6q0=; b=bUD614IkbDSuQUd17+BNBVn4XCudpG6IPe+ltoQx
	DHjsycoZi/LZyPNrXK67kUAQJkmtQYpe80gDgB3AYLxSLrm89G42MyI4U+wi7elG
	EbrriJIVx+5QLhl+pYglAU9mm61KakQYrcHnmJt9+EYKXoNrwDTBqzGQ9Fe3sTxR
	lYp8VDo9xc6yexhuqMFocRfxIYyL9b2Nj74Uu6iHctEAKYzL8q1tk1hxVDdONUui
	G6N3uMFm+P2Wcfc/bJmm0YGGL26/lXTw3G3lNRpeyVxREQRf9/cOyuyJeOJ6dby2
	WO4bvMRaXdIH9BomZ0103EtP77FVyEDcPWyj2TfZrYqzGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcj1mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:56:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso18424461cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698596; x=1779303396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+b5KahouhbwAIhBboZSol26da2D8dxI3ira6HX/6q0=;
        b=ABY9VPzZzzjdhzamS2f+elxopA1WqX8ckB1eRNCutgBLnhnUdsOaIo8cYTg1h/P0PT
         mjgKCFBwlILRhxsQRmgQ8WDz40VH2oEQGbkCwSu1GACU0ZSaKwHfV1ZyiBfZF8lILWpL
         wrbWHaa4RasNPIYfhoYbeeSzIwTMAgvGyffu7EMQCb8vTcROZgIIP4sTdgXIzY/OB5Wo
         bSosssLJ6TCfsgGPfxBSqdpPbt58sV63r9jF8NzBsS+HPmYhwyBqyRYf3gK58pItePRr
         UDPcxT70V/oz26k7EQ0har5n59J3grQxuP8E2PEAVzLBc8vyuz0M0e5osxCKT7BHZRH9
         Ty+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698596; x=1779303396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+b5KahouhbwAIhBboZSol26da2D8dxI3ira6HX/6q0=;
        b=a2BXB3GLSgv57S9BykD2tzyoFx5rEAydjDQQCM359YfsOXvhxdJS4u9z2Fxl4TUh2b
         pliTN6UcKBm71tbhQKivvGXgWBbBfBqMcHhxYoskeM198eQRupMGT16khrHV1IvZ0zsX
         pM/dHpJgMo/K32kTudInNQSdq1LCX1ZfyJgCisItF2zsTn9dlGCF4WczWfCR6HCQkQw9
         nU8BbMqLH+3OnefsxK4FFt/PHjIjIeQBWt/I/N+BkGHkVFXArKXSoexeQK/Gz4BuSpnl
         c9cBPXk7svO6hBDLPhE4UcpgWdDE8zwaarIjJEYSA/loqMfFDCJC4//ES4QHHp6tVhlD
         tsaA==
X-Forwarded-Encrypted: i=1; AFNElJ/a6R0Fh0ASJm67qStK/Zr8LOPcFOw8g7g5Ith1y4UxzxuGmbQW7o0UXK+HFgRg8vRSQ4f3Tlsgj6g5R1Vn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3YtaXahGseXObfNLPrOqvOD8gdh1aDaO/7HNdip28O07BBMlY
	aeONIMslBAjTQ1p0xsDVzSK7RqAfTJYZ3PGXxgo0kcK6NqzuYaoufRWlfShT4lqAnY2X2jeoloJ
	qfjEYwgGoLGoDrPryQ2khJ6ai7YyKfr87EJkOYo2F15GSuvo51+nPND/91NsO1+RdFSB1
X-Gm-Gg: Acq92OFrZB/QtForluQsALamTls+1ZqOeEDv/cpa1GF6N/HUCW/a0wpcACiu4V49N7n
	W5ERK1s/oUOsQuYk0cSb0MVmVFkTNgfOu19nEYwyPqJArVXSsOyrzHpj9cXXKvRObMZdiftl/HK
	Ox+L8fe88TD4ziGxG64bhALt1sFIZjKAfPmLLLGThiSU4rRCRfHW0OsWlXTTxAN7ZhHW79vzUjr
	B/s59vTQUhZk6V1PEu25aTT9Mv/4rlS4qkEcI3DQfRIKwyHp+hDXyGS+YhHVBWY0yqlktSuNNpo
	/EpZ36iz9GSUguiqVLJk2vfMT3vBkI3gXY+vdTYdGtzmvcxN+3+GZgDC4YqkF9OVxs/z+7jwR42
	IRm7kOapURosEYYLEDgM6vszpjGB2vLuP+HFnXRoU1faDgamIg5d14FR/kCigBoGjm52uUw7U74
	MZPLuhvY/+YJTulnZjmaQvXz+EvxKMM3tmVU4=
X-Received: by 2002:ac8:57cf:0:b0:50b:29a6:8696 with SMTP id d75a77b69052e-5162fdd2f26mr62626121cf.7.1778698595705;
        Wed, 13 May 2026 11:56:35 -0700 (PDT)
X-Received: by 2002:ac8:57cf:0:b0:50b:29a6:8696 with SMTP id d75a77b69052e-5162fdd2f26mr62625361cf.7.1778698595001;
        Wed, 13 May 2026 11:56:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb4d422sm447201fa.40.2026.05.13.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:56:32 -0700 (PDT)
Date: Wed, 13 May 2026 21:56:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 08/16] drm/msm/a6xx: Add yield & flush helper
Message-ID: <mdls5yrexjfe4x44r723lpe7noawco7i32xf6ruopnlvsnpmgj@eiwghjos4trt>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
 <20260511130017.96867-9-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511130017.96867-9-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: H2lY4_F7QiO_E5WqeE1uZAIG8Q2tU8z8
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04c964 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=w45FyVj_P0zaBx9YAu0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfXzQscxDFwYG8t
 UNR3Yb5ui+vk2Eg4Me125qqPwVhEsCqPoiTQ7BQwjhm5a6cNeDL3a0ZQsBhp2YGVHjA4eJ7XDCS
 XKTbphApVs2uTWf1MQooIWn738RYP4fYfG3Wh6BQAASGe8ryLUpLjyYp63kMAQUNfqzkrDpxhpO
 a+9z+TUjO3cgJWeFdCfL4PFxrjtyqWGAzmOIH1XFiKsNdWk/cexV5uHPCiRohWT50R0sqlcAWyz
 bBSL3Z1mfOfLDAoqocgFXmuYpKMvIqQvFOM7IbvfeJsbh+9sZAJOQIQU5ifiLHRLu8E0ok9yo8/
 iOblX9qpkl+o7WxJj6b24+FjO9h53KoktLjWwBD84Qzbejx5s480tueqjmK8FdL0OXePHWdSvn0
 JCJXL0/72vxGAxXrIq7E/Wq3jCKDuRCpkPdmL2jO4amMT0M65cQ8SfRPzy2mfaUhdSyTBZE1PFj
 MEd11ptS47/J2DQxssA==
X-Proofpoint-ORIG-GUID: H2lY4_F7QiO_E5WqeE1uZAIG8Q2tU8z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130187
X-Rspamd-Queue-Id: D0DB8539A36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107447-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 05:59:21AM -0700, Rob Clark wrote:
> It's a common pattern, needing to insert a yield packet before flushing
> the rb.  And we'll need this once again for configuring perfcntr SEL
> regs.  So add a helper.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 +++++++++++++--------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 +----
>  3 files changed, 28 insertions(+), 38 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

