Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23B0316E64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 19:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbhBJSUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 13:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:58204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234116AbhBJSSU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 13:18:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2B9764E15;
        Wed, 10 Feb 2021 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612981059;
        bh=JkIgv0PsH0aVjNdkXET4vD9GYKm1WPva9nrwwlYRssQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V2rsf54QqKRJDTUiwppWXT6bgPy5pZbBfCw99VWJObQlRJ6nJbsQeJpFcymk2l02T
         ca0EKvNzOqaEeYR37x+0ncfgsw+WE74a6ZOr0QG+ylb/NGe0Q1vcIceFY0l0hiqGFb
         1AMuBqqQsHw9wlY+g2tyKggv7xejrCbFReVKYtrBt//OY1GexxT8L3u5sA+4l2tAOC
         0X6FyzgYsAbkym4xz7m1rXP9bULzQqpwaVaxg5fljLWfaGYsJOYzWi7GMypOqzDUS1
         1zXaeA/9l/xK37Mk9po0SgaTebGwCGgQh3Pu7eWQH336KREqlHGXOpP0JuNkRope9M
         BaYGI6HX9rKMQ==
Received: by mail-qv1-f44.google.com with SMTP id a1so1281511qvd.13;
        Wed, 10 Feb 2021 10:17:39 -0800 (PST)
X-Gm-Message-State: AOAM533o3YrAK/nTrAavflwKE8Jq2AZf0U+V6UCDjU2b8X3iDM37aCM3
        rdh0Nby9sZH+WQwfbA3Q+yQGVwIcZP2VBGF6ew==
X-Google-Smtp-Source: ABdhPJyNbqqxp2l81REmTIA1J/QVaz+CtqLOY8hLzE1VKv/bCCuxPtMwNDlAUzUHMbDvC1Y7FHZt2Ed4g1kpFU9Gr1A=
X-Received: by 2002:a05:6214:209:: with SMTP id i9mr3996451qvt.4.1612981058968;
 Wed, 10 Feb 2021 10:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru> <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210210172850.20849-10-Sergey.Semin@baikalelectronics.ru>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Feb 2021 12:17:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
Message-ID: <CAL_JsqJBknqhCSUOdpZVbtmp6TYetBQPLoQUCT6DTFajpChaSA@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 10, 2021 at 11:29 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> In accordance with the USB HCD/DRD schema all the USB controllers are
> supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> existing DT-nodes will be renamed in a subsequent patch let's first make
> sure the DWC3 Qualcomm driver supports them and second falls back to the
> deprecated naming so not to fail on the legacy DTS-files passed to the
> newer kernels.
>
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c703d552bbcf..49ad8d507d37 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -630,7 +630,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>         struct device           *dev = &pdev->dev;
>         int                     ret;
>
> -       dwc3_np = of_get_child_by_name(np, "dwc3");
> +       dwc3_np = of_get_child_by_name(np, "usb") ?:
> +                 of_get_child_by_name(np, "dwc3");

Is there some reason using compatible instead wouldn't work here?

Rob
