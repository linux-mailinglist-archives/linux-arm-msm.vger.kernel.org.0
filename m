Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C775F46AF38
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 01:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351548AbhLGAk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 19:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353410AbhLGAk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 19:40:58 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5770BC0613FE
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 16:37:29 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id bk14so24648078oib.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 16:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7pcoZDYDZ4XPy0jfSxV51o0QhlkPtWK28eVQI3c3heA=;
        b=ISpCreUcW3wJr9UiyA4Gp9QQ7tKtuGhHCV5KsPKGSpgRhwh6fp+Sa9kynBtddhlD6V
         4BnOQ66tXsc1gACQIE6Z5PqGo+ci36ry40854wPd/i65xVPMFjRvxrb0KRB+sJUzGJk3
         zst0cqP6vv8MD9rrZmcacn8TmX4/d6krTJIwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7pcoZDYDZ4XPy0jfSxV51o0QhlkPtWK28eVQI3c3heA=;
        b=WOcCd+oWtZpd1mP03SyKdsMrh1/10qx/Lfegbv6U5j94J7MVkzaz8Y20ZmQZbkbjQV
         3saBhRfa/1iPNRgqyD6OHpKPcAvTn3h14ac9ESl9dztNig16Dm83yBMXy9SJoHYipXgz
         5XOtKV4F41pQ2F7AwYhDsk4Uonb/XXLG6/A8718sLsY9rsOMFPffRiDz/e2Mn4rfNeim
         oq0NvYetcHWzqQfOCWWtR4F6DiB0f58ufOS3GjtE742bpQbM9ByMX7x/DiEVFjrJu68p
         MyNTQqbQMd1E0a+OI/8NopZWYNwfo1t8hlMscfeyQ/ep3zN6HoDZk99WKVqKuwI2bUEI
         VzuA==
X-Gm-Message-State: AOAM533JRWvO8bRkkIuMx98YmdmE4vjlbaGiNBeq4BTITvsq8cIUV1Ee
        fKDxxi/ZqlyXDN8oZix9xlkv1KXlrv+IqrkHNWgMFw==
X-Google-Smtp-Source: ABdhPJxX0kLPKr0o/2eeORpJDihFBVHFMrz3nTWCVr7pfc4bJacymfdxecA+JsjRMzQ7UlX0Hc62p6Y4pmTsgEGbIUY=
X-Received: by 2002:a54:4506:: with SMTP id l6mr2210091oil.32.1638837448554;
 Mon, 06 Dec 2021 16:37:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Dec 2021 16:37:28 -0800
MIME-Version: 1.0
In-Reply-To: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
References: <20211206152844.1.I411110cc99c1dd66b01aa9aa25651acf8ff55da1@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 6 Dec 2021 16:37:28 -0800
Message-ID: <CAE-0n50n=JZEqz5aQW4FQwjO9eFN56vTmBrQ6qBWduFY5jNPJA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: dwc3-qcom: Avoid use-after-free when USB
 defers or unbinds
To:     Douglas Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-12-06 15:28:47)
> On sc7180-trogdor class devices with 'fw_devlink=permissive' and KASAN
> enabled, you'll see a Use-After-Free reported at bootup.
>
> The root of the problem is that dwc3_qcom_of_register_core() is adding
> a devm-allocated "tx-fifo-resize" property to its device tree node
> using of_add_property().
>
> The issue is that of_add_property() makes a _permanent_ addition to
> the device tree that lasts until reboot. That means allocating memory
> for the property using "devm" managed memory is a terrible idea since
> that memory will be freed upon probe deferral or device
> unbinding. Let's change to just allocate memory once and never free
> it. This sorta looks like a leak but isn't truly one, since only one
> property will be allocated per device tree node per boot.
>
> NOTE: one would think that perhaps it would be better to use
> of_remove_property() and then be able to free the property on device
> remove. That sounds good until you read the comments for
> of_remove_property(), which says that properties are never really
> removed and they're just moved to the side.

Is it a problem to remove and then add again? It moves it to the side
which means we may run out of memory?

>
> Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/usb/dwc3/dwc3-qcom.c | 32 +++++++++++++++++++++-----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9abbd01028c5..34b054033116 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -658,18 +658,28 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
> -       if (!prop) {
> -               ret = -ENOMEM;
> -               dev_err(dev, "unable to allocate memory for property\n");
> -               goto node_put;
> -       }
> +       /*
> +        * Permanently add the "tx-fifo-resize" to the device tree. Even if
> +        * our device is unregistered this property will still be part
> +        * of the device tree until reboot. Because this is a "permanent"
> +        * change, we allocate memory _without_ devm. For some context, see
> +        * the fact that of_remove_property() doesn't actually remove things.
> +        */
> +       if (!of_find_property(dwc3_np, "tx-fifo-resize", NULL)) {
> +               prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> +               if (!prop) {
> +                       ret = -ENOMEM;
> +                       dev_err(dev, "unable to allocate memory for property\n");

Allocations already print a big error when they fail to allocate. Please
drop this error message.

> +                       goto node_put;
> +               }
>
> -       prop->name = "tx-fifo-resize";
> -       ret = of_add_property(dwc3_np, prop);

I don't understand why we can't tell dwc3 that we want to use
tx-fifo-resize without adding a DT property. DT isn't the only way we
could probe this qcom dwc3 device, there's also ACPI. And in dwc3 core
where we check for this property couldn't we add a compatible check for
qcom,dwc3 and then force the property? I see that a lot of this was
already discussed when these patches got applied by gregkh directly[1].

Can we revert out this bad code instead?

> -       if (ret) {
> -               dev_err(dev, "unable to add property\n");
> -               goto node_put;
> +               prop->name = "tx-fifo-resize";
> +               ret = of_add_property(dwc3_np, prop);

[1] https://lore.kernel.org/all/b5917fc0-c916-0a51-dc4c-315d7f02cafa@codeaurora.org/
