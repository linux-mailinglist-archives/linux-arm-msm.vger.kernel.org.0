Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9646AF5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 01:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378672AbhLGAwi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 19:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376718AbhLGAwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 19:52:30 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC16C0613F8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 16:49:01 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id p65so15120682iof.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5uWLI8bJ5HTl6zBBdsvG92GPTx+ZmgCmNSx4iOvqFew=;
        b=dXfRmJMH+4+bCy5Mx9uV6AJIVbMUwfOvZL7ZXwadXFdnrPi26fejWZ4o7k+ABtN3fI
         dmv0DmRM8O5DuD5ODAcouIfWedf97JZPFRLny3+J2UVZabH0Ky2vkNvQTH37F7EyFAQd
         j8eozAAxll4E8A5K2/ew2s+rqx0T6sov9nXE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uWLI8bJ5HTl6zBBdsvG92GPTx+ZmgCmNSx4iOvqFew=;
        b=QM5KAQNXVG1URcxcb3swnWS4fNi3qUzAph9CMKn9xKp1Fo63e0OaztcK04KYo7xDYK
         ylxBzVIPBfkVAri5MTKriKbfrrENdzQINn8ZZLNvq7qX5X+3GBMQ8H+J0ANhuwCj4g2o
         RGgkCXtlZXBWeDydS2pZCATF28YTo6BjsYDYHC57IhH31Zm0wSKR06z8zw+buh5cLEEb
         Jtq6cT+qeDJulKTGgFwKhLlURt3gOrtOYdn1PqH/pKzFNWNO+z6qoJjEY5FxIJNIk/6U
         biDTVXCLrz8b0jIoA5+4Y7e49bIg1oJaTQ8W+3RrJ7gYBivwBpuZZXlkgRj1kbHnb3SI
         jTcw==
X-Gm-Message-State: AOAM533zFYEobeHi4ARRQZX/8njVsLwNddxjvSlu38bEX2/1jlbz1Boy
        4tH2iLyQKe7H2uFRRoTGwQIxJzFhNRbIxw==
X-Google-Smtp-Source: ABdhPJyaUgB2ozYFxtrH+4B4SHOQrr6lUWF8uIMdrNNdIMCX34tl+XiZ3UtV5lm4TjVJz9+AnDazSw==
X-Received: by 2002:a05:6602:29d0:: with SMTP id z16mr4908407ioq.122.1638838140602;
        Mon, 06 Dec 2021 16:49:00 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id b6sm8942658ilv.56.2021.12.06.16.48.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 16:48:59 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id e128so15104883iof.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 16:48:59 -0800 (PST)
X-Received: by 2002:a6b:440f:: with SMTP id r15mr36405440ioa.128.1638838139302;
 Mon, 06 Dec 2021 16:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
 <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com>
In-Reply-To: <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Dec 2021 16:48:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W2M0=7LG4g-si1ce_rnhP9DWW6mm1Vb5aUkFcC3TtYng@mail.gmail.com>
Message-ID: <CAD=FV=W2M0=7LG4g-si1ce_rnhP9DWW6mm1Vb5aUkFcC3TtYng@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB
 defers or unbinds
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Dec 6, 2021 at 4:37 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-12-06 15:28:47)
> > On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
> > enabled, you'll see a Use-After-Free reported at bootup.
> >
> > The root of the problem is that dwc3_qcom_of_register_core() is adding
> > a devm-allocated "tx-fifo-resize" property to its device tree node
> > using of_add_property().
> >
> > The issue is that of_add_property() makes a _permanent_ addition to
> > the device tree that lasts until reboot. That means allocating memory
> > for the property using "devm" managed memory is a terrible idea since
> > that memory will be freed upon probe deferral or device
> > unbinding. Let's change to just allocate memory once and never free
> > it. This sorta looks like a leak but isn't truly one, since only one
> > property will be allocated per device tree node per boot.
> >
> > NOTE: one would think that perhaps it would be better to use
> > of_remove_property() and then be able to free the property on device
> > remove. That sounds good until you read the comments for
> > of_remove_property(), which says that properties are never really
> > removed and they're just moved to the side.
>
> Is it a problem to remove and then add again? It moves it to the side
> which means we may run out of memory?

I suspect it would mostly work to do it, but to me it seems worse than
the solution I have here. Specifically, I presume of_remove_property()
is written to "move things to the side" for a reason. I guess in
general callers are expecting that they can just hold onto properties
forever, so if someone happened to decide to hold onto our property
then things could go boom when we free it.

Oh, actually, looking at the implementation I think there's another
problem. I believe when of_remove_property() moves the property to the
side it still expects that it can use the linked list node pointers in
the property to chain it onto the "deadprops" list.


> > Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  drivers/usb/dwc3/dwc3-qcom.c | 32 +++++++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 9abbd01028c5..34b054033116 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -658,18 +658,28 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> >                 return -ENODEV;
> >         }
> >
> > -       prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
> > -       if (!prop) {
> > -               ret = -ENOMEM;
> > -               dev_err(dev, "unable to allocate memory for property\n");
> > -               goto node_put;
> > -       }
> > +       /*
> > +        * Permanently add the "tx-fifo-resize" to the device tree. Even if
> > +        * our device is unregistered this property will still be part
> > +        * of the device tree until reboot. Because this is a "permanent"
> > +        * change, we allocate memory _without_ devm. For some context, see
> > +        * the fact that of_remove_property() doesn't actually remove things.
> > +        */
> > +       if (!of_find_property(dwc3_np, "tx-fifo-resize", NULL)) {
> > +               prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +               if (!prop) {
> > +                       ret = -ENOMEM;
> > +                       dev_err(dev, "unable to allocate memory for property\n");
>
> Allocations already print a big error when they fail to allocate. Please
> drop this error message.

Makes sense to drop it. I can post a v2 with this or a follow-up patch
depending on what people want. For now I'll wait until we get
agreement on what we want to do with this patch.


> > +                       goto node_put;
> > +               }
> >
> > -       prop->name = "tx-fifo-resize";
> > -       ret = of_add_property(dwc3_np, prop);
>
> I don't understand why we can't tell dwc3 that we want to use
> tx-fifo-resize without adding a DT property. DT isn't the only way we
> could probe this qcom dwc3 device, there's also ACPI. And in dwc3 core
> where we check for this property couldn't we add a compatible check for
> qcom,dwc3 and then force the property? I see that a lot of this was
> already discussed when these patches got applied by gregkh directly[1].
>
> Can we revert out this bad code instead?

I'm OK w/ just reverting the bad code, if that's what people want.


> > -       if (ret) {
> > -               dev_err(dev, "unable to add property\n");
> > -               goto node_put;
> > +               prop->name = "tx-fifo-resize";
> > +               ret = of_add_property(dwc3_np, prop);
>
> [1] https://lore.kernel.org/all/b5917fc0-c916-0a51-dc4c-315d7f02cafa@codeaurora.org/
