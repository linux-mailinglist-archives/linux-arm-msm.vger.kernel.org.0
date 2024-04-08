Return-Path: <linux-arm-msm+bounces-16853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8AD89CE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 00:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B007B1C206A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 22:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F064C7494;
	Mon,  8 Apr 2024 22:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XbA/ZiaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584177462
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 22:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712615592; cv=none; b=lZUWIyzdbAsuDqFd2D4YWtHDi5NWEtxQVemO/RrVfiYivlo321VoBxiIXrLldJ+DnO7MsGUNCi8YiShkoZTCXPz5oqXTzMAIrHOVcpLdde4IUHEapZHqBRkcrmp+76z1+BvntYCBUgsc5CQmzArKePvpki83fk6FRBOj+258YwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712615592; c=relaxed/simple;
	bh=vn8/7H4iSDGOBFYHEH3Agd0lnFJ0Ih03AlDSAm6oYYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LbvIMOeRgsqPWNwSGyjlLLVX63M3tm3LqQSS9ENQfuePvdtZL5vOfKp/z7Y+cfcTrJQRTaM6+EG4xVt/4rMa/wGrM1a/2fIbPjPTOzjaQOO/q7by7DTsfPloB4leqhYjZq+bNj0zBF25sXrS7GB4vu3cf8EAfWRdjadSJFZHccE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XbA/ZiaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438Kmsvd008018;
	Mon, 8 Apr 2024 22:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bgHxFY1joSX3CmgA8lmWaDpJpppLl3Jt9l/kVH4Do2Q=; b=Xb
	A/ZiaOe+WQoSJ4ftljoqE1SRZyP9OLBCb8MZBhzXXGNB9n+C8AVXjC6tcluT224p
	8YsINhJ28czwi6p/wrLjvXAAAgomWYxkMJ5DdWqiqrD5QJL9G37UPEAhmg66DcuA
	jzW0Az8pr0JFpW/Q/4fFotximh6InySbUErHSR5a66XQJL8EPbW6MsP8MmdRxmf6
	1dWnhAWk4KowSpSNZ/gmUt20WUZgHjEbOCBqOm6PMgdcnZa1Tu0jbd6zrQHch//E
	HIxlcKECHszNY+D/idddvpJvMd9ghYEyYEjxRQ1pJwy4FvkOGWp2RuWwYgVky8vI
	/j6cuzhGCPMerDkBZoHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg3hxkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 22:33:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438MX244019126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 22:33:02 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 15:33:01 -0700
Message-ID: <c44d6fd3-3b65-b47e-113c-ba1a6115c8b8@quicinc.com>
Date: Mon, 8 Apr 2024 15:33:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/msm/dsi: simplify connector creation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-3-962ebdba82ed@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-3-962ebdba82ed@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i_Cvt1ET_ju5pS6IbVuN0Vf8CZhioEwE
X-Proofpoint-ORIG-GUID: i_Cvt1ET_ju5pS6IbVuN0Vf8CZhioEwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=621 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080171



On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> Instead of having two functions, msm_dsi_manager_bridge_init()
> and msm_dsi_manager_ext_bridge_init(), merge them into
> msm_dsi_manager_connector_init(), moving drm_bridge_attach() to be
> called from the bridge's attach callback (as most other bridges do).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c         | 10 +--------
>   drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 +++++++++++++++--------------------
>   3 files changed, 21 insertions(+), 35 deletions(-)
> 

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

