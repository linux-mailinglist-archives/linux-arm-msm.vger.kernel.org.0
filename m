Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6258F6FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 06:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbiHKEg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 00:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiHKEg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 00:36:28 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA70491EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 21:36:25 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fy5so645603ejc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 21:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wbQAeMQOJ4LfSIWECGQFyUhqjfpSoLI8AfopCaQiJEU=;
        b=G2Svss+8NtmivkCOl4Bh6T8tY5W084Z2nlXQ31QrJ6LZyKPy2WaINasfEgMBwOxRtb
         7SFYLbAM+NhjMLdjquQr1/Y6LIZQlP1j/aI+enQPlzLAy7k2QQwB2Q4wDbANkwZGvwOF
         fsSaXcGgaqc3LSOwBeGoMAMPlhKHKQDl1a6THh7/kek/2AHn0ylR3zV9K61bQ6ecRJ4k
         WRqJvY6Gnkv+aXANNFxwpWbxaPy1atzV5pOKxDyXdGqv7bqwbyKSCkWyecybU/VTaHoe
         A3sTBV9vizJ7LfPXsEkOI25uvnog+uhUhnof911XHQB9wHkikqAfkLgsCBIXfiUI2lpr
         bD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wbQAeMQOJ4LfSIWECGQFyUhqjfpSoLI8AfopCaQiJEU=;
        b=bc1cHVbWeXAu38z/n/jD5sjxLqhWG6dwm2OcTYkMjAT1+FLFqYs+gt1fn7gv8w7m+d
         Z0i15aASDA13Bsv7hgbMm/V6oaBJ/ZO5oVEfz1UuJNC567q1CWS4VAAOmTm9xWxPAHCm
         Ul5lVVa64sz8j8XnTUnTqorXQrCR2SUCn/bnHdKTy6QItYxZkCY1jqbOoi3suYfHQ06O
         MLy819JhIqJAjoxlpS4DOY9HeP0SA4eJkzDBHL/z1sqhSuzYp7yHlOUO0E+212PHkXBt
         CtkFSYluTnz6wTy59UvNEEh8wS6jMnNLcAgG0RmdKz/lVnpiORlWt4drUOcV7XyvEr3w
         lImg==
X-Gm-Message-State: ACgBeo3WfZNASH3T6PQpVffSeen0RIGQ5Rcm+vMLkP1ro7rwWfHwWl4R
        2IrLsgNji9c7g3WUoucnMsdpNkPxrThwdrCpbAtsWw==
X-Google-Smtp-Source: AA6agR7nmtkC3H2rGXWkVc5MPJ5csNAZDDyaJhdrIQp6wcJA9xfLEfa8hMO5cs2oGCS5/++TiKn6sJspoXwqiADL1Aw=
X-Received: by 2002:a17:907:929:b0:731:3bb6:d454 with SMTP id
 au9-20020a170907092900b007313bb6d454mr14771971ejc.96.1660192584299; Wed, 10
 Aug 2022 21:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-4-bjorn.andersson@linaro.org> <CAKXuJqhWn8bcG3x-xvyJ5-1kGXBVqCEuG31aHNidCqKA81NSqQ@mail.gmail.com>
In-Reply-To: <CAKXuJqhWn8bcG3x-xvyJ5-1kGXBVqCEuG31aHNidCqKA81NSqQ@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Wed, 10 Aug 2022 23:36:13 -0500
Message-ID: <CAKXuJqiTQxwBdT+ZDkOuRy3+s+XTjWevJr=7+wZN7HKsy6EGbA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dpu: Introduce SC8280XP
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Wed, Aug 10, 2022 at 11:28 PM Steev Klimaszewski <steev@kali.org> wrote:
>
> Hi Bjorn,
>
>
> On Wed, Aug 10, 2022 at 10:58 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > The Qualcomm SC8280XP platform contains DPU version 8.0.0, has 9
> > interfaces, 2 DSI controllers and 4 DisplayPort controllers. Extend the
> > necessary definitions and describe the DPU in the SC8280XP.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Note that MSM_DP_CONTROLLER_3 is also defined in the DP series and as such a
> > trivial conflict will occur when merging the latter of the two series.
> >
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 211 ++++++++++++++++++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 ++
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
> >  drivers/gpu/drm/msm/msm_drv.h                 |   1 +
> >  drivers/gpu/drm/msm/msm_mdss.c                |   2 +
> >  8 files changed, 239 insertions(+)
> >
> <snip>
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index b3689a2d27d7..5978c6e26a1e 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -55,6 +55,7 @@ enum msm_dp_controller {
> >         MSM_DP_CONTROLLER_0,
> >         MSM_DP_CONTROLLER_1,
> >         MSM_DP_CONTROLLER_2,
> > +       MSM_DP_CONTROLLER_3,
> >         MSM_DP_CONTROLLER_COUNT,
> >  };
> >
> This seems to also be part of
> https://lore.kernel.org/r/20220810040745.3582985-6-bjorn.andersson@linaro.org
> (but only th msm_drv.h hunk
Sorry, wrong copy buffer - it's part of this patchset -
https://lore.kernel.org/all/20220810035013.3582848-4-bjorn.andersson@linaro.org/

>
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index e13c5c12b775..7c391fab6263 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -208,6 +208,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >                 writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
> >                 break;
> >         case DPU_HW_VER_600:
> > +       case DPU_HW_VER_800:
> >                 /* TODO: 0x102e for LP_DDR4 */
> >                 writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
> >                 writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
> > @@ -445,6 +446,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >         { .compatible = "qcom,sc7180-mdss" },
> >         { .compatible = "qcom,sc7280-mdss" },
> >         { .compatible = "qcom,sc8180x-mdss" },
> > +       { .compatible = "qcom,sc8280xp-mdss" },
> >         { .compatible = "qcom,sm8150-mdss" },
> >         { .compatible = "qcom,sm8250-mdss" },
> >         {}
> > --
> > 2.35.1
> >
> -- steev
