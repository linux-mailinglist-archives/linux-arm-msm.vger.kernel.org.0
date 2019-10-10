Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA60D2C45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 16:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfJJOTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 10:19:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34996 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJOTj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 10:19:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so4020128pfw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=Vc0Op+2XXi9qqSr1cgopFMg1Ji4quSb7jKDmcOqTucc=;
        b=SPBQw/gKsxCWYeSfzVUZnPfWLQPwwGYwoez6jizU3S/GiP5Ex3o7xBmgn7rLkOgNUM
         i52Lyk4vr+jSDeRQnOtXL8mBrMOkwsroOEKNJGsibyF0iVtB7Ev4Md/Ui0PlAoTEcxRo
         Bs0Q502JcbzimSZzRhbtl0jnD767Z9ukhW3yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=Vc0Op+2XXi9qqSr1cgopFMg1Ji4quSb7jKDmcOqTucc=;
        b=seuvOjKTtjcL5ao6cdBAR27EeHsHC7NVwjAK/ouNnTeGzg2b1oim2c+zQ1otl/xWal
         1lYKAkz/BXCB7ES9Q1NgbGEpnoAgMo72eFFSRXRv1Y3xZ+9Lx6S8MBh4t600BORi8Thp
         A5svVVOVGTD+vKwua4ae5r6ix1Cqt/ZBAHM+TJ9+cWt1yC2LYdKw3yl9DcISX0b5CB0G
         ziPy8RZTJoRccWWVatY2Rx07ID+SMDoMxI7SJKNVKWdVJFQo2qTxNP9eyf3Lj7WiyOPH
         HLWwFzcPHYwj2WeyX2k5B3WqNsVn/Xbl9gOXwxAGYg/MBKGtsKPJMmcmBd9VYl3RiKSl
         CpWQ==
X-Gm-Message-State: APjAAAWHyz4fnCJeFe7ujIi8/eRntxZqdcuy0TQpn7EaVR9UKE5yV9LF
        x3xTNR7lh/xAzuwAy2XPsYCoeQ==
X-Google-Smtp-Source: APXvYqzNVgo7MCrZFWrruov4wjonCct9rl5v9+n6GCVglexqUTYjJZs6lcifdtyRpRYffCMk+ykFmg==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr11160172pgv.117.1570717178731;
        Thu, 10 Oct 2019 07:19:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l6sm5619583pje.28.2019.10.10.07.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 07:19:38 -0700 (PDT)
Message-ID: <5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1570700763-17319-1-git-send-email-akashast@codeaurora.org>
References: <1570700763-17319-1-git-send-email-akashast@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
User-Agent: alot/0.8.1
Date:   Thu, 10 Oct 2019 07:19:37 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-10-10 02:46:03)
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 14c6306..5180cd8 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1297,11 +1291,21 @@ static int qcom_geni_serial_probe(struct platform=
_device *pdev)
>         port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
>         port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> =20
> +       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
> +               (uart_console(uport) ? "console" : "uart"), uport->line);

Drop useless parenthesis. Also, it might make more sense to make this a
devm_kasprintf() call now.

>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0)
>                 return irq;
>         uport->irq =3D irq;
> =20
> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);

Is there a reason why we can't always leave the irq enabled and request
it later once the uart structure has been fully initialized?

> +       ret =3D devm_request_irq(uport->dev, uport->irq, qcom_geni_serial=
_isr,
> +                       IRQF_TRIGGER_HIGH, port->name, uport);
> +       if (ret) {
> +               dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> +               return ret;
> +       }
> +
>         uport->private_data =3D drv;
>         platform_set_drvdata(pdev, port);
>         port->handle_rx =3D console ? handle_rx_console : handle_rx_uart;
