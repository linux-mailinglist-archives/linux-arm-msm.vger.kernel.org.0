Return-Path: <linux-arm-msm+bounces-26062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAB930109
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 21:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7242B2816A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 19:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFAB2E639;
	Fri, 12 Jul 2024 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cyzf2Lfl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD21B95B
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720813318; cv=none; b=OE0ygZsgw3QgHOK0iXrraqHniC5lSLQ2OCNGZRgn6+U+KM8QnnaaCzpWQ2GKYNDNSSRn6weSuGemf6ts1Hap5wevX5sYDXvt6Uo3LjtqtlhVT2Ye4eArFkEMhbhA+gcp8KKDlURjVCMP9wqxcNPPTVvauj2sqoZugnAyxGBe1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720813318; c=relaxed/simple;
	bh=xR6Yu+ORhT5HVKtcyevwTwo7Z4xVis6f8my/og9gdXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G/8QD+AgLodQjX53zcFC6Ql7qK8Q702dd4M/tKBuJqw6dLlek6fZxajAqqSdHYVWUz+v+R4pRHETS8R7NUaBXrNaPdfcpqYoJ8G5Kz/NQxM9hpCim6ILoYTmEZNMPAPyBOUlNF9HUYQ+GoA5o+ujerIN7Q3Vt7kqmcTjqLGo6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cyzf2Lfl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46CElDrr011328;
	Fri, 12 Jul 2024 19:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baE8i7pARAxYcamzN94NHPlZGHG1Zp9rynjE3EHptVA=; b=cyzf2LflxjvxB0sk
	rbI2W/2XcqJWjEBa263OyQH8Dy121cTBj5GVsTtGFP3V3z5/14BuHfV/jpbeGZce
	2rA0PwVFHef9qvicNqYlxg8LhuuE5lr5AGu2XEvptdefEorBbC8LpASEx1B2FKB9
	sdU+ZnHv5/ksyoils0aYvYD7YBIyq+mxzO2l22/ciCzJbi00DSS1mVVW7xa6MZ9x
	GFE39EkUtVgjj1ZBjNctruyCaqu30+G0HJJ6NPyQZ7WXEn9H6N2rXk2IVtYqiT82
	ecPLJVSGHS+nzl+wQkcIRrpDMR96Ausn1lrUbZ6wpGad6IgzakDxfuDIwYuoY7os
	NLN8zg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409vydxfu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 19:41:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46CJfexY019384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jul 2024 19:41:40 GMT
Received: from [10.110.71.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Jul
 2024 12:41:39 -0700
Message-ID: <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
Date: Fri, 12 Jul 2024 12:41:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s__-81isLV6_NsbLVjyc0cFuWkXftT9H
X-Proofpoint-ORIG-GUID: s__-81isLV6_NsbLVjyc0cFuWkXftT9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_15,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120133



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> zero-init of the hw_ctl array, but didn't change the error condition,
> that checked for hw_ctl[i] being NULL. Use indices check instead.
> 
> Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5d205e09cf45..7613005fbfea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1186,7 +1186,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   			return;
>   		}
>   
> -		if (!hw_ctl[i]) {
> +		if (i >= num_ctl) {

This is not very clear to me.

How will we hit this condition? I dont see i going beyond 1 in this loop 
and neither should num_ctl

Will it be just easier to bring back the NULL assignment at the top?

struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };

I also see the same issue for other blocks such as hw_dsc, hw_lm

>   			DPU_ERROR_ENC(dpu_enc,
>   				"no ctl block assigned at idx: %d\n", i);
>   			return;
> 

