Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A44396D3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 08:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhFAGWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 02:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhFAGWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 02:22:10 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2263EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 23:20:29 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id b25so14086709iot.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 May 2021 23:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VjF5fmPWmJV34AdLHtXksUvrbFB635DQDVeSSdm6xpw=;
        b=gWoOaav6t1rcuEJBzjAASU8hMh7ElCyKu3WcOsSLEc3Xe7lVLiay+RXoHxsk5buD9D
         CJxpSkbkECsVfZz3xspVANq7Em5/UA/KnkZK2eyepxsTrI9nmXCBsG/Ba+Fld77RFgyI
         KY0MKjd7G9GdbwK/dn3nFtFKUPHaEO3NiNr9KyReDbaYycz5FX3FtxuKgoUxpMWK06E9
         rTUvb+BIfbN2poEUQU5Hr3BWCif1Gt8KkTBkAKd3ONOXRH1BMGIHpg/bytVrYCBUyiG5
         aOj9qMNfW0/l0idxvtkTiQ1kkAythJVkrd//a8aEGOpbEifgVF7PwRE2MoHgJTRjzPKG
         fs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VjF5fmPWmJV34AdLHtXksUvrbFB635DQDVeSSdm6xpw=;
        b=TQad8KnTZWCwR7Lv2vsxBLAxqmzG9193+e31IHzjEWI2JaT7l7Y+PBQZuBOUQ4pEAw
         BxB9AGQmoYVWAQEYvW0Virxf4YW3CCWMLSGAoYeqtdyWXCB5jvXVvYa6p5G0SAIUXaTn
         q63EWjLQtyk/Zojw2gnmeQl5ZuyPw/bj2zxH3z1GWIWYQrHbDYQ1zmS4tMoUvES0Gukg
         QcSl5SzHOYV1nnZCrOj2yEgqY0czg/shnnXZMu61pnmvhDQjK0VEgv2N2g+Jmbi7gjvK
         IJEw/TvoQkQJsjM8fXxUcBDM+MWJdFbY99DD3Nz0R+NH2BlhWjNNqzyWZw08/phPbKmL
         3LVw==
X-Gm-Message-State: AOAM531NrWMJgpJkg8s5rkiKfXvBk6Ekrq7W0bnapSEiVvL6SlNaA6zg
        DJspo2DGiFWwZeNo12BRAYRw60SEOW8sEQ+Ugsv9FQ==
X-Google-Smtp-Source: ABdhPJwwuuEEw4PW352dxmKdk5M40VGM4ah+oUqxQCijlCOa4x8O+ussAGmRTo654Y1vrVDRwi6DFNUbJ0yZ/HPFQkM=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr15203280ion.185.1622528428085;
 Mon, 31 May 2021 23:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org>
In-Reply-To: <20210526154704.114957-1-judyhsiao@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 1 Jun 2021 14:20:16 +0800
Message-ID: <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
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
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
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

On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> Sets channels_max to 4 to support QUAD channel.

Could you point out probably the up-to-date MAX98357A datasheet for
4-channel support?

On a related note, from the public datasheet I could find[1], "Table
5" only shows 2 channel's configuration.

[1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
