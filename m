Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84153A8455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 17:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhFOPuF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 11:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhFOPuE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 11:50:04 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF255C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 08:47:59 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so1136446wmf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBinx4Fgo45gvNb6Q+VwiPy/5uxor4+wH/XjaU7vEwU=;
        b=fKBLKEpGGji1pJ8Chsxfvqljab6qo00YqyYLcs9KAIRVzcPyZyRS/9kYae9BQhnPkS
         ZnpNaP5a2XEdbNdJeZViHbkyiIYIIILUexJwCWeSWF8fDuQSgpoe7MuUHFy0z4UazS32
         sDdFgLVdGm9mG/b/9FD+ArxbRhqK74pHM2kr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBinx4Fgo45gvNb6Q+VwiPy/5uxor4+wH/XjaU7vEwU=;
        b=My8WjSa9QSih/FSZb/P0QSVFw4ICgSEYueAowmUtygyMtgRtZ57ixwFb6m4+Sek/SS
         XbnTUAmr19nRosQ3GJApViEoKASYzzUC8/n/Zt31w0ARcPBLKNPyvX5V+4XvgJSgQklL
         0Mxjmtl/obBupw7O7nXRbVleHinbvr2I4Tr5QAitMv0uNVE8dfIc24I3HE77vyJrI5f7
         jJXBhK8IlCCVQhW2BsO/JsGeKVxjNXEniit5zY7abN0iWjAdB1ujYryQ//FsdimJQoVh
         7DFm6cnim19xeuEwz9G2dSn5mrZqvW1n2B+akEFDDgAc833xWD8lsAU0ZFuIoQ+zh2tA
         KQSQ==
X-Gm-Message-State: AOAM533dmEe7L9LDorYTlbjiRG7q8Ns7jj1h2icalm/OgZfOduP2j5zn
        0rrsmfBZi40ILivVimJW7Wg1mkXMvJtsZMXNDAjlJw==
X-Google-Smtp-Source: ABdhPJwUoEVW6kMYZC606PnYCEczrljMALiN96zNLd0kS0EL2UX5TDso3su7xUx2lhZdDpzedPnxBwH3c8Nmho87MO0=
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr6083880wmk.97.1623772078396;
 Tue, 15 Jun 2021 08:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org> <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
In-Reply-To: <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Tue, 15 Jun 2021 23:47:30 +0800
Message-ID: <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Judy Hsiao <judyhsiao@chromium.org>,
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
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tzung-Bi,

On a platform, the four max98357a amps will be controlled by only one
codec device, as GPIO for SD_MODE is shared by all amps and is the
only thing to be controlled.
In this sense, I think we can treat max98357a DAI as if it supports
four channels.
I understand that this solution is not scalable, because one can
control as many amps as they want.
Theoretically, the number of supported channels by this codec device
is unlimited.
I found that rt1015.c has similar usage.
Do you have a better suggestion to support this kind of use case ?
Thanks!




On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> > Sets channels_max to 4 to support QUAD channel.
>
> Could you point out probably the up-to-date MAX98357A datasheet for
> 4-channel support?
>
> On a related note, from the public datasheet I could find[1], "Table
> 5" only shows 2 channel's configuration.
>
> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
