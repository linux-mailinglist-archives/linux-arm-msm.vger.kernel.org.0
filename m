Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2107D8C98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Oct 2023 02:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbjJ0AgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 20:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJ0AgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 20:36:01 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045C31B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 17:35:55 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-586753b0ab0so845943eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 17:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698366954; x=1698971754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
        b=SK7PZAym90wWs513+oR25dOXgCMWUIcqNwctSiJ1el5uMYcS2+No7nAW3KcdTrrfxU
         V2/yjKfO10Yupr+OkpfocNRdL0srjNZRETo5NO2h4lk9mRvUOmsjw7vCK8ICJMaxs2w2
         5b4X2JcJJUWwV9035S1EOXToEWGVFjG3w32ljC71nM1BJslvkcmhsdvyVXdBU7aPC5gE
         rxBp80Yl6FrTWR4XHECoFN05bTPtMl8mJ1YCN78mRQVpLW0eSjgjkVBQc2T+H9KVwIVb
         aUWR0cBahCUP74mQWkeKPTupkh2K20NqDdiJIQIZ9qmzeXddSBERwKt4r53fNHh8ISKV
         Lb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698366954; x=1698971754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F80iHno91JCv1Uj52E9vutPeUGQGB84uBRbdzpgvxfY=;
        b=vkdmGQkohpmwlbUFJQmj4vsC16hWSKveHYoSRcQ+0S2t+pDr+wcIl55yV+Ud6Ov1KJ
         fywkgnDNhuWxcKzG90iMPfq5tynqIQb2oYR5WBSIavtLfPeQla42RKsjmC0+Cznq56Vv
         CttqaAWoR7fdHN9YJzXi/y5ER074yOi2iBe/X/hspu7Cx7Z1YGMeF9pBGFtZKlshprR0
         bFoHZWFG4Kk5BSef0NOq8e2zsza7HqJYIGYhWOkYZgRSoJPkN0wqF4FOsMiUa0qLr3NW
         PUyngQnTAlkwlTf57aIEZYamV9Aqy6gXTDwwGbLLb28cs1prNS2e95JDSuOykGXixP3t
         Zwow==
X-Gm-Message-State: AOJu0YybSVldLuyShSek4N8dh1i9X20wFj16wjUycSdAp4u4dIO4WciN
        vH7Xzk87Jkt9OCb2GgQ6tfJZHf3UbOsb02Q5g3Qm2Q==
X-Google-Smtp-Source: AGHT+IEcUzbPOkOWvjp/fe5w7R1pKSB7pe+4Z7WOc6Z7tCpLWBp758kcYR8l2Wn8zbZmVR88yiUuEXQOI6d+Oe8PUJs=
X-Received: by 2002:aca:1907:0:b0:3b2:df83:3aec with SMTP id
 l7-20020aca1907000000b003b2df833aecmr950492oii.54.1698366954184; Thu, 26 Oct
 2023 17:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org> <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20231026225622.GT3553829@hu-bjorande-lv.qualcomm.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Oct 2023 03:35:42 +0300
Message-ID: <CAA8EJpr3VZiyCHCDPh6uhYKOPruLGF=WbOHdGYNZWiZBxU9UMA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked' clock support
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Oct 2023 at 01:56, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Wed, Oct 04, 2023 at 03:31:24AM +0300, Dmitry Baryshkov wrote:
> > clk_rcg2_shared_ops implements support for the case of the RCG which
> > must not be completely turned off. However its design has one major
> > drawback: it doesn't allow us to properly implement the is_enabled
> > callback, which causes different kinds of misbehaviour from the CCF.
>
> I have some behaviors in mind when reading this, others might not.
> Please give some specific behavior(s) here.

Bjorn (and other interested parties). At this RFC stage it would be
really nice to check whether the patch idea is worth the trouble and
if it fixes the issue.

>
> Thanks,
> Bjorn
>
> >
> > Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> > clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> > switched off (and shared most of the implementation with
> > clk_rcg2_shared_ops). The major difference is that it requires that the
> > parent map doesn't conain the safe (parked) clock source. Instead if the
> > CFG_REG register points to the safe source, the clock is considered to
> > be disabled.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rcg.h  |  1 +
> >  drivers/clk/qcom/clk-rcg2.c | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index e6d84c8c7989..9fbbf1251564 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
> >  extern const struct clk_ops clk_pixel_ops;
> >  extern const struct clk_ops clk_gfx3d_ops;
> >  extern const struct clk_ops clk_rcg2_shared_ops;
> > +extern const struct clk_ops clk_rcg2_parked_ops;
> >  extern const struct clk_ops clk_dp_ops;
> >
> >  struct clk_rcg_dfs_data {
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 5183c74b074f..3f52abf0025e 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -5,6 +5,7 @@
> >
> >  #include <linux/kernel.h>
> >  #include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/err.h>
> >  #include <linux/bug.h>
> >  #include <linux/export.h>
> > @@ -1150,6 +1151,39 @@ const struct clk_ops clk_rcg2_shared_ops = {
> >  };
> >  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> >
> > +static int clk_rcg2_park_is_enabled(struct clk_hw *hw)
> > +{
> > +     struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> > +     u32 cfg;
> > +     int ret;
> > +
> > +     if (!clk_rcg2_is_enabled(hw))
> > +             return false;
> > +
> > +     ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
> > +}
> > +
> > +/*
> > + * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
> > + * parent_map. This allows us to implement proper is_enabled callback.
> > + */
> > +const struct clk_ops clk_rcg2_parked_ops = {
> > +     .is_enabled = clk_rcg2_park_is_enabled,
> > +     .enable = clk_rcg2_shared_enable,
> > +     .disable = clk_rcg2_shared_disable,
> > +     .get_parent = clk_rcg2_shared_get_parent,
> > +     .set_parent = clk_rcg2_shared_set_parent,
> > +     .recalc_rate = clk_rcg2_shared_recalc_rate,
> > +     .determine_rate = clk_rcg2_determine_rate,
> > +     .set_rate = clk_rcg2_shared_set_rate,
> > +     .set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
> > +};
> > +EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
> > +
> >  /* Common APIs to be used for DFS based RCGR */
> >  static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
> >                                      struct freq_tbl *f)
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
