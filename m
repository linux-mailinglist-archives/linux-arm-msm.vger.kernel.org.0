Return-Path: <linux-arm-msm+bounces-4623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4381228C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 00:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5AADB20F58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 23:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED89CFBEC;
	Wed, 13 Dec 2023 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yC0So8fY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43A499
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:00:37 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5e2b8f480b3so433857b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702508437; x=1703113237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq6zR+jlHYAnapBNzjrKg2iVCLy0eSamSPNu3gL1qJE=;
        b=yC0So8fYM9PJOJiDDsurRD4BVyJk1ZKY5RwWMvAJHX8K1yhZUCt55t6mJhOG0SccbB
         MkNdG+6ZobJhqH6y+sjano069B1OoOU7eorAX+faWQLyh0CfVFiFkNsz1+RctN1MpaLG
         +kmVzJQ+7Fub2F0dgLMljArjM+kDxz+rs+R+dI4pt/lwxTD3B5lSo+xpPdxDIyoMHalI
         6RBxnhk+9FkHqssUWMD4t2R2iXigTw1SFT99EzRQrHfHkDc96oyv3e/QMSEFmW0r2T8Y
         9PjVjjt8GVmc6BEhVmEwMdzY8w6Pdbkiw9jJ5iWSf7d3WtMPFKfDPf0SPgdAk7Q3d4X+
         +G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702508437; x=1703113237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq6zR+jlHYAnapBNzjrKg2iVCLy0eSamSPNu3gL1qJE=;
        b=unH+ksgHE6ZDqhEc1o1qy8voaxzMh0YCF1UbRn/ILybSVFjqzlBPs7mHMFQS8jPvmE
         qWbKB2SNXAWxT9R9IL0FkgdJ/3jXTmlYWTPyNGwqXmahZzXsrBNcs+56Mk50wwkuEmXU
         01826hfTEyI6v38LfgJCwwww3fAjB+4QmqrdAU5RCyCpQYECwNg3WU8buvnGeWr96EA7
         C8MGpGJmMiQmoG/7ezVQ1qVE73yAm+S9Tq7dCTlCcnSKbVzqJ00iH2Ri+x68cRyrC+1d
         BO99rjRz3s+Uy/cJ/Cusrfblr2JJxuAkctU8lEGNIiNXJRkVwfCaypt+2XxlYHkrvWKC
         Qafw==
X-Gm-Message-State: AOJu0Yyp3XsFyzSEMMmygwSJR6lAO8gv3zc1tuMbZGRZC3/NQhQWMbtq
	IBSD+JrqyJrn3rjN0nrBqXH9sHxtmoLTOY1ni1n4dA==
X-Google-Smtp-Source: AGHT+IH7OxM8zsbMLlw3Tz7w8NQR+EpCvwFYDla0owejlgj1j7yMt2CoyVOacpI3RwEFByDKtK4hYopmrGFt8D1noPQ=
X-Received: by 2002:a0d:ffc7:0:b0:5e1:84d7:174d with SMTP id
 p190-20020a0dffc7000000b005e184d7174dmr3603843ywf.50.1702508436837; Wed, 13
 Dec 2023 15:00:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702493883-30148-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1702493883-30148-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 01:00:25 +0200
Message-ID: <CAA8EJppypE-0tUfVD-24YMOQ+3cP+_D1BZYju0K7qzaUE_RnKA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 20:58, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
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
> Changes in V5:
> -- delete dsc_id[]
> -- update to global_state->dsc_to_enc_id[] directly
> -- replace ndx with idx
> -- fix indentation at function declaration
> -- only one for loop at _dpu_rm_reserve_dsc_single()
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 162 +++++++++++++++++++++++++++++----
>  1 file changed, 146 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643..7c7a88f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -461,29 +461,159 @@ static int _dpu_rm_reserve_ctls(
>         return 0;
>  }
>
> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> -                              struct dpu_global_state *global_state,
> -                              struct drm_encoder *enc,
> -                              const struct msm_display_topology *top)
> +static int _dpu_rm_pingpong_next_index(int start,
> +                                      uint32_t enc_id,
> +                                      uint32_t *pp_to_enc_id,
> +                                      int pp_max)
>  {
> -       int num_dsc = top->num_dsc;
>         int i;
>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> -               }
> +       for (i = start; i < pp_max; i++) {
> +               if (pp_to_enc_id[i] == enc_id)
> +                       return i;
> +       }
> +
> +       return -ENAVAIL;
> +}
> +
> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
> +{
> +

CHECK: Blank lines aren't necessary after an open brace '{'
#85: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:481:

> +       /*
> +        * DSC with even index must be used with the PINGPONG with even index
> +        * DSC with odd index must be used with the PINGPONG with odd index
> +        */
> +       if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> +               return -ENAVAIL;
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
> +                                     struct dpu_global_state *global_state,
> +                                     uint32_t enc_id,
> +                                     const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int pp_idx;
> +       int dsc_idx;
> +       int ret;
> +
> +       for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> +                         num_dsc < 1; dsc_idx++) {

The condition is wrong here. Also it is misaligned.

> +               if (!rm->dsc_blks[dsc_idx])
> +                       continue;
> +
> +               if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id))
> +                       continue;
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(0, enc_id,

And this is wrong too. You should start relatively to your previous PP index.

> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> +               if (ret)
> +                       return -ENAVAIL;
> +
> +               dsc_enc_id[dsc_idx] = enc_id;
> +               num_dsc++;
> +       }
> +
> +       if (!num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d\n", num_dsc);
> +               return -ENAVAIL;
> +       }
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> +                                   struct dpu_global_state *global_state,
> +                                   uint32_t enc_id,
> +                                   const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;

No need for these anymore. Please inline them. Or simply pass
global_state to _dpu_rm_pingpong_next_index().
Other functions in dpu_rm.c don't define local variables for these
arrays. I don't see why this patch should deviate from that.

> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int start_pp_idx = 0;
> +       int dsc_idx, pp_idx;
> +       int ret;
> +
> +       /* only start from even dsc index */
> +       for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> +                         num_dsc < top->num_dsc; dsc_idx += 2) {

Misaligned

> +               if (!rm->dsc_blks[dsc_idx] ||
> +                   !rm->dsc_blks[dsc_idx + 1])
> +                       continue;
> +
> +               /* consective dsc index to be paired */
> +               if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id) ||
> +                   reserved_by_other(dsc_enc_id, dsc_idx + 1, enc_id))
> +                       continue;
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(start_pp_idx, enc_id,
> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> +               if (ret) {
> +                       pp_idx = 0;
> +                       continue;
>                 }
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(pp_idx + 1, enc_id,
> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;

Fresh pp_idx has to be checked against dsc_idx + 1.

Let me also have a suggestion for you. The pp_max is a constant. You
don't have to pass it to _dpu_rm_pingpong_next_index() at all! Also if
you change the function to accept enum dpu_pingpong, you can start
with PINGPONG_NONE and move +1 into the function, making the callers
simpler, removing the need or start_pp_idx (which I asked to do in v4)
etc.

> +
> +               dsc_enc_id[dsc_idx] = enc_id;
> +               dsc_enc_id[dsc_idx + 1] = enc_id;
> +               num_dsc += 2;
> +
> +               start_pp_idx = pp_idx + 1;      /* start for next pair */
>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);

Misaligned

> +               return -ENAVAIL;
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
> +        * Facts:
> +        * 1) DSCs ouput to an interface

WARNING: 'ouput' may be misspelled - perhaps 'output'?

Also, what does it bring to us?

> +        * 2) no pingpong split (two layer mixers shared one pingpong)
> +        * 3) DSC pair start from even index, such as index(0,1), (2,3), etc

starts

> +        * 4) even PINGPONG connects to even DSC
> +        * 5) odd PINGPONG connects to odd DSC
> +        * 6) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> +        *                  +--> pp_idx_1 --> dsc_idx_1
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
> +       else
> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
>
>         return 0;
>  }
> --
> 2.7.4
>

Kuogee, we value your patches. But could you please fix your editor
settings to properly align C statements? E.g. Vim has the "set
cino=(0" setting, which does most of the work. I suspect that your
code editor should also have a similar setting. Also could you please
establish a practice of using checkpatch.pl at least until we stop
hitting obvious issues there?

-- 
With best wishes
Dmitry

