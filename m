Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4C621E2E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 00:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgGMWSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 18:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgGMWRe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 18:17:34 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59DFC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:33 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id h18so4744306uao.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyzzzEfQ3Uc/t+bUav/3x8lC62pgjGuDPMIXbn4bZbw=;
        b=InUYU/sUXni6t/s3Y0tEzsg6QRkbF8CdHi29QeizGklCp2wPj8fVd34LQ23a0P4iuU
         nDGgnyMb2+gOlkblxRAG3WGfZEczi+XzLqzr3/WSm+8/OTockDZ0K70oggBRR7nwiPQZ
         WlrLXTDfpeFBc2CMm04EkptdN+M89zgyRIiPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyzzzEfQ3Uc/t+bUav/3x8lC62pgjGuDPMIXbn4bZbw=;
        b=U6IxYQ09NHL/27DQxexXrN2jCJPmSfuDfWByTgCGZ60LnWHp7YR8ZHCkPz+9TYPe+0
         Xp13n77aUVq5JvsNCpcPZcp7QLnigBdRAYZUxDc72+0ftAz/rlvBR8YI6VW84A3RyFps
         GDotQLKi240bfd6TxmPwykoCY60sy8Bzi2PuMQ2nLg6e3xAQab5q0YLQU2PC5gfEiURz
         MknRvyOr405FHV7n6OFSzjF1jemUzjO4aMN7cJm/4+sLfpL79skABownxSja9HYZQW9+
         MgUSjfJOzHKwE+1OOr00lbed/DZzoQEQIl6du1iOO6ebqJq/f7rMbVXJzG304akhqmra
         tTeA==
X-Gm-Message-State: AOAM531+g65NZJKo1Nd00qgg+rmcl0CPjWBnaD7sgWFH0TouDFZY/Q0r
        6aIqW1VpKIH0szDKmhUBNh8Soq/VDaI=
X-Google-Smtp-Source: ABdhPJwwPIvhpflrKB4RrY/TdTBFsILY2pPaKhNFMrpuSLIg1yq99fa2gVeE8JKtatE4FCVBIxgbZg==
X-Received: by 2002:ab0:189:: with SMTP id 9mr1368844ual.75.1594678652887;
        Mon, 13 Jul 2020 15:17:32 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id t192sm827993vke.7.2020.07.13.15.17.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 15:17:31 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id d11so4984440vsq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 15:17:31 -0700 (PDT)
X-Received: by 2002:a67:ec0f:: with SMTP id d15mr1113618vso.121.1594678651291;
 Mon, 13 Jul 2020 15:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org> <1592818308-23001-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592818308-23001-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Jul 2020 15:17:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfi+5ms_pRyGjOG2EhkkGf9jCzXvEt=cHkBQMn1wkU7g@mail.gmail.com>
Message-ID: <CAD=FV=Xfi+5ms_pRyGjOG2EhkkGf9jCzXvEt=cHkBQMn1wkU7g@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Use return value from irq_set_wake call
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 22, 2020 at 2:32 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> msmgpio irqchip is not using return value of irq_set_wake call.
> Start using it.
>
> Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Seems right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
