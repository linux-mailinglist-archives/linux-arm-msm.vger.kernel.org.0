Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C0F3AEBB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 16:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFUOwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 10:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhFUOwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 10:52:07 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4D4C061760;
        Mon, 21 Jun 2021 07:49:51 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id k16so16067869ios.10;
        Mon, 21 Jun 2021 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KWerBli4ZjJRwrbEo97Cp5HhRgHSf15dtXn9Sfu0Hv4=;
        b=HFnXl+FdFZ8V0Dw4aJXqgtMls6s5Z+pcKkBs9rm32pJNa1omPENtYomfG9S9UWlkFe
         JZtGOpaHmrbi2c6IWh+uDJfqJ/v5Y3W7e+GzJNdcWswTo3fTByCUMYRZHcg0oqvv0SSV
         4LAUVcRg2mQW4TGbXfIni9wv53OJOhTkZCUvAhYwZ1Vsc6wXwOk25uQUrSJWQlcsBacS
         OotUUtFjBIym+oCfW9sqfoVuo0zuModcyUjlQ1AdQlz75HdIczXWxusR+lworS8D2B6C
         b1Slq76+ekknvhon7sDZQjCw2ctmkLgLUTgT7HC4xvuSt977HZaQW+ZRI2T9FGkWoIM3
         S/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KWerBli4ZjJRwrbEo97Cp5HhRgHSf15dtXn9Sfu0Hv4=;
        b=eK8l8MqO71i9yuGNegUCMkuxPC7jUHSQPWE0feMYgfdmfbk8OkY0ixER8jfCkQTpFv
         3qCo50oAEQzsl3B/T+4ZfMKgzF+GBJN/n/jr9TVWXCPhepTYktPNSnRqE9talxUMt1ad
         oU7uQZsi+MEDKdNa+VFeIg58NXYKf8e4tbKsnFIjWc2yJkJ1ir/A3ZFW7oDOonqaXD5u
         0aiVcqoDhundOhF5SkbpcG/hYyDSNlamfjYaVYXxqncaFwiOHR8cuWK/waH1OwSQyvIC
         oTbQOurjRv212oIsTxWX06VWmQWoD+zG56x0Phe9mvzXltVkHY15J6YbD9cfLOARneNl
         HxiQ==
X-Gm-Message-State: AOAM5329aJ4o/vaUIOsbonMsWTZ/Y8BtB5gPQWkXrVR+4ciMJnm79Fc8
        lV96sG5LNft411cUNHTZF9iTHrFlhDBofzzv1mA=
X-Google-Smtp-Source: ABdhPJzjkcw1agZaLbr1f1Dclm4JHyoVvH794DFFZD1kGSKXtTFEHrJNTk6oW26RPU53Rt41dBE1FKZF+nRXJ+GHITc=
X-Received: by 2002:a05:6638:33a2:: with SMTP id h34mr17713039jav.60.1624286990945;
 Mon, 21 Jun 2021 07:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210503081334.17143-1-shawn.guo@linaro.org> <20210503081334.17143-3-shawn.guo@linaro.org>
 <20210523060009.GA29015@dragon> <CABb+yY3CA+gvRJi7nyA4wxwP3-XtbfDhq51eP8Q+vL7TbMncUQ@mail.gmail.com>
 <20210621063309.GA8666@dragon>
In-Reply-To: <20210621063309.GA8666@dragon>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 21 Jun 2021 09:49:40 -0500
Message-ID: <CABb+yY3T=LkcjarGbZ4KEY_JS5R9iV-X_21gX_VheqsWBUHGDg@mail.gmail.com>
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

On Mon, Jun 21, 2021 at 1:33 AM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> On Sun, Jun 20, 2021 at 11:27:49PM -0500, Jassi Brar wrote:
> > On Sun, May 23, 2021 at 1:00 AM Shawn Guo <shawn.guo@linaro.org> wrote:
> > >
> > > On Mon, May 03, 2021 at 04:13:34PM +0800, Shawn Guo wrote:
> > > > MSM8939 has 3 APCS instances for Cluster0 (little cores), Cluster1 (big
> > > > cores) and CCI (Cache Coherent Interconnect).  Although only APCS of
> > > > Cluster0 and Cluster1 have IPC bits, each of 3 APCS has A53PLL clock
> > > > control bits.  That said, we need to register 3 'qcom-apcs-msm8916-clk'
> > > > devices to instantiate all 3 clocks.  Let's use PLATFORM_DEVID_AUTO
> > > > rather than PLATFORM_DEVID_NONE for platform_device_register_data()
> > > > call.  Otherwise, the second A53PLL clock registration will fail due
> > > > to duplicate device name.
> > > >
> > > > [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> > > > ...
> > > > [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> > > >
> > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > Hi Jassi,
> > >
> > > Any comment on this patch?
> > >
> > 1)  I was not on the CC list, so I don't have this patch in my mbox.
>
> That's strange.  The patch series was sent with your address
> <jassisinghbrar@gmail.com> on "To:" field.  And that can be seen on
> patch archive [1].
>
Sorry, yes you are right. But I still can't find it in my inbox (and
neither in spam).... perhaps I nuked it by mistake. anyways...

> > 2)  Shouldn't this patch be broken into a fix and an enablement patch?
>
> MSM8939 is the only platform that I know has multiple clusters and uses
> APCS driver.  So the change becomes a fix only when MSM8939 is enabled.
> But if you prefer to separate the change, I will do so.
>
Yes, please.

thanks.
