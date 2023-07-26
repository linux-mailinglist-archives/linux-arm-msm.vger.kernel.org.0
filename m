Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC99576424F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 00:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjGZW7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 18:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjGZW7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 18:59:06 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A662719
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 15:59:05 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so300009276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 15:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690412344; x=1691017144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LLPxlJY6xMNij1uxNCT+9JnGOcfjMwxi0ypn4kc4QcI=;
        b=sGsJW/DXs0JW1/Y5dDHNFxcGOHCXYlCLqtnXO2cW6DVNTcYjm+3NFC03qwZK6Dw785
         cff2pdY9nWocIt5Sv0qtguxPYDT67ATu0SpPYAVJeq5Bz+QEsYtcMCzuHhXu+hgy9XVD
         PU9eHCm3pAt7qm0iET1TiHlrcd8T/MEduaMAmxYp06ZOlat40YXQrI+bIJGfgWUyMS9Q
         8XlfAD06WNpxJC3mISQN5ErtIGEsjetGmjyvlRwUQVdyzrrMn7lbzMoVZtosDM0yolXK
         xElKzvY+ZfquZ7xO7kR7T4P5hqE5Q3c5JdmYoS8juI7hGmUGFlRwy9/4KYMbWKj4slcB
         vqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690412344; x=1691017144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLPxlJY6xMNij1uxNCT+9JnGOcfjMwxi0ypn4kc4QcI=;
        b=GG0htS/ZTkx/V9LxqUNfTVBuFGJlQ86IUPZq2TkextCiuRX0GaokFJnPSy+rqH834K
         VqWGNwo2GYl86dF3ymlA2/nL+t2Qm92npCsXt+YzOhEA6R7nGP824vlkxxHuH/6m6Zh5
         JmBqfAJPY5Ui2jzFaWXgZUom9fg/a0Em7FVf6diw5NZL53CtAFQtuAht+c8cDQLZUOKB
         93p68s6pingHsUwzpN3CNv+i2Nl0X8DdWD+VMyIVMfCH1UDtr61yfZGWP59QW5/JsuYH
         kUKuDxMl3T7Mw1D7TAze7WvCZmOurLuLXQpVDixRZDj8nQ3YF43/PXAorV8NPIM2CUKv
         z1ZQ==
X-Gm-Message-State: ABy/qLYoPSDR/rsra36WHeJY/Hg2XDThyqYFYHV8v1pKJRBovVr56hyy
        LIrwQch3ReXUjRp8JIx0Hfkfw5fAyB+/qGtcRN4RCw==
X-Google-Smtp-Source: APBJJlEhMIIJoDGx1VebdDsKuEknBTMFauNXvw2DPBpUTgTScfeiZkBukCTHaKhe0y90KSQm9unWqbnhQGCyDKLDgNs=
X-Received: by 2002:a25:ca13:0:b0:d0b:f845:c831 with SMTP id
 a19-20020a25ca13000000b00d0bf845c831mr3393948ybg.13.1690412344670; Wed, 26
 Jul 2023 15:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org> <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
In-Reply-To: <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 27 Jul 2023 01:58:53 +0300
Message-ID: <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/mdss: populate missing data
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Jul 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> > As we are going to use MDSS data for DPU programming, populate missing
> > MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
> > programming, so skip them.
> >
>
> Can you pls point me to the downstream references you used for msm8998?

msm-3.18, drivers/video/msm/mdss/mdss_mdp.c

See the function mdss_mdp_hw_rev_caps_init(). It sets has_ubwc for MDP
1.07 (msm8996), 1.14 (msm8937) / 1.16  (msm8953) and 3.0 (msm8998).

> Was that just taken from catalog? If so I would ask for the reference
> for the catalog too.
>
> As per the register the decoder version is 0x0 and not 1.
>
> Even encoder version is 0 from what i see and not 1. Thats why a
> dec_version of UBWC_1_0 is not doing anything i assume.
>
> Some additional questions:
>
> 1) Does the whole chunk in dpu_hw_sspp_setup_format() which handles ubwc
> programming need to be protected by if (ctx->ubwc) now ?

It's hard to discuss the question which is irrelevant for this patch.
Nevertheless, yes, it needs to be protected because e.g. qcm2290
doesn't have UBWC support.

> 2) The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
> catalog for the encoder version in the first place? Because looking at
> the registers UBWC_x_x is the correct value.

Huh. This definitely should be asked next to the code that you wish to
discuss. The DPU_HW_UBWC_VER_xx values come from the first DPU
revision.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
> >   1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index ed836c659688..9bb7be4b9ebb 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >        * UBWC_n and the rest of params comes from hw data.
> >        */
> >       switch (msm_mdss->mdss_data->ubwc_dec_version) {
> > +     case 0: /* no UBWC */
> > +     case UBWC_1_0:
> > +             /* do nothing */
> > +             break;
> >       case UBWC_2_0:
> >               msm_mdss_setup_ubwc_dec_20(msm_mdss);
> >               break;
> > @@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
> >       return 0;
> >   }
> >
> > +static const struct msm_mdss_data msm8998_data = {
> > +     .ubwc_enc_version = UBWC_1_0,
> > +     .ubwc_dec_version = UBWC_1_0,
> > +     .highest_bank_bit = 1,
> > +};
> > +
> > +static const struct msm_mdss_data qcm2290_data = {
> > +     /* no UBWC */
> > +     .highest_bank_bit = 0x2,
> > +};
> > +
> >   static const struct msm_mdss_data sc7180_data = {
> >       .ubwc_enc_version = UBWC_2_0,
> >       .ubwc_dec_version = UBWC_2_0,
> >       .ubwc_static = 0x1e,
> > +     .highest_bank_bit = 0x3,
> >   };
> >
> >   static const struct msm_mdss_data sc7280_data = {
> > @@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
> >       .ubwc_dec_version = UBWC_2_0,
> >       .ubwc_swizzle = 7,
> >       .ubwc_static = 0x11f,
> > +     .highest_bank_bit = 0x1,
> >   };
> >
> >   static const struct msm_mdss_data sm8250_data = {
> > @@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
> >
> >   static const struct of_device_id mdss_dt_match[] = {
> >       { .compatible = "qcom,mdss" },
> > -     { .compatible = "qcom,msm8998-mdss" },
> > -     { .compatible = "qcom,qcm2290-mdss" },
> > +     { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
> > +     { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> >       { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> >       { .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
> >       { .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },



-- 
With best wishes
Dmitry
