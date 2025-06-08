Return-Path: <linux-arm-msm+bounces-60550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43013AD1542
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 00:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F0A17A3AF5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jun 2025 22:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E86120B7EC;
	Sun,  8 Jun 2025 22:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoRg3//g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF761D47B4
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jun 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422145; cv=none; b=jZegs6cbU+Tf0eYWnBSW/z2ahOjfPyWU38k2a8u9neSYAX7mDNpn0+I+FtbspIAjJeKYDocmnUEeMAokf9IpDNilhzU50kjBK2OZOp7lYeOVmkOe9RbruMss1COSkkJ/vUhN1atP8aKsg4aNggTeGVSJ71Zh5COL+Lq7r9ouSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422145; c=relaxed/simple;
	bh=MzM62NnKSwU0yyDvO3Tn/ggJct8nE5zR/hSw9Y0McNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2meIwAVSwBpMx3jomki8CZhuA5adaKusaGj5OOA4wNt9nRDdyzxIytFI+dObJsbDgDkPyjc6ZRdVNcP1BdxyLXdyXmG4eUmcqWxeQffIbJJWgSYdF35MHNQMJ5SJ5zAnpZEBqVcXBLwJsDTx556CyhxxL2zJk0FY3PuwU/+l5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoRg3//g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558M0WvO014366
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Jun 2025 22:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EKuV41kanFRSiy3Jvl+j+58U
	7yzzRT98y5OAQjFVSAM=; b=EoRg3//gq2JD1FZDiZXRNu4ss6L+3/+TdBYSFM8v
	MCt7mnIrG7J1tyjIgsTLDCGO2H63GH+5fUk0kmVSI/aT/Zayj20OzXzWEMLuhHPQ
	hJ6E4YCFqVzhnATNkkyooUQDK0gRaiX7lDliFZICPViNDuQrz7kovvIwRDo3LAdD
	TFGv9OxI3xzQ7TLCm753BP1Dwj8JV2TYVO337cH3+/JYJT0Gd8CNrrPTZ/QRywAd
	vp1F0/3PzoCxzRC08NTfLEDJgLYlHaZyhd/q0g/s6rZHLe6R1x/mxMYJV8vo4Pmb
	yzZ6h9JbaaQKbwYgP7Hypd9jcfFTPGNTT3KnjmWk7bLI7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75rbyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 22:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so961053885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 15:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749422141; x=1750026941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKuV41kanFRSiy3Jvl+j+58U7yzzRT98y5OAQjFVSAM=;
        b=uEPy+nwLpTLMHcwhWJNUEePpFm5zwFN+IdJ7G72LJPj5XUZCe8AWw0ru2L+IE4n9HP
         NFLXkIVkO1WuEMZmVSidMCAfiMam15jCrHCfm3q3mgoHs5ILf1N06+LZ3kZxKl1cfAjh
         32iYDGxupuiGcRZcVSxZimbBHyNzhBHiIFUy3LR4NwoWoKRRLTW8l48G39/xrfZ1uuMA
         fyhSexSTsRKjA0W+dY2Pu5BrZk5lQYWf0RFflWEKkz326+R/1QB7oQEDuztwFE8ORnke
         Y1F9xdgfYdt9Gjzw1oUMmqoSuD8q8+FHXbyWl4GoIb5sFa9UIstvHPRYomCh0C2kVXGi
         QBFg==
X-Forwarded-Encrypted: i=1; AJvYcCWpX8+ibVRahHIm9nRT2YFcZ2KEA9knvYqi+Yfjm61twb/qFBlCKGPd3eFcAsrMibs/P6gJy8jGKBYhwtvk@vger.kernel.org
X-Gm-Message-State: AOJu0YwppEbv0HlNkdMDiUvGU7Fy2lUeUdLg8BcHGtkCs+Gs5XjECqZX
	8KnNMUj/Kp2L7Tn6sr4WV73M6SIK/dUMDP7Ilz+uiwU6uyShhR69cZdoD//GXMvVXc5eSj6ZuF/
	1eoWpuQXNehZBGOjInOd7nv7C0IdhipRx7bUGmCKGLd5MLpoL4l3ZB/MaODLlFG1aIugK
X-Gm-Gg: ASbGncuH0PKArmQjC2O2pBO7AJT5Av9mM4nMXYzDn0ccGke8v230STkqqevs1NXv70T
	CcIOYimHdlW7ChsojIiuxXV1pR1V5+19rizon7+Yfx9ceYh+HZFj7ZN2VFHf75P4ckYF8DNFbGz
	Jwv9ATMcAhM+6JtoXqAgtCliCsr4ndz+EjsAPwY7UUS9/5OvGnakrifjGvYyNZN/cb7hoxiIrwm
	62TpVSHBrDW4yeIzFjnr03h9WvF5+aPXnPzjCZTgsHVRhTaRZAc2A5ez3u/HY3uII6SuZx3sVT0
	9nW+wNuquBoEjY5TAVKaETpNZ2SN5rw1yc9gGCwXxSsQAdckKoo4JGIoyVqfiTuw8kfISL+mrfd
	WM9a8txUEXQ==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7d229863426mr1907149085a.7.1749422140865;
        Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjoOoW4vYfivFJJy31TrYZtEgVAcRnTjvKyrzMsvVqgoz2mkewEAd2QDC6UYYNCWyWKNoopw==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7d229863426mr1907147185a.7.1749422140521;
        Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a61esm887119e87.163.2025.06.08.15.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:35:38 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <t6gtx5ygd4dkizpgupedef7tnldwlbvhcp4m4ypw4447fctull@35hwlznm6lv3>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-GUID: P-AEN_1A6GnGdmtczO40Y0x4tyWn2fiU
X-Proofpoint-ORIG-GUID: P-AEN_1A6GnGdmtczO40Y0x4tyWn2fiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfXxruKUoV3FIJP
 F9KQUSFGgn6F4BCI0YXM4x3F2IWWbhCo6TeqFEY4l9O3Pvr0fAX0QqSKzYSlTPrQr/o40hb25r1
 1tyhRy6nmOYzR13QvEYY9ZyX5s3TVRyYbIhICXYOfgmn/03IHvKjJTZektfVV6IFySyCUbQdhEr
 xQIPTIKECBeXU6lxzRCdr4cDiD22CRAqfYzu4hzOGD/G7ZsFxoZb3kts+XbyX56mJmEp78ogdul
 2yBU5KHLZTGY6nH+r/X3uiM4ToDaSE2wokd4oe1pWmYNryqEFcDt9B9/DPxHifWEenc4MvZ4wdU
 PZLIftzMPAorbQSd2PDbZXPVMmmhzzwKuskLwLScoxKdAkcPUlwXsUd6FpwoAu54LiTlOTW0VoI
 glxYR/yga+PgukczsbgxLx+l2qhVqxlDJuu6KM3+81Xt7sW6wLDibgiSrsaJge1CRt3OlNsx
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846103d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080184

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

I was able to run DP tests on SDM845. These changes are required on that
platform, disabling programmable fetch is not enough.

-- 
With best wishes
Dmitry

