Return-Path: <linux-arm-msm+bounces-44694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A899DA084BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 02:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FC8D3A8882
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565A074BE1;
	Fri, 10 Jan 2025 01:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/PD4WcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B01ACEC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736472312; cv=none; b=ixKFybNqGOPQ/1/9c8NwcxLd7/NjtQa7k4GSrQyzDgy+rHilC/LwzIcipdt/BjiyWiqYHJKb/6++TEt80eOarDzS1kr7ZOSnD4+EcBp/+ZT1vnp2L0aUeuP6QFBW/6ggRu5L71EVSL0gyqFN61T2rz8KvtO9VNrKHJ4kVJcZOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736472312; c=relaxed/simple;
	bh=YY3NHRwQLHELvOdO7Ozq3rVsnDClXJ2gK1GujLLUI6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iT1eHMB/ESsE0BnoGV3bzyXMJ5hGVAeRQT98ki5rXd+xJX8xnUJU/JrhbZd5MkqfMlYTntBVk8ei+qprRTwgEyRAwu76TonmRy2lSZ3rRxLz8LQb0pZRkFiTjGjw0siz+CiKma4mlKDug1IqKZNUq2feF2cshTGVg8oAapBulfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/PD4WcG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509M5TBg016429;
	Fri, 10 Jan 2025 01:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L4Ga+SeV1kfUrOCk/FG5BNLIjMgfLI7lFzjEPWy8ZWM=; b=K/PD4WcGgvSU9vb5
	uSqplNJ9VtDo8sExTjSg6icDR4n1SzJt+nHc4W8ZypXiIDdD7bZQC8lPZn/niyZM
	LOP5Z/RTRlB1+oXH2x8hnIk1MEBRuDU5cUFWiIyqz7vCk4d6e9/p7bfAyhEi2fMy
	yHe557ChZ8cwBvSF/NjJ9dc5hiUzauDOLSOb5Wt7X4O5wkhyXQ0jvWQ0gRQrzJ5O
	Iwixlle3sPQQKpgqqM0gdi+Z0i6ZJ8h5EHKgb4R3lu1RFLILvBHHYGYiArveXSiK
	LKOE14Xsv5S2tY25w3QnfhwhqLdau46lhvDCqVPWvxpm/azTkK7UO2+grwSZJI+4
	PNnAfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n4r0jph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:25:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A1P1W5027912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:25:01 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 17:25:00 -0800
Message-ID: <177d0b33-4c48-47af-9804-3ed620912f78@quicinc.com>
Date: Thu, 9 Jan 2025 17:25:00 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] drm/msm/dpu: change ib values to u32
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
 <20250106-dpu-perf-rework-v4-3-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-3-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YBCPe1QNRuvH9aXbDnsforhg_NkjYkwx
X-Proofpoint-ORIG-GUID: YBCPe1QNRuvH9aXbDnsforhg_NkjYkwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=983 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100008



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> The IB values in core_perf calculations (max_per_pipe_ib,
> fix_core_ib_vote) are expressed in KBps and are passed to icc_set_bw
> without additional division. Change type of those values to u32.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

