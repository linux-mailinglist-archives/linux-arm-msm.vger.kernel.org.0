Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCFD2523AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 00:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHYWbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 18:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgHYWbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 18:31:43 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC9CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 15:31:43 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id u46so130496uau.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 15:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FLQFPf8fLS7CXO0sqeBay+2q4cQ6HR+2AcELPhdgy+g=;
        b=QU0Hse14Sklyyz5kU3HeafZqqmeR/p+06VxkowHnJejpgNSHFeKynmOmd+F3l2P+ag
         R+GXXBJK1b66xpFAWH7b2a8zD9ShRCjKuhUAM1h2GiN6scO/py9dPVSjEBitpu5lrrvR
         X3TbtAK76P08sTuaeA+WnGrb1oPPfGaCSTgK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLQFPf8fLS7CXO0sqeBay+2q4cQ6HR+2AcELPhdgy+g=;
        b=QdJLRdWTaAoFd18hkpodPrfGdg9bjozBp8cbvMjknuBRtLJbh0HeHNlULkcXq+RAw4
         xqCLyDW5G6bQzfOet6jIWfNxa5oukxm+KIYbKNcULHHw07P3dp4QxyUKeE/nPZymU2hO
         8ZYi43GbFfVEJyVlkbzuEJklQBKAt8TgFUFfFxMnw+eNHvRGuX4e41+jN6f5Zl/X0Lob
         ajHHyjf0AoWllLVk565Lughw0qverXNPcDuVNy0OA3bcpZ5YFZnq4Nkmessb1vTw3jKs
         0wV2Op3H4LtJGOJTHRHbmDIq3HTVmXSf9GbIxBmCCv2dfPpJ7gUC3Cv5AhK+9oUXpE7e
         4sgw==
X-Gm-Message-State: AOAM5306PWBlVByaITNp/qEh2gl6HYy/fpwG5BfTzTQyj/AFDFlGjWR+
        FPhhKjSuy9ZVZ2qFZBxj6OviQMCJZRv8PQ==
X-Google-Smtp-Source: ABdhPJygKaZU+27tQvo/pbeny+RsZGbYYMKHWee/UHa6iUtqX9hhvp7cITj7zhPqxOhsBp7EIU+lsA==
X-Received: by 2002:ab0:d97:: with SMTP id i23mr6576126uak.99.1598394702088;
        Tue, 25 Aug 2020 15:31:42 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id m62sm52813vsd.21.2020.08.25.15.31.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 15:31:41 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id y4so106163vkn.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 15:31:41 -0700 (PDT)
X-Received: by 2002:a1f:fc02:: with SMTP id a2mr7476528vki.65.1598394700796;
 Tue, 25 Aug 2020 15:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200825003341.1797322-1-robdclark@gmail.com> <159834727050.334488.84544239322533805@swboyd.mtv.corp.google.com>
 <CAF6AEGvNKhFMtMkqS8STaUTcw7z6-NsHROeydWnx-=2=UG357A@mail.gmail.com>
In-Reply-To: <CAF6AEGvNKhFMtMkqS8STaUTcw7z6-NsHROeydWnx-=2=UG357A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Aug 2020 15:31:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLeHN8AH8FFkx2jiPQy6q5n=N=mLOGw0ujpk6rdBRVFw@mail.gmail.com>
Message-ID: <CAD=FV=VLeHN8AH8FFkx2jiPQy6q5n=N=mLOGw0ujpk6rdBRVFw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: add initial trogdor and
 lazor dt
To:     Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Atul Dhudase <adhudase@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 25, 2020 at 3:22 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Aug 25, 2020 at 2:21 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Rob Clark (2020-08-24 17:33:39)
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > new file mode 100644
> > > index 000000000000..b04987ab6c22
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > > @@ -0,0 +1,1364 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > [...]
> > > +
> > > +       gpio_keys: gpio-keys {
> > > +               compatible = "gpio-keys";
> > > +               status = "disabled";
> > > +               pinctrl-names = "default";
> > > +               pinctrl-0 = <&pen_pdct_l>;
> > > +
> > > +               pen-insert {
> > > +                       label = "Pen Insert";
> > > +
> > > +                       /* Insert = low, eject = high */
> > > +                       gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
> > > +                       linux,code = <SW_PEN_INSERTED>;
> > > +                       linux,input-type = <EV_SW>;
> > > +                       wakeup-source;
> > > +               };
> > > +       };
> > > +
> > > +       max98357a: max98357a {
> >
> > Maybe node name should be 'audio-codec' or 'dac' or 'amp' or 'speaker'
> > or 'codec'?
>
> looking at other boards, it looks like 2 votes for "audio-codec-0",
> one vote for "codec0", and 2 votes for "max98357a"..  so seems to be a
> codec rather than amp/speaker.. and "audio-codec" seems to be the
> popular choice..

I'd look at recently landed yaml files under
"Documentation/devicetree/bindings/sound/".  Those have the best
change of having been reviewed by Rob Herring.

Oh, or you could look at the Devicetree Spec [1]

2.2.2 Generic Names Recommendation
...
* audio-codec

[1] https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3
