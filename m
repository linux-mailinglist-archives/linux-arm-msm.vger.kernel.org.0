Return-Path: <linux-arm-msm+bounces-55524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D44A9BA23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADF817B38B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 21:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252F41F866B;
	Thu, 24 Apr 2025 21:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5cOLPW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E01A5BB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531338; cv=none; b=u3afhIku47Qt6aXS/MdSEKOwsxbae0q6ojv84FlOItanrWZu5q4ee+KeXKoCyAyLF440c2oJNQcorDmzw5U/KDgi3N2SdQKvcySz9R8mwCgVj1mQ9M02EU2clEu+UMGlgXwdEHtiOudyjllL/z78dfhU7fFP4Kp4qxU/DZ/OZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531338; c=relaxed/simple;
	bh=ZNdVzpY/LUd9+IKYyg6TyrkzQBNOVPjKGBQAoCxGRAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzIXPYdDjHTfmbGFha3/tRlFu97aTrxvx2vovYhlpVALtgsktxSaCOlcsUf1HCN5VC+DSjO1B00X0EoNI3CH7awzPvCsfdztKB7GSLv121odzSyLH/bFRbjhkPgfeBA8/IjK4ssyRejYdVEf1yf6TMom/l3GKv0Klr8fX2QTsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5cOLPW8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmieD001075
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 21:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vJjKyI0rQI/9msOKqrosK9Bq
	uNXjcnMHw9Fb+7VsjdE=; b=P5cOLPW8tJRX6P/90ulOi4MeADMGmK9LLjAGy7y7
	0oI+UnDh0e4YfWrxqdBohtrb1TDHB3Kf7H9wFjHG/keMJFsWqfoji1fYIMikm4SW
	XZIbBw2qmwVHrVEcQfah8A5qEelf4WPPY4nSB5MygvuPs21BV+zU1JgR/TcXsJ8p
	Pxc1f1gNOXV2HBUxDOlEePVL27A9uo7kWMsRegqPEQ5EEy4i3bOVPkDwoqE4JREg
	zIwLyeLbBnXkmfH550nYhtvfrszE1pVGbjxNLvAHZkix6ZzUBJlQs6cQC5iVgZAn
	5kvTW6mQTaQ4T8Unwd+A5UgiKTfF0y42gh097fPsfl58XA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5f089-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 21:48:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so257972285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531334; x=1746136134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJjKyI0rQI/9msOKqrosK9BquNXjcnMHw9Fb+7VsjdE=;
        b=e8xj9cZzh39Ymgnpy6Xi13aJcz6MBZUuLhq2KfAU+OT1gsSGeBnFwO9ekERKmF3CDq
         zymQEOw9kSCJwU66OVV4JkYo7UqJY5UGynJ8bEf6/vUbozbs7TDrxcZY6A7JvTfSlNRt
         gOGQ0YmdJ2kHSExmbq7QGTIuQNmEB8GIDckssjtJV40tNYYk0HlacS3/AhIygj3HOXPQ
         FHfkrXAkh3lCGP0wn3clSWX/uFJwo0MtGoE1WGeMSHb1zZNHeWGxDYfjxZhXFuKg9Cw5
         PfkT4FZFRSu1DyT6PJYGzFhmtr5OlvL5LcEQR1rB7K4eCYOxcxKXHumspqFFhqcWULem
         /+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVibsXITiwLYtUvMVzViB08IsHUGCBa693Pt8m9nUDLk/4QWxNMID9y4W/OUUTixSBSXbClUktT8ld4tb9D@vger.kernel.org
X-Gm-Message-State: AOJu0YzS81gxNUuKEz7wcevkEH+1LKDHC6Em+YuCmeM84LbTCjWGoLws
	q5D4V3XPw2nZ2xC+IQ/9FQO0+Lexl17dSjpTSjj6NULSoNkGT7an2dBKKRKfGyxyVvnRd+52753
	wYgyr55TxEDJ9hOv1Beewdrt6/apvnsHVMyjVwVqzxrR3tgHCl4PGGN8oOrXImMwKdkVWPgrP
X-Gm-Gg: ASbGnctPE1/kypz0dpL8Q3SYod/f4ce9YjHOMdd53iPbJgWta6jjYKyzzB8zmHD9c0W
	GLH+9Zcosn3g7TA3jIGzfSi3WXHg7WQJiHqk9ojbTKdyw6M/0cgiIAEp/WVPytVaCiuIGIVqYGC
	502FD4k5I5u91mkNYaFJqk76EMvxcg7KF74eSz3+Ny3mMcr8cmJowvcTFlr1PWH98P23taO4lp4
	Am0dd4O6+hblH5+8Agnfkij1ykPk7esvIJ3AU8EuGw3md+TlfhxQrLOI9LvAFM/pTFX1UQzgxbz
	HjztSfHPkCSUqYtFfLWVuwtpkzZgWY+aiFydkZ+eqWMCOii/7Y6JUg7uTuJ0EBzYxFhU269UeBo
	=
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id af79cd13be357-7c9607d2caamr24641785a.54.1745531333783;
        Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0qarO4qVaIHzjVmmbkwRDLZaton6bL+gzlVk0PfxAhAHsQF6WlByLxtZIfk0z6pubJzUsMQ==
X-Received: by 2002:a05:620a:2a11:b0:7c7:aed7:907b with SMTP id af79cd13be357-7c9607d2caamr24639485a.54.1745531333520;
        Thu, 24 Apr 2025 14:48:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7fbbsm364985e87.159.2025.04.24.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:48:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:48:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <num3gu5gfpnu3hw7ofk5ado2hnmftgqw3jfzlp4pi4yganugvu@ntsyr6lwry7v>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-2-alex.vinarskis@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE1MyBTYWx0ZWRfX/c9ljvvH+Ozz Z9A+NRTzHgx3R00QIZ19yN51tajn7ETTXZKMDw1cu83vI8O0Mixs+eJCjaxmZ188dXECooCbahP lOO9UAI2MhtF325Dn8BbxAH0jfaMv4R2NVhz3bi/l78BWXXhRX5unQGDlT+tB+UaZK7iazlWQto
 PVtpKsgT64uQzBe+Qwu5EWF1se6UB+uy6r9u69N4naUxT+3p0ITzppPj7dsMq5C3jNO/N4D8ALQ D50MFA3bw+TfXOLO4V3arOewx5wue8jv2ZiFTBEGRoRqMBMx6KAVLHngn4qgzZduaQJl2PMSm1D pD+ocsKNDPiRbzAOBddS2+DOTCihzPgEF4scGFR4FNQl3uDr/KBESh40DhIvAxxIMnp+NK0PVMl
 a8euRQDo+O9cVo6TBxKCb2o2sGmD8r+n6qJlbkfQFb9gYzuoADMG5viWi46OfxDxzRZAK7ag
X-Proofpoint-GUID: VNCwkfuojRg2YQH_F19ZWRuigoUUG-b1
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680ab1c7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=7ctMvB4_1dO5SEtod34A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VNCwkfuojRg2YQH_F19ZWRuigoUUG-b1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=967
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240153

On Thu, Apr 17, 2025 at 04:10:32AM +0200, Aleksandrs Vinarskis wrote:
> Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> Section 3.6.7.6.1.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

