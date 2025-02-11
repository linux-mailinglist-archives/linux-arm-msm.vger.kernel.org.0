Return-Path: <linux-arm-msm+bounces-47504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE0A30128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 02:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E70E1888DF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 01:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180BF26BD89;
	Tue, 11 Feb 2025 01:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YRk21xpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8568626BD84;
	Tue, 11 Feb 2025 01:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739238883; cv=none; b=XxWB69z120ICzDF4Ofe/0duQc6WW+lxle99pIqvZvLvq3m3NpoZm8rsYVs/3uFoA2Lf1As9c/j8rv/59yS/9mAJPLrYX1u+/McMh9ry6DRAbC1Q76QjowaZNRqm43f6F+mLwjOK/7mvVZs2c3LdAA+uuSKaZ9bxw287cwqg9apY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739238883; c=relaxed/simple;
	bh=riuGv/vAg/A2Ad6nvfw9qHceAmjTJP80sqW3eIWtAQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R/gM+vOnc7KB2HLpZFF4FcsbD60Mj7jLPlHiQnUnVXbw/h42jaLeBROO5a3wtUy+sCDtuERpLAd7f4C3Ipp0YXoJE34IvXHn5HGoCIWB25bq1uk01B5DMsqSS91/isIBnY2gv13gDQ9iyDVKfSXtmHB45zIVfTzGn0wckkYkiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YRk21xpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK3LAo003521;
	Tue, 11 Feb 2025 01:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKbFmJKmJ7yLE97ZoFWuAbSLEitXdLyHF51i0LW2NBs=; b=YRk21xpW/JCT4DaW
	b7KJmL94CLNhMP/RVPOY357/JHK86e/e02KDmO2yRAA0ot4sTzxxgxvWfOIBzgR7
	2sxywa9u55crLfe8d8uJgaQGSB5skFi6XDsz5t86f8+QYV7LJ1a1biyT9v/wpgyx
	54wk1bV0IOwXz0FpMmX8AN9GH2U5gGIj1ewKA+GGbCtDrI68DezSvUsezE45ONAr
	8oaDV1VghNf4XdZI1e3qAYHTEfCfFX9BKikrUp/lwn0kTmkCjPfjDPpn+Lvy9BVK
	ZE9xMCdZxFlEaAj+9YkAliZudQRX1qNsrC8my9AprSvhcqjgL1MyQ28azsg8En8p
	xthmng==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyp570-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:54:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B1sP1D026021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 01:54:25 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 17:54:24 -0800
Message-ID: <a3374b07-11a0-4eec-9f57-3ca25068fe24@quicinc.com>
Date: Mon, 10 Feb 2025 17:54:24 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1 interface
 in DSC topology
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, "David
 Airlie" <airlied@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Simona Vetter
	<simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jordan
 Crouse" <jordan@cosmicpenguin.net>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Martin
 Botka" <martin.botka@somainline.org>,
        Jami Kettunen
	<jami.kettunen@somainline.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C9f3P0FpGCh4GPbIxlo6g5l7A6-YGmsb
X-Proofpoint-GUID: C9f3P0FpGCh4GPbIxlo6g5l7A6-YGmsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110009



On 2/9/2025 1:42 PM, Marijn Suijten wrote:
> When DSC is enabled the number of interfaces is forced to be 1, and
> documented that it is a "power-optimal" layout to use two DSC encoders
> together with two Layer Mixers.  However, the same layout (two DSC
> hard-slice encoders with two LMs) is also used when the display is
> fed with data over two instead of one interface (common on 4k@120Hz
> smartphone panels with Dual-DSI).  Solve this by simply removing the
> num_intf = 1 assignment as the count is already calculated by computing
> the number of physical encoders within the virtual encoder.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b585cd17462345f94bcc2ddd57902cc7c312ae63..b0870318471bd7cceda70fd15ea7bcc8658af604 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -686,20 +686,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   
>   	if (dsc) {
>   		/*
> -		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
>   		 * when Display Stream Compression (DSC) is enabled,
>   		 * and when enough DSC blocks are available.
>   		 * This is power-optimal and can drive up to (including) 4k
>   		 * screens.
>   		 */
> -		if (dpu_kms->catalog->dsc_count >= 2) {
> +		WARN(topology.num_intf > 2,
> +		     "DSC topology cannot support more than 2 interfaces\n");
> +		if (intf_count >= 2 || dpu_kms->catalog->dsc_count >= 2) {
>   			topology.num_dsc = 2;
>   			topology.num_lm = 2;
>   		} else {
>   			topology.num_dsc = 1;
>   			topology.num_lm = 1;
>   		}
> -		topology.num_intf = 1;
>   	}
>   
>   	return topology;
> 
> -- 
> 2.48.1
> 


