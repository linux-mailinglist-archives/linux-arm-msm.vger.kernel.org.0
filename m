Return-Path: <linux-arm-msm+bounces-4274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5F80DD1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 22:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F491C214D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 21:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8054954BFB;
	Mon, 11 Dec 2023 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kyDgHsVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B91CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:30:34 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5c08c47c055so48507467b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702330234; x=1702935034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mP3VLPs03SrnEr1/DMwDtKVU7869ayyAoO5CS8n6JB0=;
        b=kyDgHsVcbnVGSQyhs1RKOHZJW2ev6BiXJCkZ0+oMgHYPwv0FfBqsUdSWw7d96wDRTM
         ybIA2eqmXHUgAcgC3z0c4ys7n8BZj87lVu4xpQNXOD7uUnxZmNwhQSGcku9Uwfbas8Km
         3/uGG8upcVhzYKb1E2M+XkMMKDaXSohOFkBVn4agB4YXYwcsv1Ch+Q4mhtABLTjbH7Dh
         YBwyBfXdXDjyOeL0d1jX9t7x34lY+z2OBNnFZBP5yNEPsAOUVeI6l3AiWGzQHib9LG8y
         5AhE1A21SsgmwgIdjzd9t5vPnxofODgfYNm6KHzij9apB3NwKEP0MeX+UqdVdkW0rB96
         CNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330234; x=1702935034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mP3VLPs03SrnEr1/DMwDtKVU7869ayyAoO5CS8n6JB0=;
        b=Jdqg9jjRYX/9XWwLrQKx6aIfMVIFFZ13Z/n6l51scod3Yd5UtvyYMI9nwiEf1H3Mxu
         bMY062hM6tDQm+e+WP8iZQeqXUNYiE39YbTtNvoDmd21cwiiHdWb1ySWHeB3JDsF4KlM
         FntSgh++qUhWLYCPnaAVHq0O2LsuLUSmxP7f/O2fJdMvMbPX/6XD5X8+ZUVFpEm2Rudq
         iUD42CmUh84eyZJcQbPf7/56q5ULLpt+hpqdJiIh5zx53AW6OYDH3vCvtWkFdi1TWxB3
         d6MNzv31LVEPXKN4STzlmFchUPK/DEEbYdVOTEdogw4s+BnHDL0F3hanRg+2xXVA+z+c
         eWGw==
X-Gm-Message-State: AOJu0YxT3EugGPB7ZNaJOqZkASpRX9JBB6ez2dCVbteG1pVmlIj0J9rI
	aPbjpi9HLLtJ15Xvg2Py4eqDo3phEtDApTwVRTMeBg==
X-Google-Smtp-Source: AGHT+IHn/fZjOMckIfJQZyZbCFsNigRcypYTFuj4knE4wB0U6AegR59+xjbNcMJwF4wNr0IK5hlyqzFxTzXwPRW0/go=
X-Received: by 2002:a0d:ce03:0:b0:5d7:1940:53dd with SMTP id
 q3-20020a0dce03000000b005d7194053ddmr4160604ywd.85.1702330234007; Mon, 11 Dec
 2023 13:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 23:30:21 +0200
Message-ID: <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 20:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> A DCE (Display Compression Engine) contains two DSC hard slice
> encoders. Each DCE start with even DSC encoder index followed by

"starts". But it will not be correct. The DCE doesn't start with the
DSC encoder. DCE consists of two DSC encoders, one has an odd index
and another one has an even index.

> an odd DSC encoder index. Each encoder can work independently.
> But Only two DSC encoders from same DCE can be paired to work

only

> together to support merge mode. In addition, the DSC with even

There are different merge modes. Here you are talking about the DSC merge mode.

> index have to mapping to even pingpong index and DSC with odd

PINGPONG (end everywhere else).

have to be mapped, should be used, etc.

> index have to mapping to odd pingpong index at its data path.
> This patch improve DSC allocation mechanism with consideration

improves

> of above factors.

of these factors.

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

This tag is incorrect. The patch should be split into two pieces. One
which fixes DSC allocation for DSC 1.1 encoders, where there were no
DCE blocks, another one which adds proper handling for DCE.
Unless the paired allocation requirement also applies to pre-DCE DSC
encoders. But in that case the commit message doesn't make any sense.

I checked 4.x Qualcomm kernels. None of them contained any of these
restrictions for DSC blocks. Only the displaypack targeting 4.19
kernel got these changes. But it predates DCE pairs support.


> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 ++++++++++++++++++++++++++++++---
>  1 file changed, 155 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 17ecf23..43598ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -470,33 +470,172 @@ static int _dpu_rm_reserve_ctls(
>         return 0;
>  }
>
> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx,
> +                                     uint32_t enc_id,
> +                                     uint32_t *pp_to_enc_id,
> +                                     int pp_max,
> +                                     bool pair)
> +{
> +       int pp_idx;
> +
> +       /*
> +        * find the pingpong index which had been reserved
> +        * previously at layer mixer allocation

during

> +        */
> +       for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> +               if (pp_to_enc_id[pp_idx] == enc_id)
> +                       break;
> +       }
> +
> +       /*
> +        * dsc even index must map to pingpong even index

DSC with even index.
be mapped or correspond


> +        * dsc odd index must map to pingpong odd index
> +        */
> +       if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> +               return -ENAVAIL;
> +
> +       if (pair) {
> +               /*
> +                * delete pp_idx so that same pp_id can not be paired with
> +                * next dsc_id
> +                */
> +               pp_to_enc_id[pp_idx] = 0xffff;
> +       }

Ugh. "Non tangere circulos meos". Move this deletion away from this function.

> +
> +       return 0;
> +
> +}
> +
> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
>                                struct dpu_global_state *global_state,
> -                              struct drm_encoder *enc,
> +                              uint32_t enc_id,
>                                const struct msm_display_topology *top)
>  {
> -       int num_dsc = top->num_dsc;
> -       int i;
> +       int num_dsc = 0;
> +       int i, ret;
> +       int dsc_id[DSC_MAX - DSC_0];
> +       uint32_t *pp_enc_id = global_state->pingpong_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> -               }
> +       memset(dsc_id, 0, sizeof(dsc_id));
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> -               }
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {

Wait. num_dsc >= top->num_dsc? num_dsc starts with 0, so this loop
will never be executed?

> +               if (!rm->dsc_blks[i])
> +                       continue;
> +
> +               if (global_state->dsc_to_enc_id[i])     /* used */

No. Use reserved_by_other instead of inventing your own conditions.

> +                       continue;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id, pp_enc_id, pp_max, false);
> +               if (!ret)
> +                       dsc_id[num_dsc++] = DSC_0 + i;  /* found, start from DSC_0 */

The comment is incorrect. Why do we start from DSC_0? Or what starts from DSC_0?

>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
> +       }
> +
> +       /* allocate dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int id;
> +
> +               id = dsc_id[i];
> +               if (id >= DSC_0)
> +                       global_state->dsc_to_enc_id[id - DSC_0] = enc_id;

Can we fill dsc_to_enc_id directly, without interim arrays?

> +       }
>
>         return 0;
>  }
>
> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              uint32_t enc_id,
> +                              const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       int i, ret;
> +       int dsc_id[DSC_MAX - DSC_0];
> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +
> +       memset(dsc_id, 0, sizeof(dsc_id));
> +
> +       /* only start from even dsc index */
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i += 2) {
> +               if (!rm->dsc_blks[i] || !rm->dsc_blks[i + 1])
> +                       continue;
> +
> +               /* consective dsc index to be paired */

consecutive

> +               if (dsc_enc_id[i] || dsc_enc_id[i + 1]) /* used */
> +                       continue;

reserved_by_other

> +
> +               /* fill working copy with pingpong list */
> +               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> +
> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id, pp_to_enc_id, pp_max, true);
> +               if (ret)
> +                       continue;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(i + 1, enc_id, pp_to_enc_id, pp_max, true);

In the comment several lines below you wrote that num_dsc can be '4'.
In such case the loop will be executed at least twice. And during the
second iteration of the loop we are going to get the same PP indices
as we got during the first one, even though we should have got third
and fourth PP indices.

> +               if (ret)
> +                       continue;
> +
> +               /* pair found, start from DSC_0 */

The comment is incorrect.

> +               dsc_id[num_dsc++] = DSC_0 + i;
> +               dsc_id[num_dsc++] = DSC_0 + i + 1;
> +       }
> +
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
> +       }
> +
> +       /* allocate dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int id;
> +
> +               id = dsc_id[i];
> +               if (id >= DSC_0)
> +                       global_state->dsc_to_enc_id[id - DSC_0] = enc_id;
> +       }
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc,
> +                              const struct msm_display_topology *top)
> +{
> +       uint32_t enc_id = enc->base.id;
> +
> +       if (!top->num_dsc || !top->num_intf)
> +               return 0;
> +
> +       /*
> +        * Truth:
> +        * 1) every layer mixer only connects to one pingpong
> +        * 2) no pingpong split -- which is two layer mixers shared one pingpong
> +        * 3) each DSC engine contains two dsc encoders
> +        *    -- index(0,1), index (2,3),... etc
> +        * 4) dsc pair can only happens with same DSC engine
> +        * 5) odd pingpong connect to odd dsc
> +        * 6) even pingpong connect to even dsc
> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> +                           +--> pp_idx_1 --> dsc_idx_1
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
> +       else
> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);

So, can we get num_dsc = 2 and still use _dpu_rm_reserve_dsc_single()?

> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

