Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1C74B0A57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 11:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbiBJKPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 05:15:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237343AbiBJKPh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 05:15:37 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50812CEF
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:15:38 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id g145so4315999qke.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Oxr4BtBxQbn2HEUBPjm0QKnhPxO0TJTGMrTZ0Wq6Gk=;
        b=amOD3lovC3iBTYwE1fVliQbEyuCK3GAga6jxCemybi4xcjkrfsGSfFPdg7CyDsLLd1
         gUkYtdpo5+wamiYPcFUi+d5027UI3ItTmKu9yf3pu6zHqANrFqX/2veouMkP1vFooMuo
         wYswxPwfZyeSB/iHeTAz/0XyZcrCoa6jheeeazoDV6mKnWCu5/HnqFU7EY0e6Ok1mN/m
         lF7JSsuy5GjoPZtqoH9daVW1GzsNpOLlVccsMIF1NQlBFH8cfY73Hh4wCfkDnZSKNMzS
         9bv0iYuqxdX46vawwGullT1nMYoDe1XaG4wjTgxn1YI0SpupyGN9FFYHFIW5oMddk9x8
         Q1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Oxr4BtBxQbn2HEUBPjm0QKnhPxO0TJTGMrTZ0Wq6Gk=;
        b=VB45c2izVd1wFR3q0EXPSiLLNm4je2R26JIJ+g4EjUUpO02iYX/g+cXSriBqP5FuUq
         3W0wKNRFwSGWlKcsnO6GYA0EhqMjKwPAozrRSNkYm+/4OEgS5eFzt3E5lklkBTvLf9Jk
         xnYILGo2ny9h/3wX8RjYZhk7ZzzhC+LukTmkEssiSTkCerctIcqllcWet3m9Fkh62aNM
         bzJRSHZYU+PTA6vi5uE1T1lhfQQ6igU30PJGHKq3uJYLVdtk57BkebLR7BzEzxXFzxIL
         TRR0TPadLOM6PIJgUQIfEnYQ0Pgz1lS3wVC+NRFnPF3jBHrlRR1xhMV9dYI0dElnOxsm
         tWtA==
X-Gm-Message-State: AOAM5319QKWDgdtl3/Vb2hQAea1TLxiacIs4Bcp642JKB82YgWHiTCa0
        311lcBh6oWePegfKfQIjxt+cOXK+YTqCTa1Sb3Mo7w==
X-Google-Smtp-Source: ABdhPJyTqqQXAqv1dBvaLt02kyjpZCPl6S+JgzDVNbB5EDMVzHCJrIzhVp/s+3sz5a2WS7JQv0uPCrlUy0vPxoLbXkM=
X-Received: by 2002:a05:620a:2982:: with SMTP id r2mr3375706qkp.30.1644488137357;
 Thu, 10 Feb 2022 02:15:37 -0800 (PST)
MIME-Version: 1.0
References: <20220210063739.233634-1-vkoul@kernel.org> <20220210063739.233634-12-vkoul@kernel.org>
In-Reply-To: <20220210063739.233634-12-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 10 Feb 2022 13:15:26 +0300
Message-ID: <CAA8EJpqzLK-grZa7HtPR20UquLbD_fU32kZMWU-=ctW_t1dzHw@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] drm/msm/disp/dpu1: Add DSC support in RM
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Thu, 10 Feb 2022 at 09:38, Vinod Koul <vkoul@kernel.org> wrote:
>
> This add the bits in RM to enable the DSC blocks
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  1 +
>  3 files changed, 58 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4b7f5e..8f2fb667b05c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -146,6 +146,7 @@ struct dpu_global_state {
>         uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>         uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
>         uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
> +       uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
>  };
>
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9c83d6e427a..fbb24bb2b998 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -11,6 +11,7 @@
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_dsc.h"
>  #include "dpu_encoder.h"
>  #include "dpu_trace.h"
>
> @@ -75,6 +76,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                         dpu_hw_intf_destroy(hw);
>                 }
>         }
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> +               struct dpu_hw_dsc *hw;
> +
> +               if (rm->dsc_blks[i]) {
> +                       hw = to_dpu_hw_dsc(rm->dsc_blks[i]);
> +                       dpu_hw_dsc_destroy(hw);
> +               }
> +       }
>
>         return 0;
>  }
> @@ -221,6 +230,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>         }
>
> +       for (i = 0; i < cat->dsc_count; i++) {
> +               struct dpu_hw_dsc *hw;
> +               const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
> +
> +               hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
> +               if (IS_ERR_OR_NULL(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed dsc object creation: err %d\n", rc);
> +                       goto fail;
> +               }
> +               rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
> +       }
> +
>         return 0;
>
>  fail:
> @@ -476,6 +498,7 @@ static int _dpu_rm_reserve_intf(
>         }
>
>         global_state->intf_to_enc_id[idx] = enc_id;
> +
>         return 0;
>  }
>
> @@ -500,6 +523,28 @@ static int _dpu_rm_reserve_intf_related_hw(
>         return ret;
>  }
>
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc,
> +                              const struct msm_display_topology *top)
> +{
> +       int num_dsc = top->num_dsc;
> +       int i;
> +
> +       /* check if DSC required are allocated or not */
> +       for (i = 0; i < num_dsc; i++) {
> +               if (global_state->dsc_to_enc_id[i]) {
> +                       DPU_ERROR("DSC %d is already allocated\n", i);
> +                       return -EIO;
> +               }
> +       }
> +
> +       for (i = 0; i < num_dsc; i++)
> +               global_state->dsc_to_enc_id[i] = enc->base.id;
> +
> +       return 0;
> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> @@ -526,6 +571,10 @@ static int _dpu_rm_make_reservation(
>         if (ret)
>                 return ret;
>
> +       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> +       if (ret)
> +               return ret;
> +
>         return ret;
>  }
>
> @@ -567,6 +616,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->intf_to_enc_id,
>                 ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
> +               ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> @@ -640,6 +691,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                 hw_to_enc_id = global_state->dspp_to_enc_id;
>                 max_blks = ARRAY_SIZE(rm->dspp_blks);
>                 break;
> +       case DPU_HW_BLK_DSC:
> +               hw_blks = rm->dsc_blks;
> +               hw_to_enc_id = global_state->dsc_to_enc_id;
> +               max_blks = ARRAY_SIZE(rm->dsc_blks);
> +               break;
>         default:
>                 DPU_ERROR("blk type %d not managed by rm\n", type);
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 1f12c8d5b8aa..278d2a510b80 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -30,6 +30,7 @@ struct dpu_rm {
>         struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
>         struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>         struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
> +       struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>
>         uint32_t lm_max_width;
>  };
> --
> 2.31.1
>


-- 
With best wishes
Dmitry
