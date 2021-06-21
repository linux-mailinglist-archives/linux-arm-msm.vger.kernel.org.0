Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539B73AE264
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 06:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhFUEaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 00:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhFUEaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 00:30:15 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45D0C061574;
        Sun, 20 Jun 2021 21:28:00 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id k5so14199955iow.12;
        Sun, 20 Jun 2021 21:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0MgP2FoJxdPuUlg9LcJ6VubUkC3qqIfYKwFy41iCxes=;
        b=vVSLiEfzVcC5BijDyzVg9pXbRQ9q1pDF/1quWG7roTgSlWci+6Iz5VqSKbMGpYzFyf
         v40VueLxmmiIpoQmepUSLu0wcJHoMo/9klRYBInGxC8osy5i9MYjbdsN4hggkIMSaMHk
         vDy6g+JxAAi/LGB2HOaY+Rp/ZfSAjHP/slMTSn10QTI1q7iaK4/2EOEUkA3vPS0iMew/
         qMvLhTjU1XqP43k4qEmAqP/mJERYXs4BlGmEORRotfHWuWhWACSYCWzcZVpfosIDJ86o
         sNcGzNRScqIRXqtoxvJggAv936E9m6easBObyDkP4tkVnaGKY+UI9fHlDgh6ZRWaIB4u
         MZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0MgP2FoJxdPuUlg9LcJ6VubUkC3qqIfYKwFy41iCxes=;
        b=lxKdTNKkXuv1gNf77+6G5/SASDcfhUwucBgKhbxICuSv0U1f3pnoqE5Vu6J82HzGYC
         LUwwp4LEV60wsI9bXLdJVkM7r6Ux1yJBvLXzR+Po0zzr/dKP9lZio9cQPLAPBlpL8QTU
         zotFCBIXTwA9y/M/FgaASKygHIMb6UQBKNnGzysUnMXEOI4HttxwPYNIpf8PDzHkRy0v
         s0PZSA62hs9APqcDFkZsvha8SB4hWYmSejl7oegLk5DykQMJAIWL0HZaQ+ZL7iaSL21s
         wWt7u/zYlVou/OC61/oUGdrwsR/aC098TH+zPKa9xJfZa8BqVdHnQu2KnJVJa5gZ4KvM
         48yg==
X-Gm-Message-State: AOAM531xLpMQcLW3mAXaXVgxLsQ9imeajsBwoDWyu/YkibGiAr5AxOZw
        OYiLWwpDZgBcYT4SYBUDA3W2uKu+U2OJc1xt4bODfQiPjZY=
X-Google-Smtp-Source: ABdhPJxSURS5VrXfLnuPvV/0q93AXPToJ3aWlkTGxRe76/HsqbOO2dOv+8Tc6LmcDMfHDfWS55WpVPmiXJrzKW36u9k=
X-Received: by 2002:a05:6638:2143:: with SMTP id z3mr16002819jaj.103.1624249680014;
 Sun, 20 Jun 2021 21:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210503081334.17143-1-shawn.guo@linaro.org> <20210503081334.17143-3-shawn.guo@linaro.org>
 <20210523060009.GA29015@dragon>
In-Reply-To: <20210523060009.GA29015@dragon>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Sun, 20 Jun 2021 23:27:49 -0500
Message-ID: <CABb+yY3CA+gvRJi7nyA4wxwP3-XtbfDhq51eP8Q+vL7TbMncUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mailbox: qcom: Add MSM8939 APCS support
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 23, 2021 at 1:00 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Mon, May 03, 2021 at 04:13:34PM +0800, Shawn Guo wrote:
> > MSM8939 has 3 APCS instances for Cluster0 (little cores), Cluster1 (big
> > cores) and CCI (Cache Coherent Interconnect).  Although only APCS of
> > Cluster0 and Cluster1 have IPC bits, each of 3 APCS has A53PLL clock
> > control bits.  That said, we need to register 3 'qcom-apcs-msm8916-clk'
> > devices to instantiate all 3 clocks.  Let's use PLATFORM_DEVID_AUTO
> > rather than PLATFORM_DEVID_NONE for platform_device_register_data()
> > call.  Otherwise, the second A53PLL clock registration will fail due
> > to duplicate device name.
> >
> > [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> > ...
> > [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Hi Jassi,
>
> Any comment on this patch?
>
1)  I was not on the CC list, so I don't have this patch in my mbox.
2)  Shouldn't this patch be broken into a fix and an enablement patch?

cheers.
