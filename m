Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4483EDF0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 23:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhHPVIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 17:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhHPVIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 17:08:44 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60125C061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:08:12 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so5317727oos.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DhhEi9REryF7Euqq+T5kr4qdAnwWtXdUixXZ+suk4Bc=;
        b=ZFFABO/zVDWWQmLLx0RAO6ybYuaWOdMI8nfvqWkZjHWT8a6efPqOopO3FP63sz7FCF
         euRekIkxlsBrNPkbbInMLWEp5RUGKhseciWZxhfOUiN7ek051Qryieqvixa9QRfxErmP
         fGQRczUdjxKv75kS7gpw4JjRovjWd6GJIh454=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DhhEi9REryF7Euqq+T5kr4qdAnwWtXdUixXZ+suk4Bc=;
        b=jtayLXepVPRz5ORHuKGFvqfTMJNIeWDFE+t1phMD1rExR9ZeMCYdT0JCYhzre4rCiK
         Y72zgupkvIRN9waUwJn7zuSs9BgU9JH1hYGbYeX6qbVzH059+klhcsvRlNpIwIQzIip5
         J75Y/AFqaeKPRmwjAeWVhedLBCu/65WmN+uBZ6+oZxcqEQn79MnJyf42hMxpJ+HBoQ7E
         2pZQz//WC6oS01eFcvMWAh47qhEmVk9VjIQoLi3U+JCEhCh6nuV3JvKKzele1HMPqaeo
         mIjaplnrIOL3ASTJm+lvHyQ92wrp6tZ34glVzzeZ8+w7hQm3L/N6cSN8N/ooNR4MZA7j
         JYUw==
X-Gm-Message-State: AOAM531EufQ8o0ppN3nnaXAdtVEQsYUelqA3VH0mpWpqhAdA9jS0xqHO
        /FlMDkESLyEfEiVCcvKTkhiLoialMlANMpjabhDrZw==
X-Google-Smtp-Source: ABdhPJwkW0aWkQ3eA/CgUBtD3vfjlQxS+WPjQ68YkWRc3r79J/uwSbmFY0qfQ58wr1VReoLjN/jo6yEDlFehMe1Pnb0=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr191016ooe.92.1629148091816;
 Mon, 16 Aug 2021 14:08:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Aug 2021 14:08:11 -0700
MIME-Version: 1.0
In-Reply-To: <4af8171aefd6f0387438225666ec1ccc@codeaurora.org>
References: <1628830531-14648-1-git-send-email-skakit@codeaurora.org>
 <1628830531-14648-2-git-send-email-skakit@codeaurora.org> <CACRpkdZteWY6X+prHeAF0rtPVbCk+X9=ZYgpjgAMH24LhOjhaQ@mail.gmail.com>
 <4af8171aefd6f0387438225666ec1ccc@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 16 Aug 2021 14:08:11 -0700
Message-ID: <CAE-0n53sR12fEa_cNPeT5eGcQVzzL57pd-tYnJbpP0NXkHMTsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: spmi-gpio: correct parent irqspec translation
To:     Linus Walleij <linus.walleij@linaro.org>, skakit@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting skakit@codeaurora.org (2021-08-15 23:50:37)
> Hi Linus,
>
> On 2021-08-13 14:27, Linus Walleij wrote:
> > Hi Satya/David,
> >
> > nice work on identifying this bug!
> >
> > On Fri, Aug 13, 2021 at 6:56 AM satya priya <skakit@codeaurora.org>
> > wrote:
> >>
> >> From: David Collins <collinsd@codeaurora.org>
> >>
> >> pmic_gpio_child_to_parent_hwirq() and
> >> gpiochip_populate_parent_fwspec_fourcell() translate a pinctrl-
> >> spmi-gpio irqspec to an SPMI controller irqspec.  When they do
> >> this, they use a fixed SPMI slave ID of 0 and a fixed GPIO
> >> peripheral offset of 0xC0 (corresponding to SPMI address 0xC000).
> >> This translation results in an incorrect irqspec for secondary
> >> PMICs that don't have a slave ID of 0 as well as for PMIC chips
> >> which have GPIO peripherals located at a base address other than
> >> 0xC000.
> >>
> >> Correct this issue by passing the slave ID of the pinctrl-spmi-
> >> gpio device's parent in the SPMI controller irqspec and by
> >> calculating the peripheral ID base from the device tree 'reg'
> >> property of the pinctrl-spmi-gpio device.
> >>
> >> Signed-off-by: David Collins <collinsd@codeaurora.org>
> >> Signed-off-by: satya priya <skakit@codeaurora.org>

Can you please add an appropriate Fixes tag?

> >
> > Is this a regression or is it fine if I just apply it for v5.15?
> > I was thinking v5.15 since it isn't yet used in device trees.
> >
>
> Without this fix, [2/2] Vol+ support is failing. If possible please
> merge it on current branch.
>

Are there any boards supported upstream that have a gpio block that
isn't at 0xc000?
