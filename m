Return-Path: <linux-arm-msm+bounces-44221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44BA04D97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 00:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26EB77A123A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 23:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ECA1E47CD;
	Tue,  7 Jan 2025 23:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I29Us611"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A413B58A;
	Tue,  7 Jan 2025 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292860; cv=none; b=R91nnYA5pdC8IfJY1iEYGhvHpqsuSVv+bIQ8RDWcJ169yPyKuApoHFojAB4dmvwzngo0pIDGl+XWQ6JZhva0RDXmxaNXjT7NL9QA4rldO6AsillGH5ZATpUP4Z9yFAikIrkN+71jUqW0PlEjs20bdsv2pNP9SxUVjT0Yr8CYBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292860; c=relaxed/simple;
	bh=GCRjcxTCzGPXa+d1UIV6GZy0rqCom/+P7CYDoR2ZVAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KcFJUcyKJ4qbQjEKj/dNzcEQQXP/uPLGkfUs6dLFr+PMsX9AaGnI3vDuM85S2ePe9VtaksOK+VuwIvN4PFJxp2xR1ZYRdXIcc1lTYeJC/TTHDyly2sf8AGJtSAskf8T4O1m3cTku4kRgioVjIXlcbomdhDE/UEQMjkLTh6BlQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I29Us611; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K5dpU019359;
	Tue, 7 Jan 2025 23:34:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZV2WvaosqvNTvNwnNabU1m0lRfKb5VsG/yDAMncvhgU=; b=I29Us611q4hBHrnh
	dbumm/qQ3hufM76WZ+FpV7Ag3o/VeQP9d17G81JWDAw9xsKZIRXQ1qeEGWKAleie
	6YObqajKArLPvyYvNhRy46AFlxP6oUNnM/ywHATwvMjcBCuJ2xDhtVRlveqNDDAl
	bFpCA4ANJ1GJjIb+Anmp5U2W6gcAk79HUM/a4NHrlYEWxcVjnENbca9S3lpmeLMr
	W6WiRqSJp59+E5kmHI2LZ7fGPOKEQd6Dp8UsFCpZhCV4C76KGanxAq19Qz7morec
	TAjMT16y9q/yRX4AHdSIuT6j2jZT+eiIB64+xvYrKn5QQo6ciMJxlDvLfKT8ybrV
	XWjK4g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b0k0bud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 23:34:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507NYAYI005276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 23:34:10 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 15:34:10 -0800
Message-ID: <6d149872-7c3e-4bcc-b2ed-39ecb8faaaee@quicinc.com>
Date: Tue, 7 Jan 2025 15:34:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dpu: enable CDM_0 for all DPUs which are
 known to have it
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <20241224-dpu-add-cdm-v1-2-7aabfcb58246@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241224-dpu-add-cdm-v1-2-7aabfcb58246@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5qlhUgRpjZ3y4tEhlt8EjGLz9IIsbIp1
X-Proofpoint-GUID: 5qlhUgRpjZ3y4tEhlt8EjGLz9IIsbIp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070193



On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> Enable the CDM_0 block on all DPU generations which have the CDM block
> documented in the vendor dtsi file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>   20 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..581c9bb4b193280fd6b7c8cc4e3ef8b2e9e95dfb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -431,6 +431,7 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
>   	.mdss_ver = &sm8650_mdss_ver,
>   	.caps = &sm8650_dpu_caps,
>   	.mdp = &sm8650_mdp,
> +	.cdm = &dpu_cdm_0,
>   	.ctl_count = ARRAY_SIZE(sm8650_ctl),
>   	.ctl = sm8650_ctl,
>   	.sspp_count = ARRAY_SIZE(sm8650_sspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..f6ee09a148c214bce7bae2c7df868d95c4cf9833 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> @@ -190,6 +190,7 @@ const struct dpu_mdss_cfg dpu_msm8937_cfg = {
>   	.mdss_ver = &msm8937_mdss_ver,
>   	.caps = &msm8937_dpu_caps,
>   	.mdp = msm8937_mdp,
> +	.cdm = &dpu_cdm_0,
>   	.ctl_count = ARRAY_SIZE(msm8937_ctl),
>   	.ctl = msm8937_ctl,
>   	.sspp_count = ARRAY_SIZE(msm8937_sspp),

This is not correct. the CDM block on msm8937 goes only upto length 
0x224 and not 0x228.

On these chipsets, the CDM block only goes till 0x224 and not 0x228:

1) msm8937
2) msm8917
3) msm8953
4) msm8996
5) msm8998
6) sdm660
7) sdm630
8) sdm845
9) sdm670

On the rest of the chipsets on this patch it goes till 0x228. So we will 
need two entries in the catalog, maybe cdm_with_input_mux and just cdm 
as the last register is cdm_mux.

