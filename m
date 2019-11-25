Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45BDC109190
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 17:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbfKYQGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 11:06:06 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34814 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbfKYQGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 11:06:06 -0500
Received: by mail-pf1-f195.google.com with SMTP id n13so7595791pff.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=uZogxMLKmu5ag7/Tehf3/UKuF5mtSeXbYA+YVlKXCag=;
        b=jjisLgX4SfQj1tGf3EchqcYmktFL/caWBphKbHwHvOIi3Tz6G2g2sVnWRkZ2tT+r6s
         t7scmR1R57RMIyrEl5eCttpCzw91+bwjSHfrHUgwefdbELaNDQjtbdI68m+nbybXmt1X
         KaQVzCMSrZP+8OLFMHBkkq06lznqPN8WRnB6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=uZogxMLKmu5ag7/Tehf3/UKuF5mtSeXbYA+YVlKXCag=;
        b=reUYamaploO0tAOdNsle0lkLh/zqRoUC5EVv+69ephRAliyeupflXOhGE9HtJKc1tT
         +oVDU+0ae3GSiS2gox3kkoN88UMjKuEx3p9x++6cekCa/JEfEcNhXzVrSeKQQ0LTth67
         ves664eq7O0633tb6WShj2ScZmqgHR98Cu2c7NiDaTzhN6fjbcp36DDDXfpX4B+yLpWJ
         hBRisj6UMJQdFaY5uazLE5Jmu4e9uS4Xmd/e7hE1ltCuTA2UIhaIA2l7jGS0kRJ7O0nJ
         y8dUTDI3te7S0DFzR6vMjtD2PBF3z5gIvNGh97CA5vz2iK9RT9+YHwW59Vo5WXizcDio
         er9g==
X-Gm-Message-State: APjAAAUv6TOFAdcqCDQQJQ52/082UEPTE6SbR+dZUyYn2Kaziafrwo0+
        SgqP8No7LLim8r35hFHFP/wxxA==
X-Google-Smtp-Source: APXvYqzq/YbOa34s32fl9fREiHshITN5k9L7eNRFQjS1QMNaaSNmOrJRLw+P2V/k2xlMaJUgj7QNtA==
X-Received: by 2002:a62:4ec4:: with SMTP id c187mr35379472pfb.113.1574697965387;
        Mon, 25 Nov 2019 08:06:05 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l13sm8749354pjq.18.2019.11.25.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 08:06:04 -0800 (PST)
Message-ID: <5ddbfbec.1c69fb81.c6c96.3c18@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016ea31bae6b-614d45a0-ddb0-4f82-b906-48850f439280-000000@us-west-2.amazonses.com>
References: <1574694511-31479-1-git-send-email-akashast@codeaurora.org> <0101016ea31bae6b-614d45a0-ddb0-4f82-b906-48850f439280-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH V7 1/2] tty: serial: qcom_geni_serial: Wakeup IRQ cleanup
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Mon, 25 Nov 2019 08:06:03 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-25 07:08:50)
> This patch is the continuation of below mentioned commits which adds wake=
up
> feature over the UART RX line.
> 1)commit 3e4aaea7a039 ("tty: serial: qcom_geni_serial: IRQ cleanup")[v2]
> 2)commit 8b7103f31950 ("tty: serial: qcom_geni_serial: Wakeup over UART
>   RX")[v2]
>=20
> The following cleanup is done based on upstream comment received on
> subsequent versions of the above-mentioned commits to simplifying the cod=
e.
>  - Use devm_kasprintf API in place of scnprintf.
>  - Use dev_pm_set_dedicated_wake_irq API that will take care of
>    requesting and attaching wakeup irqs for devices. Also, it sets wakeirq
>    status to WAKE_IRQ_DEDICATED_ALLOCATED as a result enabling/disabling =
of
>    wake irq will be managed by suspend/resume framework. We can remove the
>    code for enabling and disabling of wake irq from the this driver.
>  - Use platform_get_irq_optional API to get optional wakeup IRQ for
>    device.
>  - Move ISR registration later in probe after uart port gets register with
>    serial core.
>=20
> Patch link:
>  - https://patchwork.kernel.org/patch/11189717/ (v3)
>  - https://patchwork.kernel.org/patch/11227435/ (v4)
>  - https://patchwork.kernel.org/patch/11241669/ (v5)
>  - https://patchwork.kernel.org/patch/11258045/ (v6)
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Ok sure.

> ---
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index ff63728..55b1d8b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1302,50 +1294,58 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>         port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
>         port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> =20
> -       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
> -               (uart_console(uport) ? "console" : "uart"), uport->line);
> +       port->name =3D devm_kasprintf(uport->dev, GFP_KERNEL,
> +                       "qcom_geni_serial_%s%d",
> +                       uart_console(uport) ? "console" : "uart", uport->=
line);
> +       if (!port->name)
> +               return -ENOMEM;
> +
>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0)
>                 return irq;
>         uport->irq =3D irq;
> =20
> +       if (!console)
> +               port->wakeup_irq =3D platform_get_irq_optional(pdev, 1);

Is there a DT binding update for this? It would be nice if the GENI SE
binding was updated to by YAML.

> +
> +       uport->private_data =3D drv;
> +       platform_set_drvdata(pdev, port);
> +       port->handle_rx =3D console ? handle_rx_console : handle_rx_uart;
> +       if (!console)
> +               device_create_file(uport->dev, &dev_attr_loopback);
> +
