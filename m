Return-Path: <linux-arm-msm+bounces-42422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C5E9F3E49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6ACF161B46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062521D63C4;
	Mon, 16 Dec 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SJWZW4Hy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515B139CEF;
	Mon, 16 Dec 2024 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734392196; cv=none; b=T7sZztfGmV03Zs3n7ETy86EZ+1VWutybYw5JotjrkyEoZYv8Na1Tn42ZKm5o3vNyNWpM3dDxvUROdknypIeH2FDv14r8kLrlGQ8yb1KCS1v5DS8JgbLSKlUn/M0xzedXqWB1D7NAXQk6tRsXZS2OsPyVGO/zjHNrmU7VyIWtbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734392196; c=relaxed/simple;
	bh=TyX8OuIzT7LyW9v5fuWxn1XottEalqW82DJqCBSlq3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=laX6jMvpE0WIezvcgoTme9LsyHBwDsBlB2yqQOLaihllJaAbRCr9iV1+bFU3TTyci++zDgRLOHcwTZa5u9UoQ5ckqqJoo2P2hLfddqevhtxsr0ZhA16nTqZ96z0pUZJ9XVs/0BAbnHZRDvENSKvKXXfd8HStrFx4cjykSIfk/qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SJWZW4Hy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKMN1v030630;
	Mon, 16 Dec 2024 23:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxAcUhRKkdclAnGyeiIV6adWFiwtPqFrf9phhQGTAf8=; b=SJWZW4HyJeyezK/Z
	pGvEKSXcVZZ/TuZynLdgKTZ3phW7lE6ezszf7lXXTNoA3nWZ/jFtqXJB1lMCWU61
	xZKQGN1iqGcfR03wXqRLV3qXSqr2GL2RnR52XnbUo5REpjIeJBY6kT7be/V+AQXu
	Fp1AJzB5poTN7g3qzcsgUU/bjWzG8FsU3wmBVhOPxkxXrLQS7wS1wTJ+kY2N3+bC
	hvRBX3Tz4+t2+khJR9Yfci3/1qBbAk6oslKOMZZ4ECix2hVbe5JmIOKisTfhjZx7
	Y8+JcOpDq9qyrFNqGWBdq6+8SBV/Q6o2iyF1sQ/Ol5ifad+ZHdybMYS7LQCjkmoZ
	/GBT1g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ju61rbfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:36:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNaOsq032314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:36:24 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:36:23 -0800
Message-ID: <bea32a76-c6cb-4121-a49f-6159f8c25db0@quicinc.com>
Date: Mon, 16 Dec 2024 15:36:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] drm/msm/dpu: catalog corrections
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Richard Acayan
	<mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RlXC3Gm99tA_mQefnIrBQH4PMCQCSj3H
X-Proofpoint-ORIG-GUID: RlXC3Gm99tA_mQefnIrBQH4PMCQCSj3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160193



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> After checking the DSPP units in the catalog vs the vendor devicetrees,
> link several DSPP units to the corresponding LM units. Each correction
> is submitted separately in order to be able to track and apply / skip
> them separately based on the feedback from Qualcomm.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All the patches LGTM in this series,

Thanks for the cleanup

Abhinav

> ---
> Dmitry Baryshkov (8):
>        drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
>        drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
>        drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
>        drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
>        drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
>        drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
>        drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
>        drm/msm/dpu: provide DSPP and correct LM config for SDM670
> 
>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  2 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  2 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  2 +
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  2 +
>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  2 +
>   8 files changed, 66 insertions(+), 2 deletions(-)
> ---
> base-commit: 4172e9bbb583a2af5f1a3db437caf72a90714ad9
> change-id: 20241216-dpu-fix-catalog-63a3bc0db31e
> 
> Best regards,

