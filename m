Return-Path: <linux-arm-msm+bounces-10933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87384853A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 19:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B823CB289D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131E960EED;
	Tue, 13 Feb 2024 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="THEqpldu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C160897
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707849970; cv=none; b=bs10bdBMmvr4vX19w/cOtJAOFnSeBfWcX+ExeJyFz7ACDbhBXqi9EilZpi8sko0fB/UTN1AVyzKiuSOGWOVPwOhn/SM1J6hb+E4emSbOk+UwwjsnUVOoV/h/khXhaou7KHdCF6kfwsFTVpuvi6RojMjFhkQVPuakSqQifRT3txY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707849970; c=relaxed/simple;
	bh=bSHKozmH6fNG9JPX5Nj7mOQrRbHi/rPSDJSBfftUJbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AWDstjqbQpOA1iFeznnZ1uUnzsivZ3nlCL6ynaqqagiIgBpAIMiqWLrPoVNTmElF1BIjr1q+r7R/eLHHCZFeGX5h/zpcmoDSzfx1zq6N7pQPBeRMZUKHi5MrL9UD1vmmJvUbevb7a7i92zbyREyRWxaoo5KRbOk5FqWPDjjYjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=THEqpldu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41DEEpPF018115;
	Tue, 13 Feb 2024 18:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sndg1kHDE4B+VbbJiJuaQD9Gb7+w4WNqeuMlKRTIhy8=; b=TH
	EqplduDXWPWhNF6TpLc5eggE6G9+tAHoopuT32EHTHI9j1tyL8tjQd2DZhFBrw21
	tLNvuDvqLUK5mNyU86YVhFTvz2BUyFNbgLZE+X7B61VyqO+4gr73G9NpvRlc+cAZ
	BlD7oJMED45uVWxbsFfUhbd+dy8S9TXnDmY4smC3IbwWYvt65CjHDLivzormBHx5
	pHB/Uy1aQNDQQqOtB0ROltcZQQDS6Tc/A21hBpwOi1q2VTVxhb8kplPmMSMtnCV5
	/XTY4FMhklVZmm7R7hsd3aU2uOg5QRwbDp74tYa46JECtfG89vKze/ckg6PeiAeQ
	K6i4Xe0pnZS6TEL4lOwA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7hewbmv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 18:45:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41DIjwDN015685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 18:45:58 GMT
Received: from [10.110.23.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 10:45:57 -0800
Message-ID: <58578bb9-6f2e-e57f-d40e-2306c336a442@quicinc.com>
Date: Tue, 13 Feb 2024 10:45:56 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-17-quic_parellan@quicinc.com>
 <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
 <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
 <CAA8EJprLvEn7ndCHqkw4RuGq_AE1nOxyONZx832Wv8Y2dGtRhQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprLvEn7ndCHqkw4RuGq_AE1nOxyONZx832Wv8Y2dGtRhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wm6IinvvPI62LwBRiIEe_8RTXPHgHrFY
X-Proofpoint-ORIG-GUID: Wm6IinvvPI62LwBRiIEe_8RTXPHgHrFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_11,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130148



On 2/13/2024 10:23 AM, Dmitry Baryshkov wrote:
> On Tue, 13 Feb 2024 at 19:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/13/2024 3:18 AM, Dmitry Baryshkov wrote:
>>> On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>> Adjust the encoder format programming in the case of video mode for DP
>>>> to accommodate CDM related changes.
>>>>
>>>> Changes in v2:
>>>>           - Move timing engine programming to a separate patch from this
>>>>             one
>>>>           - Move update_pending_flush_periph() invocation completely to
>>>>             this patch
>>>>           - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>>>>             calls drm_mode_is_420_only() instead of doing additional
>>>>             unnecessary checks
>>>>           - Create new functions msm_dp_needs_periph_flush() and it's
>>>>             supporting function dpu_encoder_needs_periph_flush() to check
>>>>             if the mode is YUV420 and VSC SDP is enabled before doing a
>>>>             peripheral flush
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>>>>    drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>>>>    5 files changed, 101 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 7e7796561009a..6280c6be6dca9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>>           15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>>    };
>>>>
>>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +       struct drm_encoder *drm_enc;
>>>> +       struct dpu_encoder_virt *dpu_enc;
>>>> +       struct drm_display_info *info;
>>>> +       struct drm_display_mode *mode;
>>>> +
>>>> +       drm_enc = phys_enc->parent;
>>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> +       info = &dpu_enc->connector->display_info;
>>>> +       mode = &phys_enc->cached_mode;
>>>> +
>>>> +       if (drm_mode_is_420_only(info, mode))
>>>> +               return DRM_FORMAT_YUV420;
>>>> +
>>>> +       return DRM_FORMAT_RGB888;
>>>> +}
>>>> +
>>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
>>>> +{
>>>> +       struct drm_encoder *drm_enc;
>>>> +       struct dpu_encoder_virt *dpu_enc;
>>>> +       struct msm_display_info *disp_info;
>>>> +       struct msm_drm_private *priv;
>>>> +       struct drm_display_mode *mode;
>>>> +
>>>> +       drm_enc = phys_enc->parent;
>>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> +       disp_info = &dpu_enc->disp_info;
>>>> +       priv = drm_enc->dev->dev_private;
>>>> +       mode = &phys_enc->cached_mode;
>>>> +
>>>> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
>>>
>>> Do we really need to check for phys_enc->hw_cdm here?
>>>
>>
>> hmmm I dont think so. If CDM was not there, then after the last patch,
>> YUV420 removes will not be present at all.
>>
>> The only other case I could think of was, if for some reason CDM was
>> used by some other interface such as WB, then hw_cdm will not be assigned.
>>
>> But, I think even for that msm_dp_needs_periph_flush() will take care of
>> it because we use the cached_mode which is assigned only in mode_set().
>>
>>>> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
>>>> +}
>>>>
>>>>    bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>>>    {
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> index f43d57d9c74e1..211a3d90eb690 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>>>     */
>>>>    unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>>>>
>>>> +/**
>>>> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
>>>> + * @phys_enc: Pointer to physical encoder structure
>>>> + */
>>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
>>>> +
>>>> +/**
>>>> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
>>>> + *     peripheral flush
>>>> + * @phys_enc: Pointer to physical encoder structure
>>>> + */
>>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
>>>> +
>>>>    /**
>>>>     * dpu_encoder_helper_split_config - split display configuration helper function
>>>>     *     This helper function may be used by physical encoders to configure
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> index f562beb6f7971..3f102b2813ca8 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>>>>    static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>    {
>>>>           struct dpu_hw_ctl *ctl;
>>>> +       struct dpu_hw_cdm *hw_cdm;
>>>> +       const struct dpu_format *fmt = NULL;
>>>> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>>>>
>>>>           ctl = phys_enc->hw_ctl;
>>>> +       hw_cdm = phys_enc->hw_cdm;
>>>> +       if (hw_cdm)
>>>> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
>>>
>>> Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().
>>>
>>
>> I think we dont need to check for if (hw_cdm) at all.
>> dpu_encoder_get_drm_fmt() was just supposed to be a helper which returns
>> the fourcc code based on the mode. It doesnt need to know if there is
>> cdm or not.
>>
>> We cannot move it inside dpu_encoder_helper_phys_setup_cdm() because for
>> WB, we do not change the fourcc based on the mode. Its specific to video
>> mode.
> 
> Wait... In the case of the WB we use the fourcc + modifier from the
> framebuffer. Ok, this looks fine then.
> 
> 
>>
>>>> +       fmt = dpu_get_dpu_format(fmt_fourcc);
>>>
>>> Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
>>> we can move both calls into the helper? I mean, fmt_fourcc is not used
>>> at all if the CDM is not used.
>>>
>>
>> fourcc is always used to get the fmt to setup the timing engine params.
>> Its just that it was always hard-coded to RGB. With CDM, it can change
>> based on the mode. Thats why this utility was introduced to return the
>> fourcc from the mode information.
> 
> Yes, I perfectly understand that. I just disliked the idea of calling
> dpu_get_dpu_format() if the result gets unused.
> What about passing fourcc + modifier to
> dpu_encoder_helper_phys_setup_cdm() instead?
> 

Why would it be unused? Its returning YUV420 if the mode is YUV420 and 
RGB otherwise.

We need fourcc + modifier for video mode timing engine setup. I didnt 
quite follow your suggestion of passing these to 
dpu_encoder_helper_phys_setup_cdm().


>>
>>>>
>>>>           DPU_DEBUG_VIDENC(phys_enc, "\n");
>>>>
>>>> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>
>>>>           dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>>>>
>>>> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
>>>> +
>>>>           dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>>>>
>>>>           /*
>>>> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>           if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>>>>                   ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>>>>
>>>> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
>>>> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
>>>> +
>>>> +       /*
>>>> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
>>>> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
>>>> +        */
>>>> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
>>>> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
>>>> +
>>>>    skip_flush:
>>>>           DPU_DEBUG_VIDENC(phys_enc,
>>>>                   "update pending flush ctl %d intf %d\n",
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 4b04388719363..ebcc76ef1d590 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
>>>>           platform_driver_unregister(&dp_display_driver);
>>>>    }
>>>>
>>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>> +                              const struct drm_display_mode *mode)
>>>> +{
>>>> +       struct dp_display_private *dp;
>>>> +       const struct drm_display_info *info;
>>>> +
>>>> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> +       info = &dp_display->connector->display_info;
>>>> +
>>>> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
>>>> +}
>>>> +
>>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>> +                              const struct drm_display_mode *mode)
>>>> +{
>>>> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
>>>> +}
>>>> +
>>>>    bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>>    {
>>>>           struct dp_display_private *dp;
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>>> index 16a7cbc0b7dd8..b876ebd48effe 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
>>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>                            struct drm_encoder *encoder);
>>>>    void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>>>> -
>>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>> +                              const struct drm_display_mode *mode);
>>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>> +                              const struct drm_display_mode *mode);
>>>>    bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>>>
>>>>    #else
>>>> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
>>>>    {
>>>>    }
>>>>
>>>> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>> +                                            const struct drm_display_mode *mode)
>>>> +{
>>>> +       return false;
>>>> +}
>>>> +
>>>> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>> +                                            const struct drm_display_mode *mode)
>>>> +{
>>>> +       return false;
>>>> +}
>>>> +
>>>>    static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>>    {
>>>>           return false;
>>>> --
>>>> 2.39.2
>>>>
>>>
>>>
> 
> 
> 

