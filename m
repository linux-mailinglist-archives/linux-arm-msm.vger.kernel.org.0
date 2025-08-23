Return-Path: <linux-arm-msm+bounces-70474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EE5B328E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 15:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962DD5C0822
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 13:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4561C5489;
	Sat, 23 Aug 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nio6dpSU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B2194C96
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755957030; cv=none; b=pCYmrd4mEyix9f2hEdsWHlChn5k7+mdDq8KWG7ZJRDBB7Or2r0z86o7tqKPTIYMDUAyUx3YvL5QdOIU7gnVAmNxnZRZ+R1Do8jEcerRWblzGJVV0hahKUzLF0HLpQWpFpLsRGrrgZbBEUVqROPwnZpaIhpSRBYWNmMu8GRkfCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755957030; c=relaxed/simple;
	bh=0c9fKwJEac76vUKl4fSZcqrh7KtjfzOgupgDadZFO0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D1y8w1SnEW+bxSHwbB/PwYj1sH8NoxI/AKkDdmVqj0jiayyxsk4Q7dk9VWem1ouaXfVlv+3+lDkctJXZH54+6i4G+Ajv7nuf3hyVSzGf/P1uNUJpi0AP+tojy2ojkwvQSC0auuVnG60iQ8zwrtw95D6H+n11Q2v+p3O2lWkj3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nio6dpSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N3jj5Z030204
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=; b=nio6dpSUo4+XzYvb
	+g4FAc6M4J86Rqhz8jovolyoTvjXpbL5SvbEeT5bcZGCLfRV1jt7p94B2D8XmKcu
	uVsmbW1JNSfcmo/UgULX9OD/zMNy9DUbM/HbQAlusOIzocf3GbYS9aJ2mMjKsgYM
	hn/mWo+V5FaYFta55RHDn+p3i8rXgZkvUXNLhYI9YGYQdhS8sKJRP55NcgSZWTy2
	t8Gzm424GUGWs2emuFalUSt6LQjYC+SpgJLJI/GeOPEZ2jJ/zjszfJ0XFmyHAQW4
	ju/qT+oiftxCiDsPfV0kw2g+bWwDRGXSyXtXtIQGrbISV0I0iAIV/b7DM5+bm6rW
	2bh2Cg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6158w0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:50:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9a65c324so33590836d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 06:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755957025; x=1756561825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6vA7pywJ2vttXsunG5ab7QCq7Dn4Mr2hiEppiVxLW4=;
        b=vALET/bV8E6zsIoo/gXBaTS9bVVSSc8mcMEdoSq2jkrL4bxtvVlv4kClcZ1JZt4qT2
         kZYZUMLtE49jsMfWuXiQf4fk0pUD4DYXJw2Ea00vD0lUX/vCV3zRNx5/JtTWXFPhhb8I
         yYhcErViN8IcmUIYs2T9tu6R/XdiThdwbt7TYpwQKU2LYJocMlGqY2RMgm1Qp8tIy4Tq
         An6efBMPzjsB6tYQbw3q89pk2Wg3YlvV2HIdw7jMmur2IW4pDZIYFIIWLLP3fwZjlJxj
         SbOGhNHVYAnaQrOJfb4/PIn0B6aUlOhPPAGH489/wKWBw3mi4j861koEOb1qtxQU/aRS
         cwgg==
X-Forwarded-Encrypted: i=1; AJvYcCXF/QV0w8SsiurzmE/sWHYtQd5aQ8sWGf5lmTdHikDxF0d4jzu7HgBlG3bvDYOfPK0O5J9T5kLV0yJC3il/@vger.kernel.org
X-Gm-Message-State: AOJu0YwQBPPrkmV5UYMm9GwqVEsN4mxrKLYS2Rn3qfC2IsKsXfplm2E2
	fDb5k0C3g+S/B3JxGxu997LleKO7Du5r2bVljmMLcKYnVuPglCnHDCSlJ0LFkmB7dLP+Hj7Vdiz
	pnWz1oV8+XlCbk7xlKNjnshRubYqkq3DyaeHr01yJ6gLpUQqiKq0fCvoT3PqwiZnTNqHb
X-Gm-Gg: ASbGncsWBDqzrfRkIshEScuhuCvUv/s8uzUhxV/dWz2KW9eZ8qFZFm/C233CGKMItJz
	RnfdP/r4gtzlmKuZm13EPgUfg98YNxh7k/Dnim1cnAsyLQCnFG/WmwW0NRDFspx75mrbpJbiIlC
	jAoDODTHjyGblBll53AWZpTAzSrGSke3RS9YdRmDJlLLNPISPIkaRmeS4cwXRPE8bgKfZLSZmP5
	G274ym1+LgjZM06XHVuXh1rBY4so1oS8dqtqUeagv1u+6TJXpUJ8pHB86QRI+ONPVGdQL1aHrTe
	k3w/MZVGghQVzGQ3cuYAJ5R6iGqkMM5Y3SeGMmARJljVTPWtcAJqTeigtra2an2vpuTzDkPLWNR
	n69nZY6zhJbiHu9xuIj2yLg4UHaHPyz7mS31fixx4iy2rcijKZOE8
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70d971f69ffmr70804586d6.13.1755957025467;
        Sat, 23 Aug 2025 06:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyTpNiIvNNs3fPAEjRcZ3bS7cPtXKDiw2pj/9JSAEBFNfi1voXXeGw+P9flbkF2otl4ev4xQ==
X-Received: by 2002:a05:6214:c81:b0:707:4753:bfa0 with SMTP id 6a1803df08f44-70d971f69ffmr70804426d6.13.1755957024980;
        Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5fc05bsm5159881fa.69.2025.08.23.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 06:50:24 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:50:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Matthew Brost <matthew.brost@intel.com>,
        Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Danct12 <danct12@disroot.org>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-ID: <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX8/45ZU9wd6qW
 mTaYLEpxWrLis9cnj5K/4S8LwJNcqrjz0FZyB+6uKtqNDrepolV6jPzd7wPmXMNo0pGO1gTqEP7
 wwF4XgeCcTd3OvEefVdjbg5lGUQHKDqZSwYUvSxtK4h4lqyFJMcdRsSrA47sxHfvu9gsx5IVmrh
 PV+JQCvMjB0b+b7t5tG44usOhsG2EEMTAVRpCE1lqxW65srdQtfXh65wXHTbe1BOxhHHpYjLIQE
 3u96/O/4C5uzgtVdFmjzbHodubGJSsnqVleMQVglJYA2U+lDVZ5j//mNuxTL0ntZsjVpvAdTpdb
 y+g3FW9vzaO0cINJG8VjCm/ohy7FniRX2OStjtTvqkUqS1a5c8Y2+s5GeB24aNb1RcXSzlYP+XK
 F/U9jPHu
X-Proofpoint-GUID: ukgHJCvzv62P7IPjdANHjOZEAtiPC3nk
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68a9c723 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=e-On7NsmxptUPx_5N0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: ukgHJCvzv62P7IPjdANHjOZEAtiPC3nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Fri, Aug 22, 2025 at 05:14:02PM -0700, Rob Clark wrote:
> On Fri, Aug 22, 2025 at 5:12 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> > allocate memptrs: -22" errors. The mentioned commit reworked the
> > function, but didn't take into account that op_map is initialized at the
> > top of the function, while ranges might change if GPUVM is managed by
> > the kernel.
> >
> > Move op_mode initialization after finalizing all addresses and right
> > before the drm_gpuva_init_from_op() call.
> >
> > Reported-by: Danct12 <danct12@disroot.org>
> > Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> 
> Thanks,
> 
> Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

I'll also need Acked-by to merge through drm-misc-next, where the
offending commit is.


-- 
With best wishes
Dmitry

