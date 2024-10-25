Return-Path: <linux-arm-msm+bounces-35978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D19B131D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 01:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9B51C20E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 23:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9988115821A;
	Fri, 25 Oct 2024 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YUiv1uDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822E217F3B;
	Fri, 25 Oct 2024 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729898515; cv=none; b=TRbx1b5KxDQjP9Q3O7kxXXQBLx+5a4fF7ECDFocBWO5iM75IE8CnVUyfJxusfnTdBB6V259xAklKnRSi4PE+vwXlgaWBqgBONxHpBH9FUnO/iYHdeyWotNbSdIkrdoNs/QJb57+HztMcBDLBE4XnIdApZ5abYwyY0gtLHMYYg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729898515; c=relaxed/simple;
	bh=Ju0pB79+Mhc8Rfo/mT0LrJrNkNncFBDzq7Y6y8aq8RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PVuuaa6zbAmu/2iEg7FrMtkfIIstFOaG9j0sBtpE/zXXia+YlnwVicDGowk2+sqMLJRTPT9IjNCxBoKX7e/bL43wuPJPwm/LHk5AYKduk1qGIhGK+kq8/XV41AvBGZmA3apJ8iw80xV3gh8h/kMPq4Cg+WW7H8wX7dtJg6b04Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YUiv1uDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PLC7lg019387;
	Fri, 25 Oct 2024 23:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LT7r2uAEdhKgQKz7P2qb8Qdnb1saW7siQMdR+0nAxaw=; b=YUiv1uDnVPKYUqQP
	NAqfGQBwlTgk6BWs9QJkrN69q7ZTiK1gIniuzfZMilGzf0h3kSTpfEHBOU3dfkDL
	ykeISZgT3rt3aGyNdAXU7AZzW1ZXvQV77p00ZT0Z//24/IP92G7dxjdVRpHJUxyS
	xxYkSp3VefGlIFl3giqd9Lm19bzttCGqn3fV8gPsIOQrtTN1btX5VeG3BsIDQC/n
	7mPjsSaGpWhVlkyEOzJYkkCCeJkDeFpNDY79eElc1j91dVqXtgcl7K6+cQi6q7CX
	qeiq0Ghe7eaYhwQf6vTvWHDTta90lC6liS0kW4v7ZkzkAX57/Ij2/dINENCavDj4
	Okiz+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wjkb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:21:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PNLjxH010780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:21:45 GMT
Received: from [10.110.83.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 16:21:44 -0700
Message-ID: <f0b8d8ad-a752-45c4-a9eb-f481514062c9@quicinc.com>
Date: Fri, 25 Oct 2024 16:21:43 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] drm/msm/dpu: split dpu_plane_atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-5-0310fd519765@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241025-dpu-virtual-wide-v6-5-0310fd519765@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6emYX-LuXbfO9JhD7JSzxkXGS7saOxgE
X-Proofpoint-ORIG-GUID: 6emYX-LuXbfO9JhD7JSzxkXGS7saOxgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=667 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250180



On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> Split dpu_plane_atomic_check() function into two pieces:
> 
> dpu_plane_atomic_check_nosspp() performing generic checks on the pstate,
> without touching the associated SSPP blocks,
> 
> and
> 
> dpu_plane_atomic_check_sspp(), which takes into account used SSPPs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 +++++++++++++++++++-----------
>   1 file changed, 112 insertions(+), 66 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

