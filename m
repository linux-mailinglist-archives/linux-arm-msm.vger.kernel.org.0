Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2573AE346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 08:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhFUGfc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 02:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFUGfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 02:35:31 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB9DC06175F
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jun 2021 23:33:16 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id b1so1201657pls.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jun 2021 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sH9B4JXMU6pBU116AVjmwqKeXZxuzhWGilSwUDAabeY=;
        b=McbJ9v5VHijOHyZNrGX9U9ZDYKfepy+yP/134VXnlBAfzKONENUkqQV6BKIfNEp/Dy
         IZNbWEenEtH7z6uzyYeXyQWL2nbHRUK7pl+VeFRG3ur/BR+f+UFjI2mJ9fcZoIrFhfXJ
         p9yaRNpkD2wfcpPS6McWbk6Uqy+o/jisVZtjjQTDsGAa+BwLeZgvO9NX7QiAr//rfMEg
         g0TGgo/DF3/BYdo6J/aKhYZ/c2ezUQkrEX8GaSAvk4U4HK9zZ4rBSN8/E1o98PNnbCAE
         N6TZQYsDzdC456yV3A+idq/kPiwYIsnjbfS6vGW9ciVCKVCnKicJoXzC7vDHjpUFNQWG
         4tgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sH9B4JXMU6pBU116AVjmwqKeXZxuzhWGilSwUDAabeY=;
        b=rkkqddTWJK0OLJQ5ZZl1JD/0/g9F9bH4hCZLCs8tyJ9ILV3peIMops3dqbHT6qK4y/
         PRqyL+LQ77rRjLQhsMku2AbX6FU7dNCcbDfqvpTqDsgtn6BayET9DXd0ow+byzgQHA9a
         0hjJMxwSvgIbufhmAnXpLPXTmzMSFGkncLmAwkrFK4iE0x1f1wCRJBav3sUcs/mCZxYW
         fENCisjhA5sDCEqTgR1z1p4EvyaM4PRyk3kgznShP8jPaIaXIhtBgX0u0W9sjrKi6auF
         TvV3tLlRPKVsJA1f0MhOAjXzE8WxUzcuQJDXSb8/qspVHuazRf2imcKuaw2klogSNDfa
         BTkw==
X-Gm-Message-State: AOAM530KII4d1YD0l5xGca9SettkEtlhrrlo1o/o+r5n2Z6whmhmYdc0
        zW4694zntSNLQkNQ5s3BrMUt7Q==
X-Google-Smtp-Source: ABdhPJzYmB83PD1BwJ3go3vvcDYMQKpkjkZ8RYpwE98U43biZcu6J8ihom6u1l0UtZiuXgA/WoQfbw==
X-Received: by 2002:a17:90a:70c7:: with SMTP id a7mr30651222pjm.31.1624257196245;
        Sun, 20 Jun 2021 23:33:16 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d189sm7273860pfa.28.2021.06.20.23.33.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Jun 2021 23:33:15 -0700 (PDT)
Date:   Mon, 21 Jun 2021 14:33:10 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mailbox: qcom: Add MSM8939 APCS support
Message-ID: <20210621063309.GA8666@dragon>
References: <20210503081334.17143-1-shawn.guo@linaro.org>
 <20210503081334.17143-3-shawn.guo@linaro.org>
 <20210523060009.GA29015@dragon>
 <CABb+yY3CA+gvRJi7nyA4wxwP3-XtbfDhq51eP8Q+vL7TbMncUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY3CA+gvRJi7nyA4wxwP3-XtbfDhq51eP8Q+vL7TbMncUQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 20, 2021 at 11:27:49PM -0500, Jassi Brar wrote:
> On Sun, May 23, 2021 at 1:00 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> >
> > On Mon, May 03, 2021 at 04:13:34PM +0800, Shawn Guo wrote:
> > > MSM8939 has 3 APCS instances for Cluster0 (little cores), Cluster1 (big
> > > cores) and CCI (Cache Coherent Interconnect).  Although only APCS of
> > > Cluster0 and Cluster1 have IPC bits, each of 3 APCS has A53PLL clock
> > > control bits.  That said, we need to register 3 'qcom-apcs-msm8916-clk'
> > > devices to instantiate all 3 clocks.  Let's use PLATFORM_DEVID_AUTO
> > > rather than PLATFORM_DEVID_NONE for platform_device_register_data()
> > > call.  Otherwise, the second A53PLL clock registration will fail due
> > > to duplicate device name.
> > >
> > > [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> > > ...
> > > [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> > >
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > Hi Jassi,
> >
> > Any comment on this patch?
> >
> 1)  I was not on the CC list, so I don't have this patch in my mbox.

That's strange.  The patch series was sent with your address
<jassisinghbrar@gmail.com> on "To:" field.  And that can be seen on
patch archive [1].

> 2)  Shouldn't this patch be broken into a fix and an enablement patch?

MSM8939 is the only platform that I know has multiple clusters and uses
APCS driver.  So the change becomes a fix only when MSM8939 is enabled.
But if you prefer to separate the change, I will do so.

Shawn 

[1] https://lore.kernel.org/patchwork/patch/1420808/
