Return-Path: <linux-arm-msm+bounces-73788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF38B59F31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 19:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EA61BC0E05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2304E258EE0;
	Tue, 16 Sep 2025 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbShnk+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98265247281
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758043449; cv=none; b=WPvy8/l7y/0O67Y1blhHXeu7qKcPm4zLnPM82kY29gvUfAV8921xPanqs1egJD5U9Sbesj4ZdNiM4vhjby6a2sdx7hYkBVrAHW/S7Mr/kBIloyD64nKmtbq43PZFKBrJBo/ig9DBu6boHcR+01KTx/LoBj6SoJ/q+erTlQklCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758043449; c=relaxed/simple;
	bh=MMRDsv7F3L4iVwuItvJKhX/lkgNUMkwNnqMAXa51eJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4uvfHp5ITsdynMQoaDqAscMj6/ADh/Fh1+17D2tNJY7kurKfbHqlMpOVJT91hqIqs7R4zLDcXrAnfULQsv9i0EjnzGL0P/vy+1XR9OsNuw8VSv4oT+ZlPh0fc214DIgeZvWHHvi14lGHgM6uJhWdOr6NPvr4ZHunzl9QgjuuSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbShnk+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GH0gYL001512
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVJaMFI5Gjh/Baa5ktag1wf6
	hKqheSFU5lQBIMVpCak=; b=YbShnk+EmtE1J0PdqrUXlMR+1KrcppSpR9QOdcfx
	fj4qZNAWj+IZv+8RcHn1hpjzU66oZC40SA7f04qf+CDhhq8H9bYYo/wZ7jYUVZaq
	h1RwDTq5GFgmxYF62pTFCSmBB2b9IXCtGSo7uTrbvxAGwTwukAxxXClxD9J/eZOl
	XQjLp9wAisqLN6fuFIqaLIfDg5atgGfwrvF3PKbavB++hlCR88kSHiTxQFykL0ic
	Qb3Dbi+AiumxI4pOvug33UALfQkPAXpCC6GqWGlfE7gaFVt5QE8gcBi2+jH0se/I
	rGoN/uePn//t1HPlsOq1bYYKLx3LK8gKKqsnaDAY9r4RSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqq0ssk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 17:24:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f290579aso116929311cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758043445; x=1758648245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVJaMFI5Gjh/Baa5ktag1wf6hKqheSFU5lQBIMVpCak=;
        b=rrJXqBdiLmizM5yIzZpPYcLJg2nQ9s3E3l2BcdL0sQ5yIEwJ9diIpfu+iQjio7VvaC
         nwW812j2mba75+rT1OqT3rbyrePr1mgffgiPlN9Zf9uCRYNYERcUH/D6AdtZaUViZaja
         Dtsg1D1jt0Gg2KLpNCrTuCS9ocDL9PWioh+Iaj9U+Bt4qWH1TRa/LznrIcMkteZZZjzM
         savyk350i0dQFtbjwiKqehKTDd7+GnYiIFCXpBkc4UhlqhGT36+1XMkY3bq4iTFBYqYx
         AyLGngt0dfcAUaEpo2bVkUmPXI4lhzXWh1aLiwmPm/PFcllv4EQ5vs42zHoBnGdEIFBj
         tgHg==
X-Forwarded-Encrypted: i=1; AJvYcCVIQqgovVUPPzWZqbRgC3pZrUS4q6E0L8u1TGEFq38vz2VY3ObCKWBB9PBVw3Eq12d1HSeWeq+yPRXB6/RB@vger.kernel.org
X-Gm-Message-State: AOJu0YyIom9qQixi8hGSvsJUIlSvuu8v+ddVyRPPpafBGgfqLQySNsY1
	+lNzSHiD8ZgeLz7w2OYfKCvyuo4Ce+peHFxHAzQJxtHAffnRhREMWIHi7ebwWmfUCiQ8JBHmmnT
	sNSEpQmUlpDb8DSkpdUD4pcz3qpBUG2Xt2+RC+xFIC/p2Ls4NhVx1CrGnXqR2fbv9Ukd5
X-Gm-Gg: ASbGncux8g4JRsdi2yqbTLTN8wZwmji7JOHHPGcvWQERUFazKGyA9Dvd6hmPFRNEdvl
	faaP3g4HXm39p40vbsjEJJTSsASTcDtFJ54hcWAJ4dsxzjdGDa6UZE/AeVp59aBfdM8BB2ysFC1
	KQCcPjz2eTggGu3hhscBvmKP2bUYH+xLgof4wtUCpc0SGvQuGpE1cI34B4h+0oCtJv9bY+2sXc/
	fRJz/djm144wJN4MlXDDt5BORNp6pUV/Ycpx/PH2ShZ5lEg4OF/YBAKN2h45o3wBONpiudAPnEr
	Ilq9wmDiTGCwgHwl7A0jNrqMKN4/1xJUAZ5DLObWu9sWgKhfwd5G2MSmr1mQk5OJretSBunfEUQ
	q3rRO0lfJnSoR7SM0Ie0V3Q1npwnoUL93RU/hDkUnzscbzHGLQZ47
X-Received: by 2002:a05:622a:5e05:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b788414644mr167556571cf.73.1758043445409;
        Tue, 16 Sep 2025 10:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr6odQMGAixWJo4XzHRfYcfzQgqZWK3iutuTIsVhQhJR9bb22IYTwsejar9wedxbDu/asfUw==
X-Received: by 2002:a05:622a:5e05:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b788414644mr167556171cf.73.1758043444718;
        Tue, 16 Sep 2025 10:24:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a925dsm33908831fa.46.2025.09.16.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:24:03 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robie Basak <robibasa@qti.qualcomm.com>
Subject: Re: [PATCH] devreq: move governor.h to a public header location
Message-ID: <3shtevnohqcwjr7zho75brhx3ffbluwtaimzst2kkonohdzlwu@2myszcxun3gl>
References: <20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-governor-public-v1-1-111abd89a89a@oss.qualcomm.com>
X-Proofpoint-GUID: CiBp1vRc58DaB3JpND9wg6ZVRJM9bX6T
X-Proofpoint-ORIG-GUID: CiBp1vRc58DaB3JpND9wg6ZVRJM9bX6T
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c99d36 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=N0a9waa89YCdHAc7B7sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfXxZ3ppCyMXfuI
 0YGtW5dm9brH5N/6WY348u+WY1E1lzWR+VA0mNAs1cmj3OPXXCCB+K1ht+rlJgRW18KFIUxllXV
 qUDLe3dWXwbIOXsY2mXsfvtl/l+6Qi7VDcp5f0z9Z8H1K7ze5VdWdoWNdu1eQnKBci1kBUIUsLj
 kHbBMTfA66IEeaKHdeJqEsPoX6zZKgmrnMikRGpa+zUHtDttVAM631ISS4ByapPFlbwizGEaBlQ
 91zEe9mDdaMMNasGKQU76BKcgBOP7IFqJUbq/MkpEddHFH//pApEInHcAncC9zKzhZ4KdlXc1cX
 ZRQNErr1U5qfBZ7Ub7h0h9xMA7ikpzSQ6VFImFsHlCb8TuuePTc1yJweYLXrOl0g56ZJihTvpr/
 +ktOzWQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Wed, Sep 03, 2025 at 04:43:04PM +0300, Dmitry Baryshkov wrote:
> Some device drivers (and out-of-tree modules) might want to define
> device-specific device governors. Rather than restricting all of them to
> be a part of drivers/devfreq/ (which is not possible for out-of-tree
> drivers anyway) move governor.h to include/linux/devfreq-governor.h and
> update all drivers to use it.
> 
> The devfreq_cpu_data is only used internally, by the passive governor,
> so it is moved to the driver source rather than being a part of the
> public interface.
> 
> Reported-by: Robie Basak <robibasa@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/devfreq/devfreq.c                          |  2 +-
>  drivers/devfreq/governor_passive.c                 | 27 +++++++++++++++++-
>  drivers/devfreq/governor_performance.c             |  2 +-
>  drivers/devfreq/governor_powersave.c               |  2 +-
>  drivers/devfreq/governor_simpleondemand.c          |  2 +-
>  drivers/devfreq/governor_userspace.c               |  2 +-
>  drivers/devfreq/hisi_uncore_freq.c                 |  3 +-
>  drivers/devfreq/tegra30-devfreq.c                  |  3 +-
>  .../governor.h => include/linux/devfreq-governor.h | 33 +++-------------------
>  9 files changed, 37 insertions(+), 39 deletions(-)
> 

Gracious ping, I haven't heard anything back.

-- 
With best wishes
Dmitry

