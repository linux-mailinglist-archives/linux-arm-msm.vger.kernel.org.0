Return-Path: <linux-arm-msm+bounces-22657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD08907F47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 01:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5961C2152D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 23:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AD314D29A;
	Thu, 13 Jun 2024 23:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+9Ax1Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A8142652
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 23:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718320459; cv=none; b=Y+VuDmkMlCMQbeixlx+6YcdGvz+wqFR2u7U0IUpWNnw3usJWsKAzJd+tsDOos5rf+to4X19Xf4qrTP0hM1lVpYeVQF4H6Zd9KkB8It23zfXj2P0KYwUHvrMSRWXzeUGk4JI8hHmbtv4qWXpeHVCcpL17K/jfRlgMFWSr+6jeh/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718320459; c=relaxed/simple;
	bh=8m+Ho9J0gO03kPFk70Wo2KQ9wYynZgNLoQc321nbhz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kx7IfOVZInkAvb46b9UukMB7+ysAzr4DUykkjZ2de4WHorKmbWWKlxkx/8ROaRlQPQjtssBp7NvNOyvnSY4Y56tJJAUav/1zgZ8MEy+e/Tnvmu5Gh3dTVdiSJF4mGbMieZOgTfEUYZx08zyIxjoSKDawdt+/isuYzdJweHydRVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+9Ax1Tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJHBmi000799;
	Thu, 13 Jun 2024 23:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LY7LxIq/ie+kY27pJWuVaJOdJPtraR6qdhEcOcs1vM0=; b=U+9Ax1TgnFZjZhe4
	B5xpFW6uoFut93yV+3wKGVhrc/YZYd+nu0Xiw02lR66nCCR3TzBMeSmrI4J0/UQ+
	ycZeI90kF1TjDy4Ic7Xt2m3Tp/b+jQQd1ZDqGFtvsE84g9jbyYo435timm/7+O0k
	vj1YFgQ3NonywJXzDX6biImpUQfBuqxo+MUqqcw83DnbADy52Q2rf536ovHHl3wo
	WMTilKp+1e9ELChQ21BVfTe86wvlBis6BVwwIqRhNXwK3CB242JHxQJBXP+TfGU5
	bYWIs1Eisowu3O3FMHDO/nVHSV8GNFkjxWgDp12UhgkX8UwpDg3+gRytqK9jEhVk
	KbRA/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q38gsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:14:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DNE6EU022830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 23:14:06 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 16:14:05 -0700
Message-ID: <ad0e897c-7ecb-79a1-a175-9b37805beaba@quicinc.com>
Date: Thu, 13 Jun 2024 16:14:05 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/9] drm/msm/dpu: drop dpu_format_check_modified_format
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
 <20240614-dpu-mode-config-width-v3-2-29ec4069c99b@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240614-dpu-mode-config-width-v3-2-29ec4069c99b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4BV92Yevt5qcsF7FNu8g3R75GLbfqYTJ
X-Proofpoint-GUID: 4BV92Yevt5qcsF7FNu8g3R75GLbfqYTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=871 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130165



On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> The msm_kms_funcs::check_modified_format() callback is not used by the
> driver. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 43 -----------------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 16 -----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
>   drivers/gpu/drm/msm/msm_kms.h               |  6 ----
>   4 files changed, 66 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

