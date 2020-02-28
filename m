Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137CC174299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 23:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgB1WzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 17:55:01 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:51903 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726901AbgB1WzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 17:55:00 -0500
Received: by mail-pj1-f65.google.com with SMTP id fa20so1875460pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 14:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=87BULeEYB2lL4TfocY5S2e+F/AYKqoHxEUVofvA6VhY=;
        b=oX7wRqcTGMveG8JiINpHVRmb/6pf2xYLnk4uFEqgtKCI3Th1AT5Tv/DuM6BF5vT7qx
         St6Dh2E5H08W0EO6cZ2NlLKemh+kF0dUNrWB7omHkQoRJQuS1J3i3cBAskmWyNitGLAj
         TGr+1CEG8QI2iKx2Hlj5+RljTaGpUwzWf/Xr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=87BULeEYB2lL4TfocY5S2e+F/AYKqoHxEUVofvA6VhY=;
        b=CtFFBJaUuaWG1yBqibF7zQmmv3uNK3VLzOwFwM4ze+uZfjU6A4hm6k1ZZ0VC0d0T9b
         qBcy/yTNTOuEkF4ZdFDyOY5z4HfNiYaxSBnvqFjU93tKamd6n6b3ZOW1rzfi4mI43Wlf
         2wPtoOlOOT+gCeU2Vf6L1OsqatPh1wZ8ERIlXBRRPbAxXT7rBBaevNGPpyoqrTChArQN
         5Mfm0tKKDWSdiYIhBJ+nBfgQBGQTALtnAji3GPeIXz2901RXNjFQ9dEguyAOvRFoElP2
         tvOuMcVodvVUhsDvSqMqEDxgcZOBSuxxgS1MT4sv4jhDeI9TeUteOvsFBBgKx/54SOuW
         rJQA==
X-Gm-Message-State: APjAAAVFg3RtsTfw9Y2/rVdLk8MNAFuLvS6gj4yKc6JNSGPhvcftFTHD
        IhAir5ezYUxAkGiAbW7Zq54y4Q==
X-Google-Smtp-Source: APXvYqwvhiMPwe/ARw7z7n7R0uXS2yUcAI77gqX3lHGqS7sf4PydDhdUE+b/MxUF0uzPEyQ8qZGwcg==
X-Received: by 2002:a17:902:aa81:: with SMTP id d1mr6463124plr.16.1582930498537;
        Fri, 28 Feb 2020 14:54:58 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i11sm3491964pjg.0.2020.02.28.14.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 14:54:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582638862-9344-2-git-send-email-skakit@codeaurora.org>
References: <1582638862-9344-1-git-send-email-skakit@codeaurora.org> <1582638862-9344-2-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: Allocate port->rx_fifo buffer in probe
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org, satya priya <skakit@codeaurora.org>
Date:   Fri, 28 Feb 2020 14:54:56 -0800
Message-ID: <158293049615.112031.13967218907878863371@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2020-02-25 05:54:21)
> To fix the RX cancel command failure, rx_fifo buffer needs to be
> flushed in stop_rx() by calling handle_rx().
>=20
> If set_termios is called before startup, by this time memory is not
> allocated to port->rx_fifo buffer, which leads to a NULL pointer
> dereference.
>=20
> To avoid this NULL pointer dereference allocate memory to port->rx_fifo
> in probe itself.
>=20
> Signed-off-by: satya priya <skakit@codeaurora.org>

Please give me reported-by credit.

Reported-by: Stephen Boyd <swboyd@chromium.org>

> ---
>  drivers/tty/serial/qcom_geni_serial.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 191abb1..d2a909c 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -858,12 +858,6 @@ static int qcom_geni_serial_port_setup(struct uart_p=
ort *uport)
>                                                 false, false, true);
>         geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
>         geni_se_select_mode(&port->se, GENI_SE_FIFO);
> -       if (!uart_console(uport)) {
> -               port->rx_fifo =3D devm_kcalloc(uport->dev,
> -                       port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
> -               if (!port->rx_fifo)
> -                       return -ENOMEM;
> -       }
>         port->setup =3D true;
> =20
>         return 0;
> @@ -1274,6 +1268,13 @@ static int qcom_geni_serial_probe(struct platform_=
device *pdev)
>         port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
>         port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> =20
> +       if (!console) {
> +               port->rx_fifo =3D devm_kcalloc(uport->dev,
> +                       port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
> +               if (!port->rx_fifo)
> +                       return -ENOMEM;
> +       }

Is there any reason the rx_fifo pointer is a u32 instead of a u8 or void
pointer? ioread32_rep() doesn't care what the pointer is and then we
have to cast it, so it seems like we should do something like below too.

-----8<-----

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qco=
m_geni_serial.c
index 191abb18fc2a..b4875dfef6aa 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -113,7 +113,7 @@ struct qcom_geni_serial_port {
 	unsigned int baud;
 	unsigned int tx_bytes_pw;
 	unsigned int rx_bytes_pw;
-	u32 *rx_fifo;
+	u8 *rx_fifo;
 	u32 loopback;
 	bool brk;
=20
@@ -504,7 +504,6 @@ static int handle_rx_console(struct uart_port *uport, u=
32 bytes, bool drop)
=20
 static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 {
-	unsigned char *buf;
 	struct tty_port *tport;
 	struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
 	u32 num_bytes_pw =3D port->tx_fifo_width / BITS_PER_BYTE;
@@ -516,8 +515,7 @@ static int handle_rx_uart(struct uart_port *uport, u32 =
bytes, bool drop)
 	if (drop)
 		return 0;
=20
-	buf =3D (unsigned char *)port->rx_fifo;
-	ret =3D tty_insert_flip_string(tport, buf, bytes);
+	ret =3D tty_insert_flip_string(tport, port->rx_fifo, bytes);
 	if (ret !=3D bytes) {
 		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
 				__func__, ret, bytes);
