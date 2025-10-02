Return-Path: <linux-arm-msm+bounces-75754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A5BB2382
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 03:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11BA24281A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 01:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C50235958;
	Thu,  2 Oct 2025 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAJ89+YB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E2381BA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367304; cv=none; b=Bh8qkyV1gPLl9g40UdhFVfj3XfGF4PcB601FpUMdh0o5/mfuhK2s7RDk5iIGnixBwI2QC+pfBZfveEtbeqnzTG2toxgjguzZEsx+6d82gq3iQvaDyHIdVKykbV8Mh9QDzDGfSGUIXL8VBq0B4sS51rjfL0CB8OtneFE5Hm64Jh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367304; c=relaxed/simple;
	bh=dW/DhybowRWYXC14CYAhqVflEVfToZvAKXTfoTEob2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qbb1qRjf0bqR6TNH+5wXkSISHm+PytCWu1WdVTQPdA0seTZASGS3qs+X570/tdbOFu6HFiZsZgkIFHAdDXTud2iGgmI2lMYI/ThRO5+lQiUf/y8BUCcMzDVSG+zUyPSG6Q2NI+xh/zAji2JrywlqaFt3E69BbGCi3fskj50P7PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAJ89+YB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic3dn017795
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 01:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=; b=kAJ89+YBtKdwEXA/
	EY/RUK7xmEzz0FzDZ2y2M4hb4nQW03UXjthgmqSMXl+ImeN+/c84JPJ4z8HcaqVC
	kGm6fdGj+l1I2rULN2UIyh4O0pChAybfBTc2nvMX6YO2tP3e98hlyY8LXxg1tNTg
	I6mEJCb8nERgWCIcFpiOcFKzJDTd5H28k1sXGIA9xlSAKhN7KwaLxPqz8+4ohQD1
	3kyP7S9zQp4J6FXn7fQft5TSCY9om/mTj+QadQk92PpVlwgMtKE3eM0d+RdDtAvD
	p3aHvlMB+EW/WNAI6VhRrzWF84AJR+Fq4DrZ8/VFS+Vy6CAfjtmkjdeGxqD+XI2m
	Vg80gQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf7uyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 01:08:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b302991816so9750551cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 18:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759367298; x=1759972098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7Od5VFbcggRAlxWiQ0g5qlG79Lv/bUugfwD4ZphtXA=;
        b=tj1FNDx8GDEQBHyQkSwVjghpUnZhdM5BSvh64yeMXtYqA3xrPlBtWntxZESBur7dp9
         tQDIUgqooBOSD39oPEcgxqT3EI6GRRJ5MaSPtaIOrSzPgiFeBKDY3OSZ72r1fQKbk94S
         3bbWLDfL0jAAl5ZOCIIG210YMuvIVEmRkmc3z8t1bIJqT+GKwu4HeZrWadEcgsixg5dQ
         ErWgjVwQPzT8S7DGqP+782D2Oc0tGFo+k0Iyk+83Eyqm5jj31yt7AV/9TSA4DW+qWh5e
         5j37XnzsVwxSWnitYmcUjHwmI50u+1jOhS38nJbDB/gtdKNwG61G51ffZDhUVjJCY4Sl
         CXcA==
X-Forwarded-Encrypted: i=1; AJvYcCW0XogK/tTFXcZL31NJ2e2BCW2UBEhSALFkKDDUcykkj0+XvcvAPOyVspd8Yg1xNRDMhvaT7xjLlwyfopsa@vger.kernel.org
X-Gm-Message-State: AOJu0YygUd4mdCbj8buEEfNAl/ocoJbzirKjKgEpo+i4naTL4q3g6JlU
	Pyzf9F7J1exgV6PSn6tw0UD+IZ9VyHlI5KN5hKwBaP5QL85vSp3XLZLtJ88nigbaVoYsLb3SRTR
	w0b47HjBT773Nv6AfUTndP/fjL26m7I49DumG3GZU6BrD3SfkzNnPiSSqrztiE0wmPPXA
X-Gm-Gg: ASbGncvBivGJ7RB++OesjiWgw3vEfB7/uYpgY7YTHEzQytB85sC4oYgbewHFCKvJR6o
	KnntxGmaAQKZkWnjEl7VZTaSsWXB9GC18giPFLjqgO495BUPwb2Tz9fWyvGbw3lxZ5ulqmktTzL
	1JzOhUzK8ZwcxU9RWIA85ciwD+qxJAmX+NCsQuXML/YNl0tc342C2ysHgg/TIZLbULV4lmnFHXt
	2cXy43ik+6jEt6OZm7ZsyUCOblFDApp3p2xBK6fhxZtbNRNo4clW5dgD9o1H2T4lLkX/lGtXjkY
	p21TpWlUsBzl/E83Jc74osvRdPKfxmINiw7gUJ26wVUbRXDtSFonh3axbeASBxHQc0SzuD3cP69
	vWSYFBxO8vofvB9wMLFE6AuvUV09FM78UgNw0tRFmRzC6gGR++ClWnmyzdA==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e41df6e97dmr78906711cf.39.1759367297971;
        Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrZaqEqf2UGQPe+mVMDuKAcfgbDUzaQ4FB8Nc046Mcl+O0GtaoEhYIkuD7lCFi+fSNe0W6CA==
X-Received: by 2002:a05:622a:53c7:b0:4b7:aa52:a6f3 with SMTP id d75a77b69052e-4e41df6e97dmr78906061cf.39.1759367297485;
        Wed, 01 Oct 2025 18:08:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba273eeasm2860421fa.9.2025.10.01.18.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:08:15 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
Message-ID: <o55el5zduao57uomzm6zeqslxjg7rtzfbttk7gq6gvsatapktx@5lflwspish24>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
 <ks3ppjsy35wka2at5nxrr74l5mvzr4l6ovm5ncohanu2gn3ytl@gt2mzwjehq73>
 <CACSVV00AFEJVti7BryA-_sosmBKCuDtX7+NEi4aL4X98AqR1Qg@mail.gmail.com>
 <CACu1E7H0Y9wLwN=ztx+YSQLMQuqOF0hYPqvF-VdXyFW65og6og@mail.gmail.com>
 <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <845ea929-d245-44b1-a0f5-2ea67ca595d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eokWgQRZ4Dz-0F6zSvj5vck7nFtnA4tp
X-Proofpoint-GUID: eokWgQRZ4Dz-0F6zSvj5vck7nFtnA4tp
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68ddd082 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3yd5t0Cfpw69QvuzZ3oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX/YgtRVusnVa+
 7mFQKOQCWKpYBWZtqRGmkXjohzF29VGvRdBDYCUklrkQhtFy8+03yBdQJr6PDhocebyRelPpe9K
 dDc2RgRmM+DNOsDEjKrOy3BXkuz+Yj23KyXGUuLEGLjoYt3q29q36VAoYRwFrAW8WgnbDgYFQQT
 7Fzb0Lkbn3i7m+Ppqeud4t92KtL0Xrz7+WMwFJs0/odaf7NO1FU1ekdOkyjkqqJAWXgg7K8BgfX
 cTmch8PFIG5m6d+NcYq9TIHPALSD6WjpGz/DZl+QYIkhyVOdazRSen2fBsubqHJgkBftXfNfNdj
 3w6STSmeXNHwoo3KLnd+J1DubP52hQHfNxMDQ/zMV7nYMAwuTD1u91ksclxhjdiUDSVUNzgOhKl
 LIDVzKnr5tIpyA+PgXl58YZqs2EBiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Thu, Oct 02, 2025 at 02:32:21AM +0530, Akhil P Oommen wrote:
> On 9/30/2025 2:11 PM, Connor Abbott wrote:
> > On Tue, Sep 30, 2025 at 10:08 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > 
> > > On Tue, Sep 30, 2025 at 12:43 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > 
> > > > On Tue, Sep 30, 2025 at 11:18:17AM +0530, Akhil P Oommen wrote:
> > > > > A8x is the next generation of Adreno GPUs, featuring a significant
> > > > > hardware design change. A major update to the design is the introduction
> > > > > of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> > > > > are more independent in processing Graphics and compute workloads. Also,
> > > > > in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> > > > > with additional pipes.
> > > > > 
> > > > > From a software interface perspective, these changes have a significant
> > > > > impact on the KMD side. First, the GPU register space has been extensively
> > > > > reorganized. Second, to avoid  a register space explosion caused by the
> > > > > new slice architecture and additional pipes, many registers are now
> > > > > virtualized, instead of duplicated as in A7x. KMD must configure an
> > > > > aperture register with the appropriate slice and pipe ID before accessing
> > > > > these virtualized registers.
> > > > > 
> > > > > This patch adds only a skeleton support for the A8x family. An A8x GPU
> > > > > support will be added in an upcoming patch.
> > > > 
> > > > Consider this lands in a commit message. What would it mean in the Git
> > > > history?
> 
> Commit text is not just for git history. This sentence is for a reviewer who
> is going through the patches one by one.

You can put this in the commit message (in the git tree) under three
dashes:

----- CUT ----
drm: subject

Foo bar baz.

SoB: you
---

All the notes and details  that will be ignored by git-am.
----- CUT ----



> > > > > @@ -2561,10 +2583,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > > > >       adreno_gpu->base.hw_apriv =
> > > > >               !!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
> > > > > 
> > > > > -     /* gpu->info only gets assigned in adreno_gpu_init() */
> > > > > -     is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN2 ||
> > > > > -               config->info->family == ADRENO_7XX_GEN3;
> > > > > +     /* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
> > > > > +     is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
> > > > 
> > > > Is A8xx also a part of is_a7xx? What about the A9XX which will come at
> > > > some point in future?
> 
> I think this is okay for now. I have a separate patch which reworks the
> cx_mem initialization. That will completely remove the above ugliness.

Ack.


-- 
With best wishes
Dmitry

