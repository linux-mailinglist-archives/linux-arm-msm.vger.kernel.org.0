Return-Path: <linux-arm-msm+bounces-63862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D6DAFA690
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 18:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8213BA99C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AFE28853F;
	Sun,  6 Jul 2025 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2y7YQ7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEDE205513
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751819924; cv=none; b=Jrm2fiF+17hebgYgS4JGRd4pn1WAcT37L7fMwcN+jlTUw0R4UfB34ek+9mzT5ps9jhu2a7tvPiNlhWzI94DVPWaEUYNZqySkeM1Jev742SO6pRCUmIeklRKFHkmpfc8p1BG3lw5Jndt6m0cTuRIJTt3TOeoBujqR0/tuMwrVrj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751819924; c=relaxed/simple;
	bh=5M99j1ZrT8ju3g69LfK3KPx2hm0gURCFbjsdGasMAjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDg+YwPLvAd8A1UZ7euyRusf2xILsi2EDvE8cXM6+T78iDWqz/8gxwi/yE8Lp6Jss/3w1s3ckmnUoSVoyVMY6OzEy8Bk7B3ophZ9QKNyHyCDoAWRFahwC0/+bbvpXlNhduQEBqHc/flL1Gxl84pP1YmubAnyxJMmRjmPz3q+qpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2y7YQ7w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566FuNCK008925
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 16:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=; b=f2y7YQ7wST77nR9Y
	0dmZbqLsSojWomiKoPXDQm2Tx9yMe08UhqI1/UIC2HPcGjHQoDxMDEhbvYI2qvln
	9MKieWjP3cZzzEr2miqgvXN6xRrTwirjyMZeYKNZ1svvNUid0/VDysoNAYKHYiLv
	1JuJq9oxD+aFwelx/57fc7xkyZSg0CtIUe0kr9B65Rh663Mnbw9P4gaM0cWjvDzW
	naAhqyGUAVML1nVGziN8aLrHKbriiMH5Wu6pi7PddR6ocYpEWlvUrjCoeGIWSwXm
	Qx9Zw074VG+jgyYOh6/J+M4mGV5TdxZnhsOfFmP+1aRAaUy/ud/aGmd9k+fd/3Hy
	M4aMOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqdjhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 16:38:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso3323694a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 09:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751819921; x=1752424721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=;
        b=HE3+QonbQq0ljL93QbEUaar8jjGza6QryCldixclOFsv8p9u1JvNlZSYgq0Yh04XxO
         XXWHL0xzmoCJloD27qa1cVkfNbuTH8JfKLoodRfM5iSguFlYtUqORQCZt9EZV166xION
         Lem3xkLB/U0fYqmwLEqwDVJWM2jBMwEYZVFp38enbX054jhqTmoDy27dnbQNJe1vPwGc
         KAzH8xyb+jxNKhIVbYSoF6+mFnts3PczdliKGoHY3dBXClBQQmV/rc2ArNR33XVhOB7D
         2oWZNxYuhnq/qgtINNsRpTNs+v+Vg//+b7ZtTHOl0oR+x1HZyjs9vlyTe3erp2wo/ZvT
         GHhA==
X-Forwarded-Encrypted: i=1; AJvYcCXHIfzHIGSfMtwYskE7E0NvE9HBxOdlXr2WfU/sSjMMTZl63x93IH+mt59R8Sq2e2dv4+AIbYS0+5pF6Bgb@vger.kernel.org
X-Gm-Message-State: AOJu0YxC60KV3QuIgs8j5XUgHnh5B+291VQPPdhTpWGIavMXjJ90DIpm
	l6fcbI2uwryASly9lqv02UH1U/wmb1Ps0C+BOsQqRPx7eY5IUlJ351BYS3sRP8j/cgpwrT7ELW7
	ZrSlJZ5262Hy0HABKmXdj0EJE3W0Zf3UMku8hksZ2tQagZqmnzHFU+r10EdjhSnHIwYLM39nIux
	bRSDHD5mpVm0FWA/j94Peyt3vgEaM/Bo+3T4pdX8+DkWo=
X-Gm-Gg: ASbGnctHuKuM0pLIuk9mYqNpOHzjYXseNh3Vzfb4S9nb2txIMwBup245pZu34ZbGqQj
	S1AIijN6MWnbuuDlY1uoniPfOFZao8BQjnQq2FdlPgIlp1GHOYSjYhVinZmzGE6DxJhG2ZG1PFY
	ievLfY4pOKjtuSPUWtUw==
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id 98e67ed59e1d1-31aba84339cmr11006880a91.12.1751819920705;
        Sun, 06 Jul 2025 09:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcKhJtg3uXFrqq3g0A/eUGQshjmCzCt96AqXzmSmxuXG5dupDH/wUPqNaPHIQ1Cdxc4V32m2fmkfrBgi4TMS4=
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id
 98e67ed59e1d1-31aba84339cmr11006847a91.12.1751819920320; Sun, 06 Jul 2025
 09:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:38:29 +0300
X-Gm-Features: Ac12FXzV1gqekfRsne3MkAr_DHFG5FtNyFV-IwP8Z86RpeoBmSFTV-zGCH7MKto
Message-ID: <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686aa692 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=K0SaaKOuJfFG6UXcetgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FeFBc9ZV-_uVhFGAX6nN-Dn8LnyYopR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEwNiBTYWx0ZWRfX8MV7+/AntItP
 9JnGI8HBFIFYH5bD7ovWLCRV4nOMUPHobpGOoHDINaZ2tIDFvVHXqN/bjarGFAldgUaBWuO+IlL
 sG2Q6WAl70c8SlWx440b0TWZhPjP0QTPjey+qpDJ8M/FlxBHudPfkLJnOCZLpWulBRtrKPHdCjP
 2IJUCsYrvaUzYVcdC2lTWOm7eIyqB5cs0sYNCZuOLnTPBqFebmWV1c90JlVDez2u5nRnXFVq3p2
 QY6a73gdGhkmCm01sHtlb//YBPOCp3g0rW4B1ABCjnCx6Lm8JqUSFAUCW+scQP5FQuoXAc7NRtG
 CH4cE64ozZK6rURAa4DJBg00Dz+LM0ZbL3IN44JjJ9IIQbTZWkh2yCQbH4x3Ra1s49+TWYOpyQW
 OizIfG5VB0xqe0Z+YODmomLlte39UwVzNJAVB+vTUJ3pf1M2oc7HidfMdu6L5evT9RFDH2es
X-Proofpoint-GUID: FeFBc9ZV-_uVhFGAX6nN-Dn8LnyYopR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=467 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060106

On Sun, 6 Jul 2025 at 18:20, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.

Indeed, write to ACTLR seems to go through, writes (or reads) to
PRR_CFG_[LU]ADDR cause a reset.

> In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.


--=20
With best wishes
Dmitry

