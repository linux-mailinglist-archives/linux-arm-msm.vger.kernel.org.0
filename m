Return-Path: <linux-arm-msm+bounces-87283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8476CEF800
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 00:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36586300E164
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 23:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DA627934B;
	Fri,  2 Jan 2026 23:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ikl6QsGW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEaJcMyP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D252276051
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767398016; cv=none; b=PblgK44x/eg1K8HzxOpYeHBTeaTaTyuDhzyWWp+TCsOff6FFIwM47peQCs6YhLo3gzdmxIPwjGzn03xUX5kfV9exua4z2BOzn15QA44BwJ6qztOMpG0l+6iAe9Un24jp0hw8cuQLkI+UhFRrgIesd4q/vLHG0ldGJKQycS9ZYfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767398016; c=relaxed/simple;
	bh=HTREJtC/3wnmGRudZb9WZE6c7uAjqOwijgmeMTlyEio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY9zr/KrkNjwyVUWfB+bBhAY1OigFJxTHX+7Xk4MI2e/pfuVgrkoBTeOfcXCPuYvPLDO05ZiBlONkz6PUlRcZrL64UC1Au+RRNgjVXj9/e3auIyqdUjUBIwvXVC5pqz7eedFmIJXeqQxrFqL4e4+E19MCY2R+Xccp6kwO/uf0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ikl6QsGW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEaJcMyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602NemTU2502872
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 23:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/TOfMpFCdBGiMultyyH3RUnh
	JuRXi4s3p8mFm8Vl96E=; b=Ikl6QsGWiemAUO70+A/3KIr9DMMvpyEKzg9CJW0o
	jgz02hyxChW/KMBq/5PADp+08GUB6iubThTwg0Ys9UjmIV5oid5tCGnTVwyNa76W
	b5lMprAvWSuEdDn9LQpjKv4lT6yphUCw0YyLaT7ggO5/6KOBCawjmfloDJe4ik8k
	dQ4BioWSv54vEHfYiPNZtB8w/xoTdUzNAKwJQG0AcHdF1BxiSD0SzElhl9M7/f9u
	FevOlLbS4LzboEZo3qGSE+IgieZ/jPumeTWJXuwc5aPZC6HoHYk8vLDWqeWoaEM7
	BM0KvC4hZ2Uwu1zg7kycko/m8kNnWk+7v80KEmgq2KimzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtmh6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 23:53:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0193a239so127922341cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 15:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767398012; x=1768002812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
        b=QEaJcMyPP2Dkz5tK1cLnFJ150e+hw+Pq+4u/nD++pcgSj7D34f7IkGXfKWitSJvn7T
         Dshzrr8AeuS342CAaofJPKQi80e3w1owDSa/r+GWLtpD4tg7rkMUIBXeHKK8PnUci5fv
         YmJPv++ezAw9TzeCEvTC90WcZHrHmnHshYGZlNCU3Lp0GQSMFrAmdckkoIM1iRy0moRZ
         A8/CYUfSdJHYW7pjsKIvqjZrUVYbGlLD5Q7GYVZ3bBXBhtoPFiumnF9ZYC9nZCfrpy/S
         O40uVlMBKJK+XJQWaql1QZswDlQVTSjG0dSPzv9ZVMDYvanIKvkSsY4pM4SJ17aYtisj
         aTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767398012; x=1768002812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
        b=slbp+bMe9L1hnJrgzISaOZ0hjXPRx0PaIbAWEuycJMj2nD4CbFxDSNsZ4sIrCfPBR8
         Xx899AUxdZF1wOIe69XpMMG/t/SJyzP2Zl6vrqTTvZIQ93G8smargUYPul6q50foFIqI
         vtfokfIpnLad0u8sb6yNHYp16psMW/2Kvt2eeEchchx/WJZs3mcwuaPJYBYgIhWtIvaz
         yat3cZnjuzwnJSKPONXfUqmu02GE9flGfSbsQsGbxM6shyhK2ZaA2T8wuSz+aV2sRwxe
         0SCh2EHLw8MTwHLGyOPlVEmd+xd1/tOz11uAo9FLR5QCq04CBB46KQ7n7/LLeJh5VJmi
         mN/g==
X-Forwarded-Encrypted: i=1; AJvYcCXqrJoYi8K6ymkRSGIBnZtNxT0S+X7i+SWnibhn8INDTfablNU+t7b6VJ6cNZZZeWde7YFnSydr5sAhKZIo@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8Q9MO26NiLOfnMKTdtKdea0seFn2ho7nb7TT8zSZ31+WZKf9
	jMC27ziyMuTwymq97EY2i5yZMXqtWoY8V21w7K9FEbZSCBCZUidu6AmuPLgGJDXngOhiCg5zjKO
	YLuptzAiMGfXkAwlfoXvecF5MNCVKZCK0mYPrcM7HCvljw83bUrscaRiVunQPSPb48xKS
X-Gm-Gg: AY/fxX7r+hqFlJJhyumhyNbO4EXVgG3k50QQrHuPcApR/p+0mJlN8PI2ZRK4NNOA+0x
	L1k9Rwu8DMWKoQKwUTyvkxJirYS1RzkRkgR/rCpW/U1Dp+G/TXWx/d7apBuLyZrR2xyOQBNsHDV
	OTlYRD76RsD3o9g6bX4eH+aNPGdoT786iyb5EeQ7ZKEPlEwGvywkFMNB4fSqlyXrXQzgfamIQHy
	VRQimkvI766AuiqtKga6VJwYJpOfVHsM7eofGUeaGxX8VRWZ2nEg+7m9YjlGsnlPwVFnTYGJ2qM
	zu8LWupYqL6eNbMoyVM8YPXt/e4NGeTVCb1GNX+yFLwOnYObaUG2/Uf+Q7PG19bOb7B4ZcpQ0Un
	u8IokvNfsiro//oHFi0fRxoNR3ruEVYvh1Arket2N/599ZjVLFNGUws14h18PlSY9IbSJrWAFqo
	GRKR04UGDArZTiK0hTFTLhazA=
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id d75a77b69052e-4f4abdb46e1mr659769801cf.70.1767398012555;
        Fri, 02 Jan 2026 15:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0QH812ZIfQAgtd1QpMNOObOzz6T3l1UmMcjcdbYOeSWMWVdOtYvBSjohvx5B1nzJfyW6ibA==
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id d75a77b69052e-4f4abdb46e1mr659769571cf.70.1767398012135;
        Fri, 02 Jan 2026 15:53:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm123294051fa.18.2026.01.02.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 15:53:30 -0800 (PST)
Date: Sat, 3 Jan 2026 01:53:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <nao4o76zlvkmak6t47ubcqjnkfe3bdkdounixwdpgox26yfmg2@ltpayjaow6h5>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=69585a7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dt2VdzyfSrB95En7lnYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ANliKlndrjLF3GuXKX7Xf35KQ13OqSLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDIxNSBTYWx0ZWRfXwOoqFBSuZvh+
 pgRcZQiCHZFhGg7OFgXmUXEH4YAvdv5li/rJGI0blQDNOs4dEjMj5h7Yt1QTkOqtsEVqQVay1pX
 DmbNQYIaoiFZscfWHJB9mzOGs7NS+3NwsiOwO+8X80Z9Pprx/JxHiL8dS93PrHiBhLP+BlUOk+I
 iFZfTDZFEu24utYdHyEyPa547mFXDsm0peNiME7zAr/J3+9HLAAHugoCVU8MusTzeGGVrHvxcTk
 rAQ7Jll0M/3OpZ/gLBAnZOzGBPEbHMXqfk6bRKumd73JIyKufVcnt0aUkeoR9tr5QS9gEy8fX90
 2Pp95S7wXi6rqRyVxcqQOHYLe8671MXmwUTbGOL+yzG/jh0EWpbZMsAcdfcQ4i8m76ZV3tLcqbS
 7VsHg5nNKBN4eulA8sDeeJC2tq+gcW6B1Azjrad5m4Q7nxjGzeP2CkyfC0GUsj7XfmdoUVilLoe
 jnH0Kz2hgREdmkb7akQ==
X-Proofpoint-GUID: ANliKlndrjLF3GuXKX7Xf35KQ13OqSLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020215

On Thu, Jan 01, 2026 at 10:34:38AM +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> Enable merge3d support on SC7280 to allow combining streams from
> two layer mixers into a single non-DSC interface. This capability
> removes the width restriction and enables buffer sizes beyond the
> 2400-pixel limit.
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v2:
>   - Updated commit message for clarity (Dmitry).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

