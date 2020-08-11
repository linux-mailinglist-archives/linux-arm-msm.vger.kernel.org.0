Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810652420BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgHKUDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgHKUDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:03:03 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3BDC061788
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:03:03 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id e6so13394346oii.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/L5XEoeU6SfSw+3MAGdjCZdmWhATe3RdZadKI67cXZo=;
        b=xuN4qX3cNWgNZIkfenGKniMbJgU7TWaqGefaAdIjgLuz82L5ys44wwFfm/lbiuAeqp
         4VNghtvxbMCCekrVw0BRCBmXO9EaCB87qMJrh1o012IFDkTI98U+tXoJihtWFJ+jfWUA
         EY6iMFHKCFRaJylHUFxYYoEEUfwAhTVukp+ihgaa/4iNizF25DEGM/0sOVpOR71L6uTF
         sqJxHU3UJoHadr/CQTgQJSYvd8hjuGu59uFWF0Z7gd2Q7UgZLCloetJljvx5SDVBx8Ak
         oRoLdr3njf+UyhcXOp9HMgJxsWrn9XeFLZRP57ixcuHAtf30QAU/ljV84hWWf5+COulF
         L+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/L5XEoeU6SfSw+3MAGdjCZdmWhATe3RdZadKI67cXZo=;
        b=jIpzp9qF9OCJGmnzcyfUpYhcZmywem7l7+Vvqk/Yc0gaubDm0u2xaL0hjvxt3gMC16
         r+/rKFelhHaMpua7SEjpXCwSBVLAX/SlZyqI465aQcNLTf6fmjfuBHm2P1vFlIwbc+9O
         dXU7iicz4RpxaYJLPYGq09YwC6BuAOt97xRQxQ7M20YFBJnFTM9wxklIQIxFuK5oMQrY
         iTrtUWmw9aq8IcPlJcf8TcR0tLXfGV++cEcrhgkScDouTZL4WDjhTyGwPtvvwxhT+fZ1
         CCfPKL8bGAUm97yXl9RLyMfUhozOILh7zHDXvW8XGLUzZYGAhUqSweVfyFqz3YNjOniC
         n3Bw==
X-Gm-Message-State: AOAM53183Bn5uuhfyv3qCIvlF4L/oPXP+PZHVvrOSwa7jgnO87Jj8CTV
        7It6SxHZ+qm4HPv2q2NceC4mHDBllLH5ORF7HsdOAg==
X-Google-Smtp-Source: ABdhPJwUnhWji9+O9FsKo96nRE2LnEz6aMDJgYGbDEg7BsXVRFWBFXMET8NIbAlW54wWzH2BYtM26yo4Bx/x2QiRfLI=
X-Received: by 2002:aca:b50b:: with SMTP id e11mr5131759oif.10.1597176182150;
 Tue, 11 Aug 2020 13:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200811025044.70626-1-john.stultz@linaro.org> <CAGETcx8qjnVNNB_z-Ar8gxKAy7Sc8kcj8oAWQ76mXcBpaqnagg@mail.gmail.com>
In-Reply-To: <CAGETcx8qjnVNNB_z-Ar8gxKAy7Sc8kcj8oAWQ76mXcBpaqnagg@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 11 Aug 2020 13:02:50 -0700
Message-ID: <CALAqxLUhX0JLLvn=4fNXk0z6dm=teqCaBmz2VDPEKGfZ+EDFZw@mail.gmail.com>
Subject: Re: [RFC][PATCH] tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
To:     Saravana Kannan <saravanak@google.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 11, 2020 at 10:00 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Mon, Aug 10, 2020 at 7:50 PM John Stultz <john.stultz@linaro.org> wrote:
> >
> > When booting with heavily modularized config, the serial console
> > may not be able to load until after init when modules that
> > satisfy needed dependencies have time to load.
> >
> > Unfortunately, as qcom_geni_console_setup is marked as __init,
> > the function may have been freed before we get to run it,
> > causing boot time crashes such as:
>
> Btw, I thought non-__init functions calling __init functions would be
> caught by the build system. Is that not correct? If it's correct, do
> we know how this gets past that check?

I think it's because it's indirectly called through a function pointer.

thanks
-john
