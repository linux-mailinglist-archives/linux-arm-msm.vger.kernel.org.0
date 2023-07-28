Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4AE767014
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 17:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbjG1PDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 11:03:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbjG1PDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 11:03:53 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7210E35B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 08:03:47 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b9ec15e014so1932878a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690556627; x=1691161427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhqa2w8iasInJcL6NfmDWggtya4x/gTdfth4NOfkcIA=;
        b=f5EeD/0Qal4yo4m3suCQs3YG1D/VLomBpFDw9xj0A7t07LwN0QPcbpwdPVkFatfl0y
         c9StDwt03B+f8wulscLZx1u8cxIGW3ynQB9ceW46R6wY0PjmYOznOseU+AzmC333avMC
         emrRUkwKimgA+8nNxOQmnE74VFJ4jJ6DrdRHbiR7kZY6nQ6l2mxfpPa/R6BWOiEBQwuU
         qvMKjCNacvaf1FfwaRoKke0da9vxY9rcLlYHOV2Y7FwEuc5/hh030AkVxM0xLy7Rum4w
         8vj+DqXTH0t3iy6/LzfhCXbmnkFRy51WFnGtN1LcuQhhVXWo/7Zz+MU3TdJjvJI6Qpch
         3vxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690556627; x=1691161427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhqa2w8iasInJcL6NfmDWggtya4x/gTdfth4NOfkcIA=;
        b=Tet5mVMZVMXEQBryYIOc9GV55F4BLPDHChedgvXrMq1D7RfB319UOdp7qyfjVzmYaM
         2r6sL0R87rghGhfyAmGhA5sOKrXwna6mgaNIFxIiLWlXgSMLeX/+Ki9pb3xt2ATrw0u5
         cEGF6Qu+Yqad+97Xe5dRLIszTkhU5O9Ye71FvJYS4lZO7LWjq+Ny2/Tn3ffjr8/N1uyN
         tD4AV7wjI6wT0jcn2KTcpShN+oBOuUSShekQ8IISedRoffyu0p0KKOwaxIaG6Jld1YYi
         Ho3kzX9SGstEQiwMVPmFtcSc1uvSNUQ++4/nWD6Y8DKMrqgm9zdAvZcBtXLRfnFUgjmR
         EPiw==
X-Gm-Message-State: ABy/qLYfvDaJiXuAyp4UbbCNiZLgsi3jrTvR52LfzZHBzOJ6j1TnwbRr
        i93/tu7qxn9K3iG5qWZhGdmsBknIV1+nIhePU1RujA==
X-Google-Smtp-Source: APBJJlGD5qVFTktEkAOS8dMWSFoYtIk27ZXfPzVdxaTXjsxXLN5k6FzMJcaD8f1NOhEA4FasS5uhbJtxNVtTduied9g=
X-Received: by 2002:a9d:6205:0:b0:6af:9b42:9794 with SMTP id
 g5-20020a9d6205000000b006af9b429794mr2706273otj.35.1690556626707; Fri, 28 Jul
 2023 08:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-5-dmitry.baryshkov@linaro.org> <dzqrazaaedomrvdr6xjawzc75zy2whp7nyfuzwsamd22bvbpzq@wdv7k3vpovgf>
In-Reply-To: <dzqrazaaedomrvdr6xjawzc75zy2whp7nyfuzwsamd22bvbpzq@wdv7k3vpovgf>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Jul 2023 18:03:35 +0300
Message-ID: <CAA8EJpqPa8uAqQ3r929Js1b8vYfEhjvEXBNCan8faS08AtOZaw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: shift IRQ indices by 1
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Jul 2023 at 22:58, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Title nit: How about making this "UP by 1"?
>
> On 2023-07-27 18:04:55, Dmitry Baryshkov wrote:
> > In order to simplify IRQ declarations, shift IRQ indices by 1. This
>
> Same here, UP by one.
>
> > makes 0 the 'no IRQ' value. Thanks to this change, we do no longer have
> > to explicitly set the 'no interrupt' fields in catalog structures.
>
> "explicitly set unused interrupts to -1" or
> "explicitly signifiy 'no interrupt' fields with -1"?
>
> On the other hand this might be confusing since -1 thanks to this patch
> no longer means 'no interrupt'.  Also okay to leave it as-is.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  4 --
> >  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  4 --
> >  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  8 ---
> >  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 10 ----
> >  .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  3 --
> >  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  8 ---
> >  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  3 --
> >  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 -
> >  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  3 --
> >  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 -
> >  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  1 -
> >  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  8 ---
> >  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 ---
> >  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 13 -----
> >  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 12 -----
> >  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 12 -----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  6 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 14 +++---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 +++++++++----------
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 +--
> >  22 files changed, 39 insertions(+), 137 deletions(-)
> >
>
> <cut out all the repeated catalog changes>
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > index ba06312cbb16..7c286bafb948 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> > @@ -37,7 +37,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
> >   */
> >  u32 dpu_core_irq_read(
> >               struct dpu_kms *dpu_kms,
> > -             int irq_idx);
> > +             unsigned int irq_idx);
> >
> >  /**
> >   * dpu_core_irq_register_callback - For registering callback function on IRQ
> > @@ -52,7 +52,7 @@ u32 dpu_core_irq_read(
> >   */
> >  int dpu_core_irq_register_callback(
> >               struct dpu_kms *dpu_kms,
> > -             int irq_idx,
> > +             unsigned int irq_idx,
> >               void (*irq_cb)(void *arg),
> >               void *irq_arg);
> >
> > @@ -67,7 +67,7 @@ int dpu_core_irq_register_callback(
> >   */
> >  int dpu_core_irq_unregister_callback(
> >               struct dpu_kms *dpu_kms,
> > -             int irq_idx);
> > +             unsigned int irq_idx);
> >
> >  /**
> >   * dpu_debugfs_core_irq_init - register core irq debugfs
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 051447a3620c..8ccfeb002b5f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2555,7 +2555,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
> >       phys_enc->enable_state = DPU_ENC_DISABLED;
> >
> >       for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
> > -             phys_enc->irq[i] = -EINVAL;
> > +             phys_enc->irq[i] = 0;
>
> phys_enc seems to always be kzalloc'ed before it is passed here, so
> maybe we don't need to change the initialization value at all unless you
> want to be super-specific.  And could memset() otherwise create faster
> code?

Sure, I should probably drop this.

>
> >
> >       atomic_set(&phys_enc->vblank_refcount, 0);
> >       atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index f91661a69888..e203f3775ed3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -193,7 +193,7 @@ struct dpu_encoder_phys {
> >       atomic_t pending_ctlstart_cnt;
> >       atomic_t pending_kickoff_cnt;
> >       wait_queue_head_t pending_kickoff_wq;
> > -     int irq[INTR_IDX_MAX];
> > +     unsigned int irq[INTR_IDX_MAX];
> >       bool has_intf_te;
> >  };
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index c72ed0e35dce..945b88c5ab58 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -524,7 +524,7 @@ struct dpu_ubwc_cfg {
> >   */
> >  struct dpu_ctl_cfg {
> >       DPU_HW_BLK_INFO;
> > -     s32 intr_start;
> > +     unsigned int intr_start;
> >  };
> >
> >  /**
> > @@ -587,8 +587,8 @@ struct dpu_dspp_cfg  {
> >  struct dpu_pingpong_cfg  {
> >       DPU_HW_BLK_INFO;
> >       u32 merge_3d;
> > -     s32 intr_done;
> > -     s32 intr_rdptr;
> > +     unsigned int intr_done;
> > +     unsigned int intr_rdptr;
> >       const struct dpu_pingpong_sub_blks *sblk;
> >  };
> >
> > @@ -635,9 +635,9 @@ struct dpu_intf_cfg  {
> >       u32 type;   /* interface type*/
> >       u32 controller_id;
> >       u32 prog_fetch_lines_worst_case;
> > -     s32 intr_underrun;
> > -     s32 intr_vsync;
> > -     s32 intr_tear_rd_ptr;
> > +     unsigned int intr_underrun;
> > +     unsigned int intr_vsync;
> > +     unsigned int intr_tear_rd_ptr;
> >  };
> >
> >  /**
> > @@ -656,7 +656,7 @@ struct dpu_wb_cfg {
> >       u8 vbif_idx;
> >       u32 maxlinewidth;
> >       u32 xin_id;
> > -     s32 intr_wb_done;
> > +     unsigned int intr_wb_done;
> >       const u32 *format_list;
> >       u32 num_formats;
> >       enum dpu_clk_ctrl_type clk_ctrl;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index ede7161ae904..47f6912ac39e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -200,7 +200,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
> >  #define DPU_IRQ_MASK(irq_idx)        (BIT(DPU_IRQ_OFFSET(irq_idx)))
> >
> >  static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *dpu_kms,
> > -                                                            int irq_idx)
> > +                                                            unsigned int irq_idx)
> >  {
> >       return &dpu_kms->hw_intr->irq_tbl[irq_idx];
>
> Shouldn't this be -1'd, or should the struct size of this trailing array
> be incremented by one in the nirq variable in dpu_hw_intr_init()?
>
> Note that total_irqs = nirq.

Ugh, yes.

>
> >  }
> > @@ -210,7 +210,7 @@ static inline struct dpu_hw_intr_entry *dpu_core_irq_get_entry(struct dpu_kms *d
> >   * @dpu_kms:         Pointer to DPU's KMS structure
> >   * @irq_idx:         interrupt index
> >   */
> > -static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
> > +static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int irq_idx)
> >  {
> >       struct dpu_hw_intr_entry *irq_entry = dpu_core_irq_get_entry(dpu_kms, irq_idx);
> >
> > @@ -232,7 +232,7 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
> >       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> >       struct dpu_hw_intr *intr = dpu_kms->hw_intr;
> >       int reg_idx;
> > -     int irq_idx;
> > +     unsigned int irq_idx;
> >       u32 irq_status;
> >       u32 enable_mask;
> >       int bit;
> > @@ -288,7 +288,8 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms)
> >       return IRQ_HANDLED;
> >  }
> >
> > -static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
> > +static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr,
> > +                                      unsigned int irq_idx)
> >  {
> >       int reg_idx;
> >       const struct dpu_intr_reg *reg;
> > @@ -298,7 +299,7 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
> >       if (!intr)
> >               return -EINVAL;
> >
> > -     if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> > +     if (!irq_idx || irq_idx > intr->total_irqs) {
> >               pr_err("invalid IRQ index: [%d]\n", irq_idx);
>
> Logs like this might be harder to interpret (and compare) when the
> numbering is different.  In addition, all the IRQs in
> /d/dri/0/debug/core_irq are shifted up by 1 making them harder to
> compare to downstream.
> (Which I hope to not have to do again for a while, now that my INTF TE
>  series is finalized and merged)

I hesitated here. Maybe we should log the register and index instead
of logging the raw index.

As for the core_irq vs downstream, that's a good question. I don't
like the idea of adding -1 there. Maybe I'll change that again to
register + index.

>
> Rest looks good, nice cleanup and lightening of the source.
>
> - Marijn
>
> >               return -EINVAL;
> >       }
> > @@ -341,7 +342,8 @@ static int dpu_hw_intr_enable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
> >       return 0;
> >  }
> >
> > -static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
> > +static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr,
> > +                                       unsigned int irq_idx)
> >  {
> >       int reg_idx;
> >       const struct dpu_intr_reg *reg;
> > @@ -351,7 +353,7 @@ static int dpu_hw_intr_disable_irq_locked(struct dpu_hw_intr *intr, int irq_idx)
> >       if (!intr)
> >               return -EINVAL;
> >
> > -     if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> > +     if (!irq_idx || irq_idx > intr->total_irqs) {
> >               pr_err("invalid IRQ index: [%d]\n", irq_idx);
> >               return -EINVAL;
> >       }
> > @@ -426,7 +428,8 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
> >       wmb();
> >  }
> >
> > -u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
> > +u32 dpu_core_irq_read(struct dpu_kms *dpu_kms,
> > +                   unsigned int irq_idx)
> >  {
> >       struct dpu_hw_intr *intr = dpu_kms->hw_intr;
> >       int reg_idx;
> > @@ -436,13 +439,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
> >       if (!intr)
> >               return 0;
> >
> > -     if (irq_idx < 0) {
> > -             DPU_ERROR("[%pS] invalid irq_idx=%d\n",
> > -                             __builtin_return_address(0), irq_idx);
> > -             return 0;
> > -     }
> > -
> > -     if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
> > +     if (!irq_idx || irq_idx > intr->total_irqs) {
> >               pr_err("invalid IRQ index: [%d]\n", irq_idx);
> >               return 0;
> >       }
> > @@ -499,7 +496,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> >
> >               intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
> >
> > -             if (intf->intr_tear_rd_ptr != -1)
> > +             if (intf->intr_tear_rd_ptr)
> >                       intr->irq_mask |= BIT(DPU_IRQ_REG(intf->intr_tear_rd_ptr));
> >       }
> >
> > @@ -513,9 +510,10 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
> >       kfree(intr);
> >  }
> >
> > -int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> > -             void (*irq_cb)(void *arg),
> > -             void *irq_arg)
> > +int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
> > +                                unsigned int irq_idx,
> > +                                void (*irq_cb)(void *arg),
> > +                                void *irq_arg)
> >  {
> >       struct dpu_hw_intr_entry *irq_entry;
> >       unsigned long irq_flags;
> > @@ -526,7 +524,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >               return -EINVAL;
> >       }
> >
> > -     if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> > +     if (!irq_idx || irq_idx > dpu_kms->hw_intr->total_irqs) {
> >               DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> >               return -EINVAL;
> >       }
> > @@ -559,13 +557,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> >       return 0;
> >  }
> >
> > -int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
> > +int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms,
> > +                                  unsigned int irq_idx)
> >  {
> >       struct dpu_hw_intr_entry *irq_entry;
> >       unsigned long irq_flags;
> >       int ret;
> >
> > -     if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
> > +     if (!irq_idx || irq_idx > dpu_kms->hw_intr->total_irqs) {
> >               DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
> >               return -EINVAL;
> >       }
> > @@ -600,7 +599,7 @@ static int dpu_debugfs_core_irq_show(struct seq_file *s, void *v)
> >       int i, irq_count;
> >       void *cb;
> >
> > -     for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> > +     for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
> >               spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
> >               irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >               irq_count = atomic_read(&irq_entry->count);
> > @@ -635,7 +634,7 @@ void dpu_core_irq_preinstall(struct msm_kms *kms)
> >       dpu_disable_all_irqs(dpu_kms);
> >       pm_runtime_put_sync(&dpu_kms->pdev->dev);
> >
> > -     for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> > +     for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
> >               irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >               atomic_set(&irq_entry->count, 0);
> >       }
> > @@ -651,7 +650,7 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
> >               return;
> >
> >       pm_runtime_get_sync(&dpu_kms->pdev->dev);
> > -     for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++) {
> > +     for (i = 1; i <= dpu_kms->hw_intr->total_irqs; i++) {
> >               irq_entry = dpu_core_irq_get_entry(dpu_kms, i);
> >               if (irq_entry->cb)
> >                       DPU_ERROR("irq_idx=%d still enabled/registered\n", i);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > index 59bde8ab50c8..41a020fd1288 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > @@ -36,9 +36,9 @@ enum dpu_hw_intr_reg {
> >
> >  #define MDP_INTFn_INTR(intf) (MDP_INTF0_INTR + (intf - INTF_0))
> >
> > -#define DPU_IRQ_IDX(reg_idx, offset) (reg_idx * 32 + offset)
> > -#define DPU_IRQ_REG(irq_idx)         ((irq_idx) / 32)
> > -#define DPU_IRQ_OFFSET(irq_idx)              ((irq_idx) % 32)
> > +#define DPU_IRQ_IDX(reg_idx, offset) (reg_idx * 32 + offset + 1)
> > +#define DPU_IRQ_REG(irq_idx)         ((irq_idx - 1) / 32)
> > +#define DPU_IRQ_OFFSET(irq_idx)              ((irq_idx - 1) % 32)
> >
> >  struct dpu_hw_intr_entry {
> >       void (*cb)(void *arg);
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
