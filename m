Return-Path: <linux-arm-msm+bounces-20420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D08CE966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 20:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132571F21553
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 18:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5701CAA4;
	Fri, 24 May 2024 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hLgINpyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FDB3C00;
	Fri, 24 May 2024 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716574796; cv=none; b=uxuhDf/EI/+G0FRn3JjajNeA9KwX/C/+HzHjBFUKUElvz6ZQ6pgfz3JtQZOo1jcWOn9hrZWZePaPON9eqPmAfGUo5x9OxvBhtWEgteecWYh4fGD+l3RLBQS14EGQ7Z5F+lMF53zAe9nZVQlFFbpKd/+7klTeXUo24OQpcHglS4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716574796; c=relaxed/simple;
	bh=JWsCNf+jzHO49Y3NQf3KgHDEPooDA1NIecvE6GPE3OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VFp+ABB2TRqyE/zJrgBEMkHvB0y8lxxk4kAJN8ILunkZU4u3nqeCknbLFYK3XybV9XR6Icynv/TVPOs87jqLx5lxaKoZrnyQc+MQdAwFgD2Ma2iaE6W4jTCK9aQj45iZcZKc2ECzti8mgs4Ej1YShIfqk7eCWhLyH5XNnL7zJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hLgINpyx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9qGhd011993;
	Fri, 24 May 2024 18:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnYhjTxqVIzgdrzBnAAvjO6PnXT/NqFysO5gWZNMD8o=; b=hLgINpyxQA3W2E8R
	Csy7Qyvy4kNizcQKE0FOcbPL1ojDXPBXmA1tWQBjJO/HwRl/E9hmc5XHWRjrYHxm
	b6QezQed9ZHI34DL6fIO7S9AXCxha0z5WKN4p9Ak39wbzHTOMBhhu/v9hZJJMOVx
	8yOX0lqFlQa8wIR558u2hPPfqxcK7Gve+bqv8HobEqGptfDp50OJRaa8rw1Gb40i
	Db/erZEHPNc4oUVKaXtKtwOEHPjTZvANZzGVYD781RZO4o5Uzqmha24f2GR4FAwB
	FKf+lpw1qQejQPlhmGTbQr0ZebHC4cCTQal+nYzbdrBFnzw389scGGigcNFhBGwj
	hvdEjA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa97u8gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 18:19:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OIJh6O024370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 18:19:43 GMT
Received: from [10.110.54.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 May
 2024 11:19:41 -0700
Message-ID: <5db69319-4d61-7637-8bde-5d786e5faea4@quicinc.com>
Date: Fri, 24 May 2024 11:19:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats
 arrays
Content-Language: en-US
To: Junhao Xie <bigfoot@classfun.cn>, Rob Clark <robdclark@gmail.com>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240524150128.1878297-2-bigfoot@classfun.cn>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240524150128.1878297-2-bigfoot@classfun.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vlHK5zkBU_longt3fpGsbSeFx78bGiLf
X-Proofpoint-ORIG-GUID: vlHK5zkBU_longt3fpGsbSeFx78bGiLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_06,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 mlxlogscore=623 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405240128



On 5/24/2024 8:01 AM, Junhao Xie wrote:
> There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
> which cause weston assertions failed.
> 
> weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
> Assertion `!weston_drm_format_array_find_format(formats, format)' failed.
> 
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
>   1 file changed, 6 deletions(-)
> 

I think we need two fixes tag here, one for the RGB array and the other 
one for the RGB+YUV array.

Fixes: 8c16b988ba2d ("drm/msm/dpu: introduce separate wb2_format arrays 
for rgb and yuv")

Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 
DPU catalog")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

(pls ignore the line breaks in the fixes line, I will fix it while applying)

