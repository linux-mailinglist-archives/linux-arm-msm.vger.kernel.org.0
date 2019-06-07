Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237C6397D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 23:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729796AbfFGVe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 17:34:58 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:34946 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbfFGVe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 17:34:58 -0400
Received: by mail-it1-f194.google.com with SMTP id n189so4997618itd.0;
        Fri, 07 Jun 2019 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VR7uEffq8NFspXFmnfI2T/BRI4sqmyVwOkT2yO1GgUU=;
        b=V80xuj+qA9FL52VHgkyQS1flAc5YTEHbuFIgDBcI1xWdvUNYPSSyEyQj4EsIWS01To
         d6p95jIvVqoRHUw4XymUEFIRp7+OkukqYH3DwPucje3kqvAmdx8TjjhY/u10PhkWrFNS
         GDYoGF6ocuvxOFmhwUk4gg03wgeE4fkt1kIDRlaN9/+RzskIPWHJil0aEcJ0Wt8JOAyv
         B6qNq7bUtYtWJs0GhgKaCdfpR3jVaAbZZmRscGW08c4EcqSaDNYxpCuf0PDM1xsI2yqw
         UqdOHOIoavggXKUMhRc+IDDbpEfF5Xw7l7/iGmp/DXpXoIRIQVlVj3Xr86LTY8Ve+RYN
         bxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VR7uEffq8NFspXFmnfI2T/BRI4sqmyVwOkT2yO1GgUU=;
        b=AO7sSHSO15lhm7Ltav84eLA7Cj8iQ9012VUP8wYEMTswMfoVGVcl+BAtrTaQydjXhe
         tiaRXzCTMHhP9rGPvwUd/gj/C3tmCujk8unVvqpcfOrmxcUH3MVO2rW9GBkqEH+PHHyD
         PoRumovoj8n/RJvXOGZT8zo+cAFWVe9LLAxNG+QnTRva53smmXDTYjQ0Z4oyVemneL+Q
         50gKrSxXscFoA1x9uwo+s12ZlBvZrZt8XDUvhNdnAhrtLkYwZE1W/KO08RB6I88sUMFW
         J87YnmQJSbXoemBOTBInZjiz+THPh0hDYrRifq2fkP14uENVu4B12v/ft8BC3b3EMYZv
         +vdg==
X-Gm-Message-State: APjAAAU2dHDE4CbSYybPcIoI4N1JfzyF7eEMV6EXtSGbFdgqkex87ZEX
        alzD3YUGvFtQrKsEcJ7tUc/Nb4iQIoBhsFFkM7g=
X-Google-Smtp-Source: APXvYqyKPbDa+FOTD+B7z0V4g6ihqV1/C/R2tv2LemPd1z+Ctld1YNgoIQ8KLjSSPOSnP3DowNrUTfhlIT12DEDD+js=
X-Received: by 2002:a24:7289:: with SMTP id x131mr6287772itc.62.1559943297481;
 Fri, 07 Jun 2019 14:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
 <20190528164803.38642-1-jeffrey.l.hugo@gmail.com> <20190606230050.2F33720645@mail.kernel.org>
 <CAOCk7NqYptsLkYyfUCSvh0J0FZd_9gPDZJoyjB5Ng4v8aLFUNw@mail.gmail.com> <20190607203245.3AEA320868@mail.kernel.org>
In-Reply-To: <20190607203245.3AEA320868@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 7 Jun 2019 15:34:46 -0600
Message-ID: <CAOCk7NqpTDOe39pAEkMC0eLAVDm-mHc_Xk1Sci8gMDyc6EgqLQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: Add MSM8998 GPU Clock Controller (GPUCC) driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 7, 2019 at 2:32 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-06-07 07:08:46)
> >
> > As you well know, XO is the root clock for pretty much everything on
> > Qualcomm platforms.  We are trying to do things "properly" on 8998.
> > We are planning on having rpmcc manage it (see my other series), and
>
> I don't have the rpmcc series in my queue. I think it needs a resend?

See the "[PATCH v4 0/6] MSM8998 Multimedia Clock Controller" series.

>
> > all the other components consume xo from there.  Unfortunately we
> > cannot control the probe order, particularly when things are built as
> > modules, so its possible gpucc might be the first thing to probe.
> > Currently, the clock framework will allow that since everything in
> > gpucc will just be an orphan.  However that doesn't prevent gpucc
> > consumers from grabbing their clocks, and we've seen that cause
> > issues.
> >
> > As you've previously explained, you have a ton of work to do to
> > refactor things so that a clock will probe defer if its dependencies
> > are not present.  We'd prefer that functionality, but are not really
> > willing to wait for it.  Thus, we are implementing the same
> > functionality in the driver until the framework handles it for us, at
> > which point we'll gladly rip this out.
>
> Can you add more to the comment? Right now it doesn't explain the _why_
> part that you describe in the first paragraph here. That's what I'm
> asking to be put here as a comment. Also, GCC is the one exporting the
> XO clk on this platform so I'm a little lost why we're talking about rpm
> here.

Oh, I see, you wanted the comment expanded.  Sorry I didn't understand
that earlier.  Will do.

>
> I guess I'm left to do the ton of work myself and get to have clk
> providers like this be clk consumers so that probe ordering is correct
> and clks aren't exposed until the whole parent chain exists. This is
> taking a step backwards and causes me to be sad.

I'll take a second look at the list of tasks you outlined, but what I
recall was that most of them went over my head, so I wasn't really
confident in poking my nose in there.

>
> >
> > >
> > > > +       if (IS_ERR(xo))
> > > > +               return PTR_ERR(xo);
> > > > +       clk_put(xo);
> > > > +
> > > > +       regmap = qcom_cc_map(pdev, &gpucc_msm8998_desc);
> > > > +       if (IS_ERR(regmap))
> > > > +               return PTR_ERR(regmap);
> > > > +
> > > > +       /* force periph logic on to acoid perf counter corruption */
> > >
> > > avoid?
> >
> > Yes.  Do you want a v3 with this fixed?
>
> Yes, please resend without the binding patch that I've already applied.
>

Will do.
