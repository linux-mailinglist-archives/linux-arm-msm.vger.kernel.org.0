Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7565E216C70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 14:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgGGMCj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 08:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbgGGMCi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 08:02:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BCDC061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 05:02:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so13843074lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 05:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qUQcmH93QTvDmQbJjZbeKzTAZa2pMU0UcSehpTBZctg=;
        b=jdKMJfClPxp5TF9uXx+oqo8TzEc6Evdih7SMSA2I6rJNR+F1Acvu8jU0XFIM9eVqUp
         KqgqVb0skcKLFN0doaEQp/ez3Gidgorz3AAS+62/U6IcGKh4vMPslYNvWJuxZ12L0HH3
         xv3iA6BcyUUcAUzwdMT4W+Bu7AnjghaDV8T4XEjCIsIUZZKe9/GYmnQwKLjVqEc8cUNi
         YMZv0gKiJTEHFkj2K7KluUEt4HnY9MkunhOZzK9ReG69NloWB5yu6VgYs9cPctmcT16H
         9xbQsU46cV7Jw6OQNDnVE7KDRdED8PO1EU3/hGeLuImjfg7Hylsa3OhgyLksRcloKCH2
         yXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUQcmH93QTvDmQbJjZbeKzTAZa2pMU0UcSehpTBZctg=;
        b=X1f51avvRgaIrV2LRZXEbk7uMx9vgrwIKlx/5yRUtSd89R4P6zmPcoGpGFThN3XACw
         sav5JSEVR6IxAPSYEwBkRp0fzQoPjZpxsCsNRJaITjr+FaBp8y35EVc2MyxY9Bb7cWbc
         bJcmmGqQ9wpWvAVblpbd3E2B27ylQk6fBotmkZwd9QkJ+Q4jg6AFMLt85NWpQyYv5Miv
         PqeQl5jIANDwuz+aI7iM1EPqxSvXlQ6+51vYHXPPJC50H+2Cm1SV6feE8hc78owmFhk8
         4KFbpmD5nkBQw3DN5yrLMNcpy7s+N6m1cCIxxTJ2Ld9LwyP2n36bSdQwAV4CEvGBuP7L
         hgzg==
X-Gm-Message-State: AOAM533YRWonCsnho9uqFr5+w9s5OcqFKvDUcTGeoAk2wt2h3tzAZHWr
        wRfT2uUl1y0u/UzM5x2jIR1gcbFSQUloQQr2rzfaCzyfV4A=
X-Google-Smtp-Source: ABdhPJyoQQmnEXRQsOssY6B//fc0bqu3rkaC2C2dVvGuSLi6c/sP2pXenL4tDe7adDzLmfda5EnD2c4fWXfZBhH7QeI=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr14058132ljc.104.1594123356768;
 Tue, 07 Jul 2020 05:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200622192558.152828-1-konradybcio@gmail.com> <20200622192558.152828-2-konradybcio@gmail.com>
In-Reply-To: <20200622192558.152828-2-konradybcio@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jul 2020 14:02:25 +0200
Message-ID: <CACRpkdaBxYWKcm6b7HGL5XuyfjSVtV3ck4KE2q78mdSixqC6qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: qcom: spmi-gpio: Add pm660(l) compatibility
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 9:26 PM Konrad Dybcio <konradybcio@gmail.com> wrote:

> Add support for pm660(l) SPMI GPIOs. The PMICs feature
> 13 and 12 GPIOs respectively, though with a lot of
> holes inbetween.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Patch applied.

Yours,
Linus Walleij
