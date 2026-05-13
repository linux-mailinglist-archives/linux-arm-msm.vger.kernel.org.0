Return-Path: <linux-arm-msm+bounces-107268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPGaA9BkBGq6HgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:47:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F845327FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E659308B795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3CB3FA5C7;
	Wed, 13 May 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuThW60V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7b/BDT1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719F39023D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672814; cv=none; b=tGapfQ5KbmtAhTAJecUPzo/ypdGNW2uoSX3S//39/Nlvcgqlxqgs4/U07VcBFXvAn9/DZPDyUeTGXHdqRRp1ktLsCptxhNfeGUzw2pEfmr/WDO4QGdVArU+eoc3Z74qAUSkzIHphvsRu1ynViRpfJ2tgrp/CDQIxOahhhe5D87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672814; c=relaxed/simple;
	bh=ROMucc3vCxdWhmokAOwXqjzNRZRsmIJ6sA3hBsIP/3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q43NkUg5ztFhrMzlXywowHi7PqnMRNfLZUYwCsTfdhIs1ejc+z1h9I66E4zhzBejaE2aJCa7e+xTVkg5pFVrpkUVIEjUvt9MlNDd7IoavNeVYo0Iy7ow8sWJgOf0s+LY/vD+ejz2o6S0uGg3qrKWCWHw6fVhWGKge8+PFnIna8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuThW60V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7b/BDT1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVGTd3430119
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8DwTPFs9voIwT/jOGMPeySdY
	1JU5Emdb4FIX0GL4csw=; b=WuThW60VGt6t3oeUr0jBXXq8b1+Og1QOUgdfluiA
	4MV56mTSZW3tIuZwfMXIybyR2h2z4Taxabg2Eq2U62fv1Zq2BLfIZ0uxvpPDhEnF
	eE8xkgbPE+hpxXAfJWgAiSiy5NVarIxW4wSbx7linN4SjMXMAATaVSh6Q3s0ZETM
	21Dl1QdRqTfDyLWm1IVyJE5wgWxHI+8eRh51eRwvlWozSgzk28xpkQqhc2vsTSmz
	uMcZ/RggrDTLXyMF4Yx1Wq7pcuCKXyZ37LZlTMwwK3p5I72QtNxqqdgR231R16P6
	nYhJ0sFmlcWhSO+eUrpz1rrmYt4u6ido6vCuRHJ+rcnPwQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg8r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:46:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514d2b22e7fso42191811cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778672811; x=1779277611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DwTPFs9voIwT/jOGMPeySdY1JU5Emdb4FIX0GL4csw=;
        b=O7b/BDT11EvKpEMjno+uNKM7+yu8tAfMFugyCa5m5f7sMWbyv9wjPZFfApwcRPqiCC
         kFuogy8rr2pMf/vPgs5GmaT7iL6ESKoth7CgHZdXHeIKDVWE0TJNiNKf8FkWl/P6etpp
         VxH/BAl85RaZaTiRTRJDO/XkvuPK/qyPceo6mjCn8Ur4LNSPLtv3wWoTA/Pa1YdEMhtZ
         NnVjO4PEj8tS1sj2M+w1EU1VkY8wwgLcbBQobvldBj2qAuQRb4Wc5dX9aBjMXkoPqUeg
         NMJ9y5oH/TKEhfcBlajqP4st0Alzf6sCC97UVZcpgqYTFZ7M5H8l2Bh0g8qiTwWH9Y+J
         FRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672811; x=1779277611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DwTPFs9voIwT/jOGMPeySdY1JU5Emdb4FIX0GL4csw=;
        b=bVySKo+xPfyqo4znG+BIF/saA5VLuSg9QEHehFo4Y111/TWPx8QD7u/qpvDjrYsBvC
         IVMfF1tbvc0OQIM40VGrcz5LrLZi5gIMvPUHmJzhK+ZN74PcH624iXzsuP4w1O8avUgK
         YizYHEEQnW6uyRmVN7OQQid1H8jk3EqNTiG3ludI0GAsTgMBisDu+q1Wfy4rDNz288/a
         4cOiu5Wq9sdPV3jUzd6tl4E2jc3umAqy5bs+URH9+tikEguIyxS0oxRJL36BhppSutCS
         eMjWkxTHyPgmUymcWfK6RCFDPohNsDNsJ5DOqPqXN47ZPw77A7eprmbnMRs2s3v9Cxhq
         CBig==
X-Forwarded-Encrypted: i=1; AFNElJ9mmT1c8zh0Iz5yzetavO5QwCrsl/9RjKOuFYG5bhRpMStKpF36bXycrfQtBfgEkzl137LM9BAIfSXotUnA@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPTWVbkzdbr3NTnnXKZ0QcYNHZYeXbBWUB7wvGMFYSJ5xtdsP
	4bggMGSEz4jRmTWBMIDhGcR76ySeOXLYXR2kBKWfMd/onXZPaoCt4KGq24acOjtVhuZnmTKVg0k
	rAZIxegQksAgdSYyda8YKQcHajbaC11ZgGARZgViNyo7E1Zqi2NPxOgtavlsw1Vry+ped
X-Gm-Gg: Acq92OG70PDXkACUl0471Q/db0cE0D3XXhUKpDEhouVcmZXKH3d1iLG+Srfx6PsUyTd
	8AZVE2Ph1xVDpRS1aBJD0JNIkCAxU59QSeJNcZL9haGWRt0X1PBk/b57Jw6cx0gKyGkcyefd4F+
	BHBZ4/OJRLtj/n7hNnyA288WI55+mcjHDWr5q86NSdxsRUfxNPqrEgtSvNL/zvC3y1x5re2jJFo
	qxKKGhXYg/8rLpigk3k3gsEOfj1FKWFWij2IfgxWU2py15xoHIMtojmFBNBTeYyojZB7y/vGN3y
	Ozl0Y6E0F2FLiBTTFFa0AwyLmLbc7I7XODI+uZAjX0gvOiyL9C2d9lnTCC0Rqn4aSRYZVQMo6OJ
	fzP9eCNr9+Xx2jbv7EyfcdWlVoU2LzhkSfawXsh5IXrRLkFoACVCkwnYXjmSlEalRvWgY9ohWI9
	6riyd8JdYBt63S5BeFaiSfJ/hzPE6kWV9s/ss=
X-Received: by 2002:ac8:7fc1:0:b0:50e:5acc:e795 with SMTP id d75a77b69052e-5162f44054emr37928041cf.9.1778672811223;
        Wed, 13 May 2026 04:46:51 -0700 (PDT)
X-Received: by 2002:ac8:7fc1:0:b0:50e:5acc:e795 with SMTP id d75a77b69052e-5162f44054emr37927541cf.9.1778672810669;
        Wed, 13 May 2026 04:46:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f62693f8sm40592541fa.38.2026.05.13.04.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:46:49 -0700 (PDT)
Date: Wed, 13 May 2026 14:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 5/5] drm/msm: Attach a driver to the GMU
Message-ID: <a2xdoumdiwoau6f5hsjiuueiemisbj5cpunyodnj2gcfyvjocz@zajjyoxkm2to>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-5-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-gmu-sync-state-fix-v1-5-6e33e6aa9b4f@oss.qualcomm.com>
X-Proofpoint-GUID: LvRIN_xwoQsF4CQZ1AH-eDWXZUJiRva_
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a0464ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jYtgZKLYjWWl_Wr8lb0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEyMyBTYWx0ZWRfX6P0OOsz2LBRs
 QK/zjl97yMxR029ChQ6wLrfFxD9hAa5Kau1M0+4iFI1Z4GVvYLRiU+N8B4vvw6+qgcZYsv7FtoE
 ERDw/mL66H8jXjncza9htSumN9BnRt6uj9BA7L/gBQ11/992kIZTW6lqp3doQgkWXfaDSqmfBGQ
 Vo6fr31PjFSDiyrZMbj1p/aGyj6uF/q5BffcbdJu3uTQqO9WU2Q8XZhxTif5UWRpLY3IKMV2Oi3
 EO9askjTTnjOnTSzdZoJLoM+1iZP1FjYV0IbZ40rg4TuS24QfsRdoXSVkrB9UWL59AEjimfe8jT
 +QrAFN+9BZotxADrVjKnIU/WVYGr8BMU/6meBy9Ps6dOByBMsulK0PdjunbzeRiJgRG4gSfvJpx
 Cf6odMokqJdVmOMYREKwzdpVLErd19l+fP3xLHsa8Rm42BgedVFzzMsRXlvI4Xt+UiBcbuXvo28
 RLA4L/uUWE0sjlyeeVg==
X-Proofpoint-ORIG-GUID: LvRIN_xwoQsF4CQZ1AH-eDWXZUJiRva_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130123
X-Rspamd-Queue-Id: 75F845327FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107268-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 02:23:00AM +0530, Akhil P Oommen wrote:
> With the introduction of sync_state in the genpd framework, any consumer
> device of GCC and GPUCC which is not bound to a driver will result in
> bootup warnings like below:
> 
> [   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu
> 
> To silence these warnings and also to have a proper state in driver core,
> attach a driver to the GMU and set it up as a component device for the drm
> master device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 70 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 30 +++++--------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  3 --
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  3 +-
>  drivers/gpu/drm/msm/msm_drv.c              | 17 ++++----
>  6 files changed, 92 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

