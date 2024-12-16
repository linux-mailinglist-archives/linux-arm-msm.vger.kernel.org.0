Return-Path: <linux-arm-msm+bounces-42399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E99F3D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9071416EA74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ACA5588E;
	Mon, 16 Dec 2024 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jpyQCcQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD32BA49;
	Mon, 16 Dec 2024 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386699; cv=none; b=haPfYb22Vlpg3/jdZ24QiXDzZKRYMA+nJ2hUpJXS5ZAiYXtR54MCLcws0NWdjfA7+HEMNWs1Hz3QkSeXDNtlXd8RDH+5ivStzAX8+AJFfFESXb/yOcyAmELdx3XNQCU8MTRiQio58s0wAhH3XYrNRaZwwpRFJtyKhXKrvWQoluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386699; c=relaxed/simple;
	bh=OOIy0eCBg8MOWO6m8FNa0PF3HCDpM8gNNELqHhtc5jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HBTTEtNgHWrkqqnD2NV9euV7Kn35QdzUJBDJ++Kl7mL1wFw7/b1gOjswq09mhrpdV8dBS3ABGYTDtWxkT+r9WCfjmSySC5vWSdx5GduAfEi+QjDMwtDtUUt24U4vJtKFvZX0o8X/Qi4YM33hTkS0bGprZ8PQFKprWwS2cVaNJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jpyQCcQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGD0ZWg023666;
	Mon, 16 Dec 2024 22:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KdGDbi3J66V2vbozgHrcXAok6psTWOAGS0f8XMuDWE=; b=jpyQCcQzAYRfroEN
	P7KyTFY28aE4GCa6bjZy3LSepCOIfw6C/926nsL5aE9g5t/CHukb6emyYl+er6YM
	Ztf5frVQ5wiVni7nEYVOLmAAvrIvg2fZQu+WEmI7yftAo6TqPsCqxjBkHRPUq22P
	FXJfiyttxlD2NnNlGiSVZh/6mh0ZSFldAtRaCqoU9yyL+2gykhAo+cefahSvti0N
	xnhHAaEbSF4thH3gtgVBt7sf5YvqsHMn5/YW5RLuLjV4c/JuqgXpOSmTXPTIgThr
	gso+fPq4ZMt58bbdnAIzZwmIdc8UAO7E5srZ57U/HV+1kiijt7+DxDtW3thq+sxc
	xHV+aA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jmqcha5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:04:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGM4k57029660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:04:46 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 14:04:45 -0800
Message-ID: <eb4b8e0c-8356-48bf-9e4d-780bb60377ef@quicinc.com>
Date: Mon, 16 Dec 2024 14:04:38 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
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
 <20241216-dpu-fix-catalog-v1-3-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-3-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0wPXOZA6peLabB6Jawn2jq-cDSkJ9PAc
X-Proofpoint-ORIG-GUID: 0wPXOZA6peLabB6Jawn2jq-cDSkJ9PAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxlogscore=861 spamscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160181



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

