Return-Path: <linux-arm-msm+bounces-26660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6D937DE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jul 2024 00:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FB2281834
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 22:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477FE80C0C;
	Fri, 19 Jul 2024 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cVVJyVO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF4282F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 22:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721429196; cv=none; b=kzPjjQzXXWrqKWigL6hqWozxbK4fN8v8rCkoFfPHSTL4J8RPgmUZmqPJTxg7/COQKUZ81uxWFrHgM8jIumZjgCXxliQ4CE0wGREWT/tY21zGqSuplHWUzTkRsUskuHnUZOf/XJNb+dttEcaIcXSk6NM9t+toKNZAlweF0wBU2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721429196; c=relaxed/simple;
	bh=rdIs76iIXkjto6W3Ph/AnY+6CNg6BGvFTI/r/OhTsbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SAG/A1JuP7eQrJD/8Cw6fyyghWc5Ag+ZJi7LUcy1LFQ0e2jeS6NYxWVijsLVk8rofGhx2H/bDamlZQmRywfsdQG0jfXiyUUHk0rWv5sbfVNM49crHPDrb8qj+7mNEYq00zqe3Jvbw4bdyAJ7KLR52T+62lAfbux6nrDOsIuiQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cVVJyVO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JLDWWR015560;
	Fri, 19 Jul 2024 22:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxudrX/nS4+GlNQco/ywyjACwfaVAPMfSfhDy4oMPZU=; b=cVVJyVO/pAwVUDBJ
	g7E9FvereD4qhO77RpbO7tes+jZCrlsrDhl77tbvHZikbTYYX3JxkKWzTJOrnRGF
	pe2BGgYZE42mKbE/qmxWm1SjE7RlIlCDUqJnuzG+xJWQG+oBKXSFZzSYDwyy5gVo
	t9X7TXHNuC8PU/VIuHPjSIYckpGBetq6rwXrG2O6WugWa0xZmV1rdiD2siK4Yi9F
	m3o5W93Ip9uKpMwS3XIEjajS6JZJA39yN9gBfNN9tffqPlcOoKhOLejmWyFsMRKF
	8fLEoYjqn3z9OFJIdD9HvYkQ7wdbAZNmKtXsS/CYcOMkcTa4X9C3UKADIycJh6eW
	XO/vRQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40fe2utm2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 22:46:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46JMkMo1003980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 22:46:22 GMT
Received: from [10.110.15.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Jul
 2024 15:46:21 -0700
Message-ID: <154d3b04-9f7d-4c5c-93d4-99c53d96e7f2@quicinc.com>
Date: Fri, 19 Jul 2024 15:46:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/16] drm/msm/dpu: make dpu_format_populate_addrs
 return void
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
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-12-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-12-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7j1LLSuaO4OOUVclSp2pY-Mb1wDaAMx4
X-Proofpoint-GUID: 7j1LLSuaO4OOUVclSp2pY-Mb1wDaAMx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190168



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> The function msm_framebuffer_iova() can not fail, it always returns a
> valid address. Drop the useless checks (that were already performed at
> the time) and make dpu_format_populate_addrs() return void.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  6 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 62 +++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 10 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 14 ++---
>   4 files changed, 21 insertions(+), 71 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

