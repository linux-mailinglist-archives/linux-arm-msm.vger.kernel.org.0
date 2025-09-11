Return-Path: <linux-arm-msm+bounces-73128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC6B532E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6939F1766A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16DC322C8B;
	Thu, 11 Sep 2025 12:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOFpioyS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45312322C74
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595450; cv=none; b=ojyRN5tyWHaTs+LUS2Xai8LN25r3winhGLWw3C/FWJu/er7jvA1KU/IHbkH7T8jJlxhKPaVP+Ejvena5m2zoI87CmkQqtXZaOVpEKMA/E63SC6OO83XFSvU/nyZLq0DneJxprcVE0kLPtj+VsQAfly3B2dclfkm5LmpXEd06oiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595450; c=relaxed/simple;
	bh=eYP9ldOr8fFehKQpvW8BhB6kTjTJQtw4xncb4uUpb7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIV98ocJ85TH57SK0JdCTBK/KnPZQGfRC22p1Uba/4Ga1W1yFB51UdiQG9lTua4+b3CJEdS5Y8f+KY/nchNsVb+20kH9Lp3MJIOS9OCoDh6nhhrtu8l/0mRVZ0zDmxE7tegWrMTt85xW3/LtWu6fgAxpPhPwUc2AnV+4LpbFwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOFpioyS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEkNl030862
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5F4kfREjeTfa3WqC2b/52lNM
	yv9yD3hosyjF57uJTA8=; b=LOFpioyS9HMKxtSXT1eBG8itb3soeCkkvdviL5y7
	r7k7dvSbrqFumJfMv129e9MLbytCrCNOlkgq/BzGfpKPyQYRXDQfYYsnyhfQ2LzC
	jiFiHMPazPyXNf87ca9RgMd5JlYmblWTs0lIbK7JtevSbJR8Z7XTwpnQI/jZSucv
	CYzI3gpj3CMVywF4txmp9Bo/ZzjqOhO0AhvGbgf83fcSaBLBnI9I1/YT+Up6Y6TP
	PUEG+Lwb/UC6OjzgHy5B4W/pWH4zOSEY4GVR+Gf4t6NDeAcWBOT4ED8XhNLc1Sc3
	il3+Agv3M2bXsMT71eo23InBbrzEKBBlyLkAKgWpuSOylQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7fqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:57:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-817ecd47971so434152785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595447; x=1758200247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F4kfREjeTfa3WqC2b/52lNMyv9yD3hosyjF57uJTA8=;
        b=KzI2suoizShISCL1ksB9aGzOYAMoK2YALYnQj0EXr43pOry0glcDQPFGbOrRDpYvB9
         /WwzyAtG5uAB4GHqSfzN75qeXiurJGxzUPwFMInG3TJJv4Qi1QVNqZXuCB84Ke8VL1EJ
         jzes7RdK124m5vtXs92kWqyVv9qxH6HQPkMGosl7Zo5sOhBIn04XC+8JXMb+TQNxw+bz
         utNR+9dCqsZLo0q8FJujsvQJGkWYCyl8G7mL+fJ4JYWk6cdvEk9I09KtRrPGel/fBMfV
         jsN86ni/2tVASwg8ddUw5H7jYJn8OMzpIolET10s9aeiKwbR2GnbrxEfooDxjG9UFQ5Q
         FegA==
X-Forwarded-Encrypted: i=1; AJvYcCVaz6hgW2Jp+GBGvtHkk0l6UZtWtrh7H/H92JL3Y1VqWHbmDf8RXjol8UgjBqxXjuQPG+cHmnfYo3riNHgZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyQ1+f1sxJnUw0tQvVdhfQaYt+qoyyuStuR0CSdu6ssDIX8YC
	1hgY5WCc/9Dg1Dtva8KpfpQoHyqEJkbeqTBEUT7vT1v9KAIasJ5SfAay09XqaupFxJ/YLLArmvB
	tBbDGeWXp7S86fTig6uByiLdzMHGAsUMbYru/ePbF/9In/QamFPX24jfaH5YB6BCwQNvv
X-Gm-Gg: ASbGncsneIHKNL171ETrOnufmOEZdSCysLBN/qXmnwko63xWO9e5NettkPYgMoy7s6p
	Iin19CTDB/8dGGfb5EgVJgmoQoccby6gBZ2QVr5+343u0qja3df609ie7b9YGm9KOW57R4THD6Q
	6uHoip7ypnQV7K15CU0pqMWtFsYm44dOtcsJMlLLHoWkad1yOKtuNEFmpPUcZOVNGu8QR/CYrwC
	0l4Z7u04DgmgKgytB9oBF2RDTn8+yPW4xIG5LA/tsb21Ggn2lJaQnjq6G99GvQcfIpw/6YE3xjl
	+15f2u1MEfc1SB4wBP2TvOzmRTma3msf+UtGsWc3t9P43eDv1EE+bk4BvAmmqGWChu9AtqWzcvu
	8SM7p77jpgLmdxiW5d4oEzMgW4lLI6sW2Z5GS5PWSfwKMK5PN4aWY
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id d75a77b69052e-4b6346f39e1mr42311641cf.12.1757595446919;
        Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmfeR7fqbYQsz/Cx0vhB0h7BtieRzZWfwREik41OqRawcDy0H0xPFZm8LueVdNLZmIIf7boA==
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id d75a77b69052e-4b6346f39e1mr42311341cf.12.1757595446424;
        Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b5fadsm422254e87.6.2025.09.11.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:57:25 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/dpu: Add support for Glymur
Message-ID: <d7his4r3txgmpgptl6ohnjzslm5s3wquxxsi67gli4wcyszlsd@klru2kjlk6i4>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
X-Proofpoint-ORIG-GUID: q4gOu9pxUr9k1EeTg5lYxg1XhANUHCdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX+k8IBPq0R7iB
 W+Z962Rdbi2eDqpQCP4xKsQwfVTlTwL8SGYh8N9S3I2LajLeNnLnlSzJPzdA2Wtm6lPNjVAZ3hV
 xEQXYtk4bJJnvKGjAQSHZzEpGtrpYym2xkBO15S2KScm3VvvvVFlp7yd9VtX102KrkkZ/rfObLP
 l0rD17h3Au40TIvXr1YacfiUMTgeJ5YYlywc3f7pFALdjUw3tFIFUnYqI7tLOpzGdJ/7RBkNn8x
 UcaXn5IN0mhKVWYCH6uS+GEDvNrSEaJsF3Pv7QDyndIdOpUlVJ+BfKONlYiZW9ZyWSsErZ0XGyo
 wXZ13twbqJJiolZzwDT4qx6xAj9fjhDGqCS6YqesXrx/nlS9h6cphVtFqXzNyDvOfFdQNJylV5k
 Y8kaDbVj
X-Proofpoint-GUID: q4gOu9pxUr9k1EeTg5lYxg1XhANUHCdR
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2c738 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5WwtQVXMiuTecYWR00A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Thu, Sep 11, 2025 at 03:28:52PM +0300, Abel Vesa wrote:
> Add DPU version v12.2 support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 550 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

