Return-Path: <linux-arm-msm+bounces-69183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F38B260FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B3B84E4F83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA6B2EFDA9;
	Thu, 14 Aug 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4iccqO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAAA2F39B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163710; cv=none; b=shVv52Ij6pJAsjZCNLCD2/8lh/lNjpg/57csXcsdO6QhIajbYiXb7fwBpHgb0kwJLaZCSCgnefGzFgkLANdrDFhqbjZK2Mu5pJpJ1h/JzKHbIr3pAAOrg1EkEptwWVl9Hf4alFVz2Bjpe0Bsy8F0jwAfPQ6RLnQaVZ6jNHplhHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163710; c=relaxed/simple;
	bh=+pvfW+LwHle+znxirRSbw12fp/VImxYQ5f/K16iAEBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+EthMEWKB2ULkKFqRcz0A+hP7Eq8FlycxTvClt0keIDPT/Fu+ArZpyTpoVUT1fqVi1+JQV5LYUus7r5vbBs3fNNBuBeI7aRw9K65OoJxlTSwClEp+fVTJMb2FFpiO8PUVHQI+s+YRAEQB13TzZhUCVFQL6mSFT17+CSYkqXPvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4iccqO0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8x9YX020573
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O076QscBlfaSz8F8rEYXMUKe
	ydobwM2fUce6AJi5pU0=; b=c4iccqO0EpYkH9FlIOWuAAX4vE+ax/m/JH/fRlbb
	t9eJgwcJ+5InT7JIM2Txed7ag9OTSWtkpyrYw2cv5tr4C/Bj9nMemtKdTxly7w+G
	6xJsDYtZVXn4de0Ch6I6PiCvND/NVK6cVDFb/14nB+Hdijs+xNpcWfBRkTb6xFWy
	DB6Tfjz9+fpsrvF74b9+m+n2saOGXxjoOZI5lXpy5vmAaPAUYirCnvg9IWUZvHT4
	b+VazyBmbJAXOKNh+PwVcEj6816hGiMib3v2UH3n/dk72oVu23tc/sqGvg+JlcXH
	9+5aBS/XHa6jg8uZARpyzPpdOoorP6E953G4MUM4yzL3sA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmf4cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:28:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109c5ac7aso17556071cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163707; x=1755768507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O076QscBlfaSz8F8rEYXMUKeydobwM2fUce6AJi5pU0=;
        b=q7FBMmL2xVSd6aXV4oguPmy24mVrZTNzC0IfOIG2Yjgh1T+kx3Q7LhvwcVlQhTqUHb
         zlN12gtDsjePV7mcpsHBxMbZarNpzV/ThEECmnVe6R1YOck2pUdvcxlOvmGttGNrYH5F
         sfkMd6+jNWBGYFY1SyMhDwT/CQwdyNZfd5nhgTe+2htuWYitJXso238CRwzrjh8G48d0
         CIL1U8e9sA6sUhQYyo+m1rdid6QnV/bP5D9CmnOBwbZxJv3m3al0po6482WsvN8m+Z+L
         41muumfE3byQqphPTCPKVkeMzC21BUGA/KWq7UOOm77OV7EWDYqw89/AJd2ab2JDvRTy
         WjJg==
X-Forwarded-Encrypted: i=1; AJvYcCULhfEpST/PCdwtuYJk40rTjoagPkyqQaZ1tPs+tYM42gvIzlXQL1Gv5G2TymOtCxorZUEc1MFCESprZNOz@vger.kernel.org
X-Gm-Message-State: AOJu0YyVP8K/MaCI5MbF61zbz/IB8UxfER3IKJWdrduujdXCXlkuZSVR
	bPQ9yU1VCW8lnw/sIwMRy5/XYqELzqaHzsnFhDoGmxO3NrjEBeowP55TyC/RtsPlup0hmkoUCYX
	/L2X9bAGHIJJ4X8pLuuXESp4hbOCtPtJmiGJ6drTDst8PV6Qumb5vbg7CurFzrsSB3bso
X-Gm-Gg: ASbGncsyljZjQCktUn7DIfqzlUJ245pYcBPkE39XU2XwZYte1dZAGp3N4r0+fijmtJ0
	EuYIawqBd3o/3wAfwitWmd34cX47M1uwSmKIGvP1UzhQqFuYvqZoAYg5rTsunHdqOuwyjDjlUw+
	b9fCMGyPNuQSylfb7u3laM/1RXuMoz7iWQYAM4nPzZPAXZjcC1qd10sRknqW97R93iOmnJCo0gM
	pGdclg/7YE7Wwr7i7y//j9Ab2XWi4g/TgsSyTPPXlqJ5uZw3rxShATCqQ75Bx19Skeq+uo20d6B
	PxjYBvsXnSvsipaIU9LNn98575u8GWObZn86sN40r2mhrJ43766FtPD6KiqzzvuVYKSylzwMGhI
	ZiC6Ek1FN2baaLC/UTHi/p6cblm4AFE4AMr3kVpPI1UwRAcALwxeN
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b10c5ed878mr20121281cf.58.1755163706748;
        Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MUHvm6rtSa8l/GeGn7RYGTzj4ND9ReLlHxxvcNHQJymdlM1Mf9CYxBThDHTsoL8aM4maXg==
X-Received: by 2002:ac8:588d:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b10c5ed878mr20121041cf.58.1755163706254;
        Thu, 14 Aug 2025 02:28:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ad021sm5649676e87.74.2025.08.14.02.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:28:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:28:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 32/38] drm/msm: add support for non-blocking commits
Message-ID: <vns2bbpekccowbu3ahg4cnvhrbfk3yc2tvu7o4n45gpn2tpybp@w6gmsve76erp>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
 <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
 <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8458790-b4d8-4165-bd6f-00497a9d0457@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfXzYzbLC3euNJS
 lP9Yi3n3a1F+yH8iujvODYSyLvM/kta3HpJ7JoeWzhiBHyEaPRX6hqEorCj2Lh5qqu72QFTV3u3
 uHpSulHFfhZe0yUGlSbJg4z1qgDaGRKDuq0FL04zvAsUTtlzqamZbN/+JV2FtbHmLzsqQco3qBz
 51pDzXi91u2ZfFz+aMmkKsAIuKa+hr4mOoPduxvBhlLgJo6af240Sw5v0TsINi/1RSvmTGMzAq2
 vCkVv9bNyOYXg+mx0Tu4XUlBEvNLut5n5zxHFOkz9AaDykEiozhjkYMeI3fj62qaN/baZXatmdV
 LF6wmbmoZmsaAwJM5of22GRsEazQp2jeI1/WiCQ8kZQ+WLrQFdiVXj0FzvYERhDhBN4H5C4yBIy
 cjzthwCJ
X-Proofpoint-GUID: ir4yeulhlOseOc4Rq4dC7vHLgv3ezORP
X-Proofpoint-ORIG-GUID: ir4yeulhlOseOc4Rq4dC7vHLgv3ezORP
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689dac3b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z7gkRSVo2wHhsan7cAUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On Thu, Aug 14, 2025 at 04:54:16PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 22:50, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Hook up the mst framework APIs with atomic_commit_setup() and
> > > atomic_commit_tail() APIs to handle non-blocking commits.
> > 
> > Were non-blocking commits not supported before this patch?
> > 
> This patch only work for MST case. and for SST case, i'm not sure.  I see
> commit_tail() called drm_atomic_helper_wait_for_dependencies() in DRM
> codes.. Hopefully this can answer your question.

This should be a part of the commit message.

> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/msm_atomic.c | 3 +++
> > >   drivers/gpu/drm/msm/msm_kms.c    | 2 ++
> > >   2 files changed, 5 insertions(+)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

