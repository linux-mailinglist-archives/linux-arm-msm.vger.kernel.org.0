Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846A5205518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732853AbgFWOss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 10:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732798AbgFWOss (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 10:48:48 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB68C061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 07:48:47 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id v25so6892594uau.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NEabnoTzMSMmcitY1/kUEpPMigRk7eTjdULYpM76Ya0=;
        b=DHSb/7qblyoC5f9D++LorPl3ez8L+VQhZKYnVxUQ9dLG2QiycB4kbSeK6pXj88TjQz
         QD3h3IvFfIXvU2jIAt0tjkC6PMYXNql5yUzFG36LH05yzBs/z623O0R5YrGgwT7Osv00
         Vqdknz0xMDz/A0AbHhPKiBKgL/zlLArpB/LwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEabnoTzMSMmcitY1/kUEpPMigRk7eTjdULYpM76Ya0=;
        b=T4js4YdI3ra4KEZXq1BLliU/jfqflH7PW/mlx6jche2yRNUjONXV0B9jTxYy9zOSKg
         5S4PLIOwNgxwgfuy3BZSR+XUnsAm8T/Cp0ruzxUD3i2kmD/3Bz2p/q07/Q4Woa5+fLKL
         XKwFISXEdNMsUlbVZIsg/fe9C3GNLltsJ2bOBH5PgVrPNcJ2QUe9BnWpc/p49itp9VCP
         xoEYlRx4AVhTovT7FdYWyHApg/wHJM+w522yN6aRuolDoQAc+Ys4981MWkiMFwz2ig9m
         zCmfe4qyjxvk0FXpSQ/gSKfwDmLCwueIMPuYNcGTASxAngRiitZKhpmFxAfIIrbLhLFz
         Od7g==
X-Gm-Message-State: AOAM532/IV7bndj393VqOKcagZTTno0weUuj4z+LmuJVN0ITadeM+OAl
        tu/GUQxF2rbmszY2y4nH2BVCcULwsAc=
X-Google-Smtp-Source: ABdhPJyp1PtuLTZ9epBYwKLTyHleTbWf8DrS9XI7e9VpEnDJO+SDO/xB286mWXe1q6LQPimwyXYDAQ==
X-Received: by 2002:ab0:5fca:: with SMTP id g10mr15410800uaj.138.1592923725871;
        Tue, 23 Jun 2020 07:48:45 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id r134sm2607615vke.26.2020.06.23.07.48.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 07:48:44 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id r9so6889806ual.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 07:48:44 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr13926131uah.22.1592923723861;
 Tue, 23 Jun 2020 07:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid> <20200623133559.GD2783@bug>
In-Reply-To: <20200623133559.GD2783@bug>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Jun 2020 07:48:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Up9MfQju_5Pvqqe1kU1ebZrmWK-qWvA_-zm8K74wkKNg@mail.gmail.com>
Message-ID: <CAD=FV=Up9MfQju_5Pvqqe1kU1ebZrmWK-qWvA_-zm8K74wkKNg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 23, 2020 at 6:36 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > This patch adds support for blowing fuses to the qfprom driver if the
> > required properties are defined in the device tree.
>
> Should we have this in kernel?
>
> If so, should we make it harder to use, like passing module parameter
> enabling this kind of support or something? Kconfig option as most users
> will not need this so this should be compiled out?
>
>                                                                         Pavel

It's definitely a good question.  I'm curious: who are you trying to
protect these fuses from?  A bumbling user or a malicious bit of code.

For a bumbling user we presumably just need something that makes it
not quite so easy to blow the fuses.  Passing a module parameter isn't
a bad idea.  Would the module parameter only take effect if provided
when the module was loaded, or could it be switched on later via
sysfs?

For a malicious bit of code: the only real protection is to have the
bootloader protect these, or to blow the fuses which disable future
fuses from being blown (the access permission fuses).  Otherwise
malicious code could always just code up its own driver to bypass any
protections.

NOTE: if we already have protection from malicious code by having the
bootloader configure protections, I wonder if we still need additional
protections against a bumbling user?


-Doug
