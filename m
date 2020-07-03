Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB5121396F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 13:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgGCLiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 07:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgGCLiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 07:38:00 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6D2C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2020 04:38:00 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id d4so26503558otk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2020 04:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dyp1m58oAyQtsHXm22tL6xxuBEsc0oVbE4YcBDP5SuA=;
        b=gwcpJzWtocnEZpNrUX3T+fJGP8MREn3ffK4uAC5bYVo/jo2LcOKAEIK0I56mXw8Yf+
         PTWj6fZ2LirhELghw8oVXWL24pbM7Ghp/9E4BY1cpElUCsZf3tCd+CEBZho0wKzMjpWM
         6Fq1fH+kMkTB1zHXgu3MlJ+iHmVMN+UxjjRJz4Ugccu5hkhDK+EF3rfHExECUg7hRYBn
         HLtpMtFVIACf/JkE2ur7k0QK7NJ3+AL5jFSjXMKHgQZlgvEYjq+aPznKfFHnvkY1shaL
         jaUUgtdQgbFhI8J6NuwfDwXiyH2i1Hxkm6oB34xlbZYhR15Udv/Nk9yIrWCWxoTO8cL+
         xzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dyp1m58oAyQtsHXm22tL6xxuBEsc0oVbE4YcBDP5SuA=;
        b=UevQxdrhtwZZOArkFbvt7W6jjsZFWNidpgwgzP2A7oWzFYOb7mj+TaXpajmKode98g
         bEnOewpRkqBMIqlEu3rd9kAdzzrvE/X9LCBt94HtPuz9NjvRpP2f9phyVvO5QKiZd3sY
         O9UDIcWS6e1pWyY045dls0XCy/A6NkPhKZ5UOfLvF9zLrwx+VkLJr+oICFfLcWeePyi8
         fy/IBkzMvnlgJ+ZQ+OMSshZU42barbbYgMYsV5S7lUx1muZY1Zhrft6fTR572m7GEv05
         MpgkVKAaOmwLZbBQAjeezRsyLzqg412+YgKNlbRlPAckBkwy9iyaWB0OEv1P4GEE6He2
         5rgw==
X-Gm-Message-State: AOAM530QgD5vHkc3EEos9ToRbMeWmPfInXBEqk6KdZJIGgz5pAqclh0R
        IJeis0r15L2UO+zelvMJpRmN2Ck+RcI8bL6jEfQp6w==
X-Google-Smtp-Source: ABdhPJy8b53E4/ch5xCgMcf3cIE+8dqAJ1flSUnTR++fzzjUTdp0KDGByy6n2PThI12LZgWutzc4FGsaIDtXmwNDXqo=
X-Received: by 2002:a05:6830:18f6:: with SMTP id d22mr13766166otf.243.1593776279661;
 Fri, 03 Jul 2020 04:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200702103001.233961-1-robert.marko@sartura.hr>
 <20200702103001.233961-3-robert.marko@sartura.hr> <e4921b83-0c80-65ad-6ddd-be2a12347d9c@gmail.com>
In-Reply-To: <e4921b83-0c80-65ad-6ddd-be2a12347d9c@gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Fri, 3 Jul 2020 13:37:48 +0200
Message-ID: <CA+HBbNHbyS3viFc90KDWW=dwkA9yRSuQ15fg9EzApmrP8JSR3Q@mail.gmail.com>
Subject: Re: [net-next,PATCH 2/4] net: mdio-ipq4019: add clock support
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        David Miller <davem@davemloft.net>, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 2, 2020 at 9:59 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 7/2/2020 3:29 AM, Robert Marko wrote:
> > Some newer SoC-s have a separate MDIO clock that needs to be enabled.
> > So lets add support for handling the clocks to the driver.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/net/phy/mdio-ipq4019.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/phy/mdio-ipq4019.c b/drivers/net/phy/mdio-ipq4019.c
> > index 0e78830c070b..7660bf006da0 100644
> > --- a/drivers/net/phy/mdio-ipq4019.c
> > +++ b/drivers/net/phy/mdio-ipq4019.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/iopoll.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_mdio.h>
> > +#include <linux/clk.h>
> >  #include <linux/phy.h>
> >  #include <linux/platform_device.h>
> >
> > @@ -24,8 +25,12 @@
> >  #define IPQ4019_MDIO_TIMEOUT 10000
> >  #define IPQ4019_MDIO_SLEEP           10
> >
> > +#define QCA_MDIO_CLK_DEFAULT_RATE    100000000
>
> 100MHz? Is not that going to be a tad too much for most MDIO devices out
> there?
This is not the actual MDIO bus clock, that is the clock frequency
that SoC clock generator produces.
MDIO controller has an internal divider set up for that 100MHz, I
don't know the actual MDIO bus clock
frequency as it's not listed anywhere.
> --
> Florian
