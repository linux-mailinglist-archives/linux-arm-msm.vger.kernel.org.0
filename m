Return-Path: <linux-arm-msm+bounces-88136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0DD060BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 21:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F1E300E7AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 20:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2DF32ED46;
	Thu,  8 Jan 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh4WF1uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPtL4buM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F61932ED2C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767904024; cv=none; b=TtjCnXV/gsv9lOgDrME+2pQ0x7Qn2iRAxGBjdR8354APbCrfN/8RH5g7ZRklbiSVpM+ugw/gybV99k3L4Geqg3MS2jrwRLJFQIwvBrwjZ5m2ap8h+Lh5buii9gzGOwnFKvkE0KUXLqAEHsscHEFTOFavC9CHga1BrXm8wOVZfsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767904024; c=relaxed/simple;
	bh=28I6pMwa0y2iwSMPZ7ds42u0EHyroiLLjy5sqlMkZNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tY2hmRtp525cZJ7kYF0hdzQDMYeaDPv8/roAgUwZE/WDTjC/PbCrmkWMBCHS/2biVm/5p/VBRwIAwfe0/ZMq2PCdb6f09CUbXPOvuXuzBNWszcay9JmqI6OpCRSYm1yeW66IdWf0gbZ6F5bp2qJwQMJeJDhjkiJJ+ODz4gzerDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh4WF1uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPtL4buM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HkIG42320277
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JlZNx8uv9gR3y5zJqqbeRWF7
	zesbHySQ90ufr4l+JAg=; b=nh4WF1uJgplh2QVC5Fme2/O59F2XyZvb5Jl/DItk
	ryFu8mxvJ9boOg4nDhgOhRKSLvjZ/vN7PNRo15g2desaHU9sCOYWOeMLPP8azP5N
	ONS31DqUZcPy7P02VoB2nc6rHoWKr2q4IYDFWUU7ACSt0vxJG+OwSxYmdkSFFWM8
	Rd9b4rNI3+2Bg+VY2ZUmIIZeO+qPxevNTxJyve6w2W6ZEQjYLHQNnwwcgnSM//G4
	hjcu/HYqtKMlg9eLMcGqGUayItcI8+MTXYZ/HmdsnLRZB1K5QTFIJaZCdL1x8ouE
	bf42SWCeiFT3T3XVs4FZ6QNaaDrZOvX807+AfO9ls+zoMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8kfxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so459417385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767904021; x=1768508821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
        b=FPtL4buMBB4aSrdFBWikNcJs/KuZuKfKh6grL12AEjqfW+g95NBLwVvBXUJeAa6hsm
         nD6GLwPWUEVEDTnsTUQrISfh0nF/28BFrcampwkT1K4rg3DvDFKr6Ql8o9ESDY+fNAV0
         2uNS3I2vDmPdia6/GFeUfC5Fmc0NVLnM/FpxPz20A26du0MHedAMur6by8lna+sarQh2
         +xzohPAe38EpdJ23nOvba/nOLPcDXDkKzs85eY9/HEaHOM01qeTRN3g+zK0msuBtMSdO
         2KdhmCYwZfcTdENtjO5+xT9GoDq4mIXptXCm57VoHSOqhCEte2UWc1plh6x56J07YRDT
         IQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904021; x=1768508821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
        b=DwkJ8fO2yK4WVK26UZSQ4NlEmFuCHGZuMHXvXQMlA8hLaqnbpu16bjLvyGsTahQEZt
         Of3X7Ueo0RPtl8CALj8zx2kP1LpfYuGD/pMOOVev/pf1MXHpOmmvw+UDeMQ8lHCKtcs2
         itNmp7LFip2o07+hCHPWYsfQesDqVxZ9Ao3SprSEfuI2XOIzQYt7JxX5YObY3fdDfZ4j
         v+SBtUWBQ1CFo/XGFPPGAYHnDO4JjpH5cUSexnIY2TDbO3W82pKLXHkVYS8UScqvJXB0
         Z9m5CZjFJMwNFtExLTDZYC/8Wqluly8rSfMTHIq1BLqySvlxqHnHdrF70i8J0t5kHH4i
         M/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FwgssRsFi25EqragWIFKmfTC4prWnP8VVtYVbp6i2o9YJRjYEB0k4+lhhkOGFiYbFMK9ljlCiVIuWNou@vger.kernel.org
X-Gm-Message-State: AOJu0YyMHSKdEcIzsZucAqP3loE3324LOG+5AuqUVX7auEJ4O0WxwB25
	iCQFdZNT8q0le12kPzYIEVQMBsGnMDB390uHLi1SqRSd4+K80Ygd8b0zlo0QldCQLPEZ1Sdl45T
	nLySUKHAkqEOpuxlcNDAW6hq6R99eKl/SKzvTHGgOi/68tvxisOuVhB8epZgw8NZtyc7Z
X-Gm-Gg: AY/fxX6iJeoAqTGKfd0J6oSFoCvm49VI4VCKNf2U5UJuSHdfHrViuo+D6/WaPMiPZ2R
	lLCbfCVutUW/Y5KOjlfDfBxkB9NZrBMH7fX2ISDDQRHtSEx0DaXjMK2wPueXn61rSlbNnpjrNR5
	t+7kpiNnB3PbVGx/OZVpGLJD2Hj5JZ0TbI2tO48mwg9ir0es7HedjDv/cFlTSwpIUr/lbXxOkJN
	CyKnkw/hZmmetYX6KJFQtQblquqzu1rYvMZsvKmqrjFiwD9Eim4BnBlW4T9xg2SfQ3QFXH/vOhg
	qnKQvJEqAURS+piW/Jo+6J3BXrl0L08j3muyKsyAfQXKGL+SXOWxdIscma0cmSMgx7G/Q0AFbm7
	ywLNHVPM8XcAFSKK8LQcoaUnYvNM6byp+YgicqpDYDh8QdNdDdkfUJQNxIw88vrFEsk1Kq/8MfT
	3AxaSfylqu0DlRTN58GEHaHH0=
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr1046211685a.32.1767904020631;
        Thu, 08 Jan 2026 12:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+tGcr9iEka9GeEGlKoDUMtAGlIhxtlSoeNxoSYJowpomJjo9Qx3ZXWW6eqP1k6Up9bwnB6g==
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr1046207485a.32.1767904020120;
        Thu, 08 Jan 2026 12:27:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eb22sm1324479e87.41.2026.01.08.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:26:59 -0800 (PST)
Date: Thu, 8 Jan 2026 22:26:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Message-ID: <tl4a27hxop6avr25bimieet4zcoy35lvmt6rmqe74wdg6si4lk@vlm4osda5y53>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=69601315 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5j6SfgzwYxDfwc0PMj0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AxWMNKoLQEvAcP3xkS_hoiFrIb6syskb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE1MyBTYWx0ZWRfX78WZKrs2jHIy
 jzPbRnzBUKrjX2i6ZF0UmucjHJtmUdKqRbEyITtWo1YJVJOt7dnxt1eFz04A91uIPN2TZKUAAii
 Ex8A8EXxxsHK7ElycSYkT97juEChD/Xqk7iTS0EZZumKl8XiWJ2KRmpPkOuqtwFp3dr2XRlntKQ
 Eh0gnV+h50BMJLNKjptwqw3XjSh5cSY6wioZyqZFpihrsumzRlEYi07rme0IH4rJPISLAVWNt19
 DF+/6nq1Max8KsPhfHnrrfVr063hAClRaTyNnUVT9N8XHebw9it93V6RQx3sbLUfM1gi7f8gRtv
 G7syeZmEIqSWnNj6fbAEZ69/b9Fz2oMsz8ualvrOMBTsTJxut37aNdR+yVeE6mf/R69L+WwPC/Q
 UzeurLIG6MA5G8aL5zGWztWzQ3GOt6IlmHTDWuvhEDCzNyVFaio8+xCxdg5tYFurv3SO5fG5Dod
 QWkoQspCBWMVoaLCFkw==
X-Proofpoint-GUID: AxWMNKoLQEvAcP3xkS_hoiFrIb6syskb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080153

On Thu, Jan 08, 2026 at 10:57:22PM +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
>  1 file changed, 1 insertions(+), 7 deletions(-)

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

