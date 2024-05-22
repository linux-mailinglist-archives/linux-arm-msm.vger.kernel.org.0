Return-Path: <linux-arm-msm+bounces-20257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C89368CC672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 20:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2341F2262D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 18:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752C2145FF1;
	Wed, 22 May 2024 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dFtkPAjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCE11420D2;
	Wed, 22 May 2024 18:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403207; cv=none; b=lf8u1u3vM13lfqgiTCriGCgpXPWrxeqRtBv87PYouEV63hbfecTylgP/2qMdWJDpO9gv1RnyTPT+wSgebYlJi61/qDcszoO4di6ncRQvMWaGpJe/cacfypNDx26UasP81BfTRJuTt9UW99Iyn4nrwZ4ZQRvdYxzot7HfQ6oZibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403207; c=relaxed/simple;
	bh=GOHbMu1tPVuRHBT0kKQY2KGhOa1VRjU/ZiTGxFGQoDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HfNkpcKQYzj2tCyPSkGy26yoey5P8hWSccSlCzo9mC8RDDIg6Jlx0Zq6OUhY9Cqj6COdYtSWLWmkEHNoQ/uY3wmU/4fad6ZBLpBZzzicqhKI1zdsXDywDoJbnyQEJ9GBAwbWB1xMMdkYp/AxaifARzqXsMrE9ui8QD7qbdsMOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dFtkPAjs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MBXDG9001188;
	Wed, 22 May 2024 18:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=it/GcHz2Wm4J5JUdE2mkjD7Y0tMWOLfCZyBOfhtZlCI=; b=dF
	tkPAjslVHnLD00O5TgrxLRuVnfll5Vvm7f5c6VJ8Ofm7V1qbC2eCW1Ps9U6v8JAP
	0afSzkRgy8HglUEVZUhWYoNCdzRGQ2iXznZCRLGkpwgzsLeP22mcQsNYg1WJd7gx
	hk2Vqka46allGyTCRp7J3ARtsu5EjokItEqfAwOctDcgNKEdXVdynfuR7qQE374C
	o6TjxSKoYTn8fuB2NQjIJzfkA04e+FHANmgQ+g/h5PFxdaRn2AtouhFKvMw3ORLo
	7PpBy6exh5xbgxnvNRLUzht+7696D4eHo3rUqIQvv72XjRzQN61BfsA3AFa2jHy3
	USWNhaRkUEKOmaXIorbA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4pa9d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 18:39:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MIdmJg015822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 18:39:48 GMT
Received: from [10.110.28.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 11:39:48 -0700
Message-ID: <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com>
Date: Wed, 22 May 2024 11:39:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: npxtvBUxVkzchbeWxi4XjEmkjS--o5u7
X-Proofpoint-GUID: npxtvBUxVkzchbeWxi4XjEmkjS--o5u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220127



On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> Command-mode DSI panels need to signal the display controlller when
> vsync happens, so that the device can start sending the next frame. Some
> devices (Google Pixel 3) use a non-default pin, so additional
> configuration is required. Add a way to specify this information in DT
> and handle it in the DSI and DPU drivers.
> 

Which pin is the pixel 3 using? Just wanted to know .. is it gpio0 or gpio1?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (7):
>        dt-bindings: display/msm/dsi: allow specifying TE source
>        drm/msm/dpu: convert vsync source defines to the enum
>        drm/msm/dsi: drop unused GPIOs handling
>        drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
>        drm/msm/dpu: rework vsync_source handling
>        drm/msm/dsi: parse vsync source from device tree
>        drm/msm/dpu: support setting the TE source
> 
>   .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
>   drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
>   drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
>   12 files changed, 106 insertions(+), 62 deletions(-)
> ---
> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> change-id: 20240514-dpu-handle-te-signal-82663c0211bd
> 
> Best regards,

