Return-Path: <linux-arm-msm+bounces-35274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B9B9A72B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 20:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0A81F226BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 18:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DCF1FA26E;
	Mon, 21 Oct 2024 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmPtr4KD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9CA1EF941;
	Mon, 21 Oct 2024 18:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536974; cv=none; b=MXmhfEvqp8usLy2Jqe4KKQGni+WFfsf6NpLIfP1PGPwmj+mS2tr6Ye25psXGoaPOkVOjhiAntja9gmtBOwtCNUhqtpYYWXrvBLTH8yYirhweKU4qNlqWd9qRia4emJDdqAEvxWAQFVFB7xOVk6DcS28hnGtSiUnaKBWn6sjqjbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536974; c=relaxed/simple;
	bh=lIREXPfTxHHLbn3YJ8H4USRe1T/jVPt02K3V9MZRiKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L3zW2WZ6AXamYHADx9FtWQ74HZ8UcuS0Jpu1NRQAFAN63SxPAHGD7JhN+dr1HUmNtRrdlk845CFiSXUWVt+tHEW6JDfy8eeAapaYToBBILdXaX99/OZz12trYTHfrtKfVGAkdV/JdaS97wdYIpLEIlTRZU5PjjIXHLUYGQVAzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmPtr4KD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAGqcT032495;
	Mon, 21 Oct 2024 18:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XLMtvzM1nOasHAiJkjAODtNLkbF8wU3AvMOd9jqSFQ=; b=YmPtr4KDFuWo6pOn
	eHRviEEsQe60+eMJ/JBBB8508T+fi9eFyfbgHx5VXGfe2WzLYm8EsvICaYQNeZc4
	Zh0AomgOFBdS851HKr5VcWgceQ1XpZSezEly29z2PEmfs3mydjXAW694prvuaM0a
	dfQAUEHheMRDGrJdSGhVPyqzJlY51LANKuPWlhQBE5BONvkupKVMPskfn18flugU
	0Q0VMdSFKSULLHogBpiXmxxS6ZDNmGrKW/wWXiiuPzhzHpnA5dxQirjngNRs1mSF
	MeM1nopbHTLuuX7jgiyPeKlP/SrYAten6aiuhphvjzofNkfu8mJQploMNPfzYCsq
	TquRUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vuws65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 18:55:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LIthZM009576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 18:55:43 GMT
Received: from [10.110.77.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 11:55:42 -0700
Message-ID: <874efba8-3051-4f5a-9fec-93d1b81527c9@quicinc.com>
Date: Mon, 21 Oct 2024 11:55:36 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/dp: migrate the ycbcr_420_allowed to
 drm_bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert
 Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tBwOM2Y67cd156TfEpblrnq1TA2pSL2U
X-Proofpoint-GUID: tBwOM2Y67cd156TfEpblrnq1TA2pSL2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=782 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210136



On 10/18/2024 2:49 PM, Dmitry Baryshkov wrote:
> Instead of forcing the ycbcr_420_allowed flag to be set on the created
> drm_connector, set it on the drm_bridge instance and allow
> drm_bridge_connecgtor to propagate it to the drm_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++---
>   3 files changed, 10 insertions(+), 11 deletions(-)
> 

For MSM part,

Acked-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


