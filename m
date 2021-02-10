Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28688316E62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 19:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhBJSTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 13:19:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:57822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233809AbhBJSSB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 13:18:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADAE064EE9;
        Wed, 10 Feb 2021 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612981009;
        bh=Y3M41xwZVH3Dio4o/VsIyICva0DpELAmRG0OwZz7C1Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QM7pBvQZXERvSGVgvVQf7/8bIgSjJ1LFA/QqdCKHjseU3TJdXhwdyRqlAohdiep5Y
         ccCj9qMxQ00ZZL5/zdNDgyrMtC/uJJIhU5zT90AAT5gh5E4CRD8NIo1utDowjzRE6L
         RSXQIstLwQh+q983wgmIG69dRBcZICctI9Yzzh3HjAaHF+YoO5+HRfkGDbOcKLs4E9
         KmnqwHD8vgvZxBhHsjXiByuC4u7CiPVwRyCqEFr3QEl6GQNSQjLhqYUpPGV0xpLPoM
         BBAx3oxFCcyYCN/7z2GTGIwbl0dJb3vp85lJkX6pplDCGq8WX8xOn88uv8E/euu1+9
         i/DEf4jgqEj1g==
Received: by mail-qv1-f46.google.com with SMTP id ew18so1303424qvb.4;
        Wed, 10 Feb 2021 10:16:49 -0800 (PST)
X-Gm-Message-State: AOAM530v2gKJZGkjfatpIhCp8IVAGpWyVOgwFT2G+TuN5S0RqlG1+2j+
        YjxpUjcmE01LVVG8GgpeQxf1ARBQ0jAsU2ngNA==
X-Google-Smtp-Source: ABdhPJxvrP8Mx1Q6brlIT04YJdW8GZAt91MQw70k4YzGnJ4FdepboyPbcyxHhdadzSfGAHVYcBki3D4fuCUyMhVxlvI=
X-Received: by 2002:ad4:45ca:: with SMTP id v10mr4316438qvt.11.1612981008833;
 Wed, 10 Feb 2021 10:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru> <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205155621.3045-10-Sergey.Semin@baikalelectronics.ru>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Feb 2021 12:16:37 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0iZC5NcXkn9K+yPZ+7-j-Ee6n-teitrUjSkOYo=3MLQ@mail.gmail.com>
Message-ID: <CAL_Jsq+0iZC5NcXkn9K+yPZ+7-j-Ee6n-teitrUjSkOYo=3MLQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 5, 2020 at 9:56 AM Serge Semin
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

>         if (!dwc3_np) {
>                 dev_err(dev, "failed to find dwc3 core child\n");
>                 return -ENODEV;
> --
> 2.29.2
>
