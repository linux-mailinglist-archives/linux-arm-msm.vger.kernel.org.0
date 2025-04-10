Return-Path: <linux-arm-msm+bounces-53907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AE5A84D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372129A71CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 19:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB56128F945;
	Thu, 10 Apr 2025 19:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrTsBVS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BC1E7C0E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314250; cv=none; b=j7iNJ+yl4Re9NeSEtdKJEbawxcOkDnO3IW9TT08P6C3XKiAOLA40ggMSSmZ7cUxLEriKsg7i9dI5VrLSL4ER9EaRnMPpwb6X2u28U7CaOsOYrh8iz7lXGQNYB1oLUxwNjh+Kp8xZ462/+BxrC3Pa6cvQP8+4cJzK4W0OSWA0+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314250; c=relaxed/simple;
	bh=iMsdDLXheF8MRz+4l0Yir4tgR3MOExzWlGax/sLIrVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv2kZe6GG8H5wK0tKndrx5UGGEBmqHkMX/SdLDZOv097dNN4Ckd70e+01K/cO+B8XhY3zhCO9V+KgwQ+zfPd9M/AodlNL9CkByOrNdeW4qsJ4H6FQNl6kXGVOtI1ERlqmex4OjWSfVyD56D5MORKsNZrk4+6Uzv5m3q4gzf7W0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrTsBVS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGndGQ030663
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PZm0qqgS5dTG7oCRmAuLkE5p
	HlURp9VF4PXmAQpOQA8=; b=jrTsBVS4kK+l+2V83qmi5UfEscnaEuyvCKWxr/E9
	YrAJ2ykybUVRjY1dIyYRhHir3HHM+cXScju49r/96bW5aSl8Qk3jiq/kDpFCagyK
	u51msUMUidkU0dvyTAmpr+v/fdFkUHHylP8KUGP2ypdWvkVMsNy/QeN/7Jjk8a+I
	yl+VXDrihEZsb4/Jvt8YJTcXfLR94gSk5jGkH4zqLomjhkfce9+I0Dflxfuohdhg
	g3STC047JWrBgpNuz/JUPelYPqI61ZMDPJF4y+q+PyPwXh/HuNecoLiJJMOkFUUP
	hrslaynksnQaPuG8ssB0q2MLRZ9R71rc9uDED7Irewx/+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftqxmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0c1025adbso249233885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 12:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314247; x=1744919047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZm0qqgS5dTG7oCRmAuLkE5pHlURp9VF4PXmAQpOQA8=;
        b=Ohsy87WraICZwww9xF7V6fWOOPe6Bi6x86cuXmob9Utaz4gnLh1t7Tskchtj8CLi6q
         sGL+7y8GsSePa3wNKr8Kg6l81l0A4JN/HEtn3mZgleP0WaIWYYwBn/a9T+uvRJ6wZPIb
         LCbib27ZONucQzKaw7gWIDfMYlE10PuYPMlPuqcy4V9MuXOqRDDkuwB6pZskESnfaupC
         jPhX3e2SntI0QFlpsv2OVaiR7hOHLhqm9PhlwO6AmhuAFDkTveQNGekuzWpk1bPgx3Ng
         6f9t71ktl2971Fu57FHpf0eKsxN1OCZO5B76+tbYwjwJ3G9rahfV+Shp9lF3RmzK0czB
         4ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX35xtsaO2sORSeURed0bMTKm5gDg3U4UkpERdyUM6WD+huDcYc6zH7ccrw/5/b44/OucOop60L0spj+ztD@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/rrN91Th25IvDuNqHwn/5mtlXJ1ulHQEP+XeO6nfCma6r9FE
	E8AgyzTHrkpXzgoARgs5XnKaHfFJRk8f4QVHvxt74tXfQiuEpvaIM1uD1xe05cEEFwOOf4UKOKv
	j4U+hUYTf+4fBjPvl6VMxJ7F/5tyB/tKfAMSjmOqXPNeF3z7b+Xzrrmpb1rbxN4NP
X-Gm-Gg: ASbGncvvIh7C+jmblGu7UmWAVzjHdyeMq/G/9qEhgFtoIlMH7IwAH5wm3Dr6GVIH/Ny
	8+c/U5xOI/XveWYb/gzFO8XmsYhFxVeF+5gwACpPouuFNF9hLyyX0KxacudBnjDvk8/ajJid3hW
	ANHJ3gXPnFJcJM1G/BlmdgFxSEWfEztEVumMtIX6bANCAQZ6YZzgZBtYxSEbr5PN/91LgKuk6qZ
	fzU7mvTJ6rrMlvyGJDmQ0M1GvqNYAKiPKV9MUbNkLezJURX+/rNdxI58rse3yEdwLvs2Efh5MBm
	kJcB3WPCjqMf1AO5oLqRZRKn4Qq78i6CxtS/kjrz24zTRcU3UBA3NcaY0e+TtnmYQs7LXjTv370
	=
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31545185a.33.1744314246977;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/AtswoZH0U6ZdBxJQfiEwZm4aVhqnq1sZshU8lrm5+ua8KiXU0Tcl7YdGDm/CpynyS+kVcA==
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31542185a.33.1744314246699;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386absm228473e87.87.2025.04.10.12.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:44:05 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:44:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
Message-ID: <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f81f88 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=w-EXFu6-wi7iOCDdWgUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2umFX3q4FNz3qMZLBmh0gWSiJa_lQsi1
X-Proofpoint-ORIG-GUID: 2umFX3q4FNz3qMZLBmh0gWSiJa_lQsi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100143

On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  2 +-
>  .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>  ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------

I'd suggest _not_ to follow DPU here. I like the per-generation files,
but please consider keeping platform files as separate C files too.

>  3 files changed, 89 insertions(+), 76 deletions(-)
> 

-- 
With best wishes
Dmitry

