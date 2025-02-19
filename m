Return-Path: <linux-arm-msm+bounces-48557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF8A3C949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 505797A827B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C2621B9E0;
	Wed, 19 Feb 2025 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZPKBkBfA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195DD21B19E;
	Wed, 19 Feb 2025 20:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739995797; cv=none; b=OaLrwDWI3jEqFSIvmAx1HxhFCmElVxbUGVlX2b4ejXQcZgkQAfHUxP1mCfO/AmQFB7S86V4N6kuR3CBtasfPzhkOArSLzG/7eaeGqKChCytBf0k2SyvZMAFvkzRhqUZVHzjxEtwXf3WPQ36fQ9peEF9e1mwIiCoitMoi8iKksoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739995797; c=relaxed/simple;
	bh=WhudxD8gvZRLRlaAQPHkju/vck+43uwrkDgMJDCfjwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B4MVnldnLbZ0eqtv9Ff7RtBryuwvmV6ylwo3iFN3Cy0PwgfSMw2tDiGCGC3j2xSmIK2kNOvssNKZZv+1bOZfTMSsrcYCPXYn87/GW5aJChGXj1fUWZk3VOQm4GJFgWNxTj3rfNp0S84v1ArG7j7h6S2cA0A1CbXlnohGwFt7lyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZPKBkBfA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGcR7i001826;
	Wed, 19 Feb 2025 20:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pG01oGH7fuiVs0VYeiiXtmylPqK5guGPOI0XpTEK1aQ=; b=ZPKBkBfAhyHSh50b
	7KRRSj4NAZJlGcFpJuCyUoyACejL2yGE/g3EIg6n7ucjZjwB5/zYXvRm6Q9xn68m
	IwJDynqmQcq5oa8GZ4pC9RaUGmYMJNcA8oTw+Fdo+0V81W66BiJjertZimZiU2yQ
	KwjISE4VxpvlD8YTVtofFJ1gZsz9gg9qUhSF0haaOL/jJEtcMNqQ8G9xS63YsgEe
	dlSTpWWSFP93Ipx0N8k83OempJVFpPm8vOWN6Mneq+uREqlRETDlRviFq60dAUTa
	t0qZ0JdraMazynmb1SC0Lb9sZm7jBWm/xJXxFHN5lO1673vOC+d/Jd67sH9COCOS
	J/GmWA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2buyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 20:09:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JK9afg001785
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 20:09:36 GMT
Received: from [10.110.87.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 12:09:36 -0800
Message-ID: <0ad8db2c-b5aa-448b-bd4f-e4305bc64b86@quicinc.com>
Date: Wed, 19 Feb 2025 12:09:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: Add check for devm_kstrdup()
To: Haoxiang Li <haoxiang_li2024@163.com>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <jonathan@marek.ca>, <quic_jesszhan@quicinc.com>,
        <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250219040712.2598161-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250219040712.2598161-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: w6EFJGp3IeYKq0z9dpEfOIMw50JCv7dz
X-Proofpoint-GUID: w6EFJGp3IeYKq0z9dpEfOIMw50JCv7dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=864
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190155



On 2/18/2025 8:07 PM, Haoxiang Li wrote:
> Add check for the return value of devm_kstrdup() in
> dsi_host_parse_dt() to catch potential exception.
> 
> Fixes: 958d8d99ccb3 ("drm/msm/dsi: parse vsync source from device tree")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

