Return-Path: <linux-arm-msm+bounces-36332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B139B518E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 19:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4173CB21D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 18:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948E81DC05F;
	Tue, 29 Oct 2024 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KOGw+pPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D4196D9D;
	Tue, 29 Oct 2024 18:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730225314; cv=none; b=Qk+5TO9Wo+kOP3jfDSUn1O1NsCiSfGFKGHQA/PZCtGZ52iwu7/cuV8Yd79H+I0TjIshAxpd3voIxPa2efBMeuHRWsaiWajIrBU6bdT6+QW30aHR+P4y6jYiLWWGDmlq4wLNJp8QWTULlwwp/XZDgK0DsrH5TeNvR707cscrDLFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730225314; c=relaxed/simple;
	bh=j/jMS3C5t2nf7ZCYnijw4fFfTnFvvqc4SQcedEPDza8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZ3Ubf8FxrKS4YrJRYyl6KCCRseG3218vL2s0rPZwJZJnFOK3Gpr6FdwoEVxmJvT6D6sjl4hQtdJMtTNQgOX+wDhZQSVn2ZDIkdjrTX4se1hAtFhk79QQcLpaGBSSUURu1DSp7RY7FjN1REOJdVj0000a4r2MO2TQ+aW9Nn6gbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KOGw+pPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9liXa007417;
	Tue, 29 Oct 2024 18:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ysPTd8iiBHzvkAhFO9HrGQijcbKImTXBaUL/3JnQlw=; b=KOGw+pPSM1XMRhyB
	8pwMikSsJAk7LOFQXPH2Lg9qjmyuqvw+LpFV7okAPQk6p/LPkOKskqo54MQqqsXP
	85TSsYTPMMBDmZsV5eYJYhHTwz99LrfyjwP0Ag5RTXwMFNJRFLVrm5LrpxEkAuGd
	D37sKoSTbITcqX5oh4kXhLe6kd0B6pC5rHyVZgbxnn8MVr4PJ0Cqn9BaEj+rFNFi
	RSWQEF3I8PYIBGOKpZNvRI0pQK6PDlM0Dl79ePLBO2rVUtimbDi10tGIl0Zzkmy3
	p1JYY2PVx4rfufgF7cVYNZNlupfLCMAvXjD+MlPprH48GFZA1SAwH0tHqE8omtYw
	UsLrkg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x9a1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:08:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TI8OnG014024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 18:08:24 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 11:08:21 -0700
Message-ID: <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
Date: Tue, 29 Oct 2024 11:08:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CtpTc7K1GdSKFgGdvlTLv_ZDB66khwz4
X-Proofpoint-GUID: CtpTc7K1GdSKFgGdvlTLv_ZDB66khwz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290136



On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> Follow the estalished prefix and rename eDP bridge symbols to use
> msm_dp_ prefix, moving the edp to the end of the symbol name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 6a0840266c0f..ff9ce9b15234 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
>   	.debugfs_init = msm_dp_bridge_debugfs_init,
>   };
>   
> -static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> +static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
>   				   struct drm_bridge_state *bridge_state,
>   				   struct drm_crtc_state *crtc_state,
>   				   struct drm_connector_state *conn_state)

msm_dp_bridge_atomic_check_edp looks a bit odd.

What about just msm_edp_bridge_atomic_check?

Likewise for other edp names.

