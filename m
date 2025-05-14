Return-Path: <linux-arm-msm+bounces-57982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C6AB771E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 22:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9061BA5778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2566818D620;
	Wed, 14 May 2025 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mltkatwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C247296720
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254773; cv=none; b=YhvfeN26yAL2hmh3rjAbPaEYkil/TsqOWZRfNK6ZvtxneVREkCXRBN2kNLDndXCNATyFTXu09n5tMTgwAGDdqFJjwsX/EXYB5NkFU7XHnTwFdzuAAVEG4Wq5Q45dlKzI6aMhK5vjE9Fh1K7i/ZUPEP+rhMz2AIjn1cEvXCvisoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254773; c=relaxed/simple;
	bh=2gLhUAtMT/ZpjU1KExKBn96wiivLxjIdVrFdvA6qpyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIGaU3G5ZbNJ829ffwJXzme6YszB4idBrZEHu3MggxLNEhb1w+e7Volg5am0xCIpJ+SOi/zD9FdMMvGR+Rx1wQI2JIT5JADPCfb6N6Zh6PdXSXrYIY27UnVxx8qkab5AWFMtTWp0Bl/2Hey8NlrHFKsI+8aUYVFoY6NmTdABbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mltkatwe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ9J2I015993
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XxPdt9cqTUOBy/MQknWD34Qy
	9JQbrEE6AdpEjUZi4wY=; b=MltkatweJY4EspyZRwcEgq0QjsOCbL+hMj2X8lvL
	MC5913jkkE0xXE3F8a275nrpNqkgzGtEpJdaq6Jt8MORVO4Zu4SWCdiD+UDc17BS
	XQ1ZtgArq6YvvXWGq8eGhoAMIJLOUmeNvpB7LTmox9ImonGcb0iFBmr2PlNv4XJq
	GLEKwyYCJ/boTRjvcfHof9eP5DPN+Dwnxmd+BvX9YyyDUkJS9dO7PsEfvy0klB3Q
	z13BN8ZqM70TguWGi8JUDddvPtP9vDgORCiLNiHCir9MMaZao2VoCWlHUe29GqTJ
	8lgTQ7zAQhJYNcvcXtAifjbP3xt8sm4oJS+L93Rs0N4/4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmv2wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 20:32:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so44131285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 13:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254769; x=1747859569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxPdt9cqTUOBy/MQknWD34Qy9JQbrEE6AdpEjUZi4wY=;
        b=nfh7HAtJWH/Pvz+IpDOZeQkXI+M15W7h78ewX7bhZXqP+rE0a2PgiMWYU/eEEsCz/5
         gvnMaIYJJstcTeQ4FWSiyJUi8Gjfp5QKv/Ek/WylkW3vFHo8MuwinSJdeL0/LzY6mw0m
         530MLzVtAhOxb8NYYS8qKdW5ORe/PKvAhLSWmuYgxpG9LMP1g9Rmwql1u4FKwAeyHvrT
         R3iIpu0zVYaVJYaeeBsyZGKbTN87DnpCNgWuyfUKuq7s0HchCdUqqIoQXmmMU5azVVr+
         WVeuUbmMSL+rPlx8l4LudoDx/DRTqmHuaO9XvLg2hy31J/xE6fO+vT2wdcpK/6A+J6W4
         9Xlg==
X-Forwarded-Encrypted: i=1; AJvYcCUZM6N7lNNPkvZzngOxUVIanhpmApYmEHw3HvS/TZDLXp94cftGOgmdm4lZOxeiLDdeEg4jdyd6AEJeMj6B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6KSs11TuWbo2R5DP4qOuQfBq7h3LqcLFuStnVR1tH6olcYM23
	/CEgXbKw9OtQvj6yOfIgfCsK+r6ViJD2fGdv5mImamyFAAjfKDVYgI5Il/lYi5c1Z8GNbIhNx8X
	7kqQJ5dhVxXIh5k3AbDMmnLaRr7JmmQ4DLsl3YonOy2v4bf2f4Q9G0086F3W8wKMFzdLeTeWi
X-Gm-Gg: ASbGncs2ndyoB2OXESYvHE5emnOkNxNpNIz2qfuGwXkM9VFATz2wq9HW2QwruX3712y
	uvLAuahTc+A2Pt4wRl6vadPkKFmdKq5AFNqqwGpvzXlQn5Lh4QDZxg6HPLe/Zd7LyjohPSe81MC
	rRq/+QL/AocUD3FXJFJmOMPzXrWadBMImMnA9mD/xtWk7yZmytQExHswDEO0Rsc20Pw+xCwl/xn
	xcC0CfUvoj73TjuOEmrWgfuHDyF/uxYo5fWd3w1jGhqEWsh/aybrPRbz4R+Wj5QWKKh8b1qSS7f
	Rwu7Ye0WuBdzsJ6H/hYEaZqJbfCoRf7Frbno7b08uURRXXfZ4opjY0uk7Oaiq0YJU1xSBgkCnOM
	=
X-Received: by 2002:a05:622a:a0e:b0:494:78db:1e55 with SMTP id d75a77b69052e-494a32bade9mr1663721cf.11.1747254758506;
        Wed, 14 May 2025 13:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjaViNcmlJtAKHvgfVZ3CjaBKnxNHVGmEtfw379yfKxDhn5w+VxEmOu10Ygw0Vu93zhM+Xg==
X-Received: by 2002:a05:622a:a0e:b0:494:78db:1e55 with SMTP id d75a77b69052e-494a32bade9mr1639071cf.11.1747254746920;
        Wed, 14 May 2025 13:32:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c358ae30sm20781661fa.94.2025.05.14.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:32:26 -0700 (PDT)
Date: Wed, 14 May 2025 23:32:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle
 override
Message-ID: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: D9DDmZx3GwwnPohP68SzCIMGw1ipw6D-
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824fdf2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=YFUBf4FbcCgwuu9kWHgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: D9DDmZx3GwwnPohP68SzCIMGw1ipw6D-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX+XwyetKa1cLU
 ZfXk2iWaCtQikWCTxJGiTK73vYJoSbm8eGfclVNgt8LId3twzMkZu7GdB3Go2UunPUPPYURXxuX
 lIMocZuAaPiFE5w/cCcjslJbsr1qsiWDIEXDBZfE/oKbGTMrbACc5d0R92iwJhWa31OlNmxIuZo
 qF4LR6X0PInTfQSFc9KcNh7Hg9LZ6rI3GOPoxsSB0kCtB2NOCTEDj1OftUdKo269HyWc3FkSfI7
 xjJovWXbL8Wb0ht3Ou7KrfYwklM3bd3DfED1T9584ZSDh3acFMn8jUiNeMJAEII37Ntcq1hna/x
 sqvIB034VrzWzLikxeC/qM/DEtZZwmvKDoSgHKtIPygiEgWfIt1+Db40BbrmzGE+zpqLyX5LTiA
 AR40CAxsoboIkn3NuRhvkglOpv7WTdAX/BDHf+d72CwvzYl5OxqUzsuM9sfIBZp4SWYpJMgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=849 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140189

On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On A663 (SA8775P) the value matches exactly.
> 
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
programming those). Should we fix all of them to use 6 by default? Or 7?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

