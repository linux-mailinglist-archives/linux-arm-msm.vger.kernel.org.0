Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA271954AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 10:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgC0J7z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 05:59:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43626 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgC0J7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 05:59:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id g27so9501304ljn.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iT9ew65Ai4POSw9apePAlYbX2sb+iJXvkgJnQxpRw0g=;
        b=cWW3YcpEyyYutTrNo9KR9HBH3E1bK+HR2Lj5S1ufOBfKm/JNDbVKgSTehtTbK/piG7
         AKjHnGwyvO2icmwsa3kFw6Zy9abidGdYmBJm7RwikCnCpiGoaqgq5m3bGu0GFONHPovH
         s0c/WvnYnPEvbNXNyKweaiea++yeq0zcHNyQfUxojaI3SyGLY4+iyWjDQ0x68SaY8Drf
         JMetNVWiEP6KTRh7NjcfaAuyl0sKbJRnuDYUHwbVm3S17ouQgtixys00HdZ8IS96Ovz4
         pek6sQ78KGlTRqT5w9MPDkgc2TCFzKlFMmuVNKZoTHdy8naS5UOmiEGTokrk8DVStpkg
         Jd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iT9ew65Ai4POSw9apePAlYbX2sb+iJXvkgJnQxpRw0g=;
        b=g78g8RFRT6iTlYcIavGDWZoX2cv+RvFuIBtMJQhebyaT7aScFWLE0ovMfEIfG8zpju
         2SJajCsNTm2AQbp2onWwnUTPX9a/gqNY8BBfEog4wkcxafCYGUZBtBf9WjHY9fBscurc
         jqU0NagSwjsGuqIBofwrEfht6utgSRm98FpgtPJT+c3/THwkW5VdLJXcrKZYvjuCMiu0
         /dfvfEuqUJmSWeOU/2ZrrnCMj9fhPQ+6bIrPjyCeD3Iiw2LMi8qkn3vr1pW1lwBZzF1h
         0jhDklfxx8V1apEOTLPRK3zszYmW2vVjKJPf/ielBGhwoWBJHziM+StM+tkxhUfLf58G
         dxVQ==
X-Gm-Message-State: AGi0PuaNcsKr0/nL35UGZ0jl/zkwq9/4/dVake2nDqVknRA/oyGTYGbE
        3Oe0XY2365frKa16Xw/KCTwYMa+n5ZqYzWeKIekqXw==
X-Google-Smtp-Source: ADFU+vsFTyW5diEMQrZ6oc8ojCeBX7BYjVmipZYNTS3SNNq4tTiZwvSWUqKgPn07Ht2NDQ7OLG9B8uptAVDDcyFhwxQ=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr7685010ljh.258.1585303186378;
 Fri, 27 Mar 2020 02:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200325220542.19189-1-robh@kernel.org> <20200325220542.19189-4-robh@kernel.org>
In-Reply-To: <20200325220542.19189-4-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 10:59:35 +0100
Message-ID: <CACRpkdbWeKjd6B2mLz3+7LOxSGP9FqSz6YRp_YHx+2qHkJVFCQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: Clean-up schema errors due to missing
 'addtionalProperties: false'
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zhang Rui <rui.zhang@intel.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Linux PM list <linux-pm@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 25, 2020 at 11:05 PM Rob Herring <robh@kernel.org> wrote:

> Numerous schemas are missing 'additionalProperties: false' statements which
> ensures a binding doesn't have any extra undocumented properties or child
> nodes. Fixing this reveals various missing properties, so let's fix all
> those occurrences.
>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Guillaume La Roque <glaroque@baylibre.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org.
> Cc: linux-media@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Sorry for errors caused by me,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
