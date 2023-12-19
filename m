Return-Path: <linux-arm-msm+bounces-5459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAB8193AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 23:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3801F2596D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 22:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397E44B156;
	Tue, 19 Dec 2023 22:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZxfAFahD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE494B139
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 22:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e730eb1770so19051937b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703025132; x=1703629932; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kzqVHsGetymNboFDCWrRPYQux0ZuU7Q/V2bhhYriNA=;
        b=ZxfAFahDnnzFo49s2HqVTfrJ0pphqw0NUKpQqAJvUj/+tajflwKrvCIjHl5TfSP6fT
         FdHSAlO02pZhL0VUq9RxFxE/zNmzKr2D3QzYGsvOwHjjMGpO270bZFoh5b9PqTORt58U
         S88f5AyOyiZ1J3Ck2/aYjz5SbGUK892Pj9cAfk/Sebabx41qQcJGjvp5tY1XdDni2Cpf
         baG7O0gyelfGj3ZvykZM8thvArGajKXdBLE8JZT/yaRlP2t4Vr6zC1HaE/rpOwmU+2iF
         7DhV2kRuzT8rtBt7f8AGLLDHlclVeokmavHlf4m/tnPvij62Jjs/UoqbrDyk2CV+PkIi
         010w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703025132; x=1703629932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kzqVHsGetymNboFDCWrRPYQux0ZuU7Q/V2bhhYriNA=;
        b=K7oOxxkD3WZwOPNUF9/05IABxjo3ur/OVIO4gme1qXS/7W5uL0U3Dd0e5QVfSkS2TM
         tN4n8SlBsGDRafkQ+mE+g76y70xJs+ZnS7UXzVzWjAS/b5syeNsfSJ8xY74VkEkT8sA/
         PDIKP+aSmnG5cgCX62uJr2lpoU1+iVuw/wJPvNvuQBvcBH3SvmMegWYqOhaolNfPczmt
         iRMtxn51djvPZUi3YLn07E6VfZ7XyV/oNQnOE7/chHgqGqPKIMPg3mbNbU2eRh3at9CA
         NF1JypjQfJ7dcv2L9GgYYkfdePYbAzlqn3QijZ1LAaLg8caC78uoOXY+AJXIDQAvIrC8
         oIww==
X-Gm-Message-State: AOJu0YzDfpEf/wztpljbLJhZVmxGSIogYWMEz1uT7d/ydNDtB7e1JPHh
	Awv7wBz/Ul8iDYCNzrYh9QnN4E0JRUkx30kaGCdbjw==
X-Google-Smtp-Source: AGHT+IH56xPDVpC/j81TPbRwvDDod+54PsYV0BD/YyJAYnNlpSdZFFYGqSlSDE/9OzgRCTmGob2qJJe2fPNJUOMKsl4=
X-Received: by 2002:a81:91c6:0:b0:5e7:5cd8:92b2 with SMTP id
 i189-20020a8191c6000000b005e75cd892b2mr2359027ywg.69.1703025132610; Tue, 19
 Dec 2023 14:32:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com> <a5ec8760-cdfe-b420-43c1-913b0095ba93@quicinc.com>
In-Reply-To: <a5ec8760-cdfe-b420-43c1-913b0095ba93@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Dec 2023 00:32:01 +0200
Message-ID: <CAA8EJpoBiiTbc91E8hSK0seBOXAW++8V8yJzbGmCJJcXbZ3raQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 18:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Hi Dmitry,
>
> Anymore comments from you?

No, for some reason I missed this patch. Please excuse me.

> On 12/14/2023 10:56 AM, Kuogee Hsieh wrote:
> > At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> > However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> > index and another one has an even index. Each encoder can work
> > independently. But only two DSC encoders from same DCE can be paired
> > to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> > two consecutive DSC encoders (start with even index) have to be paired
> > to support DSC merge mode.  In addition, the DSC with even index have
> > to be mapped to even PINGPONG index and DSC with odd index have to be
> > mapped to odd PINGPONG index at its data path in regardless of DSC
> > V1.1 or V1.2. This patch improves DSC allocation mechanism with
> > consideration of those factors.
> >
> > Changes in V6:
> > -- rename _dpu_rm_reserve_dsc_single to _dpu_rm_dsc_alloc
> > -- rename _dpu_rm_reserve_dsc_pair to _dpu_rm_dsc_alloc_pair
> > -- pass global_state to _dpu_rm_pingpong_next_index()
> > -- remove pp_max
> > -- fix for loop condition check at _dpu_rm_dsc_alloc()
> >
> > Changes in V5:
> > -- delete dsc_id[]
> > -- update to global_state->dsc_to_enc_id[] directly
> > -- replace ndx with idx
> > -- fix indentation at function declaration
> > -- only one for loop at _dpu_rm_reserve_dsc_single()
> >
> > Changes in V4:
> > -- rework commit message
> > -- use reserved_by_other()
> > -- add _dpu_rm_pingpong_next_index()
> > -- revise _dpu_rm_pingpong_dsc_check()
> >
> > Changes in V3:
> > -- add dpu_rm_pingpong_dsc_check()
> > -- for pair allocation use i += 2 at for loop
> >
> > Changes in V2:
> >      -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >         _dpu_rm_reserve_dsc_pair()
> >
> > Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 154 +++++++++++++++++++++++++++++----
> >   1 file changed, 139 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

See below for minor nit.

> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f9215643..0ce2a25 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -461,29 +461,153 @@ static int _dpu_rm_reserve_ctls(
> >       return 0;
> >   }
> >
> > -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > -                            struct dpu_global_state *global_state,
> > -                            struct drm_encoder *enc,
> > -                            const struct msm_display_topology *top)
> > +static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
> > +                                    int start,

I'd still prefer to see `enum dpu_pingpong` as a parameter here
instead of just an index, but this is just my taste.

> > +                                    uint32_t enc_id)
> >   {
> > -     int num_dsc = top->num_dsc;
> >       int i;
> >
> > -     /* check if DSC required are allocated or not */
> > -     for (i = 0; i < num_dsc; i++) {
> > -             if (!rm->dsc_blks[i]) {
> > -                     DPU_ERROR("DSC %d does not exist\n", i);
> > -                     return -EIO;
> > +     for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
> > +             if (global_state->pingpong_to_enc_id[i] == enc_id)
> > +                     return i;
> > +     }
> > +
> > +     return -ENAVAIL;
> > +}
> > +
> > +static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
> > +{
> > +     /*
> > +      * DSC with even index must be used with the PINGPONG with even index
> > +      * DSC with odd index must be used with the PINGPONG with odd index
> > +      */
> > +     if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> > +             return -ENAVAIL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > +                          struct dpu_global_state *global_state,
> > +                          uint32_t enc_id,
> > +                          const struct msm_display_topology *top)
> > +{
> > +     int num_dsc = 0;
> > +     int pp_idx = 0;
> > +     int dsc_idx;
> > +     int ret;
> > +
> > +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> > +          num_dsc < top->num_dsc; dsc_idx++) {
> > +             if (!rm->dsc_blks[dsc_idx])
> > +                     continue;
> > +
> > +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
> > +                     continue;
> > +
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> > +             if (ret)
> > +                     return -ENAVAIL;
> > +
> > +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > +             num_dsc++;
> > +             pp_idx++;
> > +     }
> > +
> > +     if (num_dsc < top->num_dsc) {
> > +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> > +                        num_dsc, top->num_dsc);
> > +             return -ENAVAIL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > +                               struct dpu_global_state *global_state,
> > +                               uint32_t enc_id,
> > +                               const struct msm_display_topology *top)
> > +{
> > +     int num_dsc = 0;
> > +     int dsc_idx, pp_idx = 0;
> > +     int ret;
> > +
> > +     /* only start from even dsc index */
> > +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> > +          num_dsc < top->num_dsc; dsc_idx += 2) {
> > +             if (!rm->dsc_blks[dsc_idx] ||
> > +                 !rm->dsc_blks[dsc_idx + 1])
> > +                     continue;
> > +
> > +             /* consective dsc index to be paired */
> > +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
> > +                 reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
> > +                     continue;
> > +
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> > +             if (ret) {
> > +                     pp_idx = 0;
> > +                     continue;
> >               }
> >
> > -             if (global_state->dsc_to_enc_id[i]) {
> > -                     DPU_ERROR("DSC %d is already allocated\n", i);
> > -                     return -EIO;
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx + 1, pp_idx);
> > +             if (ret) {
> > +                     pp_idx = 0;
> > +                     continue;
> >               }
> > +
> > +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > +             global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
> > +             num_dsc += 2;
> > +             pp_idx++;       /* start for next pair */
> >       }
> >
> > -     for (i = 0; i < num_dsc; i++)
> > -             global_state->dsc_to_enc_id[i] = enc->base.id;
> > +     if (num_dsc < top->num_dsc) {
> > +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> > +                        num_dsc, top->num_dsc);
> > +             return -ENAVAIL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > +                            struct dpu_global_state *global_state,
> > +                            struct drm_encoder *enc,
> > +                            const struct msm_display_topology *top)
> > +{
> > +     uint32_t enc_id = enc->base.id;
> > +
> > +     if (!top->num_dsc || !top->num_intf)
> > +             return 0;
> > +
> > +     /*
> > +      * Facts:
> > +      * 1) no pingpong split (two layer mixers shared one pingpong)
> > +      * 2) DSC pair starts from even index, such as index(0,1), (2,3), etc
> > +      * 3) even PINGPONG connects to even DSC
> > +      * 4) odd PINGPONG connects to odd DSC
> > +      * 5) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> > +      *                  +--> pp_idx_1 --> dsc_idx_1
> > +      */
> > +
> > +     /* num_dsc should be either 1, 2 or 4 */
> > +     if (top->num_dsc > top->num_intf)       /* merge mode */
> > +             return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
> > +     else
> > +             return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
> >
> >       return 0;
> >   }



-- 
With best wishes
Dmitry

