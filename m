Return-Path: <linux-arm-msm+bounces-67973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5721B1D40F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6156816C652
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 08:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B30A254876;
	Thu,  7 Aug 2025 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKN/qU05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8D25485F
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754554187; cv=none; b=ryDuIlVHA8umc7q1+oGog/hbZP/m1QqeRBHqQ95vtxhvVx4wSGVeEQ+r5Bfw0ZmE7YsS6zFtt5dy2wsSNVwTIK1UOztFg3g/UVYtYpB90+7FLsWpZjs2uv31NMOlUA2iW/+DhQb6OEoHHe7QoOyUo6DnclF5YULivOYqeQ3Ci+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754554187; c=relaxed/simple;
	bh=+iIt6eJa5z7/55bGmPf8SfWqrqAcCKwMujezRMcSbXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iez6brQ+LUe44h2RuBqdbtq1ETcLAlFCFhByiC3NsZB2m8L9uxF7ADzbGIPAETOdmMwYkwjcSm7Dqf24nSEDXHqkU9DHu8AsaqU2dUxFCFZJu8CEyT4PycaSPryb2nSRVty1yWB+yZO21lOh17EmS4KJ9XFhf73/y9CUtcNm9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKN/qU05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5772aZaN004973
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 08:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8cnnTCr0BqMwDmRXCSiVDYTd
	XzHaxhvasLyMTbeTJIc=; b=CKN/qU05FMQA+gzujiFPkSAKQUw6MA7hFbZGfL3B
	hOfHfrjY3mla9zEmM0PjyM57K7HkoioE9acrkNfsUaBTtJge7/QBPTvcYOXIL8f1
	QVZvtg9CUrlX6CYJLTRuuvNW880rVGXreMyKdtc44/H7VyKif3trXulIayw6wIaO
	0nMYOcx9hlb6Ps2NAbkacfPZAnobsaw/eYlQqkHXGWxPpHghEg1+ch/rclvVyCT1
	E+Ol65SLHeArr0UkQD1v8tzbPVeFeLQseQYC07yB/xTsUyjSzGhtJEqt34ca+Vyd
	Kw5gm8TEYCxoYJvmdczmncr3aJQYCyhBBsS6U2ay/g+kMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u22jc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 08:09:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0791a8e8dso21878711cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 01:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754554183; x=1755158983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cnnTCr0BqMwDmRXCSiVDYTdXzHaxhvasLyMTbeTJIc=;
        b=h2BqOItPYrHVKCXzGydkx0iDUdfAjx8itvNlVqZ2YC+tw59Q/rABMPC/kgUJi72msx
         hS6TxoBorQqSwoaE5YahLGHTn4emvTFnz+GddVozHm83SwmEzWgmTHyJNwcJz+ekFbYO
         e8qPAdV4p+326BSHxzPqNPOaWmKe/KNM/LfPiWSXgvCAr3Y4+NgoKJGWsm74pvLyuK1+
         vvFDwNqmwzdaw8wi7GDf5e/KbwACj60M8xk1wmo9Rn0dmTD2lB9Ul0LIWzHEvobMvJaz
         n96IKjy3I5SxQWvAGC4rm4FRqGcpa7SC+fObb3sdmVYxbzuR0SeAorHpkTu/EiiPUr9T
         aLlg==
X-Forwarded-Encrypted: i=1; AJvYcCUdEggyH3CXXu0MNp7J9pqv5u4lhkF7/UpXRkOSDx1ZHiAJT+RAS/UCAgQwIrdq88AceYTHDHBQbN1HyBgj@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8Aa8GigUmFCmrJuZUhHUxLQsSB4VVjlBGsveye9joQrJa16q
	Q/ElZO+dFhB1+fVO4Nmtf6ZeIdR+JcmYNWZJu/jeh2PdQAkA/jgzp2j7XlbyKCIUPx0CKwZRo8Z
	mitKHi3jop9n8LoBuoaZo9jzAX1/Rcmt/6djarcNe8ozvTrqJDWj2c/Rox+63U+NZG1jp
X-Gm-Gg: ASbGnctX6aHcSC/WLE1RLciu+UaESptKeiM+HLhRqN2w0IcvrNxgh1C9A5tsRI7sMAm
	Sz39LENROZc8KfLEfFc6PgsU3aKN3BCJdDmYAPue1INKmSYJi+6Z1KEBtZf56f7lwVfW/7cJizH
	ysJOesbKt/9I0uSTayaDKK9QA0UeApSfelSCWn+sqRF06flocu8LWsLROaiiE/Cv3dZ2KmhlJ0u
	S/0LKiSMt9t11Q78T2ZmzU4+5N4kmDkGUb+jCzxEf20SbKtccwF7J2/XOSlRE+8sD+ndZl+t/e9
	V4Bfcneqi230JzdfqWDGcKqzqt10debML44FKQUquLRpf6CXrCKr3TXkvfn1wVWZz9FPxliknN3
	93d1VJnS7EPNM2CjHmztju+BpReEWXu8Oef1gQ4jpdErra6sMMhii
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id d75a77b69052e-4b0924fe2a8mr88796431cf.14.1754554182942;
        Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr6oBPT/KIywasjRNJMXRDMeHau1nVtpgPLjvj4ivB0nSsqqEOpEjGcFvOQTtB3vlNCloQQg==
X-Received: by 2002:a05:622a:1a93:b0:4b0:77d7:c8b4 with SMTP id d75a77b69052e-4b0924fe2a8mr88795771cf.14.1754554182037;
        Thu, 07 Aug 2025 01:09:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fce24sm27550341fa.66.2025.08.07.01.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 01:09:40 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
References: <20250807072016.4109051-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807072016.4109051-1-arnd@kernel.org>
X-Proofpoint-GUID: Uzrr7sDL3jB_sVpCWgDLhTkU9dhiIvUa
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68945f48 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qCxGkQd1JP7TPUfVb20A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Uzrr7sDL3jB_sVpCWgDLhTkU9dhiIvUa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX4e89rLj1PpLi
 pBbQ8mTyqMauFAWyRTUzhyDE+7lkjuYKoWKUl4o/ZyWY1pjj5EQwqkL+6Abr983dIPuiCZEvTIM
 xzGbY49EvC/HEZlSD/CjNXFQq6poAxV8Lch49E4+CHYWA5/qryn+9fn2ChqotmzXuHgErlZ6pN6
 65XrxyfAJvIMB4zDglguDcFcL+npWAlQ2UywFQkXk8y/uHt0jrhWACkyCK+3ARR082VgdDPF+K7
 5fYAaPR43zjRS4wkhkLufpnh0ekIFkToHOTN+EZVFmrxB62IaTEZcdvK7eD8+xYfwGB5uD3uBYY
 /AUh1m5U9Xd7unRD3hJ4XDVH3ZhadAby42iBqWUnlDwmIe5CZrNrk0JEVEGbENPnp59AInopDUo
 5SnHAkjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On Thu, Aug 07, 2025 at 09:19:48AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-21 points out a variable that is conditionally initialized
> but then dereferenced:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>  1138 |         if (plane_state->crtc)
>       |             ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1142:58: note: uninitialized use occurs here
>  1142 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
>       |                                                                 ^~~~~~~~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1138:2: note: remove the 'if' if its condition is always true
>  1138 |         if (plane_state->crtc)
>       |         ^~~~~~~~~~~~~~~~~~~~~~
>  1139 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1132:35: note: initialize the variable 'crtc_state' to silence this warning
>  1132 |         struct drm_crtc_state *crtc_state;
>       |                                          ^
>       |                                           = NULL
> 
> The bug is real, but the suggestion from clang to set it to NULL is
> unfortunately just as harmful as dereferencing a NULL pointer is little
> better than uninitialized data.


Having no plane->crtc is a valid setting and it is handled inside
drm_atomic_helper_check_plane_state() by setting plane_state->visible =
false and returning early. Setting crtc_state to NULL is a correct fix.
Could you please send it?

> 
> Change the function to return an error in this case.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

