Return-Path: <linux-arm-msm+bounces-34366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC799D6DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441FF283678
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB38D1C9B87;
	Mon, 14 Oct 2024 18:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N+d1Hlmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F964683;
	Mon, 14 Oct 2024 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728932190; cv=none; b=o6npnmnSmC8d+a/X8zUAitfi93MJW5pdpKpY6iz610xnBi9lBxx6s9yv/C2MCjPvQ+0bHLYtzeYhD9X8156BKtjs/YP3Bk/Wp2SXDHwX4/UcB7yWIC1f5zLu3XO05y4SHrXgygnWf/sqF0s6GUflQTLT4pClFDlKczMiCdR7mA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728932190; c=relaxed/simple;
	bh=LPmaDeIWVwKjeB9u4pgWKoHOQW4ZPZe08mm7aXN6g9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HyPU82JW14f7jSj95anp8QDXtt/Ao7bu8b0gPoqsmY6SBvIj8lMgGBYJcN69vBwVAD9uYWO3LQfCZUUY1DO9JInE5ztkpEsxf+2dwS6wjqn/NjBYKU+5b9pZ0UpsDfOm7YqaDoN9s9HjcSHed5nGYS/5nM9Dp853EM3svZS3qjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N+d1Hlmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAvGfs028784;
	Mon, 14 Oct 2024 18:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlbPSbN+2Qug3FA7CXCHa0XouIE4fbFDjgXWtKtrjc8=; b=N+d1HlmxVttODT0a
	oDILWmsfajFjPUwIIIHTZYTh4QHXFOzOTRv8pXv5NaUQfSImeuiG8q+9Bu8GcelC
	jGOl8ztIwFYs1Bx/5RPBP454N0c6FK+PG3UcQ9McDhTNOoCr/Xmln8A2NDlpLC58
	p3qBHYQgRnNgSqFNgA4xQU572Hhv30bPAHF8YXN+GkJgH/DRCCZVjK7cyVKIc44r
	R0OY8Je7CoFXB1lf4oLv1jiXU7X/rTkvIJ0d7KReLvnhLUUmFWYKpi6ZBZrMdeXF
	eEj9/gOIlflIx32eN5mTDKopLF0sPwYuqt9p1Gv5V+CZgS9Z23phmVXNKA7WM6vk
	q5ygrA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hg75b0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 18:56:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EIuLKg016763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 18:56:21 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 11:56:21 -0700
Message-ID: <00e4015e-9dcb-4a05-90a4-0bca62c3b0a2@quicinc.com>
Date: Mon, 14 Oct 2024 11:56:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm: Allocate memory for disp snapshot with
 kvzalloc()
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
 <20241014093605.2.I72441365ffe91f3dceb17db0a8ec976af8139590@changeid>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241014093605.2.I72441365ffe91f3dceb17db0a8ec976af8139590@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pYfvcZ-V62ZU9I8OGpDFjzzm3wQpiA73
X-Proofpoint-GUID: pYfvcZ-V62ZU9I8OGpDFjzzm3wQpiA73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140135



On 10/14/2024 9:36 AM, Douglas Anderson wrote:
> With the "drm/msm: add a display mmu fault handler" series [1] we saw
> issues in the field where memory allocation was failing when
> allocating space for registers in msm_disp_state_dump_regs().
> Specifically we were seeing an order 5 allocation fail. It's not
> surprising that order 5 allocations will sometimes fail after the
> system has been up and running for a while.
> 
> There's no need here for contiguous memory. Change the allocation to
> kvzalloc() which should make it much less likely to fail.
> 
> [1] https://lore.kernel.org/r/20240628214848.4075651-1-quic_abhinavk@quicinc.com/
> 
> Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

I had some doubts on how this issue happens considering that the devcore 
should automatically release the memory within 5 sec even if userspace 
had not read this. So there is no leak as such, its just that in a 
heavily loaded system, this can happen.

Fix looks okay to me,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

