Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C409C27D92F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 22:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgI2Uqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 16:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgI2Uqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 16:46:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7FEC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 13:46:32 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r24so5178994ljm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 13:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fkspQpmNiVmmG9fIU1fMVydquHJbbNsEZsryBbCLfrE=;
        b=bmCjC64SFZygtEqfJV9BMYihM/Byad6KCfdsyPuyHeM6FZHeejohaGsa6k2ep3+LZU
         MkefGeUc8ng5SwNsdfctPS7wUL6WaKfEb0Q75XxFMo0jDLxSW414IIVyjax4UpT2tV1q
         iABDAMin/ZODe6nheVlEUQn/rhbg+SVkPtYyNTLg4KqEdpRKk4APhvtw/eFSKapxHrqV
         464Vja9DbdW91hIVcJiYB9XzkkIeXGrYYxLCJJqFu80WQ7KTG4tK0qk60vYyFRrYXmkK
         XmUXD8n178CpTG+xExXZfaSVoz2uOivG6XuYaZz12AWLD0/L+Y6/jSfYXc+pDmzJTDbm
         OQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fkspQpmNiVmmG9fIU1fMVydquHJbbNsEZsryBbCLfrE=;
        b=KgHTnyY18M//bfqnz4rnS0h11k5sdhVuk9PA6hAJEK4hnMafxTK4zIC39vyitRSS8d
         Tt78swOAP56WQ5gwHEjUdJc5LYeX5lYC1QHZGt1Epyj3lhtoOnjbE1X3fBIsqGEUnxs4
         QGG+1pQBhAnwaY7KILktM+BAUQeIeB93vQadcfNDmWPXSeJ9BsRCce5JlroPxTX1zaWP
         gmSrDXGVotSrfofTjQLvf0x9Tpo+a0cm0cm3lC1QRmfuFBRI7oahIHYpCAkxlOp3RJeN
         8cEe7FZrPibF3s5/VMBGnOgARH3X/FMxHJqlT3Wteq+TjV1YkZggvhJOMwC7u9BMNrb9
         E6qQ==
X-Gm-Message-State: AOAM531pRPihriGq1vdCqVNUOAYPvoRlm9JTN10paFSC/vtPd8csoe3u
        dlEF+Ry9dKT3qv0sY9lP6DXoe26Uh/Uye5WZrMQVBw==
X-Google-Smtp-Source: ABdhPJxUJgqiLOqWRf7LB26N2c631Xvz0WhD9oJe1xzN7CkcU9q2BIxd0CqqZ8UEoASyqGWPLpS/pnHTDknK6oEVtRA=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr1825250ljo.293.1601412390471;
 Tue, 29 Sep 2020 13:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200925234504.GA18813@agrajag.zerfleddert.de>
In-Reply-To: <20200925234504.GA18813@agrajag.zerfleddert.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 22:46:19 +0200
Message-ID: <CACRpkdYCw7hPZrfdJ4ETqNDGJm86x_mFd1smStGQAFGAKHroUQ@mail.gmail.com>
Subject: Re: [PATCH] bus: qcom: ebi2: fix device node iterator leak
To:     Tobias Jordan <kernel@cdqe.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 1:45 AM Tobias Jordan <kernel@cdqe.de> wrote:

> In the for_each_available_child_of_node loop of qcom_ebi2_probe, add a
> call to of_node_put to avoid leaking the iterator if we bail out.
>
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
>
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bjorn can you apply this to the Qualcomm SoC tree?

Yours,
Linus Walleij
