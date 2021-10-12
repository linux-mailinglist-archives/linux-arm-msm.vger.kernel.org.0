Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E42429EE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 09:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhJLHr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 03:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbhJLHrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 03:47:55 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F30FC061753
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 00:45:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id lk8-20020a17090b33c800b001a0a284fcc2so1276428pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wi0c4tUU6/JGllRDmGdUEE9qbUz1Hxlfkgo8Ug//VqI=;
        b=OUxL16y8OmpzrNyur4IFOl0tTdwiz9ylmxi9Jz2OpNnLfrhiIcxcYNAKAtWNt5nRLP
         c7ip3cn40UaBwURsC/aeYBU5Xg3qM7yswY4I7N1K6tce9m0PPyjVuLQrwdbTFO2iWs6S
         O5TcZDGIOg+GE93gGGafo79sbCW61kSV65N8sff/xeVhNe6kQtp3ZeQU9OCtUl6EsdGU
         4Ypz3M5x1LHJ2ICYAufaJ1YX2k9P30nz41mdEuLU9/JMmYDuUTr8Ck85Om35SwC6S9+L
         8ZDjqICUBLABNaiQ5kDBjWvI7JgX9cyAjJ+V3CpsLjM6i/guib33L8AzcMJ3KtXdcSNh
         Fefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wi0c4tUU6/JGllRDmGdUEE9qbUz1Hxlfkgo8Ug//VqI=;
        b=kSR3eM4FlafyxIKgq0qZMmmTNeQeK2DrCCAU0qZxwvTA0yMwQivH+dY8KM+pFtWd94
         Kp4CYHS5jwi2ObHtJexNa4si2ouc3wgmETGbz6QyymwYzLCi4T+GfhsudLPj4MvcNIRj
         +DPfPyqcAqlRqMdsb4YGkK/pKRm2TM0/3xtyVCM+0yen0eKasZCwssHXH7rMSInXfyPI
         Ktzz071lK6xIYi8xMJQQYtJCrzn8jb5ev1EzM3jlnQ86C5GVopkVT9xK2SkE6i3jNN9c
         X8EloDvKuDFT8s7W20rzdo5rETXKkDMqgdUuO73FeFtWqxfGl57bzAc41f1inkb76D3g
         nElA==
X-Gm-Message-State: AOAM532OBh6uKAO0+ejpDQdXPoWFry+bqCxp5+VEiulIw74D3JKv4/5s
        6K6vSKWZ1N0r+b1/iokJfi+6q3KRZb4N9XuszTRxzA==
X-Google-Smtp-Source: ABdhPJwVHKfgQcm4qq1ccDhtz6vH6TbKhIs9LDuLpCHmbkxwmiNRZagXnDeh2jLu9tT+KFW0b0YqHmzObsxOEOl2YqI=
X-Received: by 2002:a17:90b:370f:: with SMTP id mg15mr4208394pjb.209.1634024752384;
 Tue, 12 Oct 2021 00:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211011141733.3999-1-stephan@gerhold.net> <20211011141733.3999-5-stephan@gerhold.net>
 <YWRPXnzh+NLVqHvo@gerhold.net>
In-Reply-To: <YWRPXnzh+NLVqHvo@gerhold.net>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 12 Oct 2021 09:55:48 +0200
Message-ID: <CAMZdPi8G5wtcAxTYfzwdJVMauEx+5wk7eqP9VX9QaVqrzsZkEw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: wwan: Add Qualcomm BAM-DMUX WWAN
 network driver
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Network Development <netdev@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dmaengine@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On Mon, 11 Oct 2021 at 16:51, Stephan Gerhold <stephan@gerhold.net> wrote:
> > Like in the RFC version [1], the driver does not currently use the link
> > management of the WWAN subsystem. Instead, it simply exposes one network
> > interface for each of the up to 8 channels.
> >
> > This setup works out of the box with all available open-source userspace
> > WWAN implementations, especially ModemManager (no changes needed).
> > oFono works too although it requires minor changes to support WWAN control
> > ports (/dev/wwan0qmi0) which are independent of BAM-DMUX (already provided
> > by the "rpmsg_wwan_ctrl" driver).
> > It was easy to support because the setup is very similar to ones already
> > supported for USB modems. Some of them provide multiple network interfaces
> > and ModemManager can bundle them together to a single modem.
> >
> > I believe it is best to keep this setup as-is for now and not add even
> > more complexity to userspace with another setup that works only in this
> > particular configuration. I will reply to this patch separately to explain
> > that a bit more clearly. This patch is already long enough as-is. :)
> >
> > [1]: https://lore.kernel.org/netdev/20210719145317.79692-5-stephan@gerhold.net/
> >
>
> The main goal of the WWAN link management is to make the multiplexing
> setup transparent to userspace. Unfortunately it's still unclear to me
> how or even if this can be achieved for the many different different
> setups that exist for Qualcomm modems. To show that more clearly I'll
> "briefly" list the various currently supported setups in ModemManager
> (there might be even more that I am not even aware of).

The goal is also to have a common hierarchy, with the network link
being a child of the WWAN device, as for the control ports. Making it
easier for the user side to find the relation between all these
devices. Moreover, it allows having a common set of attributes, like
the LINK ID, and possibly new ones in the future. I mean it's probably
fine if you create a static set of network devices and do not support
dynamic link creation, but I think they should be created in some way
via the WWAN subsystem, and get the same attributes (link id), we can
have special meaning link ids (-1) for e.g. non context specific
netdevs (e.g. for rmnet/qmap transport iface).

Regards,
Loic
