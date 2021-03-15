Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02B933C016
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 16:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCOPgb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 11:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbhCOPgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 11:36:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7ADC061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:36:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a1so16757638ljp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eiHizJmFemXxUepeQXNK0dXDWFjN//yCmR/of+Jsshk=;
        b=f8omFg9i0wexsaLy7aYOboT+afbYPAV1waixWzYUDdDA6B4bMpTvmdkfL66367GCB0
         hjuf73k5OA79n/v/ZjWIH7De+sPd71zHOTxfVNcZ1LCDl8NJNFra362kltHzvV3z/5q2
         mUTHsUTyc51F0AnmW/AIKjTganOBZc/zdeqX+0J+XqaaWNOISpuciYUvyj9HzaACQvg1
         UH+8kNRVXdr6D9rynGIjRaUDxzFlPU6nkT5GDWIBvzjBOUUcD8BAqGSwkYrq5R8alywl
         3qAJmu9q6qPIwiarileYRr04H8cgsCwhtHh8KdIRcMbgVGY/LhCqsnd0N0gPQYNW6VEp
         UUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eiHizJmFemXxUepeQXNK0dXDWFjN//yCmR/of+Jsshk=;
        b=fFBhjVfRDzeaDdnDVmUSgwZv6idqv5eMoY0Qwu5XnGIOpt6157LuyHojnjujL26QqI
         Tl9YkgxJlB8pk8uOqVT3eui6EXpyyBHei6u2MkucEvbUaHTh9R4fDrUuddqwKSEtWrQv
         ig5w8rzDNcq4w3pW7kXiewA1LvV1CHXRhiDyJDPOyNF6SX5ElfApsS+5B75vo0QR93VY
         B+/H2z7FtomqSKX4C6m+l5Iz4aVsVNdn6GWrehR40mDlwmLKvtmRxs0FJ5fawJErriD/
         dWLMHuvWhK92CwNAlmQuqt7WBW+NB7Uk8ENurKMqQ/I5OnGJW2RdWP14+GfEwI2kJ3Hp
         mRdg==
X-Gm-Message-State: AOAM5339J8HTb4LrootCulDcM0StnULkDWtZ+04ab/FXJ+CSLavNIydl
        AMIzqS3n6ohzhEspweo+RVydTAG2TJJXHd8PiHmrLv/QjXM0QSaw
X-Google-Smtp-Source: ABdhPJw3q5Vb780yHnT1QMqZL4C+po2SDrsvTMchS4fg7vi/xyG3rNqmcetBjsuMnkFv9wMzK0Nb3xlKVOq0+CBOgbs=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr10475044ljj.467.1615822572593;
 Mon, 15 Mar 2021 08:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210303131858.3976-1-shawn.guo@linaro.org> <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
 <YEqmTUXbn0T2dqla@builder.lan>
In-Reply-To: <YEqmTUXbn0T2dqla@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 15 Mar 2021 16:36:01 +0100
Message-ID: <CACRpkdaQ_p1n6+cu5f2p6gWui-eDMF_MEmC0ZQM50oyb3CcZUg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 12, 2021 at 12:22 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> I don't know how to make the transition, but can you please revert this
> patch, to avoid breaking compatibility with DTBs out there?

OK reverted for now. Does this imply I cannot apply Shawn's ACPI
support patch either? I.e. is this a prerequisite?

Yours,
Linus Walleij
