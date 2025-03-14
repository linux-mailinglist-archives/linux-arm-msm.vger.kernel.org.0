Return-Path: <linux-arm-msm+bounces-51366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72668A608F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 07:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 215C619C3E35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 06:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AD2149DF4;
	Fri, 14 Mar 2025 06:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXyRTU/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279E13633F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741932690; cv=none; b=Zuwq1Eel4T+xn3uB/U4sM9ApezOg3AvWeRbpMMnlGoBAT1H3vUFb2qvt9YwD4/Rv+VMuPU2TkhCTezyiMzCE1D7LJQkugLP1+SV/BVLmolAm+beK0chS7fMaFeCrXvRq9iT0dVh+Cxq43zo43g+BCy6gKbJU/sx8pmPVQoGgZvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741932690; c=relaxed/simple;
	bh=lrGYN7jbovnBRsiy0qwZkDhfHsm6h9AUq8L5qgxMF80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7kUh7nLNjf1dUde/2UTxW0Vc2O0ESaU6iqJOy6o+PKpn+WLT9c85yJG/LZ6GMpEWG9IeEziE41Jz0n2tnZ4G49+IeRuH41TL1jz5oLPPgL08V1/TUfP7mb/5JnBiVIG+0pn34v8BLxqTXysuD3m7ANN1hSeE249aQOh0r35kOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXyRTU/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E1wThe007713
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IScPRMJWlAypVVGTG3eAzrrq
	ZqNhSbnrEPn3z5FtHkc=; b=iXyRTU/KjwoMm7sAi2n6/0MoFdyJBjWemiSQIiuz
	9+4o1A0h52Vtt1uwzkVm62tTPwx1p+E6Ix1ZZdhdKzgsIf8jjUlOrUus7eqjFtHA
	LMKpgYLYM3O61kvZTgWqJNUnACPaAqn2dgqp9Hq17OkXQ7XGH0Z4qj8nhZIJ7g5i
	HU/rIBrLqPtn+w44KjNhCPsHp4TlRKHm4LiY/EXUwU25ZjU5Ti9IsUdbgdsOpGNC
	+6KVypEYLvaIH3Cf+Aj68WzdW9r3GIM3K5XPoRiPtkE8n8kEpb+ZfmzHTcCdxDgw
	Jf7TaekIC7TH0cNdEGa3clDdH3MAFJTfWtBd1qP4bvsYXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8bx61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 06:11:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476b2179079so34398891cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 23:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932686; x=1742537486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IScPRMJWlAypVVGTG3eAzrrqZqNhSbnrEPn3z5FtHkc=;
        b=aSGJGw9GfG3lwW5ZZmJqlaqG/54N/GK0ryNl/DwLech26oZioLUuvNJMT1pxWqVcfA
         eYb2tzZxfzbPv1ONbJXmz35+iOod4fCH29UtAwpMwOoqucdZqJKPlpkgY18GT/w+p2ZY
         wkgRWfRWnRKRqbqEHta/2HYgV1EBToFKUMBAGOp4Ttt7QPD92tBSbsTrk6xlvQ+K7Yuw
         YPjY4csz5WkwoJvJDX3TpeFj0ZReJ1fuWN3W9MH/Ammj8XL37/wc2jkoz18a5uG6CW6H
         svuC9wfxudKkuQlttZuQ2x7HoFQLMzdRkZ1px/VS599q3tdeMMxvkojuduqrG8kgQ89o
         T8lg==
X-Forwarded-Encrypted: i=1; AJvYcCW/RzMdssVfaULIP59V5YoHd7cbFAyM0nP3tiBwOX8QDCDviWcX2KtI6TfGh2HZ9Ov6YLo0pnqC45QtgRCA@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEAqvn8Wx/nYzHXG8+kBrY1a7ZSv8RBXptEEkjjYKwk8b/0Zu
	gn8DScdNeQGJ2aEVZJh7Lgjig3TqQxmvk2oRrgxnHRC0DVqjaR77vsc/ET4Xz9jZp8eGyEsg77p
	SbuDgeUpv/00BXNHjNpxDMhy2dTKHpJj1BIV9ipLZm5oJzSWXhDxQbxWsXq8xxykr
X-Gm-Gg: ASbGnctEu9WA57fvZGq/yInXl4Y6bF/k9Yj2Sws1facbrISra8oUioQaQcZ1HplyBgi
	IDWTOkGc6oa0kw/GqHaeK/OBJ/E4azIYTUYgBjHQbp6vwv4spitDd36JDw06Bjw77gznW1sjNkN
	AJHQdQrRlj2axbiZD9rsJilmecz2WtWwTKdXvKLVDxNIlqh2+CkvsisFupBzLBwAx+mgj58bGc4
	DiL4WSF2QXU15re4jh90u2Nv4dBUsL8p6PlSLRAv2FCIOKT/K5V9JfiqZOtC5LyADbGQcqIABKl
	cvr+xO58z5D4cIAq2l1FOtGFYUHtejvhufmHBgCetNmDLFheenz2bcibMR0gwYYiPWUsDmXK+26
	h/XE=
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id d75a77b69052e-476c815ef7bmr17237761cf.28.1741932686419;
        Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHNONjkAR8RZmnBgw7/nNpbDzwNbQgBnWMqJdks15ZpyrrMTOeZPgm8VR3KSNnTn4CBULsAw==
X-Received: by 2002:a05:622a:438b:b0:476:b33f:6694 with SMTP id d75a77b69052e-476c815ef7bmr17237651cf.28.1741932686118;
        Thu, 13 Mar 2025 23:11:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88577csm415667e87.205.2025.03.13.23.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:11:24 -0700 (PDT)
Date: Fri, 14 Mar 2025 08:11:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix error pointers in
 dpu_plane_virtual_atomic_check
Message-ID: <5dhbi7a62mebu6trwr3umjnkiia7nnaru533653z67qmmsc2hb@krmvfeuw5xtn>
References: <20250314011004.663804-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314011004.663804-1-chenyuan0y@gmail.com>
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d3c88f cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fWY0QR86pWCIX_IcxasA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KEyus4qFUq48OEPPQCijtJ57BsfrwIrX
X-Proofpoint-ORIG-GUID: KEyus4qFUq48OEPPQCijtJ57BsfrwIrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=891 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047

On Thu, Mar 13, 2025 at 08:10:04PM -0500, Chenyuan Yang wrote:
> The function dpu_plane_virtual_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
> 
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
> 
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed").
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

