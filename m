Return-Path: <linux-arm-msm+bounces-55580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70382A9C330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1FD927FA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14E923536E;
	Fri, 25 Apr 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF6ClIpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD9235348
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572822; cv=none; b=SAcALqY+d6me1XjH6uWOWVXLWNLl6qJruRfWd+/Ktin48RD67iSUBAIbiuyUZj8YrgLvdebn6B3gCKPrW9n7ltCDLJVEZ4XfZD1ZOIdfE1jd3eFEgeIw9kPYdKXFhKHMc6vFBLBoa3hzm8zpN9OhQh1J20vIxueWpqvMy9PRUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572822; c=relaxed/simple;
	bh=GlTrV0NWZcEDUHLVWg40j5KzByNVEFc76P93JZiWIzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIlpPgn6wJbYmCnBXyXLAHwWd1cW4mL64c9M4YcRcpEpQfS01/TEBJdoWnj/DQR0kVPsWelHw7a6TA6ljepw11HVWrd3+0B7+YoZmQtC7bpvgOUjjAeKWZ229lnpj7zPoQ2Qo7trDTD2hPM+vFdtp3dWAqs2f6yVu2rn3elcqtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aF6ClIpQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TJGE007565
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rMDIsHdsOYkyViUAsU0t/ePU
	SWOO0YxJOUX3cKyNhU4=; b=aF6ClIpQAYUrCzDnHYfaXzQmwyNulXHEBtEuHA7R
	oLdXml4MEUGZlFN1bhGbAzin8xp9PNjxOPvY8fm55P73h6zozQXKjFnu4d1bWK87
	p78nCwPMoecpSxRcDOvQ3qhzklOP6kTXISooEg9LjB3ABMJPHIAOiS7FOdKWqB4h
	4/wbqslrMQzCgnNDdUOgHQvIwZJBbPdBM4nBFkfSFILproO7iO6dVzLE230AKuqv
	NrmDDfIYzWprXypPDQwo/rVqsxldkAUsGMnoJWX5mx5m2qu2kY8nGW3PER0ss5d3
	Wo53ym5H/ep/vbCkOevCqO8F/JK+l+J4GZcF/4S1QK7WTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0rc1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so310138785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572819; x=1746177619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMDIsHdsOYkyViUAsU0t/ePUSWOO0YxJOUX3cKyNhU4=;
        b=rrinnpa7XztJxgEg46YVq6D+nZp6Am/8+bJPY5n2ORiuPMnM89ugL+34FKeIBC36pN
         4r6V9ZWMBsOPNpTiCiaIGhg+ngdBStnr7wSyLGhXcQ93HXF3ihRP3n4vR53/dys+o1kh
         cXDAUrw0hgPGHZorzjv9ljr5EF4jMxXNGyD7bcRjIBewA2Iv+9cnAUElhQ00nhlA9xfo
         Ls46XKbNzGLIbG5bsI1gBXpnULtTLTUAItnx6ldaC3SO03fQvuxLALG86EplkF5zYPRr
         5LXiAmEP0DdsMFWqtadn1T1dge8VMJ6gzMCDXpyL664k0tw7B33Ltyv250by6K2OU4lZ
         +avA==
X-Forwarded-Encrypted: i=1; AJvYcCUioWugZUsjMBJjYZ0E9CjMABZKiDBFaWA2Z8+8x+KvmKk4By5zsK8/G5a41E/ilz+2ZIQJD++G02PBtNk1@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGHcFQEBt1wEvte1XHOhRz5V3xPlD0+x4hbNFUJ3iOgA74O+I
	qLKilKYZhtOY2Zb9dSgFc86/+zlqXvkSs7SFJPFsScNLPi/z54ESORoBOGSxIvGCVPXGUs20AOP
	YJJPnfh5X5PmNV56N4A1vlNsOitoeKLT3Kx2eOvMEHK0/i5V7EeT0r/R2IQC66Eem
X-Gm-Gg: ASbGncuO7c3dLikwBQGnItvDQGGMi75g3NlhSNjXZI9CUgMU4zrcZuEQNJhLNpZai4f
	GBmb3gDUyaxGEW13YR9YZr74579wG4dcjBUVWihzwUUsDTPogzqzBQfBcgdzhdYv0UPO4TKTMdy
	ry8EJG3N9RRZ/KDXK1TruvWidPt5s2jcpNmv02hImeBpncnMUP5BYXvxSV6tgSqZlGskwYfmjA9
	oSglxTZDlwZmsag/MeY6uZgapwg3U+Vlq7eRaea1qr8bRUuwp7PLmxEATSJ5P3IOHJqGrDKxtEF
	Km4h9dI9whkoXMZU6HaXWAt/VXIWuq74BsDG+XL6BlwO/jm7Xxzu0vS0SmbTOoNeVx3Radiphgo
	=
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c9607aa0d9mr312339985a.54.1745572818818;
        Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfBCKqtUoVTfxHiMTz/laWIXb+vyHohQFKZ/KaREmisUEpTMfrdz3hYOCR3l6/Jaa+ylyp/A==
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c9607aa0d9mr312336985a.54.1745572818522;
        Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d45sm6445631fa.94.2025.04.25.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:20:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <jdeuodvsnlezbnxoucihd75rwlrigskvessdt3n3ufuppw7qov@ujjgimndcdkp>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: YBmQ8WUoi0oFdAJ8OCTvum6mxobKUoXq
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b53d3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QaToclHOt1NPS2V0eqsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YBmQ8WUoi0oFdAJ8OCTvum6mxobKUoXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX/vmYfBLctLE0 V/apbZNAKDtGxP/aV8EqMalvXkmGiNmaBpr42LFgnFvg6xI9FaPpifTtEucnDW5DGHG1qJE/sO9 JDXal/Qg+C3ALZy+qbeV7rPvz9+TBH2KW+9+pzuDOJf9SUdAfQCZZfTxkMk7FgkXvTtzyPFtnT+
 TrubQ09fwvG+/bbDRSefboG4x2keGted50LUM9hLghEsI6LqKpsnoahPjbLSvDy6DLOOGHC0viz rXZ6aWxzqns8/wEq+aO8IDyebjfZ2/LRO95/YYoL2CTtrelzXDDOO1958DRcePNgHPjrCDeT/Cp QoKqss5UCwE720v0/UaS8uYJVjwCzRcch57EzFhY/A8Ll6oOXRqMJjpDpd6mVjA/47y9WgfP8b2
 sRj5Mh9NPYe2ymUop4F7/PP5svjKixG2sVvR0Mvn5sMpds5ig/2UGO6RGK1Zr2XfvPlcgq3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=769 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Thu, Apr 17, 2025 at 04:10:33AM +0200, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

