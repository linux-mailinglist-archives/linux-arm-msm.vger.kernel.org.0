Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713CA730981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 22:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbjFNU7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 16:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjFNU7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 16:59:09 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14A7211F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 13:59:08 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso1082687276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686776348; x=1689368348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP+wDPly97ywsMRrVLmraQQeBjQEOheXPRjV7dTEQOw=;
        b=uvMiIkzg8Ec6M5XTOQAqMp1t0tQHji6hGKiVE6a250KIJ1Y0/m6ZHRFz9nhouWQBZM
         rGzOxVMPxZ3eQVPn912iUeMFSzQBtemDJARdUSJphTaWbbeerw7JzzTJp3DbcbB1GYxD
         N2QyYdI7uPKSpHJZ+SRWP/T04owpsoVFGcW9mKEkc97FFt3nsI97PS/nZ+GDdEoIMId8
         C/85OAxQqFfA5YppW3NjCd+7Vwb4xQr4CZdSb7kdkLYQT/ozQaTozPiNUC3ZLUwga8UO
         +PNOlkofnVfNXA8RECgaiXK01KefgbRCvfBwpopgiLbTvwfZduI3se/veMQD64p+sWuR
         +W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686776348; x=1689368348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP+wDPly97ywsMRrVLmraQQeBjQEOheXPRjV7dTEQOw=;
        b=PYluOUpwZVmWeNRxnG3qGMQXpqoQRF7dsDK8HCmDbvxr3GQcq+YeJzpzHwZ5a8gKzQ
         lGKZJmK7UvZJ0fzdYJiVCD98yh1Xklsc5zEzX8F3CfnBIOo8yroYkX+nntmmTSbH/xqo
         Sj9KKUVxPRc7WQWWyJfR2WEWIN/sq/aWOwmdrHqNjuOvaN08JqccT0HiBpajBfbqXvzm
         lVIWqwP3rxAbUX792c8Y0LWR+SXDfl0q0hqGz2/6WMiVGCxSIxIAB+xkiodPc6Orsw6L
         7XjNCxWukCd/cywGSJa1aszHSdI1C2bJS6TnxQfHvNGX5hqRsGlkOLTih2rU7o+GSt85
         0zUQ==
X-Gm-Message-State: AC+VfDyL1SKCuD1QqeugSDvzNs9yfNcSRa/aCT5PJ2t/o3Y2wiHgiiAk
        nXiq0hqgwaekO8f1jKPK6qNIpcJYrH7mWhJit1Ng+w==
X-Google-Smtp-Source: ACHHUZ6ldhrUzytb6pZK4Kqea7NKorIx47j+Tni32nNp0wQtVDjui5ZFE0ILZOdM0tTThjU0QHOz5VvxOXL1XdvwMwI=
X-Received: by 2002:a25:d748:0:b0:bba:9296:891f with SMTP id
 o69-20020a25d748000000b00bba9296891fmr2980889ybg.9.1686776347845; Wed, 14 Jun
 2023 13:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230613-panel-dsi-disable-v1-1-5e454e409fa8@linaro.org> <ZIjayn8nVy-ejThH@gerhold.net>
In-Reply-To: <ZIjayn8nVy-ejThH@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Jun 2023 22:58:56 +0200
Message-ID: <CACRpkdZ7a3aARMs3iBbBavF_0AkPOPs3fH8e6CrZYo7Ybr6m_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: move some dsi commands from unprepare to disable
To:     Stephan Gerhold <stephan@gerhold.net>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        dri-devel@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Joel Selvaraj <jo@jsfamily.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 13, 2023 at 11:08=E2=80=AFPM Stephan Gerhold <stephan@gerhold.n=
et> wrote:

> I'm still quite confused about what exactly is supposed to be in
> (un)prepare and what in enable/disable. I've seen some related
> discussion every now and then but it's still quite inconsistent across
> different panel drivers... Can someone clarify this?

It is somewhat clarified in commit 45527d435c5e39b6eec4aa0065a562e7cf05d503
that added the callbacks:

Author: Ajay Kumar <ajaykumar.rs@samsung.com>
Date:   Fri Jul 18 02:13:48 2014 +0530

    drm/panel: add .prepare() and .unprepare() functions

    Panels often require an initialization sequence that consists of three
    steps: a) powering up the panel, b) starting transmission of video data
    and c) enabling the panel (e.g. turn on backlight). This is usually
    necessary to avoid visual glitches at the beginning of video data
    transmission.

    Similarly, the shutdown sequence is typically done in three steps as
    well: a) disable the panel (e.g. turn off backlight), b) cease video
    data transmission and c) power down the panel.

    Currently drivers can only implement .enable() and .disable() functions=
,
    which is not enough to implement the above sequences. This commit adds =
a
    second pair of functions, .prepare() and .unprepare() to allow more
    fine-grained control over when the above steps are performed.

    Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
    [treding: rewrite changelog, add kerneldoc]
    Signed-off-by: Thierry Reding <treding@nvidia.com>

My interpretation is that .enable/.disable is for enabling/disabling
backlight and well, make things show up on the display, and that
happens quickly.

prepare/unprepare is for everything else setting up/tearing down
the data transmission pipeline.

In the clock subsystem the enable/disable could be called in fastpath
and prepare/unprepare only from slowpath so e.g an IRQ handler
can gate a simple gated clock. This semantic seems to have nothing
to do with the display semantic. :/

Yours,
Linus Walleij
