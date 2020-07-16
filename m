Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30853222E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 23:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgGPVvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 17:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgGPVvm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 17:51:42 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B832C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 14:51:42 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id u6so2252930uau.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eFUIFCXr3un/HX1xYqaCN4hY8qd5k3HqOlsX9/aIkxY=;
        b=aZboL+LsskojMwhKfws0MypsgvhoeSdNzBTb6nbV7rFUWA1OjhM0tB0bFLqeCYvxcM
         md8ZX1gK2WhbNKLzpoCoUz88zRHNFKOFWNoTsKQ+K/qTFLx/uRzsAMKf9ntuuWDUU1pK
         1N0RuHNnce6o4GYPaOB6Rw/30LvSNgrc7ztS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eFUIFCXr3un/HX1xYqaCN4hY8qd5k3HqOlsX9/aIkxY=;
        b=JHn3+qOZUYkXFxIgxjOpL3IY5h5jt9E5lrE6pDC4us+UL7Sv5z+wrUyLGXnPSFpp3w
         Gpf/qlDl7QGHFScJ8lAt9w2/mxPnRGu/Rt4lydZRTY/ii9OVL9EtrQaClbSWMJGF5wwX
         SdUwAPkH4oxRQJJh4d/Mne7SIdz1HNOpUQCkLbjogcIu3xHOMoZdnNQtaQy9rhYjCdGy
         kBFQm6hRc99vPsP7XunCKAnXhF/cnObJs7P7bpgOrIzNmbwK0rg22pRV1cPDSrPzxG9+
         ZBt2jpQjowpZVAb4qNkIIebWFLtDTtBMcpUckaoIa+cswnbeVftSe8EbQxsXNiGFiEt6
         wPpg==
X-Gm-Message-State: AOAM532o2E9BbSsSR6KDZzaH0y+mkaecrosOHr7DVYd1U0K4MYnePCTP
        bGkwssMgvFtoRBtvwZUZ+4y8bp+WE48=
X-Google-Smtp-Source: ABdhPJwffXXqbwC5BLUtAPk0gzJcULRgka39xbijGQdiaV7vPVEkn2u6xcwkK5xCwIPOTVcveXBcag==
X-Received: by 2002:a9f:24ac:: with SMTP id 41mr4716423uar.130.1594936301293;
        Thu, 16 Jul 2020 14:51:41 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id t192sm932897vke.7.2020.07.16.14.51.39
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 14:51:39 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id c11so1668885vkn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 14:51:39 -0700 (PDT)
X-Received: by 2002:a1f:61c2:: with SMTP id v185mr5122193vkb.42.1594936298466;
 Thu, 16 Jul 2020 14:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
 <1592818308-23001-4-git-send-email-mkshah@codeaurora.org> <CACRpkdb-3Tf4s5=Gxjhy62GX=HUYkLOcPKZ6JWaLTQipz-0r6A@mail.gmail.com>
In-Reply-To: <CACRpkdb-3Tf4s5=Gxjhy62GX=HUYkLOcPKZ6JWaLTQipz-0r6A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jul 2020 14:51:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vpz9k1k0JYW45D4V+a5+YnRmVzOVRXZudYZzjHugJZMw@mail.gmail.com>
Message-ID: <CAD=FV=Vpz9k1k0JYW45D4V+a5+YnRmVzOVRXZudYZzjHugJZMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Use return value from irq_set_wake call
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        =?UTF-8?Q?open_list=3AGPIO_SUBSYSTEM_=3Clinux=2Dgpio=40vger=2Ekernel=2Eorg=3E=2C_Andy_?=
         =?UTF-8?Q?Gross_=3Cagross=40kernel=2Eorg=3E=2C_Thomas_Gleixner_=3Ctglx=40linutronix=2E?=
         =?UTF-8?Q?de=3E=2C_Jason_Cooper_=3Cjason=40lakedaemon=2Enet=3E=2C_Doug_Anderson_=3Cdia?=
         =?UTF-8?Q?nders=40chromium=2Eorg=3E=2C_Rajendra_Nayak_=3Crnayak=40codeaurora=2Eorg=3E=2C?=
         =?UTF-8?Q?_Lina_Iyer_=3Cilina=40codeaurora=2Eorg=3E=2C?= 
        <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 16, 2020 at 6:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jun 22, 2020 at 11:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > msmgpio irqchip is not using return value of irq_set_wake call.
> > Start using it.
> >
> > Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>
> Is this something that's causing regressions so I should apply it for
> fixes, or is it fine to keep this with the rest of the series for v5.9?

I would let Maulik comment more, but as far as I can tell the function
has been ignoring the return value of irq_set_irq_wake() for much
longer.  Presumably one could logically say:

Fixes: 6aced33f4974 ("pinctrl: msm: drop wake_irqs bitmap")

...though when you get past the commit that Maulik tagged you need a
backport rather than a straight cherry-pick.

That would make me believe that there is no real hurry to land the fix here.


-Doug
