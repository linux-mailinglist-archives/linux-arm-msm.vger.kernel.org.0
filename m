Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24073A2076
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbfH2QOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:14:17 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46629 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfH2QOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:14:16 -0400
Received: by mail-qt1-f196.google.com with SMTP id j15so4224190qtl.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdsbyusGiMRkq6kSVVJ1Tni1iJ0D5Lbbif3gwg/K05I=;
        b=rwH2W+E9cpx2iUbbR7UKUGi/jJ6G+nWXtKfJWQvfIh0dWzORi2lxzSjWDUtlwhjDDt
         u0Z+A9YIB1GzPOnTHPPY3i7BDquPMoJs4nu+mpurcn+a10tVRAsAMHCb8KLywlqlEUq8
         o1HgP+Z2B3/laH1886ucMyl55HHZBKdx+nrNEpFCC40oz37OGfIiRkeWfqE5xeEQ/PH1
         /+V3V/fVNEAUTMK0aajSgJffJLVB0iQx2TviNLCuyUoQ5F7+aBqM9iKiKVfGBs9l+z/S
         zqP5ijZOw6SuO5gbwOZfiO3zywp9PewKIkRlQ7eftXdJTauLMWQpmMdJrLXYEh5ghwmV
         VIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdsbyusGiMRkq6kSVVJ1Tni1iJ0D5Lbbif3gwg/K05I=;
        b=XXWgi5naJ+WO8r8uWyAYktgFXdsyASCChzMcR9A1eWZlhIz4HG5c9FI08lbDoK4jI5
         NbRb5dKn9GR3kUpdSa9ts6dz7uxh1ykEd3O/j8rD18NU877yoxkLSj2iLKw6U7dvHkUZ
         ubDUQBx9hN2iOZ9rnBJfyjYgyzIsnKr0gQUC4fRYqoREtWtm0xnN0J1vE5IdP9/I2MiR
         E7X1pG0JmhnYw7mbUDo3jo442i8g5MqMzrTm2ix7P2aSFW72qHoqw6VHNVJyzTW+4xgz
         KIlMtgHcAv6p7eLbNcJrbiWIUNd3g62myixt5nfazfIUbMwlyhMnEpdxdDS3k2xU6AXa
         ywgA==
X-Gm-Message-State: APjAAAXITHLFsmLaXS399pzPmvbm4CUTnkVJlBs2MOzXnNL1vaSy4mHj
        anmATDMSxpIjMBvhTqcwxFzWaREjILqKzSsC/0t65w==
X-Google-Smtp-Source: APXvYqzj6FfEUctPCaUrep4Pr2nFnlVE+D9Q0UCJJ9LCNcByKgj2f+9/1JxEaBfdMrP14mUMcPjz6vkLNAQTrT9ghSI=
X-Received: by 2002:ac8:4612:: with SMTP id p18mr10715186qtn.49.1567095255854;
 Thu, 29 Aug 2019 09:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <93fa782bde9c66845993ff883532b3f1f02d99e4.1566907161.git.amit.kucheria@linaro.org>
 <20190829140459.szauzhennltrwvg4@holly.lan> <CAHLCerNuycWTLmCvdffM0=GdG7UZ7zNoj0Jb0CeLTULzVmfSJw@mail.gmail.com>
 <20190829151912.z6cflsaox2qnmqxw@holly.lan>
In-Reply-To: <20190829151912.z6cflsaox2qnmqxw@holly.lan>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 29 Aug 2019 21:44:04 +0530
Message-ID: <CAP245DWqbFnKVW9BYCzUMH=Ub+0j=3ycj-=MiPzRRW1Zv5LUmw@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] drivers: thermal: tsens: Add __func__ identifier
 to debug statements
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 8:49 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Thu, Aug 29, 2019 at 07:58:45PM +0530, Amit Kucheria wrote:
> > On Thu, Aug 29, 2019 at 7:35 PM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > >
> > > On Tue, Aug 27, 2019 at 05:43:59PM +0530, Amit Kucheria wrote:
> > > > Printing the function name when enabling debugging makes logs easier to
> > > > read.
> > > >
> > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > >
> > > This should need to be manually added at each call site; it is already
> > > built into the logging system (the f flag for dynamic debug)?
> >
> > I assume you meant "shouldn't".
>
> Quite so. Sorry about that.
>
> > I haven't yet integrated dynamic debug into my daily workflow.
> >
> > Last time I looked at it, it was a bit bothersome to use because I
> > needed to lookup exact line numbers to trigger useful information. And
> > those line numbers constantly keep changing as I work on the driver,
> > so it was a bit painful to script. Not to mention the syntax to frob
> > the correct files in debugfs to enable this functionality.
> >
> > As opposed to this, adding the following to the makefile is so easy. :-)
> >
> > CFLAGS_tsens-common.o          := -DDEBUG
> >
> > Perhaps I am using it all wrong? How would I go about using dynamic
> > debug instead of this patch?
>
> Throwing dyndbg="file <fname>.c +pf" onto the kernel command line is a
> good start (+p enables debug level prints, +f causes messages to include
> the function name).

That's useful to know.

$ git grep __func__ | wc -l
30914

Want to send some patches? :-)

> When the C files map to module names (whether the modules are actually
> built-in or not) then <module>.dyndbg=+pf is a bit cleaner and allows
> you to debug the whole of a driver without how it is decomposed into
> files.

And if changing the kernel cmdline options isn't possible or is inconvenient?

> There are (many) other controls to play with[1] but the above should be
> sufficient to simulate -DDEBUG .

The "hard" bit is explicitly poking the line number in a file to
activate a paricular pr_dbg statement. Even if I scripted it, those
lines numbers keep changing in an actively developed driver.

Somehow, I've always felt dyndbg was more useful to debug a production
system where recompiling the kernel wasn't an option e.g. reporting an
issue back to a distro-kernel vendor.

> Daniel.
>
> [1]
> https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
