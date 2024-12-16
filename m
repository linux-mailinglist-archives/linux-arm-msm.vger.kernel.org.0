Return-Path: <linux-arm-msm+bounces-42376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 355539F39E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580B118827F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4740207E1B;
	Mon, 16 Dec 2024 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V5O8R22u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C74207DF8;
	Mon, 16 Dec 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377209; cv=none; b=peFNa92eK4e+/+Dss1NrYCmb1gw7GWj4FFZqwG89JUYXLC9pTfsOoS3QMD3zwd5VxaE8hHZ42VayUHKOMSjd1aeoETdhXLlhpeRK/tQqhCSG2dEYjXgXT3uvRcImpc5XXLIh8I9s1MnCnJWqZKIQCyj+ifzLQ5/g72GBAYoYu3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377209; c=relaxed/simple;
	bh=PGjgd7TBpJnauZyGJkoqMA0DOAbX29AOhv3na7ggMMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mboTNi+YCAFfH5yAVytMQaKkARloyj+C3lhFOZMw26CawLUVKg8JKuHHty8sFxs5sGbH2eaoHmtktS+YY5BM6KgnWNLZgyAUmePW4j4NKLjuP288CyTXsLxywWrKB/SVO3hu/jLLFeqQLbRVHU/3VHbo/KNTpVg3BdA9Kb5sYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V5O8R22u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGHA1Vm017650;
	Mon, 16 Dec 2024 19:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8o5BulnjWrc9FstuAyn8X67jGFrZz3Vo5bL2vWSzoo=; b=V5O8R22uUGcGFWOE
	Jj0eJ9MH/vIA4LauYnfrQtJYy6/pdkdio9+dtHuwtq/SZdroqWHWnaHQrX6myZlX
	iEUdV9XQhASLAJuHodAuc0IOhOZUCVzxAACUPTA8Mtp0JrylOcaR8APsU2ofc2Qp
	N6Dash52hyVfaUrLfLW4QJw0g2tOjqCstq91G/y5ekRUEOI75o7qSslY7AQURLXW
	jLH4jqwCIPHRYRkNTVtNWLR+0N/DI0Pm7aXPYRjueJY4y1u/5pSOgOg6BU9Nhk4Z
	Sf0xD3TUtxzqO/9uvshmhp+vqSRp2FxykRX/TjhRpZH/AjvqVfyRDohSkmp0erUm
	S6Qfrg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jrc1rb3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:26:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJQePR000591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 19:26:40 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:26:38 -0800
Message-ID: <54edef24-b27a-4d79-aff1-672d4e65b5a3@quicinc.com>
Date: Mon, 16 Dec 2024 11:26:37 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: correct LM pairing for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _eGJJNDVW3dGcaRy1bI7HwslwN8P70cS
X-Proofpoint-ORIG-GUID: _eGJJNDVW3dGcaRy1bI7HwslwN8P70cS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160160



On 12/16/2024 12:20 AM, Dmitry Baryshkov wrote:
> According to the vendor devicetree on SM6150 LM_0 is paired with LM_2
> rather than LM_1. Correct pairing indices.
> 
> Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index 621a2140f675fa28b3a7fcd8573e59b306cd6832..81eb274cc7000a3b70b0f6650088ddcd24648eab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -116,20 +116,20 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_0,
>   		.dspp = DSPP_0,
> -		.lm_pair = LM_1,
> +		.lm_pair = LM_2,
>   	}, {
>   		.name = "lm_1", .id = LM_1,
>   		.base = 0x45000, .len = 0x320,
>   		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_1,
> -		.lm_pair = LM_0,
>   	}, {
>   		.name = "lm_2", .id = LM_2,
>   		.base = 0x46000, .len = 0x320,
>   		.features = MIXER_QCM2290_MASK,
>   		.sblk = &sdm845_lm_sblk,
>   		.pingpong = PINGPONG_2,
> +		.lm_pair = LM_0,
>   	},
>   };

Have a basic question here. We check the peer only if we will have more 
than one LM needed in the topology but sm6150 does not have 3dmux, so 
the number of LMs will not go beyond one.

318 		/* Valid primary mixer found, find matching peers */
319 		if (lm_count < reqs->topology.num_lm) {

It seems like this fix will be unused or does not really matter.

Downstream has a different implementation for lm_pair, its used even to 
decide the LM pair for CWB mux. Upstream has a simpler implementation of 
just doing that in the code of using ODD LMs for ODD CWB muxes and even 
LMs for even CWB muxes. So fix is okay but not needed.

>   
> 
> ---
> base-commit: a3d570eace66b4016f2692a6f1045742ee70c6b1
> change-id: 20241216-dpu-fix-sm6150-17f0739f8fe0
> 
> Best regards,

