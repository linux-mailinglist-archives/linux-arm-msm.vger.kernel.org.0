Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E54514EF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378316AbiD2PRU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378260AbiD2PRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:17:17 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7379ED4CB1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:46 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2f16645872fso88480757b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fOXimSCWoaVOE75jYDyXyVZtWa+IqFp/UvK677qe1Uk=;
        b=PDcGimo/5s3U9nmlgqUxiJVzyUi9WZgblxXKb+cIYX+nHz5/aTWd3qO63NTaYXOIG2
         ephTbM10gm0qGHp9Xg8IAcj7v8rI1/VUay8WcOgm2YfeCARpjP0QIqK0chU9IfVcE5Z5
         rq1YtWNw4KXwRzo3Xt86/LxFUyZDLLXnfWxYLVwuGZYpVasgiXRd3VDh/k2uiV/eY5K9
         zI/Ldu0Nti/Z1IRGPL0IFzgTruprZQH6YooGDmCilYl4UeyvIhr/kSDR1Sp72lAc/2hn
         LpXx2YGPZ4IriZ28HQBctK1zf3Bvp3Ha9WjaX2nfQNnFN0YGFdbR81WVrqZjd00w2bL4
         Sjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fOXimSCWoaVOE75jYDyXyVZtWa+IqFp/UvK677qe1Uk=;
        b=ujupz6dbd3Not1YW0S8MUAv6m7MDQf+57UIJx9jaJkOtjU+ELlelfiPdcoXm5+yd73
         ClbNbXlBVLTcne+TlFnFLinBsPtYJ8I5vGwehmrHYzXzbeO+rVM5+S/s7uL8cQ0aTEtZ
         nr08QXneHyMX/UoVzmbPTvdN1WieEae4reiAd3l0Evsc3HAyz9UXqsbV8oDb7HHUpkTx
         6W73YwABsnHPlKQOD+nkp0CS3wBpxn9DN9S3PY0uy/lkX7AIavTgdsmY9tJX/1fK26Gx
         6FoEgbsghoe7HgQW3wEl4VUGbtatnoZZEhg13BxSr8Wc2aqpQQHMi5CJw/+p7xV9QYN4
         2KOw==
X-Gm-Message-State: AOAM532X3MDbTvdH8vkPv2r066nZci7Zl0f5QL8K2x5/JQog9QIkRaL4
        I7eATtwnNwenqftCITiCQiI2ymeFZpbcnqMa3yJf2Q==
X-Google-Smtp-Source: ABdhPJyU2T98l+dDUUN+TqVFXfp4urNMrgRil/xWQSQfajPv5Q5lFfjL9/rvXHau5ituz1aDGEmtlFm20S6u5dxO8UI=
X-Received: by 2002:a81:5603:0:b0:2f8:3187:f37a with SMTP id
 k3-20020a815603000000b002f83187f37amr16995409ywb.255.1651245225429; Fri, 29
 Apr 2022 08:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220429120108.9396-1-ansuelsmth@gmail.com> <20220429120108.9396-5-ansuelsmth@gmail.com>
 <1f013429-8a5b-47c8-a146-41bb66af3f03@linaro.org> <626c0034.1c69fb81.d55d4.4f09@mx.google.com>
In-Reply-To: <626c0034.1c69fb81.d55d4.4f09@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 18:13:34 +0300
Message-ID: <CAA8EJpqF74gUrPnOjVmZhwmdE-sR4G_SCOxK6Wvmh1ss1Rv_jA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: qcom: clk-krait: add apq/ipq8064 errata workaround
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Apr 2022 at 18:11, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 06:00:45PM +0300, Dmitry Baryshkov wrote:
> > On 29/04/2022 15:01, Ansuel Smith wrote:
> > > Add apq/ipq8064 errata workaround where the sec_src clock gating needs to
> > > be disabled during switching. To enable this set disable_sec_src_gating
> > > in the mux struct.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >   drivers/clk/qcom/clk-krait.c | 16 ++++++++++++++++
> > >   drivers/clk/qcom/clk-krait.h |  1 +
> > >   drivers/clk/qcom/krait-cc.c  |  1 +
> > >   3 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> > > index 6c367ad6506a..4a9b3296c45b 100644
> > > --- a/drivers/clk/qcom/clk-krait.c
> > > +++ b/drivers/clk/qcom/clk-krait.c
> > > @@ -18,13 +18,23 @@
> > >   static DEFINE_SPINLOCK(krait_clock_reg_lock);
> > >   #define LPL_SHIFT 8
> > > +#define SECCLKAGD  BIT(4)
> > > +
> > >   static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
> > >   {
> > >     unsigned long flags;
> > >     u32 regval;
> > >     spin_lock_irqsave(&krait_clock_reg_lock, flags);
> > > +
> > >     regval = krait_get_l2_indirect_reg(mux->offset);
> > > +
> > > +   /* apq/ipq8064 Errata: disable sec_src clock gating during switch. */
> > > +   if (mux->disable_sec_src_gating) {
> > > +           regval |= SECCLKAGD;
> > > +           krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   }
> > > +
> > >     regval &= ~(mux->mask << mux->shift);
> > >     regval |= (sel & mux->mask) << mux->shift;
> > >     if (mux->lpl) {
> > > @@ -33,6 +43,12 @@ static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
> > >     }
> > >     krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   /* apq/ipq8064 Errata: re-enabled sec_src clock gating. */
> > > +   if (mux->disable_sec_src_gating) {
> > > +           regval &= ~SECCLKAGD;
> > > +           krait_set_l2_indirect_reg(mux->offset, regval);
> > > +   }
> > > +
> > >     /* Wait for switch to complete. */
> > >     mb();
> > >     udelay(1);
> > > diff --git a/drivers/clk/qcom/clk-krait.h b/drivers/clk/qcom/clk-krait.h
> > > index 9120bd2f5297..f930538c539e 100644
> > > --- a/drivers/clk/qcom/clk-krait.h
> > > +++ b/drivers/clk/qcom/clk-krait.h
> > > @@ -15,6 +15,7 @@ struct krait_mux_clk {
> > >     u8              safe_sel;
> > >     u8              old_index;
> > >     bool            reparent;
> > > +   bool            disable_sec_src_gating;
> > >     struct clk_hw   hw;
> > >     struct notifier_block   clk_nb;
> > > diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
> > > index 4d4b657d33c3..0f88bf41ec6e 100644
> > > --- a/drivers/clk/qcom/krait-cc.c
> > > +++ b/drivers/clk/qcom/krait-cc.c
> > > @@ -138,6 +138,7 @@ krait_add_sec_mux(struct device *dev, int id, const char *s,
> > >     mux->parent_map = sec_mux_map;
> > >     mux->hw.init = &init;
> > >     mux->safe_sel = 0;
> > > +   mux->disable_sec_src_gating = true;
> >
> > This has to be guarded with the of_compatible checks. Otherwise you'd apply
> > this errata to all Krait CPUs, not only apq/ipq8064.
> >
> > At least this should be limited to krait-cc-v1 with the note that there is
> > no way to distinguish between platforms.
> >
>
> Mhh can't i check the machine compatible directly to limit this to
> apq/ipq8064?

Yes, use of_machine_is_compatible(). Add a comment that you have to do
this because of the lack of soc-specific device compats.

> > >     init.name = kasprintf(GFP_KERNEL, "krait%s_sec_mux", s);
> > >     if (!init.name)
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
>         Ansuel



-- 
With best wishes
Dmitry
