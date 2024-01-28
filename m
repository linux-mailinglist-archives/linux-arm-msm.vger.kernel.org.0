Return-Path: <linux-arm-msm+bounces-8685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C483F43C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D3528420F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE3679DD;
	Sun, 28 Jan 2024 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OrfN7mMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5279C4
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420939; cv=none; b=T9vdswy+g68/bOBeZLCLJTSMH7Hl9/0KLHtLWUsMG5ogkULyWrsvFl9kIS12aEKs2j5Z0OWsfFND88iSSUDuPMLmF0zD6Wmm0vvqfgR1oCuXX2XcisJq4QYIvTuZMNsXPVoIXlUzw1nBmy7vgllR2FpJLWOmLgta2YRQn+h/MyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420939; c=relaxed/simple;
	bh=O7S8vOZehq+NJKyrbohI/TLtKvvFyYGDNIqp141SrTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g2aCog+Nm7YO7kG9YmErM7z4jNoK09fb/yVjSzSXT2qPRKHoZtqgb7T7cTqZGMVePOm9LCsUG/u76WtffqRsjShjT8ULm+3XA5NKKKEy3U4hJrbwbnKsNGdE+VhDtDyS891WOf4SCtXCiGDFiwBHpwMoPSQiXA4KHcS4T4+GBzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OrfN7mMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40S5moaZ014728;
	Sun, 28 Jan 2024 05:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iEVyP6Q3RtGrtjHcCtV3z3ExYr5lvO7xQqe4g9+QoyY=; b=Or
	fN7mMp6bOvPbDuJsfwjzwuZbOsvCuhDKKTw5ITEQK6LyD2vgB3XQh87NmFm5Cy51
	SnmZiH2PCTBCP2/+9xEHFKqmQhEZ/sNHqxHVbAGT0ddtH4ssiLGebninIVbrSQa7
	y89doW2cuC7b2t8CmPvNX04kNPEE11ryOY5rEUU2MfPgzbU5+ouTySh9Y/gGZOdc
	5bdDP/mPCRcijCmk7yoZGV5t8w6as7HtmhFRwB7WvJ/3g4IRWbWohpKSZDq08ccI
	KmhrjsEDD/SxoLMDvXNclJ6XpdEZB9n7HoyIYKJ++jmGBiI8Fd+nyrzqyugeBZWa
	2csbE5PaV7ZRMeNjE3pQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvrub9fvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 05:48:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40S5mnq7024630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jan 2024 05:48:49 GMT
Received: from [10.110.114.127] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 27 Jan
 2024 21:48:47 -0800
Message-ID: <60260615-0151-2e0b-32b3-485981c84073@quicinc.com>
Date: Sat, 27 Jan 2024 21:48:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/17] drm/msm/dpu: reserve CDM blocks for DP if mode is
 YUV420
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
        <quic_khsieh@quicinc.com>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-17-quic_parellan@quicinc.com>
 <2d9bbcf8-e292-49e7-a357-f421438c2bf1@linaro.org>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <2d9bbcf8-e292-49e7-a357-f421438c2bf1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sj9ZO_JDFAJCNESK36U9BejVxsxK6Bx2
X-Proofpoint-GUID: sj9ZO_JDFAJCNESK36U9BejVxsxK6Bx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401280040


On 1/25/2024 2:01 PM, Dmitry Baryshkov wrote:
> On 25/01/2024 21:38, Paloma Arellano wrote:
>> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
>> reservation only works for writeback and DP if the format is YUV420. But
>> this can be easily extented to other YUV formats for DP.
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++++-------
>>   1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 99ec53446ad21..c7dcda3d54ae6 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -613,6 +613,7 @@ static int dpu_encoder_virt_atomic_check(
>>       struct dpu_kms *dpu_kms;
>>       struct drm_display_mode *adj_mode;
>>       struct msm_display_topology topology;
>> +    struct msm_display_info *disp_info;
>>       struct dpu_global_state *global_state;
>>       struct drm_framebuffer *fb;
>>       struct drm_dsc_config *dsc;
>> @@ -629,6 +630,7 @@ static int dpu_encoder_virt_atomic_check(
>>       DPU_DEBUG_ENC(dpu_enc, "\n");
>>         priv = drm_enc->dev->dev_private;
>> +    disp_info = &dpu_enc->disp_info;
>>       dpu_kms = to_dpu_kms(priv->kms);
>>       adj_mode = &crtc_state->adjusted_mode;
>>       global_state = dpu_kms_get_global_state(crtc_state->state);
>> @@ -656,8 +658,8 @@ static int dpu_encoder_virt_atomic_check(
>>       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, 
>> crtc_state, dsc);
>>         /*
>> -     * Use CDM only for writeback at the moment as other interfaces 
>> cannot handle it.
>> -     * if writeback itself cannot handle cdm for some reason it will 
>> fail in its atomic_check()
>> +     * Use CDM only for writeback or DP at the moment as other 
>> interfaces cannot handle it.
>> +     * If writeback itself cannot handle cdm for some reason it will 
>> fail in its atomic_check()
>>        * earlier.
>>        */
>>       if (dpu_enc->disp_info.intf_type == INTF_WB && 
>> conn_state->writeback_job) {
>> @@ -665,12 +667,15 @@ static int dpu_encoder_virt_atomic_check(
>>             if (fb && 
>> DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
>>               topology.needs_cdm = true;
>> -        if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
>> -            crtc_state->mode_changed = true;
>> -        else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
>> -            crtc_state->mode_changed = true;
>> +    } else if (dpu_enc->disp_info.intf_type == INTF_DP) {
>
> You can use disp_info directly here.
Ack
>
>> +        if 
>> (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], 
>> adj_mode))
>> +            topology.needs_cdm = true;
>>       }
>>   +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
>> +        crtc_state->mode_changed = true;
>> +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
>> +        crtc_state->mode_changed = true;
>>       /*
>>        * Release and Allocate resources on every modeset
>>        * Dont allocate when active is false.
>> @@ -1111,7 +1116,8 @@ static void 
>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>         dpu_enc->dsc_mask = dsc_mask;
>>   -    if (dpu_enc->disp_info.intf_type == INTF_WB && 
>> conn_state->writeback_job) {
>> +    if ((dpu_enc->disp_info.intf_type == INTF_WB && 
>> conn_state->writeback_job) ||
>> +        dpu_enc->disp_info.intf_type == INTF_DP) {
>>           struct dpu_hw_blk *hw_cdm = NULL;
>>             dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>

