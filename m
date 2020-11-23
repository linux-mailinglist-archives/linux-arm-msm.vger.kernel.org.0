Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC562C17C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbgKWVfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730682AbgKWVfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:35:23 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD6FC061A4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 13:35:21 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id 11so4823746oty.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 13:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RHVbsPxojr7q71RsaVfmSVzc2bYiMeerz5PMqJgnAgU=;
        b=bZveYD92i3H57xbj9rb3OdOGmkuce42ysMSC8ggdUOmgnKiOo0mC0i2iwIDz6ia94w
         DW7LE2WD90xLiDB7mMvFZO+BuPAkPFa4+vrr9RWmjbM07X9P3knutRw+t/4gnsrW+vUO
         MxoiIEMwQTq77a0wVl3C/6KC+xJtNrNBln58EMpoZKa2TKvbH4bErvgX97csluF8aVrP
         hmgiPvltvzNnksgdMLCPAFVXib8aU1IkXe9I3VZTwgxzAuX9rCrbi/5yV04vK+M16AKy
         EtWODMZqpMcSxqmJv+g298pcnBn6Jnj/CnS1neNO67QAu9cPLoMH6t0BVlB0oeEvR0D7
         3C6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RHVbsPxojr7q71RsaVfmSVzc2bYiMeerz5PMqJgnAgU=;
        b=kVs+k51PsS8qi6aUx6sGpj5cW74qXBn9LMcAIMjY84rWY+Ox0zHVGxhyRwRv+mXQ45
         d8K6H/WFCkTnB2zCF1iKFN1DnM6S6ZKlQ7AU9mHHsoGdF3/eCWzuURILdkUaUrtbe7fD
         TDAjgz+Teh5/K0SdT67OuMJG56NVu3xLWylypUgWwmcEn+LAryMKjxJ/NexbQ30Rk98F
         mdChC+OiSmdqBgk8ZvjnlOYQaLPLxDbbb1ImWer0LmnZbXS+f0KNqyRgaUKrXmq14mj/
         vduX+wXv8Tssbp5jTUZf0M6d3lBqu7w51hwYnDGYrcn9q22zN0M/txMZQWdUDUZ3FXKO
         XHBg==
X-Gm-Message-State: AOAM5325FcrciDU7Cy+3dREqRjzC46jgLJ04lvtgIJ7FeXo0n3Wc65NM
        oVE9DdxzoT+Ve/rGMlx7HcqZUP5X/AnzESd3tbV1Ww==
X-Google-Smtp-Source: ABdhPJxBqyZnJhY6xj1OfzZtV3azrOD1zzjunErm0HAXDVGbZZwrm5R8XrYVWiMrwMBdaPyzsevyCqOoR29g/tMYX7A=
X-Received: by 2002:a9d:851:: with SMTP id 75mr1142123oty.102.1606167321100;
 Mon, 23 Nov 2020 13:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20201121063302.84090-1-john.stultz@linaro.org> <20201123183659.GP6322@sirena.org.uk>
In-Reply-To: <20201123183659.GP6322@sirena.org.uk>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 23 Nov 2020 13:35:09 -0800
Message-ID: <CALAqxLW9AF3h0ZxSc8VHU8DbBvYjDsL=Kn53qXC9YCc78ypG0g@mail.gmail.com>
Subject: Re: [PATCH] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies
 to avoid build error
To:     Mark Brown <broonie@kernel.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 23, 2020 at 10:37 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Nov 21, 2020 at 06:33:02AM +0000, John Stultz wrote:
>
> >  config REGULATOR_QCOM_RPMH
> >       tristate "Qualcomm Technologies, Inc. RPMh regulator driver"
> > -     depends on QCOM_RPMH || COMPILE_TEST
> > +     depends on QCOM_RPMH
>
> QCOM_RPMH || (QCOM_RPMH=n && COMPILE_TEST)
> should do the trick IIRC.

Sounds good. I'll resend shortly.

thanks
-john
