Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883104A8A92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352924AbiBCRrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240648AbiBCRrG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:47:06 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B14C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:47:06 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id g14so11208388ybs.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5dZWO2zmkTU1RVWjuesiHDlAcvosB8eIhfb8TkkDW4=;
        b=fWjIkmzvsJ8zoAcq7Jc5ZmyO+/LLei8lOf89EOTKrjbv8VmqxicG8D8XTEienF/D01
         cb7RXvb02KtgLw5HlmlHMdjoaucdPUTQWs8R86dySiqbqJC8afVqzvDWgJTae+ZuWYJk
         JJaHG6o0T1+HJBVvn1Btr6m6ME2WoVRAwnkoX0Pb/bCUt4PXxvaRPy+pGjm7BbmhtE36
         YiIMxPEw+H0Jl1rUG8FPzOiiZU1KblPn8V7pJ3UBVk1B6qBIInRzLj9yuwQrgY56zWr+
         Gpw4+5/v0QmrR99MCddwYsyOHxuZcoQ3MObje78mPaZoEHBzyaPGL+Yemgy8whpB80nJ
         ZziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5dZWO2zmkTU1RVWjuesiHDlAcvosB8eIhfb8TkkDW4=;
        b=X13w/SiiE2vMjHUhb90EHNBfoGqBrb28pmno1FR1+lC6qOgUbTFA2KedHNjjIih6tn
         EU/6HqrGNx5Cc4/45MLfZGC9VvR0vzgrHcWtUhsrXTASlE11sjGr6Q7QdPk+HcsW474y
         rcKSoyP7cs7OC4aWBc8Jitx6hHGlXth74a/SxI4w2o0WGBvltWwIPl+hrHJlGqbfDI+4
         zpH9txB4ZagdyqSqjUhHgHQTzON74xB+vSX/1HxQ9cJp1E/nFiBFONeYGWghla6iParP
         ElqM2o0kyltbRTyq01C9lCi/sCDzq8Ij9M43Y2JoC4iEDqbuaCON8BSnOFfNki62hskT
         qA0Q==
X-Gm-Message-State: AOAM532MnqCZiGfNvhhOve8gPSzlegCisX19ajap3V2B2llyXVbZ9S4c
        Vc931IExHbUn25n4/RlgrZgkbDCGK/RxTRG4pcs2BA==
X-Google-Smtp-Source: ABdhPJz0+rQtUI8LuvWp2eey3xD0y133oWhVArETGjYikU7HVNZG/2q32vKkVmbl7w29e5uYkgM8sM1xerFpoQ3AU8c=
X-Received: by 2002:a25:df56:: with SMTP id w83mr46318988ybg.110.1643910425506;
 Thu, 03 Feb 2022 09:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20220202113722.7550-1-michael.srba@seznam.cz> <20220202113722.7550-4-michael.srba@seznam.cz>
In-Reply-To: <20220202113722.7550-4-michael.srba@seznam.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Feb 2022 18:46:54 +0100
Message-ID: <CACRpkdbxMU=Sf7HofDpNr4pGdPWNs7Ga4ACikZYF5bFJwivnLw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drivers: bus: add driver for initializing the SSC
 bus on (some) qcom SoCs
To:     Michael.Srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 2, 2022 at 12:40 PM <michael.srba@seznam.cz> wrote:

> In combination with drivers for resources on the SSC bus, this driver can
> aid in debugging, and for example with a TLMM driver can be used to
> directly access SSC-dedicated GPIO pins, removing the need to commit
> to a particular usecase during hw design.
>
> Finally, until open firmware for the hexagon core is available, this
> approach allows for using sensors hooked up to SSC-dedicated GPIO pins
> on mainline Linux simply by utilizing the existing in-tree drivers for
> these sensors.

So the idea is to access the SSC-dedicated GPIO pins with a special
instance of the TLMM driver and then enable the sensors normally
managed by the sensor hub?

This is a GREAT feat, as we don't know if we will ever be able to
get any proper Hexagon firmware for the sensor hubs.

Yours,
Linus Walleij
