Return-Path: <linux-arm-msm+bounces-53591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B7A815D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 21:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F60E4486A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8042228CA9;
	Tue,  8 Apr 2025 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WGPGkH6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DBD81724;
	Tue,  8 Apr 2025 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744140870; cv=none; b=FH+FvqsARaExb6aHAfPbRbZXQT2ReSQL8hQpMiOtoMBccILh/Ro0TSmnoirVVdDqQOZ1wDDM7wCOyjQmfyuO32Vt+0n9trwTUYZqs+yobvWO9B6iulo0NfERxj+kz5pYxB8BwaMj63/Ma5+9fuz1sgQWhpXs87S18/vygnra6fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744140870; c=relaxed/simple;
	bh=bpcsBsHRLW3VwUyMghuuU4KP4TycivghBNNsajHA5so=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fRsGSJmw1XRyXXLraLqEVoaE1o0KV/3gjLYPOObZlDJs1pgOS7/sfD/+qA5MswoLQN5IQhSy3X/vpLzV1T5RxJhJZD7xYrUMdgZhj7QsnzNyvNekFJ7j+qaRfCfPsQeyYPDgzjYlqVc97ovhB//nJDoNKPPaFvXSACbh4UzQfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WGPGkH6C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BAGM4010519;
	Tue, 8 Apr 2025 19:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VL7q91o6FR7oPvgeinC1X8JMVKRKNN9Pdq9HEM1vdxY=; b=WGPGkH6CMr3goDTB
	zPVeDn1f0VUPQRQYS2/YuI6D8sE/MfwiYmjJEdkYj6vgo7SQICga/mZ7XSIaQE0K
	79l+6MFF+p2mrehH9xmPTmJ7LtWc6blAuoiwdQK3m+xeD1cxjAdMv9nT+5onjcF4
	dE1d3hW6iT2SzP9b1p4vtLY3Xw1Z/Qy59Vu3WssTMQ6Vye5GIpmKYrOu47jJEMtK
	1PGqDm3NExEnmRwgy0IjikiL4I8Ac5SJM5cNrZqfowz0TYlC6StmTvAzxEClTqo3
	9D8OhEiouIHeiEXS2Ml5XLSbrquB99bI0FxUIuXGe8b38quAo2qJX2LWbPOO9lsL
	36je6w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1gvkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 19:34:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538JYG6B024672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 19:34:16 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 12:34:15 -0700
Message-ID: <aba8d029-ab07-4658-8c0c-9d34f9b96a57@quicinc.com>
Date: Tue, 8 Apr 2025 12:34:15 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop rogue intr_tear_rd_ptr values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250408-dpu-drop-intr-rd-ptr-v1-1-eeac337d88f8@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250408-dpu-drop-intr-rd-ptr-v1-1-eeac337d88f8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dOfzny-QGE5A745hjZ8aeaRywy76FbEl
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f57a39 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TOPhAd9lG1w4F-i_91MA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dOfzny-QGE5A745hjZ8aeaRywy76FbEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_08,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080135



On 4/8/2025 6:02 AM, Dmitry Baryshkov wrote:
> The commit 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1") shifted
> IRQ indices by 1, making 'NO_IRQ' to be 0 rather than -1 (and allowing
> to skip the definition if the IRQ is not present).
> Several platform files were sketched before that commit, but got applied
> afterwards. As such, they inherited historical (and currently incorrect)
> setting of .intr_tear_rd_ptr = -1 for 'NO_IRQ' value.
> 
> Drop that setting for all the affected platforms.
> 
> Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
> Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 2 --
>   6 files changed, 15 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

