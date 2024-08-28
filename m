Return-Path: <linux-arm-msm+bounces-29824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF2D9630AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 21:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B061C209CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF691AAE38;
	Wed, 28 Aug 2024 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BGYa2eY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95CB1D696;
	Wed, 28 Aug 2024 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724871962; cv=none; b=eMBAmcy1k6s83YjL6qWtPwWY0Vne6ThOvLYhYQIRAShtlerhlviv6Kb87L0ImU6WDjL+FZYdiGIiGbc40Kjf0MoBlm4od/bS4H2OmYM+apxIUxPDNDVOS4BwchJkSTJQfBzwFDkz2Ik7PLVE7tUkM3RuFF0nNsx67Zcj2L3xGz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724871962; c=relaxed/simple;
	bh=WIGu1B/KmUqc/AyzVGZa/YXfLgKK8Ua7FeXDD0qUCRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yms1I2O9tHNGkf+FsGSbv/zWluJ7ZBEI9l6U9Q2GP/R+sZqcs3FO2uw1Sf+LhEyj8Z24DjNLNnbwWb1yJgC72qUMaCoXBs+PWK8aeqEkzFkBWx1SszA6SdD0J5EBrAo2Uo4ZXJBVi38WI7Jwsj/nJThxeNsR1L9G4nxGcHjTEg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BGYa2eY5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SASNPD021184;
	Wed, 28 Aug 2024 19:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXRSvSMMkwRqcUafuFtdx+oe3Nm8qnjHeghnKWRDz3E=; b=BGYa2eY5lnL9kjVh
	knuCVCL1Cb6O4cYP6+vpsa2dZIQUL3ftqI4Xyh57pAX02Mfg4GBxVwSGg9cPh8Ro
	gWnEOdOflo5yYuEgW50bwRpfx38FNjnnt0d0O/xWkugrIRW+d3xkHfqPna4Hni4A
	Mrn6ruWnfbjsGV5xVnEaSz7up6jyxu24C2lDtu/2F5zsJ8nN+HgY3yK4V2iqsbxx
	1XGd+T5in0RbZ046jIhvq2urz2RI+a62IIq/0VB/84/zIydbCfzIygyrY1/EgMh7
	+NZVOxeEFedSosovDssIXQbS7d+jj6RJqiFSMJ3vr7zZB90JtpHRdO/kiVUx/ZJq
	P8bZmQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0jw2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:05:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SJ5rKt000580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 19:05:53 GMT
Received: from [10.71.111.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 12:05:53 -0700
Message-ID: <1bb90821-bc6f-4828-b947-d3123a035c60@quicinc.com>
Date: Wed, 28 Aug 2024 12:05:52 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_pipe()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-9-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VE-p-2ICdAmxAzgtrWPeMF090e-TN2pi
X-Proofpoint-ORIG-GUID: VE-p-2ICdAmxAzgtrWPeMF090e-TN2pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=997 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280139



On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> Move a call to dpu_plane_check_inline_rotation() to the
> dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
> are checked for both pipes. Also move rotation field from struct
> dpu_plane_state to struct dpu_sw_pipe_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 

Change LGTM and addresses one of the questions I had in the prev patch.

One question though, till patch 11 which adds support for 2 different 
SSPPs for the plane this change is not necessary right? Because till 
that change we assign the same SSPP OR two rectangles of the same SSPP 
so we dont need a per pipe_cfg check till then because both the 
pipe_cfgs point to the same SSPP.

What is your thought on squashing this with patch 11 because from a 
logical split PoV, this change is meaningful only after that.

