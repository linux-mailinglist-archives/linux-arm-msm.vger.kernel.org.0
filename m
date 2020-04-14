Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2D71A8CA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgDNUji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633284AbgDNUjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:39:33 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B62FC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:39:29 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id k19so874728vsm.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hxK3Sqhwvh9HQz8vI3EGqehbyyDGiizGlJruFTBZOiI=;
        b=c6qp5YUtAXQcWJjTWNsBFpOyyFWdmGQpkw4prkbONKTeTw/XOR/xcawcwrXd2fbgSU
         JOMhYTnvdPurqp721fz0QiydwLxg1DaBoGODQdVn4Zndww6QKB/wzjVlvaHdBD0bRZCX
         5UuKM+vtKTnZEJuss5/lGBpw/28PwI2XHAB3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hxK3Sqhwvh9HQz8vI3EGqehbyyDGiizGlJruFTBZOiI=;
        b=L2kMe1LZsPDYoTVxclAHkWbv4u69WxrjXD0a4xRUs0J6xtIYYkL3ZgiPp7qcqr5CZs
         aN2cWZ9o143iL4n64fjoZlMTxHpwvdQ1a94tPuVLHjK1tVFCC0hRoVoHCSg5DYkDtV95
         68CMNLeV5D8DUzjjftIMmYjNd0tTkUqJRMZ//DBQQRkhJO7GoetnUd9Lug9wIdS5mHTC
         WItkkk6BFj9s8wShYPfcfR4g6I3Nn0XMhmOOTsJKvNNbvSTybIpLgELA7hELuw6laQyh
         y+Fmxz4x/v4QlV49eagj9MwNGA1uKt/iPfKIY7tCgv8GnQxweKvjjQcbOb6BtwXBFUMg
         FuYw==
X-Gm-Message-State: AGi0Pua7J6p7Xs1i05viioFtIjtldnLZgu9ojJQNUyhmTuzI0BV5RgZU
        r+3E/TP+QU9yKpMYTdk9yj+Jj9HSM80=
X-Google-Smtp-Source: APiQypJMOQ8hMB6P4p0uLnbPv5dG6lzVBi6acUT2KttBCBCl+1pU5bYiji37CP2heeFkUG8fLZl/1Q==
X-Received: by 2002:a05:6102:7a1:: with SMTP id x1mr2132896vsg.221.1586896767981;
        Tue, 14 Apr 2020 13:39:27 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id w82sm3312312vkw.51.2020.04.14.13.39.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 13:39:27 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id y15so880197vsm.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:39:27 -0700 (PDT)
X-Received: by 2002:a67:2b07:: with SMTP id r7mr1932123vsr.169.1586896766379;
 Tue, 14 Apr 2020 13:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid>
 <20200414131010.v2.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid> <158689621032.105027.15399009553185990099@swboyd.mtv.corp.google.com>
In-Reply-To: <158689621032.105027.15399009553185990099@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 13:39:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9swvzfCX5H=qhqdsnCAFTCWwzibcu72JJ9VKi9cR+1Q@mail.gmail.com>
Message-ID: <CAD=FV=W9swvzfCX5H=qhqdsnCAFTCWwzibcu72JJ9VKi9cR+1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Joe Perches <joe@perches.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 14, 2020 at 1:30 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-04-14 13:10:16)
> > diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> > index f988e9cc2c30..02fc114ffb4f 100644
> > --- a/drivers/soc/qcom/rpmh-rsc.c
> > +++ b/drivers/soc/qcom/rpmh-rsc.c
> > @@ -174,12 +175,13 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
> >  static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
> >                                u32 data)
> >  {
> > +       u32 new_data;
> > +
> >         writel(data, tcs_reg_addr(drv, reg, tcs_id));
> > -       for (;;) {
> > -               if (data == readl(tcs_reg_addr(drv, reg, tcs_id)))
> > -                       break;
> > -               udelay(1);
> > -       }
> > +       if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
> > +                                     new_data == data, 1, USEC_PER_SEC))
> > +               pr_err("%s: error writing %#x to %d:%d\n", drv->name,
>
> Shouldn't the register be hex? That seems to be how the registers are
> represented. But I guess tcs_id is decimal and can't be translated to be
> meaningful enough to indicate which TCS it is like the sleep or wake
> one.

Good point.  Should I quickly spin a v3 just so this is all ready to
go, or wait to see if there is any additional feedback?

-Doug
