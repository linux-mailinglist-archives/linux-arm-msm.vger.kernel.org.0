Return-Path: <linux-arm-msm+bounces-36345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F99B549A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 22:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3F581C22606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6291D1917E6;
	Tue, 29 Oct 2024 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="doEVh31d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC057C9F;
	Tue, 29 Oct 2024 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730235661; cv=none; b=TAgTz94xGiNzXv8ydLE4h54PLt+xseiAqk7tytn7mq3vloD8+6l6LBYV1s4jug5xCVGXZU7isPU8tZO3AdQKYgUZlbVHg1qUYllNmrCkdhhTWWj2q6Mskn2ctkeFiGuQSnnoJLq+q8lhsI86uvweO4aeWefg6nqmCQyhkSJeWds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730235661; c=relaxed/simple;
	bh=gZM2sai99kzSW0wBJXo/cr2FOJYRZ/NYJBC1V8aih9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NpC5nSjzicH9U16obAE+FwVU6VcFHcZIhWBgQCY9EkHCRFYvau0NDGyM2+VbjJVYgZBWVGCfBxPaC0MuNxS7mDlpr/3PjFuyEBvlfH2vYvPBPYEyh+WsaMAPOtq7yX/8atIIclzVDyjMwi0UN0XrCeZCNV+DUBRXWUfeTrTPrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=doEVh31d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TKgIDL024838;
	Tue, 29 Oct 2024 21:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GS2nJ5D8tlo393fykSnwYGwKmzi6IPtZcQnXSIp+6qE=; b=doEVh31dN1Ym27fz
	dg8F75P35uktjcYO6XsO1ZBOkiNPVNbW+2Wic5sBTIUa1ynVCjDic2d5KfTnKHOd
	mUcpAjXOS8FR03FjOc9BrToA8OnFNQKtNd0Ny0oBsCEO8+ZZ/r5toCG+5Pj9YjPf
	zAjQaTefrFbyI93aa0FWlfeMMZ45j6dveZ/A6EPPZFPpqLb4BMHxZIxijrve4jWA
	BJn5PPR7IaYPahi3ttO02AJE0M3C3H/T1cSD4Y9vOwtSVanZ9aRw7j6lwFTGPZuk
	7am2wFW9forD5+GuE0dChj8+GnCxVMu6iq4Danw0vHecr33KPMuf78qScWylc0fm
	LhG9BQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguhrvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 21:00:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TL0nWr024315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 21:00:49 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 14:00:47 -0700
Message-ID: <f9a6762b-f7f1-402e-b9a0-3e31b60b1a83@quicinc.com>
Date: Tue, 29 Oct 2024 14:00:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] drm/msm/dpu: move rot90 checking to
 dpu_plane_atomic_check_sspp()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-6-0310fd519765@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241025-dpu-virtual-wide-v6-6-0310fd519765@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nZFp9OW4gW_K9zOSklZh0qI__3LoWGE9
X-Proofpoint-GUID: nZFp9OW4gW_K9zOSklZh0qI__3LoWGE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=749 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290158



On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> Move a call to dpu_plane_check_inline_rotation() to the
> dpu_plane_atomic_check_sspp() function, so that the rot90 constraints
> are checked for both SSPP blocks. Also move rotation field from struct
> dpu_plane_state to struct dpu_sw_pipe_cfg.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++++++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 --
>   3 files changed, 31 insertions(+), 28 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

