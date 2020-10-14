Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46C28EAB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 04:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgJOCEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 22:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbgJOCEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 22:04:38 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2232DC05BD0B
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 15:29:13 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id d19so348945vso.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFNmhfthsf5pFmuohFdBe/J1wSqD3GGj/IpnA7g1A30=;
        b=ElM2+r+wNX9S0QX15/URuzFWDAgrQuroEb/3vWVNqelEtF3zeNVJX5JYXXEHfLzm8b
         1+VO0qGMtKHyuKoYmWKxcRcr38VNqOCXnxuvQ49A318FaWwdq5hv+zGSlBBIen0PvDjH
         1UKWTabxwoO4qh6CK3L1+Mxnl9lwc5CuqFAvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFNmhfthsf5pFmuohFdBe/J1wSqD3GGj/IpnA7g1A30=;
        b=e5hlMz+oNbtkcjhkq35YbYbtij0+fo2U9r/MBz7mt3KfLLiFfEyB3/6DowV09FcaUb
         Cl3I5Qb3FOQFzXDbNrtcIWRZTThsCU0GNWAI6TISa1uSsBcadPAtu/y2LtOFEEqCC959
         6bDUfIT2qwUhMwoWItMajGk27ImLTYoE5cSH83EqYqkIu2vZNfWhSuMgH2/HFV51gfeP
         tKzDm0EBiZD9qSlh9L/3l2dcOlpH5OVML400/F4ujUp5eo+RmppU3Np16vAjkFG1Gh2E
         tHaiUF7rFhdesR+nVKpnFrvQ+HaINBrGK7c8f834OkAsuC+DWGnqUaNN6nSAExAF3+6L
         tfFw==
X-Gm-Message-State: AOAM531c9KzZux40rV2tAaiR1n5xsn1oLQsWnciPHpggkW2YLNED4w9V
        PGUy6zGJY3u20kTliq+Ft0iZ4IkZDiVTog==
X-Google-Smtp-Source: ABdhPJxTC1dLarVlyfkm3YBxlJY+tDJYvs9JZF9aQdl4cJLBi0UpiOfbU/ZZrYczSuFjBZPCl35/7Q==
X-Received: by 2002:a05:6102:52c:: with SMTP id m12mr1066052vsa.40.1602714551847;
        Wed, 14 Oct 2020 15:29:11 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a124sm108050vsd.18.2020.10.14.15.29.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id k12so106563uad.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr725901uad.104.1602714550250;
 Wed, 14 Oct 2020 15:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.2.I75c409497d4dea9daefa53ec5f93824081c4ecbe@changeid> <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
In-Reply-To: <160271345117.884498.6375969749730135625@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 15:28:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
Message-ID: <CAD=FV=UipL42FLRARc4V34bqEukaB=WQzAdr2Si2RUjPaAmE4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: lpass-sc7180: Disentangle the two clock devices
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
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

On Wed, Oct 14, 2020 at 3:10 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 14:05:22)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index abcf36006926..48d370e2108e 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -356,12 +356,48 @@ static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
> >         .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
> >  };
> >
> > +static void lpass_pm_runtime_disable(void *data)
> > +{
> > +       pm_runtime_disable(data);
> > +}
> > +
> > +static void lapss_pm_clk_destroy(void *data)
> > +{
> > +       pm_clk_destroy(data);
> > +}
>
> Why are these helpers added again? And do we even need them? Can't we
> just pass pm_runtime_disable or pm_clk_destroy to the
> devm_add_action_or_reset() second parameter?

Unfortunately, we can't due to the C specification.  Take a look at
all the other users of devm_add_action_or_reset() and they all have
pretty much the same stupid thing.  This is a pretty great grep, for
instance:

git grep devm_add_action_or_reset.*clk_disable_unprepare

I did a quick Google search and the top hit was a stack overflow that
explained it:

https://stackoverflow.com/questions/559581/casting-a-function-pointer-to-another-type

The net-net is that the answer there says:

> Hence, since a void* is not compatible with a struct my_struct*, a
> function pointer of type void (*)(void*) is not compatible with a
> function pointer of type void (*)(struct my_struct*), so this
> casting of function pointers is technically undefined behavior.

I suppose I could try to add devm variants of these functions
somewhere more general if you think it's a good idea, though there it
seems like there's not a huge need since these two greps are zero:

git grep devm_add_action_or_reset.*runtime_disable
git grep devm_add_action_or_reset.*pm_clk_destroy

...actually, do we even need the runtime_disable in the error path?
When the dev goes away does it matter if you left pm_runtime enabled
on it?

-Doug
