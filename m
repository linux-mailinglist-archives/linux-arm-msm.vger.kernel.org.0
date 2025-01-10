Return-Path: <linux-arm-msm+bounces-44693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1AAA0849C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 02:15:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBA2A3A6042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165C01E377D;
	Fri, 10 Jan 2025 01:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OyxtZC1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F0513C80E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736471665; cv=none; b=bwBDd2Ph5TiQIoASfaBmS2YHXNhsItucdL/MpMqgiJjU3Qpdq0RtbZVii0K3+Gg7Ge47wjfCFekLP9JVPaVgAh9pPCH4jJi1FQCoQqFYYDTKskZ8fZaZ7p8+GSavdnGZdC0uH8nvip9M/Sl3Sg3bQOeoI8jlL4gPuHjUVGEAiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736471665; c=relaxed/simple;
	bh=hsY2TeHd6cstMfLjh49YTk0CA6xq/yGpVPFUAM3mTak=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nscCa+vN857/aJnv6SNlOf9icPFRVkGNwgdKY12J5eLn3jnTfEU+clhoPC5Bw4vwxAG45roV+kUFBimUcd4/2ruMy8RAOXzNzQQfrprC/1G0rfkC4XkaDueF8l2RsZA9LRBGS7sGyWJo8S1V7vO7BQ4LEeCKeiV5XtCYFVQa85U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OyxtZC1c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509FrxM2007709;
	Fri, 10 Jan 2025 01:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lzrF0b91BiczqoRElqq1uBXSE8EBjWgLv6W3AS6zh8w=; b=OyxtZC1cFXpZtnpN
	ty5tgrrg8uX+47JE0la9xsPZ7TwqkhMUZMXyJBN/Kehw8CY1wnvoYIt7hswkOg6M
	sDijT8EkYqBtoyZOK8wzeyZySoq1JSmmfID7ZlCpsqdF5N0me+YBQ/vondc61hbn
	EKSdaUl2/cuBkjOU8lFm0XXxIEonEZ4C+PnlW12z/vU6HgUYsza5Q10CI0kyVvRl
	xngnvqvTndI13VlGufpZ4MnHyzzdb7Gh3Fu3KjiPJbcbyIC3f5GnfAz4F1B0IQak
	Jot4z8AZIT8VONRaBKWHO9QzQ96H7DCr44J2o5Ikv6W5IzS5rjj0EInUIOJ3d1yO
	6HYT9g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442hgg155c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:14:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A1EEJQ008422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:14:14 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 17:14:14 -0800
Message-ID: <f3bc6913-ac0e-48e2-ae55-f27d47b14eb1@quicinc.com>
Date: Thu, 9 Jan 2025 17:14:13 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-2-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-2-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pPX5SdY_DugqcY4KguOC1eBfKrCK6Lmr
X-Proofpoint-ORIG-GUID: pPX5SdY_DugqcY4KguOC1eBfKrCK6Lmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100006



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> The code in dpu_core_perf_crtc_check() mostly duplicates code in
> dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
> function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 94 +++++++++++----------------
>   1 file changed, 38 insertions(+), 56 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

