Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19B770BF0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 15:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbjEVNCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 09:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbjEVNCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 09:02:40 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A920E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 06:02:33 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-565014fc2faso12163817b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684760552; x=1687352552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y3TaDGc6UXdBjXXUtkfSo09wA01+Q0Bb6oG2mEWLoBY=;
        b=a3q9I6ts05CGT64isT+VAGu13MrUb94QEknKnCkNCrNZT9XINRxdaOJ5zX/9KZM3Nm
         dWkmaVgrgzNj+uKJcIOORFHDcL5q5tn7fR8v0OOXuITVRHgHp2aXXvyHzkYomcBV1cQm
         FIMKvuy1K+SdV73Lxlw7ONkrGejYngLk3PECXA/S37pIRZLBvEHwWMYxTDQqBbM7S13h
         VP9Dol047gDeJmw26Pr+bAZ3+h6z4ElzhIsoPByCzn1fY3wD/EahA1RL/y7FEiJOdu7P
         tXPeoVlkfJfl9/g0e2cg96jPWWgZS+H+phjmFSRksMFjJY/yZ3ldmbHgnRSzGHBvsxY1
         DALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684760552; x=1687352552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3TaDGc6UXdBjXXUtkfSo09wA01+Q0Bb6oG2mEWLoBY=;
        b=TWn+Lp26XIcy1l5hecRUVne3FMYXIvkgftKLqefsfLf+kkPlP1LLScvI5/LgKPEhOn
         ohseKpDM5uDGpkkt57FyjbJq9FtMsZy4GiezfZ0wYJVi14bwD+hu5QQRoTdujJy69DaW
         gGt4xAQgsNPEjBCNOoINkakqebX0UHGk3DfUVFni4hq/UmKJV2GPyTe4Oad/RvWUUjfi
         fTJba7ksZVf5EwZiQmkrbXcvVyhoTGdDtJc9uk1Y4XE2AsBsCMBbGOacApLqHJ1oRz+K
         rKfW71HpnQK6ph7m33JrWFE/jhMFfa8PMT/XKWa/GsJaQ0Xq02WmrgWIIDZ9wsDFBRQF
         zddA==
X-Gm-Message-State: AC+VfDzPB8dMZw+vWNh7EY5rCwLgox8sOFhGNkgn3gdoCEmwXX7K9+QM
        k0hVxlPcdbu1xusLjfaL6EkkYqGtcP+78XAovJ5krg==
X-Google-Smtp-Source: ACHHUZ6xF8+yKnUQDlQX7TXAUwQ8uC6kK3HwVT1ocx55TFzO8Yb1WnEXK2/2ib6EIQI+S7jGcPE6z/35OsxRNvqqKpc=
X-Received: by 2002:a81:494e:0:b0:561:e67d:8a35 with SMTP id
 w75-20020a81494e000000b00561e67d8a35mr12130944ywa.35.1684760552308; Mon, 22
 May 2023 06:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain> <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
In-Reply-To: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 May 2023 16:02:21 +0300
Message-ID: <CAA8EJpo+9M7SgaNk7qd-Z1_e_WBVFRLLr9hGk5n0hLjRpyA4yw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in dpu_encoder_phys_cmd_tearcheck_config()
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 May 2023 at 11:47, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-22 10:48:01, Dan Carpenter wrote:
> > The "vsync_hz" variable is used to store negative error codes so it
> > needs to be signed for the error checking to work correctly.
>
> Nicely spotted, but it it looks like we have more to fix then.  The type
> returned by dpu_kms_get_clk_rate() is u64:
>
> - Perhaps the int used in this patch is too small (though 19.2MHz vsync
>   clock ought to fit);
> - That function should also return a signed number as part of this
>   contract.

Please also include freedreno@ to the cc list when sending v2.

>
> - Marijn
>
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 74470d068622..b29e6d1ba7f6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >       struct dpu_hw_tear_check tc_cfg = { 0 };
> >       struct drm_display_mode *mode;
> >       bool tc_enable = true;
> > -     u32 vsync_hz;
> > +     int vsync_hz;
> >       struct dpu_kms *dpu_kms;
> >
> >       if (!phys_enc->hw_pp) {
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
