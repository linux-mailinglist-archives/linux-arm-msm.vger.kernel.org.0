Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430423AC5E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 10:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbhFRIXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 04:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbhFRIXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 04:23:42 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEB7C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 01:21:31 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id d19so9695226oic.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Aeo2Ll9Dh+vhj7IwqV3SFri2k03IhO5HyXeMDR5L224=;
        b=Cioz9S5vInxiqGTxkEkxgvXLvpJ3UCmEuqyKPxf8214RFrevgzdy/RiM8hTaf5TSiW
         RHqlrU1YsVyvCyBoIjPA1+drIaPqLEI4dLOqiwvyvlsXdguIzIQQKf2xA6sJu0jqT0RB
         898N3SGQtWtNfSmIaWvxNChaeGCBeHNCrTihl1fBBU9G02I2UyX1gYRRm+BOacb578Qm
         A0UeWbAVBMwaECf6s+wW5RqXqvQbLjuVn8cU/Rp9W6y3Jd3V25tuU3CN0AS8krEa56fn
         Fjq7s6TXCR/oFVCTh+ZUeVDo7s4O768HGJ57KbGAoUZ25YX6JKlLf5wdshnjDpW2wSVY
         WRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aeo2Ll9Dh+vhj7IwqV3SFri2k03IhO5HyXeMDR5L224=;
        b=XEAJpLKCnraGDt+ao2wO6VJ7Zd/6a+OgW//tgzGcalpHSRbuTZSdNSokovxdNabJKc
         iabLNRblpBbynxU7zp8cK1bijmw+GNItwHTgsLdY1tF06vGCdTC7dLJn6FGHWzsTMSiX
         DXH2yUkzDfFzZoOxtj17X4E7H5kJHPNFjoLnAimxUcacrl3acvh+V+LMuu9AgZDvPXdk
         8KrrYIXX4NhLX7VBkqgzF+kSEvwdQ0FlOINTGWZkykkZYLhNJpLi/fI+nqjBbqmJl0tZ
         F7VlGRNSnbIbbq17ezCjuSen97gSsW9WTrAgJxeAMxLPMfeboWeSq2ZbBAaqCW6q4xDN
         hheg==
X-Gm-Message-State: AOAM531kjw3H+24+CXoZjJiYV253AYPfu2cDY6oNDvYtfcARLZjXb9vH
        Mic8DCfJt+CRAlI/WIlRe3+dKmjtFjXVEVRbga3vUw==
X-Google-Smtp-Source: ABdhPJyDZlMUREB65qkU6XQ7bycrAzlPqlpeC2tU0I1MqjBXUhZUqKARGbo5s5dURngukXGGW4gwXFSct7ToGKP+h14=
X-Received: by 2002:a05:6808:13d5:: with SMTP id d21mr14018585oiw.114.1624004489130;
 Fri, 18 Jun 2021 01:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210618075243.42046-1-stephan@gerhold.net> <20210618075243.42046-3-stephan@gerhold.net>
In-Reply-To: <20210618075243.42046-3-stephan@gerhold.net>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Fri, 18 Jun 2021 10:21:18 +0200
Message-ID: <CAAP7ucKHXv_Wu7dpSmPpy1utMZV5iXGOjGg87AbcR4j+Xcz=WA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: wwan: Add RPMSG WWAN CTRL driver
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Leon Romanovsky <leon@kernel.org>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        linuxwwan@intel.com, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Network Development <netdev@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Stephan,

> +static const struct rpmsg_device_id rpmsg_wwan_ctrl_id_table[] = {
> +       /* RPMSG channels for Qualcomm SoCs with integrated modem */
> +       { .name = "DATA5_CNTL", .driver_data = WWAN_PORT_QMI },
> +       { .name = "DATA4", .driver_data = WWAN_PORT_AT },
> +       {},
> +};

If I understand this properly, now these rpmsg backed control ports
would be automatically exposed without the need of a userspace CLI
tool to do that (rpmsgexport).

And if I recall correctly, DATA5_CNTL and DATA4 were the only channels
actively exported with udev actions using rpmsgexport in postmarketos,
but that didn't mean someone could add additional rules to export
other channels (i.e. as per the ModemManager port type hint rules,
DATA[0-9]*_CNTL as QMI and DATA[0-9]* as AT, except for DATA40_CNTL
and DATA_40 which are the USB tethering related ones).

So, does this mean we're limiting the amount of channels exported to
only one QMI control port and one AT control port? Not saying that's
wrong, but maybe it makes sense to add a comment somewhere specifying
that explicitly.

Also, would it make sense to have some way to trigger the export of
additional channels somehow via userspace? e.g. something like
rpmsgexport but using the wwan subsystem. I'm not sure if that's a
true need anywhere or just over-engineering the solution, truth be
told.

-- 
Aleksander
https://aleksander.es
