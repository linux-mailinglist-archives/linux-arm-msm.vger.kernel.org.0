Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8F3347024
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 04:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbhCXDbq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 23:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbhCXDbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 23:31:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C24C0613D8
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 20:31:42 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso448564pjb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 20:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=C84S7+LeWJ9xyhWyOk0XcFmsrxo1Jkj1r7I1oCRR3t4=;
        b=UgNThMGDEHS9FSm7fmzf2h+HDTFcEGc0iAWcC0JmzXz/+RSYAJUfrMOrGdIun0RA+Q
         KCDlmT7cbWBwk914l0JohFInaANEZ2OAdB4Xt+9i0sN3X94uQ9JnkoKHXx3gPpvN5UY8
         /a4ctmfEoTYg63xXI8o3iz2YmIBZoNf/Jq8cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=C84S7+LeWJ9xyhWyOk0XcFmsrxo1Jkj1r7I1oCRR3t4=;
        b=PVH+9LQhd6lTUe6x9sb0rf92c2XjFhAlUWd0DIfyvu8qK76e2BtSv90rkq8eVhYiZJ
         sDNg3hPmoDItj56OcTiNcTdoLztr3fYDAkgeRKKMISqQXescYVbFsH4XfuQcwQPHxKUA
         7Xr4Xv76H/OrsDqiKQVxatZNmOIWmcukcRy+5vMEChTu2LzQcOG5hWROqJ/CrXAI4cQB
         /X8d0oAIF26zJ5AAQsWQfusWyHMBfdlf/dE4GXDKn6WxhLhawzxlrupU/DwwfNClhS4l
         1o7KDkZdQu+gGrlTFhcJHcBqTKHUrG/Lt5VxOJI61Ea35h2wsNMcGEgOr39WqGG+YeEj
         OWyg==
X-Gm-Message-State: AOAM530XoGsvsrgBj3pk5xyd9YDNTnV4+r2YE7Xnncr6t6uQdptBDyyY
        W9XMiamt2WS9vmU8bjAYolpqBJzZWHhLjA==
X-Google-Smtp-Source: ABdhPJzRT9DYneyQ4OeeffBeF24YG4qG51zLM8rgHilzNNPAFkERpiLs4MyC9U5bUdcNRfRyd6yjiQ==
X-Received: by 2002:a17:902:70c5:b029:e6:cba1:5d94 with SMTP id l5-20020a17090270c5b02900e6cba15d94mr1604726plt.84.1616556701548;
        Tue, 23 Mar 2021 20:31:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id w17sm542950pgg.41.2021.03.23.20.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 20:31:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
References: <1616527652-7937-1-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v1] usb: dwc3: core: Add shutdown callback for dwc3
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 23 Mar 2021 20:31:38 -0700
Message-ID: <161655669850.3012082.11672497224863339022@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2021-03-23 12:27:32)
> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
>=20
> Previously this was added in dwc3 qcom glue driver.
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=3D382449
> But observed kernel panic as glue driver shutdown getting called after
> iommu shutdown. As we are adding iommu nodes in dwc core node
> in device tree adding shutdown callback in core driver seems correct.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 94fdbe5..777b2b5 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1634,11 +1634,9 @@ static int dwc3_probe(struct platform_device *pdev)
>         return ret;
>  }
> =20
> -static int dwc3_remove(struct platform_device *pdev)
> +static void __dwc3_teardown(struct dwc3 *dwc)
>  {
> -       struct dwc3     *dwc =3D platform_get_drvdata(pdev);
> -
> -       pm_runtime_get_sync(&pdev->dev);
> +       pm_runtime_get_sync(dwc->dev);
> =20
>         dwc3_debugfs_exit(dwc);
>         dwc3_core_exit_mode(dwc);
> @@ -1646,19 +1644,32 @@ static int dwc3_remove(struct platform_device *pd=
ev)
>         dwc3_core_exit(dwc);
>         dwc3_ulpi_exit(dwc);
> =20
> -       pm_runtime_disable(&pdev->dev);
> -       pm_runtime_put_noidle(&pdev->dev);
> -       pm_runtime_set_suspended(&pdev->dev);
> +       pm_runtime_disable(dwc->dev);
> +       pm_runtime_put_noidle(dwc->dev);
> +       pm_runtime_set_suspended(dwc->dev);
> =20
>         dwc3_free_event_buffers(dwc);
>         dwc3_free_scratch_buffers(dwc);
> =20
>         if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
> +}
> +
> +static int dwc3_remove(struct platform_device *pdev)
> +{
> +       struct dwc3     *dwc =3D platform_get_drvdata(pdev);
> +
> +       __dwc3_teardown(dwc);
> =20
>         return 0;
>  }
> =20
> +static void dwc3_shutdown(struct platform_device *pdev)
> +{
> +       struct dwc3     *dwc =3D platform_get_drvdata(pdev);
> +
> +       __dwc3_teardown(dwc);
> +}

Can't this be

	static void dwc3_shutdown(struct platform_device *pdev)
	{
	       dwc3_remove(pdev);
	}

and then there's nothing else to change? Basically ignore return value
of dwc3_remove() to make shutdown and remove harmonize. I also wonder if
this is more common than we think and a struct driver flag could be set
to say "call remove for shutdown" and then have driver core swizzle on
that and save some duplicate functions.

>  #ifdef CONFIG_PM
>  static int dwc3_core_init_for_resume(struct dwc3 *dwc)
>  {
> @@ -1976,6 +1987,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_acpi_match);
>  static struct platform_driver dwc3_driver =3D {
>         .probe          =3D dwc3_probe,
>         .remove         =3D dwc3_remove,
> +       .shutdown   =3D dwc3_shutdown,
