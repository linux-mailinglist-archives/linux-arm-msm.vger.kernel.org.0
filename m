Return-Path: <linux-arm-msm+bounces-49100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A103A413AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 03:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A8F3A9DE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 02:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338B54C7D;
	Mon, 24 Feb 2025 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XeqwX4/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E14430
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 02:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740365247; cv=none; b=P/fEp96bqhImc95CJeW6p035E2XiyOB0MXwasKoIxUdxJM19x0pjREJYjAGlebGvEbZ6JTUJT5BKHacEXLZ2IiQOC414WkGXxsWzE2GdK8F/qiUeIE/lXQJXwupeIEXUp433B4FfGLGOPfMOjVfQY7scQIYy9y1tWobJFIA6fx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740365247; c=relaxed/simple;
	bh=vy06S5epHFlDI7fpRWE6Lp4qxltvL3bLOR9KKiiTuo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ji9YL2/X+RBfBX5iI4cTiwnpjCLx2TNcyKkbWx+A7Wg1Ju164JnxJgy+DIYTNjzlHzzaTBZLBGcSNPSgqEUDYYWL4VaDOqzSIaVy7yp4SK5hC7EObQHOP35wQFzeAsOGmRWBAv2DiYyDe/4lizbzTQ6QOzv/xyR6PQ9Xhks9XBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XeqwX4/U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNPYxc013401;
	Mon, 24 Feb 2025 02:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mw4oWOwxuoUZKbuJU66NwjCCVxhiWWBXXxC50Wiyk1g=; b=XeqwX4/UiynulYnm
	lZ05RsQfcOJsGIN3eFNbAB9QZ/kTlHLEHHLfRedXLNS7S9/vygTeI6X7u/4Kih75
	UkDnq0Zl09p5zuFFEKIk+yewUkMpPY4TBKF52SxeN/xNaqrO70U6Gie0ukigWBG7
	0sKGYSZ1NBcD+7t95vZgGyk4YMxbs/dHeDCwnh8webNZA719VCoTb1vMQ/ZenIt8
	W2HQuWTXsPYrc8xIZDU2RPFYH2Ym2wNWrBJhZcdVLyYY7fmRIqU5bHyT9LqwK+wC
	JDBn1Lc9tQrkNKtxhlo62Sl4xBqJ/pgzwF7zidiiqJqFPFksGH6hF5dcOjhBeB5j
	aFtPeg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5hrubx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:47:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O2lCGO024736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:47:12 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 18:47:11 -0800
Message-ID: <2f698476-d551-4361-bbef-0cef48a27a52@quicinc.com>
Date: Sun, 23 Feb 2025 18:47:10 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
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
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
 <20250209-dpu-perf-rework-v5-4-87e936cf3004@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250209-dpu-perf-rework-v5-4-87e936cf3004@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XhjFnKMau5keTxkqv1fgkekeaivnq2fp
X-Proofpoint-GUID: XhjFnKMau5keTxkqv1fgkekeaivnq2fp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=843
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240019



On 2/8/2025 7:21 PM, Dmitry Baryshkov wrote:
> The fix_core_ab_vote is an average bandwidth value, used for bandwidth
> overrides in several cases. However there is an internal inconsistency:
> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
> in Bps.
> 
> Fix that by changing the type of the variable to u32 and using * 1000ULL
> multiplier when setting up the dpu_core_perf_params::bw_ctl value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

