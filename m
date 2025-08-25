Return-Path: <linux-arm-msm+bounces-70733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC884B3489D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 973CB188EB3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCBE263C8E;
	Mon, 25 Aug 2025 17:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiMuOHWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F03238C23
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142757; cv=none; b=hm710beCA2Elp/yirC3+OD9EBv/3oN9OJedMSMZdw5AYkwwUVQiBaQwfKez/Rr2n1/YW4blIf/FDxgybp/SFMzBMqKs9BMBEUbBevGAxIgpMV3THSBIu7Z5QvLnCowA6KvgixL6bBmOWZE8+Id6bpjETJFbpgVDVcd/yi5StZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142757; c=relaxed/simple;
	bh=KS+fBEyFqHgrkcFLa9H69HUcs4Ca3HGJ3JuLeS1cvXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAd1LowRGncoNAthyrtM4qBFa/Cabd+AQGaLsyCnSEbGjkZEwimhCEkkalx2xMrTmkrTI0VkLL3Aizf+oITMLYmAu/HFcO1FWB0pkNGOG8gfYczJL7OgLLR46fgloFRwQ6y3m4dU74UljKxRpH98KFrYTEVcwlotbqg6PXrsI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiMuOHWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFsrH4026845
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ihvTWrm11MUKAQSxwlSq5xe
	EvcCp7RJaL1CqX8wMzA=; b=aiMuOHWns1NJzoywgUneVEmQ2c/6snoKkNz4yiF9
	5t3/lof2GXO/P6yQZiNeI4wducHW/xmhUsLYkn95Ht5OhnXE4rDAEr2Gj65mxHAG
	883yvQRWi3U9gYL7ufyftSLgI1bVGj9iNaQ+3H2ERMaR80Kd8DKOrkj5IRMhICqm
	n1AB7NgSCx84781yh3TIRSTogsmsCLOwJZs6U0FuBJqY0PNofTHBJ+5Pts/WQF1D
	GspDON6x6r2fgaHrf9s0naumx0dyrdiNEIXi3eHKkivPtd9Ws9dCxpH5KIyjho2R
	vRHEMFKY9VrM5N346gkw7RjP+iofVStmRN9oHW+5F+7rrg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwxfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:25:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b2d09814efso21334381cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142753; x=1756747553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ihvTWrm11MUKAQSxwlSq5xeEvcCp7RJaL1CqX8wMzA=;
        b=XprrzN6IpGtJyeuFFzXPo8aDhpwt3a4tZK52s6VUwHxF5x71gNHZiS3eJdSLFz4wTC
         2+pczaHXfFEIytWE3lX8PSPj/+hM52nOFZbF2xYaSb7YX3bZRumT30fqXrzKUP415j5K
         cWistkcJxmCDR6/smSxWT62szIdaLoN46UOHqogdf0Y1g9xC56TE5k+DzHSvVMi5UzLh
         OIkOY6ctyGSjk198Bx4n6z4u2D+kP4WgXM/kuoS+N3qaOnTlWM6LyOc0oUE3Ljle4Mm8
         Co2lTBQwBlYLQ3u4GPgfakPcD44QRvflDe311fUS8GY3x5TQvorWKXDHVdC49cbvJndc
         kyGw==
X-Forwarded-Encrypted: i=1; AJvYcCVeXuJL3K6LE+vTUI5+cZHM/1paHE3Aj3dPocXKMF3YovODuo6/1XNSMl4WHeXKLt14ROs6WTAmOuIBSbVX@vger.kernel.org
X-Gm-Message-State: AOJu0YwDesx7mFHita3iGn6O382t1iRc96KepAGaJDWVq8opuP9iv0Od
	pTzNKzsa+Zbvl/ToQaNryoHlMlA7MyCitXbM8qNmVd734LYcadARnOsr6VLQWMAepVieAonPYnT
	iYQjqXxTNcvshSZXyf4hZdQmkp1Fb3Avf6qsKObAE+753HCTbOb1nWC3cj5XdniY6JC+L
X-Gm-Gg: ASbGncvo2WH2ogWofinP73GLFkrASo5DtNWLS5Lk8DV97Dm5fWwCdWMZpMs6GrKo085
	eKPXIIW13gdIb0nwJo4dhjvTTIaGkHQdhK53RecFwvDqmka+rxTXBAHfDZxVO4eOvxtcnrKstXo
	5KoDl8Q6t8Hhd4GEOpTDBqXZ10jte20fmeScAPD3cJQtjoCSZTHPOeMREou/z8cyhUsrL7Th3gw
	HdLZz4ud/6CHUlyjeh7U+Ocdynygtjk6woOLwHePBbDke0TI/a5dtlWXyByFIcY8Q5eJRMndGeW
	vz2ECrznpllPWV8gWFte1jz40PbXdSkvI44ioBPwnrtQn9RWJrb/QsP7FKCqjZTkCMR7ZaTAS3e
	4U9v55QnlP1PV2zvqYmgiP0bKR/0avtPUDIYDyX2mabA+t/pyCa5y
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id d75a77b69052e-4b2aab20a5bmr188355451cf.38.1756142753379;
        Mon, 25 Aug 2025 10:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaaJSnlDTCsOVk6vybE2eySYvDUVhffQEmr4Tj8nbzRC3viCjZnGQfkVbLytk3PKPOgFsSyw==
X-Received: by 2002:a05:622a:408:b0:4af:21e5:3e7d with SMTP id d75a77b69052e-4b2aab20a5bmr188354841cf.38.1756142752721;
        Mon, 25 Aug 2025 10:25:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35ca6713sm1738580e87.136.2025.08.25.10.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:25:51 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 04/38] drm/msm/dp: re-arrange dp_display_disable()
 into functional parts
Message-ID: <gxhf3hexw3acfgfyyiarucrsjdhxqmctpoq4xxve2j2i3frime@ga6eqec3lrd6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX3t3b8MEh8dw3
 PEEKa8LYUD4CLGt1exFrvfHyHwgheBKpzxgEA2onc7STSsBhXRzDYp2GaAgfIat9nTPr8xB3ngH
 UQfHPeNzksPiBZXtSsx4yoFMlmvrBRkJ9kOToW9+Xnp2IkjA53fP6eUenm2+lTXBEngOmZ2ZhAZ
 LOAQ0prn0s3xPtJDHnq48skshfOcqyrpZnvbRmi6osL9rSaiO34ji6MhsFkM6IhApKZTvcqmcLs
 Pb+SvMBfgVMcc0DDqFdQ5qqLNbzHeDty/NDrCGTRo5ijZ7Za24vkjqzDO5Au6KQE//MHdyW+Ndj
 FJBWBQBpU9HPDeCFq5IIMzJdvisROOlQMTtTo6o+cotEE59jhAvCs0DqfDZiMfNzm0v/S+0N2SP
 w0KDpgO3
X-Proofpoint-ORIG-GUID: Ez9z5ZzYi2Ka00Wpr21MdBHNoBp5zQVi
X-Proofpoint-GUID: Ez9z5ZzYi2Ka00Wpr21MdBHNoBp5zQVi
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac9ca2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QFyoUhfU7BN0Y13r8iUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

On Mon, Aug 25, 2025 at 10:15:50PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_disable() handles special case of when monitor is
> disconnected from the dongle while the dongle stays connected
> thereby needing a separate function dp_ctrl_off_link_stream()
> for this. However with a slight rework this can still be handled
> by keeping common paths same for regular and special case.

I'm mostly sure that this needs to be reworked by the HPD patchset (or
as a part of this patchset). The DP controller and the AUX channel needs
to be on for as long as there is a DPRX connected to the DP port. The
atomic_enable() / atomic_disable() callbacks should only be handling the
data lanes.

Nevertheless the patch on its own is correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>  3 files changed, 12 insertions(+), 20 deletions(-)
> 

-- 
With best wishes
Dmitry

