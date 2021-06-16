Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC613A9704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 12:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhFPKQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 06:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhFPKQl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 06:16:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4DCC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 03:14:34 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso1382803wms.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4U7CRd5ZUHeAQ1mHTEeUDEyK+XRZ/2DD+iIwKeM2DUQ=;
        b=EJlIwC+w/ZZcUyLS2Wmq9xD/+QoTpHYJn6vBhhOq04HrcqQ3zLjqNMhOlCw3LdBytb
         AtbsLxrJg3b4TnH+GAksptt1xPeldU9cRmZocKOu80svTqGC6XWsaGvu0QlnEr2F+ttU
         jb+Z26eE6h0fmWbXGmciv1IrXyo48ZuO7kAAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4U7CRd5ZUHeAQ1mHTEeUDEyK+XRZ/2DD+iIwKeM2DUQ=;
        b=GLuDrIwmM4fi4fKl5WWxlbnNRgARwe2XTqHVPasRXwe+cpR45qwLnrmvN7xtsRuEHl
         ivnNyev+rerd7KYQ7iSyPuPcQTIzeFED0cke+Ddd7W+54SZejZSUyKTI5gJOcU8ZciwV
         LMEot4Y6ji2wKgBMWylUBEVUoA5C1EWEII4dlmnZveiAxvZdmECmGE7QisH8lZRDQx0P
         vu8bXKEEMgpnkeeIbSr0VJIm2aIsiMgU0qetQVTdGDtUUfxKSj+CXjQln2NNB/OrKG+A
         VelXrnBEQl57in6cZtJEL32zOeQYpm+fx0tCdR4Qwbzi+InQXiHmG1+xph/pzxN06Zgd
         8pTA==
X-Gm-Message-State: AOAM531XqbVdTtOTd2C8ww+x84NGPj4W4tuAPgQw5Ty56mQrB/C0xag1
        Pe7rK862pK8W+SoklwSEjPoVVNPY51JZwpGjk1AwBA==
X-Google-Smtp-Source: ABdhPJwvRYer0BSrpn6ulizEkP50tXiNp6EJLSUbHvxNSVpJOzUIbRyL0qQIPiFOhbr31ytuPczvh4qBQIl7ujw3jeM=
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr10523975wmk.97.1623838472860;
 Wed, 16 Jun 2021 03:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154704.114957-1-judyhsiao@chromium.org>
 <CA+Px+wXGjZCOhhAVh9eRw6L-g8g7Qi7Rf_3YHpHSCB2o=XQ+4g@mail.gmail.com>
 <CAFv8NwKkfGnpw_5PBwJSjVXsuw3L8=1RyEJ4PWdRX5-J75bk6A@mail.gmail.com> <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
In-Reply-To: <3501e398-dfba-43b1-4638-325a158e860d@linux.intel.com>
From:   Cheng-yi Chiang <cychiang@chromium.org>
Date:   Wed, 16 Jun 2021 18:14:05 +0800
Message-ID: <CAFv8Nw+FNfmgwadeFMWjRiGbKFuO4JJ=9ggRHxG+Pq_OuHdmeA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98357a: set channels_max to 4
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        Taniya Das <tdas@codeaurora.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Dylan Reid <dgreid@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Douglas Anderson <dianders@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 16, 2021 at 12:00 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 6/15/21 10:47 AM, Cheng-yi Chiang wrote:
> > Hi Tzung-Bi,
> >
> > On a platform, the four max98357a amps will be controlled by only one
> > codec device, as GPIO for SD_MODE is shared by all amps and is the
> > only thing to be controlled.
> > In this sense, I think we can treat max98357a DAI as if it supports
> > four channels.
> > I understand that this solution is not scalable, because one can
> > control as many amps as they want.
> > Theoretically, the number of supported channels by this codec device
> > is unlimited.
> > I found that rt1015.c has similar usage.
> > Do you have a better suggestion to support this kind of use case ?
> > Thanks!
>
> please don't top-post...
Hi Pierre-Louis,

I am sorry about that!
>
>
> I don't think it's correct to declare 4-channel support at the
> individual codec DAI level when in practice each device will be provided
> with a TDM mask that selects two slots.

On this platform there is no TDM support, so there were two I2S data lines.

>
> This is confusing device capabilities and TDM link configuration.

I see that in most of the use cases of multiple amps, we should use
codecs and num_codecs of the link.
But in this case we only want one codec to control the only GPIO
shared by 4 max98357a amps
I think we should be able to use 1 max98357 codec and 3 dummy codec to
fulfill this use case.
Not sure if the number of dummy codec would really matter.
With num_codec > 1 we should be able to bypass the channel checking
and just use the channel from CPU DAI.
Thanks for the suggestion.


>
> > On Tue, Jun 1, 2021 at 2:20 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >>
> >> On Wed, May 26, 2021 at 11:47 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
> >>> Sets channels_max to 4 to support QUAD channel.
> >>
> >> Could you point out probably the up-to-date MAX98357A datasheet for
> >> 4-channel support?
> >>
> >> On a related note, from the public datasheet I could find[1], "Table
> >> 5" only shows 2 channel's configuration.
> >>
> >> [1]: https://pdf1.alldatasheet.com/datasheet-pdf/view/623796/MAXIM/MAX98357A.html
