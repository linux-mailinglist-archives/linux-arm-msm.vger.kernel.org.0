Return-Path: <linux-arm-msm+bounces-14601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DCF8804E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 19:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEEB1B23C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 18:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6EA39FCE;
	Tue, 19 Mar 2024 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TtsM7dHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CEF39FC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710873173; cv=none; b=A6mq9gKE/RhH0l5WdTB2d/4gHmm+ZmZq7rinC9wZ/RjvuDJItCdJxkAihA2T308bbZ9qwQ1AnJJQaQ6+UNP6wSPuPHNAyxV/7uMjV+6mcj6Uni8e7VKEqGxaVnaWt1r55skVOQSYidZEAzfB+Qp0MjFxRqmsSt8sGaIMIPgELQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710873173; c=relaxed/simple;
	bh=S6rAd47pOB3c6JcqxU79Nmy4dV9dDyBokNqvKVSvg9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qLkqVLS89j71/xYR9dfom/y1xJvA1CTrlwX3b2QPpZozbw/3DGzGHLSpSP8+GG0tVCIl0u2MmkmjQQTFbXafVffuMeBMIGfQ+OMUvfdX89xWPxhzXO5l+dyF7nEEVgFRZmB07FNWCClZY/D5tNVT5svg6tdHwiSURrCoj5wVtTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TtsM7dHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JHGt36007519;
	Tue, 19 Mar 2024 18:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uifRfJe6WlpvvM8lasmnrUcYi3K1vZD/ckQrC0MS2uo=; b=Tt
	sM7dHlmfq4mtdLtWblobCJzKuE7nwuRAZJADNmmzlCu5pU6wg/2QtyUqbe03QZL3
	aQmEmX7Fgr+8b6vs6MRs4PKGDl8Pv7wtqgVTamtnWnd3dwVbwbaSZ+9/HvP1bK+4
	KPi3We8DcPZIMh+m0ywuQeRJodaiM8J+K5Oy/0EaDMckUdA7kysm+7W0QreCZbe0
	7uQ2a9BNeVi0c86A4oMhv845gjBRnvl4F0tYSjDVtojO6UcXRd4R/EEjmWjAwrer
	pqSB2jjEAZIsGigUUkfTtn+jorMIda7VQGe1Tpw9w9DwDL2gFnFrVs9UpuzyDE24
	3I0NbioPf452pz0cNDKQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy5ws1ram-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 18:32:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JIWgcC011472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 18:32:42 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 11:32:39 -0700
Message-ID: <7da86853-b46a-c85e-8f5e-df107fcc4677@quicinc.com>
Date: Tue, 19 Mar 2024 11:32:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/5] drm/msm/dpu: don't allow overriding data from
 catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-1-79fa4e065574@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314-dpu-perf-rework-v3-1-79fa4e065574@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6p6o03dCVTlWUh3y9HCy5a-sreJvpXX9
X-Proofpoint-GUID: 6p6o03dCVTlWUh3y9HCy5a-sreJvpXX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=922 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190140



On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> The data from catalog is marked as const, so it is a part of the RO
> segment. Allowing userspace to write to it through debugfs can cause
> protection faults. Set debugfs file mode to read-only for debug entries
> corresponding to perf_cfg coming from catalog.
> 
> Fixes: abda0d925f9c ("drm/msm/dpu: Mark various data tables as const")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 

Thanks for the fix,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


