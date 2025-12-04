Return-Path: <linux-arm-msm+bounces-84337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840ACA311C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A476300339B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C562D3731;
	Thu,  4 Dec 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgAp/swa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGw7BB04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741162BEC32
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841610; cv=none; b=TpsqhxnTlRyMa1AXsJNE8Q273qxeseZJaCdXyDvMwYVdbeA9HJD8/803Kre8vBaduLTS9VqHSv1qIWPtKK4KG+UZ0KLJA4M87nVCls9E6I7LM4eWA4CBetidD5uRQXMkfx5Hn51VsjGzrDuT1y2pkD20YMsZiIIuOJSWlmSYNhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841610; c=relaxed/simple;
	bh=1J+vabWwmiDRAuhYdJwbD2m979iNY01SmBoY6o0IfpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcXQoWud24FTlMlCWjqlxbH0qo+7FVVr3MtM6EkkZd6UjIZ6B9GsVHn4Im9gQhs+vIMHKNy+/X7wnoXvz0++w20ID7LGHlFnGMGVQ4QAuRcthrQQGhCTKusPtNusjBDtjoLxJShyQMlt+LI0gf456LCqARabk8Sl8s6MOVIkIpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgAp/swa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGw7BB04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B48Uo0I1046845
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 09:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=; b=QgAp/swaJ0IDrkam
	xgFJVbyHR+m2S39k2olMMZEB7mKImEqRUh1FsllKFWMlaG3pksXDXclIbHnuwmC7
	5KRoMaekP6Dl9KUrxBPFtugJsiuDBtaBlKyUKlOgh0BGcJK9/0fdpsl3fdjOw7x1
	WUvv1R3/jcXa+USJazKQrfEW/zB/O8Hm6MKl8JNcXjwpJYwlQhu9XZMNOe3fZLHl
	RBiz32hL0Ax51A1JhqVwSPWX3VybRQFjO5wOUJCFo8jW6CptS+A5agK/vYLpX6CR
	0kUy6rlyfNquRCHCWH84taqraO6OOfhgwvMWYeGyTjQRKiEXfGPZr4LkRx8ZqirH
	hnv0pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6uvrajk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 09:46:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b24a25cff5so153077885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764841608; x=1765446408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=;
        b=CGw7BB04ATP6w5yXv6Qsj2bD1Z1LTJI6ZURCfkvd+QZbX/PgfxA6lVCCd1asXKq7y3
         oGszVL+HSHwLe3Ug3Ku25j0oETxDigtmUtyVc8lo2yivm1AFZbXf60b2SlFQjifVdtJf
         uxQ7+GDUWhprtyel+UFXFpM51Pi8XVFibRBZfQAoWsJjVx99Th3LmVbTNtKvfpetpAdQ
         QBabL1a73EaXTHdRDFhRExWXsmyKD3Dflgl++d3VrrR/AEKRy/Cz6AXbQuULnTLwlzii
         Si+Y1csBy0h7fauZyZhDXkP9Xe8/ehowmCqW7YHDmNhmzb1bT+hj1RNbm2yH2KLcn01L
         mdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841608; x=1765446408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Z/HfXyX0h3h8yE4qzxHIWyVY2HabPVYbfFHG1no/2M=;
        b=Yw9ZQ6LkN669qLvvk8A4dT1xBW0nLmhj61VOKr/tCxegXqX9+j7oYAZnW/ZR+u+3Lh
         /Lww+Uf4Zl1IM+5+GFSBl4tffMj9qTNQ6y+mhNmDE3AAIIubrxIyVAGCNn+FKMBFHNoU
         HkOG7Ngiow0ptZCljjfyK5NhLNKCEZsd7J0o+C9oUGMI1BbPD2ryGrzNOVfe8Jir5Q95
         pcl6K+q5ZiYmfPd4HmSnmb9srfJI/ENyisPJcPNGjFpHVg08WDwESKIySeQDo/KID7Wv
         j3Cnc6W0P7exXgELuezysRWS7yzNm+Y9oyZTIo10M9QZXEsDA/AbeJdc30LjeiB9zre1
         M4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUwUCdXwzAKYlE3dlD3x/+gCtso8orBKmQPJVpHE4VtGk34dMFbMuB3rzw/j+DnAfC8gtjKHslZkz73JYrX@vger.kernel.org
X-Gm-Message-State: AOJu0YynRySLwHyd1mhhHI9JJb/p4JHou/9XqnaEHNE3Rej5aAM9vgP7
	4DxMhjnamtwO5ENxN+Xv2a1VVTGA989wcer3usM8AY9ZG61f0Y2Z1qU5usbGYlfOyAxuw1qd+7t
	pcX8q4S4wRakKu7S6XxCz90hJbicyYeKaOInEcNfbFe/XDnKlbU+A9mKWljcNTOSmwoZ6
X-Gm-Gg: ASbGncsxcHwJCyggJ02QkJEQlIrXN2c2Bo6C7v2+FtsOKMdhIf6DoH/q3U3SWE7xOQe
	x0vs0aYJpumCr94OOqVGl9njZzLhNray/MNDFm0RiwgHFQPsvJbP6/Oc8waSj+QlWFc/nRAVsJm
	EX3/GGmXfrVIXwYixJnBHkT+Qo579/0Tsx7rDjIutrs2vTxQ2rJp/hcou8gpLk+BnMXziSIlyI/
	QcO/vs3Ly5MUr5onu7kEH0CSs1WqanRuRobMCoIivdUgqKYH3IF285MdVWny7jHthiTf8WjWWk4
	sZKUi3A2O8hJxMbkYNCiuCv7wuO19+zrF/av459wQua1+67auyZDtCDvFWPzqrtA0MENogY/Tl9
	vtWnd/leBaxbRUA4UWQCeWMyVQlB6GO1zU4hbZQ9av1BXmyUF6amfCoOHcuSXBDjjTJe62/L8BA
	Y35rRPFrBsCGEZIwxfLKqMkig=
X-Received: by 2002:a05:620a:46a9:b0:8b2:eae0:bc02 with SMTP id af79cd13be357-8b5e77339bfmr840432285a.88.1764841607327;
        Thu, 04 Dec 2025 01:46:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdzqWVxp5iXvWLw/Xt83XL2+yu0WboXvnBGeW5ESLenPupRJ5hZEkM33PPmCIfET4k+FdNPg==
X-Received: by 2002:a05:620a:46a9:b0:8b2:eae0:bc02 with SMTP id af79cd13be357-8b5e77339bfmr840429685a.88.1764841606828;
        Thu, 04 Dec 2025 01:46:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2495dsm344869e87.38.2025.12.04.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 01:46:46 -0800 (PST)
Date: Thu, 4 Dec 2025 11:46:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] drm/msm/dp: Add dpcd link_rate quirk for Surface
 Pro 11 OLED
Message-ID: <i46ywpjpe5ujrokpssqwaf2hcu4lwm5k3t3okyk25rfor3mhfj@hxl7zmpdgzte>
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-6-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201011457.17422-6-daleyo@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OSBTYWx0ZWRfX158/rLSY0FbQ
 hNSNzwWAc0lL4F+38ZxuEkZGJwNHheK0GOegkSqs3OADzbR7VqpsCSPWbKpupPjKYIzazUJlL8+
 o/c1+hMXVm1cmcYDbNU4a3oeSes4D6P3f4qbOlHojQxydrCpZtILPLnqsc6A9AJYKA9uTgaKMQA
 7UpHdQTiDm0945D6vV7jl/jiawulIxqj+TKcJ4Z+7C6RaWrHD2/9FFd8wwIZ75APA5CEdLAOhlI
 1P6t7LyokrTjuvwQ2Fug6IqDzan8LLrY5opKv750007YYkWvryYEyGKOFwTyJ3ZRZuZcFL/MXkm
 +ULgPf4Cqr6PDjKdiIr/eAdQLLX2whi4JVCu2qadL01vu3y7JwzbWpFIC8WP2U4fz7j85pUNel+
 4pJ4uHQmzKaM2lhhdq1boLuxshCiDQ==
X-Authority-Analysis: v=2.4 cv=d7n4CBjE c=1 sm=1 tr=0 ts=69315888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=6PeS3r3LZKgS9momG3EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0_LilYueAnq_ZeLTRr_vuk_znx_UCNJX
X-Proofpoint-GUID: 0_LilYueAnq_ZeLTRr_vuk_znx_UCNJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040079

On Mon, Dec 01, 2025 at 01:14:46AM +0000, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 (Denali)
> reports a max link rate value of 0 in the DPCD register, causing the
> panel to fail to probe.
> 
> Add a quirk for this panel during DPCD read to set the max link rate
> to 8.1Gbps (HBR3), which is the expected value as reported by the
> "EDPOverrideDPCDCaps" block found in the DSDT (0x1E).
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c       | 14 ++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  7 +++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 4aaeae4fa03c..a533fbb2988d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2543,6 +2543,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>  	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
> +	/* Samsung ATNA30DW01-1 OLED panel in Microsoft Surface Pro 11 reports a DP_MAX_LINK_RATE of 0 */
> +	{ OUI(0xBA, 0x41, 0x59), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_8_1_GBPS) },

NAK, DP_MAX_LINK_RATE = 0 is a part of the eDP standard. The driver
should use alternative method (Link Rate Table) to identify supported
link rates.

>  };
>  
>  #undef OUI

-- 
With best wishes
Dmitry

