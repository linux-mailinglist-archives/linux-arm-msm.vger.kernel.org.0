Return-Path: <linux-arm-msm+bounces-85615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C42CC9F47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 02:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27ED93028580
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 01:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FDB245014;
	Thu, 18 Dec 2025 01:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnwbxRkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDc94V74"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1A242D67
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020396; cv=none; b=DSOuIaV1EgexK/0dmaTjm6a8rqBTJKO/CV8d2w1l+Dgl0VFsc4bj6mUlC7wjbjaCKcSV5Fs9Uq1h8xYyzrHYFon5ODnsOGJGMVqxF8p2uZLj9FE/n6FgJ5SBDZcaedaNtOwlPSjA41keKpW6n+/Wyr7zKjqb0yuLXYxApwtgpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020396; c=relaxed/simple;
	bh=sTJC9rSO8IhaYodG0ANH/gA4GHWEuoKfZ05IfG9vxCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0rgKXWTHN2JHuzOdM7OUe3c9LJxWwZd8z5NBEuWM4v8hdmG9JLTeJBA7H75Atd6CwOUvUtrj9Xe7aK6YpEmI0O5HStkCi2cIk6x0v4Hsb8kiA5cIUQVRMR/JlPHuvAcyNXF/rblBhYbAixBwuuWXyRcE4tTc3++XQtmNs24S28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnwbxRkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDc94V74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHKXU0B3743456
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=; b=JnwbxRkwH3ltLFpg
	x5yfuTcWFS7O6EcGPG9iw2y6huWAY/NfOCbddXTUzRtHjbR3dWprW6Bu17VVa2+b
	JWKSxRLi6YAuuoWhaD6jRJ9GoM35uVqOkWmrsITx+TvqDzYNKbRQqDZXo3XG8dS1
	/KCXBveqK9N9ysd5g+QxkQ5RuF05eyB05Syef/6xLbln2kd95tFbuJ9w2Xwo5Ox/
	nlbTN0Lp5mLMEyHOKnnBWGbz95Vj1n9HXdv7mEueqDMV5X9OWNq2Q1p1NybbEhc5
	NQuyqRWJgOlYL3vBKMM3pyhPwGuLS0czyKILYomkdSBvZJuH+DakUQfYAdTYDISC
	4Q/Nzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43nmrmrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:13:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1dea13d34so2234541cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 17:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766020393; x=1766625193; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
        b=bDc94V744+SKo6Qxa2A2JtELFviuuYnUiHIhpSSSq4z6TitP9xZAcNut/zBXGv1xel
         E0vITFSADxc/rUCHow4J0m1ywXWcn0pv8TvvxY2svyZ1iRVXnrJV2NMoqNG0yHF6933B
         Qx/adMPWdtMX5eXaWMymSFlImkRwG4p4IYXQfgJvyzOuwZfHCbpCQXJIW2/WehBAj08v
         OnUaa1owd2AEuYZ0ieltOIw1qxqCnHKl336DgAzH2ytSGIUumxtv7noh9uOV7fSy4sZW
         m4QpwDuUeZnzaDcie15ANAbuuskUr0UAP8D8WPnF4tSSxqALIwchhPgZyw+Qq7F8N+7M
         kqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020393; x=1766625193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODx0DDClD7oE2D8NZwf9qUCT4cF6yooKb905lWB79gk=;
        b=X/EdLArRJHjJcKNdPAE8eXlJ3yYJGBxwVdcwXcsqqwX2YaWYWSQGr/KluROCUmvWqa
         txcr4WAOFJxBfvsND7Gj5Hw68vTt6WqmCRpWWILJXs8LBtAqpCAsKIA4dmzqUD3vWLlB
         cQi/wSIn3SSNL3vNFr6TMtGJOMHkdR9QHvrZCqa+tcB1mNTYLxb7JJK9fSuz7Gz6rFYl
         RBnT5W5VQrbaZo6sjxunhUuCaRe7brICXIBzcKTbjfcX1s9tmqMJqmtxJYhahoVex8OY
         8wJ1YHbQswtS14+hjzhvakFwNHOrFf3k/a6ScBW5ur9BM4op90NVSI4vKHZYcTU9RAVH
         U75w==
X-Forwarded-Encrypted: i=1; AJvYcCUDEWZneVeVnJNQfOtR2g+MaHZobzwDKhHVNAE9/Xg+6+4IyqgyEO4LjEc5Q2/zs5JZncnH/nhnd6DJv3a6@vger.kernel.org
X-Gm-Message-State: AOJu0YyhxwSjXfr5NbZ/m6CYrjLFIguzqsjRF7JlzqcZ3PjXMTgxvfTv
	UD4NAOTq+6qwiSIBynWFdVTH0P0EoxJBmtGoJ3uKXr1l7pzoSN5D3rypHddgL+Zj9ajNyeTuiPu
	FfylkQYesUMZ4qsQlrPuGqi+ys5MoEG9CKfKovv/mM7FxCRK++7yXcQqFLuCos0rIDIOU
X-Gm-Gg: AY/fxX4hp4e2ktHbz/SPh98H+ZDEuXiKbEdYUgKKuooTphvkn9QezojGQNUgPNxkPH7
	GgAfLmDnROMWjslDbIKQxbskUH1NB9c7k55nS9Ho37Nvwt60EJ/8dju1+MJ54wUbasfI06vDg3N
	iXkKEirAizYr0i4JBCO91O1XauFb4fqDZdVScsyiYjfhJaF0Kk4s0Nrg73OIGEDRAsYfEZN/iw0
	ixt4d/2gCo57YflrVvya4Bou75RjZ6fPdfOaaPeZKySSEmQvkilF8wIFUCXw9uRUdwqRj1Sl/B+
	kLyFYcD1MMjxuKXIFZQ1gcS7+8flkVQhmqrONxnFWBRYrqg0hyXTyP7bYAXnDp7jcUmA+3NOYHB
	tGRzD46G1/5wHL8e7wBk11C67uujD3X3FahaGjZzsqFMyAE9W2t3QeFF8Ww8llF0dqX8wAsjmMf
	UxuY8xkckoFcnQg8IIlhzp/gk=
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id d75a77b69052e-4f1d062a568mr320752621cf.60.1766020393138;
        Wed, 17 Dec 2025 17:13:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8kzKjigPADnhYvAQQ3ZNwWnZ7myCpFKgi4W4FArGCcVgc7WHrYz7CkY/anZJ2ACGtwLCPUQ==
X-Received: by 2002:a05:622a:5c16:b0:4f1:8458:2679 with SMTP id d75a77b69052e-4f1d062a568mr320752251cf.60.1766020392613;
        Wed, 17 Dec 2025 17:13:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3811374eaf3sm4082291fa.47.2025.12.17.17.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:13:10 -0800 (PST)
Date: Thu, 18 Dec 2025 03:13:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Enable support for eDP v1.4+ link rates
 table
Message-ID: <chu5gqcvhqpeve7coitjo5iqf5n5cqipfyxpu2w5dm5tcjp66j@n3fg2qrgkara>
References: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-drm-msm-edp14-v2-1-2e56c2338ab1@gmail.com>
X-Proofpoint-GUID: XlylWo9dZxbk9iDttzaS1uoPgtVDaZqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX/mkDSLgNM2gS
 8dnNDFP4nkKlabW7xSFz0TSyMLsuzMt4y1/hx9q9/RF7J8D6vpN/5WiuDp8lzF7Q0crWfwRZ3QJ
 So/EBsG4ZzpDUh2hMQOI0bT8VClFWzK1Oe3MvQg2X/ozOu/+1Jj2yrPMqBRmv4OzH627zjVw2MA
 /7AVQemDTdFahmm1t1ZmiNtJCo4MUkmfit3UemJnthh2XmcSWzeb20x3UVOZJH4zv3h8/X5hpXO
 sX0UBpMhs0ndN9m+XzRmQJxP5qU2L+Lz0zD/XZONCynyUCoAphZXlmo8jh/RNZKjSadO6Rutdme
 FvjnwQzj8YKjIKLlELcZVn/xVzy5wdUdgofn9TRyqP+btru5Ajtq6qbBxic0xLb8qPDvqaZ2pDR
 NJ+qI5bARCwvCdRueU/Hiyb9NoM9kA==
X-Proofpoint-ORIG-GUID: XlylWo9dZxbk9iDttzaS1uoPgtVDaZqY
X-Authority-Analysis: v=2.4 cv=A6Zh/qWG c=1 sm=1 tr=0 ts=6943552a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5AQg0nHepjwah1_JwOEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180007

On Thu, Dec 18, 2025 at 12:19:32AM +0000, Dale Whinham wrote:
> The MSM DRM driver currently does not support panels which report their
> supported link rates via the SUPPORTED_LINK_RATES table.
> 
> For panels which do not offer the optional eDP v1.3 fallback via
> MAX_LINK_RATE, this will cause a panel probe failure (e.g. Samsung
> ATNA30DW01-1 as found in Microsoft Surface Pro 11).
> 
> Detect eDP v1.4 panels and parse the SUPPORTED_LINK_RATES table when
> present.
> 
> Additionally, set the rate using LINK_RATE_SET instead of LINK_BW_SET,
> but only if LINK_BW_SET hasn't already been written to.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Tested-by: Steev Klimaszewski <threeway@gmail.com>
> ---
> Changes in v2:
> - Re-ordered writing of LANE_COUNT_SET/LINK_BW_SET registers to match i915 [Dmitry]
> - Fix detection of eDP by reading EDP_CONFIGURATION_CAP and EDP_REV (in v1 we were mistakenly checking DPCD_REV) [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 56 ++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_link.h  |  3 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 93 ++++++++++++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 32 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

