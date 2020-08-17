Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B37A2473F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 21:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391946AbgHQTEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 15:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730796AbgHQPqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 11:46:20 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5949C061389;
        Mon, 17 Aug 2020 08:46:19 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id u126so17969309iod.12;
        Mon, 17 Aug 2020 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBgW8dUaJp9xHsQqS5sR9kreA2u8eeu1L4Hnm93j9KE=;
        b=mXlVYm6zxVJ/mHT2c9kdCpYLq7GLxL8sArYYw2KtKLzmDagsoLfULjZ+yyL3OLx0//
         vpCxOHvQq0nQ+mQJ33m2ejwrQTb1mWeOJq5C7Skw7xTzePv+epWN/jBHjXGCiV1+jIOL
         jseeeI85/cUbq+COdWcP372A/1tCZW/egMEiuWm2L/vP3tIvdhYPb50/xNAyb8ZMWNd7
         ZYIO9KxEn5OtNJVcjqnlynVUcY9+pjflyeVbF+C1tx6pl3eRFE8zCdDY0NX9BDQcr3kd
         g5pxRWdFD926fgkxZUjWlTKH4exelPqG00WoVd/B59hxCZdy9lS45ZJiV4jJ+ndFColu
         BrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBgW8dUaJp9xHsQqS5sR9kreA2u8eeu1L4Hnm93j9KE=;
        b=DmnSt5KbgTjuNSrJ/jGrDRgow+IgCGV0hX4ic/mv77n2FnnvU/1sMRyAgcoNBd7LER
         3LyUGTM5kG5SQ+ZDGHtWKcGXUMQnkSzB0GekjD+fRMGIfAEOEwKkYJzucb++k8KuAgD+
         csa9kHMQcU4TFkjpXVrrM1bnaKPZ1HI7WrlzuYue6YlA7SaCjQTX/PTOnvTKRIcUufVr
         B6XRPbezaJjZroFuNHV6lyB7R6lkn6WvNtFHnTQZq4dGuY29RXSmYtWzA3tP22qmNiNq
         26otqvnjJsgA+aVVr8vHYIwGWOmjSmdkYDNkb0ePvhYg+D7slSpXK2lnm8yTrmmxDm3U
         crcg==
X-Gm-Message-State: AOAM531eeaolk41THkv6vwajQQG+fWK1B9UTlIrVHj0LImqIN5Ig5Tv4
        MaLkrXZIJYcAlCMzcm6aK/SOGFgUI7mi/LNzBxlAJTWR
X-Google-Smtp-Source: ABdhPJzWpkmG7lrZRb4AzZq1wS2uKa7GFyOrRtR6dmk4tE1vbz6LDgZSQilL+U8zp8+xHRDioiaZVEFUMIDbih/m8GA=
X-Received: by 2002:a02:dc3:: with SMTP id 186mr14921794jax.46.1597679179331;
 Mon, 17 Aug 2020 08:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200817140908.185976-1-stephan@gerhold.net> <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
 <20200817152848.GA836@gerhold.net>
In-Reply-To: <20200817152848.GA836@gerhold.net>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 17 Aug 2020 09:46:08 -0600
Message-ID: <CAOCk7NpyiWO_DHidDWbwdBYbzJMrv26CmWOR4foTGRL_pQVbUQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 9:29 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Mon, Aug 17, 2020 at 08:52:46AM -0600, Jeffrey Hugo wrote:
> > > Overall I'm not entirely sure why we need to force all these clocks
> > > on at all... But the downstream driver also seems to do it and the RPM
> > > interface is barely documented, so I didn't feel comfortable changing it...
> >
> > So essentially, when the clk framework goes through late init, and
> > decides to turn off clocks that are not being used, it will also turn
> > off these clocks?
> >
>
> With this patch: yes.
>
> > I think this is going to break other targets where other subsystems
> > happen to rely on these sorts of votes from Linux inorder to run/boot
> > (not saying it's a good thing, just that is how it is and since we
> > can't change the FW on those....).
> >
>
> As far as I can tell the behavior implemented in this patch (= force
> clocks on during boot but disable them when unused) is the same on that
> is used on the downstream kernel. Most FW is probably written with the
> downstream kernel in mind, so I don't think this is going to cause trouble.

Based on my experience with 8998, I disagree.  I would need to dig up
the history for specifics.

>
> The only situation this patch could break something is if we forgot to
> manage the clocks for one of the devices in mainline
> (and implicitly relied on clk-smd-rpm to keep them always-on).
>
> For example, one situation I checked is for WCNSS on MSM8916.
> It seems to require RF_CLK2 to boot. However, this is already handled in
> qcom_wcnss_iris.c where the clock is forced on until WCNSS is ready.
>
> > I think this needs to be validated on every single qcom platform using
> > this driver.
> >
> > Also, out of curiosity, how are you validating that BB_CLK2 is
> > actually off after this change?
> >
>
> Since BB_CLK1/2 and RF_CLK1/2 are part of the PMIC (at least on MSM8916)
> I used the regmap debugfs interface to read the clock registers
> through SPMI from Linux.
>
> From the "PM8916 Hardware Register Description" [1] I got the registers
> mentioned in the table, e.g. for BB_CLK2:
>
> 0x5208: BB_CLK2_STATUS1
>         BIT(7): CLK_OK (Indicates Hardware or Software enable and
>                         includes warmup delay)
>                 0x0: BBCLK_OFF
>                 0x1: BBCLK_ON
>
> I read the registers from /sys/kernel/debug/regmap/0-00/registers:
>
> Without this patch:
>         5108: 80
>         5208: 80
>         5408: 80
>         5508: 80
>
> With this patch (and with clk-smd-rpm entirely disabled):
>         5108: 80
>         5208: 00
>         5408: 00
>         5508: 00
>
> Stephan
>
> [1]: https://developer.qualcomm.com/download/sd410/pm8916-hardware-register-description.pdf

Hmm, 8916 is probably old enough where you can actually do that.  For
the modern SoCs, you'll have to go through jtag to get an accurate
view of the clocks.
