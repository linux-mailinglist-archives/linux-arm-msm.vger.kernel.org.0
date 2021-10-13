Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C536042B3D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 05:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhJMDs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 23:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhJMDs6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 23:48:58 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F50C061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 20:46:55 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id v17so1410353qtp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 20:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xHBd0Wa0rSoZFxGqoT+opA0jNE24TvAUyoul5V1m4IM=;
        b=XpCeHs4qW8F3FZY4gbJ0Ixs7wpFeF9lP08SsKRpwNb1bHYHq0DYu7mjLSOpUOMQhlb
         YhJt7zq1WCy7ob9Bu9qTQkC1y/imJu6JrJCJrkuUOkYaXjnYo+4emLz9260vsKlidKU3
         Dan27Pye6YuLQoSHuHjMhZcVw0ihtygdZ5QsiO9cr5n7OGbO4mtrn/Ioo2v3OUvIqOxq
         0PvwCCzWdkIW1GOvieyABBWIBXA80EfWEsgbqlc4ZOljd1oYxZkE/uPfwuuyplI9TNdH
         koK6z/OYcWA8yxXeXTLeXsMWE5v/3NvhERYPI3J7rFOgdO/msfIVg70xcL79P/K0w+wp
         f03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xHBd0Wa0rSoZFxGqoT+opA0jNE24TvAUyoul5V1m4IM=;
        b=Q7sM8Z5qxzRXUEVhixPBHkYYaI7zfS5OPR+OhiQFgWkP7QygQsviOuNSERxgqfTQhS
         pi+uX8isSaZCn6V0JzTAxrqZratmXsYQwPKItTipuokf5R4SFVBoIVPGdozO1P0gknyr
         VK405IiOi/WLXljwBUIawb7F5mfvFFhAdazKecM7cqRsfSSz9LLsvt/qPHixFgOPlrgd
         Rmo+9ilBVw4rmoSfoFc1UnQsol6jiwpz7k4HpdhZ7ZWUaGE1vCmPv6KM2tRfO8Snqg2d
         /TIeAm/al9LXhF9g655gRWVRiqwLvHbYMsxeZmawTu1bTmYrPKkjNKZYzmR/KFsm7HKE
         ANFA==
X-Gm-Message-State: AOAM530gBskc/iyFr5QMk5eG140cFvdARaYAXUq5QxE6GhL6kLNO89kz
        6u9491wlW98EWESxHjF6Oa8uLPxdTuR8llQ3CEwUO+2pBn8=
X-Google-Smtp-Source: ABdhPJy4YiOg9dlaqLhJX9qZDdydYYREVGTzhvnKh0TvizUmjhqSyqxW9Txzrw7FvYn+mebgZ5P8r1YCXEpC3COdVN0=
X-Received: by 2002:a05:622a:409:: with SMTP id n9mr27426050qtx.153.1634096814516;
 Tue, 12 Oct 2021 20:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org> <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
In-Reply-To: <CACRpkda_hW7vbvC1jizRa05ZdgeL-FkU3_zF+rvCfRBuRB3+VQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 13 Oct 2021 06:46:43 +0300
Message-ID: <CAA8EJpoqawEDKfKiPzU1zYACa8hU16Ly00tsb0d6BU_jLQMEWQ@mail.gmail.com>
Subject: Re:
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 at 02:59, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
> > In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
> > to hierarchical IRQ helpers, however MPP drivers were not converted at
> > that moment. Complete this by converting MPP drivers.
> >
> > Changes since v2:
> >  - Add patches fixing/updating mpps nodes in the existing device trees
>
> Thanks a *lot* for being thorough and fixing all this properly!
>
> I am happy to apply the pinctrl portions to the pinctrl tree, I'm
> uncertain about Rob's syntax checker robot here, are there real
> problems? Sometimes it complains about things being changed
> in the DTS files at the same time.

Rob's checker reports issue that are being fixed by respective
patches. I think I've updated all dts entries for the mpp devices tree
nodes.

> I could apply all of this (including DTS changes) to an immutable
> branch and offer to Bjorn if he is fine with the patches and
> the general approach.

I'm fine with either approach.

-- 
With best wishes
Dmitry
