Return-Path: <linux-arm-msm+bounces-49099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC895A4139B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 03:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD6516B987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 02:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0140570824;
	Mon, 24 Feb 2025 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dSOGDKsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF84A08;
	Mon, 24 Feb 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740364718; cv=none; b=FSj85AUWn42ypwkJFw0W0PPtT+QVXUZYFe9Re05S3VnABhb4pdq4i+7sl2/Slp5fvt3IJ05QsozlzhgbDFdmY8ihZGnOo+JuX3/2y5Xyr3T+AK3z/xUQfec0S2cALNTr3jCLQNLuUuhgR3uIuJ+R6GUUMdafR+9k+9ZBX1rVN1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740364718; c=relaxed/simple;
	bh=/vaFWj80FVLhkoGXptX6sU1HQvKQS50rBWzmE1JXBCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cUofvBUm8wwRhI7z+w2yXq1OfVY08Pr1KSy6tVuH1e3ZbtWfTKmGdUR7DVPVSgnMprrI1lm++WLXUgROlemFpVbf0uTAGcM9HQPkD43g1itOEnNknVMbcQgicYYmjw31mOP8wb+PZrWIpV+y715fqStnlAt5kEOV+q+e/0LvsNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dSOGDKsT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNMDtL012614;
	Mon, 24 Feb 2025 02:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Osq8xY3ooJBEifl0yuKkDmmpnbJU3Nhe8moxQ/1zJgg=; b=dSOGDKsTNDXmhhPT
	PD+qou2Wcj5fO64zPls8UuimYwLET3B3o17PgqlCFOv1N9q/C3FUCV+gLBXC3veu
	0yn9d+Rl+QRV88jL3wpem/7Zubj/TQpwsNRcrbQrZrSMzlJ2GLI3UXjaf3sFssFw
	uuTJh3SKeNwYzzvQ+kq0WQPxUUgptSwEGB07dYKvL3WKu9i3MSmxgXda92Ibjagx
	amfEaTtgK2LpN+noyxGXigTjgfCGaATBxy6W8mDn6HH90dmjEawFvFT7yq6z2hMi
	aEouRNaPW8clG8zVJ9rJtNYFA8bEYsW5jBxth5WBm9cGtrlkub2b8P0oy7BhNAwk
	y4D0PQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49ebek8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:38:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O2cU9V010698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 02:38:30 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 18:38:29 -0800
Message-ID: <2d79ba58-5c15-4cc6-8e8a-fdf53e1e0fd4@quicinc.com>
Date: Sun, 23 Feb 2025 18:38:28 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
 <20250220-dpu-add-cdm-v2-3-77f5f0df3d9a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250220-dpu-add-cdm-v2-3-77f5f0df3d9a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Mnqim49cWXSvJdpGXyWv5Crl4Q2MdqPk
X-Proofpoint-GUID: Mnqim49cWXSvJdpGXyWv5Crl4Q2MdqPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=875 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240018



On 2/19/2025 7:59 PM, Dmitry Baryshkov wrote:
> Enable the CDM_0 block on DPU versions 1.x - 4.x as
> documented in the vendor dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 7 +++++++
>   10 files changed, 16 insertions(+)
> 

I think dpu_cdm_no_mux would have been more accurate, but this is okay

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

