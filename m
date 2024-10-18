Return-Path: <linux-arm-msm+bounces-34989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2389A4597
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3852E1F22D4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D288E145A0B;
	Fri, 18 Oct 2024 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ce944a95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6EF20E32D;
	Fri, 18 Oct 2024 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275343; cv=none; b=nCyfe0de5V0k+tKriJEIfjeiGUahV4t5v4HlkMmgjje7oqNUwOhpNQseXWH7M99LT3ftwL9RfT3XRZrhvLrzHbekDvE3Tk/Ta6GvWov7Ff9RWNn0++/552JhpOkqllQtIXjSdSn2nhMh0IMZVO9SgEHrCyOWI6NS4BHMUOW+K0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275343; c=relaxed/simple;
	bh=jv/D3vm7DO04YGEy8tkwSkDBspODOJWwhXLDfApioTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ic88+/IbPRvH86Vbr7wU4hLd7TAUakslvstxz12255AtdPHQqhTRU00v87IACI5hp8jTDbfLcYRB32FcDbt9Uw73Q7psWJS5J170W9BA5CaajhgvXwxKvQ8jv5SJmNSB9NE1hqdRJOR9wXYCqAcsCT9UAKU+mVL0Q4vJURMUjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ce944a95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IF1Zbj007753;
	Fri, 18 Oct 2024 18:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bhA28BU6El0DJUZoB4jqjni3gLuzg3EG2xRIHXxrnGs=; b=Ce944a95RdH92ru8
	3oLRLTLufJLhzVIQftwAjglxztEDqWuChySdsFPuqQeFW/Tqx0H0S5ZOX2C159bl
	JuJKJWjkKgiQv7jjE4UpVg6KmwYzZdQNI5F93HgRoN+DZccgoeNZlQ4g0dIG4rgm
	sraJkPjpJvAsyv14WMCCr/hpB74DrMdVg0TXyGoECKAMqK+2ngUu73RLIfq22G4f
	EHnZVpJEDUhMOyKR6Ylv7mGiYS6gl1xnj9nJhg73mbWcEJSFMQo34q9m/7FRhC8W
	Xu16V58Wx2RhtGklVYdVDzZ+8c/3tHPD4F5B+vkmfj5XFMVox+rxm8mLEq/8snWe
	DYY16A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hsv4w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 18:15:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IIFW2I021080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 18:15:32 GMT
Received: from [10.110.77.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 11:15:31 -0700
Message-ID: <e68b5271-01e9-46f5-bee0-c086e38927a2@quicinc.com>
Date: Fri, 18 Oct 2024 11:15:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm: move MDSS registers to separate header file
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
 <20240921-msm-mdss-ubwc-v1-1-411dcf309d05@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-1-411dcf309d05@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lqmNtzgceJTXxv-p_zWgB_Y8luMtJw7N
X-Proofpoint-ORIG-GUID: lqmNtzgceJTXxv-p_zWgB_Y8luMtJw7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=902 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180116



On 9/21/2024 1:17 AM, Dmitry Baryshkov wrote:
> In preparation of adding more registers, move MDSS-related headers to
> the separate top-level file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Makefile                   |  1 +
>   drivers/gpu/drm/msm/registers/display/mdp5.xml | 16 ----------------
>   drivers/gpu/drm/msm/registers/display/mdss.xml | 23 +++++++++++++++++++++++
>   3 files changed, 24 insertions(+), 16 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

