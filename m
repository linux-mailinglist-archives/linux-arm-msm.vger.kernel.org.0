Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8A016EF30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 20:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729894AbgBYTlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 14:41:16 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37049 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgBYTlQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 14:41:16 -0500
Received: by mail-ed1-f66.google.com with SMTP id t7so789945edr.4;
        Tue, 25 Feb 2020 11:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ag9UfCbOttlLWSx+g2xd6gLmO4m6wnF3cbni4nCtO7Y=;
        b=V8TrvqBbaJHYBRfkST5wos2DdVNXVbzpHvUlruLy78zRsXEOLIchDDhCTiFkeTlipa
         UnbsoiETIP2R9mNBKUk2MHJgGwBWrBjvXvs3Oeu3SclB/Kgz2W4Rf1aJXitnIeFLjdGk
         Wr7JyIqIfoQ6s9Z7gsVEjvkhKvz0N7aO5KHyHcFnJbjk9NQP9b/PLkIosYu0h/FG+sMv
         smOBeGaolT3N+BzP3SYTKCkF5w0iBAfUGO8kK0nzkuqi+Ri+/rkB8e0p02toyLxsgmVO
         wrHshvXwyq6TnpYIGcUlyCL5x7HvDiOHIEz6rSbKsu88m2olWhnyXEaOrUSLJsep53mw
         KETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ag9UfCbOttlLWSx+g2xd6gLmO4m6wnF3cbni4nCtO7Y=;
        b=AZp7Bu+0z4GLaQ/HI62uLQQZa+tpHAsr9RVdZeNHkkVW97VZQRpG8MdV2bjaYC05fn
         ZqalFhSdaMIQ1P61wtxhBvEJ8FReV26W5IRAXF/AojGyoT4uBEJRhSAiYLWlIJbKgDGu
         3CqteSO4AxbM7WLIVFUAkp9PlHQ3WE34lDrArK4zmREHnHyqGh5tKv7+j+u/QKHshLBV
         6Q7ktXGNg6dwxBM2azVGnzznX0rCvRvX+jnaA1hPvGoCIIbGzUHaO1kMUDTxG9LKx2KH
         TfG3kKyde1uffr5k/9Ay/V/10FRviaViypJOw6nJx77Z4rh5GuRuqhpX78PLk4aLo7yI
         WAbA==
X-Gm-Message-State: APjAAAU5GLPcbVtgWAk7mrjQ6we1RFC/ipRc0q6Y3cAJu55VmR4X3Vmb
        2PVUbe+O5H0lokEABe6TYi8tsnhgHNXXjHBeMwQ=
X-Google-Smtp-Source: APXvYqzq12vZfTdfYHSsHJzicdcHsX7ksLKD0D4k9tbOBcL5ZakgsvyPPnbhVC7JEh5rajsfyPGJRZXVBqHGOurrABs=
X-Received: by 2002:a50:e3c5:: with SMTP id c5mr576813edm.7.1582659673599;
 Tue, 25 Feb 2020 11:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
 <20200219104148.2.I2c848e8f8ab1bcd4042d8ebcf35de737cceec5fe@changeid> <158265922943.177367.14293328114795800228@swboyd.mtv.corp.google.com>
In-Reply-To: <158265922943.177367.14293328114795800228@swboyd.mtv.corp.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 25 Feb 2020 11:41:06 -0800
Message-ID: <CAF6AEGu6Ys_t38uXNw3-Po1jaQmW3pOvAiZ73axpiAgCjvtC=g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dpu: Refactor rm iterator
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Drew Davenport <ddavenport@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Fritz Koenig <frkoenig@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhengbin <zhengbin13@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 25, 2020 at 11:33 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Drew Davenport (2020-02-19 09:42:25)
> > Make iterator implementation private, and add function to
> > query resources assigned to an encoder.
> >
> > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index f8ac3bf60fd60..6cadeff456f09 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -957,11 +957,11 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> >         struct drm_connector *conn = NULL, *conn_iter;
> >         struct drm_crtc *drm_crtc;
> >         struct dpu_crtc_state *cstate;
> > -       struct dpu_rm_hw_iter hw_iter;
> >         struct msm_display_topology topology;
> > -       struct dpu_hw_ctl *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
> > -       struct dpu_hw_mixer *hw_lm[MAX_CHANNELS_PER_ENC] = { NULL };
> > -       int num_lm = 0, num_ctl = 0;
> > +       struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > +       struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +       int num_lm, num_ctl, num_pp;
>
> All these should be unsigned too?
>
> >         int i, j, ret;
> >
> >         if (!drm_enc) {
> > @@ -1005,42 +1005,31 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> >                 return;
> >         }
> >
> > -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_PINGPONG);
> > -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> > -               dpu_enc->hw_pp[i] = NULL;
> > -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> > -                       break;
> > -               dpu_enc->hw_pp[i] = (struct dpu_hw_pingpong *) hw_iter.hw;
> > -       }
> > -
> > -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_CTL);
> > -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> > -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> > -                       break;
> > -               hw_ctl[i] = (struct dpu_hw_ctl *)hw_iter.hw;
>
> Why cast? Isn't it void pointer?

Comments on code that the patch removes is a new thing :-P

BR,
-R

>
> > -               num_ctl++;
> > -       }
> > +       num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> > +               DPU_HW_BLK_PINGPONG, hw_pp, ARRAY_SIZE(hw_pp));
> > +       num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> > +               DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +       num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
> > +               DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> >
> > -       dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id, DPU_HW_BLK_LM);
> > -       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> > -               if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> > -                       break;
> > -               hw_lm[i] = (struct dpu_hw_mixer *)hw_iter.hw;
>
> Why cast?
>
> > -               num_lm++;
> > -       }
> > +       for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > +               dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > +                                               : NULL;
>
> This line is pretty hard to read. Maybe use an if/else?
>
> >
> >         cstate = to_dpu_crtc_state(drm_crtc->state);
> >
> >         for (i = 0; i < num_lm; i++) {
> >                 int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> >
> > -               cstate->mixers[i].hw_lm = hw_lm[i];
> > -               cstate->mixers[i].lm_ctl = hw_ctl[ctl_idx];
> > +               cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> > +               cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> >         }
> >
> >         cstate->num_mixers = num_lm;
> >
> >         for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +               int num_blk;
>
> unsigned int?
>
> > +               struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
> >                 struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> >
> >                 if (!dpu_enc->hw_pp[i]) {
> > @@ -1056,17 +1045,15 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> >                 }
> >
> >                 phys->hw_pp = dpu_enc->hw_pp[i];
> > -               phys->hw_ctl = hw_ctl[i];
> > +               phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
> >
> > -               dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
> > -                                   DPU_HW_BLK_INTF);
> > -               for (j = 0; j < MAX_CHANNELS_PER_ENC; j++) {
> > +               num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
> > +                       drm_enc->base.id, DPU_HW_BLK_INTF, hw_blk,
> > +                       ARRAY_SIZE(hw_blk));
> > +               for (j = 0; j < num_blk; j++) {
> >                         struct dpu_hw_intf *hw_intf;
> >
> > -                       if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
> > -                               break;
> > -
> > -                       hw_intf = (struct dpu_hw_intf *)hw_iter.hw;
> > +                       hw_intf = to_dpu_hw_intf(hw_blk[i]);
> >                         if (hw_intf->idx == phys->intf_idx)
> >                                 phys->hw_intf = hw_intf;
> >                 }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index dea1dba441fe7..779df26dc81ae 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -83,7 +97,7 @@ static bool _dpu_rm_get_hw_locked(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
> >         return false;
> >  }
> >
> > -bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
> > +static bool dpu_rm_get_hw(struct dpu_rm *rm, struct dpu_rm_hw_iter *i)
> >  {
> >         bool ret;
> >
> > @@ -635,3 +649,16 @@ int dpu_rm_reserve(
> >
> >         return ret;
> >  }
> > +
> > +int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
>
> Return unsigned int?
>
> > +       enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
>
> unsigned int blks_size?
>
> > +{
> > +       struct dpu_rm_hw_iter hw_iter;
> > +       int num_blks = 0;
>
> unsigned int?
>
> > +
> > +       dpu_rm_init_hw_iter(&hw_iter, enc_id, type);
> > +       while (num_blks < blks_size && dpu_rm_get_hw(rm, &hw_iter))
> > +               blks[num_blks++] = hw_iter.blk->hw;
> > +
> > +       return num_blks;
>
> It's not possible for it to be negative number right?
>
> > +}
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index 9c580a0170946..982b91e272275 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -24,26 +24,6 @@ struct dpu_rm {
> >         struct mutex rm_lock;
> >  };
> >
> > -/**
> > - *  struct dpu_rm_hw_blk - resource manager internal structure
> > - *     forward declaration for single iterator definition without void pointer
> > - */
> > -struct dpu_rm_hw_blk;
> > -
> > -/**
> > - * struct dpu_rm_hw_iter - iterator for use with dpu_rm
> > - * @hw: dpu_hw object requested, or NULL on failure
> > - * @blk: dpu_rm internal block representation. Clients ignore. Used as iterator.
> > - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
>
> Why is Encoder and Any capitalized?
>
> > - * @type: Hardware Block Type client wishes to search for.
> > - */
> > -struct dpu_rm_hw_iter {
> > -       void *hw;
> > -       struct dpu_rm_hw_blk *blk;
> > -       uint32_t enc_id;
> > -       enum dpu_hw_blk_type type;
> > -};
> > -
> >  /**
> >   * dpu_rm_init - Read hardware catalog and create reservation tracking objects
> >   *     for all HW blocks.
> > @@ -93,28 +73,9 @@ int dpu_rm_reserve(struct dpu_rm *rm,
> >  void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc);
> >
> >  /**
> > - * dpu_rm_init_hw_iter - setup given iterator for new iteration over hw list
> > - *     using dpu_rm_get_hw
> > - * @iter: iter object to initialize
> > - * @enc_id: DRM ID of Encoder client wishes to search for, or 0 for Any Encoder
> > - * @type: Hardware Block Type client wishes to search for.
>
> Ah I guess it's copied from here.
