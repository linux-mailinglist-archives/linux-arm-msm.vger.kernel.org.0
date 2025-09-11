Return-Path: <linux-arm-msm+bounces-73130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D423B53307
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2A21616B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAFF321F40;
	Thu, 11 Sep 2025 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biaE/Mqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222EF31E0EA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595731; cv=none; b=bvRoFzJCvVMoTKvt5p4yHwUkZZr6quGCWegdEl6robvOMTo6wXYt91JXGMU6GsBNVG9Tsmp6CnfbnPgkp134pgeluDR3tG9hxeDyDfqYtG+p2NPCLffjW307p2mIXZg4NvWqizmLHDpeoQul4j0adxNjxbBxWasOb71m/TnjjGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595731; c=relaxed/simple;
	bh=a3/3F1Hwla8iCniEm5e+upfONffsv2k2pBEzDuVTuIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmnNUlzf5A5lOA85XVWHgK2Oji5gNbEpd0jfhEA1rbvW18iikL3xHs2bg0tRUn8fkzfVoDo/2KbFTJDxmyEbb43s5nUh4qlC+fBKm8r4pkO4YCQdgUR7RaYTc3yryEkGnZPbVocF7MpGhQDBWzd5tJYdfL3QsnxDL7lM6C7GWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biaE/Mqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBBdi4008248
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OTyomZaXMdmAPphIgRSMvoxt
	+heXM0Jm3kdfZ5nhAw0=; b=biaE/Mqw6t8Yhq+11rK5s6HymjveFoH84bZdi+A4
	QXLKg6aHYBSNuhLIU+EBiH3ipTpy09GohI3kFprt7m9oe6W2kuQoEII/jVpov/qp
	0FnoYlAUhh2ow7Yj6U/98nsEQwDWInI7Uo6lENaZ1z56UtRAXRx/iB9aiOaFNdEB
	QfNGV5O2DZpTJ1jFlI3SWZV03zRIfjZxokCI9Dk5HsQY4SJGQjLxr9EeS/p2/AvY
	CX9Q50nA9LDqoThi5P1vD2szYpw+JP+0fDGXT0Kix0ib9VJR+YXGgpBZGY2Svv9h
	6ffb9OUJNbXGnxAsW229ttwxlMd/5V8Ng8iVTgW/BQdvPQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapqyd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:02:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-544b6ac1916so2963739e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595728; x=1758200528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTyomZaXMdmAPphIgRSMvoxt+heXM0Jm3kdfZ5nhAw0=;
        b=J8Dral02PMMbdVxXYK2Exnh7g7xAP6IJqPmy6vkrfshlC4CdL1v5EAFY1x+m06yW1D
         Srdw3XTgvWV6LX/4NTBm1xU91K4vJX3WojCDBoQJ8faONUaCxoRI1kG5aiFlDucjgVBf
         JhylPeBrWByALWcXHlx3x6yi7ZzXCeuXPhA9OfJ6aVU/ee9VkNEVmMgOaF5/+6esYzcE
         kmyJ2yT/UVJnF10jK9RkAQVlAN2Y+/vKTub71uLz6ay3gSDGfh+t4zPChAYdHgJOjEjz
         UrYdwsa6YT6MyCfpqDN9/5gtQsr9rTqqXNsujG1zmysiyVjbStDuU1GIf4nVOmz7e6ex
         sX+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpy+TXiKbWa46chK/s4EASkKCjd5TEDogaCsf3rFZnoyHGtG/yeYwVu6f/B6jPUArVib1+MbYWiP1qM/TN@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKyRecE59d8oIUkDEeux80UVTWveBKUmbPXgU+rXU611479l4
	q9L3XqEIsflKNwW99OdHh/8SFSC8Nsh+VIoEcJtajdVqI4/zzRP5/yepxIsPvtUOTMQCAs1V86h
	5Mk/HAhfS9BjvQmuj/EnhNm8OWcfzYz7oFiqF/aPHdo5+9lEnDdHYA4NOPgFHLBrQt69O
X-Gm-Gg: ASbGnctE/VgmyaXzMYKL0mY1/SFDMxQ7Wa94NPZr63Bv5wSoXXTOFVfQ1MrsP9UHsq9
	+d89Dyb4Qb0sF5zwj3BHgWYWIisNpLE0M1Y4z9YIuBVc1kSCzAHAuA7b8uVLVJrIK9cgJcFTTf4
	jFwK1PR1CXIXH47NvYg0rdTA2fkc7Su5xU+DS9j7Izci/0q9LkSOMCMAb/ED+3CMsEakZvgTzT/
	x4vy8r+HMBrrwfHDXJu2h2bk5NwjwUpxnNBWZcv2kkmOR8sI0w/rV8b/vfL/nntdGBxG2j142o6
	O8NK4Jd1QyL71z96hzPJ7loh/9kwgYNvOSUKZGo5L76TlVFFstxaABe4WVwwZ75ZC7Hncyn3UzC
	ZwV+98lh7xjzhelvM0bulSQ8XZ+HVVDOhprFpPDECPsYGMcmqchRM
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id 71dfb90a1353d-54a0972db37mr1035136e0c.1.1757595726879;
        Thu, 11 Sep 2025 06:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhv0v3J8Y27t/nw4xhWgdgl8LDzWqA4+LUKRc00IUTMLdn35XdPB2ACx0uT5AlsOiegud0kQ==
X-Received: by 2002:a05:6122:6315:b0:53a:d808:1ff2 with SMTP id 71dfb90a1353d-54a0972db37mr1035032e0c.1.1757595725938;
        Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63d50sm414692e87.65.2025.09.11.06.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:02:05 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:02:01 +0300
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
Subject: Re: [PATCH 4/6] drm/msm/mdss: Add Glymur device configuration
Message-ID: <hxyh75aajlaymbvaghftcz56ttbpnmxfnc7amr66hhpbt6n5sg@msh4ljalgmvv>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-4-d391a343292e@linaro.org>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c2c850 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vuHc2ZSrshEqWGcFJyYA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 344-h1UE6yjJsWg1DSzItkvgOF1XNhyI
X-Proofpoint-ORIG-GUID: 344-h1UE6yjJsWg1DSzItkvgOF1XNhyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX4Djp0V7gO3fw
 wqZAvJB5uoOJ0P2o7c2f4JzhjiqxMnGZ7YX2Mpvp2tZfRwWTuLNeTIDmcPZFT7tqSsw5YZbxEJn
 L6iFlVCtH26UmYaZTtwPVuSrPef93U+qwhAlZFS6HNrl2Vm5FvlH4eZ1xsvPdIE/s+QIkNmksH5
 2rRzl2WepiqFpjvFooZsmMQsUbTpOuzS8oFkq+FHyv1IfQfE9/NTVokyDiTcEyqtjciPZoRM4qk
 tGmutjUH+qrN5YBmh7yen1KFeaf2ztl7qcbrIBln+413Xm05kjUI89IgUgf4Lp0uTH0pxavCMVJ
 9owTcTG94uQdgPtEJ3uaS4W8EZCM98gz+iCXpO9+nJ5uLBeABP8VCB7rsWUsl6JD9mfts4BTdEL
 YSI64CPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On Thu, Sep 11, 2025 at 03:28:51PM +0300, Abel Vesa wrote:
> Add Mobile Display Subsystem (MDSS) support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

