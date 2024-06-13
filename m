Return-Path: <linux-arm-msm+bounces-22658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35A907F4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A145F1F23827
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B18C12E1CA;
	Thu, 13 Jun 2024 23:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mSUsHGWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94F4811FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718320598; cv=none; b=drqKpdN/Qtx0Ut//9nyCdz3rfGI1jbs+YtYJMwtSMP/EjR/vvUwuVCDgTYEF1n0dBRKd3gw6Zj3sTLHlN6yKhe7tYDN5potjdCGCbCadNKjJzmZGzyIX8SJ/J8oFAFI+EOSExyXVy9krIzwBg9oX42HHneq3Ab1q14jq+/bjn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718320598; c=relaxed/simple;
	bh=MT1n/n7zI3JjnKctbwCTfEKxL/nt3OsOzLzRmZRhLjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cLqgLbs0wNubG4gHpMbYGqnq26Mic3OW71WqQtednbhLZ+E/3pV1KmrUFmuSd0V9FLxGoqSQdw6cxNNlgKJ3+yC9whjLyJRUq0jlgaX44MfBvdNI5lQaWg3Yv+084HD7Hnq9sCQj0bq2B2FHal3d26o1DLUugF25IWIlmGpu8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mSUsHGWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGIbw032695;
	Thu, 13 Jun 2024 23:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nH8v1NX8wpXS5bxQ2IXhBKnoi6L96g6jYKv+GsS5kkc=; b=mSUsHGWewueNnqw0
	CquKxeVz+0abWiUp19WfzHz2nke0BNv9VSeRW/XHDT61c+/dq/LY1adqYgyT6Fx5
	so4CxtR4BUzdYxwM3qsMszln4khI8VlJR+XC7S+aF7vaeV0A8U2eLP6mnKMLiUY1
	TxDm2vnHmpOt0tm+0ZSk2/O8aPkwmkhFkyyiR4sdbGbPowN8lsgfi7Pq+caTZ3yt
	70izzSCIzwEXubEYnp9JC5SCtnJILwRdDd2CmuhZj5dfcb14kRU7zm6G/JOCaNHt
	ET7We9WdlhoHo3sbgoLxB/haiU87AKiY7ElF4KvZWf5hGpues53cwGoUlZmYrtqd
	F1OYig==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2rgfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:16:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DNGQ4T030785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:16:26 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 16:16:25 -0700
Message-ID: <a4ab3435-c69b-e754-0d51-dc1cc54bfde7@quicinc.com>
Date: Thu, 13 Jun 2024 16:16:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 9/9] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-9-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-9-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uZR1dxjIhg3cqWqVI0K3I5oR0a-QXwww
X-Proofpoint-ORIG-GUID: uZR1dxjIhg3cqWqVI0K3I5oR0a-QXwww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=748
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130166



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> Lift mode_config limits set by the DPU driver to the actual FB limits as
> handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
> to the drm_crtc_helper_funcs::mode_valid() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
>   2 files changed, 17 insertions(+), 7 deletions(-)
> 

Did anything change in this patch from v2 that the R-b was dropped?

Here it is again,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

