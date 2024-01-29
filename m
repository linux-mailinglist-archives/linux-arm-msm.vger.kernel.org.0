Return-Path: <linux-arm-msm+bounces-8915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90402841681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 00:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 033101F21DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 23:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2451C38;
	Mon, 29 Jan 2024 23:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kaf0DHQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246652D044
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706569652; cv=none; b=bsr8YOMKDS+BeZk7vZAJfexcEH9/9y9a1Phapnsfan8QrKUEA3rT6sp/PLse65BmXyOnfQw0yo/ikV7h1gvPyzG+FvC/Qmtx0nnufUGCq79QjXYG4HU/SXkn/TPg+htMyQVD8rh36RKjuBFIvPjz5KTRQJvZh8eYB5ts9ldaIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706569652; c=relaxed/simple;
	bh=cB5QI7lVacH4qq6u2OtlPfDTvsK3kBnb2n+0QzJ7pKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g02xHRSC5guDBY6gfNkt4N0p0kvQZYYogGcrog6cWQwKWJtIM/mKRnzWSObs2HjI0VDMO0C8ByJulsZC4hmJU+Ep8pf/yRodC3I66XorchGBrurDKvS4tPgFCGQz5FIY7hi66oT5AI+WRRrRqmCMZppEkGq/GSGKavMRni4O4OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kaf0DHQz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TLe9B0006573;
	Mon, 29 Jan 2024 23:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jRskniW/qeRQACsJHc/yaCztuau4lGb0lgHy+SSqq1g=; b=Ka
	f0DHQz3LYTrEI3Hj/LSFo8fKF08agqENnQ47+hxLb0s9Uy7zRZtiQCu4LSxsXscO
	XC8rqmLSwVnO2FdPgh3Oad+u8HhczVKfQDMK5p2tiXpCcmHNhNfnkYqQ1F86KXlB
	eC9gcWc7oFjMuvipv0LALV92lER15n7b802annjKXulI0EAMvTXs9an1FmdFaGNG
	tJFwxHy7Dk5K4GDlqsgjsjKDeoaDyvAznDhgz2VdHJq8uwEM0Y06t9l9aPzofRit
	2Zf25r9ns5BIahWQ/p3c7Tww0ooXo4vWNR2xUKZGEcU5XcTlcIXSHW//26H3TAEJ
	ZuapDhfjlhFPY1odvDPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxcva1a90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 23:07:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40TN6nZM001192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 23:06:49 GMT
Received: from [10.110.18.73] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 15:06:48 -0800
Message-ID: <a3d40689-196f-4a15-d074-e38d66f9bf68@quicinc.com>
Date: Mon, 29 Jan 2024 15:06:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow
 dpu_encoder_helper_phys_setup_cdm to work for DP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
 <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
 <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
 <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
 <CAA8EJpoTtzupauFah=65Yn_cRQzDbgpLw-6GuXWCUwPcNJvKOA@mail.gmail.com>
 <0bed7afe-b73a-b1de-edc0-a25b368556bf@quicinc.com>
 <CAA8EJprO9rvEnyOD83N0YFaTO64TxDvvg_XMQ2zF+ku1ucHi3A@mail.gmail.com>
 <b26b2660-0d7d-4758-8052-ca94e9162e2d@quicinc.com>
 <CAA8EJpr-kHNbGaJPnAugd3bOS9Y_UhOeeGMvrrM3A+R83SgWbQ@mail.gmail.com>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpr-kHNbGaJPnAugd3bOS9Y_UhOeeGMvrrM3A+R83SgWbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hjgD0-hAjxY5zFpdUghZAh_icm4FJmcv
X-Proofpoint-GUID: hjgD0-hAjxY5zFpdUghZAh_icm4FJmcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_14,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401290172


On 1/28/2024 9:12 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 06:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>> On 1/28/2024 8:12 PM, Dmitry Baryshkov wrote:
>>> On Mon, 29 Jan 2024 at 06:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>> On 1/28/2024 7:23 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, 29 Jan 2024 at 05:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 1/26/2024 4:39 PM, Paloma Arellano wrote:
>>>>>>> On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
>>>>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>>>>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>>>>> ---
>>>>>>>>>      .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
>>>>>>>>>      .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
>>>>>>>>>      2 files changed, 18 insertions(+), 17 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>>>>> index 993f263433314..37ac385727c3b 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>>>>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
>>>>>>>>>       * @hw_intf:        Hardware interface to the intf registers
>>>>>>>>>       * @hw_wb:        Hardware interface to the wb registers
>>>>>>>>>       * @hw_cdm:        Hardware interface to the CDM registers
>>>>>>>>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM
>>>>>>>>> configuration
>>>>>>>> Please realign the description.
>>>>>>> Ack
>>>>>>>>>       * @dpu_kms:        Pointer to the dpu_kms top level
>>>>>>>>>       * @cached_mode:    DRM mode cached at mode_set time, acted on in
>>>>>>>>> enable
>>>>>>>>>       * @vblank_ctl_lock:    Vblank ctl mutex lock to protect
>>>>>>>>> vblank_refcount
>>>>>>>>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
>>>>>>>>>          struct dpu_hw_intf *hw_intf;
>>>>>>>>>          struct dpu_hw_wb *hw_wb;
>>>>>>>>>          struct dpu_hw_cdm *hw_cdm;
>>>>>>>>> +    struct dpu_hw_cdm_cfg cdm_cfg;
>>>>>>>> It might be slightly better to move it after all the pointers, so
>>>>>>>> after the dpu_kms.
>>>>>>> Ack
>>>>>>>>>          struct dpu_kms *dpu_kms;
>>>>>>>>>          struct drm_display_mode cached_mode;
>>>>>>>>>          struct mutex vblank_ctl_lock;
>>>>>>>>> @@ -213,7 +215,6 @@ static inline int
>>>>>>>>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
>>>>>>>>>       * @wbirq_refcount:     Reference count of writeback interrupt
>>>>>>>>>       * @wb_done_timeout_cnt: number of wb done irq timeout errors
>>>>>>>>>       * @wb_cfg:  writeback block config to store fb related details
>>>>>>>>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM
>>>>>>>>> configuration
>>>>>>>>>       * @wb_conn: backpointer to writeback connector
>>>>>>>>>       * @wb_job: backpointer to current writeback job
>>>>>>>>>       * @dest:   dpu buffer layout for current writeback output buffer
>>>>>>>>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
>>>>>>>>>          atomic_t wbirq_refcount;
>>>>>>>>>          int wb_done_timeout_cnt;
>>>>>>>>>          struct dpu_hw_wb_cfg wb_cfg;
>>>>>>>>> -    struct dpu_hw_cdm_cfg cdm_cfg;
>>>>>>>>>          struct drm_writeback_connector *wb_conn;
>>>>>>>>>          struct drm_writeback_job *wb_job;
>>>>>>>>>          struct dpu_hw_fmt_layout dest;
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>>>>> index 4cd2d9e3131a4..072fc6950e496 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>>>>> @@ -269,28 +269,21 @@ static void
>>>>>>>>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>>>>>>>>>       *                                     This API does not handle
>>>>>>>>> DPU_CHROMA_H1V2.
>>>>>>>>>       * @phys_enc:Pointer to physical encoder
>>>>>>>>>       */
>>>>>>>>> -static void dpu_encoder_helper_phys_setup_cdm(struct
>>>>>>>>> dpu_encoder_phys *phys_enc)
>>>>>>>>> +static void dpu_encoder_helper_phys_setup_cdm(struct
>>>>>>>>> dpu_encoder_phys *phys_enc,
>>>>>>>>> +                          const struct dpu_format *dpu_fmt,
>>>>>>>>> +                          u32 output_type)
>>>>>>>>>      {
>>>>>>>>>          struct dpu_hw_cdm *hw_cdm;
>>>>>>>>>          struct dpu_hw_cdm_cfg *cdm_cfg;
>>>>>>>>>          struct dpu_hw_pingpong *hw_pp;
>>>>>>>>> -    struct dpu_encoder_phys_wb *wb_enc;
>>>>>>>>> -    const struct msm_format *format;
>>>>>>>>> -    const struct dpu_format *dpu_fmt;
>>>>>>>>> -    struct drm_writeback_job *wb_job;
>>>>>>>>>          int ret;
>>>>>>>>>            if (!phys_enc)
>>>>>>>>>              return;
>>>>>>>>>      -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>>>>>>>>> -    cdm_cfg = &wb_enc->cdm_cfg;
>>>>>>>>> +    cdm_cfg = &phys_enc->cdm_cfg;
>>>>>>>>>          hw_pp = phys_enc->hw_pp;
>>>>>>>>>          hw_cdm = phys_enc->hw_cdm;
>>>>>>>>> -    wb_job = wb_enc->wb_job;
>>>>>>>>> -
>>>>>>>>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
>>>>>>>>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format,
>>>>>>>>> wb_job->fb->modifier);
>>>>>>>>>            if (!hw_cdm)
>>>>>>>>>              return;
>>>>>>>>> @@ -306,10 +299,10 @@ static void
>>>>>>>>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
>>>>>>>>>            memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
>>>>>>>>>      -    cdm_cfg->output_width = wb_job->fb->width;
>>>>>>>>> -    cdm_cfg->output_height = wb_job->fb->height;
>>>>>>>>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>>>>>>>>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>>>>>>>> This is a semantic change. Instead of passing the FB size, this passes
>>>>>>>> the mode dimensions. They are not guaranteed to be the same,
>>>>>>>> especially for the WB case.
>>>>>>>>
>>>>>> The WB job is storing the output FB of WB. I cannot think of a use-case
>>>>>> where this cannot match the current mode programmed to the WB encoder.
>>>>>>
>>>>>> Yes, if it was the drm_plane's FB, then it cannot be guaranteed as the
>>>>>> plane can scale the contents but here thats not the case. Here its the
>>>>>> output FB of WB.
>>>>> Is it a part of WB uAPI, to have the FB dimensions equal to mode
>>>>> dimensions? Or is it just our current limitation? I can easily imagine
>>>>> WB outputting data to a part of the FB (just like we can clip FB using
>>>>> plane's clip rectangle).
>>>>>
>>>>> This boils down to a question, whether CDM should be setup in terms of
>>>>> actual output date or the physical memory buffer parameters. I suspect
>>>>> the former is the case (which makes this change correct). But it
>>>>> either should be described in the commit message or (even better)
>>>>> split to a separate commit.
>>>>>
>>>> I would say its a combination of both today.
>>>>
>>>> The way I would look at it is even if WB crops a certain section of FB,
>>>> that will not change the FB size. FB size of WB should match the rest of
>>>> the DRM pipeline (the mode programmed to the CRTC/encoder). If WB
>>>> decides to write to only a small section of FB (cropping), then we need
>>>> another WB property like CROP_ROI so that we can program the WB to only
>>>> write to a small section of the programmed FB. So in some sense, there
>>>> is no such support in DRM UAPI today. Hence the FB of WB is the full
>>>> mode of the WB.
>>>    I'd say, CROP_ROI can refer to cropping of the image source (esp. in
>>> the cloned output case). For writing to the part of the FB there can
>>> be DST_X/_Y/_W/_H properties. But this becomes off-topic.
>>>
>>>> CDM is before WB so follows the rest of the pipeline that is whatever
>>>> the data feeding it was programmed to.
>>> Yes. So the change is correct, but it should be split or documented
>>> properly. I prefer the first option.
>>>
>> Ok just to clarify you prefer below part of the change to be moved to
>> its own commit right?
>>
>> -    cdm_cfg->output_width = wb_job->fb->width;
>> -    cdm_cfg->output_height = wb_job->fb->height;
>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
>>
>> If so, ack.
> Yes.
Ack will change in next version.
>
>

