Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0AE510B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 23:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355617AbiDZWCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 18:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355463AbiDZWCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 18:02:44 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2241E189BDC
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id w17so103887ybh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=rQrWMCWuHFbF3fA9np1al/NM6sLB/JVBaqI3xHXuG6+nPXC8BDAdkBeT6D19OTXrq0
         NSc/OxVS+gT1SCyw5YAOZDlwIrOtbf+Q78CkXJB7hF2B/2A4eFvhie2pcoQPpLxVW4ib
         mhKgvVfOJ+UgrJcHisKxEQPTZ9v0Lwt3NB6/N4O9I1U+0rQiESSjJaGx5Iu+TKa2E1Fg
         9VCX+hWONIn782AUxluTfo/LPp+PeiLA3NSBA6uCSNzwyvaVLuTV3BMHNjzqpcBAi1nn
         rB0cH1p4qIaWAd7LAyMJhfbKrmYqRx6e4wgzQgHXqFrN5zibWycWzHr0OFUsWplKJ7zh
         4bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=USb6bLSokiTmX23FjlFH+13AgVaFMhIjJZvDsU5XOrE7Tx+M7UpsTbLF7BrZrfLUEH
         olbEeDBzUFrtieuJPo2bzP/XB+ViJcvS8nWgZocWDSLVh5S2r5+6DINYCmp+oAHLF09j
         QopR5H4gfKpMsBNKGRbPNdNWrSTFCPg8rUrMkd9wdff8tAQA+4jkJHbOkpL94NEtrGO9
         ybUX3TklcdfMkjlHzLNW7JxKCOmQf61nrbwYZIPB9qOkqQyLkei4XRya6IPejWfCItW3
         PNs+m2ZXoZHqkivpFNMaJb9SmQOTls8zn7clF1W/Xi3VysbapVV+zTueO9thylz7BbVM
         ZgVg==
X-Gm-Message-State: AOAM531oGGLccXUm3+yRVx6rFPdGk7UCs/s5sCscdUeNikNclsAXknEQ
        IDed1UBL9IDwQfQNXDFG6UfR8n6NXgMUhLcIyU+JSA==
X-Google-Smtp-Source: ABdhPJxmNWf2WAOTBOGYlwqgY2kNnoEeFKfKMFvD28pKOaD0KFUI3oAtcgVaqXsBmJf+wSb/F3TYdyLteg2ZEsK/pP4=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr22727605ybh.492.1651010374328; Tue, 26
 Apr 2022 14:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org> <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
In-Reply-To: <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Apr 2022 23:59:22 +0200
Message-ID: <CACRpkdaO+KTb+jJQ0qY59TP8f7gyY2mTUtNEt5+KUHNQAYU1bA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 26, 2022 at 12:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:

> > You can pick it up from:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable
> >
> > but I can also drop it from the irqchip tree.
> >
> > Just let me know.

Pulling that looks good to me.

If Bartosz pulls this to the GPIO tree I will also pull it to pin control,
I just want him to decide, because the impact is biggest on GPIO.

> I would prefer it if it goes as is now and every stakeholder can just
> pull it. As far as my drivers are concerned I also want to convert
> them sooner than later, meaning I want to pull this into my little
> tree as well. Bart, Linus, would it be also preferable for you?

I'd say let's all three pull this branch, Bart?

Yours,
Linus Walleij
