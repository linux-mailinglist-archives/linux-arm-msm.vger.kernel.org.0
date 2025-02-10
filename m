Return-Path: <linux-arm-msm+bounces-47491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250BA2FCFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB491885541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6A62505C3;
	Mon, 10 Feb 2025 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KSugTeet"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB0D24C69B;
	Mon, 10 Feb 2025 22:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226381; cv=none; b=ht1lNHIJvhZCAkOgyQn1FSqVyZAevTFjkShbxY6v6hUBeMZruj8+DR0UaTM4QZKjqg6rs9tEFoXNtGpNsb+42NkTaqFQuziFgcF0Y6lP1gQSCLiFYSZ6t1ZljeBtdjXjQ3eRvN06Q5GUBIzmURtPoa/D6LPys+RgxcLuOf6VAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226381; c=relaxed/simple;
	bh=SEahgPWmLPRATg2I7lBTH8xnCEX0VGLxvZpdMfaQ8bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hnur1sP0z0vUIvGxloH0Fcx0NBea/Ym/yYx0rqn6xyVq3EFQbBX/JvDRQGOfjkAjOg+bfjy4ChfvpVfNIw9iGfazqjdPfem/vQP+9IqRRwmU+wuvgJgMITR9M/bdhTxuOGaVEXeFrK3x9uUoiuAciD03DAe+bzgjTd1A4oEIJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KSugTeet; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AJopVQ008282;
	Mon, 10 Feb 2025 22:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JkX4/9yze2RT6/wf9KzkDi8PmHo10GnvR6H2a/gySE=; b=KSugTeetGCDeoO2m
	MmrLNMMuSa+NF7eMrImHptcSp7nZlIho3RkZ6Y5ZDFRK4uFIF/P2R7+H98xKKaF0
	yPVNHQcGVfIziL6jtxMZ7rwrUfV5CkvoMl3bp3+6KLAScsefsSC4oN4wAXYzpp2S
	btkXVhIEWyDSSUemrDzdDByeq7NJP2J2Z4JhnDHRxrAt3yRMU0p8TayjgXWtzu+L
	vcFdl5l8GfUxur9w6CFSv1wcI/gc7pVJHpfqTch2IAXZNwOOShh62vgd4zA8C9af
	m1F90qVHNEgFnpS559SLHZC3ENmb+/xnyMuNzMekLZ93URv7eFG2be8+5cZqHj10
	TUy4DQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh20wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 22:26:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51AMQ18r007693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 22:26:01 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 14:26:00 -0800
Message-ID: <a91da500-b575-4071-9c2b-e03c9c737144@quicinc.com>
Date: Mon, 10 Feb 2025 14:26:00 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/msm/hdmi: use DRM HDMI Audio framework
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
        David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>,
        Simona
 Vetter <simona.vetter@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-7-0c3837f00258@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-7-0c3837f00258@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D3xspndLYeAmkruYqi0Uoz3kIT2YabVE
X-Proofpoint-GUID: D3xspndLYeAmkruYqi0Uoz3kIT2YabVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_11,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=869 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100176



On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> In order to simplify the driver even further and to remove the
> boilerplate code, rewrite the audio interface to use the DRM HDMI Audio
> framework.
> 
> Audio InfoFames are controlled centrally via the DRM HDMI framework.
> Correct InfoFrame data is programmed at the atomic_pre_enable() time (if
> it was set before, drm_atomic_helper_connector_hdmi_update_infoframes()
> takes care of writing all InfoFrames, including the Audio one.) or
> during msm_hdmi_bridge_audio_prepare() when the new stream is started.
> 
> All audio data frame management is deferred to
> msm_hdmi_bridge_audio_prepare() and msm_hdmi_bridge_audio_shutdown().
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 91 ----------------------------------
>   drivers/gpu/drm/msm/hdmi/hdmi.h        | 18 +++----
>   drivers/gpu/drm/msm/hdmi/hdmi_audio.c  | 68 +++++++++++++++++++++----
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  5 ++
>   4 files changed, 71 insertions(+), 111 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

