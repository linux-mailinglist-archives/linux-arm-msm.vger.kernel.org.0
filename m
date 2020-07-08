Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F6D218B1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 17:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbgGHPWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 11:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730050AbgGHPWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 11:22:21 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7F9C061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 08:22:21 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id b24so6986920uak.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KO628LRg0KELEzDGxGBW/eAFQb7hOqQ53yrytEwvgvY=;
        b=hi5oTWy7PCy7YqHRotH3tuH/k2HpctPr7tYVQrxyXCdwfKApDHb6zk8Hv57vOZr7+T
         uPq3gVmSKLp0lfFLbDvVPJM0L70JoAwZ4cie7WIwJNK8QhE26q9c5evYUjyZgyWdScU1
         mb2a+uTp0kfIJg7L3WdoAHaG/3DhMm2oR+B2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KO628LRg0KELEzDGxGBW/eAFQb7hOqQ53yrytEwvgvY=;
        b=C/bZr3jzIhNwoGa3BvLYq7NrXxvsW4M2ka/3LHmRBs3G0r9IWLr7CnpRWu+LU3oVXv
         pfZLXCWVcBvNO9mPzQQjHtAcP3iyrFPL+nNP3+umdqmqkfUzXY1rodEuKFDZw2RnnaqT
         D/PuDKs0FJ6nZAQ3kUCYcGnxB64C2Lag6mTXE4RsrjKWYl+EPmCdnbn59AcQPAUleQ1l
         xtu79ZIy2Vmy3rKq8B3HeE+iktSHnJT8m7VBoq11pC06rTG9qlc2FEeAI2kl4DpupGEU
         bxZPtQs5JiMTt+rb9qx9ndw65k6SeTJ1haALI+chnilbPyDKdVSAyjXJ1lm65zWCyW7X
         XBRw==
X-Gm-Message-State: AOAM532STk/MDWz21ooc2xOAzEeOitTkidfrArPX1XABm1kVIR82wRP0
        eShZfJf2WOie+YrsvSwktXTeNjDoknU=
X-Google-Smtp-Source: ABdhPJxqDfjqn3ZVbE0a1FhrFtLnURsnXT0eQ9EatxwUDDMl9mCX6D7yQhC6ncMGI8HOd9miTDfU3w==
X-Received: by 2002:ab0:81c:: with SMTP id a28mr29535408uaf.59.1594221739364;
        Wed, 08 Jul 2020 08:22:19 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id i2sm19869uac.4.2020.07.08.08.22.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 08:22:18 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id b24so6986873uak.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 08:22:17 -0700 (PDT)
X-Received: by 2002:ab0:2408:: with SMTP id f8mr34039056uan.91.1594221736757;
 Wed, 08 Jul 2020 08:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200702004509.2333554-1-dianders@chromium.org>
 <20200701174506.1.Icfdcee14649fc0a6c38e87477b28523d4e60bab3@changeid>
 <20200707120812.GA22129@sirena.org.uk> <CAD=FV=U5RHh_QuZ1tv9V5JtcsrhRONSa_CerYwUFsHhDOhEqdA@mail.gmail.com>
 <20200708100110.GB4655@sirena.org.uk>
In-Reply-To: <20200708100110.GB4655@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Jul 2020 08:22:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFFN+FQhvs1Cdh7jWBRMzDvfHNiC43M_ZqiVqnWf+Y+g@mail.gmail.com>
Message-ID: <CAD=FV=UFFN+FQhvs1Cdh7jWBRMzDvfHNiC43M_ZqiVqnWf+Y+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] spi: spi-geni-qcom: Avoid clock setting if not needed
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        ctheegal@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 8, 2020 at 3:01 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jul 07, 2020 at 05:53:01AM -0700, Doug Anderson wrote:
> > On Tue, Jul 7, 2020 at 5:08 AM Mark Brown <broonie@kernel.org> wrote:
>
> > > This doesn't apply against current code, please check and resend.
>
> > As mentioned in the cover letter, I posted this series against the
> > Qualcomm tree.  The commit that it is fixing landed there with your
> > Ack so I was hoping this series could land in the Qualcomm tree with
> > your Ack as well.  Would that be OK?
>
> So I didn't see this until after the patch I applied was queued...  it's
> looking like it would be good to have a cross-tree merge with the
> Qualcomm tree if there's stuff like this - is this on a branch which
> makes that practical?  Otherwise I guess...

It's not too bad.  Of the 5 patches I've sent out (3 for geni SPI, 2
for quad SPI) you've landed just one.  Here's the summary:

a) geni SPI 1/3 (Avoid clock setting): Has your Ack.
b) geni SPI 2/3 (autosuspend delay): Landed in SPI tree
c) geni SPI 3/3 (overhead in prepare_message): Has your Ack.

d) quad SPI 1/2 (Avoid clock setting): Needs your Ack.
e) quad SPI 2/2 (autosuspend delay): Needs your Ack.

Since b) has already landed in your tree, let's just leave it there.
There'll be a bit of a performance hit in the Qualcomm tree, but it'll
still be usable.

Since the rest haven't landed, it would be nice to just land them in
the Qualcomm tree.


I think there's still more work to make the Geni SPI driver more
optimized, but I don't think it'll be as urgent as those patches and I
feel like any more major work could wait a cycle.


-Doug
