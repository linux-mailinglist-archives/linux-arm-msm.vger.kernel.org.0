Return-Path: <linux-arm-msm+bounces-21830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D6F8FDA93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 01:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A62E2826BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 23:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AA13C28;
	Wed,  5 Jun 2024 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hNuGECa7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84E169367
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630466; cv=none; b=RkPoa2DJ8a3TjKxhSXmh6bFXIzkceuLmn2zqPfwkxtioOa+NeQZf5hTjyGOOP+Jhg9LS0V+jiUebEBFZ2LXcGxcq6Cz2P40IdxyfTHxnM+iR7u1d0P4L5yrdlqBlZLTsZCCg3Yp6NsQKda+qXPcR95KE0OnnvE6FDOGICpx5zhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630466; c=relaxed/simple;
	bh=/0623/n4rOQ1lvLd0Karq0hL8Ba6lG17/oBftEZILso=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CtgeA5+LpshUJHHQnudnlG6Gwou45jzdvd7ilVo7Fz2uJhNB/DISXl6/CXnmEmrkFXybJzZpX4Y3ylkmbrR0YBrwXumoNs/15iLBOuYrALbr9AXhF8hbIUgsgpnWLaK86XTf4TZipJEHaHQoFRqKkxaa5RzlHDqmFRmPJRqP9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hNuGECa7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455MSGuE008235;
	Wed, 5 Jun 2024 23:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WxArOI6VFwirbare/r+3IIc02a8u+UHZSpKihogLM3w=; b=hNuGECa7FMZMiex8
	OlxawczQGOalu6sFrlZqup5iHMusTsxvRfnyL9I7nBIujdTLm9/bc9o5f9v4/fxu
	AzUfFt9JAHjKaVv7IDhRtKfo+8CPxQcg3OVEK7qRTExUx/rWcOA6daeZtef9Qy8a
	VWcHvaFZPIQJTHjx1Ad3ZHBD36Y8XymcohREkT48qrmfp28sJ0EGceXRDiLtj24o
	ID8+YwfbZqJywgchdBheGRx1d9lUyQKrI3T4oKrBV4o6zUG7KEVEeoupI78pmP6E
	8SymxwP/WQUuyCFLXBF+zcXqHEaFr7baV6G92+y/g0DhMElgWn5zDjvMdx20Rgpn
	8U2/cw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rkdb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 23:34:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455NYAMa030969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 23:34:10 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 16:34:07 -0700
Message-ID: <5e4f6e36-d9b3-a3dd-1f0d-22d4d7c287d3@quicinc.com>
Date: Wed, 5 Jun 2024 16:34:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 07/13] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
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
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hmdy5qXjhUuecmyrr7dqGNOXmfmmkyOc
X-Proofpoint-ORIG-GUID: hmdy5qXjhUuecmyrr7dqGNOXmfmmkyOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=863 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050177



On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> Move a call to dpu_plane_check_inline_rotation() to the
> dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
> are checked for both pipes. Also move rotation field from struct
> dpu_plane_state to struct dpu_sw_pipe_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 -
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 

 From the first glance, no major comments, I will give my R-b on this 
once its re-spun on msm-next.

