Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE6641013D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Sep 2021 00:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236560AbhIQWde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 18:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236059AbhIQWde (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 18:33:34 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 349F5C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 15:32:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g1so39314022lfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Sep 2021 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMlZupJaaOmfM5kF68bTasQo1i9K/JwY+k5KTnrWPMo=;
        b=pWYIgc9VNNCeJNC1e9/VkHmZBez2EDmS2PcdErOeXRN4xgp6uos4SYg+4oTI+xm4MT
         o/zG4Kp2V6OwWmQfKNejC4Jp4UFf49i52/KggwAVAp3nSgnXUBl3OimLMYRR8N+Guuu+
         YyqT5xOg/JsSu2Am/ua1o2bTQe+Jo4AAwrA9lE2cUlD31Zmavd3W+qdmu93lAXZ+vEVq
         Rn06xp31zNd/5lLFgCKFqj+TJ2dInOCeO2IDIlvety25M+zxpby7VCL883/l+GHal/rQ
         Uc7nsN2PIFsRJSNa0fwlGcrkG3oiyyEkBG5R812ndCQAXpeZwZczo6ecra3yLoYZYD2g
         1q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMlZupJaaOmfM5kF68bTasQo1i9K/JwY+k5KTnrWPMo=;
        b=QHuSO3za/f1A6ZYSWMR1uapTccQH8lP7KZDxUCSswhOBXSX9WnGmzqqcqKRJM1Bw1k
         FDmNk1kjHDFAL4cww0DwmyIByA+qEIqVQ/ELEgSs9rhVvex2KI00dLYdD0dwO1A63Bxj
         5YwypOlCsrbSpJmpC0JmfDhTfzAQ4cIdMuSFJx31X4IINL86e9mOGAfDhg+GbUovLdjB
         6Ci5H0D4xYCds1gcIDB3FjM9B9sCLu3xtLqgQdBJel2uK6+uZmLVTs3P6IweBQ18POGD
         A1EpmZvf/QV4V+cXQFSasx+WM3HdJKvkpFVlSkNWkSL5eqlUIddNm0dZci3mhcMP33oy
         3E9g==
X-Gm-Message-State: AOAM533xbKmYdC65h4hrUAACWCV/Dx6b7KzunGeqV/jIwlxSqTt0N0aO
        Djw7+4VLdjftnk78zB/K2TL8QBYTFX87VjhmJIC0Ww==
X-Google-Smtp-Source: ABdhPJxiLoB+28Pv7LKUWwQryIaYhXX8k0rQZhkj/JY1U969yvs0oB5ymnY+t7DiPA5DrZOSoyLVccmJ69BS74kuhkQ=
X-Received: by 2002:ac2:4651:: with SMTP id s17mr4952713lfo.584.1631917929456;
 Fri, 17 Sep 2021 15:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210911232707.259615-1-luca@z3ntu.xyz> <20210911232707.259615-2-luca@z3ntu.xyz>
In-Reply-To: <20210911232707.259615-2-luca@z3ntu.xyz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 18 Sep 2021 00:31:58 +0200
Message-ID: <CACRpkda0Jm=JwxpsmU63m94hFsL1Lhuk3mfjgFuXLNJ3RjdUnA@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: qcom: msm8226: fill in more functions
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 12, 2021 at 1:28 AM Luca Weiss <luca@z3ntu.xyz> wrote:

> Add the functions for QUP4 (spi, uart, uim & i2c), sdc3 and audio_pcm as
> derived from the downstream gpiomux configuration.
>
> Also sort the functions alphabetically, while we're at it.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

This patch applied to the pinctrl tree for v5.16.

Yours,
Linus Walleij
