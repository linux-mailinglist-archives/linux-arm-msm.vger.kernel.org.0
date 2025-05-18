Return-Path: <linux-arm-msm+bounces-58310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB9ABAF14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1351896FF3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CF0212D97;
	Sun, 18 May 2025 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ob2VaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73D1DF73C
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747561667; cv=none; b=E73PJZrN5ill4TEi9FHi74Eo6I1stkoVtSPjd8T6OefbtfBz3SHHrZH13iYb1Fyey53pp6gKE3Gra8Au4sD17hKvmbKSCThNabiYGJzccw0L2bPN8u0i/5EqetQuSF2PoNjxM4c1A6+LAcTxwBpumCGKV557IlJrUcQiGxHVA6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747561667; c=relaxed/simple;
	bh=rAWk0ObpbdF7fJAs5+S9l8yft96BfgYKO2qkzrWVQBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bkt1s6zsmEBFuG2D/L7KLX+m+CwgRj8Jj9KNA7zhdNwh45gFp2yuhE3QHmDZGJoQFf1F+Lyp/Wft7ogdZwMbjp1mnI559lwUue9W6/MbcAQrvZCxzrxMiMajTWsx82ICoVfeRlN3od+TVMkhdxmFUAVUGLkLimBvEC2ja865TBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1ob2VaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7qwWW018064
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TFlU0fSZgntNkoaZyg/NsxA2
	mHRMkBsFVOawTRTvNFA=; b=H1ob2VaQRI9r5AAOWB2Ea5Frzx+JtL8rCY9MiJmK
	nQ0DRiOiiaLUuxUNM9rgl/LO0rFBhhC5oXquNkKd+hKJISw5oqYNKs1pC+TvzlQA
	LKzbgv6Z00HM1O4coXxfnicNAyE6/EQbjAqaeEnXEf3kG7PJbmpvq1zquYI9Qjhd
	8PUHmbJG11lurGuVbXOEDn3WfOYv6EMhZJHRVYfi/ZmdaH1xTdKv9gD6+6URK3Zw
	pP1U10hBwQ3jxNNPkjCozKQOw/SoTlxx/x3bhUJSy2hscWy4bs7P5ktCdu/kxL0/
	RKBrF7AP0YeS2LMJPp6HcZNNe6DVLEFhJ7G27RrovTwAKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesstw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:47:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36dddso21203356d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747561662; x=1748166462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFlU0fSZgntNkoaZyg/NsxA2mHRMkBsFVOawTRTvNFA=;
        b=Kvh8M3p6qtlDDPuFZFdXLjvLozseGJ+5sDCNpd5HWlWI+5F5r1LaS7Bxm5J6orfvaE
         Dg/TGKSZVQcbhVHerzc+TbJNZHPwb37zn7AwwUKSKO+BIqb2mrs9giRbfM7zpD4m2pvC
         Ec1ulZQUiR4iOqWZ9FT6H3UY3NlIZOkOdL5pG9pTRwe1FJ8E4dMVmD+AL//chX2nD8um
         HTcoSl8AmxycQwgKJe2rL892kG0CeXgiYibgrewn+2FRuMnqBecLwIjsFw+fQAeqnziL
         OZDMNmfdnJHXNdia15iMVZ/vQzW2O/aqpWVlSl9xfpuxDaBh6RIGccAhQtz8S47VD/pL
         Ue9A==
X-Forwarded-Encrypted: i=1; AJvYcCU0n6j27k4lSgb5WU4GYwqsGXNMbZktjgnReyE/BfqVhcE4nYEyCw2kVGj7xGIx5b0OdntqyAVX0gkLotHu@vger.kernel.org
X-Gm-Message-State: AOJu0YznB4D7FwAFN00kKBKGk/bGAsA6s5xq1KniFBK3DTQcn1UOBSjz
	dwmUDosIQ8wYiaJ4b+tBWu9YxQrT7/l9SaJpzmlAc533Yu+I7QJGSAQVx/O4VptYzsjNybXYDKQ
	OTD+G1p5AQ2qcSokRBZw6PBrWwrbAtpep4NtzxSwO57Izdfo0tbtHv44iPpIpQhs6kVq9
X-Gm-Gg: ASbGnctaWubd6TOxGkiCicnVuYvfjeo4FHsa1230z1SkGJ2EC+5SgOGP4CUzLrqPPk+
	ZFE9tj4p0YU8MYHjpg+XA1K25m4y+4SLSY9nJjOWyKa9TA8D2NLuKw9FsLo1Kktdd4eHbEdFW+Q
	fcp0uYIoj/oLLlU+VvDK5UyVEsx8JGkouAIyEaac+MTEWYat+pkhgVIZYCUMZY3gj9drbuBYUwq
	rdc6iZ9jiF9ZHQA+m4kNSDc+Ixynp1/LSlysp6NCfHkc1JguvpQW+la2fokIhjL8kB7XjsDjEkx
	pGv8AsEv+K9pNEblcTP3Le9kw8Y9UYUlZ8YkaeaxXJs7tG9P4VWnjqI/OgFgbeNkJ87XKNCLqr4
	=
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f8b2c845aemr142878786d6.22.1747561662441;
        Sun, 18 May 2025 02:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETeYU1lKZj8FbSxpmtHQ7ao1CaOfNBSNhCCtY6clLi/oJVGUTSIlf3QIwNUZfc/juiBKD4BQ==
X-Received: by 2002:ad4:5cc7:0:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f8b2c845aemr142878466d6.22.1747561662111;
        Sun, 18 May 2025 02:47:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fceasm1374479e87.60.2025.05.18.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:47:41 -0700 (PDT)
Date: Sun, 18 May 2025 12:47:39 +0300
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
Subject: Re: [PATCH RFT v3 07/14] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <wwty3mev3cihpyo7utwoe4aspeqf6hzuo45p4xbr6wali7axjc@uqwhsgqcllzh>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-7-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829acbf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Abfa49PQOijBjWCf-xgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: QoR4x7lhWodkTjkgkuMSbj5Choq7wEYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX4gx1A6D9S2qX
 +n1PmIgvskCIuLkCabjD7mpIdpv9HtyVGMrqbdjrlbXfqzY5ULXvD2XZcrkHMYpgA2BDodveZ3P
 rLKShtZzVnrqOAVwsgFJ1rmGapsOYiQCHrxsmqruwqyPB+LVoa4+vAwye9Zr6Pmm+wN/Me7MwDO
 hvnzETlFJj94Sr8v4W/w5z2ofy0Cov9D1b4MCfLYwaPJRiaUUY5DZw0pCVmxWoPd9mnwvcsID/D
 0bvxmCwL6+tyJ3L3052pjOTaevxfTuRstXC7BvVcB52dfIuZ6RZW2OcAL2PAhKF83cpiZktadfK
 w+hzXUWVD3U2bXNzhxX4TJ6tRyqpvj4USjcwOVQVBZ2wxfGJIBzhHU5vLbSC9hHllfKLazKHmPz
 VEx8W7mIoLZivip61LBCBuzT1/PPQuo0jCiE8RyI+Z4vUDgZEZhbWmI9saojRwUfrJrF2Z5W
X-Proofpoint-GUID: QoR4x7lhWodkTjkgkuMSbj5Choq7wEYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=962
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180091

On Sat, May 17, 2025 at 07:32:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> This commit is intentionally cross-subsystem to ease review, as the
> patchset is intended to be merged together, with a maintainer
> consensus.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
>  include/linux/soc/qcom/ubwc.h         | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

