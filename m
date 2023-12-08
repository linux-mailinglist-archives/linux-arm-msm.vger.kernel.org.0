Return-Path: <linux-arm-msm+bounces-3932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388480A244
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54112B20989
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828F21B27B;
	Fri,  8 Dec 2023 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OUHOdOzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967C71735
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 03:33:21 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d34f8f211fso18874577b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702035200; x=1702640000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/JU0Aix+3eTJLA5VTicLCCippJlTJve3gMl1qQImHXo=;
        b=OUHOdOzrFNIcbM8X9r7GsQdPEE+i84I8+wuXiv9Zb02wNb2j98a1d2XL/dJu2sz8GL
         QdxyGrjodk+RzCFcoW7O9UuXF/ktCbtSa+lRNRjoK9Gh8khsEHmZI6lYgeK1WCJ2QZAq
         +Iq7aD5s6dptc71c89SbjwrARJqzHwasqBKHNIGwhsHrq111jmVr8RzKcTbAiBq+amaF
         noDxHjfz31eSnavkEYD5CA3gUW9Wr2ez6cajfIRMgjMWYekFAwEgB98CbtEYedMM4iMk
         4mZ8q5nc4mDvlzWQ8HHzn9vZK21BbH/FuSMMr/Wl1ht6vbayvoFHY7mRr7itZQgr3LKN
         DnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035200; x=1702640000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JU0Aix+3eTJLA5VTicLCCippJlTJve3gMl1qQImHXo=;
        b=S9FFM1vsF78R2daqPSVdgoe+H45x/sxWoaUQbNRr81bgkSIqa/y2c9g1CNj2us962S
         qu6YHqrlN9jU1kUuPphIWaAjGpc4LZtWyb/wl8uuPpUGGxCG79Kxyw4HyirfKCJ4lEah
         tb8Dg5v1nkaNzcELyx9p1fbya0JRnYXM6zow5RwJqsvBX7yQ1a5WjKdTVi266n9g8H/t
         DRXz8SFSVpPNYPE7eS4Wh0wO/dgcy20iuq+HXWJXAd6rRp7KJg5qesx1LeYk5Kafay9y
         25XCjLpxPM/ab5cf+8j34D04fUJjjx1XOwq1lvh5+cU3DWBcqOWbd/qWmbWq6BQQ68oh
         K8bg==
X-Gm-Message-State: AOJu0Yyz/RJsq9ZwBCta3/5iUjqPRvJqUC43TLKzt/UtooW0peeRezQC
	SjKW1dzMASHu+PjeDTbgWWboOu7RQVnaI6AI46/kLg==
X-Google-Smtp-Source: AGHT+IG926dy16YwagP5QBNbXqNoptmJLvVLG6OqY9cTBrpxcxKQB+Y9cblTj14KWw6m6Na1tgvvMZHS3Hl9xYt898U=
X-Received: by 2002:a81:a605:0:b0:5d7:1940:53e1 with SMTP id
 i5-20020a81a605000000b005d7194053e1mr3952459ywa.89.1702035200621; Fri, 08 Dec
 2023 03:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com> <20231208050641.32582-10-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-10-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:33:09 +0200
Message-ID: <CAA8EJpp0v0_0BRguZOskbtv69-OZ32uMtdnb7i4xLyhz=UR8og@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: add support to allocate CDM from RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Even though there is usually only one CDM block, it can be
> used by either HDMI, DisplayPort OR Writeback interfaces.
>
> Hence its allocation needs to be tracked properly by the
> resource manager to ensure appropriate availability of the
> block.
>
> changes in v2:
>         - move needs_cdm to topology struct
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 38 +++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_drv.h               |  2 ++
>  4 files changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 9db4cf61bd29..5df545904057 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
>         DPU_HW_BLK_DSPP,
>         DPU_HW_BLK_MERGE_3D,
>         DPU_HW_BLK_DSC,
> +       DPU_HW_BLK_CDM,
>         DPU_HW_BLK_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index df6271017b80..a0cd36e45a01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -135,6 +135,7 @@ struct dpu_global_state {
>         uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>         uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>         uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> +       uint32_t cdm_to_enc_id;
>  };
>
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 7ed476b96304..b58a9c2ae326 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -435,6 +435,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>         return 0;
>  }
>
> +static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc)
> +{
> +       /* try allocating only one CDM block */
> +       if (!rm->cdm_blk) {
> +               DPU_ERROR("CDM block does not exist\n");

Nit: maybe this should be an info or a warning instead?

> +               return -EIO;
> +       }
> +
> +       if (global_state->cdm_to_enc_id) {
> +               DPU_ERROR("CDM_0 is already allocated\n");
> +               return -EIO;
> +       }
> +
> +       global_state->cdm_to_enc_id = enc->base.id;
> +
> +       return 0;
> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> @@ -460,6 +480,14 @@ static int _dpu_rm_make_reservation(
>         if (ret)
>                 return ret;
>
> +       if (reqs->topology.needs_cdm) {
> +               ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> +               if (ret) {
> +                       DPU_ERROR("unable to find CDM blk\n");
> +                       return ret;
> +               }
> +       }
> +
>         return ret;
>  }
>
> @@ -470,9 +498,9 @@ static int _dpu_rm_populate_requirements(
>  {
>         reqs->topology = req_topology;
>
> -       DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> +       DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d cdm: %d\n",
>                       reqs->topology.num_lm, reqs->topology.num_dsc,
> -                     reqs->topology.num_intf);
> +                     reqs->topology.num_intf, reqs->topology.needs_cdm);
>
>         return 0;
>  }
> @@ -501,6 +529,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
>                 ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> @@ -574,6 +603,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                 hw_to_enc_id = global_state->dsc_to_enc_id;
>                 max_blks = ARRAY_SIZE(rm->dsc_blks);
>                 break;
> +       case DPU_HW_BLK_CDM:
> +               hw_blks = &rm->cdm_blk;
> +               hw_to_enc_id = &global_state->cdm_to_enc_id;
> +               max_blks = 1;
> +               break;
>         default:
>                 DPU_ERROR("blk type %d not managed by rm\n", type);
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a205127ccc93..1ebad634781c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -92,12 +92,14 @@ enum msm_event_wait {
>   * @num_intf:     number of interfaces the panel is mounted on
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> + * @needs_cdm:    indicates whether cdm block is needed for this display topology
>   */
>  struct msm_display_topology {
>         u32 num_lm;
>         u32 num_intf;
>         u32 num_dspp;
>         u32 num_dsc;
> +       bool needs_cdm;
>  };
>
>  /* Commit/Event thread specific structure */
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

