Return-Path: <linux-arm-msm+bounces-28257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A7D94D71E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 21:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 164E5283717
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 19:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3D916726E;
	Fri,  9 Aug 2024 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAvkGH1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280681649CC;
	Fri,  9 Aug 2024 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723231037; cv=none; b=L4rTxtvjitNYnlYI8zS2Bix64str2vA5jXOz8WsqUdbcRnLj7vnik204V58Tjot1lR6njW8XEQ4eF3cN4RHnUo6CFoAWSWsYmfM2P9nzqlgcEE6Knja+YmwZq1ojpj8CIqCvGCoj9qz/jt+h6Y9SsBI4gpOfR/9J3+Et17kz2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723231037; c=relaxed/simple;
	bh=F8p5nAhavc5JTeBN/FHWFmJeIJxCLJ/Zg43+zDFj8h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lVKOhuSiPc8f/oTaRmM7yyV+v4yDaShzbZc9uMdHoaUK/F7UrFUOW2TjOfZNReKy4Jm/NzCf5QAfmqwJ8Bs3hmr5aRCZqofGx6TWrhEL4fKA4zX6c+VXJQb59x9/hDqDzXtDKciiD7BG0uE0jJ/X/83rrIkbFbHMi0FbKD3PE50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAvkGH1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479IoOvg005902;
	Fri, 9 Aug 2024 19:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHdb6/kU/+bjU4VrSd5g+vginE9bQaQD9x2Gf8GMbN8=; b=dAvkGH1JdcRo8KMo
	BCoaOEPPTuSp78tECKkfTZ8AY07ti5m0kEcCgcA2gdoEkiuK+n1uThU78CHmeNk8
	wyPcRqPMWEP8NC+Do0ls1AgaEhvy+/PTM5qnmuooL72BdrAlbD1XCNs2L7+pZ8uR
	iJLL6Qyy/Hw46MX4bF5zNlNFOXEn7a5m8xP8W2cGgVi8zGgEV8dlLhbN8snawbYI
	TA4g2SAYFZBF/JZVrhK2tKz2CDGHNIkgEhyjotiCOi9KdxCXV9kNcpT0kVsfr7Sz
	LDm7iJ2koXMjX319qy/OVxue3pCFJcSMocZirbP9lNGB/TygEEQ/bAEUACXOSULl
	0ckV8g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40weqf9qbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 19:17:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 479JH61w024751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 19:17:06 GMT
Received: from [10.110.119.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 12:17:05 -0700
Message-ID: <efa34434-5a8b-4841-8f03-9047c7e49ea1@quicinc.com>
Date: Fri, 9 Aug 2024 12:16:58 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Remove unused pm_state
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob
 Clark <robdclark@chromium.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20240809183752.160634-1-robdclark@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240809183752.160634-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dIy0bnoe6cwaxYoQbgzSNTKI-Xfuh2DZ
X-Proofpoint-GUID: dIy0bnoe6cwaxYoQbgzSNTKI-Xfuh2DZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_16,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 mlxlogscore=893 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090139



On 8/9/2024 11:37 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This was added in commit ec446d09366c ("drm/msm: call
> drm_atomic_helper_suspend() and drm_atomic_helper_resume()"), but unused
> since commit ca8199f13498 ("drm/msm/dpu: ensure device suspend happens
> during PM sleep") which switched to drm_mode_config_helper_suspend()/
> drm_mode_config_helper_resume()..
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

