Return-Path: <linux-arm-msm+bounces-88107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02AD03949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C957F3011EF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056D1189F20;
	Thu,  8 Jan 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJD08MEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6mTp91n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD923AA190
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883625; cv=none; b=k8E6zF/W80EHzreiND9i1qKo3aT+or7A5U3w+Q5iJp3ZM/WpTlrbluNyqWXDbQZNUz3x6Atf+3B/3ytAgwzmTaGlIc6E+Byym7/dFWunDmRH3H2VrpWkwGTamujDOY6xbIsDRiAjl5rH2YcY3IYnCuX2FS/ckQpKyEZlaJNxXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883625; c=relaxed/simple;
	bh=jl9a3vMQk1wJlTy+IIcivW801OlxcFu3EILpReMp0ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOx3v2gODQ9ODjMiFr+YolccZlSzTibeorSzxtCPiSbR6rhpJsSWz24yrC0PwWfEmAzTyJpenuqa631uhQM7H7BeyKBP8OjGwlChgrkwCG3MdBuhVvt9jA25bnJYI37U5loj1s/kyCux7vi0sSPjxsAXFbIE5lcSBAKrJjzPupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJD08MEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6mTp91n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087VSvY1838190
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 14:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E05euwxAEaPxLzxhkVp86rla
	Fr3gpWYqRJx6YmxUvFY=; b=kJD08MEMU3oCMp/3slFjqu7ezHmKWErinn/XqRgi
	0q9pYByq/0orhd+I/qyFuE3H1hh/bbNBW9vL/2UruGtjD6rgQY9Q6u0KmPDpk6Ac
	QWgN7rN0sHPRkO1omlyAnjifkCRpDac5JKDE1LCTS23jpgeBG/VwLjKpl+GO3klO
	GUHknwAENLc8HD8WPOP7Q8CPeDR/vOqIDq0kunl16GTRV5qiDiqoVCr/cxZ6jtDm
	OPIK3JacwO+cR/biYvoa9dDY61WJNAalsUFvyzIeVnhh1bgeNuogfar/+ttv0aZk
	1ok28kt2jwyQGKeK1HCABvba2NloJk9Y23MYJNJ6v0LKuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8921a4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 14:47:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so835107485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767883622; x=1768488422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
        b=C6mTp91n9ER8WXhNme4mEKvE/eipUCTsO4ZyhgFJ70NFcyV+TZt3miZJlGcnWrg1c4
         HGxI963iuBdc3gACGUzJmAzt/y0e8iMqLQNNLaqJSIucDObZP1lnO4wUQtPXqg/51lp5
         0ofa7dJT3Gon2lrDFvxRgUP5dUAqYJF4MuylWeEBV9yRso9P29GWZfG83nHCrWhB/ZjS
         2jSVcyiqBAsRKEwJw5f3n43WBp1Uiw8iVQklqEAFG6o0+dHMg73bE6ig67CM/8sMTMvE
         pXh5rWjVsVy4FiiYfCPa0HIWgyA/rp/w0HVbuRS9ZKi3kC8a8YPqcaDBGMDl1avJoHk9
         TT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883622; x=1768488422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E05euwxAEaPxLzxhkVp86rlaFr3gpWYqRJx6YmxUvFY=;
        b=GRrrbkjRmGA7p3nH4dHOaR5BoMA5bkqFS/xRkZj2o25gHIOR2Ybp8k9VNbMOXtoSYI
         evK/SECEN8Oy8RhUj7VE308P9IMeIcQiejn0SZ1qWdOQbtDbBYYYeVRUdLQEVDkNsAlb
         0etTk7hRo8ZG0nLs9U3M00UW3uTVBhIfbSG7+IUe3ge3GNdModnUzedbS7eKr6+cjJl0
         eFr5FvIDKgMqrYSWATTMvyrHU1gW8rpqCyKQZ1kYPkhkhxHWCHv0pZd05T0szPh8yrhy
         H/y7FZ6hU23rPEG7HeBvw/UXIoPKLPwfiKNzSsSqFqBpzZHPxM5OfkdrbaujcTHhT3Q7
         VGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8sNR1wb0LfxY4TenR/JF0Lz6D8YZFX/0Ss3B8t+HdF7EJIBYquExvu+jUGVz0f53bcQYLjPdul7rUMpRn@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwTNLlIMzL9xfwPkaBEc4jL841Km2J+TToh+NH22yUw4N1bxn
	WTNordoLXf/u/MEgxYmhFX2xZrf2RVhPZLzYEIqQT5XyoFRIXNQeFSaqrJh7CdiuKaJGog+7qxt
	Den10+jkHcA44/MngkUtqH/eoU5iFh4dPHPj/mqQmhQ/rjcai2lWO+j1ZMyqDRRhkFCfi
X-Gm-Gg: AY/fxX4uSSkf9sCrrDbQ8cz+9QWIXIrySTHVQK4UPKF5SqIjjXujqLD4FPlxNnTSK6B
	5kDqeIdYTxY2lYI/8V33BgazPcX0aKxwQKhI61NwaQm/M7mRVWHmawb5DAz+WQIthJQqLGjblAI
	97AI4K9ERUyNyhW19JzmzexQAn/JvHRP/bs4cB3SdDbML15UU9e+Cus4FLYXMY9G8vloqVsua9y
	+1ZdN9438poSIRxruGf/oxaJ1FQ62BosPDZ9llJiSLd4PY6NT4tdvy0h3M4oCP9u/m0QjMG2xuF
	Jm5U/Yh+0jgqtASvcGq1vEXvoYWpIUoxJdF9yYWCD8fxP46/srvLdTPqqQlcpSJwYRV3xjaGORt
	rJ/wSBDzXxzWo/ScycNQCiiBwIVPWrStFGRGygKg+jTEV7XtQjh84bD4HcDH5rF47YL8yiml/Pp
	NvUV3/hRkxfJBncAb0LszP7BA=
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id af79cd13be357-8c3893ef8f2mr824071385a.55.1767883622321;
        Thu, 08 Jan 2026 06:47:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZdKHI6y1PJg4kw3AOKfreiD9CPsGiS2albZ66Zp0/O0JjiGxU4Fura7f1B/vNXX4L1WRSNg==
X-Received: by 2002:a05:620a:7088:b0:8b2:e4f7:bfc3 with SMTP id af79cd13be357-8c3893ef8f2mr824066785a.55.1767883621894;
        Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fd34bc69sm10292881fa.19.2026.01.08.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:47:01 -0800 (PST)
Date: Thu, 8 Jan 2026 16:46:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] drm/msm/adreno: Trust the SSoT UBWC config
Message-ID: <65qhwotmxkxoa434qxtiflkb77espumpnacrw4nymvf37ozhcg@d6ouxfisuylv>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-3-6b64df58a017@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695fc367 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3LDqQxKG0DOzahDZ0EMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QA8VrKsKruQD18DY51FPICkv0a5nwOwi
X-Proofpoint-GUID: QA8VrKsKruQD18DY51FPICkv0a5nwOwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfX31bDX3mijRb3
 D69o06NhE3lVx8ddMb9nCo9+LBeVFVQJM3/uv+1sZMagHjgLKfqwlaqg3zlpG/z10+7U1KV0bJD
 JmVtlUsT56uY1iKpKqwScduhDnQMzGFcQMvRfQoy1NSL7u0+bIBbzkB2Xo+yYJw8SrMOrczpilb
 KBfJMpFi8ps55buIQ53YCSYTNhMqmAwODPuniOJoGmi0FFcMj7A+Zep3lgnpDODOXLhvqLAkPu6
 glb0DNdZQ6Nnz7yxQBp1NPl/zNQ+TRo3b+1S1lG8mLgbsvozDRPQQcL51F6TpY9ddmNz41Jw5JT
 R3oENLIcS9P9VXFw+RPp85DLwACcPHdrO2SFr/Pt7JVzdkBghYhFaDj8bd0kgDb0VYHkLgDjRPn
 uObXNsS20JM3xPE/yYXvFyxKLR+YN+XLawlxVnGvk0A7fkKsclForig8i769mqyUzXoXz8My5+d
 BoAfK2H0Spn+yWVwciA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080106

On Thu, Jan 08, 2026 at 03:21:52PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the highest_bank_bit value is retrieved from the running
> system and the global config has been part of the tree for a couple
> of releases, there is no reason to keep any hardcoded values inside
> the GPU driver.
> 
> Get rid of them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
>  3 files changed, 6 insertions(+), 92 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

