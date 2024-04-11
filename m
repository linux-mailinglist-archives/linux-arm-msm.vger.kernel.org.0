Return-Path: <linux-arm-msm+bounces-17284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498A8A1F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 21:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1D7289830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 19:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C7A12E5D;
	Thu, 11 Apr 2024 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8EVJYsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426E912E7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 19:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712862938; cv=none; b=tulvBrrCr3yQTsesnJXqvSReIm7yR9L1W8Z3l34h6Uz6kbrDqbEMoNP9aFlgjWqhq3mRfOBiMirfCxxDmAkNVopEj5Kehk1LeQvuT+QONgAVVhnfx6NCynB3M0/LLin8HNp691n571muNNp7GAzZACCdI9dbKeLd72HEhxhchGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712862938; c=relaxed/simple;
	bh=//gbCcqdyQa2JDiDdLBR2VARKZHsMKRjvUy/djMfi2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tam76BUQBUA6SzuPsUWelAyN6TOD3GRTaxkQNVRwc92paekgtOu+QkqoRun27XPVeR3lrdEFrt6gb0wWW/wM1NFXHuMRGe2jHaZ2HV+rsaoBCD8EVxnGcP2sZUAZHCGyB6bKrLfhkGiHcprwizs85hANvL0INwoy8Ab16IJ12KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8EVJYsH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43BCQM8V021068;
	Thu, 11 Apr 2024 19:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9eshpJjk3UKmFunENSmec0N439eYk7Xaf/C8tL4hnAM=; b=h8
	EVJYsH3ksUDFyhyzrzT44DDJmi+qysuiU5c51NeU5Vt72Q8WV/X7G75yQ+lq/Aer
	GQRQNwlbi91fAzM1egzGSkpSVgsNs4GVvEZPCo0F5dj0EoVk0mpDxGLwEIDi3Ljc
	0bzGuyw/e6vVBKmG/M45gMNvzxIMHsUzgR6yUTFj08AUqF7p1aoQF8DytgylXHSL
	2PqpsdWHUOR88++cpBvvRUzJcHWIHdfSanfs7BSpChdWA6twqN71yb0b3EBX539B
	MTNqy8qlVN4WqVc1MAdSf6KPTxLZzg46kxxeNAz5Ct4FleW+zryTSbwlN0jpX5SW
	E4ZvfnYi68p4Q3EPz45Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe5ehuqd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 19:15:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BJFQ4m007776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 19:15:26 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 12:15:25 -0700
Message-ID: <1e7706ab-d2f4-baf9-90c7-f5a81959920f@quicinc.com>
Date: Thu, 11 Apr 2024 12:15:25 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/12] drm/msm: merge dpu_format and mdp_format in struct
 msm_format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bgbiv4zxWVLT05nkfG2HAsiSuvaHbHxi
X-Proofpoint-ORIG-GUID: Bgbiv4zxWVLT05nkfG2HAsiSuvaHbHxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110141



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Structures dpu_format and mdp_format are largely the same structures.
> In order to remove duplication between format databases, merge these two
> stucture definitions into the global struct msm_format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  12 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   2 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 184 ++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  10 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  41 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  30 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  14 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  16 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  74 +++----
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   4 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  26 +--
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   7 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  54 ++---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   4 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |   2 +-
>   drivers/gpu/drm/msm/disp/mdp_format.c         |  28 ++-
>   drivers/gpu/drm/msm/disp/mdp_kms.h            |  13 --
>   drivers/gpu/drm/msm/msm_drv.h                 |  28 +++
>   24 files changed, 279 insertions(+), 288 deletions(-)
> 

<snip>

>   int mdp5_smp_assign(struct mdp5_smp *smp, struct mdp5_smp_state *state,
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 30919641c813..5fc55f41e74f 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -63,26 +63,24 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   };
>   
>   #define FMT(name, a, r, g, b, e0, e1, e2, e3, alpha, tight, c, cnt, fp, cs, yuv) { \
> -		.base = {                                        \
> -			.pixel_format = DRM_FORMAT_ ## name,     \
> -			.flags = yuv ? MSM_FORMAT_FLAG_YUV : 0,  \
> -		},                                               \
> +		.pixel_format = DRM_FORMAT_ ## name,             \
>   		.bpc_a = BPC ## a ## A,                          \
> -		.bpc_r = BPC ## r,                               \
> -		.bpc_g = BPC ## g,                               \
> -		.bpc_b = BPC ## b,                               \
> -		.unpack = { e0, e1, e2, e3 },                    \
> +		.bpc_r_cr = BPC ## r,                            \
> +		.bpc_g_y = BPC ## g,                             \
> +		.bpc_b_cb = BPC ## b,                            \
> +		.element = { e0, e1, e2, e3 },                   \
> +		.fetch_type = fp,                                \
> +		.chroma_sample = cs,                             \
>   		.alpha_enable = alpha,                           \
>   		.unpack_tight = tight,                           \
> -		.cpp = c,                                        \
>   		.unpack_count = cnt,                             \
> -		.fetch_type = fp,                                \
> -		.chroma_sample = cs,                             \

Minor nit:

These two lines are only moving the locations of assignment so 
unnecessary change?

Rest LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For validation, are you relying mostly on the CI here OR also other 
internal farms? Even though mostly its just making code common, basic 
display coming up on one target each of MDP4/MDP5/DPU will be great to 
be safe.

