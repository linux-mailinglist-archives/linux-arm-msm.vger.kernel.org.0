Return-Path: <linux-arm-msm+bounces-53921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34177A84EF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 23:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C714189A8F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6410720D4F2;
	Thu, 10 Apr 2025 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1kqduj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51E6EB79
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319083; cv=none; b=QgJkAajOzf2LyYXkPKGKNz4uoHQQtoGcQdDjbzUXz6j3mrs8cxdcSUJw0qBC6HPgyfS6XdJcaXsuH7dwB3Fm4wooUSv5fZJxQfp36cL7JezuQniSrcd5wXDh442ThD9Rcah6IrLJeSxcovrZWLlTxHTKu0zN3TcRahcz0YcUly0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319083; c=relaxed/simple;
	bh=s2PXDXHfp+4YvEv/H4AL/Xhk+Ols5TiAix6NnWN1N3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXOs58RJp27kyfROh5dkAywJLwD3qxJcsvUtkBgPJUMSLMFfHD4Lz++XncRn88IP68D/ce1tUvHWLcQCvXuB0yoqvtPLQq7JsUWL2xe5BmEGHyVGIuP9hWLiCVfnDy4kjY3TS5W3aPGty58nQNShMIrLXtALZv8XO7uBfcEfAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1kqduj5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG1oBE016303
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ayYaEZ2RWgExBpMHxpWrMYGv
	nLNQvuaR1/Qt3ksg5Gk=; b=b1kqduj5/8pqkVSKKfNoMKJQAbRHEPDNjU0Dhl28
	DHJYeFu/D4uLq4zTZ38brFe5/bLMT4SlqIrJCrIZUuEqJd0HWizgocJ351Lnexwe
	48lu85LQ6GhRumygAPuO1AdSQmkfGATsMeTOXnZgKb9xlzu8SItaUemcqsHMuSrX
	hmHOiisNbzQoEMKkKn9XRASu7uLx/GAfPu4zcaHPN49n5dZTTrO0MQV7t/EWGR/I
	STkvISA0XvEP7j+Qo1P9n5SurGqIjI3eDjmk+8G1WOo3i76UoATPVLe7EB0d28uX
	G9U4Uk7RA86MavsbARxOyTham0ilrotqkZaboP8OnGjvUA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1r52y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:04:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so119116985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 14:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744319080; x=1744923880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayYaEZ2RWgExBpMHxpWrMYGvnLNQvuaR1/Qt3ksg5Gk=;
        b=A98KsgZzbWxqHNm6aQKW+1WsUFt38/d45tsEU8gzESuYzyzl/MvC+p5JnkuRC+lBQR
         9JH2gkhAroNMxIV7+lmgv8TorlAsM0Ca+QStaHDfUvdwtY/YtYt+nXqyDhVy2pRcnNm1
         tVTsPGwfsa/HDh7VjXU05XyJpEwwZowsjDpnPC3ocj3cSY1YE9yCZSz30jxs96iFC4de
         O7hkse23Y8sgrtcJQBgARUO432W2k8HhxGSkVUURQ19C2P7GVW0m8r5G37PaR2WZom6e
         Flh9u0v9+X2vCsAbMU3F96Ya3ujMJqfLOGM3qSmC6iDcVb6HqyC7BVG+bUWX/70ezBIw
         8LRA==
X-Forwarded-Encrypted: i=1; AJvYcCUrw3qAZfOhDUgXMCKEPK/LdOkVcARu1sIXfCwll5cNHh/lARpEj+ogJ/OzVWCJcOFOmpYJRxKBTgsLkmjn@vger.kernel.org
X-Gm-Message-State: AOJu0YxelCMg7plGLHGJVzXLaF4cS7DI28aXiGccbSkV859PzQisXxAq
	I5ijqY5nDsNsLbmiXz5pSWkAabM4uFtKmO/MI73cpnrZYeBDkPmYc+eWaCQztp8aDB4tfAQt6OZ
	zPFlGBWV7ges+kTVXdbcNGn91mAA//Tb30miLOnAqxq1EdGCN4114HHS/M35CLgZk
X-Gm-Gg: ASbGncss7Dq2CWYLeH05eSBsyRvPjebbcnwSfyWMk7U66metWq4D0/wkZNN22QiJZ9u
	+CLBHQqIT1sFOuzgWwh/aWtPINTO6HFCoXlDwAHtMLE2Di0XdOEmvuq0pqdgmqoJAstoKkEMWUV
	M/eEjhwZV5Jsg6lxkfbG9/QTjrkYBi8pxRMFd16gdyEqi+xlxwajxa5MCCgkxRVZreviDzOiUCj
	aXfKDledLBE08jCofcu3DrkDEb4/2HEhsMeNdvVtgwH+2+eTFHppLyNPfvwdQv+/q2dgVJUQJfW
	lVfA1UizWIAFoj9eq6xO+Ziaxg26HMOn1Hw/DD1JDmwlzMGFQgpj98/cIVx3fOze76bw2eEmpNk
	=
X-Received: by 2002:a05:620a:4146:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c7af112747mr80867385a.37.1744319079779;
        Thu, 10 Apr 2025 14:04:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBOyjBBQO+ERP0/gAUgi7hej+nLhxyLLWNbmDsntOUVhHkcTUjblRZyEYWnk1SceQw4tQDlQ==
X-Received: by 2002:a05:620a:4146:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c7af112747mr80862185a.37.1744319079366;
        Thu, 10 Apr 2025 14:04:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d521931sm243180e87.257.2025.04.10.14.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:04:38 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:04:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 5/5 RESEND] thermal: qcom-spmi-temp-alarm: add support
 for LITE PMIC peripherals
Message-ID: <dspnug2uuft5st3ysrlcpbitir2ilcjpxglvqqfjoqx4w5xhct@r2xauwjshnoa>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-6-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-6-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rzSJp17xo86BvzYIN--SWaNzWKhtvIgo
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f83268 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=C_YEPuUXS4kB9x-TF1IA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rzSJp17xo86BvzYIN--SWaNzWKhtvIgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:08PM -0700, Anjelique Melendez wrote:
> Add support for TEMP_ALARM LITE PMIC peripherals. This subtype
> utilizes a pair of registers to configure a warning interrupt
> threshold temperature and an automatic hardware shutdown
> threshold temperature.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 204 +++++++++++++++++++-
>  1 file changed, 203 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

