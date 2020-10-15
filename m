Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92C428EA01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 03:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388518AbgJOB3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 21:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732227AbgJOB3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 21:29:40 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752A3C002164
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:11:06 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id d4so444469vsk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vuT8pXckD4G5mqRoDaNZXfyEuBjKdvi4YHo538crQqA=;
        b=kDj1thWfBp9ND5fsIRzzlQxx3hC0LGm7cEqbBEnwd+XGDqir5G+X1UucDnUoE80iky
         Qqdu7RThHoo/lxJctjAGvQYixQMIk5qX6xV/XsPyg8LG/Ttk8lPGRAC/L1YHDHF4QNX6
         ljvgAoqkK/ciKTKi0NaX4YCwned85FNcuxZzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vuT8pXckD4G5mqRoDaNZXfyEuBjKdvi4YHo538crQqA=;
        b=n/E8I0xp4CZsUZakovynMYhFxE9AmYojDXHbTC+h3zk8rHboozK1Pbfd0E2155cFe9
         QNSa9MaqXZPEnorEF/NRQmhm4E+xmrDJuOXpmHqTJQjwb3KCgUCYp7JzYCWnt0cgKnah
         Ct31/Ju9/x4zDN68FNTEYl+BthPoNjEPxhAd0hZnvsvTpt6X91YCa/DQ1B8KOlo9R3VQ
         LPYiXVQOkyWE0krJVw5tINB22hJUPhS8S5MHe61YoNXz+pKNQmeuk8QVUbwagTG7th4W
         MtpBsImrgvVI1XdA7MnualNRlFoB9clRc5jauirOeh67w4ZD37wFcrhsqPI5J2z6/hRz
         Q36A==
X-Gm-Message-State: AOAM530OXuo/o2mxuxVqeS5qrV7yFR36NNrsYsv3ZEwZqSQNy/L+haf/
        6nvqVgncsRoRiecWQgPAbjjqffguGi57fw==
X-Google-Smtp-Source: ABdhPJx/9A3bxy2zil21iQGh4J8Vs/y2KyLSmkKF41gTVMXg32hF0wGFxTr9gEaFeRrr0Kw6HQgHZg==
X-Received: by 2002:a05:6102:36f:: with SMTP id f15mr1249773vsa.21.1602720665276;
        Wed, 14 Oct 2020 17:11:05 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 1sm145139vsv.10.2020.10.14.17.11.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 17:11:04 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id c7so308911uaq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:11:04 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr875001uad.104.1602720663718;
 Wed, 14 Oct 2020 17:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid>
 <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
 <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
 <160271644762.884498.446447786516269652@swboyd.mtv.corp.google.com>
 <CAD=FV=VTEQMqnmC_OMtADTdrs+2zxCd8ODSRpxtxP6SKBnx2qg@mail.gmail.com> <160271840430.884498.12165227808003957407@swboyd.mtv.corp.google.com>
In-Reply-To: <160271840430.884498.12165227808003957407@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 17:10:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUTTGLNHe2pESfbWaXSxs1u4BOVgru6ic4arGgYkZdVg@mail.gmail.com>
Message-ID: <CAD=FV=UUTTGLNHe2pESfbWaXSxs1u4BOVgru6ic4arGgYkZdVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 4:33 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2020-10-14 16:07:52)
> > Hi,
> >
> > On Wed, Oct 14, 2020 at 4:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Doug Anderson (2020-10-14 15:28:58)
> > > > Hi,
> > > >
> > > > On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > > Quoting Douglas Anderson (2020-10-14 14:05:22)
> > > > > > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > index abcf36006926..48d370e2108e 100644
> > > > > > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > > > > > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> > > > > >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> > > > > >  };
> > > > > >
> > > > > > +static void lpass_pm_runtime_disable(void *data)
> > > > > > +{
> > > > > > +       pm_runtime_disable(data);
> > > > > > +}
> > > > > > +
> > > > > > +static void lapss_pm_clk_destroy(void *data)
> > > > > > +{
> > > > > > +       pm_clk_destroy(data);
> > > > > > +}
> > > > >
> > > > > Why are these helpers added again? And do we even need them? Can't we
> > > > > just pass pm_runtime_disable or pm_clk_destroy to the
> > > > > devm_add_action_or_reset() second parameter?
> > > >
> > > > Unfortunately, we can't due to the C specification.  Take a look at
> > > > all the other users of devm_add_action_or_reset() and they all have
> > > > pretty much the same stupid thing.
> > >
> > > Ok, but we don't need two of the same functions, right?
> >
> > How would you write it more cleanly?
>
> Oh I see I'm making it confusing. Patch 1 has two functions for
> pm_runtime_disable() and pm_clk_destroy(), called
> lpass_pm_runtime_disable() and lapss_pm_clk_destroy() respectively
> (please fix the lapss typo regardless).

Oops, sorry for the typo.


> Then this patch seems to introduce them again, but really the diff is
> getting confused and it looks like the functions are introduced again.
> Can you move them to this location (or at least near it) in the first
> patch so that this doesn't look like they're being introduced again?

Yeah.  v4 coming up soon then.


> > > > ...actually, do we even need the runtime_disable in the error path?
> > > > When the dev goes away does it matter if you left pm_runtime enabled
> > > > on it?
> > > >
> > >
> > > I don't know. The device isn't destroyed but maybe when the driver is
> > > unbound it resets the runtime PM counters?
> >
> > Certainly it seems safest just to do it...
> >
>
> Can you confirm? I'd rather not carry extra code.

Confirmed that we need it.  Specifically from
"Documentation/power/runtime_pm.rst"

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

It's my assertion that having it in devm is as good as having it in
the remove() callback because devres_release_all() follows the
remove() calls in base/dd.c
