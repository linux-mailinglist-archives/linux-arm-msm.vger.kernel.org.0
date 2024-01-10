Return-Path: <linux-arm-msm+bounces-6985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916D82A45D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 23:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62F4E2887CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 22:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8DA4F888;
	Wed, 10 Jan 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cAUIbu1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A550242
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AL8DFF011965;
	Wed, 10 Jan 2024 22:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oesyJrlQp0Gpg0P9OkN3NOGFpipCMavvgUGCR2XwgFo=; b=cA
	UIbu1xjYILqDyAG+4pNMnN2ms1D3oWIVxgjTe5VozymB92ilehLdx8v5IjXMnQVj
	1yaGvKBPnQMy+xMgEFhVIer6XbPtVt3OlceNDy6o3NZvsu2vf4aenpfcXH68vfCQ
	PnRujOtZjF43nkFCPEjXsjNWYCaNJG5AtV5Xbmk4JakNwXTBfC5cHx1FTp/VMQza
	1lAR9+qvg5vEM8TJcXF5bqyNej77kjuDwpWDiq+4jnpnwsLc+lessqzx1OZV8dzq
	0hUZ1V8/SqpnxziX5oF+NQYaJFWvpIjlUTObZOWGSy7eZKGalN0bJuP+5UdYiyWC
	PoeckRqP4s4pcONpnaPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvhp1504-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 22:56:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AMupDl031286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 22:56:51 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 10 Jan
 2024 14:56:50 -0800
Message-ID: <6df9cb3b-ed79-0157-b5d3-b156af33363f@quicinc.com>
Date: Wed, 10 Jan 2024 14:56:49 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] drm/msm/dsi: stop calling set_split_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
 <20231009205727.2781802-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231009205727.2781802-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o8lkaYWL16FJpaomzFBsVomiTDtfO6KH
X-Proofpoint-ORIG-GUID: o8lkaYWL16FJpaomzFBsVomiTDtfO6KH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401100182



On 10/9/2023 1:57 PM, Dmitry Baryshkov wrote:
> Since the commit 8b03ad30e314 ("drm/msm/dsi: Use one connector for dual
> DSI mode"), the second DSI host in the bonded pair will not be
> associated with the encoder and will not get the bridges, thus making
> condition in msm_dsi_manager_set_split_display() always false.
> 

You are referring to the other_dsi->external_bridge condition here right?

if (other_dsi && other_dsi->external_bridge && 
kms->funcs->set_split_display)


> Technically that change broke bonded DSI support in the MDP5 driver. But
> since nobody complained in the last 5.5 years, it seems that nobody
> cares enough.
> 

Unfortunate but true.

I dont have a problem with this unless someone wants to use split 
display with MDP5 and wants to fix this path.

> Drop the msm_dsi_manager_set_split_display() completely and stop calling
> the set_split_display() KMS callback. Also remove the
> msm_dsi::external_bridge field which was only used by the mentioned
> function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  5 ----
>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 35 ---------------------------
>   2 files changed, 40 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

