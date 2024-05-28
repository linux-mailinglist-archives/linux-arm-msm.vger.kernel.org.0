Return-Path: <linux-arm-msm+bounces-20853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C48D2877
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 01:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA031C26A39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D927139D11;
	Tue, 28 May 2024 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oQmVxia1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99B17C6A;
	Tue, 28 May 2024 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716937230; cv=none; b=C+ODcnpiDu/Wnmbf6sVsUrMDjwGMRKlMRWCWsDBx+CJ9JHPhrlsHlPSGQ2Y7mLutvGWXmo96PvWY5UaG7DlAbelci6aYIlQpSeytalDCNHI/7EpV0Zd/4rD7ucK+nAUOnS20CC6KVpWja4SICbiOxU2Udu9SRtRAFcL0BDzzUiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716937230; c=relaxed/simple;
	bh=Z/AQEJ+lFIoOcp87miu0XAezkDG/+cLogZMArRZxy3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L4AeoJ0djP8zLCMpHnxXD/aQBjE7qyXg/w8El2pf8djODSph0EtZqa81ynwQfl9NopQrhdcyRzQ5KLcxk+UlxtclgEiJqULfHl3BaIPPJO1y5BgNkj9dprLmJtL4WtlOGaMLzNXglGhe0989P8cpzbmfCiPRhpJg2H71cMV5EJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oQmVxia1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SBRRV1031925;
	Tue, 28 May 2024 23:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLBKDGhwyGjQkU8j/X3JXPj/98/3Bb86QvyqdJUCLe0=; b=oQmVxia1mtwkkgsi
	3/s009u5+Wn9elHa8gMUKUxy+tAh4GIyc1eSXJNHQWuUKHtIZ7Un1ig26ccP8Hrj
	2SJEloLd2spdC2xNGjEOLeTAxiBhW/Xi+Ou89dkebUpmInt2DfFitv6hfD3iLfww
	f3wsjqC6XAtH8fMK0WYDjKMDLCbHRIqurV8GPqw0y/9Gv1ThwRbz2bneV3ZHpLW3
	cwxvFU/Ncf9/XbgHi58bxSLeHCzlANsXA1JZH+WFqaoIrxm+4dYUPuBsp4Pbxkdd
	L5SynlpGRHWgqrs54WT/0DwHkGFj2V5EG+6nhuIRPKnD3GodDgww/OZsozyDgWCD
	aXl4bQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qfesh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 23:00:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SMxvYX010408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 22:59:57 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 May
 2024 15:59:56 -0700
Message-ID: <cfc138b2-9c12-4b71-b60c-c098cc1f8c06@quicinc.com>
Date: Tue, 28 May 2024 15:59:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for
 DSC
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1qKgCSnfOS-JZFP6Zo6at1hF2ryhYRQt
X-Proofpoint-ORIG-GUID: 1qKgCSnfOS-JZFP6Zo6at1hF2ryhYRQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280171



On 5/27/2024 7:21 AM, Jun Nie wrote:
> Enable compression bit in cfg2 register for DSC in the DSI case
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index f97221423249..34bfcfba3df2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -177,6 +177,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   	if (p->wide_bus_en && !dp_intf)
>   		data_width = p->width >> 1;
>   
> +	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
> +	if (p->compression_en && !dp_intf)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;

Hi Jun,

The DSC/DCE enablement registers were only moved to INTF in DPU 7.x and 
later.

We should probably add some MDSS version check similar to what command 
mode INTF does here [1]

Thanks,

Jessica Zhang

> +
>   	hsync_data_start_x = hsync_start_x;
>   	hsync_data_end_x =  hsync_start_x + data_width - 1;
>   
> 
> -- 
> 2.34.1
> 

