Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388EB3E5A13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 14:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238786AbhHJMjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237799AbhHJMjG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 08:39:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08D6C061799
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 05:38:43 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n17so15916472lft.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 05:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yqPESqjgmWgALZq9dnXABMl8Vg5hguPUvo5W3Xrxf3k=;
        b=JVbUmhAH5zgYRhQNH4gd8yXFNNsCDkA64qbCAMYGZ223wkQ66XkcYiSesU4Obq4nIP
         xRBxrBrR8dWNDkg0njCTspEINYS1iNM5Qb+lj0e6Z5czdOFOIxuPIOYSuqKOXMF2sRnw
         7qPGKb+SBNOKbS7wpoHzOLzUW+CFPlpEL8P9cDPOdH38wpHuJecC1Qk7iIF2/7jkSg09
         4omrE9BIDqGu1dvL8fOijxPvA+rsqmUJV5InTLeRAhXM2t5Sc5pLnDedWFmlyNSu664w
         9GFzTmD5eQp8pkEgZry0kD7ALm9drjOFV2ga/m0JyM5V3CEoG5V8QQBt2V+p7XHAvv/Y
         Ys/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yqPESqjgmWgALZq9dnXABMl8Vg5hguPUvo5W3Xrxf3k=;
        b=t/Orrq0Ci1WvMqF6tAeX+ExWiQJ2us1z1E1cyOPseJZJTq6FKVPZLIfTHfBc7HZUcv
         9EioFOQpXBosmW5Ovkfvv1ZQWgbPUp1PE0uWz7PgenIFlFoX4pfd4e+qI+ju78LCJwNh
         trfZzv/MLk27RIgPW5AfXzosAEL5fRHgew/J1tmPx+t/jayBO9gPJqLJUR6I817uU+ua
         oXF+raxbykk+6Xlw9khreq2IfcfMb9HIIJBunfE4eJ0YQxZ017hky1nRUpQI92xeISkK
         gbZgyOdLar2oBlHKxBCb2Vzo4Us2ohQYDowDpjwDdy5qVSz5XYQS/L6W9lPBasbgnXeV
         pVIQ==
X-Gm-Message-State: AOAM5336RaGvHZbv7avqAioER5ioSnYU9+TelziRYAyxeEle/4/yTgrM
        PTAPWz8tdi174JVEv1SVS/s8pas0vJwpW/w8NN3yjQ==
X-Google-Smtp-Source: ABdhPJxCH32JmAlqn5LAdRI634JOmrxRSuLk6eTMuhYyoMuTesZ8ZwY0luzOzNE+RnBim73zKfg6EnPTOK7Nv5pLy2E=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr21903717lfd.529.1628599122109;
 Tue, 10 Aug 2021 05:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 14:38:31 +0200
Message-ID: <CACRpkdb2BZ4Cpc4zm+rTyxjr16Z4ZJGSN78wKmQxZOAdQ0o7ng@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 29, 2021 at 2:40 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The SC8180x platform comes with PMC8180 and PMC8180c, add support for
> the GPIO controller in these PMICs.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied, sorry for missing this. I blame stress.

I had to hand-edit in the DT changes, not even fuzzing worked
so check the result.

Yours,
Linus Walleij
