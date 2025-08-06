Return-Path: <linux-arm-msm+bounces-67821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F78B1BE44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4BB622299
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 01:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2E428373;
	Wed,  6 Aug 2025 01:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZnCqWYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E001114
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754443499; cv=none; b=VzxImXOjowiXdmM7vZ0uJxdQApEgaTVD1o9qHCR7izTpBN5e/rKBWyxM2skdw5xDGjYMkaTf+0165waTS9BOSxXgoqGwr9XAybXE5Q4EUN0TlbIq1mMzeeYAHMwyBfuW2EddKGIn/x0HcUGMgH70a4j9ZZFFQTO0oeLRhglKyV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754443499; c=relaxed/simple;
	bh=HCT/kQxVqQeqfQIoLauEB1vhRPzOM+Zsco4uWo2vpBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErjUpqQGTPcZT9PwFluHoMKks1FxcZLngjr3d1zm8LAvDcWyW9YDbpoNW3fxPFL47CkY5rRUrQuArVVtQ8PCfmvKJo4ecBI9RHC+u2/d8GJ/Z6JzRNhNGvTc+K0SYE00NUU3PPAh++GV149xGY4cmpnCHXhqvEN5l1SlwcxejGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZnCqWYl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IKdVq031279
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 01:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cECZSFy3qa0bHjy4EhDWe8hr
	H3jcwRS+Y/cAXNikEvM=; b=WZnCqWYliZrXAa9l0D6gS08pZD5aOk4pHsA8w3uo
	3uTmfTchrXSBEkKnkjwWSMeKduOuZkvtqsz+1bARX/fIgrA8CWE68l8vp7eaLMIB
	27oIU6mFPGP4icayA/sIi02FU5i0aun/Bl2YU1miEv1Px4UYEfUfNhdKOSwpilNe
	wJMUDlWXY7xvzbtFKLcRyp8ZAGG4Q2FBTE9gmKxCdMebYO24kgh1L2vC5BS6V/nM
	Fr8FRFnGPk1O83SoAlmGdIDlNMSgB6UQ22G9gbniVfqhjTl9+LqohAy4JRgYu7VK
	YOIPrrKwF9uc/KAoiqECqUceMmNI7drFKQLrgu2mp7Uyuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb8xrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 01:24:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e36e20d700so109068585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 18:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754443496; x=1755048296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cECZSFy3qa0bHjy4EhDWe8hrH3jcwRS+Y/cAXNikEvM=;
        b=GByiYPYUWZsCwGdw5m3IC2uok2SReJJYcY/SckDYoCt9AN7SOJ4gH7KPy7IF3ge+IU
         W6Y3F4HlMeV5jPbafSV9aoMnWqXF9NRWA2FjZzpvEiF1pacssUXJ3GdEpYYH+DILpPgX
         bOwIYG9u58IBiSdnNGr2G2o+C52M1XaWUnqpBWiioX6C7uPH9czCcbsvreEUytMQAYDi
         xWZIykZF6ABORBp2uosTTF4uRKlwv7jAFaxPos+r8r0hKWSArrGjg13t2l1CwNqsvelC
         2a8D2xdA0hg2vyvk4qjJ8A1PfkYZlzgsRfqG3uhaFq80yGa8HPeYhiQAwMoqerJ4OI+Q
         7PJg==
X-Forwarded-Encrypted: i=1; AJvYcCUuuPgcEj09FRZTJ+oqrr/6FaEBgTezTZOZP8pp40anVLBtFnZ+7tWqM7vj+6mqnn6zoaWAo45zAIOjAt2w@vger.kernel.org
X-Gm-Message-State: AOJu0YyEt7lQdzlvMaTXvrgYsESh3oZnXLLnTqPSUKEkLUpJM2ZdegLE
	VLZ002eV+ehWwLZEdAgsfR9ppJ0TtsuuIRh3C1+CJjclsQxl5MSwz0pXRnTdxBLYXWhz6TpRvok
	c+yzceAh/BVh81J+2Icho7kswqWcwsp86u7lKgSwj0JLlSfP7BaOzqa5o0e3uD66t5AyM
X-Gm-Gg: ASbGncumotjjRdweLVQSWqxesYt18PD7lIeZtQyPJHLydESeLYPJrfLLpSpTaORDa3v
	+VKIDkNf4IqLl+MH2NVdHJSHNnQh6t+2GfS9k4KcvNUE1mYU9st2LKeshgHPeEud5zNqTxoZEJ8
	/zFhdoYn2Wlqz4TlFsBm1VgYePBabpjv9kk0qW7GSCUfQFuBQUi041AY6VNR+0md9t0tQwqaW5b
	fY1JFGs+O1LwK75trTs2kZqEkqCBArOvFV41dz4Hbaa9XQOQ/KWoV/U8WtzY0F3bEqCs8olkTzS
	wLD4HPl3npYju6ton4tb1Fj2PImS4xzIM+Hk4Mjvf2MNj46Bt/E/seE3ZD1yThzF0kB60Y2jXIr
	SidIto0xXnhHqrl7XyheVnQOPqhFdRDalzsDxomzg1tcEnKcPTfNj
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7e8156eaa4amr154492885a.15.1754443496039;
        Tue, 05 Aug 2025 18:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE3iln/vIeJH6XAQFmoLvafmfwZ8ex6TVrHNRQ6JVSz4HJUlvRexPyLHQYfDNi/TLCH3K+5w==
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7e8156eaa4amr154489885a.15.1754443495580;
        Tue, 05 Aug 2025 18:24:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382b55d2sm21196351fa.31.2025.08.05.18.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 18:24:54 -0700 (PDT)
Date: Wed, 6 Aug 2025 04:24:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix a few comments
Message-ID: <mwfrgvslnbfxegxqhfx4ldshqqxyfgm6cwbopm5hk4srgeza4s@vohmu53ettad>
References: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwNiBTYWx0ZWRfX+MtsgxHivB2F
 X+RnAJoO4T0ybVMOJ7R6WTzCkJTyGlSNaxhLA7nAD0zenn8qttif5xzLelsScZ7I91EutcJ1hqp
 8ef9DZzpr+7vS2ksNadWLC9Ulqpb5vNn+x6ouSYT/j3/fCHb8iEHgjc7KiGCTo3nvfzsCrTE8Qc
 cmIEWuRsWtyrxy74QFKYP8x0rLEw+t/k0IgtF9FiuXQq68CwWsAdRzcymQ310xOWaPU1pMq9oLr
 D5tOvy53vmaL1FQB6epJCq1pXqW/LTA0ccGxXIPnCAhiluZLg+z8YWhXJ7ElLCmPdfGQeHxu4Lw
 am5J5+rfCsjWspP2C+cPPhoCriaZP2nZXIj4RTO7yQtd/PXu6zvJICykVAo3Z5gDNVaUpvWnuzO
 LE3vgAB+oyaFVPaXz7OpzIrkx/fTLJQntlQZZssNtjR1OW3RGuNrQ8mo6bmeSx98FjRI5Wvw
X-Proofpoint-GUID: eM00TRfhK5UEVSK_Z6nK7wUOnxlQVi8d
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892aee8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=GOsSNTHw1BKba07vPD4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eM00TRfhK5UEVSK_Z6nK7wUOnxlQVi8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 mlxlogscore=855
 priorityscore=1501 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060006

On Tue, Aug 05, 2025 at 09:43:08AM -0700, Rob Clark wrote:
> Fix a couple comments which had become (partially) obsolete or incorrect
> with the gpuvm conversion.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.h     | 2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

