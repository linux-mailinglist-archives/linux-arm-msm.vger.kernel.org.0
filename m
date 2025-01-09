Return-Path: <linux-arm-msm+bounces-44513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F163EA06D8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 06:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F4D166709
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A11FF617;
	Thu,  9 Jan 2025 05:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gznYPpP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720FD14EC77;
	Thu,  9 Jan 2025 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736400444; cv=none; b=SCA6qOZLdnEh5mZibqYgRblAkR775zXXm6PJjALFl2BXH/tkvVGRH57NC7ODanp8UEQEbf/BE36mMwSl9jMWJm27vZwZ87dTNBS4R0++OOZkFz8OwSKsRa2IuXS4pal1JFrkAD3U5YCLt+nSdT2urb35Nht2PDO4SC2AIXg1u3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736400444; c=relaxed/simple;
	bh=kLlzJQorMuptyWSEkUU3ETjnyTFggx04tqkPPHKONoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n9kKTlR8r0VuK5t0DBVgJWQEOU7hIPCfBja91Xq+S8BaOs6Zq5iNjnqgjnkKdWcYD/cNsVz+0hLsArjnzcUjJfzZyT48pX+9+CDLEn7D2RC1fKXdVfwlDA7zCukFOUi+iwwuaKL3VvW+03k/IeeobTBa0rw49Mxp9vSaCkcgKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gznYPpP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094F1QD009624;
	Thu, 9 Jan 2025 05:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpIhsdFB6/y2K2RGvdx8WKOgJmhGxtTk6i+OWYkJOH4=; b=gznYPpP+pTZOjl5v
	vJ6+4PeVRAS19DzPKMwMfQYmFTrAwRTkyQlxX6KIruetDBzRmf1UTl81lkwA0+0V
	OJtd1IqJ3mxaKTHDauBhhYsGXdIUHKDaE4Iu+uVCQlhJSoLPKEdfTP0qNuwDgRDu
	gf3eOPFwIABK6YxhoRIM6fvmMtRf+1fQ7R4zsZXUV1tCmfExvczCYVh2v4EWH+u+
	asMtZBPOWtug1M0dCRTHVZOXjbHoog3uQMPqUPQT7PO0WVsg/PDd24LnnRrSMbgF
	/gSJlRKMtckFfbFNvGxocOJNLK0MZSPnYFuW1Yx0aFEYUWfjxW0eYqGmnTLk1DZf
	Amo/Gw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44278t840x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:26:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095QCKk011301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 05:26:12 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:26:11 -0800
Message-ID: <08336168-3989-4aa8-aac7-a573c9302809@quicinc.com>
Date: Wed, 8 Jan 2025 21:26:11 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/atomic-helper: document drm_atomic_helper_check()
 restrictions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Chandan
 Uddaraju <chandanu@codeaurora.org>,
        Jeykumar Sankaran
	<jsanka@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sravanthi
 Kollukuduru <skolluku@codeaurora.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Archit
 Taneja <architt@codeaurora.org>,
        Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        Simona
 Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zXLXDKTfDb3vlXNcKAHuFHDyduKdn0d-
X-Proofpoint-ORIG-GUID: zXLXDKTfDb3vlXNcKAHuFHDyduKdn0d-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=959 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090042



On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
> insternally. Document that corresponding restrictions also apply to the

insternally ---> internally


> drivers that call the former function (as it's easy to miss the
> documentation for the latter function).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

With that typo fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

