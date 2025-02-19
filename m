Return-Path: <linux-arm-msm+bounces-48569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D4A3CB43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0CC3A9D44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5B7257421;
	Wed, 19 Feb 2025 21:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KkrbaubE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5124FC0D;
	Wed, 19 Feb 2025 21:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999990; cv=none; b=WIkDJsUoKbzfGPOjSTGtkLEIoqTgP6uK2mWqD/lh94cJLkIiv6WhnLt2Z8g7OVjv/YmA0Oq0GK9vj8c2J4jBa7Rwmu5s9TT4usJfrQAxGhvkkJKXSK9eQNHIFCxcuJ1woKOnHlxV9X+pLsVMETnD/ns9fYQKWuen7i+7Gu/VtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999990; c=relaxed/simple;
	bh=75ui6nl2Lj23eOogl749Qaa1rMyP3cwXE5XVvyryc5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S+AkaLrSExAo3V9AEUFXv+YssVSqXaaeCgxLW2oGfAbXephz3mOX2RCkpzDd3Wm5E/r8yqSLJ7XhyjslBCRI0uTkXwJ6qVUy9ju8e7L5QPRBOMw05VN2nMInhjddA0wcvN8+/gaVmSn9jG1XUD6NrWdy7RcFZRdPk6WR/zOT5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KkrbaubE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGg3jo012227;
	Wed, 19 Feb 2025 21:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oCfFGa51JBGORxzIi2TNJZ+UytYNtHDQbFeh3ASuv0=; b=KkrbaubEHHexQUlo
	SN5yiPG+T86xnbPKUCcFSNgewhWNH/msSJVJU5mPuKl6CSEcgnurbvshoa9u+mU2
	7FCo4xCkqp9iasCgcUXNr+xGWr+iWLFwCLkCPZfj3oJ3xBKt8U59x3er+18jOGwz
	7xdXKLHPN5nVTpuAj9A3sqQxE718y/WSuOnDMGCIQO0V57nE4oGDsZVcLUFWm2PF
	Fu6mH4X5ZbpgbARnYJsM7XY5G39geemKEQgxLeP/cPSfCoIWLZuU/zTPwnGX2QqF
	dJbV5HKkd7bUFTp/DEZRWT4HyMfeqxwA+eHdAUUvTm8eaPy5ObLn9Nh2/0z/cJJ6
	mgNIvw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1m0ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:19:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JLJQ4i019756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 21:19:26 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 13:19:25 -0800
Message-ID: <987f0dae-be8e-4818-b69b-dde03134d440@quicinc.com>
Date: Wed, 19 Feb 2025 13:19:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: Drop useless comments
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek
	<jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Srini Kandagatla
	<srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250217-b4-sm8750-display-v2-8-d201dcdda6a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k-Yxar1IVXQjraktZ64UKNHG2hCZZXEx
X-Proofpoint-ORIG-GUID: k-Yxar1IVXQjraktZ64UKNHG2hCZZXEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190160



On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> Drop comments about SoC before each 'struct dpu_lm_sub_blks' for given
> SoC because it's duplicating the actual name of structure.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7ea424d7c1b75e06312692225f4e888e81621283..4ff29be965c39b29cf7e3b9761634b7f39ca97b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -362,8 +362,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
>    * MIXER sub blocks config
>    *************************************************************/
>   
> -/* MSM8998 */
> -
>   static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>   	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.maxblendstages = 7, /* excluding base layer */
> @@ -373,8 +371,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>   	},
>   };
>   
> -/* SDM845 */
> -
>   static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>   	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.maxblendstages = 11, /* excluding base layer */
> @@ -384,8 +380,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
>   	},
>   };
>   
> -/* SC7180 */
> -
>   static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>   	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>   	.maxblendstages = 7, /* excluding base layer */
> @@ -394,8 +388,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
>   	},
>   };
>   
> -/* QCM2290 */
> -
>   static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>   	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
>   	.maxblendstages = 4, /* excluding base layer */
> 
> -- 
> 2.43.0
> 


