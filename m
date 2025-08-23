Return-Path: <linux-arm-msm+bounces-70476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CCB32903
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 16:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249FD16F2A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 14:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B71253B7A;
	Sat, 23 Aug 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSsFUZZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE11F4174
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755958463; cv=none; b=AyY6cOAnNU31v//gV6HInzujCKOvMrwY0d7rMxMUtpgHjwRAEzRL3qJGwp2FB9xIeAdz1qGOCY67q9jL+6j+Wj9qNF/Ecn9dOQYV9fThOsT924Yeh7aaxjZW7O1bBtyFX/AnTvmcBP0H1sqrXuFgS5ws5JBnElYVx9VHdZvIkf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755958463; c=relaxed/simple;
	bh=XB2DbYs4i4X+VPKmoYXjjnlyY0gzkDk0GEZGuCnLt6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2OTNLTE2+mYlPJ9xRO7yPSXmiV22YhSQTVuILxGtWKpbWpD9FCsiyD5fBWpEeXvOSM2Z1f8v+0oK2m3TOHsByTuVISAg1oxKiv1j0OIA31Bs+sT6AIa/yjWN6K3FTHQ71gU6jBR22hMwS6DNl6JE7ZSwK7UjDc2vKPn7DNSZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSsFUZZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N3fQaa003975
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hq+jica18d7wO8Y/ug5Lom/zPuKSHhUnRgrzqyuE1Rw=; b=eS
	sFUZZcCBTKkhSfcVh+qxTkj6/ccHad0WQS7Gexb1Tuylfp7hKYpzKKx90SZI2704
	17AjcJT29nIFjb6nDhVYra5c5npb0IMPngfPgN/85MWaXUDc1rHAcHz3GziDyuP7
	rkIKkRbV1zbgqcQ6ClaVrLYZbg7eb6e6zqc/574TZBbVxwAyvY7q76ZAPS+PZgh0
	kMNQK84DmDRIy04iEenOeIbU+XIJkEUQuDl0Ed99RkDXQ2P4cBmuflhAlbgPcGpe
	2sz0Ap1ih/jT9kaPeKf+YYQsRVRrwGBR0FgOnVblH6Lp6U/4bmriBl/JYc3fze+g
	qdv+aV44zQlcx5re9tGQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y58wy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:14:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-435de6f76a9so1192403b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 07:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755958459; x=1756563259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hq+jica18d7wO8Y/ug5Lom/zPuKSHhUnRgrzqyuE1Rw=;
        b=VNUKVhiMKS099xcb/z6NjS+B3/oCBUCphh7ML5ty8xvy4iHzrJ+nvu3wKyi7HurIS0
         xuC0DTNbUHokjvENFHYf+PVZmcsI2jDpEYD3/C14k1PLEBW+Oq4iuXz9cimlGAzhnnCB
         NmSCm6CuuHrtLa+/tgkRTFYfsZBCbopbOQGdA8dMLhnBLIk/Ytthj4o5iEt1iIczZu+2
         EhOz779DKg6QIx6qxuS6R3Rl44V0kcPhR3HgYXz7dVaqMYIsf8ISXlcBMTmjbWNNClGn
         L94Ckb8N4YXpPDjNLJpL6iXtIAzzR38L0CzNfuoCn8vMWBWhnTP2zz7Vb9+dQlf+JFjS
         s2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUjXh/iGaoQ6A3LwRniHYXq/5TurHa/nVLmFGqb7yUjsdAtX/nWsUhDGEIzNa0k5F8W/M1aDzZ+YqNILES+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywde8JAKyZLsng+GqpBUOYfBYrwZnhfYzhA4VPTn7bXkDMKdoba
	cDblo28t4gbAahgoDa6CBzkrQ0u8BAererLFN3QPzBKW58JqqpD1v1ggaSEnql5xF92m3YMrpSU
	NTaL4iW8/d7B2PqmrqipCuL1sNXkF1lnDzb6xzrqWCzqkI3jk1KrjjFpq221aUN/9qJ25gMzMmX
	INrvfQy6resXmbesZekfXOMqM+Tza5WaT8pftHSobOT10=
X-Gm-Gg: ASbGnctK0REifUgDRUtw+0P1yG3Dt0YomvfEbeWyUNQZgsH/z6zkurkcwC1OvMbSkCk
	81ejmF0P6FFXOOSFEOxwhzmK7IUCh/v/pVj1UtDxnRYXWmGO6ny6wYlNBP4JtsnoR0huXZAHTEO
	EVl6+nfq3tS/l1FffswZ+QRyHW5rZMBXJbgHMJ00tA132JszKEN/JK
X-Received: by 2002:a05:6808:bd3:b0:435:902b:ed82 with SMTP id 5614622812f47-437851c6f62mr3443134b6e.15.1755958458904;
        Sat, 23 Aug 2025 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaa0KNWcAiEqgNPw4u0S8UVbV1rBVNv2UYsT3Lse+1st1+/U5kXNW33XfG/8rpFHvtI2/bQLrM72oS057vff8=
X-Received: by 2002:a05:6808:bd3:b0:435:902b:ed82 with SMTP id
 5614622812f47-437851c6f62mr3443122b6e.15.1755958458496; Sat, 23 Aug 2025
 07:14:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
 <CACSVV005RPPoB=o8-Arvteaqbpr9n_ey7LMp7c6WOg16euxh5w@mail.gmail.com> <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
In-Reply-To: <qpde4x3tcultagjpflm6u4xulm5b3xs6ek54kek3sriyrneefk@tgygc5zeoxfk>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 07:14:07 -0700
X-Gm-Features: Ac12FXyq0kZZJI5O-DfBShZ4wpACZxqRul7R9cVVMfZTUO4D81g_hv8uQdEnXFk
Message-ID: <CACSVV01uwUZn5JcT4of6GCJT23+vzcnSR1G6_6_1WGA7iJNegQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed GPUVMs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3Za0IGce7lMq
 ikZFGS7lLdflz0gs3iUKncCXL4b6W3VMWQXFO2ntjmXaBD5KLj+O5rf9TGj7YxzwGgX+3SCg6KL
 c8eH/QqJLB3sbuK3SkcWZoPbQUzv6LhqUO9bqGDp4ZAbcxYDIYDr31Mzs3o+kGnUjyWGj65Y+83
 Le+U+cq7hL7Qf2gni8Lr9VcjNHxGhz+wa60VcSK3JJsFC5C1rZjAAChYfUcFSe95DOZroo3CdRc
 0489Jqn1+/S1il9Gv/Zig7m0dnNbBT4k7/rjpmGu2ZXGj4yF7hJk7/S7kQW03qNkjoqCBE35pL5
 wKHxT+EeD0tIo9x87/Q72G3Sdm80xLU2gPoz6zR27EThjV7ygddCsDcKUayglBT4KmETDxGu1gY
 OfCkwmd4
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68a9ccbc cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=LpNgXrTXAAAA:8 a=nYsNrKCB0-J-WGV1dNcA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-GUID: wxrPwOiBXtwV96_g20yRh5l_SV4q2Ied
X-Proofpoint-ORIG-GUID: wxrPwOiBXtwV96_g20yRh5l_SV4q2Ied
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Sat, Aug 23, 2025 at 6:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Aug 22, 2025 at 05:14:02PM -0700, Rob Clark wrote:
> > On Fri, Aug 22, 2025 at 5:12=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> > > driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could =
not
> > > allocate memptrs: -22" errors. The mentioned commit reworked the
> > > function, but didn't take into account that op_map is initialized at =
the
> > > top of the function, while ranges might change if GPUVM is managed by
> > > the kernel.
> > >
> > > Move op_mode initialization after finalizing all addresses and right
> > > before the drm_gpuva_init_from_op() call.
> > >
> > > Reported-by: Danct12 <danct12@disroot.org>
> > > Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> > > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
> > >  1 file changed, 7 insertions(+), 6 deletions(-)
> > >
> >
> > Thanks,
> >
> > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
>
> I'll also need Acked-by to merge through drm-misc-next, where the
> offending commit is.
>

Acked-by: Rob Clark <rob.clark@oss.qualcomm.com>

>
> --
> With best wishes
> Dmitry

