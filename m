Return-Path: <linux-arm-msm+bounces-2838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BA8005AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CF26B20F8F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6B61C2AC;
	Fri,  1 Dec 2023 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7TfPLRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C8E1711
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 00:35:02 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d34d85e610so17132777b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 00:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701419701; x=1702024501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0vyyy44HJ0PCg/k+e1EPUHLw7C4zTOZSquNZFbC/lLQ=;
        b=B7TfPLRnxs+U5KMxJoueTzM3p7DBNla1TcWjD+INIQTP589720O9OX9FrQD/46CD3d
         K4buW9/kewqXpXKtvIu6e8WehLek+ri7mfqHK4g1W5SCCGBSO3Dv0cwvbmy/3T3PPhDK
         uP2mmDrhLQ9SttQzWyodHdtFYUwSWMqe+GWNjSEgBLqD6tMqPbI357uTPUyQNiPeG1qu
         k6qskeXjRoWNOvOrNwWz2UqpGtpPz98gT64tUdQRR8NfL9glK30L79CVLZ3FYAXnjI0V
         ZBPWvo5hnkj/yKJ0TJNxtQ6cOtjM6LPBj5C8Bx3nfCEVXvqTMGZ75gFPCyCJNfRB29qk
         1ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701419701; x=1702024501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vyyy44HJ0PCg/k+e1EPUHLw7C4zTOZSquNZFbC/lLQ=;
        b=QqsqgRpPLB3u86a+k0cqPPY0PMKMUOntyyTtYgwNhZQCAyfE1Lxkte/EKghFn8A/PC
         udtsU72hIubb9AOf9YsY0KKLeqj1m/klMZUMk1j116x+XXgwlbpz1XSOiWwKbUVZVNz5
         3EWPQcFxus/MFw7boWiJuYA3p6i1K6K8JbKoVX3TvYM68t+41oGEx7dt/GUSHoDJE9Xw
         98Z++JkMlw9fAbEkqYYumA//zwhjXyHKvYImxLlrXZwHyzEEGukb+DpBdCCJ1NDmZi3a
         mMzlzIYUGOLxEyNBwAr9UnX7gX+lPi00FS/GIan3Ly1BQyyyvuOtx3jj+u06f0cnax6/
         57Dg==
X-Gm-Message-State: AOJu0YzEq/CJWNWCfD8UuHskdgh1pyYVf7GCUp1WlXO+Vcu417aANpQH
	XzfG09gibXc6jsa7lSmIiVVcgPZjLN+PCGWzu+OonQ==
X-Google-Smtp-Source: AGHT+IHsluDiR7TEy0JFz35RPDBZDAZGfERlf830bZCq3ZaKdNXxvA2SrojV1Ox4NklHZlOsNBsTriMfTwHWENQDftA=
X-Received: by 2002:a05:690c:dd2:b0:5d3:9bc7:57d1 with SMTP id
 db18-20020a05690c0dd200b005d39bc757d1mr4087419ywb.10.1701419701383; Fri, 01
 Dec 2023 00:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com> <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 10:34:50 +0200
Message-ID: <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	marijn.suijten@somainline.org, steev@kali.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> > Add a missing mutex lock to control vblank irq. Thus prevent race
> > conditions when registering/unregistering the irq callback.
> >
>
> I'm guessing that the mutex is needed because vblank_refcount, while
> being an atomic_t, doesn't actually provide any protection during
> concurrency?
>
> I also tried to follow the calls backwards, but I'm uncertain how you
> end up here concurrently.
>
> When wrapped in proper mutual exclusion, can't vblank_refcount just be
> turned into an "int"...given that you're not actually able to rely on
> it's atomic behavior anyways...
>
>
> So, please rewrite the commit message with a detailed description of how
> the concurrency happens, and please review if vblank_refcount should be
> an atomic at all...
>
> > v2: Slightly changed wording of commit message
> > v3: Mistakenly did not change wording in last version. It is done now.
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 6 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 6 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
> >  4 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 1cf7ff6caff4e..19ff7d1d5ccad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -119,6 +119,8 @@ enum dpu_enc_rc_states {
> >   *   Virtual encoder defers as much as possible to the physical encoders.
> >   *   Virtual encoder registers itself with the DRM Framework as the encoder.
> >   * @base:            drm_encoder base class for registration with DRM
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> I think this protects vblank_refcount, so state that instead of the
> vague "for IRQ purposes".
>
> >   * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >   * @enabled:         True if the encoder is active, protected by enc_lock
> >   * @num_phys_encs:   Actual number of physical encoders contained.
> > @@ -166,6 +168,7 @@ enum dpu_enc_rc_states {
> >   */
> >  struct dpu_encoder_virt {
> >       struct drm_encoder base;
> > +     struct mutex vblank_ctl_lock;
> >       spinlock_t enc_spinlock;
> >
> >       bool enabled;
> > @@ -2255,6 +2258,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> >       phys_params.dpu_kms = dpu_kms;
> >       phys_params.parent = &dpu_enc->base;
> >       phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
> > +     phys_params.vblank_ctl_lock = &dpu_enc->vblank_ctl_lock;
> >
> >       WARN_ON(disp_info->num_of_h_tiles < 1);
> >
> > @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >       dpu_enc->enabled = false;
> >       mutex_init(&dpu_enc->enc_lock);
> >       mutex_init(&dpu_enc->rc_lock);
> > +     mutex_init(&dpu_enc->vblank_ctl_lock);
>
> Is this somehow propagated to multiple different dpu_encoder_phys
> instances, or why do you need to initialize it here and pass the pointer
> through 2 different intermediate structures before assigning it to
> phys_enc->vblank_ctl_lock below?

Yes, there can be two phys_enc instances for a single encoder, so this
part is fine.

>
> >
> >       ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> >       if (ret)
> > @@ -2495,6 +2500,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
> >       phys_enc->dpu_kms = p->dpu_kms;
> >       phys_enc->split_role = p->split_role;
> >       phys_enc->enc_spinlock = p->enc_spinlock;
> > +     phys_enc->vblank_ctl_lock = p->vblank_ctl_lock;
>
> Could you not just mutex_init() the one and only vblank_ctl_lock here?
>
> >       phys_enc->enable_state = DPU_ENC_DISABLED;
> >
> >       atomic_set(&phys_enc->vblank_refcount, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 6f04c3d56e77c..5691bf6b82ee6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -155,6 +155,8 @@ enum dpu_intr_idx {
> >   * @hw_wb:           Hardware interface to the wb registers
> >   * @dpu_kms:         Pointer to the dpu_kms top level
> >   * @cached_mode:     DRM mode cached at mode_set time, acted on in enable
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> Same here.
>
> >   * @enabled:         Whether the encoder has enabled and running a mode
> >   * @split_role:              Role to play in a split-panel configuration
> >   * @intf_mode:               Interface mode
> > @@ -183,6 +185,7 @@ struct dpu_encoder_phys {
> >       struct dpu_hw_wb *hw_wb;
> >       struct dpu_kms *dpu_kms;
> >       struct drm_display_mode cached_mode;
> > +     struct mutex *vblank_ctl_lock;
> >       enum dpu_enc_split_role split_role;
> >       enum dpu_intf_mode intf_mode;
> >       spinlock_t *enc_spinlock;
> > @@ -253,6 +256,8 @@ struct dpu_encoder_phys_cmd {
> >   * @split_role:              Role to play in a split-panel configuration
> >   * @hw_intf:         Hardware interface to the intf registers
> >   * @hw_wb:           Hardware interface to the wb registers
> > + * @vblank_ctl_lock: Vblank ctl mutex lock to protect physical encoder
> > + *                                           for IRQ purposes
>
> And here...
>
> Regards,
> Bjorn
>
> >   * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
> >   */
> >  struct dpu_enc_phys_init_params {
> > @@ -261,6 +266,7 @@ struct dpu_enc_phys_init_params {
> >       enum dpu_enc_split_role split_role;
> >       struct dpu_hw_intf *hw_intf;
> >       struct dpu_hw_wb *hw_wb;
> > +     struct mutex *vblank_ctl_lock;
> >       spinlock_t *enc_spinlock;
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 25babfe1f001a..dcf1f6a18ad6e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -244,6 +244,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
> >               return -EINVAL;
> >       }
> >
> > +     mutex_lock(phys_enc->vblank_ctl_lock);
> >       refcount = atomic_read(&phys_enc->vblank_refcount);
> >
> >       /* Slave encoders don't report vblank */
> > @@ -275,6 +276,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
> >       }
> >
> >  end:
> > +     mutex_unlock(phys_enc->vblank_ctl_lock);
> >       if (ret) {
> >               DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
> >                         DRMID(phys_enc->parent),
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 8e905d7267f9f..87bb49763785d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -364,6 +364,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >       int ret = 0;
> >       int refcount;
> >
> > +     mutex_lock(phys_enc->vblank_ctl_lock);
> >       refcount = atomic_read(&phys_enc->vblank_refcount);
> >
> >       /* Slave encoders don't report vblank */
> > @@ -394,6 +395,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
> >       }
> >
> >  end:
> > +     mutex_unlock(phys_enc->vblank_ctl_lock);
> >       if (ret) {
> >               DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
> >                         DRMID(phys_enc->parent),
> > --
> > 2.41.0
> >
> >



-- 
With best wishes
Dmitry

