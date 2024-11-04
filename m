Return-Path: <linux-arm-msm+bounces-36980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 656299BBDD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 20:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A60ECB21EA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 19:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E8C1CCB5C;
	Mon,  4 Nov 2024 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fwaadoqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31F1C729B;
	Mon,  4 Nov 2024 19:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747672; cv=none; b=h40TvwQTK3kBPX6w1F79IaKO2JepBZTM0RwHIeQ2D7F6poTXssH6N3Jfhj9c17SWHjjTKAAfG2EC7jgFOMkX2xzf+97zC96Cvks0RNTLanit/wh4RDRVWsiAHiajdqLCb1tE45+tMkUMMmrCriINv8zY+nibJd2mMSq7EcEbfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747672; c=relaxed/simple;
	bh=gZCJH7ZGSAzYm+eKqghuoVLgmX5A+zETD4M0CdcwgF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uaCGqFyQ71peleZDniA6pry+R3cc9boJrQzPy7kxWxEDwfRypnSuf8f+3oJPiwe4rNa335Nj5F+Dz3rI7W6GnJ1H7aDsOYKFdCE2TrMOXGB3G+0nM9b102ICdNL/EwF1uc0HMJDYHZC4xW0e3qip0xEiQA+C4/0qmcsidKzhu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fwaadoqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BjhB0005210;
	Mon, 4 Nov 2024 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQ3afCaiuQvlRFSZynJOm+joZ9Z2v4N/aCEb5qLkRjw=; b=FwaadoqwbP9lTleJ
	w81v46T/hdV8DX8lAGNpwPY3hWV0A/+Y/t51eE/nIlcbHh1CGQMWwVbI4lABaiVY
	R+FNk/U4k2Y8wu06ETL5xbS4PknVgkjsioetlq0r3vsGuuyWMQvewMkTipUO1fzt
	CIPrySRvHuRTq0yonOfKgqgDvzIoNg3jBQM6JHpvtA2Vdbtv6nCg9P/LDIkWBlEk
	mw1lxILdU9W0i5PicjgCz77mjU39rFwqBFK+dmzJuNFqdHKQSGAYM0uf49Y2Rhfg
	XFVEYtmNVG0Vut1xNxbF2bV5XBQV9dCwmePmuoyFYzGZ92FbrTDzhuGxaUozBXL3
	Ci1Akw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s5928-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 19:14:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4JE9WH014497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 19:14:09 GMT
Received: from [10.110.96.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 11:14:06 -0800
Message-ID: <3052ea5b-5226-4c0b-a4c3-1d4185ae9726@quicinc.com>
Date: Mon, 4 Nov 2024 11:14:04 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Use of_property_present() for non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>, Phong LE <ple@baylibre.com>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
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
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20241104190636.274926-1-robh@kernel.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241104190636.274926-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ll936qEETZvQHfpUSt8tw8iNQ9tUEa5I
X-Proofpoint-GUID: ll936qEETZvQHfpUSt8tw8iNQ9tUEa5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=943 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040157



On 11/4/2024 11:06 AM, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>   drivers/gpu/drm/bridge/sii902x.c     | 2 +-
>   drivers/gpu/drm/drm_panel.c          | 2 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 

For MSM part,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

