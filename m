Return-Path: <linux-arm-msm+bounces-10358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF984FBEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 19:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C8C41C22C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 18:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B2B53398;
	Fri,  9 Feb 2024 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OJiGkqzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0E44C75
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707503666; cv=none; b=BlGl8lGOqcpHKCf0gYISwVtoQ6RFmIYHCW0iz9BblxqriCFZAvZV5vj3yvZtra6W5NBkZA70k5KhVBQfAbKHUzpmo4r7J3jH3O5kYZAT3xHbCxHop4a+xd6490TO7yPR/cyYvBxW1+OwqSsUkZjRskrg3hVjsvoOFMsTJmyqCfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707503666; c=relaxed/simple;
	bh=S6m3vL6QyXZsDjDbZr7SYaadL67hmjMcaurDmZvXreQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uXpTu218r+PsZNuOMZfKgvZWiuTMW62J83JyiSw+9jV0bKz7WJ/WMJVAnSCpI3sW25j91eHBuPA9fjTVFr8DLUSZU/h1Y6ZmtlhiZ4lKsRE9gLwajF49NoW7YybRdMzhqOWaUsQpzCpWJ3VbCOZl3FuroQIttMfY9PDhc4YJp3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OJiGkqzI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 419IUA2R003482;
	Fri, 9 Feb 2024 18:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S6m3vL6QyXZsDjDbZr7SYaadL67hmjMcaurDmZvXreQ=; b=OJ
	iGkqzI8gUuaoLbqOBpFt7ZGOQhG3mAS3DiFKr5PrRK721CXs4xHwmZiuZRZfLEJA
	EDdxdzRIj8qOLdMRXCv0oPNKGQTsSaanZDtVFsApRihCHtRxQ8lPrqJEIqX0pyZP
	80/mN+yU4fSE4ts/En4tXLGqhVA7kL6QZ6aXD/9HGHnjk4v1s/RQmNPmuLLA/EfF
	Darz0wZg5psnqHB+Ol502MiNLscqBozp2TAGbEhOFb9EYXannXlmLhTEifKAi36+
	OTfM5JVPrzqFlwffBE1+Wd6rQTQKmH9reUHUY1QrB9OBsTjPPtIPBaQguPGT5Qki
	/QJVuPNw3gct3ijFWODQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4rk84s0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Feb 2024 18:34:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 419IYDG4029053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Feb 2024 18:34:13 GMT
Received: from [10.110.105.190] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 9 Feb
 2024 10:34:12 -0800
Message-ID: <047c2ca6-ef4a-a912-3d17-df56e5bd4657@quicinc.com>
Date: Fri, 9 Feb 2024 10:34:12 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/5] drm/msm/dpu: drop
 dpu_encoder_phys_ops::atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
 <20240208-fd_remove_phys_ops_atomic_mode_set-v4-5-caf5dcd125c0@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-5-caf5dcd125c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GN-IVNZU2GDXl6XZCGsBjpOJDx2XKp-7
X-Proofpoint-ORIG-GUID: GN-IVNZU2GDXl6XZCGsBjpOJDx2XKp-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_16,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=701 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090135


On 2/8/2024 7:20 AM, Dmitry Baryshkov wrote:
> Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
> callback. As the code was moved to the dpu_writeback.c, the callback
> becomes unused. Drop it now.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Tested-by: Paloma Arellano <quic_parellan@quicinc.com>



