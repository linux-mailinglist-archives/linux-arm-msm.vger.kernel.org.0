Return-Path: <linux-arm-msm+bounces-24388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5621919A21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702951F21B86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0510190697;
	Wed, 26 Jun 2024 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gPa83Fiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15F1922D7;
	Wed, 26 Jun 2024 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719438762; cv=none; b=FgLvg5Ia4prbnhGyq0pOS3K8c7nj+rIrp3qTSUZc1I3rdg9yUhx7ANDaQJ9gUKPRhnMxk6Y+gFRuuw43NmMtype3h2uMT78helJv4E+VFa4QqY4avXUQE1aQ749+hQXsGQwaH2kNhcQ400uPyCsmMDkgD0h8uUtWiRsvAX1+8FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719438762; c=relaxed/simple;
	bh=Y+x9BtaJ2bapvPZD4h96tqXA4NcHmfAx/mP4JUXzpjE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaH3yP0+UoIt1OXb213Fp7zS8kv0A6e0SvDECljq1rrXFfoj42Sk2dYarVCQWEJzlLE3UpJWn/kf7eINImyMcopPaq56siucbtpxD38xcO7ct2B0+0MifwCChXjAbAHnAlRd7KP3izTv13pElgapdP6mzvsmlkr2rJUPJpU6U7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gPa83Fiu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfUup022696;
	Wed, 26 Jun 2024 21:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qIwvRHU1HPsS7DudEDwvKVGI
	UGLiVRN2T5iRCevDCoY=; b=gPa83Fiu0P/zuPWJefsmy+XuGboc0ZvleC/eQMpg
	eDI5Fd/20xvQImg92bABhV0oDwFIo+Vtt05E82KphYWAWImTYzuF8Bw/UN+r2y9t
	f7tZHwMYN77qGrqWzVKtVWGLJ8Av71Lp0XsIrb80ZOaVPtg7K5DBtvhJfgNu8Bgv
	7MvTZobbqyA3SDi6+SFTfThYNRxuAIhJhAz0GduKKtlASYDHvWlVNtu0t6st0e5M
	U8f9hfhVokVX67WHSESRSyiV34YItv6DjPN7be06C7Er5/xq4sdJDkX9tI+klAO+
	nvp4tzFLsrDBfSiYVfZJM4bEet7XpTiniZBqCNVp/i+dZQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9j7v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:52:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QLqQ21006025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:52:26 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 14:52:22 -0700
Date: Thu, 27 Jun 2024 03:22:18 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: Kiarash Hajian <kiarash8112hajian@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <20240626215218.pnbzy25c74c7a22a@hu-akhilpo-hyd.qualcomm.com>
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
 <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7ZxKhyL2RdKhbIx27bF2rkglQuR3c--L
X-Proofpoint-GUID: 7ZxKhyL2RdKhbIx27bF2rkglQuR3c--L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=832 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260160

<< snip >>

> > > > > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> > > > > >                 return ERR_PTR(-EINVAL);
> > > > > >         }
> > > > > >
> > > > > > -       ret = ioremap(res->start, resource_size(res));
> > > > > > +       ret = devm_ioremap_resource(&pdev->dev, res);
> > > > >
> > > > > So, this doesn't actually work, failing in __request_region_locked(),
> > > > > because the gmu region partially overlaps with the gpucc region (which
> > > > > is busy).  I think this is intentional, since gmu is controlling the
> > > > > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > > > > overlapping region.  Maybe Akhil knows more about GMU.
> > > >
> > > > We don't really need to map gpucc region from driver on behalf of gmu.
> > > > Since we don't access any gpucc register from drm-msm driver, we can
> > > > update the range size to correct this. But due to backward compatibility
> > > > requirement with older dt, can we still enable region locking? I prefer
> > > > it if that is possible.
> > >
> > > Actually, when I reduced the region size to not overlap with gpucc,
> > > the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.
> > >
> > > So I guess that register is actually part of gpucc?
> >
> > Yes. It has *GPU_CC* in its name. :P
> >
> > I just saw that we program this register on legacy a6xx targets to
> > ensure retention is really ON before collapsing gdsc. So we can't
> > avoid mapping gpucc region in legacy a6xx GPUs. That is unfortunate!
> 
> I guess we could still use devm_ioremap().. idk if there is a better
> way to solve this

Can we do it without breaking backward compatibility with dt?

-Akhil

> 
> BR,
> -R
> 
> > -Akhil.
> >
> > >
> > > BR,
> > > -R

