Return-Path: <linux-arm-msm+bounces-32518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228619867B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 22:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C31CE284EC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 20:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97D514C5BE;
	Wed, 25 Sep 2024 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VCqPid5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9714AD29;
	Wed, 25 Sep 2024 20:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727296756; cv=none; b=qHp2sGheqitxRLLO9pcY8X7OkpfDn4DQoPmQ/W91sJ/gb/QdF/iH2MuUMN3W9A0cDYPjJhXvHMybayfn4mZRqRpPt/2dY4ZCW4hnIbm2M+Zn0FAKrY2PnYiFgB/KoWtYK+NE1DnP/cSAoWe/9xj52AFWSVNdu4TgWL/TPwW5koU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727296756; c=relaxed/simple;
	bh=fAXdxypWajVQ/dpOuvObpeGWRODJEYC4z4qggc5BTjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WJ7/3+lYY+5vxzzntlQCgLHXnDIVuBCmTvYk1+DA4xk14pOFTzDy+buB6/fO4fACtCNYhQzEJtLYxPUQhi5JGbBaraj4XDybXst9dfv0CeYNSUvdL2wf+8TWqI7JbFCFOwe+tA3xD2+enqa409mJk5rehALvk1p8QxMFfjBYogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VCqPid5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5JRg021397;
	Wed, 25 Sep 2024 20:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6P7lwm0vmj3CCAHkpq3SqDjbGrXo0A50h7s/zhPceM=; b=VCqPid5mj+qJiAnG
	6WW3Oxr5GviTCmApAL3UwZSl7EIlwRW36jzxYz+iHBewIkIViWbDIgqbR1nviCpc
	2OPy0X0+UphoSzXYB023+lVkCBuAv1isXpVPgpeYB6FaMlJr8FHDNXAlsTPJyIvN
	+jdMjNP774aYHnHRIEBqRCcENbLNHfvK4r1NQUSmerCbmSTLRRDEotJv7YZj1Eet
	auCV2PFGEoz5vnTJupa1K1twp+LbEYHoRBjn50VArZMCDeIWjqzDii+dzN4DmAU9
	A3NfMvuUZ1rEQIff9BKzBjcMITFCVPYS/9vUzne02VcrRI1plSrgiEi+0Y1uu1sF
	W9erng==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakn0mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 20:38:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKcwdb025853
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 20:38:58 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 13:38:55 -0700
Message-ID: <24a11f4c-d848-4f1b-afbd-35b135fa3105@quicinc.com>
Date: Wed, 25 Sep 2024 13:38:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/22] drm/msm/dpu: move resource allocation to CRTC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-5-7849f900e863@quicinc.com>
 <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <dv5iij6v76ieprfckdjo4yksrjrgqw73v2lh7u4xffpu7rdrf3@zgjcp3a2hlxo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HQfy6X8dyIuenG609UO1FYSJh9K-t1tf
X-Proofpoint-GUID: HQfy6X8dyIuenG609UO1FYSJh9K-t1tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250147



On 9/24/2024 4:13 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 24, 2024 at 03:59:21PM GMT, Jessica Zhang wrote:
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> All resource allocation is centered around the LMs. Then other blocks
>> (except DSCs) are allocated basing on the LMs that was selected, and LM
>> powers up the CRTC rather than the encoder.
>>
>> Moreover if at some point the driver supports encoder cloning,
>> allocating resources from the encoder will be incorrect, as all clones
>> will have different encoder IDs, while LMs are to be shared by these
>> encoders.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 201 +++++++++++-----------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  19 +++
>>   3 files changed, 183 insertions(+), 123 deletions(-)
>>
>> @@ -544,159 +542,117 @@ void dpu_encoder_helper_split_config(
>>   	}
>>   }
>>   
>> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>> +				 struct msm_display_topology *topology,
>> +				 struct drm_atomic_state *state,
>> +				 const struct drm_display_mode *adj_mode)
>>   {
>>   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -	int i, intf_count = 0, num_dsc = 0;
>> +	struct drm_connector *connector;
>> +	struct drm_connector_state *conn_state;
>> +	struct msm_display_info *disp_info;
>> +	struct drm_framebuffer *fb;
>> +	struct msm_drm_private *priv;
>> +	int i;
>>   
>>   	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>>   		if (dpu_enc->phys_encs[i])
>> -			intf_count++;
>> +			topology->num_intf++;
>>   
>> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>>   	if (dpu_enc->dsc)
>> -		num_dsc = 2;
>> +		topology->num_dsc += 2;
>>   
>> -	return (num_dsc > 0) && (num_dsc > intf_count);
>> -}
>> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
>> +	if (!connector)
>> +		return;
>> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>> +	if (!conn_state)
>> +		return;
>>   
>> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>> -{
>> -	struct msm_drm_private *priv = drm_enc->dev->dev_private;
>> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> -	int index = dpu_enc->disp_info.h_tile_instance[0];
>> +	disp_info = &dpu_enc->disp_info;
>>   
>> -	if (dpu_enc->disp_info.intf_type == INTF_DSI)
>> -		return msm_dsi_get_dsc_config(priv->dsi[index]);
>> +	priv = drm_enc->dev->dev_private;
>>   
>> -	return NULL;
>> +	/*
>> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
>> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>> +	 * earlier.
>> +	 */
>> +	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
>> +		fb = conn_state->writeback_job->fb;
>> +
>> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
>> +			topology->needs_cdm = true;
>> +	} else if (disp_info->intf_type == INTF_DP) {
>> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
>> +			topology->needs_cdm = true;
>> +	}
> 
> Just to note, the needs_cdm is not enough once you introduce CWB
> support. E.g. DP/YUV420 + WB/YUV case requires two CDM blocks (which we
> don't have), but this doesn't get reflected in the topology.

Hi Dmitry,

Ack. I can add something to make atomic_check fail if the input FB is 
YUV format and CWB is enabled.

Thanks,

Jessica Zhang

> 
>>   }
>>   
> -- 
> With best wishes
> Dmitry


