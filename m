Return-Path: <linux-arm-msm+bounces-42384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC49F3A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC84018832F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E1320765F;
	Mon, 16 Dec 2024 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g4vcnG7V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D8206F2B;
	Mon, 16 Dec 2024 19:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378506; cv=none; b=lQn298oWYzus3tf6PQv/a7PwZdDoXFHz7A3tfDf5i4WWq8Ii8J/8+ZoTZIwtz1enczC4lCghWqMKt5ONlxv4zGX42yEuYw96PYOqKkROhMdNmI/wORKlzWfc86PQUD10fAEcFtHxDSYateanKplrn2YWo3hLcdKgQ23MgzNeSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378506; c=relaxed/simple;
	bh=YMWGD0BqLUTZdCmzIPVXxbTAeYCuMjy9QE05gW+Bxms=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KJrxPSH+1gKlqNWKGwNTpm4/qL20s6WPQxb+arth6wVCoJZpzRx3+gePojhdbtfcHzRKPNF3yUeAaOeBH74BpPA9jGCAXYadgaQCvByyrSSMgNwSdoYXI1eiKFHQlHFmhqlImAC9uXej/j7hOW6eR2s1mD/54aSmNNJmaT2dXvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g4vcnG7V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGJ2hZq022389;
	Mon, 16 Dec 2024 19:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0zZcPlo3tHkTRYO5SgHaIgAlb70ko1PBgevt8qzsIs=; b=g4vcnG7VE1FaPm59
	WCAz8/uuP4PZFcsUdz3Ms67i3CjedNJpH4VfbWA9N9HEExthpMWqjYguH2gIGA0Q
	CqIFfgS2oYVERWkpag9ve/qaoSkFTVzvg+kELu9h4ZCHu8XcwTKIe/NjYj3t1/1a
	Tn8Ec6jKMVrOorGsNh20174U7rWEAPu5sBuqtco/DUXSfHS8AgCggoUCSPFAySWS
	5S1MF6DBMce2Nk0PuUTod8w5PukR7DJEwYSZtGEGAUP+Xxxz4yOOLLGAtv027Kdp
	MxpCjoBzs2746L41y4HvOgk695m6MKYI3SbLrKqYtICQzgcpB8DK8M0tiK3am0Xi
	it55CA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgrr9t1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:48:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJmE7o031120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:48:14 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:48:13 -0800
Message-ID: <18399e79-3c4a-402c-8ab9-7fd08f4bb639@quicinc.com>
Date: Mon, 16 Dec 2024 11:48:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
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
 <20241216-fd-dp-audio-fixup-v4-7-f8d1961cf22f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-7-f8d1961cf22f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r0VP-AsitkxvAIg3OH--S6KGel3lFxci
X-Proofpoint-GUID: r0VP-AsitkxvAIg3OH--S6KGel3lFxci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=953 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160163



On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> Having I/O regions inside a msm_dp_catalog_private() results in extra
> layers of one-line wrappers for accessing the data. Move I/O region base
> and size to the globally visible struct msm_dp_catalog.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 542 +++++++++++++++---------------------
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
>   2 files changed, 232 insertions(+), 322 deletions(-)
> 

For the reminder of this series, please wait for the discussion at [1] 
to complete.


[1] : https://patchwork.freedesktop.org/patch/628449/?series=141074&rev=3

