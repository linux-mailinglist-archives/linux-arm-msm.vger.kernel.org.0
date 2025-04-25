Return-Path: <linux-arm-msm+bounces-55532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA2A9BC8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 03:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8C71B80E0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514F8502B1;
	Fri, 25 Apr 2025 01:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lJ9/M1ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CB2AF12;
	Fri, 25 Apr 2025 01:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546186; cv=none; b=Doap5yMHFvnKrTih6LhKYLpj8bFjML8qFkV/CW9f0Vmw6ryer9FwshNq9/avV50xVI96wnKFCiDBlpfu9G0WPJJ1cdpMS6mgri78sRtYqINrKz1UOuJpMW02xYRH/rJJcoAytEU4cx6O2WjdxkfWx8WaAzqt5q7tp5SR9nxFdh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546186; c=relaxed/simple;
	bh=EXpw3xVltndd9GX1BxqR6gO1n4n/hquokdJU7lWAHFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DpwN3n1kgy+UsqrJCzpP2ATYeYk+wLXtekauWgWIUWTW0RSBoxu7UZS0+HT8eTA0c1fDA/IU+GraJOe/hyTLQANuOq11rD2RWK2b9u7b51ytmfBM8aLA0H0mfbNgd38gcmCI9hSzfvqiSJse21MhmEqtv8M3DhLeVksHGNG9BDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lJ9/M1ln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17P4r015406;
	Fri, 25 Apr 2025 01:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uq76aP37X76ONnl+lRhkkUB5iTrDZVH4PBoaLJnpk9I=; b=lJ9/M1lnEz3dnQhI
	NATT03aIiLlDOm1cGWaEcJSgSkg3giujQoCAhZgWXS71owMRKXDEdlz0J6iIaEw7
	JfjIVwjDzqMMu6Ujm0dxOrYcoKAab4otru1CliOjqKZpk3VR1RZC6ozfWiakamqj
	reUqR8vMIZUDCSbb8slHf214UBUhsSSi3FuyRGnR2ED1JlZiKhmnIQrXoPKa8Y8C
	Uvi8Xy8HfdetVApkzzg3wfYxNAq8+fhKRE56PE4WsXFq8PJumgQdPO3dQyMmqIJO
	wJDNLHXMlCvlMT673FP93B3jn0+WFMADxpOsBgP9qPKndFDJ3LLWhWDWwFNseEYL
	rx8sEQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2febh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 01:55:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P1tpNt004958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 01:55:51 GMT
Received: from [10.110.71.121] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 18:55:50 -0700
Message-ID: <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
Date: Thu, 24 Apr 2025 18:55:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu
	<Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a6gkb_jYG5OeBZd41G_Te93wvjXOu1qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAxMiBTYWx0ZWRfXxoZ+eLcGwTY0 ffKVgvG2GTOJK/aRB0cOSwj6VGleAOPN9vq5OtEnPrmnNUZni8A6vtLEtv1ZW+1uOj4KpJpLBg2 IXlvnig5PuKbJ3cMPBIcaXNjrDv370lw4DIT9x37DBhvMIyPjqtDdNEt8K59W8s2sXG2A0vQHy6
 5NDfxR9MiQKqTo/CcGUH7auDp40BzsdczfHrryNu3fJUwVbCzZBYac2Zy18ES+mU707dvSLp7B2 MTySViQcYWMH+7MHdY27cNfCBt12U8swbPXE8Dp57ncCfvoCCtEw1TJZObkkkDmDni/3RrfJacM bJhOq8j0SkJK333rJ1oIkd1NxH6HrTHJ4cHmeJpkYe7kKlf+/fnWkKGy1Ix5vzoLI/iQAiOZD08
 0VJ3qi3M5Y9bfrKq5AF/G93nO6ZlLwAkWKplhJghul6pj+xYnkeHbTpImk/zvv/USMV/a99l
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680aeba8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=cjMNjaUJHgCVVxW2E9cA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a6gkb_jYG5OeBZd41G_Te93wvjXOu1qy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=719 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250012



On 4/23/2025 10:52 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> support. Present DRM HDMI Audio support has been written with the HDMI
> and in particular DRM HDMI Connector framework support, however those
> audio helpers can be easily reused for DisplayPort drivers too.
> 
> Patches by Hermes Wu that targeted implementing HDMI Audio support in
> the iTE IT6506 driver pointed out the necessity of allowing one to use
> generic audio helpers for DisplayPort drivers, as otherwise each driver
> has to manually (and correctly) implement the get_eld() and plugged_cb
> support.
> 
> Implement necessary integration in drm_bridge_connector and provide an
> example implementation in the msm/dp driver.
> ---
> Changes in v7:
> - Dropped applied patches
> - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> 
> Changes in v6:
> - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
>    callbacks to the drm_bridge interface (Maxime)
> - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> 
> Changes in v5:
> - Rebased on top of linux-next, also handling HDMI audio piece of the
>    MSM HDMI driver.
> - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> 
> Changes in v4:
> - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
>    HDMI driver.
> - Drop outdated comment regarding subconnector from the commit message.
> - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> 
> Changes in v3:
> - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
>    (Laurent, Maxime)
> - Dropped the subconnector patch (again)
> - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> 
> Changes in v2:
> - Added drm_connector_attach_dp_subconnector_property() patches
> - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> ---
>   drivers/gpu/drm/msm/Kconfig         |   1 +
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
>   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
>   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
>   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
>   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
>   6 files changed, 31 insertions(+), 170 deletions(-)
> 

Looks fine to me, just one question, please confirm if DP audio was 
re-verified after this change.

Thanks
Abhinav

