Return-Path: <linux-arm-msm+bounces-60656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB7AD2164
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 325CC163C57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE11194137;
	Mon,  9 Jun 2025 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vn7l4rV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19454EB38
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480655; cv=none; b=UxhxwfW+JCD0b9C4KtxoJEyUMnk/EdhMw/7/rFKOVPRGqjUe+/GPUeuzZpONaRS75Li+DFT8dqcoDY6xWrpTiEI18dJYIg/X1juYX7Zyx2LoUWS8Tz8eD22lAIhcW6wftpftWaYTqvdNBW0i405Wu+WDCRshiPCnPIDeRvhCaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480655; c=relaxed/simple;
	bh=MLrUcG7/LwNeQq9R3qc88l6FMX43V32zju+rJyP11do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc1JzLzPLeJwptHsl7BrT7rHDAopTDtWogP3vOPFig3AnNBgSUWHc0bvlO7v1EzXJ8v4CFD63qHtAtGCupeR4+E887l9rdgWlSQCOdutCHmzFmoaMs8f63vPGeqnSKKXKQY/cp9qxiZHRA4PXJFqUBQFpgSZeUnPwBI22mW5n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vn7l4rV6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995iGp017514
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gXXryfwVQKKpIclvmqazUHr2
	/hWdodYHJK2Hup7V7Y8=; b=Vn7l4rV6d1tRwlfrGew+pDVa/lLUy8xn8yP98UxB
	N6/weTZN304kA9Cq60R5UER39thPS+g+IxkYFuZf/80Jg0cfnUF8KRroc1/s4pYq
	WdUIXvU4UdKSzOaRboNGkgTL3B3biFoOSXpq8PZrMhG6jypUOnSYVI+8bLLMMDX5
	7y5qII6TD+Lujd1hv2uINMblOqrUJmsTefvtcx4BJurdxalUeCZq6VqxmdlJM9qM
	o26szVsf5mqyg1U1uWjoNa93Up8onE5xYUWb2fdgkUMvSSOmzUfQdD5trTMFTgwZ
	LdnCkIolm+douUQRGga5ghqNMDPsyUhmM5VjBe7h7xvMXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75tn6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:50:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so580462185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480651; x=1750085451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXXryfwVQKKpIclvmqazUHr2/hWdodYHJK2Hup7V7Y8=;
        b=w2k0wdCTf6HbGSI1v86U9tCYNSkVjXxnWU9D7bCRovHjVc1MYI7G2WWWGrwqxs+xs7
         LffGdhxEk8usIkbITF0kg54L41qjcrDVwpIKXyVGlJgrPqgyOt07512+Tkh9qWhb4Heh
         BGCxkZOheX54mgaGevXkJWRp3l0Lq5RJEqiftKnlbVjC+KG8Nmq1111AILhmhA4FbM8S
         Je2OG3UMxxkIm7FDcXDfWNITCdpjP+Uchz/k/0SfG+p84C/OK1rmeKtwoTn+XaQ9h89P
         lDuo00k0kDLi+p1UX1ECgjATM3gSZo6FTnk+PKgEYQYjhKs5D/jN6j7EYu5lSERrGr1a
         UWiA==
X-Forwarded-Encrypted: i=1; AJvYcCVEOC3bp2MHptxuZ4iszkIAFsYCxqfrPayBPcATj5DAFtPx4QKAS+JIir/QcmKD3mIW/M1PaT3dDNBhBigt@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCg5YZKP/sYfF6+zSSxnHc9TFVudkyhZRDmA4xciVLzdLojBu
	IFIY0yr5BzaOOO4KcdF1t+6Q8CQrIggZ3c+lCbc2+hI8Pq+iQaUgotcJGbae4t/tRDgZe2XV+Hg
	fU453Z9KSCODqTv8DhyROHUDmjU0EU+njyzbgKa8K9Sd5/SXsPjb1PtNKEE2NAExRGC4t
X-Gm-Gg: ASbGncvDOIHt8wkljysgJleVh3jqE8XvEMriQzZJCwhjNe59J1YColHwNK9P2GbUgVc
	CSNKW5l8DdmCN1kU9qmGo8dJbPCTEtSKpIFS9aNEe8K6soxe0Qz3o01j7+D1yPfR453hErtGeXO
	EW5uFvQ1R4a2DeiZ/h8f5L/Mk0duDB8XNN/hWLN2wYw82QJ7xPRiWzIsfZRiZ8voBeOs+aGMmRG
	gduxL3gVcjdg6SpyON39Z9x2aGbfYuAY5V3NBZL+ZjQi+x58Z4GR1rETU1cmfUJSJfI/5kptYqd
	wkWqP1WfFZYDnh4XnutMzSSKS7jeSBKUlonfjCbLeK1IudQanJpvY5elh3Nn24JyqI7fRwhRP9E
	=
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2478839985a.36.1749480651679;
        Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9KQZ5csfFeRf19Lg6Rga4uNIbAQ4j9v76mKsnJL2pr8UbN8vt6wkRD/Yt3tovojhBPPxXCA==
X-Received: by 2002:a05:620a:4151:b0:7d2:279d:c18d with SMTP id af79cd13be357-7d2298ec94amr2478835785a.36.1749480651310;
        Mon, 09 Jun 2025 07:50:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7796sm1190964e87.81.2025.06.09.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:50:50 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:50:49 +0300
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
Message-ID: <rznsg4feyxanhvggxtebilg3ukbcrv3xgi4f2ijadjqaeqfelo@ogib4gythj7d>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-32-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: T8XgeyaUhKmqr-e2JTRAG-1BG_3OEFP5
X-Proofpoint-ORIG-GUID: T8XgeyaUhKmqr-e2JTRAG-1BG_3OEFP5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOSBTYWx0ZWRfX8Z8p1w5Ea7xR
 h8AVRuRUjBNiflyGOHLp9vRl/YXZquxl89elgLomK6VU/ktI+urTjI69rWLApDnku/0p5ErVG0j
 rBWu4JxneekVF7aXyJ3HvzZAxRRu8Em0H/o44y+UyBWPnm+FY0rjVc+cubOZ8l0E++h/LtAgPRu
 VyaD9A88TmKUyZgApC7ogCkjFYJYdoWOtSbIjvt2YTNxxbm32a0ZUOxD7WbwAiuUjNXXFh7nU6I
 fCnIhjdvtKdjc4OXIa7QVeXjoos3+vhPY9CwAZt4xCrDR1RyDX/nmyCyO0S8TXSXldGVhxwAezG
 ZWiZElTMGQv57yeQTzi/2TUak2Akd9yU6os5p9d7hb9tnscQRapkmiWV75iSrYXMkpvo/JbT+sU
 eijANRAS2VfUOvo+kZ5mLflINncibJ15YoCyUHKCSkKoC9q6PtRgSbWCr6Lzna9ta7oErmmY
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846f4cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=JLTXKlIeVVy5508LhJsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=790 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090109

On Mon, Jun 09, 2025 at 08:21:51PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Hook up the mst framework APIs with atomic_commit_setup() and
> atomic_commit_tail() APIs to handle non-blocking commits.

Were non-blocking commits not supported before this patch?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  drivers/gpu/drm/msm/msm_kms.c    | 2 ++
>  2 files changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry

