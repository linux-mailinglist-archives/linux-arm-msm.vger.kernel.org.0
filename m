Return-Path: <linux-arm-msm+bounces-42380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B373D9F3A0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D9216CB52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CC8207DF1;
	Mon, 16 Dec 2024 19:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XqWNfTc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CB207679;
	Mon, 16 Dec 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378050; cv=none; b=UXClHKFivRh0Y+/I+E/Yn3P7kLSr8Za0GV1t1gD8jf/46qIw/0MyPXSBMh5BolnDkafqJybFvnmj3uiXIZHyz8UmDRzh3geYXc5WWBJmp/bLE+k/LpDnfozm84c55xsJzG3vNU6s1n+8igctGXldgTHj0ikLGnTZgUDu+7705Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378050; c=relaxed/simple;
	bh=UJu+NBq3Ii9rP+TB6FpQKA5fZk+O2JR2Ity67bK8yxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UM5tVOml5qFoe3UknQv1Bzk6jwMv+QjiVBnhTPDN4hoLbUVsvpaos7tpWIMD7rTBsx+00ZgjL3B3L7FXqSBfjFzYtf1WVjjrJne2QOrujg8P09JMvGrR19LPaQMEHpDayK1igpA2aqB0Z9Rf6y7ENBDgj2UoUXNPQrHmdT13eIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XqWNfTc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGE5bqh013330;
	Mon, 16 Dec 2024 19:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIYAf90Y+pXaJcLIYmG3uytoqhcIAoMDr16CStgQEnM=; b=XqWNfTc97Grx1nN5
	oQ1VBcZekO6FDuIl0q+HrO1LBbD53yeZfH7qmzo0OC21MkvhXjJgMReq6zyMDyYQ
	OgJuY2ACYC6ZQ07pNPB6HLQAPggl4ENNJr110RgbFKO0g2PPWAqbZYG9IQQwNtLt
	kY12uQLWB7c5Fx8gH+nanXgrgm6dmwKDGO1am4SxcPq0dBFB+UDwjyPqnrx5cofW
	3pw48R2JlMUXtLBtJHYDMKg8kP8jQ2nZ+8Qu8/gOkMi7G2s1wO638mIg1vSl/BW4
	nQ8DtauY44kXTjEIyCu17vO5kmm6WHzltC8GfPpmqYMuRbBmRYcXxvv0lka2mO4x
	zQoP2w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jnnurupt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:40:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJefYZ000545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:40:41 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:40:38 -0800
Message-ID: <cb759ace-482e-4840-8545-f81e28d4ca42@quicinc.com>
Date: Mon, 16 Dec 2024 11:40:37 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] drm/msm/dp: stop passing panel to
 msm_dp_audio_get()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
CC: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd
	<swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -bxco4tv4zt2OVDzVR6JjddVZ-HWe2YO
X-Proofpoint-ORIG-GUID: -bxco4tv4zt2OVDzVR6JjddVZ-HWe2YO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=895 impostorscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160162



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> The dp_audio module doesn't make any use of the passed DP panel
> instance. Drop the argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c   | 3 +--
>   drivers/gpu/drm/msm/dp/dp_audio.h   | 3 ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>   3 files changed, 2 insertions(+), 6 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

