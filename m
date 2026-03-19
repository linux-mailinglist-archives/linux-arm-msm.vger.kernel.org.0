Return-Path: <linux-arm-msm+bounces-98809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOb9GXlFvGlTwQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C622D152C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B289C3014C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 18:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492523112A5;
	Thu, 19 Mar 2026 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5q3qQUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2bh8o8p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194022F8BD3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946228; cv=none; b=Sn6VzPZeEAvPShuNv/3o7ImxUhi/oONOg6wqg/4aJJCmaSN1d0kJIx+g5BbNcwoi13bU3kjZ7JU8lRG39vRNjoN92CFCyYytiHAtzLQVRxM3bFSQPI0uHwbRfqn5PnrXxJtjjp6L6ZQtRGRFehpdCsWwspCV58nM/AAS90l9fVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946228; c=relaxed/simple;
	bh=5OzQOqXv+Y85Y4NR3yax5n6Qag/ymjfhT+VfUzYgKLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCEk+JAUc4BeVbrrM+2mW8Q8b2rRhfPlhHTDza3JKj4RIKpHXIS5QxVC1N+FhIFQGzS/ZRIVvgcljQ6Co3f/wzI+Ym9UPa1P32dzwbD2jGzNPsty6aMpd6OsdRWc5hZTjrQjGQf6nuOpKahzDY3kW/ChSP1UjDipiKdWSMVpoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5q3qQUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2bh8o8p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JFfQE01898554
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IcWtP11DQrOj4IlqS7tGJSlp
	8VMgZRHhYrfiJyDbgxA=; b=o5q3qQUXWzf1G/8tMkd6uN9y7e+z8KbANEpew+Zk
	4URjBiLpJsX9WG44M/Dy+ICofbn8rTJ8ZGhXsMfOKJZ4vl+HuFDWk6S9SGfO1oVE
	X+y+5lUv18ERX7NgXlCDEDsj9+OJO8o0R3hBlqDioY9vfHFoKhau/s3vpocgBPQJ
	gt14CWjDWmzIhkekqKRl5a3l2u871f9/FO+B54ahYHUvoAG5VkNUjp1iVnCZuoV7
	pL88A9XrRCzajwG0Ao+znQ/eaV4Vur+wauBZ/kZobLuH4lcRAHnKWfq+mBdHVMtm
	+63bXuc6YpnK8FQEYssrLqeDFIHx0vl/DgLZ2pcEICBOeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhgcnu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 18:50:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509159f57e0so90672241cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773946225; x=1774551025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IcWtP11DQrOj4IlqS7tGJSlp8VMgZRHhYrfiJyDbgxA=;
        b=E2bh8o8pjlQli23fkrA0V6y8Akj2F8C7nAfKzO0n7r6qQwGxBbQXIHMv1+CQvv3yGG
         neFub3kVo6DJZaQ8Qs1ivrHLipgpoKxF+muUkKFQ1gwcPkqHIsAZGLvVcXwwIO5ChV96
         eN6wQuCVbpF0Mgyumk9gDZ8Dj1sjsHXr75tSfOzjnJNfF9ePcp0i9JjrBv3mKR3OMynN
         QwS49m5cwrMxCDRFvuXdXMxfAoaa7J0mbWC//gYx710dkhF90cw7eTVKEFVy0QgHFeuK
         QnAkc/V/NuSYZQc7EDwQ0jYNgmKipEcKEZalCOB+XzodLCtnY9unIkG9APiD5K+kcUvv
         QVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946225; x=1774551025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcWtP11DQrOj4IlqS7tGJSlp8VMgZRHhYrfiJyDbgxA=;
        b=i2xifVyWGyY86yRIJ9Gifam0LFlZMoRKaCxqNewlHwyOGqmUVdYUtkwWr11Kn1eubl
         BN/0h0n184Kh0n2Sea9iaCIiFQGEjrDR19/lHJevFizGr1Hm7D3ABWM6c1DVcox73ldw
         ghhM2DINA+7a9Lz2SbmXd51aX9vVB6QlboelC7eWfLM+R1CwA2WsDzWq6wICb51NZPJ2
         W5OZZ34hpevGyq6Bh1hABKEoGFzkxSLWTTtWR9y7SHLay84HsQ/fOAQA16vFoKSnZ0dG
         z7dSHqM3LFe1UJf26jpm9oSUz9tqq37HWR165IIwF37RZsrSStEBlNW1a+jQoEn1ghXy
         RAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxNwGeFzAuq8nzB5y2ls44NqfWRq9cJEGsNCUqyr19eh9UmWFaHj2QsK2/tR+TtaLKF5fSFjhhcypG+wot@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3SHJMCXMH+/+/lsUepvp6lFsBVwFJLrkEEehuoVWnnQcfKy1D
	O34kdXN9Tl3vKBUiWwtLWY/esFAO3Dg0/6ReZsVhUNcDOzHd4ljPsblMGMeTZSfP2evQNgUbuWE
	u779pi8SBs8rhqtl5lYotFB/Qh8oRhNCoF9tc9CqC40wzBDfMW9Da/6aZwflHnzpZRVOz
X-Gm-Gg: ATEYQzzuSrBW+PVTDVEJ55T+/P8rqMTF6AtAKMHE5Lf4zQ1YogjYlxnwae0kR79I8nV
	A1oQwxNmBWBqQQjadXojjqFjIxDDbHHtmm7ef+cQGX1V+X5jfQTeOs8vBnyzhbMEQhJJVHUnR6g
	+Qi3Q21xtPwH7HXBbRs/Oy7/AHa2DhNzgNKSVlmCLqLfDzXXyoTCaXZaf18K+mZCZ594vtZZKG6
	/TLXqNHEsYDI2nTHpRW3blifqpCQ0D8JeRK0fh0OulAKe6/xJjp3ObuICtMkBhGyVKt0wzViG+l
	5mNz9VmWWzNpd4ZRVgvcGxiNbdK91rb/LNDSrCRL499eaYz6pQKYJDxUtqwAa/d3C3yrnWQsr3J
	RfhVPMkep0zu7sAETgTwBbGJQ6FzJFkCIgjV74QdYLrDdnmT1Q+zehu8+iy8/a45+y5oi0UcHFa
	koiupE25U94/PoFl5IGuvRDHDHcLT+W0iJTi8=
X-Received: by 2002:a05:622a:118e:b0:509:3fc5:a847 with SMTP id d75a77b69052e-50b3738ea69mr4835001cf.12.1773946225023;
        Thu, 19 Mar 2026 11:50:25 -0700 (PDT)
X-Received: by 2002:a05:622a:118e:b0:509:3fc5:a847 with SMTP id d75a77b69052e-50b3738ea69mr4834371cf.12.1773946224409;
        Thu, 19 Mar 2026 11:50:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851adeeasm73398e87.35.2026.03.19.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:50:23 -0700 (PDT)
Date: Thu, 19 Mar 2026 20:50:21 +0200
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
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 1/4] drm/msm/dsi: rename MSM8998 DSI version from
 V2_2_0 to V2_0_0
Message-ID: <hzcf4tu32linqxpk7aq74ujt4hbvevh4pjxlfvi5r3l7ngbaxq@gjor4kflqipf>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-1-85b99df2d090@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dsi-rgb101010-support-v3-1-85b99df2d090@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE1MSBTYWx0ZWRfXzThIiqjWoWdz
 AkC8LebD9DNG3r/Mxf1/UxQWIKQKmicZN3hWY1sPQ6S07PfkIB+g55oWHMPwiK40mt5bhF9amdP
 T25zKrJfu4AIyq3kQeACj9nkMkFbPH3BKnRYGcdqyPn34Vv6gWLfAvyzDvlETX4LWzvt0zef6in
 kHZesOcWmq128lSm/cc87ueC1oDyvd4E4HMkhPJf/5idlFgUlsF8io5pLd4GOh1Gs0OYtDjCtlV
 kmjgfgvHs4PC9a8lpdGndIZBdVIvnkZr2VEkam7ZQk4USsUhELzSUZe3exWypJ0BnKbB0nLm0QN
 CrvOfMHEsix24m8Spz2gv1p5296yOsVVLUBwyfjNtIklyxuisZU1S5SyHfmPmKlR06y2z0b/5ed
 8pxPeHdQzfoPVi/9rgPk1QEF5bg2B/xn3HqNWMdFnKd+nw0vJOOBhLSsN3TyB9VRZgV7yc7Fcxa
 m5wSwdBLgB5zOyrUvmA==
X-Proofpoint-ORIG-GUID: wn2MjAqhz79hPx1a5jVaNVGA0tMwau7v
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bc4572 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LOFc8Sdq0yBhcMBbFKQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wn2MjAqhz79hPx1a5jVaNVGA0tMwau7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98809-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pm.me:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8C622D152C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:57:47AM +0000, Alexander Koskovich wrote:
> The MSM8998 DSI controller is v2.0.0 as stated in commit 7b8c9e203039
> ("drm/msm/dsi: Add support for MSM8998 DSI controller"). The value was
> always correct just the name was wrong.
> 
> Rename and reorder to maintain version sorting.
> 
> Fixes: 7b8c9e203039 ("drm/msm/dsi: Add support for MSM8998 DSI controller")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

