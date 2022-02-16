Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4114B7DEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbiBPCWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:22:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239898AbiBPCWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:22:42 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DF1EF787
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:22:29 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso932337ooi.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=fK8Mmhno7fLan6TDKNBId+rzPxNl521LefBZ7ENEERM=;
        b=Tu1Au4lnq1UJyXBeqnsLeFbw8EaG4GbmxIUlt7svJCU5uTPzGtBJlwFoJJrtt7yrtO
         9VA4f5mOw1mNlqn4q2kDkG/yRstq7Zfiru3dRcBqygJD6BeE6kioElcckVEu6+F8rtBL
         1toixeet31wCEU5P9kJzO5SIS7RtAEADHB+s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=fK8Mmhno7fLan6TDKNBId+rzPxNl521LefBZ7ENEERM=;
        b=0ef7LivzAD1q7n5nqRH8q8fPD8sKUfyyAYDT/Sfvrr0Oahg2HuG/XZW6JyYawsaBQq
         l1D+pzowk+gj4Lu9R38TNovjc20Hb3kynWLbwWKndDwpOqdajPHEU3nlPs5W5rgJB1dc
         Cmm7BiO5gg+ol2xx/sGkBTkkDZ18fy5X8Qko+TjPk0W8FXYsqkhLW4RxH121Nrm5r+sz
         /95vI627eU4Nd7qCN6LRJg05YCjqQD14BbnyiwuQKgYDcBfLpm0pTUpWHN9mflVYc435
         gjBxVv3wXRFczx0hLXwRSqLVRpRVTHBYqkWEYSKgT17na4nR/HxA9qmDOmGUFgmsE4L1
         RRSQ==
X-Gm-Message-State: AOAM531R6syMBCsb0h/nLhqm4a2pim/gN614YIlYkqu98GTv2SwWLemA
        y0ffRIhhDFdaKIRf4jFOjo4n1fRNjSUtPn7jwkg1sw==
X-Google-Smtp-Source: ABdhPJyjTYdIHsZuJ13hWO4CixvXg+H94za0iiOclD6oXF5Mh6GJpUPdUk1fk5or2G1mP8ewQeY5KV6BrvCV3C/kh+o=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr289535oao.8.1644978147558; Tue, 15 Feb
 2022 18:22:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:22:27 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org> <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:22:27 -0800
Message-ID: <CAE-0n50p7nxqger_9i22TnWACNM4SM5OP+f9mS7wUZwi1dP1Ag@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dpu: remove struct dpu_encoder_irq
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-01 07:10:55)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ff2218155b44..803fd6f25da1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -231,7 +216,7 @@ struct dpu_encoder_phys {
>         atomic_t pending_ctlstart_cnt;
>         atomic_t pending_kickoff_cnt;
>         wait_queue_head_t pending_kickoff_wq;
> -       struct dpu_encoder_irq irq[INTR_IDX_MAX];
> +       int irq[INTR_IDX_MAX];
>  };
>
>  static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> @@ -729,20 +727,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>         phys_enc->split_role = p->split_role;
>         phys_enc->intf_mode = INTF_MODE_VIDEO;
>         phys_enc->enc_spinlock = p->enc_spinlock;
> -       for (i = 0; i < INTR_IDX_MAX; i++) {
> -               irq = &phys_enc->irq[i];
> -               irq->irq_idx = -EINVAL;
> -       }
> -
> -       irq = &phys_enc->irq[INTR_IDX_VSYNC];
> -       irq->name = "vsync_irq";
> -       irq->intr_idx = INTR_IDX_VSYNC;
> -       irq->func = dpu_encoder_phys_vid_vblank_irq;
> -
> -       irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -       irq->name = "underrun";
> -       irq->intr_idx = INTR_IDX_UNDERRUN;
> -       irq->func = dpu_encoder_phys_vid_underrun_irq;
> +       for (i = 0; i < INTR_IDX_MAX; i++)

Can this use ARRAY_SIZE(phys_enc->irq)? Safer that way.

> +               phys_enc->irq[i] = -EINVAL;
>
>         atomic_set(&phys_enc->vblank_refcount, 0);
>         atomic_set(&phys_enc->pending_kickoff_cnt, 0);
