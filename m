Return-Path: <linux-arm-msm+bounces-4476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807FD80F9E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 23:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26CD01F2142A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 22:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6051E64CD4;
	Tue, 12 Dec 2023 22:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAZUR2i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B13B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:02:53 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5e263e43ff2so5729237b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 14:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702418573; x=1703023373; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5va/gPCgNC0errOCo8Y1RM9tetTiOLTIXZGwrbvFaII=;
        b=FAZUR2i4FcOrEYM5S9MK0KzQBMSBtVPXvWLAEWtjrNYFQGxJ3jiubQikJpIrZyWHDf
         O/0rL6xEKHcEUv8ts+ETs6zgc0SwTnVD+40sO2Pa1XQWkwJfuVcf/5zseFFsD1rnfV/D
         lIanTWMY0ZQxkXOhYrY4vSw8p5+6p28vfiHpGPFBvVa4Zb7Odu/blOXX7mmgfhiEGcAX
         vs2wPnJoWHM+m4QMkPOnbluCxqK1y/2Yfsoo/rkpSx8Vu2hCOvgOGzmhoamHqYPz2xJD
         9m2yKpewwabGgsZMIRTecUQbQM8b5TJRHBrMOJF+wzVDYbEW5e37R6HPGyMHPrd1LqZD
         1wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702418573; x=1703023373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5va/gPCgNC0errOCo8Y1RM9tetTiOLTIXZGwrbvFaII=;
        b=CURC/9G5B4LAW3BmMak+BPlZv0FiuX4K/FdjNAJWmwAp+6SbODNe4K2sEoM1QCxRnM
         h7+yvasoOowqlYKD40+d0vqiBuYzejJ/Izv7CZS9ML1AvcF1UpR1KJBKJfKLyi8HoS0v
         3kR5nvDuMYzJPzkzOjT0vQojECoo301eU0LiWni40Jw3XJbZILHigeGMN+kDGLmADxeE
         HuEA1/0qL7ehZuobMYWvXgcs+9WbxLj5ilklyyxSud/COhWFo/LW/EPoJTLgoiW5fnSS
         xXMBN442XJ/cpZvIGJGSwa6f78Rcp68aVZh/kcZoyKHGsUqDaTD+dAeEXTNOEckjQXHN
         idng==
X-Gm-Message-State: AOJu0YxbLkCT7pL+x5UFX8PNp5ubPQ055y7ACIAFDh3ngPUQzKfRnWud
	1/dfSVrVShdKRwuUJ2BrWuIjENDxIa93TpIb9N8lyA==
X-Google-Smtp-Source: AGHT+IHkVxx1a3vIVmIk37FrEvvRZfqQJ16HKjCsT/Ryi0GeRTB04DAU6758u20Vr4e6MaSa1VNWAmwXQcRja4DzdQo=
X-Received: by 2002:a81:8585:0:b0:5d7:1940:53c7 with SMTP id
 v127-20020a818585000000b005d7194053c7mr5849556ywf.63.1702418572991; Tue, 12
 Dec 2023 14:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702417058-24257-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1702417058-24257-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 00:02:42 +0200
Message-ID: <CAA8EJpqC4uZPR9svWyW04YwFd=JPbQvs_2FFuV4VGubX_6eX8A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 23:37, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> index and another one has an even index. Each encoder can work
> independently. But only two DSC encoders from same DCE can be paired
> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> two consecutive DSC encoders (start with even index) have to be paired
> to support DSC merge mode.  In addition, the DSC with even index have
> to be mapped to even PINGPONG index and DSC with odd index have to be
> mapped to odd PINGPONG index at its data path in regardless of DSC
> V1.1 or V1.2. This patch improves DSC allocation mechanism with
> consideration of those factors.
>
> Changes in V4:
> -- rework commit message
> -- use reserved_by_other()
> -- add _dpu_rm_pingpong_next_index()
> -- revise _dpu_rm_pingpong_dsc_check()
>
> Changes in V3:
> -- add dpu_rm_pingpong_dsc_check()
> -- for pair allocation use i += 2 at for loop
>
> Changes in V2:
>     -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>        _dpu_rm_reserve_dsc_pair()
>
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 178 ++++++++++++++++++++++++++++++---
>  1 file changed, 163 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643..15317b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -461,29 +461,177 @@ static int _dpu_rm_reserve_ctls(
>         return 0;
>  }
>
> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +static int _dpu_rm_pingpong_next_index(int start,
> +                                uint32_t enc_id,
> +                                uint32_t *pp_to_enc_id,
> +                                int pp_max)

Wrong indentation.

> +{
> +       int pp_ndx;
> +
> +       for (pp_ndx = start; pp_ndx < pp_max; pp_ndx++) {

git grep _ndx returns nearly nothing for the whole kernel. I think 'i'
is more than enough both here and in the loops over dsc_to_enc_id.

> +               if (pp_to_enc_id[pp_ndx] == enc_id)
> +                       return pp_ndx;
> +       }
> +
> +       return -ENAVAIL;
> +}
> +
> +static int _dpu_rm_pingpong_dsc_check(int dsc_ndx, int pp_ndx)

Same here. It is _idx or _index.

> +{
> +
> +       /*
> +        * dsc even index must be mapped to pingpong even index

DSC, PINGPONG. I think I had this comment for v3. You fixed the commit
message. What stopped you from fixing the comment?

DSC with even index must be used with the PINGPONG with even index

> +        * dsc odd index must be mapped to pingpong odd index
> +        */
> +       if ((dsc_ndx & 0x01) != (pp_ndx & 0x01))
> +               return -ENAVAIL;
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,

Still _single. Even though it can get a request for two DSC blocks.

>                                struct dpu_global_state *global_state,
> -                              struct drm_encoder *enc,
> +                              uint32_t enc_id,
> +                              int *dsc_id,
>                                const struct msm_display_topology *top)

Wrong indentation.

>  {
> -       int num_dsc = top->num_dsc;
> -       int i;
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int pp_ndx;
> +       int dsc_ndx;
> +       int ret;
>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> -               }
> +       for (dsc_ndx = 0; dsc_ndx < ARRAY_SIZE(rm->dsc_blks); dsc_ndx++) {
> +               if (!rm->dsc_blks[dsc_ndx])
> +                       continue;
> +
> +               if (reserved_by_other(dsc_enc_id, dsc_ndx, enc_id))
> +                       continue;
> +
> +               pp_ndx = _dpu_rm_pingpong_next_index(0, enc_id, pp_to_enc_id, pp_max);

Error here.

> +               if (pp_ndx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_ndx, pp_ndx);
> +               if (ret)
> +                       return -ENAVAIL;
> +
> +               dsc_id[num_dsc++] = DSC_0 + dsc_ndx;    /* found */

The comment is useless.

> +
> +               if (num_dsc >= top->num_dsc)
> +                       break;

Can this go to the loop condition please.

> +       }
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              uint32_t enc_id,
> +                              int *dsc_id,
> +                              const struct msm_display_topology *top)

Wrong indentation

> +{
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int start_pp_ndx = 0;
> +       int dsc_ndx, pp_ndx;
> +       int ret;
> +
> +       /* only start from even dsc index */
> +       for (dsc_ndx = 0; dsc_ndx < ARRAY_SIZE(rm->dsc_blks); dsc_ndx += 2) {
> +               if (!rm->dsc_blks[dsc_ndx] || !rm->dsc_blks[dsc_ndx + 1])

Newline after ||

> +                       continue;
> +
> +               /* consective dsc index to be paired */
> +               if (reserved_by_other(dsc_enc_id, dsc_ndx, enc_id) ||
> +                               reserved_by_other(dsc_enc_id, dsc_ndx + 1, enc_id))

Wrong indentation

> +                       continue;
> +
> +               pp_ndx = _dpu_rm_pingpong_next_index(start_pp_ndx, enc_id, pp_to_enc_id, pp_max);

Inline start_pp_ndx here.

> +               if (pp_ndx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_ndx, pp_ndx);
> +               if (ret) {
> +                       pp_ndx = 0;
> +                       continue;
>                 }
> +
> +               pp_ndx = _dpu_rm_pingpong_next_index(pp_ndx + 1, enc_id, pp_to_enc_id, pp_max);
> +               if (pp_ndx < 0)
> +                       return -ENAVAIL;
> +
> +               /* pair found */
> +               dsc_id[num_dsc++] = DSC_0 + dsc_ndx;
> +               dsc_id[num_dsc++] = DSC_0 + dsc_ndx + 1;
> +
> +               start_pp_ndx = pp_ndx + 1;      /* start for next pair */
> +
> +               if (num_dsc >= top->num_dsc)
> +                       break;

Can this go the loop condition, please.

> +       }
> +
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc,
> +                              const struct msm_display_topology *top)
> +{
> +       uint32_t enc_id = enc->base.id;
> +       int dsc_id[DSC_MAX - DSC_0];

Drop the dsc_id.

> +       int i, ret;
> +
> +       if (!top->num_dsc || !top->num_intf)
> +               return 0;
> +
> +       memset(dsc_id, 0, sizeof(dsc_id));
> +
> +       /*
> +        * Truth:
> +        * 1) every layer mixer only connects to one interface

Hmm. I missed this before. Bonded DSI mode. Each LM is used for both
interfaces, isn't it?

> +        * 2) no pingpong split -- which is two layer mixers shared one pingpong
> +        * 3) DSC pair start from even index, such as index(0,1), index (2,3), etc
> +        * 4) odd pingpong connect to odd dsc
> +        * 5) even pingpong connect to even dsc

You know the drill.

> +        * 6) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> +                           +--> pp_idx_1 --> dsc_idx_1
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               ret =  _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, dsc_id, top);
> +       else
> +               ret =  _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, dsc_id, top);
> +
> +       if (ret)
> +               return ret;
> +
> +       /* everything is good proceed to allocate dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int id;
> +
> +               id = dsc_id[i];
> +               if (id >= DSC_0)
> +                       global_state->dsc_to_enc_id[id - DSC_0] = enc_id;
> +       }
>
>         return 0;
>  }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

