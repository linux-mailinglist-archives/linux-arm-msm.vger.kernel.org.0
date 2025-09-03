Return-Path: <linux-arm-msm+bounces-71773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED070B41A0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B18C05468B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FCA23D7E0;
	Wed,  3 Sep 2025 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emsqakHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B851EA6F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891818; cv=none; b=dRkXh4A9Iinz8QBcUgwyjRhe/XlDhDX8NAFXbXqM3e9IW2G4nWvMvs1TFzBXWeoOAIm5nQyh2OpKcgbdD8TEaicBoqLlts/qaxcOuVKK9pZd/I2mahovxvXWI5zWHtp5S0dihp8rIPfXGGFoGXmrNaP5eHcZe5aJIpk5Z/jawho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891818; c=relaxed/simple;
	bh=p8csoE+g9i/JUYrP0reNQc0pKV8iCq/C5fgj9xtySvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilhCFhjo93bnAK3v9qgahDuu9a/gvEDb8g+4fPUy45+degImgyI2BBquwt+nJ6InaWRuuAifvfoXE5cX49j7DxRrZweYqjypcIu5jAq/JF4nfP/yMkd2DWHVlpTs65QWiGNTjqiGuhvKB/kX7KlYAUeyABexVRO0SmVvS5mpToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emsqakHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58327HFS010148
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VR2iqlpPGndqBZFzRTnrJAZ1
	ADEc/HrM9Jf0+mHC/Lg=; b=emsqakHi2lzXHfrsTQNrTMRswHsZGuewjNcTD1QV
	2ICTx+HhdBoUYNDVgySPULe+BZ/oZNBBM+6QzAywjXPj5nwqwDjD4ZenKRjqQDBP
	P0EJC9B7LTYdtE+a9sAzLxYcC61a7MT0u9L1Hw4riZGb9oU2YUAgLBe7QwUlNpQA
	lVpbAEQc2iErpMPjUV5MLxJo9ZjGo4Yb3nA6fjLRiqmL8Lj7iHVXIc5/keMxMtkS
	Tjh17+Pqx8ocUTAGOK94lUxjvSRLaazFhIizbqkrm84Cxh7OS4eWV5HuP2HceGVO
	n1Ds7KmD9hIl3v0UaC8nQarf5T+Ybr5CQ5IEBTFqR2Fx7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ek5tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:30:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72631c2c2f7so3855246d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891814; x=1757496614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR2iqlpPGndqBZFzRTnrJAZ1ADEc/HrM9Jf0+mHC/Lg=;
        b=DOpnWEyCtEuoX3G22zEKx2frnPObcq6KKnPv6zWpiIWi9m1rCOnu7lWk+yBzPVTMog
         NRQNv0VlmwxgQTdlR5dfYKsiwLauGmqeVf6fQAqHjMD5SEmRhMps4ZpcMYjaeufdoOSy
         yacKFx46vnvjFIHMzY7GYVmZqHOZi9dMFmSP6jZ9PnaTBY1wFLNwQha9pyeOt7K1S7Rk
         P/rvqPXKL7o/x4lskcKtaAudOyzO8Rw0fEoqKDZD1RauoAC4FK7smAgM2Tpp1Jcogxab
         PzbE+YYphgdlMweTvnseBypKPa4kcQYtxWPAThVmVFJeD8ydPGcoJWjR42wsUwn+RNsG
         JF4g==
X-Forwarded-Encrypted: i=1; AJvYcCXj1dpnszuCn+yktl6LJUAHgF+q8/eg049yv6hNpXI43Qv7A/PeIEwMk3AgGvUI3H+ageVGFmoClw4M2GBl@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgbpqxYpAhnaCEIK3oOfTxQo6Zd6cU4fR6a1278cosf18mZJy
	Y/KfpgmWfRCNSeAMByWNHmXZ1cc8DDjfeCGcQDzEqyoEMcA7l+uNsqOocHAGeXCC1zJmjEcL55t
	2D3pdAAEcwR+WnwFvTjIFp8MY4F7Vpf7ZPCie6nrq2Nr5zi/BgVtCgQ25baG0s8boS/V7
X-Gm-Gg: ASbGncuqr3WD0UlveGw5Ts7AbsDWCUYX/xV5Gdn/KD2cas3F1HSEyE29MMb+KVrGJxa
	WrnC4Skt6b57f6G/GR2V6BbpGWV7k6Oks4FrA0082WONTJN793wcth+RpUtVt0f6BvQna5i0Lgk
	sqFPh+I9TG8oCL23LpTvlX+ztL+WWNAm11BIEApJYZGSNcS/EEGmAnHhphjSf41rY2/4aJ9yjzx
	oqg5JMHcNkyFjythlEV9ULKRDez4/+rVR0q80sQDkXvW4aXDhVOrvsOzk2rN0BjqzldHYor49PE
	Glc/+hbOJTAZDsoVeDy1xYH9RYH/8Q9JnqJ8farxeUFonaLnjXeP33G42NgWCmGfDoz+lXrr/bX
	Nxu4adHribLq4+6jOXWcDagzgxoHNuaVqBSiYivcT0HI83FRdSAlm
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id 6a1803df08f44-71aa3beaf2bmr97801686d6.53.1756891814018;
        Wed, 03 Sep 2025 02:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpD2N/3qjIowrxvQnC6imiMX7OAFJFGHqei1Jwm2q0yHkKx6yG1SLbJKLYa3X8+eZrl0XbAQ==
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id 6a1803df08f44-71aa3beaf2bmr97801396d6.53.1756891813408;
        Wed, 03 Sep 2025 02:30:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfbfa8sm400984e87.96.2025.09.03.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 02:30:12 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:30:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for A623 GPU
Message-ID: <vit4he67rvz2yjihjz6lio4cnkfr3eqydcayspijssn3o3mgqf@6eyxrpkwvfhp>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
X-Proofpoint-GUID: Um62GRy0gYxjAuvsSkkCKOCRkVfog5Zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX5Q57oMMYjbST
 Q5hkRjyXriA2kcQAt5j9yWk1pr3opGUYequ6db9LKUm9DkmHhCmeLSV+oz5ES64vQZHwbCLH35u
 wsXJ8MDMPuewJ/0CNYiurLl2st3Rl/iHdvoVCZg5AAIpOx2TW9i4Qb0t0qjVCpU0vrrearGuv6Y
 Ah2Rc3j73frE6t7g4qaBrjqfurQkpCwQvNFqZnkEvJlMsSB1O3d1O41EKsGIy+36Uxa4ayZzqzb
 5ieOKheCfQXJi1hNpEKl56eEX0IHLkbmfeaVHeuLFi7c5/IO4wjkGbKv/hSbmkeuX4KvcsPzve3
 8teNzOEOM4pMDvfSQkLn7rdAV4wRII1gb5M4WZ99alIyMBRLEZxfoVCNM37iHzvGQx0Gcpzv2En
 BNA/i5Rv
X-Proofpoint-ORIG-GUID: Um62GRy0gYxjAuvsSkkCKOCRkVfog5Zo
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b80aa8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fAZFXs4-8VxaQHOqD40A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Wed, Sep 03, 2025 at 12:49:53PM +0530, Akhil P Oommen wrote:
> Add the speedbin mappings for Adreno 623 GPU.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

