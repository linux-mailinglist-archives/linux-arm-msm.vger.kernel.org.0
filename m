Return-Path: <linux-arm-msm+bounces-73129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F3B532F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EBBF1CC0E2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E90F21C19D;
	Thu, 11 Sep 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF+KtG0d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3D322A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595554; cv=none; b=YVEl5Wvy4PfX5ykepQKYaGT8YiKupdz6DQzELIK2adChYpK9BxVJWHuFOAmRvMm7vb6l+KCwgIotlpTRSkccyr7aS8ACx8jY+G87T1OyJaAIxi29tLsVRB5KGLkKTuaQqSTyqLnmtZp1f6NyfCRDC/I1YDk3oJ4MPSU5fGgF5eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595554; c=relaxed/simple;
	bh=eJ/guibiApuxYOyuexqb55s4sia4Xi3oTrbQVvt2Xvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrFm1X3xb83twHm39zwYh3qCBAE2p9WII7J1DaUsybstJTwWAB6C4NpcQaGBGj8cZ+laDKGtzL2+9lPDP/queXeQYuurKSx0kkp9egCBHc2soT15jf4OxSDDABT8N9j0l1MSzr5wx34OQDXndHuwLwBv4sWPNT21CTKmAD8u+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF+KtG0d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEkNw030862
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=erQHYt3izy31hhOi7nQaR12L
	KzLFsLkvUdjCmOIgf4U=; b=NF+KtG0dJrO+Jah9l4R1SQCTtI8Ig4bugDgBUDB3
	Q+tnn9DOXj9Cdz9U2r89R18AiyibwLhEt8DN11Pj8TQP8JWJhLN1zLjqrBwte5mI
	rCNPLEzQ10b8nRvzPYoumLmEz8KrYr08erJ62L6GSFvqhcD+FGAVmVrWR3O8zpm2
	k9G6G2ZqzfkYjaYQoIahqe4wAkekDbv19idhB7aJOoFpz/iURoLabuEBuL560VLx
	LvkUoruTmoYuB3hx5Nc1SkakwiaIm981eiz6gPJxXB/IUow0/9/i2qHFV1bS3qQs
	0cEa4M/bjyT57glR9zrEgMfQF3yOzzMmEnHmvMJYCwdaIA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7fvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:59:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-71ff3e1256cso18442156d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757595551; x=1758200351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erQHYt3izy31hhOi7nQaR12LKzLFsLkvUdjCmOIgf4U=;
        b=KAud2UJrrzh5rCo+L6u6fucJszapo8QdSLQdFDsuLLMo+TfbcDAYwDq/MXAlOa9PWz
         7ezAU3nrhvKOHdgJDkQIYkOrW67agGJ3RcSX+7beihAxcDfmZ7dogqyObtGDqm1LUzkQ
         rh668CaR59IDlG9lWpFoB3rXmDzTNl2xdn/++2ZBWU9TQwigRZI06hZ7WfBc/royh7vN
         AJNH7fbZJw6MxIDGEUJNGSChTV/ZZvvgmafp779mRFp19rAEIGAUmih9L6DTLrVYAJVT
         2DXZ3wvlTkZOdg9uHFWf+OGphlquI47ag0uOydSvf6eIef1eeCZ8F8A7a4MimNSy5m2g
         BWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHnOowFdiiRO1EM2S2NQLisQjJgvv1Ewnj1jVrTp5V0lm7ughEIacknrM7+kErEt0/Bm+uQ7ilKIrjO8L@vger.kernel.org
X-Gm-Message-State: AOJu0YxobSv0r5NiSO7DyEK83FouD8VZw+F7ER4gTqMCX9sSCrXH+Q3q
	uHqELuPabpSqVLpvt/T18cF2NqXR/h0b1Vl4byd78Fa00c12ACbluFB2Gp9NENTJJ/Q4w0/88pj
	g6kDFLdELlZqP/Texp6CfhwZARJd+08OvVwJHvNiJpH2O/bdKw1pvjipvFh+4fMwMBYG7
X-Gm-Gg: ASbGncuBA7ycJjgnQR1otyW1BvVaeh8MPRSsZBxsr+FBh1DQFi3HlQ99ibiirqI831h
	Jp6Ah9qDKULRPUDusNhHujX2SzowbzwzhTtDOH7WQBwDk33FOrir87nMmFzciVSPfJl5JJKKIgy
	c+WVABk5v8Wmo4Y95ULfi+85+QtEl9tf1TNbSFj153gUWNn87OYAz1WGbziWy9dz5KbP9kN34Qu
	xlwA98QKZYsfhR8uLAdpfSyEbCN6qvmr4+GReQCjJGoWODNg5g1yoz3lNI8n8sy40LdPCspG5u/
	inG4xGEJK1p1kXyQgIfDtlAn16vML9lb0qimC+1p9NqVenOjbkxpJkzxhW4l3Yf/cWNGBLurc7h
	jMGDX3oG6ErqiWZNnoyFGbNnPqc3dGr8ZnuR/6yFWU0npWOsKKuyS
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id 6a1803df08f44-7393ec167f7mr231642606d6.53.1757595549386;
        Thu, 11 Sep 2025 05:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELAL9kOk9qQGqQpSk7nyLvkiKnEOMoOscLtU6SuZkaDa8BaY8uCBWjurK/6Kut9nEHxlP7Tg==
X-Received: by 2002:a05:6214:2a4a:b0:729:9ec8:a1a6 with SMTP id 6a1803df08f44-7393ec167f7mr231642076d6.53.1757595548865;
        Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a31a1asm400573e87.134.2025.09.11.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:59:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:59:06 +0300
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
Subject: Re: [PATCH 6/6] drm/msm/dp: Add support for Glymur
Message-ID: <gteqgamsehrmaf2hro4uhqydckexjlvkzlpkj3xyt2w2derf6t@evk22k5y4bpb>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-6-d391a343292e@linaro.org>
X-Proofpoint-ORIG-GUID: fK1Ja4UtwqU_nQ2nTtgkkxC3Vk2M23MK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXyCP8Go0FSUjk
 0WpeIIqBgzVwYdYH6hTShn8Docz6Kx1mHTyjQojdioz1P7cgKlczDTLccHMdm5CERmSRoBrY38Q
 crUFPcfRkJx8Xzgti47tgDPGqQBsxVpgIhkLCBESZch0nraHhOy8onLvOMvN7IYa0UgjDSM4s/o
 hwao68wS1AFB8M9zliOqnranRtPHhujCdfbtQNaff4dlz0L55taRWS+2vWXSdg0RdZEPFKmP0OC
 /331jeVagfHMuH05wECwOgKl7xKxxcMLBH4tpW/SLJXs1vIMlLCIswGLAiMrTRYzbjO8CcVS3Ut
 ZzHktD1jpr2Zdmt0poqSnz4vdN6iQP8PBnL5p+Leha2ZJbl4qAiGAhUrHtI46UJHGLFSaUkRPRA
 PNW64Grr
X-Proofpoint-GUID: fK1Ja4UtwqU_nQ2nTtgkkxC3Vk2M23MK
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2c7a0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=r4hCbaOVonaLTjXU3fkA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Thu, Sep 11, 2025 at 03:28:53PM +0300, Abel Vesa wrote:
> The Qualcomm Glymur platform comes with 4 DisplayPort controllers, which
> have different offsets than all previous platforms. Describe them and add
> the compatible.

It's not only about offsets. It has different core revision, so it
varrants a new compat string.

With the commit message updated:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
With best wishes
Dmitry

