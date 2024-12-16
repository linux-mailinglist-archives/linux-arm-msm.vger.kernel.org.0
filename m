Return-Path: <linux-arm-msm+bounces-42421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7349F3E44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 468F0167B56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044BB1D5AB6;
	Mon, 16 Dec 2024 23:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XNHNE9qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A4D139CEF;
	Mon, 16 Dec 2024 23:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734392139; cv=none; b=CE2+I+2SC2v/n9rxAji/5a+GEdwrK2yHkZwCfGqy3Zu8Mv8KGIFrQdRnTu0Cj36X3PdOsDaCLBkHB5dZj9IOG8mIQ1X2AiBW60zEbaxst4zkrp9xYVlTD+OkENdourzoZ0c7valxEOGcviEcP/3KPflxMJs5Dvc7d+k4Hw/BZEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734392139; c=relaxed/simple;
	bh=MVsdfBC9m65wpx7VHMEZT5yOCXfZ0Pps7siZ9c+CcBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cGNECPiBjSIvZke5kq+KUC3BIdLnOCnzWetIodogA3OvkfvrqH+2co9IOXxh0RzHMoZddXWiibNoYqg+QcYag7WmwjVnwQIkz2pdqXjsDNqQ7iggViMFTU+fwui7N7lJKup/1lHfusobHat4LbcZ1pUySKZUE/v6xdOKp+3sVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XNHNE9qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMPW8G012141;
	Mon, 16 Dec 2024 23:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tBmR6DVELjkHS5B5PnbOuEK9IPd8EMpTovhWSzyK+8=; b=XNHNE9qpl8paRCN7
	RW9EhlS1G6eXF9sQjELpx3lfgMmeuO/rV1zJ0ykAQjZwMTL4P+HjW6VMsfGogVS6
	G/zYEWAde2vXoFBhjDWrqCBEbD3HpvL4G6OidQT99mEdisJMo2o4tcBeC6LmO3rO
	hXbbV2lUvEOGQFzi8NSMEgAww5pOV2iNfZBpWe0p8tuYwRL7jv/4W0TG2/U+xcUS
	ztr44BDjMNOe4P096Ki69eqXMT8Bwv6Or0OBPU736grBGwyJcWZTHmEjGVIiFRdi
	i2jY593EZQvQqA9VeeWuaDaohdMIZbyC0n+H56EIzsIAKmbHAhoWroZRRXHbAFgJ
	7KCPsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jw06841j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:35:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGNZRNV014979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 23:35:27 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 15:35:27 -0800
Message-ID: <4b239b35-dd01-4aec-b5f8-b57e1ff8d01c@quicinc.com>
Date: Mon, 16 Dec 2024 15:35:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/msm/dpu: provide DSPP and correct LM config for
 SDM670
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Richard Acayan
	<mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-8-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 70_9FDmUWzsjD9gsgKM2_jBm7OLugrBY
X-Proofpoint-GUID: 70_9FDmUWzsjD9gsgKM2_jBm7OLugrBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160193



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> On SDM670 the DPU has two DSPP blocks compared to 4 DSPP blocks on
> SDM845. Currently SDM670 just reuses LMs and DSPPs from SDM845. Define
> platform-specific configuration for those blocks.
> 
> Fixes: e140b7e496b7 ("drm/msm/dpu: Add hw revision 4.1 (SDM670)")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 2 deletions(-)
> 

Matches the docs I have,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

