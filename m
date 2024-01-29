Return-Path: <linux-arm-msm+bounces-8755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7392983FD25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 05:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D60711F20FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 04:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A7F14A9E;
	Mon, 29 Jan 2024 04:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+TqHclq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E414E14A8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 04:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706501587; cv=none; b=YQJMgTPhfF5ppI58Ao3Z8+N9pjKmTsshUcuLcAPcaervytRDDWyF5Gb+eY6Ko72zTWYwfXtC4RB8WLrhzsWOpJDjTtsS9uLSBZ/oyFbN8o8jzoY2onAmKonwsVHxhSQ1lOWUVSkZNKdK/zhIOvRcVFsySYd/J0KYYI/Mh7C9c5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706501587; c=relaxed/simple;
	bh=6OFo5rTmaf1prJ0Mn4LIKDcOAmFggeQ4bcGWUJ8CnbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkFfg/Ecjyhj9Wv6wwAID43mqncNWLp5whpV7lAHihi2vAEG2PcFAFoIy7Sjzr9QHcAeedHzXCqRrnyMNYSQvyBNe/+zABEUxzhzMGxo62n5oVZfiUM8uHuRZ5bcdtZYJFIlOKf1wamwodQ8dLB2Xm96XGk+MqwaKCYmXoG5L8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+TqHclq; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-602a0a45dd6so19664147b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 20:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706501585; x=1707106385; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28FeUEzdYPE+EaFAB77GAcGcEmI6x3YiHo6XhzGqL7Q=;
        b=d+TqHclqq9z5IIbztFVzjUbOfnv/V1ytSLKr6OtcrLfSz/rlJf4t481xrtc1Wvg3ss
         P2qdADzTVXpa0/fqMvPhJ4/4bUq+Wi0OaVIPX6zEB9c2JyEHbebx+1cWNzV01Fv+VE+9
         j6v+d6NINBno87K5dB9gtT99WPJqox9mHSi+BZx/AjGNMGaN229MPKo0dz0WCFxiXOX6
         RQo2K9hMJL/JjRtwVaj4wnHi70HeiA8ZQoXAZBMbGa0jawnTL1YlnO9VBb0uW+h/EahZ
         pXoIoup9IZqtwA44LsH8vk6xfdhclU2TV7MEo1/BU8dgiDFJVNCex1+iK1Hr4P0DRtGg
         Kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706501585; x=1707106385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28FeUEzdYPE+EaFAB77GAcGcEmI6x3YiHo6XhzGqL7Q=;
        b=hUfv/s5TMeKsCQZNduPHa5yYe523d+r5+M9YqKnsJ7xFpEvNcIxRS3KHGQjxVVuvGQ
         ZeNwUDxSATemXeeAFcYz1vahCcUhWSBqhX8b6eitw6xyk8oPU/bj46irFaFXM4zq8ikc
         1iwmGFnDi+apitQrfgT2sH3Xj5E9R67ZidoKt1sy2/MJCU/PnAr9w3dfMrHdLyrKZp4c
         kp4ch6ufdAgABYEA/u2HP/522FMq94Br3aI3wd7dxH6rEevgsjEq1hQFCDKKNTXJp2Dk
         WpLFwIwAf1cNCaLY9OH21C01sajWHnfXp73YYCc9E442igq4K52bVd2ticOzH1SuBibf
         YgKA==
X-Gm-Message-State: AOJu0YweXoQ0HVnkewdOf6Fk9/94X+BchahmPLE2nRCLdsvvJxNFMG7M
	uGQsc5HodXOU9eV+i26iA/IEX/Nk+gbhQ9tbCeNVSvM6O8AunUXguVRAGdvsgfJSDhrKUtLmj9i
	ZGl3YUstJrV56Tbp7ynDGqEuCZ1ureRKo2/cZDw==
X-Google-Smtp-Source: AGHT+IFLRuO+7daqerUf3YLr7AMZQZU1PycYCo+i4/wTlFjk76dAFiCNrm31mJXTlWPNavRau30ne6rGCoX5TmTeArM=
X-Received: by 2002:a05:690c:a06:b0:5ff:9128:d314 with SMTP id
 cg6-20020a05690c0a0600b005ff9128d314mr3063437ywb.105.1706501584778; Sun, 28
 Jan 2024 20:13:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com> <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
 <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com> <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
 <CAA8EJpoTtzupauFah=65Yn_cRQzDbgpLw-6GuXWCUwPcNJvKOA@mail.gmail.com> <0bed7afe-b73a-b1de-edc0-a25b368556bf@quicinc.com>
In-Reply-To: <0bed7afe-b73a-b1de-edc0-a25b368556bf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 06:12:53 +0200
Message-ID: <CAA8EJprO9rvEnyOD83N0YFaTO64TxDvvg_XMQ2zF+ku1ucHi3A@mail.gmail.com>
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm
 to work for DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 06:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/28/2024 7:23 PM, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 05:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 1/26/2024 4:39 PM, Paloma Arellano wrote:
> >>>
> >>> On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
> >>>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
> >>>>>
> >>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>>> ---
> >>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
> >>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
> >>>>>    2 files changed, 18 insertions(+), 17 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>> index 993f263433314..37ac385727c3b 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>>>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
> >>>>>     * @hw_intf:        Hardware interface to the intf registers
> >>>>>     * @hw_wb:        Hardware interface to the wb registers
> >>>>>     * @hw_cdm:        Hardware interface to the CDM registers
> >>>>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM
> >>>>> configuration
> >>>>
> >>>> Please realign the description.
> >>> Ack
> >>>>
> >>>>>     * @dpu_kms:        Pointer to the dpu_kms top level
> >>>>>     * @cached_mode:    DRM mode cached at mode_set time, acted on in
> >>>>> enable
> >>>>>     * @vblank_ctl_lock:    Vblank ctl mutex lock to protect
> >>>>> vblank_refcount
> >>>>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
> >>>>>        struct dpu_hw_intf *hw_intf;
> >>>>>        struct dpu_hw_wb *hw_wb;
> >>>>>        struct dpu_hw_cdm *hw_cdm;
> >>>>> +    struct dpu_hw_cdm_cfg cdm_cfg;
> >>>>
> >>>> It might be slightly better to move it after all the pointers, so
> >>>> after the dpu_kms.
> >>> Ack
> >>>>
> >>>>>        struct dpu_kms *dpu_kms;
> >>>>>        struct drm_display_mode cached_mode;
> >>>>>        struct mutex vblank_ctl_lock;
> >>>>> @@ -213,7 +215,6 @@ static inline int
> >>>>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> >>>>>     * @wbirq_refcount:     Reference count of writeback interrupt
> >>>>>     * @wb_done_timeout_cnt: number of wb done irq timeout errors
> >>>>>     * @wb_cfg:  writeback block config to store fb related details
> >>>>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM
> >>>>> configuration
> >>>>>     * @wb_conn: backpointer to writeback connector
> >>>>>     * @wb_job: backpointer to current writeback job
> >>>>>     * @dest:   dpu buffer layout for current writeback output buffer
> >>>>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
> >>>>>        atomic_t wbirq_refcount;
> >>>>>        int wb_done_timeout_cnt;
> >>>>>        struct dpu_hw_wb_cfg wb_cfg;
> >>>>> -    struct dpu_hw_cdm_cfg cdm_cfg;
> >>>>>        struct drm_writeback_connector *wb_conn;
> >>>>>        struct drm_writeback_job *wb_job;
> >>>>>        struct dpu_hw_fmt_layout dest;
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>>> index 4cd2d9e3131a4..072fc6950e496 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>>>> @@ -269,28 +269,21 @@ static void
> >>>>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
> >>>>>     *                                     This API does not handle
> >>>>> DPU_CHROMA_H1V2.
> >>>>>     * @phys_enc:Pointer to physical encoder
> >>>>>     */
> >>>>> -static void dpu_encoder_helper_phys_setup_cdm(struct
> >>>>> dpu_encoder_phys *phys_enc)
> >>>>> +static void dpu_encoder_helper_phys_setup_cdm(struct
> >>>>> dpu_encoder_phys *phys_enc,
> >>>>> +                          const struct dpu_format *dpu_fmt,
> >>>>> +                          u32 output_type)
> >>>>>    {
> >>>>>        struct dpu_hw_cdm *hw_cdm;
> >>>>>        struct dpu_hw_cdm_cfg *cdm_cfg;
> >>>>>        struct dpu_hw_pingpong *hw_pp;
> >>>>> -    struct dpu_encoder_phys_wb *wb_enc;
> >>>>> -    const struct msm_format *format;
> >>>>> -    const struct dpu_format *dpu_fmt;
> >>>>> -    struct drm_writeback_job *wb_job;
> >>>>>        int ret;
> >>>>>          if (!phys_enc)
> >>>>>            return;
> >>>>>    -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> >>>>> -    cdm_cfg = &wb_enc->cdm_cfg;
> >>>>> +    cdm_cfg = &phys_enc->cdm_cfg;
> >>>>>        hw_pp = phys_enc->hw_pp;
> >>>>>        hw_cdm = phys_enc->hw_cdm;
> >>>>> -    wb_job = wb_enc->wb_job;
> >>>>> -
> >>>>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
> >>>>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format,
> >>>>> wb_job->fb->modifier);
> >>>>>          if (!hw_cdm)
> >>>>>            return;
> >>>>> @@ -306,10 +299,10 @@ static void
> >>>>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> >>>>>          memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> >>>>>    -    cdm_cfg->output_width = wb_job->fb->width;
> >>>>> -    cdm_cfg->output_height = wb_job->fb->height;
> >>>>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> >>>>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> >>>>
> >>>> This is a semantic change. Instead of passing the FB size, this passes
> >>>> the mode dimensions. They are not guaranteed to be the same,
> >>>> especially for the WB case.
> >>>>
> >>
> >> The WB job is storing the output FB of WB. I cannot think of a use-case
> >> where this cannot match the current mode programmed to the WB encoder.
> >>
> >> Yes, if it was the drm_plane's FB, then it cannot be guaranteed as the
> >> plane can scale the contents but here thats not the case. Here its the
> >> output FB of WB.
> >
> > Is it a part of WB uAPI, to have the FB dimensions equal to mode
> > dimensions? Or is it just our current limitation? I can easily imagine
> > WB outputting data to a part of the FB (just like we can clip FB using
> > plane's clip rectangle).
> >
> > This boils down to a question, whether CDM should be setup in terms of
> > actual output date or the physical memory buffer parameters. I suspect
> > the former is the case (which makes this change correct). But it
> > either should be described in the commit message or (even better)
> > split to a separate commit.
> >
>
> I would say its a combination of both today.
>
> The way I would look at it is even if WB crops a certain section of FB,
> that will not change the FB size. FB size of WB should match the rest of
> the DRM pipeline (the mode programmed to the CRTC/encoder). If WB
> decides to write to only a small section of FB (cropping), then we need
> another WB property like CROP_ROI so that we can program the WB to only
> write to a small section of the programmed FB. So in some sense, there
> is no such support in DRM UAPI today. Hence the FB of WB is the full
> mode of the WB.

 I'd say, CROP_ROI can refer to cropping of the image source (esp. in
the cloned output case). For writing to the part of the FB there can
be DST_X/_Y/_W/_H properties. But this becomes off-topic.

> CDM is before WB so follows the rest of the pipeline that is whatever
> the data feeding it was programmed to.

Yes. So the change is correct, but it should be split or documented
properly. I prefer the first option.


-- 
With best wishes
Dmitry

