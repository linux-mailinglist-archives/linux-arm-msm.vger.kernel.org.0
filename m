Return-Path: <linux-arm-msm+bounces-17277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0E8A1ECB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5780E288867
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 18:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198AF16419;
	Thu, 11 Apr 2024 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HH0TN9yj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF514AA7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712860885; cv=none; b=ivuXabUmP0CFmb8GngcPjiCjDq/fM3LrI8edC4W9pf1S2i8hHjLp8N9AeNQNk5m6oL8BinQZp0RlN0MjFLIKWR6JuDjooMAtfu7PC+rQeAx1tODglEc6x5MTtxosgcapL7HVj9ZhQ4LKkJFf0o9xXNt6FWNYWWiDpuNg6ApiKbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712860885; c=relaxed/simple;
	bh=n/RLTKwutoK1N6W7pV7itlaSB/RAgcTsr1VXEIhb6gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uNDBSEjAVv5UprAwYG0NgCJWZmVWBgW3/6ZBPeQQp/hSI78Raio1PKQvyU3Txj+ga33xbbS0+b8jZPGg/8QQMbltxJQ2FVKdUfN6gGcn+dKfRyxxA35J9FehR5gIIkTnCFssaXnK9Ai7rXnHlyVOvenvSxUALUkd3MF03gk/eyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HH0TN9yj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BDvPE0005503;
	Thu, 11 Apr 2024 18:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hir8+2VrCHIvCF21DdaN7/DiG2Bz/BZSv4bvNuj7k2I=; b=HH
	0TN9yjperQv57AYN/7FhLrNJrKVTLVNbnPj2NZJxnIh/IsJdCcGGOR4chn60/n34
	kDY8LbxZyYe7WPKhz3XLqqO8e7qJvbCCQxEOgruBYEfnwo8ax3yDZrnWtCPE23QM
	tNWtERPIvo2axQ1ADhmzWIh7wbzy5kri2a27oGoFkOgEwsPnF55PAWKR/EuL83Ua
	gMNQMP8glMixthNq+JNcTMUlbu18D87wCvy53Zqbkg1ATUoGD7ZWaazGJN5DM0oC
	F984Q6yaVS42IQpdBfFyuDrxMfq2PHLqRakh+XwgnoyHurYMjJIeuft/pp9Jgj9n
	0nYSg53XSBcQc8nGZh3w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebq1t2wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:41:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BIfBfB010853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 18:41:11 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 11:41:10 -0700
Message-ID: <0ce28e37-0d92-2eaa-7d95-0b3829149a8f@quicinc.com>
Date: Thu, 11 Apr 2024 11:41:09 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/12] drm/msm/dpu: pull format flag definitions to
 msm_drv.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4fdm-8U2RToJpAAut9s9hrgMRyIa9VH5
X-Proofpoint-GUID: 4fdm-8U2RToJpAAut9s9hrgMRyIa9VH5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110136



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> In preparation to merger of formats databases, pull format flag
> definitions to msm_drv.h header, so that they are visibile to both dpu
> and mdp drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 28 ++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +-
>   drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
>   drivers/gpu/drm/msm/disp/mdp_kms.h          |  3 +-
>   drivers/gpu/drm/msm/msm_drv.h               | 24 +++++
>   8 files changed, 91 insertions(+), 84 deletions(-)
> 

<snip>

> +#define DPU_FORMAT_IS_YUV(X)		MSM_FORMAT_IS_YUV(&(X)->base)
> +#define DPU_FORMAT_IS_DX(X)		MSM_FORMAT_IS_DX(&(X)->base)
> +#define DPU_FORMAT_IS_LINEAR(X)		MSM_FORMAT_IS_LINEAR(&(X)->base)
> +#define DPU_FORMAT_IS_TILE(X)		MSM_FORMAT_IS_TILE(&(X)->base)
> +#define DPU_FORMAT_IS_UBWC(X)		MSM_FORMAT_IS_UBWC(&(X)->base)
>   

Do we need another wrapper macro on top of MSM_FORMAT_*** macros? Why 
cant we use them directly?

Same comment for MDP_FORMAT_IS_YUV macro as well.

Rest LGTM.

