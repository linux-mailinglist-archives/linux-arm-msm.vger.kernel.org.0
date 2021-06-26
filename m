Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C2E3B4FD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 20:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhFZSbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Jun 2021 14:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhFZSbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Jun 2021 14:31:38 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0625FC061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jun 2021 11:29:15 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so13203721ota.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Jun 2021 11:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsfNESfqMuHVR/3TWEKQgeF1cU+m5Si9kUXhTtiYi2M=;
        b=AUVNQ6pPe4FF/zaIXnkLzesJs02J5fe9cvA6qVX9vqGnmRLKlVRNk2b7820AUsu0TM
         t/lc6GywsJN1N4kLgz2qOaad3f555GN75Rqlf4mYrF7DT2gndEbx0zR+DCZwJ/1kP+nQ
         wSrE9eWMEmYprGC9PZJ+egb2KQLDzZIyOJUn62dd6Z1+xSF3MP90/xOUkHG9aVPM8eHk
         ca/DAqSRA1LyiFucGgCNOzoQ7FjdW5zXr7nBGwMhWaqBwueSsDcKfCgbeohBkEaFywLk
         dotnFrJApzg9sDzJEka/le6GZUzU06ObsF+K+jPmm64iw8f7SIGw5jHTgqpsPRf3Q1SP
         xIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsfNESfqMuHVR/3TWEKQgeF1cU+m5Si9kUXhTtiYi2M=;
        b=QR1LzFLmL5XC5XjnhN8++7vZj7KHc83L0N1JLW6FztSRHqKAcWVF/IpmOOWNHp2JLG
         BfZ72TUQD9ZvOGCd+FyxMdXjqbqjWoDlvDY+J/pTMl4rcN+xhHtTopC+YULExbkwquKi
         /wkGW1rEDaJheWd9K3QKpA5NAuqKPFLjmJNEt+trdYg+u8XQfh0r8kyQoM5e6AnznKpN
         kpZpCe2yyaWLLhs7EwEQjnA24nodzcc9T10LwshabruvidNGRkgNGq7TnRqfJRwZMUFa
         EyfxKkenQH6MbLLIKucZcUo/kRikPuRVcJ4KOY3Z9+vDOdWAnmN3KK72D0mCSUFFboVj
         S5Ow==
X-Gm-Message-State: AOAM533WlvSVoTKKKMhC6ejosoo1JtObIAJDTPtUN77nJs9VkmFjsp58
        4/NnKYDRShkEy4NvSWljB63BmKW7/AapeKltem/q/g==
X-Google-Smtp-Source: ABdhPJzEYyfnyegOz/k5HDxQyXJRDyKFyA6MoFz3oNGViR9pD0HqIr10ZJLT3l532va7kK+4+T+2jtpiik5jFTu1KDM=
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr14303580otr.51.1624732154316;
 Sat, 26 Jun 2021 11:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-2-bhupesh.sharma@linaro.org> <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
In-Reply-To: <CACRpkdY9=Exgaqf4KdsfwH7gK=KGh0HVJSWD_FTqLtwd+pOBYQ@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sat, 26 Jun 2021 23:59:03 +0530
Message-ID: <CAH=2Ntwef4SpAF+zAxkNvy2pjBfuQZONpUgJavMKfGuV-2uzow@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,pmic-gpio: Arrange
 compatibles alphabetically
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Linus,

On Sat, 26 Jun 2021 at 05:21, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jun 17, 2021 at 7:34 AM Bhupesh Sharma
> <bhupesh.sharma@linaro.org> wrote:
>
> > Arrange the compatibles inside qcom-pmic gpio device tree
> > bindings alphabetically.
> >
> > While at it, also make some minor cosmetic changes to allow
> > future compatible addition to the bindings simpler.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>
> These patches do not apply on the current devel branch in the pin control
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
>
> Please rebase and resend!

Sure, Let me rebase and resend the pinctrl patchset.

Thanks,
Bhupesh
