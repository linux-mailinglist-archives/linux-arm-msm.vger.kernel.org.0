Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F95C3018CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 00:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbhAWXBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jan 2021 18:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbhAWXBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jan 2021 18:01:34 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2E9C061786
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jan 2021 15:00:54 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id f17so10826626ljg.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jan 2021 15:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HrXVK1Xlvva74EMLsVDvNnC5B0+F3JZZDWEbxcIzfFk=;
        b=Vmm1S9RZHzIZvDYnDDrAzJH3S3oguv46vM7BrHrlebnTIkbmlQNHWC2pvKYVIHdsgv
         7yaKYVS2GotTPqpZiwnVBUYN5YieVS7QGZqdYh5tXVyf2jy/OCkql7fZ5yMkcL9lT2d8
         HgEmHpD3dFeA5Z+9ANmkoMHmwLTRa2E+7ZAnLRCc2t3rgtzwSRM6UJDB7fmfGc5dz/PO
         Agwqcjv1MHb2lBXqORpM159TskCW+bUPf1AfrwcWFJFuGYGad3RT0baDFn652T/rNC/E
         IYGbyGvwDV0zAXrzpaEesz1+LPFMHEZq086XCdvkLiRpizAZM/F894y+gsE85BZQl+Gz
         Mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HrXVK1Xlvva74EMLsVDvNnC5B0+F3JZZDWEbxcIzfFk=;
        b=cgPfgy1NufV0poNULSx8ouzmXfzTeh1kMYuaQ1qoDV23Yv+01WJ1up9fcsr03DK9vX
         ErWEoLqtVUniElTTyXHynp0HpAV0lBFkqH1HYCg3DH5p9rk6Vqlb2PD4FjrRWFOYgICq
         smJThPcrpPjkwOLTcZpUZHC3QE6EKRitCwCaDYOzU0YFmNGjubKKiUbp53RwlSoeC3dG
         6vf7TZMWqakWS+cttdGmJnL+q8dKrrnby421RPORRd84EAdilNyK7YiggLk0M49jixZu
         5IW91N/Us2CwHv8z91BDf6ymmpckWwis8GRmY0i2+TIIBAWNr3golNjUn2yaXKFr49KI
         Klbg==
X-Gm-Message-State: AOAM5320jZmoZnXhfxcBqjhoZVGob1FQMkt9qAKLR6Qtt75WE2AFLo/7
        Paczlo2/t7Ak5dsbTQsYZxJNTfdeovI2Mo5x+luAzg==
X-Google-Smtp-Source: ABdhPJxxyemhnBxyJIW6WUkq6tdnONnoKmLFjru3rwB+p5RRR8juI+8vkgZwRHs0U5QBMfiq9BIQky35UFJW+y54/vg=
X-Received: by 2002:a2e:9ec3:: with SMTP id h3mr220937ljk.200.1611442852795;
 Sat, 23 Jan 2021 15:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20210121114907.109267-1-bianpan2016@163.com> <CACRpkdZzVY=AKFhW-hEmCAHmdMgVF8=hQeE8a8W=2W0h44eQVg@mail.gmail.com>
 <YAtdlKe7q4JskefR@builder.lan>
In-Reply-To: <YAtdlKe7q4JskefR@builder.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Jan 2021 00:00:42 +0100
Message-ID: <CACRpkdb18fxjaspBWpRCvPt32ajXPzoEXPU77QiS2m8tjqL=NA@mail.gmail.com>
Subject: Re: [PATCH] bus: qcom: Put child node before return
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pan Bian <bianpan2016@163.com>, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 23, 2021 at 12:19 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 22 Jan 16:47 CST 2021, Linus Walleij wrote:
>
> > On Thu, Jan 21, 2021 at 12:49 PM Pan Bian <bianpan2016@163.com> wrote:
> >
> > > Put child node before return to fix potential reference count leak.
> > > Generally, the reference count of child is incremented and decremented
> > > automatically in the macro for_each_available_child_of_node() and should
> > > be decremented manually if the loop is broken in loop body.
> > >
> > > Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> > > Signed-off-by: Pan Bian <bianpan2016@163.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Please submit this patch for inclusion through the ARM SoC tree.
> >
>
> Any objections to me picking it in the Qualcomm tree? Or that's what you
> indirectly meant?

Kind-of-sort-of :D

Apply it to the Qualcomm tree!

Yours,
Linus Walleij
