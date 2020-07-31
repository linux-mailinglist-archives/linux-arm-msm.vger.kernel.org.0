Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE12341A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 10:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732008AbgGaI4S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 04:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731968AbgGaI4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 04:56:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B589C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a5so17299033wrm.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2020 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKHultmexfuWBdCK9WRDRk/vbhZ+37y2O3wAMlcu988=;
        b=aE1OHooxwN4CtoTfKoukXZmAijnt7lUt7g2YEmORS3cT7AcMzMNPBMqe8jdLYclZBm
         eOHaWEarxXuFCjto12aNCFolbMakz+DiEVyPF5mrDDnb4gRfoCRQPp7jBy5l2R7n/un1
         nBoT11Vhvh4xhvgqwcqKCnGpBSQmKQyJHI6yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKHultmexfuWBdCK9WRDRk/vbhZ+37y2O3wAMlcu988=;
        b=OnByCHFRXPuzRDkHuxLKZCd9Z/WV4C77v9JUeEezU8OONABVNWvO4Y5hmfqliutrQC
         V/pPOJjgLmTw6dNUVVWF/tbOfIA9NXxqgegOGxGH+fPVWn7vGXk7fvybWpY/F2ULYr9l
         a1AeP5rvDvGPLXXkEl/aHS6Z0JeUMqV3YIiV4J5urvNTJOhwEKF2F+djGhhJnwjJ6Ihe
         dH7Cs2zY+WGd7IoWGIlG5jJyrctn9s9GoegxkK3r1QuCBgwZxq2OR1daLdWgj2b+DkGc
         nEZNQjmCNnfcNC1NIQq6Xq3EE6gMGlogww87WYfQ/dH4IWrl60D6RMRrsiyTbq2qmQx8
         8rDg==
X-Gm-Message-State: AOAM532UNkyjOxLk2e4N+R5nUazSSHilnPZ/NowrfAp4M+mfoA+SdlOd
        PmiyNiB9DJDrnFyJLpt7ARpP/C/KVxbloRTkXkz5xQ==
X-Google-Smtp-Source: ABdhPJzWn3jZhPtcamUMQKgiq4Q2WoIJL296BZio2qPps8qapt7QAgo3rn4E433qso7peWw9XBVW+myXjp0sLi36trw=
X-Received: by 2002:adf:e486:: with SMTP id i6mr2505317wrm.258.1596185775852;
 Fri, 31 Jul 2020 01:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org> <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
 <20200723184432.GA321518@gerhold.net>
In-Reply-To: <20200723184432.GA321518@gerhold.net>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Fri, 31 Jul 2020 16:55:49 +0800
Message-ID: <CAFv8Nw+Y7S2EWZMUYEeFeTmt+TdzBQUTBzgHDa7reWT9CiOA1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>, Ajit Pandey <ajitp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 24, 2020 at 2:45 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Wed, Jul 22, 2020 at 10:25:14AM +0100, Srinivas Kandagatla wrote:
> > > +static int sc7180_parse_of(struct snd_soc_card *card)
> > > +{
> >
> > This code is getting duplicated in various places like apq8016_sbc_parse_of,
> > it will be nice to common this up, if possible!
> >
>
> FYI, I started work on making apq8016_sbc use qcom_snd_parse_of()
> a while ago already, but didn't find the time to finish it up.
> I have now sent it, this should make it possible to use the common
> qcom_snd_parse_of() function in this driver as well.
>
> See: https://lore.kernel.org/alsa-devel/20200723183904.321040-1-stephan@gerhold.net/
>
> Stephan
>
Hi Stephan, thanks a lot for jumping on this to help.
It indeed makes this new driver much cleaner.
I have tested with your patches and it works great.
