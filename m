Return-Path: <linux-arm-msm+bounces-49399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C48A45453
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D1A1898F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C035C267709;
	Wed, 26 Feb 2025 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ADtWR/2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38281A08B8;
	Wed, 26 Feb 2025 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740543054; cv=none; b=Yn9wVB72megEIvIdg3napLSYwubUeYwurtLEmixhtANoNNY7A/98SvitozW/MwAJZPKPFdSB0NmszGgZX2mNlZYbQQtt9tpflZQsLL20dhXg846MJ2R7lU79tJ9vUAuNwLTOVkVZuxPRa52sb8vpafhIAS5A42iqSHcKJ5J3XCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740543054; c=relaxed/simple;
	bh=3BY1U0pdocC7pCxUx8eiTC99KB9OU2tuNmi79TCD6UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PB2VFxpv1m/NkR3qq/DRVbh9pA8+5wkr05Lg46O2XA34PyipeqnvPUDsMA7O01Wcd57n++0TYWtJbiec60COhqn5VGqv7vSEDw3NWbU/kiRDWn8RKAEI3ZtKiKj2OjCyt6g2uNRkCD6yowedVO3eGh/RUz5XWwUk9IN8JT+b+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ADtWR/2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXJwM017857;
	Wed, 26 Feb 2025 04:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9igG3d3TeQZGKwiYTxqqqFKugY3XF+PxDnkovdJS7o=; b=ADtWR/2ZrZ/WmRr2
	Yd04csp+5h/k3SbH4WEiG4h89sgj/qD1L1vn6cJOejhTMo8ZscKwEZxbE5xK0/F+
	kb8xEsPjc+50hlo99BMWNlWlCu4clZlrpqI+sKJEDw1wfv9g4lVqeuVdSPlZqPXj
	SE9v4p1kvQdG+jJ1v7yV3mrYfiDrA2vSS4eTCSScAmrq5VwElB5VpGkY8b0wcABW
	lmOAXBn8Q2mWA1XovDP8cXeKHJ2+FBA4j4K5hAHQbJsqF9Vl+eURSX/uK1v3vDiG
	ENvqAv9d5XJsNFuBaqGy2gHV6YQo8mlpV+ZkcgQxLA6bUobqtqSruvWfgZCP6k6X
	rktQ9g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn0nub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:10:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q4Acex007563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:10:38 GMT
Received: from [10.216.45.35] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 20:10:34 -0800
Message-ID: <fe0db67e-ee62-4e6b-b6e7-48e96dbe474d@quicinc.com>
Date: Wed, 26 Feb 2025 09:40:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Expose DRIVER_SYNCOBJ_TIMELINE
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "Rob
 Clark" <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250225225244.26625-1-robdclark@gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250225225244.26625-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -PC560jqYNSnAx6qZNp9TSKw2b79EKqz
X-Proofpoint-GUID: -PC560jqYNSnAx6qZNp9TSKw2b79EKqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260030

On 2/26/2025 4:22 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Initially we didn't want to expose the cap, as it would expose a bug
> in the vk driver (turnip) with older mesa versions.  This was fixed over
> a year ago (and cherry-picked to stable release branches at the time),
> see https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25981.
> So let's go ahead and expose it now.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 37db92c8cecb..70373e0fd4a6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -812,6 +812,7 @@ static const struct drm_driver msm_driver = {
>  				DRIVER_RENDER |
>  				DRIVER_ATOMIC |
>  				DRIVER_MODESET |
> +				DRIVER_SYNCOBJ_TIMELINE |
>  				DRIVER_SYNCOBJ,
>  	.open               = msm_open,
>  	.postclose          = msm_postclose,


