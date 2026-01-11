Return-Path: <linux-arm-msm+bounces-88407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D60D0FB03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 20:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B56D300982B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 19:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFDB34B1A0;
	Sun, 11 Jan 2026 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXaglRlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNcxFLio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0118350D64
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768160909; cv=none; b=PuAchO6f1GyJ6LsQb+DYrdyiu7sA8f/fCWA9FVR3B0wGjKzpYBBEyS4Dqa6VE6n0niii1dMT+SW/fRLJruAD2t/qWb4eImVyzL4leekT5T6b4ERSe91IMZTwppSGBMlE1JibyruVB3Uf4hnNDHFlcwD8gjVEgTKrIWHSdVdCbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768160909; c=relaxed/simple;
	bh=3hqCfqdZTIkuyO7cWzQySnq85cfeIOXi1+R4pn3vgJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2p/TVzoxPpAqZ9l2/BV/NFlUXmDZHU3zrgKZZBkg/3/JMPBBtHagBAnVTdI3KyAvoCGjBFFFUS42NEMw5Yp81a5Pl+zLLWD0r1YYN8QezDemRTe5rdvyV0lna5Imj7OY+EIn3SZWML6dBy6iUvwqoFXVsMn4N0C1RyME7eVrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXaglRlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNcxFLio; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BAtVWX2203208
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=; b=QXaglRlxp/jBx2Ns
	zN9paAS9wTb3nrVQX8Pq//IZapelQkrmaJGcFGRphXHhFLbOjO+OV+7E4GdXXl2F
	NpoJlZCa22wy7sKuYs3kKu1M0c+ti/05zUxOe7r9dkSCOvwm9nU29cVrJv7oZ+ZW
	B/J340Si9sxq7XD0nXg01MJJSNHn5BJcY1YLAepd/AuLwTi0P03SO8CmR5s+lkSy
	j2bHqXDaAIiukGgVp70fS7uTDakndv7apElH1OdEAN8OKGNBXLtKyrCLgBwFgqiQ
	ezuSpkaeCHHBpRtjdEfVcPJ6DYo8KgQ3XFqeLUTW34TRDnQ+ogRnDRTmK1zG3ayi
	Cf0E7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxtbpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 19:48:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2ea3d12fcso77341685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768160907; x=1768765707; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=;
        b=ZNcxFLioyZYYaFtkJAil83Ks9N+QrqgvkWcGixGMd2LbU1d86XeM3GrLplPSVtJVT3
         XiwBmcU7lZYf93BWF+9fwA3bB3F1kpqucIX0rI0cRdB/u8cYFduz3Lo6C0URMEZXVNUd
         p+8BeFIGnfOUkTGQI2PTswqspbpV5cVpcNwasKaWxKDNW7I54By9gNF8h7ddZFFrChjh
         okJqwecPDMBzdVOVpk2r5DfuWgvAf0tJlDA3ojY4RLPJAKTzMHsRo6J8f7ir7Sr+sMhn
         oh0ce3+PjhKQ+duMe6InQ7T6Wa0gBo/pp6WAOYRHQB64Y+WBRuyALvfL5+In2wRbnoLf
         281A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768160907; x=1768765707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JXECXhL/Gf4VA0I4yuJTgib+HbbOUVNVA5HBiQtRbE=;
        b=dfb5zLU7G/DwXQEWsxFJIad2wXr1NgeNyGXJSKmODcpBWXxtik9JcU+TZwnq3iV7tX
         n/gT/8SYB4DaHcvDGs5KUZeHne65cl/9+wehh7JEk8fXutnBQ3qhfT+qJidFwotSlYNQ
         PUeSKfllIIvP4deITk6zK7eSYv5FFoHuB6uwCdfHwU0EJoasYVdet/w6fDPrJ4NbEVCU
         UzvF9lkWpCCxxbj5YDAASfMIqGUgI9A2t2BBsaZqq7c6UpYShNz37D0KPI2HxVHq4Ago
         hDp9afONVsb7NUsqwPbvjmGlvS6b5UM4pFAkquemHKrf5M60DziTB21rhZMOg3apkKTi
         HFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYI/Si4bhvJy92wGaEnrMjQ25muCaxYqOatVX2NvmYDmpDvlFnt6ysTKlUcGbVg817yAEGg6JV1F8PLfl@vger.kernel.org
X-Gm-Message-State: AOJu0YwBPrEue4iPHrYHVBBKS4ph4nBAM9yGzl2BEAfW1JC95tp98X63
	kiflc+tLqJWairNAbm5ABwWCBhXZ1zfihNOnZGzz6rYoKpktqPaVZlqqKIDJgA5/hbeLIirl/sz
	7GK6dA3+gOhb5Vz9aWjuSuPqN37PaTKtW4GEeJ78VHzAfOxkUeEAu/rzsSa5NbUACTxZD
X-Gm-Gg: AY/fxX7PQQZhPel3xjw/9pCFxD9Ybu3C1HcRSgb2EV0HSLFCSV9WEXIaBhtaWO/TU64
	z7a0sOQUTlJsAtvU3LfZXvNh7LbKO/wfmyAvvHZdbitp2Xphxv5bDqEEs7MGBBT0u5E1Q+WndpS
	Jvo1PzCZtd5gG1ugT6pNG9RInmYKvXYpKgulhIw1vsLstVRQQrDo7aibnqqTDOMnZROaN6EMASL
	LQKOJ1DtcZl/xdcAmfvsuGwm6gInzw7tQPaUYGWIA+yzV1ErIDyG+CV9ZmrngUqzv1iPjR7o/Qp
	Tw+VCJIGEWuyeuhPZDKO7YsaI2hinHD9xnk9vh4oMyCWpjOcp9lRl9+NiqgQjmt1mQkKz3LERjy
	wz02ukxBmxmn2qCLq7Kr43gUXa/MULTkxJRTkjFYqnYmUntxrhMWeK7TGx5WQjllKrWaY9gwa/d
	KLW3n6efGT/ytlrhUYhDSIY1c=
X-Received: by 2002:a05:620a:461f:b0:8b3:c8ee:7240 with SMTP id af79cd13be357-8c3893690efmr2381776285a.5.1768160906845;
        Sun, 11 Jan 2026 11:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF84LD8KsARu0mNzELBrZRjajRCkUd2bM77Q15DgPYpZ5PTeYY5nvdYL83BdzThlXISIigEiA==
X-Received: by 2002:a05:620a:461f:b0:8b3:c8ee:7240 with SMTP id af79cd13be357-8c3893690efmr2381774885a.5.1768160906339;
        Sun, 11 Jan 2026 11:48:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7a0ca367sm2531114e87.38.2026.01.11.11.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 11:48:25 -0800 (PST)
Date: Sun, 11 Jan 2026 21:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
Message-ID: <oukfjvwbzi2z4xu43k3wapbu6fuzromxfxkxbyaj3spmvf6osf@bjmt42ui2peq>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com>
 <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
 <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6963fe8b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5nr-ZfxueVFsKMbAJ4gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: qWVwohgh7TrV-_xz4gG5mL18oaUerWAC
X-Proofpoint-ORIG-GUID: qWVwohgh7TrV-_xz4gG5mL18oaUerWAC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE4MiBTYWx0ZWRfXzCNGH3vDFFTq
 5kIraMPp3PD51yaBdbn83ljgtY1N7jBHHEwu01kcH3pYr/fTvqxoXnLGBD1SovBcrkITsIyLJsl
 rGQkRN+62tiXgzzLBat5mYOBwi4RooHhg+7nDBbwdZZZ4bIMDV0iie2PAjzDxe7pFMoBCyLxocM
 O7yQt8x+fQZvwExxtktk/v9q/gE7n/IWHpmO1qkiDTabvMpiEsz7z9m0ypoAZySm67EUpA7qB6U
 qWEXYQilFnDVwHwVjJ0lqhwoTkGUMy/kn0rf0dTs0T1VUrqVzL97PCljQjMCJbedsdd5v+h03aW
 fYzrphT+Pd6nW2ik6WCdv+qT0Iqjrx4w7Cdi7PjfsM6awZzexkw2xjM0sKV5C+fmbt/zYoa+qEj
 udTo7ULIuzjCaOZcghKvXRjom83nvYwehS3nKLn46ANcjDWhsDoanPBHNUfJkXfN2b3t50RHYWv
 V2yaAthlbcYdEsfHufQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110182

On Sat, Jan 10, 2026 at 06:23:59PM -0800, Rob Clark wrote:
> On Sat, Jan 10, 2026 at 6:17 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> > > This should also be zero for gen8.
> > >
> > > Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 1c80909e63ca..d5fe6f6f0dec 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
> > >               *value = adreno_gpu->info->gmem;
> > >               return 0;
> > >       case MSM_PARAM_GMEM_BASE:
> > > -             if (adreno_is_a650_family(adreno_gpu) ||
> > > -                 adreno_is_a740_family(adreno_gpu))
> > > +             if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
> >
> > What about a7xx gen1? should it also be 0?
> 
> *probably*.. I'm guessing this was incorrect before

I'd at least mention it in the commit message.

> 
> BR,
> -R
> 
> >
> > >                       *value = 0;
> > >               else
> > >                       *value = 0x100000;
> > > --
> > > 2.52.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

