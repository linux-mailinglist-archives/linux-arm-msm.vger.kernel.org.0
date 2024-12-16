Return-Path: <linux-arm-msm+bounces-42394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7799F3C8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D1F1883087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8411B1D131E;
	Mon, 16 Dec 2024 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2qzFn5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308D1D0F61;
	Mon, 16 Dec 2024 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383513; cv=none; b=o8LX41tix5y0H8uXVvoSD9WVFNIvHnpiraARyDMG/yxdZHyqNRP4FRmNMHMnjavX/q6t+nezi1u1GI/lRETr5o5/0JIv93gMECczPrfw90wQ9LZfQNz7XU4Z7azyWuR6PSDSeTn6y2288oS+0T909/H0AmHwoW5i7Q2eoKC0aPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383513; c=relaxed/simple;
	bh=RhN2PrCBrj10EEwCH8X4NwaJS0QujL1dEwADSZ8UAFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qPMYo0bCw3rAdUkZ0P+/8vOLgUArAV1BrYfRBru4O/Ow2G5IR/XJPo2ihu5GbyLYdtgWDP0xW0r6ydu/EvSGv/sWRxk8QsDpzrA+1DJqEQDyT5v0JD+u30CxtuIzVTugN6BVjDZ6uVl8dCxzogqg9cll8zgytD8r8d7JOUZIURs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2qzFn5g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKM9xi030386;
	Mon, 16 Dec 2024 21:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNjGgAqGXlNmhe5qrVq4WK9DY381IBX6xhcAAUzOYPY=; b=Q2qzFn5g49K1pYO8
	Q0qYigwdc+tF5BAgbd/MRE+38rycj6Wx+nd8L8UxTZiYgk+vcchVGhymy3RwGrXM
	7AaOhcrK3Ey93gHUyZq732WaJpDmtODZ9HMPBWo8b0BrgCvcKm1UNe4CU/9jz2iI
	10nqeUCSIZqFj36Y/mq9YB0sVRGf9frh1h7P1tPgaesit8YDqirEEkBR85DOp9rh
	mIgpmdcL5ZpXAlnX/iqdZu1X1wHmjzSCkumESe+JU1znlYv47oyfd1+KGqn0n76d
	xDNfiZuEbGOAsS42iLOTH735jfypPZEHWSXL+MSvJQVLfVgZ+FbxC6FCfznhMm6s
	kWm08g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ju61r3bu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 21:11:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGLBelK023925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 21:11:40 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 13:11:36 -0800
Message-ID: <d6be6564-ce24-4a27-a014-45aa9ff28d24@quicinc.com>
Date: Mon, 16 Dec 2024 13:11:35 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Richard Acayan
	<mailingradian@gmail.com>
CC: Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: i21IZFNvATVl5g0kxaN2T_PTciKfGhC5
X-Proofpoint-ORIG-GUID: i21IZFNvATVl5g0kxaN2T_PTciKfGhC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160174



On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
>   1 file changed, 2 insertions(+)
> 

Change looks fine

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One question below (not tied to the change but arose due to it):

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_3,
>   		.pingpong = PINGPONG_2,
> +		.dspp = DSPP_2,
>   	}, {
>   		.name = "lm_3", .id = LM_3,
>   		.base = 0x47000, .len = 0x320,
> @@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.lm_pair = LM_2,
>   		.pingpong = PINGPONG_3,
> +		.dspp = DSPP_3,
>   	}, {
>   		.name = "lm_4", .id = LM_4,
>   		.base = 0x48000, .len = 0x320,
> 

the consumer of .dspp seems to be in the RM code which is used to map 
the DSPP to encoder_id but is there really any case where lm_id != 
dspp_id ... I guess I am missing the context of why DSPP id needs to be 
tracked as LMs and DSPPs go together. Let me also check this part 
internally.

