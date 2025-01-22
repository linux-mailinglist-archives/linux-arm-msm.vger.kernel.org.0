Return-Path: <linux-arm-msm+bounces-45755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3745A1890A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 01:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78637188C0F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627AF17C77;
	Wed, 22 Jan 2025 00:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kp7Zxg29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD017591;
	Wed, 22 Jan 2025 00:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737506537; cv=none; b=I3QvV5KUpEUI0r6b88mnGzgXj3PLai+tOWNtitFXghxl8XoEXogelZOHTUeNO0I331dFPeWmXbTB2YoD/Z8WLnmB0N00HUc51CTl+9NTevEDF8dJ4SUgEZOlU2bqrNkzvHMm2pPjfLqhxqiABxRU4yT8sq7K2j+Ps9Ishfu9BaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737506537; c=relaxed/simple;
	bh=rIS5abvXzBT2DJ4W2/uzc1xBZTHGQcwrAymVzVHDZwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qr2i2ic7HfCpDbkElCVV8nRT5Ruaq+Tf5Y3QHYWMOZ8oJ5RtF7QKyM8eoyFs4DZIqNf3KBFkvr7ofRkOfF/NIBd0uea7Y8ZeBVZzj+1n+/KXd6O7Ed8BVw4NUlyY7N71bn/gY/hMTWR4DxgZrt8Ao5YQXPOTmyOhNWDcoFk0/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kp7Zxg29; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M0euhF012858;
	Wed, 22 Jan 2025 00:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uiIg2/i1e4JoVvPiHH1TJPj0crQgW+NM17HOLL7/E98=; b=Kp7Zxg29z6prxQcO
	DJ5TN8cUpC4xWyrpjxN2tyZ8MOl0errV4ZN4Kcoy0zk46ODA0JOJitpKsrm9n3qJ
	arSz/2g8Nmrbs6uswg7t6zb979qPSmMUJN9f9AW+WH0hElxid5TtbxR8wiv/a1Lk
	PqC5v+CXOh73mrRj9FxNaXVKWtXK3Wl1lYmmQs5aQ1fBmtSUYlhWeqqpdzahNFVN
	kQnQ73EN+kVm3P2Pxd4kl696ubffRDDkDGyIn9MW/plKlk/4HH6ATBXIjaUhiy0K
	4GkK7EgDDypGApEkG8oDvJ0+v7DxX4zcFLiXWCsSHH98cmfXdGbEU9FrOARoHilc
	CDCHlg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44apbe002k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 00:42:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M0g5kI027408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 00:42:05 GMT
Received: from [10.110.82.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 16:42:04 -0800
Message-ID: <6018f2c7-7f58-44f6-8dcd-74cac44bb5b3@quicinc.com>
Date: Tue, 21 Jan 2025 16:42:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/35] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-10-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-10-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Y8SLHuCwetJJB1URWkWY4K71KdWw_QD
X-Proofpoint-ORIG-GUID: 4Y8SLHuCwetJJB1URWkWY4K71KdWw_QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_10,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxlogscore=846 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220003



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
>   8 files changed, 27 insertions(+), 25 deletions(-)
> 

DMA4/5 were introduced in 9.0 so ext4 will match that, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

