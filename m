Return-Path: <linux-arm-msm+bounces-39984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858729E117E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A68162848
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 02:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9520913FD72;
	Tue,  3 Dec 2024 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hpLHFksj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADB7FBAC;
	Tue,  3 Dec 2024 02:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733194404; cv=none; b=VJKUCfnSHw7oK4sGff1do28EGXjl0HmM52JDKI+TV9EVlJ7dxIuHAh9JPcfGrQ09YoL26VDbZeWGrOqHFI/w7vDRmrbkdkBdZGF2jC/Wp0SE3ERz/xeRY3a7cNWmPPbZmtwHbgtPr66WpfKDpLEfB8kOLQUu+QnWbHBjFaxjlco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733194404; c=relaxed/simple;
	bh=gugiWDWJmzX9YBxkSsrk/RV1qVXF7sbUWzXu+Imb71E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IDK6U5AP3WsXQQ1jwpVlLu8HqJbJiIzpX9VPBREnbYzxR4O8mI1aTFZLsFXNCwTCBJGLPKN2BYbP/FEVtsayCFpgVx7Xd7EMFJkStZlSS1KhElHK5sJFSNMdkGlFqRgk5s3BpOZZBkuIj9tmAKEQ+5WYI/mS1eCtK33jQLuYXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hpLHFksj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IqtQ6012892;
	Tue, 3 Dec 2024 02:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDZvvIJWx84Kcm3a88jA2sDh6+Ht6aJ3HkFmZEN1EwY=; b=hpLHFksj97CJZTRm
	wSxYjnh4aecnTuJ4XR//ua72gouF/Fqs0lEVEq9ZF6XmHXJ7cfhdyF4n0SEmK5y7
	X9AYyD44IH8gKSVJW8QSQOiD7PURe1+r418oZkn6tuPN2fdRosp0d7XaOP/sWrVV
	8i2n/fA2XGCvwSoCWAdXkMNX8pTmYAESjpBhj91cPzKDVJpyxRqnQEuCgQ/vdJZ8
	NDJrsfRVbDxtdTpQ4WBYM//rcDRdhEanCFo77kSe5cN7x5VHjevkYNJOEsJuDEcV
	YyB27qBIw/ld/Zd5/6ILzoAYnZKwjmKOZMt2KdgltC0N7PjyHNQFX9MaU6LYRLEW
	ToKtMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mxuqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 02:53:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32r7Ls011176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 02:53:07 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:53:07 -0800
Message-ID: <19bef0bf-6dcb-4ffc-851e-eeda2c79a861@quicinc.com>
Date: Mon, 2 Dec 2024 18:53:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: simplify code in pll_get_integloop_gain
To: Rex Nie <rex.nie@jaguarmicro.com>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <avrac@freebox.fr>
CC: <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <jani.nikula@intel.com>, <mgonzalez@freebox.fr>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <angus.chen@jaguarmicro.com>
References: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uxxYULHB1BBzvzvJKI50aK5wrBHbRYml
X-Proofpoint-GUID: uxxYULHB1BBzvzvJKI50aK5wrBHbRYml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=777 clxscore=1011 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030023



On 11/11/2024 11:41 PM, Rex Nie wrote:
> In pll_get_integloop_gain(), digclk_divsel=1 or 2, base=63 or 196ULL,
> so the base may be 63, 126, 196, 392. The condition base <= 2046
> always true.
> 
> Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

