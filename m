Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73340701E5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 May 2023 19:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjENRCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 May 2023 13:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjENRCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 May 2023 13:02:50 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C27359E
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 10:02:49 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-559debdedb5so178506117b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 May 2023 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684083768; x=1686675768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HemADSWG6TbTWJTVcnnzd18/y0jetxsoQACmcYyLEA=;
        b=ZUyOmZTzMm8ibiR+r9wArf5nURp7oGX95YU93GkqfiPa+tcBaLg4MgplXdvCWySa/5
         HIeIPOy/7Aso7A16FrO0rzlOLnYADrJCcvg8LyUQdKlpV8Gdunl6H7lFIy28ZiahbEtn
         J7FiK67mDBcPRI1AoXTC8wy9ll73EPAyfFYe3RIMYmkItKMRIsoypIMjWGhOgmAzQ5Rz
         9bKgaCAfwA1+2Lay2AjeMxityHFAPADOh2IL4IT4e7EoDe/yHEVrJF4HN0ryuLc4A+M0
         c1iBCrbj89SrKl7jEyPxJPiE4ZHP/fO5yQZRLpp+eDWp2FLQCdk+0WjsZcHd1n8vOiNm
         vfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684083768; x=1686675768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HemADSWG6TbTWJTVcnnzd18/y0jetxsoQACmcYyLEA=;
        b=P7AL+YKvV6BElmShz7xEXDxhUhiId9LWT4HrfojPRTx96LNoVS/MZIo3IvDQFkYQ9V
         RJmke1qsSwwKz12ViT0mqZlBICSFgBMnpAkE1Z1orO+V/fve9rlDtOdUmRbisACt67kZ
         TKoUUQqh5JnzY5dwwViqGRfb+hyIAdMh1wO9gjkZ5Z7DEX5ZNFrlnwshfRBLzw/IFACH
         mV0RzTk9DWG8PnoNuqeE6q8g90122o9xHL1PPPdUv1em1cd/l8NCyrKFK5OUegpef9By
         NLYbo7K41KcXAW/WGYMovqhdt5iqC/N3zWqyf+2jEmZfa3X8vMkGyzje7Qg079AilsCE
         Dl3g==
X-Gm-Message-State: AC+VfDxnR2LJem1FMHrz2upuiFs0RLIzwHPenjXFyZLsrX9NZUi06XxE
        TJzITZyLqusypUHaf7ONwQV/GfHcEb/6wWr07oq4Lw==
X-Google-Smtp-Source: ACHHUZ5DaioK1TXRd33tj9Kq922BXwIOeOuZeQ+C1hGTFrXRYbkZdsBOYes41MZx10122HrPjXThSxAGXdK/gwcjNqk=
X-Received: by 2002:a0d:e6d5:0:b0:55a:30f5:3d65 with SMTP id
 p204-20020a0de6d5000000b0055a30f53d65mr31086924ywe.41.1684083768354; Sun, 14
 May 2023 10:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-4-dmitry.baryshkov@linaro.org> <47ade353-a46a-9f10-f712-4d5502e03ce1@quicinc.com>
In-Reply-To: <47ade353-a46a-9f10-f712-4d5502e03ce1@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 14 May 2023 20:02:37 +0300
Message-ID: <CAA8EJprczWqZ9uDPujw0JbOVW6A5+NcF_isnzDmheomRg3MQjw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/13] drm/msm/dpu: encoder: simplify debugfs handling
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 13 May 2023 at 01:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > As the debugfs is fully cleared on drm device removal, drop the
> > encoder-specific cleanup function, remove debugfs_root from dpu_encoder
> > struct and also remove phys_encoder late_register() ops which has been
> > unused since the driver being added.
> >
>
> Agreed, late_register of encoder_phys is unused, so we can drop that.
>
> For the other two things which this patch does:
>
> 1) remove debugfs_root from dpu_encoder
> 2) remove early_unregister of dpu_encoder
>
> I think this has been posted separately here
> https://patchwork.freedesktop.org/patch/534802/?series=117150&rev=1 for
> which I had given my feedback about why it cant be removed

Sure. And this patch predates your feedback.

>
> So these 2 parts have to be kept till we sort out that feedback
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 +++----------------
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ---
> >   2 files changed, 3 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 97d8d777f178..28729c77364f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -142,7 +142,6 @@ enum dpu_enc_rc_states {
> >    * @crtc_kickoff_cb:                Callback into CRTC that will flush & start
> >    *                          all CTL paths
> >    * @crtc_kickoff_cb_data:   Opaque user data given to crtc_kickoff_cb
> > - * @debugfs_root:            Debug file system root file node
> >    * @enc_lock:                       Lock around physical encoder
> >    *                          create/destroy/enable/disable
> >    * @frame_busy_mask:                Bitmask tracking which phys_enc we are still
> > @@ -186,7 +185,6 @@ struct dpu_encoder_virt {
> >       struct drm_crtc *crtc;
> >       struct drm_connector *connector;
> >
> > -     struct dentry *debugfs_root;
> >       struct mutex enc_lock;
> >       DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> >       void (*crtc_frame_event_cb)(void *, u32 event);
> > @@ -2134,7 +2132,7 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> >   static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >   {
> >       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > -     int i;
> > +     struct dentry *debugfs_root;
> >
> >       char name[DPU_NAME_SIZE];
> >
> > @@ -2146,18 +2144,12 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >       snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
> >
> >       /* create overall sub-directory for the encoder */
> > -     dpu_enc->debugfs_root = debugfs_create_dir(name,
> > +     debugfs_root = debugfs_create_dir(name,
> >                       drm_enc->dev->primary->debugfs_root);
> >
> >       /* don't error check these */
> >       debugfs_create_file("status", 0600,
> > -             dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> > -
> > -     for (i = 0; i < dpu_enc->num_phys_encs; i++)
> > -             if (dpu_enc->phys_encs[i]->ops.late_register)
> > -                     dpu_enc->phys_encs[i]->ops.late_register(
> > -                                     dpu_enc->phys_encs[i],
> > -                                     dpu_enc->debugfs_root);
> > +             debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> >
> >       return 0;
> >   }
> > @@ -2173,13 +2165,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
> >       return _dpu_encoder_init_debugfs(encoder);
> >   }
> >
> > -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> > -
> > -     debugfs_remove_recursive(dpu_enc->debugfs_root);
> > -}
> > -
> >   static int dpu_encoder_virt_add_phys_encs(
> >               struct msm_display_info *disp_info,
> >               struct dpu_encoder_virt *dpu_enc,
> > @@ -2406,7 +2391,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> >   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> >               .destroy = dpu_encoder_destroy,
> >               .late_register = dpu_encoder_late_register,
> > -             .early_unregister = dpu_encoder_early_unregister,
> >   };
> >
> >   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 1d434b22180d..9e29079a6fc4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -63,7 +63,6 @@ struct dpu_encoder_phys;
> >   /**
> >    * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
> >    *  the containing virtual encoder.
> > - * @late_register:           DRM Call. Add Userspace interfaces, debugfs.
> >    * @prepare_commit:         MSM Atomic Call, start of atomic commit sequence
> >    * @is_master:                      Whether this phys_enc is the current master
> >    *                          encoder. Can be switched at enable time. Based
> > @@ -93,8 +92,6 @@ struct dpu_encoder_phys;
> >    */
> >
> >   struct dpu_encoder_phys_ops {
> > -     int (*late_register)(struct dpu_encoder_phys *encoder,
> > -                     struct dentry *debugfs_root);
> >       void (*prepare_commit)(struct dpu_encoder_phys *encoder);
> >       bool (*is_master)(struct dpu_encoder_phys *encoder);
> >       void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,



-- 
With best wishes
Dmitry
