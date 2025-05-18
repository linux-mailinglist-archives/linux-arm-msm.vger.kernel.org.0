Return-Path: <linux-arm-msm+bounces-58305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A63ABAEE9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9474179BCB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30957207A22;
	Sun, 18 May 2025 09:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX1RZ8in"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E485A957
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560004; cv=none; b=nVzp34kk5jM15ASzqJ0nvnBlDDbOzg7QZ28QNzIugmhWTmyuJUC+CYrstsFJKG7/XrFfk5eEavgs3AMhn5b5HvkOym0XCfGHiNbo29qb8JloucOOdxNwM9d/8QEj+Vco+N07ShMnjMTcpV3T/BYeM9hcFDH8D3aGu/qqf087BZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560004; c=relaxed/simple;
	bh=NwnDkYuJbO6baWJtDzJD+ac3AzyxLIg8DB/BTRCMFpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uecCLGpZhXNf/cbmdkumq0RXaHnUCyqq0kbOJ9YxrEBT/n6AbIVwlbeeEK/3S9Rgd4lG/L2YngAs8g5a2uU7Ky2MdSSyML2DOIRvhhlOfl/sSJWKx7GMyj5Gc9A2TDVmwJb+C6z+6FyK2e2NTW6zgwxMi7/VDLI+hrl5MwKcqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IX1RZ8in; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5UZa6027910
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XMNoRzvP+dJ2IDW6flXZL2r3
	UaSuQqsk3IYkQeVyCxU=; b=IX1RZ8inQ8q8VUsI/v2YFQcc9kdmPTplfQM01Hjb
	cPad6MO5J0eXzOEx6nVFBWAYs6eJCod9sofTY9NUtS7qEn8bs2AvahcDnUTEqlD0
	zw7tiSviwuDTgeGXh3K7pOeUg2kfOOvTqVoDWzIXKDTyCK2u0s1R8Ceo/IuMbcpx
	MizoGebOi5NdE7/iFHf2OYPFwNGRbbGw/sv6Qoy3ubogee7hrApQy4m/gNxdCrW6
	pzOomQ0Pp+f9BdRAiDGR85tii3XOPb5ycDPsl+KCBk+THYgCLP+u3Ny8OeL+OK/6
	kMdZNgWO5gGh7hvKkViulU9+T1MsDP6SiNPvt056WFb4Ow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesrvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:20:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso1685816d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560000; x=1748164800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMNoRzvP+dJ2IDW6flXZL2r3UaSuQqsk3IYkQeVyCxU=;
        b=MAFRSSYTuLbPcDW/Vez8oA0NTyYCHpfwutpRxT3MWwWuBKBtpq3I0i5mAMW8yf3662
         W20YucC9tjuse2Zu51A6cWRytQ1OouV8M1PiHbtrWvoFnLY0jCM61n/IDV4WSjZxKcTj
         O+YQZPfmLCwWULIzR1jnLLjnJ2A9k1XSn/ZAD9UwgMOpmuacuwoQsKx7oyrcsZJUhsUl
         PVe7ItNGMgJ7R2SCn6/forTVdyg6TmMqDNEXPGpVyHte9O/y63cs8xGvjevykldKVBu2
         RmbOy+49B8XfIXQSPmB2kSF7jNk8a8imgCMN+QU56tUfCKGkEvFcZPh+P2mfIprYxon4
         Uzcw==
X-Forwarded-Encrypted: i=1; AJvYcCVINkVZLmd3+gFnr1/WgWO0Rdw8EjZk2KcmGCdBob+NUdBHfySuFJpBkK+ZFaKasJXwLxIWrDaCtA2+wrAC@vger.kernel.org
X-Gm-Message-State: AOJu0YxNI6fy1xHJRMrP8R9EKu7iz8XFnBUglq9Ga6skdwrLndg2ObBU
	HupAQI0wPd1Kd3jRvNeFpqUxT1X8W8ebUxJOKLXMP+ApmDVnQIscBET9Dpv2vpu8haYwRhCsJdE
	H14/nJyddA5GYsNeIswO9XI7BP3LJfg+VjGI9/vooT/XdkjPmv8Y2kjRiap6TrgLO+w+a
X-Gm-Gg: ASbGncuw2HyPcb7OzZYuiOmtAzlpNOqy0QexbAfnY/wm675yIkFp5sbI9fCK33Jo9uv
	s1q6jB8MdKwckgmuBEJNznOuzA1iz+lhsGH5ngTzQNqm07yRXUt9SDZ3p8SgiEK4eZSlSBlSxtF
	MX11vKHnUayHz2Y4TpyKU05d/x5Lz96tnZRWyLymIW3k7qQcSD6ghpoXqelOWNwZpUWM4CdPJOe
	5stZ6kYcxy64sBpcJhihNpTs8pCGu5JUDgWYaRXRkcVgXdrFn/RLoTJY+wqOBXgsII9cLOQZqZB
	3AZXkIEvl2fyH0hANfO6B43RqbbywFjdRu0EFjTMqs4UgICsvAP0DiN4N9E/NcG+vYIfGmJQZyI
	=
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr91753796d6.5.1747560000354;
        Sun, 18 May 2025 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4RAss6MeIbi1hTLUR3LACX5ncJPrM6W25dlFKp7HPzQXdfR4gH1QWUq4qPYEW0IMg9QDf2g==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr91753586d6.5.1747559999984;
        Sun, 18 May 2025 02:19:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b170esm14076851fa.15.2025.05.18.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:19:59 -0700 (PDT)
Date: Sun, 18 May 2025 12:19:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 03/14] drm/msm: Use the central UBWC config
 database
Message-ID: <bcsoawpz4kxuyjl4e7gvmetqtozchsazpengerm7wmkkundpal@2picdwukiail>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829a641 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: v22x056cyk-ZyjAD1FNlv4-g-klWy0OW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NiBTYWx0ZWRfX6GqUtcjlJHsB
 XVm8ENigMreN4KcAR6g+oUuhB4CCw3QXykOC+v7MMwQCPYo0OVMgJct2SDzCkERC+4nk3BVx3AO
 uQx0D3YmaIamTx8qGUaAImCzSgg7Mxo8u7TCGd5qvl8pDJfJ3qmnUn0ekx4P6fdMI7XP9BMq7e6
 i53s5YYVey0G8Rb4/rFyzoVYBZKvc2+J22xGbLfDUwiv4WLxxgSdJOfDP8/u7WMe5iy2rbVL9xD
 Dv/TiZnVDBQKrAUv3iRo/fqBR2c8VblMPPc74Qnco7jizAgZ0EWIZy0LiIl3yU8jtCuuxs+CyWh
 R5MRkqsQ8ybkmdq3iZ0C5NEDCrZvTWJO96NLfPDYSl5f15GnCZm2aOdkk/IxpR9Acvaarfgy3vv
 9qQHb+TUcRNpXonrvBgVSkNA5dchhiZzfo8fmRYkTp8Izx4MGs93FwRbruKvIBBghSm+CB0i
X-Proofpoint-GUID: v22x056cyk-ZyjAD1FNlv4-g-klWy0OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180086

On Sat, May 17, 2025 at 07:32:37PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

