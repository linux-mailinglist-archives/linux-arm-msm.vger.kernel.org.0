Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE35526C48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 23:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384653AbiEMVY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 17:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384647AbiEMVYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 17:24:55 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9FA663FB
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 14:24:52 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id x74so4720762ybe.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 14:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ueDaSsTErmQolYj/n89FuDLYTxrI+xxTPOLBk1HDOg=;
        b=XvprDXkDP/fuPYLrBoI4hnZYfwqDXbJPAroGtexlcSuJlDruxai6ShoTfhn7sxb4C5
         iZlmgndunl0Hw27N+ZimYysy3vyVRSfqc6FMBeWqre2N6FyL0pBjDjIGLhQgQ206Nvw2
         Oq9nfla9Z0DMWaJkFf/k3obDJKp2edaLrq/zqi7t0zFH/XMOxP1ndGdLjg1RIDpHb9Y0
         ky8J5D1ObPqIIwJKcn6eat+nhChP11h/FM9WjQvdChQIgY0D4VDL1UsPSVZZocgyR5aq
         N7ZS/EvualRlqgh+jJJvouLCgjCiP23rbWgVTlOCHvr+s/DyYLSIl8B1nHBlm7o4gUTy
         nXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ueDaSsTErmQolYj/n89FuDLYTxrI+xxTPOLBk1HDOg=;
        b=cFf6KT1AycTR9Rcg9FyRvwzudZuv6BGBl+8cj09Jq+mu/p+u28pX7/cQi+mj/Ri1j3
         T3JMtl/NSngb90qLySkEqd738KNmz01gF51arWZsKZtqmgU0mZYSpldOVCuHLIMjSLAB
         KWORe/cdws+e0yrWGuV73+onn5FNHSjMilEC7qGCNzdPmKVT7Ab+7wJMUUb5m7UskZfS
         iNsGVWrO36+CSKHCVhpkZZxNbZkSrj+9zoZ3EXYTvXwW5LLk1Z8vguXp54xwtQbr7XNG
         sA3QG5/CsJ5oeqt4Yrig6aTvNYi2ejydHoUndKTB99owEV5skQniFHMynC6IFXQ4qlsi
         GlAQ==
X-Gm-Message-State: AOAM533X3RI8COKiKp2uUJliqngjnlyKuw/sCW1LUafIVRFuYpuQ0y9C
        D89eVRw59QnsnwYeBFkK1CBd4YrWjVIaoz/yuZDdRA==
X-Google-Smtp-Source: ABdhPJxa1oQfaDAJgT6dUGne1j3ZUOM3aJOd/CmIcNBzgc1KHFgeiv/kBZmlxZpM00Uxg4d1zxDYWRbjBIZAHDoUxjk=
X-Received: by 2002:a25:2c82:0:b0:64d:62a1:850b with SMTP id
 s124-20020a252c82000000b0064d62a1850bmr273160ybs.291.1652477091802; Fri, 13
 May 2022 14:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220512162320.2213488-1-maz@kernel.org>
In-Reply-To: <20220512162320.2213488-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 23:24:40 +0200
Message-ID: <CACRpkdajTCS5CmQLY8hffVe1x4WzWuC_myQVGZNKV3sRzLPa=w@mail.gmail.com>
Subject: Re: [PATCH] gpio: Remove dynamic allocation from populate_parent_alloc_arg()
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Robert Richter <rric@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 12, 2022 at 6:23 PM Marc Zyngier <maz@kernel.org> wrote:

> The gpiolib is unique in the way it uses intermediate fwspecs
> when feeding an interrupt specifier to the parent domain, as it
> relies on the populate_parent_alloc_arg() callback to perform
> a dynamic allocation.
>
> THis is pretty inefficient (we free the structure almost immediately),
> and the only reason this isn't a stack allocation is that our
> ThunderX friend uses MSIs rather than a FW-constructed structure.
>
> Let's solve it by providing a new type composed of the union
> of a struct irq_fwspec and a msi_info_t, which satisfies both
> requirements. This allows us to use a stack allocation, and we
> can move the handful of users to this new scheme.
>
> Also perform some additional cleanup, such as getting rid of the
> stub versions of the irq_domain_translate_*cell helpers, which
> are never used when CONFIG_IRQ_DOMAIN_HIERARCHY isn't selected.
>
> Tested on a Tegra186.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: Daniel Palmer <daniel@thingy.jp>
> Cc: Romain Perier <romain.perier@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Robert Richter <rric@kernel.org>
> Cc: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

This looks very appetizing to me but:

drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 15 ++++-----

This seems to have some changes to
->populate_parent_alloc_arg not even in linux-next,
so I get confused, what are the prerequisites? (Probably
something I already reviewed, but...)

Also: don't you also need to fix something in
drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c?
the way I remember it it was quite similar to spmi-gpio
but I may be mistaken.

Yours,
Linus Walleij
