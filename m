Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1A456AE547
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjCGPrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjCGPq4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:46:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316E48C0CD
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:46:21 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t14so13602364ljd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678203976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=;
        b=nvbPrWp7Np6M7wB0syVH31b7CA9bO/qWCKBcvVlTQHeAFce9IrN3LI0V0fQxV1VNYO
         RFJn4RWV+Zrj8cgw7LFvP3QVmCsybnCaSBPIyUKVBQFO6L0dxxsmk4c9cSm8I5qmgAf8
         n2prckEJSYAahLfkDoQRqz4YZR5YpxGbjt8Qb3O6UDH4ycPLgoGhDOcLybZryv3B1eMf
         Xi96t+GEVpyWzdvq2DviqGA4ADc4PAmwDHWET9b7nsYXjtYNox5dTMe2P9miuRSJy2X+
         ne6B13T88kZ+w/yBX+TXZ9pnEsC53qh/TeaZeU3vpsIw47L5nVWXCj+iCpOpQ8KugXGn
         yEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9+99NXNhE+HCsau06muPJZBCwtg/6d76sJA1Z4GbtQ=;
        b=eYH+SgCdQs4hN4DcWSEugkv2ehDP7MGwgTVMwfvB6xEf8ESJ+dT1bbCmQGM2z9BRV6
         aJTMiDUyPGaXu2UXeuFrdmZudUsO1wkZ5u7E8RRJVt8vxCwQ6dQUgYRjrBdsWfmEVPmV
         4GccLSK41uG6UOB7zpD6L5sddcz9cU2paPx4yxKL8tHdrz/labzselmdjseJt+7xki68
         /qxrv4MO+5UbnkTGEJnKijGRlZwE+W5i4IE2P6Otf42uyBEiPdqffd0eYudW5Nz/nnGB
         Uxakp62w1Y5/D8TOoY5N/bYQbRse/mHZDYOtk0xND+9z+iWQ62EEm/9/Jy4+iVolBb70
         OQEQ==
X-Gm-Message-State: AO0yUKXXta+xBXHyEVqEBpkTU3lA7thQceN2Y/m2NQZzyKP2QpF7OcYW
        LHjhR20bj2vLaibM7qsfYzMgHzhiDLF/64P0DtcwqNee/yv2DGj0
X-Google-Smtp-Source: AK7set+EUPmmQ3KQEHGY3m5gS4LQmB5rlfTmCkgWLid5zxaXS4ZPk4vzmFfYMo7ea0TRMI75s5JFMj77XkpxSfOGbJ8=
X-Received: by 2002:a05:651c:1246:b0:295:b77c:a3a2 with SMTP id
 h6-20020a05651c124600b00295b77ca3a2mr4616438ljh.6.1678203976045; Tue, 07 Mar
 2023 07:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 7 Mar 2023 16:46:03 +0100
Message-ID: <CAMRc=McL7P7Zr5csLtLVBj0DzuJ_M6OZZKeVQvpPCx1ytMk+=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] tty: serial: qcom-geni-serial: Fix kdb/kgdb after
 port shutdown (again)
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 7, 2023 at 4:33=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
> in progress at shutdown") was basically a straight revert of the
> commit it claims to fix without any explanation of why the problems
> talked about in the original patch were no longer relevant. Indeed,
> commit d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations
> in progress at shutdown") re-introduces the same problem that commit
> e83766334f96 ("tty: serial: qcom_geni_serial: No need to stop tx/rx on
> UART shutdown") fixed.
>
> The problems are very easy to see by simply doing this on a
> sc7180-based Chromebook:
>
> 1. Boot in developer mode with serial console enabled and kdb setup on
>    the serial console.
> 2. via ssh: stop console-ttyMSM0; echo g > /proc/sysrq-trigger
>
> When you do the above you'll see the "kdb" prompt printed on the
> serial console but be unable to interact with it.
>
> Let's fix the problem again by noting that the console port is never
> configured in DMA mode and thus we don't need to stop things for the
> console.
>
> Fixes: d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in p=
rogress at shutdown")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index d69592e5e2ec..74a0e074c2de 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1070,8 +1070,10 @@ static int setup_fifos(struct qcom_geni_serial_por=
t *port)
>  static void qcom_geni_serial_shutdown(struct uart_port *uport)
>  {
>         disable_irq(uport->irq);
> -       qcom_geni_serial_stop_tx(uport);
> -       qcom_geni_serial_stop_rx(uport);
> +       if (!uart_console(uport)) {
> +               qcom_geni_serial_stop_tx(uport);
> +               qcom_geni_serial_stop_rx(uport);
> +       }
>  }
>
>  static int qcom_geni_serial_port_setup(struct uart_port *uport)
> --
> 2.40.0.rc0.216.gc4246ad0f0-goog
>

And also:

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
