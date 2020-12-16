Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F5A2DC7F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 21:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728785AbgLPUvM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 15:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgLPUvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 15:51:12 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FB3C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 12:50:31 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id o19so26202909lfo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 12:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PZCfkcYMGxMQOjZ1U7fNGaLgqn49lE+Qv0BMwOMYjtA=;
        b=s7Iuv56nKYyJc+2lxZqKpSQZfxsBaa7/PehQ/HWHkG7BlW9wNp4i2FINLABCSthJgg
         1ljseudxh5H2ZrbZFrzDW43CTz1f1PZ7EyJ5MXSOTQ3uFqYBogKQUhVnWIaAsYPEiBVh
         2JONfO3a0c6BsRXty92zWsfVeEhVXqxeBQa2jRJQJdpMClZ+gk2oAdpcbnEwfMoA249N
         d+6fLGLwIbEeYpwucCm+svzSx/9ttrpKlFe/NV3ng3TWCJ8AlsPSZydWIp22dMiiiDGQ
         d7MITmxoV3ADcy8C687k9kHg4jgbznwwyUQTIUefFpaG2BJNKFzlnRBla5Z0jKlK9QeN
         baTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PZCfkcYMGxMQOjZ1U7fNGaLgqn49lE+Qv0BMwOMYjtA=;
        b=QBf2SUpL3prSHe1IRrXSKter65YIwn4IJ95v18wapwjs1uDzIF+hGE547ZmRpyDi3r
         nEqtsbTkiPl1hFZawO/X4Szz4oyoFs/3RpORGWrh/C5xgEk9MHjLb6SqcZNfdOM2Iudu
         6q8sDC3AJJJFah63rtewTNTF45UPnly1N8O20c0YbjxpEGbMwxk0FcBqfgmWJElIHeXj
         73zMCZ6y0EbopTpRqDKEuBOBLjuIBOOJwApIxSZO2KAX4uKkSHTiWKpxnhniSW+OY1Xx
         6deyYzEBi4XoPuk9Ztv/Tglcd7yEldq7YOuezoBxs6RzdPCFetUzNWpuWeSPy/rYM0ig
         /WFw==
X-Gm-Message-State: AOAM532EbVmr9WWtuGfNdTv7iBYUaD6DhwcCWyO4v0txvqREpej/DGlT
        PTK5P/XMGwiIkuJBStDbJ1FDU1xNT4XoMDmiq8jLUA==
X-Google-Smtp-Source: ABdhPJycXkEsBfIRswToh++8+wbRiMtEI7XWI0ozQFtSyALkYUjm5qKd7ywPaMo2fJAsnTrZ3d+tfkpDi+tK8WC+V0M=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr14455860lfs.529.1608151829815;
 Wed, 16 Dec 2020 12:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
 <CACRpkdZKKetFFm8AanVnzV9SyZhuurLHT_ZTak27-vGEdqVgEw@mail.gmail.com> <X9pUjU6hPI1cKS3H@builder.lan>
In-Reply-To: <X9pUjU6hPI1cKS3H@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Dec 2020 21:50:19 +0100
Message-ID: <CACRpkdbXRHCDGX-YBbNY7cMob0dZNhi1ETA3QnC71ZtOYB30JQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 16, 2020 at 7:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> > I think I will conjure a patch allowing identical naming only for
> > device property naming (like from device tree) but emitting a
> > warning so that people fix it to something unique moving
> > forward.
> >
>
> I'm not against emitting a dev_err() when we hit duplicates, remove the
> return and then update the various dts files to use "" for things that
> doesn't have a name.
>
> Regarding special handling of the DT case, I think (beyond making all
> these boards boot again) it would be nice to make
> gpiochip_set_desc_names() take the list of names and a length and use
> the same function in both code paths...
>
> PS. strlen(names[i]) is O(N), strcmp(names[i], "") is O(1).

OK I'll think of something. I'm pulling these patches out of the stuff
for this merge window because they are clearly immature,
nobody else is telling me so I have to realize it myself, it takes
like three days for me to do that...

Yours,
Linus Walleij
