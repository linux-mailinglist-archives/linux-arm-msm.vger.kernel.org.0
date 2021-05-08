Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A42377085
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 09:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhEHH55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 03:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbhEHH55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 03:57:57 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A40BC061574
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 May 2021 00:56:55 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id v24so10946435oiv.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 May 2021 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=JrQQPnsSDvIt+Vs+sC/UQRgUAX7dRIg7UlNi3hAtXkE=;
        b=NcSUpamwkblVtQWP+uVaCVkgeaL5EmFvgVrX9hva5KZt7Zpv7uXli8NxLz54Tw3ik1
         TlcVnxqa7iK4Rcyoy4FGiRkIZ6ik8/QU3+PpkRMb/Q22mXXwRlS/xPPaAwMxFFxrbCdI
         k882WIM8/QvoTqgT15FA6sYpk9zPNNt28w4bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=JrQQPnsSDvIt+Vs+sC/UQRgUAX7dRIg7UlNi3hAtXkE=;
        b=Qs2OfRpkugs+adtV8UmvhuFDzmUXWbQhnsRHQ0tGgmjtk/9HEOMUjfmY05ese7hGAy
         cN7Wumvw4dSozvmUhPkbaJdGi7FO7cH12aBkiF4ETBz5TXnlHkPZsim+7H0M4g655xz+
         5hCC71+NF1f+v0m0r+lYCtdORQ1ORiSzk3fS0wItc5gO+tb8c510iioxXRsmz0ku21gs
         A1rFtO3JhJ2kjxCQApYmdVHwi/oXSVleGjbLgRLiZWe/936ubjP5eiwzL0iuZ7izNv/f
         9mVYh8MpMd9B7c+rVyN0W+R6txN14LCR1kK7AeohGm7EdGfym7ug0BM/WIhVM//6g0UD
         4few==
X-Gm-Message-State: AOAM530LlB9lZd42ow8uzqEnlbNgZOMsLoJ+OOweHLwZDAVkdNfSBWJc
        lWa/rAzdDnCWD9B2CFYJHZKNVu4JJGQT3TV6LUgjuA==
X-Google-Smtp-Source: ABdhPJzCngHZLZwvIFlG4AXfe17Dm6sGZGCEACxJNB2T+RputFCCLcQ2dgn1fZdP4KPk1rqSENbK3+ZrtMd309glq8E=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr18570086oie.166.1620460614405;
 Sat, 08 May 2021 00:56:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 8 May 2021 03:56:53 -0400
MIME-Version: 1.0
In-Reply-To: <CAE-0n51YQf=NZxnw9+FLU=PSG8di7Ztp5pP03JdLXgEWGM0AZg@mail.gmail.com>
References: <d23263dcb0f1535275ff37524b0203b2@codeaurora.org> <CAE-0n51YQf=NZxnw9+FLU=PSG8di7Ztp5pP03JdLXgEWGM0AZg@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 8 May 2021 03:56:53 -0400
Message-ID: <CAE-0n51MEJ_+7QKpBKenjjB+rwdGN-=vxx=4oo8_-P=_yJe+jQ@mail.gmail.com>
Subject: Re: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     rojay@codeaurora.org
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-05-07 13:09:21)
> Quoting rojay@codeaurora.org (2021-05-07 03:07:42)
> > On 2021-05-05 07:08, Stephen Boyd wrote:
> > > Quoting Roja Rani Yarubandi (2021-04-20 04:13:55)
> >
> > > In fact, where is that code? I'd expect to see i2c_del_adapter() in
> > > here
> > > so we know the adapter can't accept transfers anymore. Maybe
> > > i2c_del_adapter() could be called, and then there's nothing to do after
> > > that? This whole patch is trying to rip the adapter out from under the
> > > i2c core framework, when we should take the opposite approach and
> > > remove
> > > it from the core framework so that it can't transfer anything anymore
> > > and thus the IOMMU can remove the mapping.
> > >
> >
> > IIUC about probe/remove/shutdown calls, during "remove" we will unplug
> > the
> > device with opposite calls to "probe's" plug operations.
> > For example i2c_add_adapter() from 'probe' and i2c_del_adapter() from
> > 'remove'.
> > For "shutdown", as system is going to shutdown, there is no need of
> > unplug
> > operations to be done.
> >
> > And also, I had a glance on other upstream i2c drivers, and noticed
> > "i2c-i801.c"
> > driver has i2c_del_adapter() called from remove callback but not from
> > shutdown
> > callback.
>
> Sure, other drivers could also be broken.

What does it have in the shutdown callback? I see that it is wrong to
delete the adapter in shutdown because this problem happens. First
shutdown is called for various i2c clients, then shutdown is called for
the adapter. If the adapter shutdown calls i2c_del_adapter(), then
remove is called for the various i2c clients. The i2c clients aren't
expecting this and start doing double frees and stuff. It's really quite
a mess. I suspect i2c shutdown should probably block remove from being
called on it entirely. Either way, it's the wrong approach.

Instead, I think we should merely suspend the i2c bus like this. Then we
can hunt down the various drivers that try to access the bus after the
i2c bus has been removed. I've already done that for rt5682 (see the
patch link later).

----8<---
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c
b/drivers/i2c/busses/i2c-qcom-geni.c
index 20216e382b4c..af3ed808ba2e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -655,6 +655,14 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }

+static void geni_i2c_shutdown(struct platform_device *pdev)
+{
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+
+	/* Make client i2c transfers start failing */
+	i2c_mark_adapter_suspended(&gi2c->adap);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -719,6 +727,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
+	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,

>
> >
> > And actually I tried calling i2c_del_adapter() from geni_i2c_shutdown(),
> > and it resulted in below WARNING trace
> > [   90.320282] Call trace:
> > [   90.322807]  _regulator_put+0xc4/0xcc
> > [   90.326583]  regulator_bulk_free+0x48/0x6c
> > [   90.330808]  devm_regulator_bulk_release+0x20/0x2c
> > [   90.335744]  release_nodes+0x1d0/0x244
> > [   90.339609]  devres_release_all+0x3c/0x54
> > [   90.343735]  device_release_driver_internal+0x108/0x194
> > [   90.349109]  device_release_driver+0x24/0x30
> > [   90.353510]  bus_remove_device+0xd0/0xf4
> > [   90.357548]  device_del+0x1a8/0x2f8
> > [   90.361143]  device_unregister+0x1c/0x34
> > [   90.365181]  __unregister_client+0x78/0x88
> > [   90.369397]  device_for_each_child+0x64/0xb4
> > [   90.373797]  i2c_del_adapter+0xf0/0x1d4
> > [   90.377745]  geni_i2c_shutdown+0x9c/0xc0
> > [   90.381783]  platform_drv_shutdown+0x28/0x34
> > [   90.386182]  device_shutdown+0x148/0x1f0
> >
> > Can you please suggest me what might be missing here?
> >
>
> It looks like some device that is on the i2c bus is putting a regulator
> in the remove path without disabling it. Can you print out which device
> driver it is and fix that driver to call regulator_disable() on the
> driver remove path? I'll try locally and see if I can find the driver
> too.

I see that it's the rt5682 driver. I sent
https://lore.kernel.org/r/20210508075151.1626903-2-swboyd@chromium.org
for this in case you want to look, but it won't be necessary.
