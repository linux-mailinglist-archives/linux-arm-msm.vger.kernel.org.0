Return-Path: <linux-arm-msm+bounces-75750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E40BB2343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 03:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B916D16C96F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 01:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356DE39FD9;
	Thu,  2 Oct 2025 01:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZphk4Nh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899E6288D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 01:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367033; cv=none; b=JX2nf5RznZ8jH5hoZNR31XqNADna8tTn+M6fPjy+o54b/ot+hU0oJwaVhACG0xgQMqIs3uBZHDqC8Cqjy2MnxwB3W6EtIeQKDgUNV7BiO6EpNC7A36NZmmM/FIFAbZi7iQVwpIoAwE/WT0B9ftAPyHUj1U2fcxD+C2XrUx5wHv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367033; c=relaxed/simple;
	bh=5Ie8hS7ySudMhvrFQ120F+fE0XrbFcZOgEC5UeBk4IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH7RhVlkaihrurPkoTSwLt1pdW3kAd5EdAAQvYgYl4dyhOFHW2ShscNdEoDcwZ85HMH42CCjUL12fN10ova11w1/59u7d3+qyxZ3PCo1V+QTFWLcRGSpelPOEw54WfvCJXIY9gUmfGky/p8PpfXg8RI/3OXHbd6pKB/adNpf/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZphk4Nh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcQdV010615
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 01:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fHrr65lNXuCbU7GLecWRSzb5
	A4LI0xtyUM7m4ktwrdY=; b=IZphk4Nhg0W0DaJgkAk/2l6BgMbcMbaUAmi4e2Ht
	zf19C5MX1zPKhZOFpiLyarnSwJE4FCZ2/9iUjXgoTfvUPKGQpWBO0HPZFzEhpVFm
	qd+sPnWUvm0ei5lCm/U9NXCQUiCqgiYadMkQla56TJFVuNOYiuWrHHTVk8FvpyxB
	qqaJSTm6N02CJLa6o+DbETd0IHyz/bxBFo2F65K+1bJw2ccYTc0kpMh7Yq2pFNm+
	qUbPTcbjlatp84jBLUT++FCoZDsO62ewDaBV4l1KmU4JbXrVO68H03uww+Xa+vuF
	fALG5LzZCoGY2nYVuFutQWPJ/3if8tMPbU+tmxBtHMD4iA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hp1sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 01:03:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dd932741cfso12846481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 18:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759367028; x=1759971828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHrr65lNXuCbU7GLecWRSzb5A4LI0xtyUM7m4ktwrdY=;
        b=fralRoKWQL0+ms+iv38qZVV6sZFdrAUObam87+V9tZbVKe4u6GQwcJX1d6Z/H1AMIg
         AmJMsfKDq95vyRb2YuagUD0Vm2hZF4HXUBCZSc/2oLb2tQXhzgFm7WyfcXYkV7mhgGmg
         vNaTGUGJ4wh7LbeVakHhZ+QCcr+z+/3S8+d2VJ4KkWJyAQ66Z1Ox6+TCxL3erZVlAnPG
         QfeVD2F8pubUsz/5NALP/ZuI+PdSrQhebr+piLHBjAsRMLX3pvo3aBv88tIvyI1KAhUx
         VZwD4g3rn6/rPTgzx14kFZqPwatSpPdkJqH1VRVclf+K665FxbuClxIJhO5pBGxoKHl6
         kxrA==
X-Forwarded-Encrypted: i=1; AJvYcCWjtS7IAicFxr4IAwmQJMLmv7+sVNRSeVnA+NffaROX1rKGX8Af0N0VGHeanOp4NWpAZuVnND9HhYJuFCu2@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcaWZ7qu5DD3CEHBhr+O9N7WHSnB3+HzSC4XqJLWGKPXlDV/1
	Kc6fO26bck3u5QXilL480Pxp4C+JOqY51DH6jteOmH6K1VmFdOpoyWdHJgEsKlDZGN+9LuVOzxh
	VPSE1II0Sye2Gfiwor7iYfxGKXvccEtv7hfSH6UrkwB5qpML8FnkhkRQw/ZFGSqEVn5xb
X-Gm-Gg: ASbGnctpWDEymYstvF8LsoGKboabKty/Ol+q+ABaS/6ZwFOD/5bmNKMQgwZIPEzkXKI
	McjrXMx8n7s575242DHMpzKng24FhycXVpRgFaLvuwHvJv5258aKVS3I55byAoI8GNSLc6VAMYS
	jwhVOJnu8F2V2+Oe3h9zG7DsSQ0Nzb1MjQ68zNp13DL4aZuJC8FKQ9cARrVLSCiW2YCDBuYiBZL
	fM9gHkwvzT1ojGzOMzD+hbNSR2nC0Yv3avIlh4gVSEjwNLHpXt9t70EYKSXNibdosbxEADB+2Sw
	lYaI6I0q1SqEzcFHNhrBBaIB2iM6X/S2Lq7u4wKTDcHkw0mJRuxIF+RgbhRqXGsWdsN7r5OBfj6
	dgf8ljMCUWHWMhg5SnKaO0VPVKNEHUvs1jA29EvDShiCBqktQSe9rSNrBAQ==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4e41e5453cfmr73046431cf.66.1759367028493;
        Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+PPEgu5a9spnGcgbd8IPDdjH3CRYSnDJceqwk4HUzRW0WSjlgTwcpzIm44jNRFI2tTLMX0g==
X-Received: by 2002:a05:622a:1cca:b0:4d8:afdb:1283 with SMTP id d75a77b69052e-4e41e5453cfmr73045961cf.66.1759367028031;
        Wed, 01 Oct 2025 18:03:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011b140asm337846e87.133.2025.10.01.18.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 18:03:46 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:03:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <eicw5g5ozli6tvcsvxdorvd5ymxizidodbrfitqezcezwlzdli@6koxrgnu2lj3>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
 <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
 <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edb8b0dd-126b-4ed6-8603-119f1fd52baf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX0Nr9sd4NMuFy
 t8vtTAYMszAmqjLiV7sMPPNl7xuf+Lc/aPwzDsFrZAj9RzgB9yeyAcxA2CsM6e3Br61VIw31mLs
 nDoMo6Iloai8XbZ203gZqGi9C4g3rL684TSMXxbLsCM59FH/zwVVjYPTX7o8QY9iUkThyYhfIig
 MTyYuCFoRQdrxAL2s86iY/FqNGuFjsOiJK9ct4yox7Ero+cO5ON0BhKn0FIUD3abzzLa3MBXzFj
 xlR4OgEuEVxB2WkQhykw85MDRQ623+vihlhIXuLOd1mT1erYRt1zPQ/P/5cc2YN7jP3vdxMkt46
 PQjutvvmCgY4GGej2SYKocdVhqXGZ/atE+6oXImrtdPe8DzGMeaNgOTCo7kmogp2SHcj/p0w2d4
 388R/dU+QXkMu/dAv2rKtw3Rlg2WEQ==
X-Proofpoint-GUID: sqlvbxHePXpSaH74oifwIfriCtYuYwqW
X-Proofpoint-ORIG-GUID: sqlvbxHePXpSaH74oifwIfriCtYuYwqW
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68ddcf75 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=93h1c-cikf9FHO0Tq-gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On Thu, Oct 02, 2025 at 02:52:35AM +0530, Akhil P Oommen wrote:
> 
> 
> On 9/30/2025 12:53 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> > > GMU registers are always at a fixed offset from the GPU base address,
> > > a consistency maintained at least within a given architecture generation.
> > > In A8x family, the base address of the GMU has changed, but the offsets
> > > of the gmu registers remain largely the same. To enable reuse of the gmu
> > 
> > I understand the code, but I think I'd very much prefer to see it in the
> > catalog file (with the note on how to calculate it). Reading resources
> > for two different devices sounds too strange to be nice. This way you
> > can keep the offsets for a6xx / a7xx untouched and just add the non-zero
> > offset for a8xx.
> 
> It is not clear to me whether the concern is about the calculation part or
> the xml update part.
> 
> If it is about the former,I think it is okay as we have confidence on the
> layout of both devices. They are not random platform devices.

I'd say, the uncertainity that in future the offset will be the same. As
such, it's much easier (in my opinion) to introduce the variable offset
now.

> Also, we may
> have to do something similar for other gpu/gmu reg ranges too to
> conveniently collect a full coredump.

Don't we collect the full GMU register dump?

> 
> -Akhil
> 
> > 
> > > code for A8x chipsets, update the gmu register offsets to be relative
> > > to the GPU's base address instead of GMU's.
> > > 
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
> > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
> > >   drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
> > >   3 files changed, 172 insertions(+), 140 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry

