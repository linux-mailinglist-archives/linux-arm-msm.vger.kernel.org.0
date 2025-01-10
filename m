Return-Path: <linux-arm-msm+bounces-44774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E41A09EDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 00:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50F9C1889B69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 23:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8756021D5A6;
	Fri, 10 Jan 2025 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fYGirj0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81042139AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 23:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736553167; cv=none; b=dfVyIxTe8kwDN6kJxoUfa2lA8LSeuIkbz6rWPPeYIPhN65NepNG7H3kRxZ6LH6A1vl+41OguNcK/EzbIEvwhWzNnX6Zn8+ez9XaRkV8INujqT2DvrYMNdAmuuzDBwMJHNHMQGkCide8DslVHb1I8ZfXl7ZiKkWTsyE+vVH/0+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736553167; c=relaxed/simple;
	bh=scxwinpDrAFO3mPj67FB72w9Bb3Tb2kiMv1K6JxyzQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X0AcfuBsvClfYgkrUBvaJuDnzsus4Fcwj/RaPaBbm4KFFu5S/dzxZngeTIMuwWJppok2/4exBBTyJxbYuf9fX+qVJtjee4iT4jTZoVpOULoUX6mzwf/aNq8c6nBCarpVKye9srmxiBqLJk4fEuOHqc6LJuP1Ovuyw/Nc5ElXCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fYGirj0F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50AFErp5004220;
	Fri, 10 Jan 2025 23:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+3C4S9SscSvNxIsgyNBOU/MySH3qczyv4ulStPUsZQ=; b=fYGirj0FNndTMfUX
	VWw98wRlUArtp65ydIo8tEVctNErX9RG2A5faRHXqqq5szZzTHVOnQLQBabFLp03
	QkgyUMqJ6LLjNQ8+8Bvp5fjTOLmmO2Me5fhEL4k9QPhgb0AJcsMHtGHhWFVlisl1
	N5v/ieIOX6pOtpBTfFhztB7ROvepnI39VDGiGBgftenJ/Y3gxRCg6gNbZrC9BH+n
	DHfALqqIui4zhtauBe4YayyBEk9K2i+XroIkfu2HnM5w1KPPRer50WC+iVTC3oyF
	I1gZAFv9GCeQ6VFp3CA/oXFyuq82w3sv+czqSiB4lHw4E3aqJtEyaCKXutzInOc0
	ZDrP/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443618942m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 23:52:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ANqbfD032318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 23:52:37 GMT
Received: from [10.110.107.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 Jan
 2025 15:52:37 -0800
Message-ID: <c997bcd4-775b-4d22-afbb-680d9af13fef@quicinc.com>
Date: Fri, 10 Jan 2025 15:52:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/msm/dpu: rename average bandwidth-related
 debugfs files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-6-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-6-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lR_yswChR0xxGf3wuaG9_XPZKS1AFgpZ
X-Proofpoint-GUID: lR_yswChR0xxGf3wuaG9_XPZKS1AFgpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100184



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> Rename the debugfs files to match their purpose and the patter provided
> by other bandwidth and clock-related files:
> 
> threshold_high -> max_core_ab
> threshold_low -> low_core_ab
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

