Return-Path: <linux-arm-msm+bounces-21020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA98D41A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 01:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DF4A1C20F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97CC16E876;
	Wed, 29 May 2024 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gfuCF+/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A1D15D5A0;
	Wed, 29 May 2024 23:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717023727; cv=none; b=rNMvH960ms+nsyX+lSzcKbov6unxk5NRja+DFUAT8SPYMgvKbH9F5RhfGzDDlPNn61HbdqRg67AKO3cVhMFvAacgkVL4t8MOrnN4JcLfH6ONdXXA51hQOTWkpkcc/A9Yiyvu/pap8+pjeZW8NIfPluuRzihQ+frpZZfsqi3yP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717023727; c=relaxed/simple;
	bh=VrICSpY4lWFVsBkw4z6wwKr+wa6iDMtPMEtpvDxbAIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EQRi4tZ7ALr46rmeUxWeLQ9Z8djqkArWmGKaqqIUJC19LEyGp1SIUlUJ5XPFvblmmPZZHaAr232uhcjK7636F8vtuTjGLUeLgG6GUluy4uBV4RRSkdf0SMVuNYbth5PLZeVXSb0bukmSrfBTbzngDgVm7Qh9MOXk1BUOo36XXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gfuCF+/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TMfcRK018820;
	Wed, 29 May 2024 23:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXEZyY3bmGldVNf9aSPLwMytmTFcqI3zMsrgbKK61/8=; b=gfuCF+/4aXjF4mYQ
	GTl/a8Sg8dvuFv5lAcycXHmEd5TLENSe//uw+q/E1C0RFu0E/SRNmhWU/8biwPmL
	bQNjnbNmiLgxBTFPOZ7zxPdQFMQKvJRhpxNY4+B/6Ot3s06q8Wuc8O5yu7nSj0DK
	b2+UffMLlJyL+J0aTHfKr/FS/EAX8NV/sm5TbzIgaWd+sGYkF77wSps/nk+GR+JU
	vSHzqrHaFR/8YpaVEIzzWR8I9Qvtuvk/kZb8UMZK7RNpDvYa2KkhVjNwTc1SeFka
	WKVnFszOAuVQ2ueWDNTTxx/uzZElz0ryfVxwgSfDm0+rrEZg4bWTxnwl+8vbpNtd
	SRBUmg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0xahqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:01:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TN1mp2029099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:01:48 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 16:01:39 -0700
Message-ID: <abcb89b5-a29f-944e-6d1f-92a434e6f4b7@quicinc.com>
Date: Wed, 29 May 2024 16:01:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/7] drm/msm/dsi: parse vsync source from device tree
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-6-f273b42a089c@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-6-f273b42a089c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pZkZfGPbZ98B4mP6lkVPqHySk3P7N8kC
X-Proofpoint-ORIG-GUID: pZkZfGPbZ98B4mP6lkVPqHySk3P7N8kC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=914 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290165



On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> Allow board's device tree to specify the vsync source (aka TE source).
> If the property is omitted, the display controller driver will use the
> default setting.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>   drivers/gpu/drm/msm/dsi/dsi_host.c    | 11 +++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_manager.c |  5 +++++
>   drivers/gpu/drm/msm/msm_drv.h         |  6 ++++++
>   4 files changed, 23 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

