Return-Path: <linux-arm-msm+bounces-3334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E82803AC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3221C20B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C829A28E0B;
	Mon,  4 Dec 2023 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="boiJBLSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C1E18B
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 08:47:28 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d33574f64eso50744537b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701708448; x=1702313248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nepwvvRD/gfBaWMYXy5vN/GJrBOCZb1VaNVzHXVB1s=;
        b=boiJBLSzrjKzUhNoa4jZ22WfGC/x1uE/BymTosCXeAIPhx6PHPczxHXfFCHQVhD++M
         GyrbArh9ZY3TuoyiSBWFzfq3xSMScR1853+uXS8LH2M2taM4nTU78tRm/YXbncWkDrNh
         +MtPOl6Avb2TrjxV+XsCr2fpliM1EtAqDkUdg/u7eU4WLsAfdiQLp8ZuEza2Ym81LKk/
         R46tx1DiPD90Rrr/x59rTU5CsXkFs8p54oVIJpfC4lhagIskKnFoKpvPZNHSVdVU3uFt
         bo2GkbiINYNrhUHaBYi6/exFNpBEzALh7CjlCtVHSaf+q1qoT0G8BR/6VDK3Nz+vuh7U
         xY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708448; x=1702313248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nepwvvRD/gfBaWMYXy5vN/GJrBOCZb1VaNVzHXVB1s=;
        b=X/mu8BPBMQ8FhDeJcGtPc7V7QsrpL3MXuc/BFgUlJpfI6LUaHFHop9MNvD/eve8LVi
         jDPpEtkt8qoYpIDkrWoWjx6k5gFsPurpw+XWMVJRrxNSAMbVV34Ysciq7YsD17FAHd3n
         70BcxzUaGefxheSeaXghavngQwcf/IxeAOJ56Zp3OfcdlOGG3AGOonJIrNs2EJlAbn9b
         ad2GCKW7x/GtKWQuU9/eGJDyBRx6iRANuvtlGXSf1OGLiTWLi5LTwAzre/s+WIIH8ZN/
         Mwbd0jN2ZRhUs3iQcP1TCg8d7+oS3EYToNA99VCLAgd2+n8ieSRTCPQznj/BjVS0k4Uu
         PZyQ==
X-Gm-Message-State: AOJu0YzpHNCh20tTFSrPIQqy263iU038H8tf/m1ItyZiRAHuSETAzasi
	UzUAHyzzCXLzv8hcsnA0SCYztUepByYapg/T1xq+4w==
X-Google-Smtp-Source: AGHT+IHcFMkVwwmYMMqki+2Qc6dR02+fv6yJEbd0ifGsqlMUJ9h6kZC+DljYT4ID8A8TJWm7PVUVkQDg4bH96RGd4zo=
X-Received: by 2002:a81:ae0f:0:b0:5d7:1940:b36a with SMTP id
 m15-20020a81ae0f000000b005d71940b36amr3624983ywh.54.1701708448087; Mon, 04
 Dec 2023 08:47:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqX0AWmLMrNo23cfsnU5q0ySDUkb1XTGwaxGt0eTPkLpg@mail.gmail.com> <1086300a-2c8e-f897-a0d7-84d36276a6b6@quicinc.com>
In-Reply-To: <1086300a-2c8e-f897-a0d7-84d36276a6b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 18:47:17 +0200
Message-ID: <CAA8EJpq_zE5J584smV=Gido9G-spo7hPYZyf-7vr8ki+r9Az9g@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 18:37, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/29/2023 7:57 PM, Dmitry Baryshkov wrote:
> > On Wed, 29 Nov 2023 at 22:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> A DCE (Display Compression Engine) contains two DSC hard slice encoders.
> >> Each DCE start with even DSC encoder index followed by an odd DSC encoder
> >> index. Each encoder can work independently. But Only two DSC encoders from
> >> same DCE can be paired to work together to support merge mode. In addition,
> >> the DSC with even index have to mapping to even pingpong index and DSC with
> >> odd index have to mapping to odd pingpong index at its data path. This patch
> >> improve DSC allocation mechanism with consideration of above factors.
> > Is this applicable to old DSC 1.1 encoders?
> yes, this algorithm should work with V1 too

Are the limitations (odd:odd, allocation in pairs, etc) applicable to
v1.1 encoders?

I assume that at least 'allocate two consecutive DSC for DSC merge' is
not applicable, since there are no separate DCE units.

> >
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 94 +++++++++++++++++++++++++++++-----
> >>   1 file changed, 82 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index f9215643..427d70d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -466,24 +466,94 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>                                 struct drm_encoder *enc,
> >>                                 const struct msm_display_topology *top)
> >>   {
> >> -       int num_dsc = top->num_dsc;
> >> -       int i;
> >> +       int num_dsc = 0;
> >> +       int i, pp_idx;
> >> +       bool pair = false;
> >> +       int dsc_idx[DSC_MAX - DSC_0];
> >> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >> +
> >> +       if (!top->num_dsc || !top->num_intf)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * Truth:
> >> +        * 1) every layer mixer only connects to one pingpong
> >> +        * 2) no pingpong split -- two layer mixers shared one pingpong
> >> +        * 3) each DSC engine contains two dsc encoders
> >> +        *    -- index(0,1), index (2,3),... etc
> >> +        * 4) dsc pair can only happens with same DSC engine except 4 dsc
> >> +        *    merge mode application (8k) which need two DSC engines
> >> +        * 5) odd pingpong connect to odd dsc
> >> +        * 6) even pingpong connect even dsc
> >> +        */
> >> +
> >> +       /* num_dsc should be either 1, 2 or 4 */
> >> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> >> +               pair = true;
> >> +
> >> +       /* fill working copy with pingpong list */
> >> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> > && num_dsc < top->num_dsc
> >
> >> +               if (!rm->dsc_blks[i])   /* end of dsc list */
> >> +                       break;
> > I'd say, it's `continue' instead, let's just skip the index.
> >
> >> -       /* check if DSC required are allocated or not */
> >> -       for (i = 0; i < num_dsc; i++) {
> >> -               if (!rm->dsc_blks[i]) {
> >> -                       DPU_ERROR("DSC %d does not exist\n", i);
> >> -                       return -EIO;
> >> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> >> +                       /* consective dsc index to be paired */
> >> +                       if (pair && num_dsc) {  /* already start pairing, re start */
> >> +                               num_dsc = 0;
> >> +                               /* fill working copy with pingpong list */
> >> +                               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> >> +                                                               sizeof(pp_to_enc_id));
> >> +                       }
> >> +                       continue;
> >>                  }
> >>
> >> -               if (global_state->dsc_to_enc_id[i]) {
> >> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> >> -                       return -EIO;
> >> +               /* odd index can not become start of pairing */
> >> +               if (pair && (i & 0x01) && !num_dsc)
> >> +                       continue;
> > After looking at all conditions, can we have two different helpers?
> > One which allocates a single DSC and another one which allocates a
> > pair. For the pair you can skip odd indices at all and just check if
> > DSC_i and DSC_i+1 are free.
> >
> >> +
> >> +               /*
> >> +                * find the pingpong index which had been reserved
> >> +                * previously at layer mixer allocation
> >> +                */
> >> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >> +                       if (pp_to_enc_id[pp_idx] == enc->base.id)
> >> +                               break;
> >>                  }
> >> +
> >> +               /*
> >> +                * dsc even index must map to pingpong even index
> >> +                * dsc odd index must map to pingpong odd index
> >> +                */
> >> +               if ((i & 0x01) != (pp_idx & 0x01))
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * delete pp_idx so that it can not be found at next search
> >> +                * in the case of pairing
> >> +                */
> >> +               pp_to_enc_id[pp_idx] = NULL;
> >> +
> >> +               dsc_idx[num_dsc++] = i;
> >> +               if (num_dsc >= top->num_dsc)
> >> +                       break;
> >>          }
> >>
> >> -       for (i = 0; i < num_dsc; i++)
> >> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> >> +       if (num_dsc < top->num_dsc) {
> >> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> >> +                                               num_dsc, top->num_dsc );
> >> +               return -ENAVAIL;
> >> +       }
> >> +
> >> +       /* reserve dsc */
> >> +       for (i = 0; i < top->num_dsc; i++) {
> >> +               int j;
> >> +
> >> +               j = dsc_idx[i];
> >> +               global_state->dsc_to_enc_id[j] = enc->base.id;
> >> +       }
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry

