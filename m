Return-Path: <linux-arm-msm+bounces-42453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 694D89F402F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 02:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9B3169F99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCAA2E630;
	Tue, 17 Dec 2024 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="prSYOUj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8E4A3E;
	Tue, 17 Dec 2024 01:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734400097; cv=none; b=o2P6ag4qKIHRa6gMWkdQFZNdVVLRyXO3B6eTXA/m2vz0T1R3tDd6wh2D9EeYOobfHeTtN3Nxj57ANO202qN+nI16WZGGRZtz7y+pDdTTVa59D3X0W+goUYhMIzuRyxvlPQNqXnal9PXAHiwh4xJ1Tnmln7Nk5FZ4oCxO7JVGSu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734400097; c=relaxed/simple;
	bh=B+A9gDWgkhdxZU89L3P2yZlVW8ypC/tbjNlNGENsnS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dM2pom4DI1HK9W+RyQXwlYKP+IK46iTd5BteL8+y8r7Z19A+vbIRanKzXJrzZkTqW2um0YBYpAASUKU+GgtO0RRiH5OCUPuphp6vNRSrU501cNrM+ETpJE98NpZjMe8XJjpdG7zemvpMgUVAi50gKc7cCBuLWQ6kuZieQf8ED/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=prSYOUj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH02UsI027359;
	Tue, 17 Dec 2024 01:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K/+/mFq7Fqc4zvtRgzjtofYIhiKezX05kBvykpM3mqM=; b=prSYOUj3cPULpdfi
	/6EqNcPKzHfGEhuBGev7yaSC6xhC9Z1ExFwub1Y+agZ8yy6lMb+2MQFXiTXv6CUH
	9L5s92LwL1elmu9y6YIfr56S2tA9luMMInYgQm2VBepYyDG7v0wpd0asz0y4jfrS
	qsUUUZsIBinbkKcYCnd4+rGaSW3RxmYYSdsZ1MYfwkCTFaovzeIegZKydK6cpPEj
	3A+gKhTqkPO735gB5hxNLCJlJ9i3Y3DN2oA5uplxkHTkTcg6dvQRF0zvNxhxLQ40
	KOcHbqn3PmlL+vP46KyPd8o/+VOsNTem818rBt6a511wI+Py6txB6r6PrxpcpJFY
	21tnjw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jxdm06wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:47:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH1lqg0029628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 01:47:52 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 17:47:51 -0800
Message-ID: <b329e872-3e1e-45e3-bff6-bf6ad2c11144@quicinc.com>
Date: Mon, 16 Dec 2024 17:47:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
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
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S70DI_njk5uMdk_ahcy4cmfneuQkdkTI
X-Proofpoint-ORIG-GUID: S70DI_njk5uMdk_ahcy4cmfneuQkdkTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170013



On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
>   3 files changed, 181 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>   	return false;
>   }
>   

<snip>

> +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
>   {
> -	struct dpu_crtc_state *cstate;
> -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_dspp, i;
> -
> -	cstate = to_dpu_crtc_state(crtc_state);
> -
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -
> -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> -		ARRAY_SIZE(hw_dspp));
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	u32 num_intf = 0;
> +	u32 num_dsc = 0;
> +	int i;
>   
> -	for (i = 0; i < num_lm; i++) {
> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> +		if (dpu_enc->phys_encs[i])
> +			num_intf++;
>   
> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> -	}
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> +	if (dpu_enc->dsc)
> +		num_dsc += 2;
>   

As we requested in v3, can you please explain why we have num_dsc +=2 
instead of just num_dsc = 2? If we are hard-coding 2:2:1, this should be 
just num_dsc = 2.

