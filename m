Return-Path: <linux-arm-msm+bounces-47819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE5BA330BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A77168295
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4BC202C22;
	Wed, 12 Feb 2025 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UWtU8N/3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0A202C25;
	Wed, 12 Feb 2025 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391822; cv=none; b=Eqy6LevKFrfYAfcDYV4dPUwljMahkIuVwmKMrnYA823iPgjb9WjjkyLZu8pbF06wb08q2QABUReQ6RTFLxdr8Mx9GcYX5lwp6qvkhiv6byZV1R6bOStJOtJD1YC/5K9gxAfsm729QPmrs1e5Dllf84OhZJdYW0t+vG3d/LbFQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391822; c=relaxed/simple;
	bh=dFmFzf5x2hcX0BE4LB5gHThxnXRidZAv02/0Gvl/FEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LyBx9kvHca2nDEO8sAbRCd6uj3YopZnv7J0mmIlKycg86PaygukdZ+9iszmeizYx2fy9lwoMc/f19FbEDK/QkFmi0b3+LjyZBlPSnBtteXzW+PsXW95ZExvVDQfjS6jqQCfqbjJhLmdqvQ9gE6UirY4k1W6BQBboqXrAWL5dJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UWtU8N/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CAmimr011665;
	Wed, 12 Feb 2025 20:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+shayb7qRrOI+CksDG+eimPv5mTP0U44AV7gSRSwDk=; b=UWtU8N/3Be3D9VUd
	61aUJWHaTSO+kQ/2q/YC0JiQUdYVOktES0mC7iy/9xykdOddnhwl4ktPiDh+kH7u
	l1tpQRawp3hk/mNUUUZYaqFwbC6600l4W7T+zUUN1Smfm8oSO77lJ8++fS/zg2O1
	9LMHQHknJf1iVUU+B80vUeeNBoXU7jgLP987PgHMzOhxE7kAuJfs6uKBuLHaiXH/
	jSW2woYoPL723moj7e81kn+4yEKvvTTYqR5MfwMKgk+vJYVMygL1XLjQnT7BK4J9
	y4lZEXfOeGiJlJP0zf01v2TsLXR4EuF+D/ylmyVjlSor6Pc3EEgDNWt1N6ZuQQTX
	UESoHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3x0yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 20:23:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CKNWTx003483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 20:23:32 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 12:23:30 -0800
Message-ID: <3606b749-a476-4c52-9f8b-5e4b465c5e79@quicinc.com>
Date: Wed, 12 Feb 2025 12:23:29 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Disable dither in phys encoder cleanup
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250211-dither-disable-v1-1-ac2cb455f6b9@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3tecjAmcdAuLWE6NSjUuGh-6YoV560Ru
X-Proofpoint-ORIG-GUID: 3tecjAmcdAuLWE6NSjUuGh-6YoV560Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=964
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120145



On 2/11/2025 7:59 PM, Jessica Zhang wrote:
> Disable pingpong dither in dpu_encoder_helper_phys_cleanup().
> 
> This avoids the issue where an encoder unknowingly uses dither after
> reserving a pingpong block that was previously bound to an encoder that
> had enabled dither.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Closes: https://lore.kernel.org/all/jr7zbj5w7iq4apg3gofuvcwf4r2swzqjk7sshwcdjll4mn6ctt@l2n3qfpujg3q/
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> This was tested on SC7180 Trogdor by pulling in the concurrent writeback
> series [1] and running the IGT kms_writeback@writeback_check_output
> subtest.
> 
> [1] https://patchwork.freedesktop.org/series/144083/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
>   1 file changed, 3 insertions(+)
> 

Was an extremely tricky issue to debug.

Glad this one is resolved,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

