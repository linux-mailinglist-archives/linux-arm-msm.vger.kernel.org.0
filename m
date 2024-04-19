Return-Path: <linux-arm-msm+bounces-18001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794C8AB7FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 01:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5041F222A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 23:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8090B13D896;
	Fri, 19 Apr 2024 23:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IuR6LT2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1261E13D612
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713570937; cv=none; b=dryNLCHI0AplQuRNpoirGPncgIUkA7iH1Z6KqxjcbNiMPtmJCZjjJywMZX4gAerfagrl1ocJsJ0bi9P+aFCcQzhfMITCEnxXuQPad8T6M5lRercWt8FMvmEq+dPd57EotVFsi1C6QmIu5qbpD0sOLd3besRNGKlqGbP5nEfYT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713570937; c=relaxed/simple;
	bh=/IKZ3SCw1YfJuaIIYgiONjHyhruY3CWJPiIhMcMLPsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DFBPSwFQ/POTyCzaHpTD+QsuD6uvxDYwQJmQQlVfOY7KitKzLJ7OUy6dmnXkfCiF/RMzf8kCvNbrlfW3w2iU4cqE26LyplZViWMEK1jReP/nl5sskqNbUg92qCopvwjSgPxnfymKW8PTHZVRBM9P6nXTOHcV2IrZma1gvUcaGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IuR6LT2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JNGN51025269;
	Fri, 19 Apr 2024 23:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cTI9lVXw1uwLUnzHNsroHUF5/8y+ct+/75P/7l1gNpA=; b=Iu
	R6LT2AbdENsQcSmmfuSySpgA2WxafE7qNkIXor0bT0NS6cR+yZ2crfhSEiDwBg/D
	+nRUzxS4dSbZW4ZiGMEdth9ZhHb+/wz2Q/tsDFSEJzaHC0YKwT9BTPtCzXGEYgyX
	jZx0BTsP5fqPQ6W/sdzUtdUVnkP6EyIX0WBhglGbpPj9nGyOA5t5dMIOvQm5sLN0
	wuTlh6Gnc2Cw52CJj8cBIyPJSj+Xt84TOMFHCBCaTrNC1X7M/tcmqm8U4ZNQq4UC
	ABRYos3BGAF5rI6UMPoP3Pt3Q30FUYEXxsMxCRbk+5PGpdE+lL4mYYMOHvcoSULJ
	yMHBt576DfeB2CNuzwUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm24wg1u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 23:55:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JNtPjh030871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 23:55:25 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 16:55:24 -0700
Message-ID: <edbe25d6-7a8b-307e-40d2-4b352d1682eb@quicinc.com>
Date: Fri, 19 Apr 2024 16:55:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
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
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-2-d0fe6bf81bf1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240319-dpu-mode-config-width-v1-2-d0fe6bf81bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cWm2z29wvGR2rGxvbqB53KCEz0Vfm0Rj
X-Proofpoint-GUID: cWm2z29wvGR2rGxvbqB53KCEz0Vfm0Rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_16,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 mlxlogscore=892 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190185



On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
> Store the generated layour in the plane state and drop this call from
> dpu_plane_sspp_update().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
>   2 files changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

