Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B3464009C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 07:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbiLBGjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 01:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbiLBGjY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 01:39:24 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F90D77426
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 22:39:23 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3876f88d320so39655477b3.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 22:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kikY3IcwaZagWEbuTkKCMYSUl9bP97jYT1cght6uEHg=;
        b=SHRmjHPKD95J5/4EDFILLaH7P6016n9nafkE0BD6HoJEJUntiBOxwMDv1gTVK9N3Az
         +/nfnxK0t7jnPpBFKtVTmIXqX3+Jj0XQF7YcKJJE7tfXZIWgq9YirQBcHNBl1m7neiBc
         lgamho9GwSrQKsVDpjX7VydhUR+S4D03V6fAW6j8sTJPXZ8tVceJvn5ovdBMm50SzfsK
         U1amwiXF3mVAW2BD39ttXTvnWYA4AkZRSDvHwCMETsvVIkCG1jufaSL0/liBuqDHNQPf
         fS8FVEoPvzKzOw2zUwtOrxJSAXYsV9VfhYiBAn7RjNMJiABcfQMQAvpBaCPvaRB4qL3+
         2Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kikY3IcwaZagWEbuTkKCMYSUl9bP97jYT1cght6uEHg=;
        b=Z0GalfBzwaO+IVrChsS2HRLxfeDVf4+cisgLyRkq+YvhHgQdwkgIwX9WVnbK2VQPP4
         3zkCc7CZB3gAHH+NU+VSOiQBzPwjAihrgET3LI9D5ctHRYRieBKV7bKStByLyhNB2zVu
         5NtcluyGMhIgw4bXpvUN/Hvg2bxUnNBL5csdIy+EMUSyGPzZdREZ77t40d05Z+Vmp7ou
         /WxAg2wse7B7uCEzbVWAQYvUirhQzp9e/xa45mlRMD6vHtdmSc6uni20pg5tFWu+Jbo0
         1CST+BXbamkHfMAicM6oW7luU5pf8sEAwadz6blm+NouTzgCLZnoDqb4yvG5ygJ+w5A3
         9Iwg==
X-Gm-Message-State: ANoB5pn0dVAIek5heYVlUF1YM5fH+9sDusfJujU07gRRYzRqr6lZmJID
        Qec1W0vt7Q93f5B4FHa8Bkg0ma02akw7cw5EhC+BByH3DUeWfkSy
X-Google-Smtp-Source: AA0mqf5oUVXa1tQXXicX5lpRIlr1WED5PlHwsHQSifqrQeHPI0ecQebxjwiUaGN4PPlx7hMsDOUID0fHCu5JAkgSUlc=
X-Received: by 2002:a0d:d103:0:b0:370:4c23:eacc with SMTP id
 t3-20020a0dd103000000b003704c23eaccmr67437149ywd.127.1669963162568; Thu, 01
 Dec 2022 22:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-5-dmitry.baryshkov@linaro.org> <20221201232240.7luz2hfsao345o6v@builder.lan>
In-Reply-To: <20221201232240.7luz2hfsao345o6v@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Dec 2022 08:39:11 +0200
Message-ID: <CAA8EJprM6dBAPvibnNYnCb1EO262TmrSda7Rga1t-xfyqvor3w@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] clk: qcom: rpmh: remove platform names from BCM clocks
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2 Dec 2022 at 01:22, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Nov 30, 2022 at 03:09:57PM +0200, Dmitry Baryshkov wrote:
> > There are no platform-specific parts in the BCM clocks, drop the
> > platform name from the clock definitions, replacing it with clk_rpmh to
> > have the common prefix.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
> >  1 file changed, 26 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 00c0c8f851bd..5044f9fa156d 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -119,8 +119,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
> >       __DEFINE_CLK_RPMH(_platform, _name, _res_name,                  \
> >                         CLK_RPMH_VRM_EN_OFFSET, 1, _div)
> >
> > -#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)             \
> > -     static struct clk_rpmh _platform##_##_name = {                  \
> > +#define DEFINE_CLK_RPMH_BCM(_name, _res_name)                                \
> > +     static struct clk_rpmh clk_rpmh_##_name = {                     \
> >               .res_name = _res_name,                                  \
> >               .valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),        \
> >               .div = 1,                                               \
> > @@ -368,11 +368,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
> >
> >  DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
> >
> > -DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
> > -DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
> > -DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> > -DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
> > -DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
> > +DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> > +DEFINE_CLK_RPMH_BCM(ce, "CE0");
> > +DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> > +DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> > +DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>
> Would you mind sorting these alphabetically?

Sure, will do.


>
> Thanks for cleaning this up!
> Bjorn
>
> >
> >  static struct clk_hw *sdm845_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK]          = &sdm845_bi_tcxo.hw,
> > @@ -387,8 +387,8 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
> >       [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> >       [RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> >       [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_CE_CLK]           = &sdm845_ce.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_CE_CLK]           = &clk_rpmh_ce.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
> > @@ -407,8 +407,8 @@ static struct clk_hw *sdm670_rpmh_clocks[] = {
> >       [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> >       [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> >       [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_CE_CLK]           = &sdm845_ce.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_CE_CLK]           = &clk_rpmh_ce.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
> > @@ -423,8 +423,8 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
> >       [RPMH_RF_CLK1_A]        = &sc8180x_rf_clk1_ao.hw,
> >       [RPMH_RF_CLK2]          = &sc8180x_rf_clk2.hw,
> >       [RPMH_RF_CLK2_A]        = &sc8180x_rf_clk2_ao.hw,
> > -     [RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> > @@ -463,7 +463,7 @@ static struct clk_hw *sc7180_rpmh_clocks[] = {
> >       [RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> >       [RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> >       [RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
> > @@ -528,9 +528,9 @@ static struct clk_hw *sm8350_rpmh_clocks[] = {
> >       [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> >       [RPMH_RF_CLK5]          = &sm8350_rf_clk5.hw,
> >       [RPMH_RF_CLK5_A]        = &sm8350_rf_clk5_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]          = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
> > @@ -543,9 +543,9 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> >       [RPMH_CXO_CLK_A]        = &sdm845_bi_tcxo_ao.hw,
> >       [RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
> >       [RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]          = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
> > @@ -568,7 +568,7 @@ static struct clk_hw *sm8450_rpmh_clocks[] = {
> >       [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> >       [RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> >       [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
> > @@ -587,9 +587,9 @@ static struct clk_hw *sc7280_rpmh_clocks[] = {
> >       [RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
> >       [RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
> >       [RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]      = &sdm845_ipa.hw,
> > -     [RPMH_PKA_CLK]      = &sm8350_pka.hw,
> > -     [RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
> > +     [RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
> > +     [RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
> > +     [RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
> > @@ -626,8 +626,8 @@ static struct clk_hw *sdx65_rpmh_clocks[] = {
> >       [RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> >       [RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
> >       [RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
> > -     [RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> > -     [RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> > +     [RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> > +     [RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
> >  };
> >
> >  static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> > --
> > 2.35.1
> >



-- 
With best wishes
Dmitry
