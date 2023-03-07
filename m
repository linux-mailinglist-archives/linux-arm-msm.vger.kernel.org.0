Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7316AE507
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjCGPjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjCGPjm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:39:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A3F47428
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:39:00 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f18so17627217lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678203533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=;
        b=27Vczj2ZJ1z6GuzsJQ0NJe/PD7i199Kyn0O9BkcWuikdr2DYj191LBHT1bOjT4cGl2
         KD2N3l6oWOawpT+BSHTcP9ze8xpGka/n6usAWItJkMb5LcEErGH9xGr1w7gcFKHc6Rqw
         T/q9LRslqqYaRNIREhcszgmyc9nhv+PdLYLqdwwp1imMtQTRrG3ej9e5C/jfU9x1B6nb
         VFMMHlQqprwzpJoIQ6kT1gvDxgC0Fku1ijX5C/L1L8xnzf7KjnOqIWPnt1ttVacIO4hH
         mgnP+4rAMiMQ9gUIYoT+hSs+YA5RZ4ZlY9KQTWQJ+76PbBSSQe0uhJAptiIEu9H7Zx+2
         7F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PtH9Gk9ydTOUuCLXL03A9HQrmxm7UqvxGMXgnUBbiM=;
        b=EopG3F2JJSXp3jTH5siGlwgyn2xxiwRauw+Kw1g9xxxxK2dtfrEw+IRHsY5SdFBap/
         h/PB2uAP2W+/PIc+A1ANCJ1AIKMtIIyQh2ICJhaqQsXiwDKTd3e/NiM8EB9zBwHcGmvj
         lHU4id2ss9ZZF3jx/I3GOA2fWDuVNL4sew895wLRYL3rDNb8iNq4zFTkdpj8VXRAhVX3
         t+OsVb/sgvj5COQOZheCn6GngDuSbNHDiyfLWziD1+3fvP+QhGDPtSFGJK4mA+cn2Plc
         Ph89H6bQjddUloYLnJmkDMTqUibAYqQVd54H61c5jd5T/pqITbJprMb8vyapaky3etah
         lCLg==
X-Gm-Message-State: AO0yUKWFhK6tzH8bNUks52OIQGSEgbmENFUPsE17uPVZjbEhQze0VIGw
        bfPpcZv3cfGm583ePLT/9ouFguCXyjpoOaMM1DAh3Q==
X-Google-Smtp-Source: AK7set/sxMp2nymcDtGOA+3rKK9UwGmZwcMpf7ztw0lEMN+8H5sNhHbCwoz5CimvcW51n/7crDGpnBESVibPIo32sWU=
X-Received: by 2002:ac2:43a6:0:b0:4db:3ab2:896e with SMTP id
 t6-20020ac243a6000000b004db3ab2896emr4355849lfl.6.1678203532966; Tue, 07 Mar
 2023 07:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
In-Reply-To: <20230307073155.1.Iaab0159b8d268060a0e131ebb27125af4750ef99@changeid>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 7 Mar 2023 16:38:21 +0100
Message-ID: <CAMRc=MdKmDQGj_tWJhFMtOW3bGJWu4gqjL40BbCbP-Or5epVZA@mail.gmail.com>
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

Hey Douglas,

Thanks for this, I was about to post a similar fix, this was reported
to me by two other people.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
