Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A924E38C36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfFGOI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 10:08:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35578 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727840AbfFGOI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 10:08:57 -0400
Received: by mail-io1-f68.google.com with SMTP id m24so1514512ioo.2;
        Fri, 07 Jun 2019 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pCTc9jsipUoi63VdTLHDq+J3b8osAzXSjDn0slmiFY4=;
        b=oZzuXtFmut9n4jR87BPzOqCINKRM9d9nSOlA6LqyRGYVMnHoDIUSN9iFKe90wej7tj
         ER264ZUFfBAIEY7euu1cZrEfDEYSPp1k0fUGak9xE4t3kiVlffd9gM6ifqgbIsLm0wQT
         EXMSkFJAQxgYbX4a/bNoZiaxCcIzhpCcFC8l4ydxf7k4krU3sb05f4qZAtfeb5dsW+Zk
         UkTV30CxUjgiJghfILJ3nDVUnr8+55ZF3+0gu1qLivvcLNjC6yfjL8nf5lmjjlwcneqQ
         2xWGjRySqeiw2Gd4OVJpRzLJQ9KmFmZV4xJTMWPDTp4DspPpPCbJWx3pjTe8ZxPlb6QB
         Rjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pCTc9jsipUoi63VdTLHDq+J3b8osAzXSjDn0slmiFY4=;
        b=pOoJ/nFaKP1jDW2JnG66Uta608iDW3JQ+2mrdW8dyqrF+zyaiqeLZs+cSUfCgAQUbC
         B2CfQEB1J+gYr7iMlwpzSNXERJyBo/uaqwMsjft114YVmMla97tszl79VP/QTzqP7Suw
         uytPWnubjPpW577vWGBwjQgawFmRNBQdSm+c8+ExyYEUP8Nsth7fX47dba7SXguQwpLi
         uO4axy8FIS4UmXjEZN+2Qcz1s/boCqEXkj26jwvGTGPJEG9keG8RoGl6/NaRk0T48jim
         1PCK+yFZCVLnpx4r0DMJ1kDEUCENenvuDtS0tHhtymovlAiS1qKAnlL7+5FcrhB1RMca
         soFw==
X-Gm-Message-State: APjAAAUwLzxOpMYkCCYGBhoWYDiltf2Yf2AHvdvTRRayF0xWuYfVgrDb
        0nVoQcEHFumWsd1g7+itEW95EaE36PLZcoyFLYc=
X-Google-Smtp-Source: APXvYqwbSPhjuuMf9/v2tEx2rOUvzTVYr08r5T2FJscY80vogA7xlSoSgNUAMJ8dWw2gCLnxFBofO3r6QgiBpUMMqxE=
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr15641346iod.166.1559916536908;
 Fri, 07 Jun 2019 07:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190528164616.38517-1-jeffrey.l.hugo@gmail.com>
 <20190528164803.38642-1-jeffrey.l.hugo@gmail.com> <20190606230050.2F33720645@mail.kernel.org>
In-Reply-To: <20190606230050.2F33720645@mail.kernel.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 7 Jun 2019 08:08:46 -0600
Message-ID: <CAOCk7NqYptsLkYyfUCSvh0J0FZd_9gPDZJoyjB5Ng4v8aLFUNw@mail.gmail.com>
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

On Thu, Jun 6, 2019 at 5:00 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Jeffrey Hugo (2019-05-28 09:48:03)
> > diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
> > new file mode 100644
> > index 000000000000..e45062e40718
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gpucc-msm8998.c
> > +
> > +static int gpucc_msm8998_probe(struct platform_device *pdev)
> > +{
> > +       struct regmap *regmap;
> > +       struct clk *xo;
> > +
> > +       /*
> > +        * We must have a valid XO to continue until orphan probe defer is
> > +        * implemented.
> > +        */
> > +       xo = clk_get(&pdev->dev, "xo");
>
> Why is this necessary?

As you well know, XO is the root clock for pretty much everything on
Qualcomm platforms.  We are trying to do things "properly" on 8998.
We are planning on having rpmcc manage it (see my other series), and
all the other components consume xo from there.  Unfortunately we
cannot control the probe order, particularly when things are built as
modules, so its possible gpucc might be the first thing to probe.
Currently, the clock framework will allow that since everything in
gpucc will just be an orphan.  However that doesn't prevent gpucc
consumers from grabbing their clocks, and we've seen that cause
issues.

As you've previously explained, you have a ton of work to do to
refactor things so that a clock will probe defer if its dependencies
are not present.  We'd prefer that functionality, but are not really
willing to wait for it.  Thus, we are implementing the same
functionality in the driver until the framework handles it for us, at
which point we'll gladly rip this out.

>
> > +       if (IS_ERR(xo))
> > +               return PTR_ERR(xo);
> > +       clk_put(xo);
> > +
> > +       regmap = qcom_cc_map(pdev, &gpucc_msm8998_desc);
> > +       if (IS_ERR(regmap))
> > +               return PTR_ERR(regmap);
> > +
> > +       /* force periph logic on to acoid perf counter corruption */
>
> avoid?

Yes.  Do you want a v3 with this fixed?

>
> > +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(13), BIT(13));
> > +       /* tweak droop detector (GPUCC_GPU_DD_WRAP_CTRL) to reduce leakage */
> > +       regmap_write_bits(regmap, gfx3d_clk.clkr.enable_reg, BIT(0), BIT(0));
> > +
> > +       return qcom_cc_really_probe(pdev, &gpucc_msm8998_desc, regmap);
> > +}
> > +
