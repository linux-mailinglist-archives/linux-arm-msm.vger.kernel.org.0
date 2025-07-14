Return-Path: <linux-arm-msm+bounces-64802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D843B03DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80BCE1632EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFBE175A5;
	Mon, 14 Jul 2025 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkMWYXjO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAA31FE44A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752493670; cv=none; b=T2cgbEAlv80nHg5jF/HgIzIff6g/9bfOOw7JUMdXJirUPDy9YZnuVqiX//Gtj5Xt27Z8Z7sprugCOXai4e1i7EHO6JhpYQboJrn45+98d9/31jVv5V9/gu9tIFobvcnS6fQXxf0+QMck+UvnjSblNA6Rw3C/a8h3+W/a54alI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752493670; c=relaxed/simple;
	bh=kjDcumJ75KlJfamHv7TG2V23okT6cDFZBAOMhrX9puE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJ5OjggTEi93GafGC3BFxQgQOTlVcanpIRNd45IXBvG+vq19b4gfaQSLclvTTPfmkFTeaLoupwJilfRdzdKFlYd7P0QQk/Q3xWqceM3hlU3q5K7qFlTHHM6W8flTafZW5m77javwPYZjhWmZzCxxsLg9W6lxrbVOFDhhbTyK2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkMWYXjO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9NRfU018413
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t+wfd3CUH3K69uiY1tGZEAhA
	GJt8soTvX1/+0I7VnVs=; b=JkMWYXjOlBvqiFf+03FX+jypWYbZIIeNHqWAREUZ
	7GAQg95OBCdRh5NWLVMkxvpCVEhfu7uZHV/4+uvvWAYdmgrsXqxzWHEjTcsvUQ61
	XCqBr+Xcl+VK6yTRuCRzNqV7xvMPvpHtEMQKgWEWWyN1Stvr3KdN4vF+joaX6rq2
	3Wy5IKP1ICRfzUb2vOklys9VKGQ8x7rBnmFP7vq24yPK8sfhuyXvW70VdExF2Vih
	RFNv5d4h4u9dUAz16Sk2tMf1LkMiQydm5Tte4ILjWXO0vaEHDWElM8oxvau5Wc/p
	5twbQuk00Y3/UVYUmUp6oms66f3Lpk4xYxDGoR8ypLdTGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37vmff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:47:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e207330a45so188226385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752493666; x=1753098466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+wfd3CUH3K69uiY1tGZEAhAGJt8soTvX1/+0I7VnVs=;
        b=QGG02Aa4U8qHGzxoFTdXFiqRGrTGSTKtxq8EF3ROSUakLhSc9TuOnk1et8EJsepw5+
         9cDtp7AiO7kgyl4YABP5SqKcmcMJ/4LMQZZXgkK0aW7pi+Wr5Lbt98Qznoo7obK1AxGQ
         tPhTvIgj00HlE5PTtk29XrYzRHzBiLLFSHEBPltpnVu9TUypZGU5Y+RXVmcvgr8dIJZx
         uPVWACQie6EbOicvW+yFf7ctwMQqU/7h70FLHoO/6AL96pHchX3iXivSFq9m3dUhqa8E
         bRJ8WIQpnE8F6DBm46/zyZOgbrX4j94Qn3RJ+KX1ksqd3aQzSG1NpPIv8fD1lXuWUQka
         Ef0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcS8A0UfAiaekLOL3x1zIegnrdEtJ0PFwyHQCoM5y0M7wemylxZ5pUBIYnAT1eJL0+6546KpHKEy0EoAaO@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIEHLvBZfGmnUiYoxtb0iThHuHN7DZag3bfQb4FLRxxHiyilU
	RK+FwOnVHOULI4bVd/wqcnMa2TIvfaNBkGurLwbQlhvBovVftdvaGEMHz2RksgujBmpvjDGGK7V
	K2B4h9rlzbClip97fkjt+U9+oxKBO/8QTqYVQOJAb3nVFiADalwShtd6FcMhrX2md4kHY
X-Gm-Gg: ASbGnctlVLLSBBUYWMoGT40CU0R4tTgHoj+cSEAPqHQtQ9SizBcawzFN9rl/BEcc+oO
	ccK9z7RbY5af2njaF/ykZsxrldGskfNmSNvBjx0aUjeliTahhkDY+k50fJKwiiSryEeIJtLXP1w
	629zPPDX9lZLg3NvG9SsCu1U0JB1r6HguQu/6G81xku3bKgVLKSCBhnN14d6taMejZbTF7hoFBA
	9TSkrweeuwh9JXZRr3aQ+JkLX9NrpKxNUGTgM8j9RO4roAut00GxFx3SWSLAm2mCDRbR1i6eYN/
	ltmfdlVSp/7+ACKONMrjpkCmzGXYbuWadY1wxuGIWpJURU8n2GyrrxIutmdprECCQFYBNe9w60Q
	+834nYFt2IeDYrD8KbdovGtmcH3wVU83EMlyJUF2M2DpBDQUPtr7y
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id af79cd13be357-7ddecd1299dmr1929538885a.52.1752493666380;
        Mon, 14 Jul 2025 04:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFfkjooggnntqRT1oZT9zE2pntAHLG38aK4mLosHKhsfcoHd1ko+GskvVDqiEDmcSqtpj19g==
X-Received: by 2002:a05:620a:29c3:b0:7d4:492a:31fe with SMTP id af79cd13be357-7ddecd1299dmr1929533985a.52.1752493665811;
        Mon, 14 Jul 2025 04:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d2f89sm1916017e87.115.2025.07.14.04.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 04:47:44 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:47:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 03/19] drm/msm/dp: Return early from atomic_enable() if
 cable is not connected
Message-ID: <mw6wrx3nsiantc2sweio2xbgrranoglzugaykjo3robkknrlzj@5dma4fm57xut>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-3-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OSBTYWx0ZWRfX79cYFNsycb8M
 bgGfEhBHr6gGcucBLJfFwAJm/XvtwmFOR3kJ3G2mPUpqwU0Tem557LmIc7oSriAeTSeGLWI9jGX
 HdicCQbZLqRyRYqP7+Of/lcXxovlMwzChDohPCmnBXQsL3sM3YAzhrlCDsLImEq3+57TfQbiyCG
 36P/pccaHhdbtrTIqXZf4PC3kUw/ZXjOiagTvfm2HWfqcYpaUzsx3slBE4v0pquU/mrTDK7pcyv
 Yl6jEIj2BCKTEiavioC0VxLR2mOIyEAYfNuhdz8sol8GA9AyQduiN9b2c6Hb2Lspu/MoyEZpdEO
 enE8QjXIDG2L5LZ3FMTXbo6vIZMXpYY3C8zjY42aqzYrflxjUEErekfBWBVqZcvQpc/TLDz2krL
 gg2vhYeJAuF3Knu5j0mRh4HCqjLKjBnAGqWEbdtRy+MLTXo3VYxjoRSlOLRPqdGuhwP03E1M
X-Proofpoint-GUID: _nkF4ug3wKl6yjizHB0sF72JcV1dY1PU
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874ee63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bA0M61isIPtxKdXERIwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _nkF4ug3wKl6yjizHB0sF72JcV1dY1PU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140069

On Fri, Jul 11, 2025 at 05:58:08PM -0700, Jessica Zhang wrote:
> Replace the ST_MAINLINK_READY check here with a check for if the cable
> is not connected.
> 
> Since atomic_check() fails if the link isn't ready, we technically don't
> need a check against ST_MAINLINK_READY. The hpd_state should also never
> really hit ST_DISPLAY_OFF since atomic_enable() shouldn't be called
> twice in a row without an atomic_enable() in between.

There is something wrong in the last sentence.

> 
> That being said, it is possible for the cable to be disconnected after
> atomic_check() but before atomic_enable(). So let's change this check to
> guard against msm_dp::connected instead.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1072b5fc00ae..fe38ea868eda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1606,7 +1606,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	hpd_state = msm_dp_display->hpd_state;
> -	if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
> +	if (!dp->connected) {
>  		mutex_unlock(&msm_dp_display->event_mutex);
>  		return;
>  	}
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

