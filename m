Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8343A2D72DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 10:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405651AbgLKJez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 04:34:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393633AbgLKJe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 04:34:29 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A77DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 01:33:43 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id a16so11411138ejj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s3rr1yeDbuDZjvp0l6lLC3rgx12DIQsMtcefFu3nv7I=;
        b=GTnnNE16sKjivuxq//ccroEVqjcEhNhqLLASsZtG3qcuN9VtX4xxB+BtBbSr3Hpxxr
         hwY5FroR6JpeljSxdgOOXmNVXL/jYlZaIsTyKUNNzEAmAWLZfQooVZQrJ7PMzM+oWG7S
         KOZl3Qz7/5PGbaN4+221ScIH+oev3maMespADiF8wy56Vpe0K8Q/LmRNuEUc10HcVIpt
         k2zZmP8iwJOdxnu9siDSF90VMMg5HheNYLh9RsF1NRIgWbpqJZJpwNk8xxTK65dyyH5d
         re+jtV2tvNNv8bsHPuG6OqGL+4Q7PBrsddcaGPg49I8N1/14GHrAcuVeE58j7eu/PCqi
         EvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s3rr1yeDbuDZjvp0l6lLC3rgx12DIQsMtcefFu3nv7I=;
        b=payk+nrnXZNc6jDZwKeulwq93u3TpNx8f13KANTCoRODe4QqZQ5kNoNo8f25sGJu04
         ZEFwv47ASndBJJWMlGNKqq0DOCk3Db9VpTzicOVgTPEHiS8Q6vJ9e9VvyN2AyP/vSOIJ
         R8N32+IudGG2PXiIvVrz+Ti/prO1HSBOZQMKFqNzZKCZG6Bg8dNBEJjV7ZBPD4Ei71EA
         Pvg4+/TgoJBh5cESWREeMldbfRfvF0KNwJH5BIxn9gQhlI77jsBY3Q5Kvycf6GaNVl5v
         novoSSETkPt10maW2jt6Sh9K9qv27kOpX9kCCj/CCr2fZRAcQibPoarL2ab0dVAZE7jy
         HzOw==
X-Gm-Message-State: AOAM530VuA9aXYjVtPQwHCUXYdGW7LrB0Th4gXnvuQ+BlWhJaXy3gRLc
        5ACzF1ytx7B6z3jo40mkJyP1jaO8ik7/tlkneGB8dw==
X-Google-Smtp-Source: ABdhPJz1HchAi6Cg2DoTAPpMv4Bs5UimtvRmB6tGwGVzgCfkQIQlgvy92Jn5eQht+lD18znIxNSN8TizCI9THagc+Ps=
X-Received: by 2002:a17:906:8151:: with SMTP id z17mr10261170ejw.48.1607679221641;
 Fri, 11 Dec 2020 01:33:41 -0800 (PST)
MIME-Version: 1.0
References: <1607598951-2340-1-git-send-email-loic.poulain@linaro.org>
 <1607598951-2340-2-git-send-email-loic.poulain@linaro.org> <20201211053800.GC4222@work>
In-Reply-To: <20201211053800.GC4222@work>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 11 Dec 2020 10:40:13 +0100
Message-ID: <CAMZdPi_9=CPXTNCDV=eLEg-2A0o-S1LkHr=hmED=z=CNe8u2iw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] net: mhi: Get RX queue size from MHI core
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On Fri, 11 Dec 2020 at 06:38, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Thu, Dec 10, 2020 at 12:15:50PM +0100, Loic Poulain wrote:
> > The RX queue size can be determined at runtime by retrieving the
> > number of available transfer descriptors.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: Fixed commit message typo
> >
> >  drivers/net/mhi_net.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
[...]
> > -
> >       INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work);
> >       u64_stats_init(&mhi_netdev->stats.rx_syncp);
> >       u64_stats_init(&mhi_netdev->stats.tx_syncp);
> > @@ -268,6 +265,9 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
> >       if (err)
> >               goto out_err;
> >
> > +     /* Number of transfer descriptors determines size of the queue */
> > +     mhi_netdev->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> > +
>
> This value is not static right? You might need to fetch the count in
> mhi_net_rx_refill_work().

It is, actually here driver is just looking for the total queue size,
which is the number of descriptors at init time. This total queue size
is used later to determine the level of MHI queue occupancy rate.

Regards,
Loic
