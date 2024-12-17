Return-Path: <linux-arm-msm+bounces-42452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 874869F4019
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 02:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B4D1886533
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D55A42AA5;
	Tue, 17 Dec 2024 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NmJk2acJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892E51E480;
	Tue, 17 Dec 2024 01:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734399573; cv=none; b=OzjATBSG+cpujNPy2CtxmXpGxRoxUKyZMKpdoxhnz46aK77L3tNCJfr/Y+a2px3G61+B0o8CHpnWYNmBJJPWCb4ee0KpInDvAXKhcxbiM4vrlxPBTalywLnD0sbCESQEsNYegMmeVMw5JJsw0QLnNiWt5/5+OJ92EyKAmTVs1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734399573; c=relaxed/simple;
	bh=i4qafmwrLFaSOIq1b/yxPkapFf7MgkPyrYU4OdlUvbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FHEHGzq90DJxztoyNBwB2ttoS14tTZWhmZ4/PO3uci2wXnQjAD2tsPoDb6qzL1sDf5JPhqElC+Vli8ZY6uElHMW9eAWMgNtHrhb6pd1qJ/OremAsotaOL7ktEAVXy9hWLaPa97HkJUYzQ/fIViu/A8LXlsnToUqDgjijG+ZazwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NmJk2acJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH02Sga027348;
	Tue, 17 Dec 2024 01:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EeSmEL1eAu+2FwGVKFMhhMKFg7nchA3n0VWF12eik4g=; b=NmJk2acJAMoquG+q
	QTi5xFhXJf/kPtMfQrM1nddFMkY13qmor84xVlAmGb9UTTF138XbejC27dio7XoL
	Gn4hUFCb+kl03MuQK5TXp6r20QcxoV5FtMvi9DvQN3fh0tplHhRwCOCmWJPHvb7Z
	BBd787ZVKlWZmBo7ROpYczUUm6TWrfTxByDCRJf5wtifV600Nd+Qq2zjCq/hXDdV
	8yukA/21C5zw8kBknCo8cUusq8omvH7hrHQWsbUfGBwOBFgB0CiTKBtQtRcsQ0WJ
	lKfIXBrgvtgXzmgGo8TAnErE725Jc5VKXCE8iyU5gqjcnjkor7iD+bRk0jH8UsCf
	AFRncg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jxdm06e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:39:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH1dHU0014990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:39:17 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 17:39:16 -0800
Message-ID: <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
Date: Mon, 16 Dec 2024 17:39:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/25] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ko__uVmEa7xBH6bgayo2H4Wh3FwXrJaT
X-Proofpoint-ORIG-GUID: Ko__uVmEa7xBH6bgayo2H4Wh3FwXrJaT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170011



On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> from dpu_crtc_assign_resources().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: cleaned up formatting]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>   2 files changed, 31 insertions(+), 2 deletions(-)
> 

<snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_ctl, num_pp, num_dsc;
> +	int num_pp, num_dsc, num_ctl;
>   	unsigned int dsc_mask = 0;
>   	int i;
>   
> @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
>   		ARRAY_SIZE(hw_pp));
>   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> 

This chunk of diff is unnecessary. You are just changing the order of 
defines and fixing alignment. Does not have to be in this change.

