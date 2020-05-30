Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB301E9346
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2020 21:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE3TJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 May 2020 15:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbgE3TJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 May 2020 15:09:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536E2C03E969
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2020 12:09:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ci21so3234508pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2020 12:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fRI7T2BH9y8yMSpd1kC5w4YdS5tgLCSYVLzvu+46Jyk=;
        b=BV/AWAnl4+ZDhj2KS2e4MskX+Vc7b3ZzrSJPY149ruLpwSKXf58hBthx9NNW4SAytl
         qqHZi7XH+scKOnT1aeM1vL8hwBraBps+pMxCm1/NbHWcrPI8KIY6WZ+JuW781qZKwgEV
         loSe07ODlCX200zMvEvlqzOUxlWu/bdP12LpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fRI7T2BH9y8yMSpd1kC5w4YdS5tgLCSYVLzvu+46Jyk=;
        b=WonNuWo0UCTARl6YX5EaXBYW1N1ChKIbDJg8vs9sDsR0Jz4uzuE6Y7IrB80ZOogPTI
         GYp0k050Mo+BoqTcOZ1KQIBAupZjwxl/qRL+VURDkHFRZ+njNqNyg9Vfz1Nw+lpWLR+a
         RoI/iXCtcmY+nQHZ3FoZ8Dxi1QfTRbBo8acVJX0twi9AvZvOa6Y4FgiSwC/yGvl6PhmE
         OSxmoMeq/MwL88sk+cijNybM+8R/p35RE7XTbdNWhrFvHlC2MbsoFmVvIusOSZ0ztVF7
         3i9u0oR+w6phP3BbD15lq7W+Kkyn+NG6lccDMoSd1eXo4i6IsfxFQb3oFsxyLa5shcpQ
         cUAA==
X-Gm-Message-State: AOAM533EzI7ikZ2gd9Nmn9D4i45+vtL4kE5wH3ADvrPWAuvVvzBGHVjt
        GIXlFXSHvbwvYBGqSZeWAOZ+CPn3BJE=
X-Google-Smtp-Source: ABdhPJykvkHrft7rTMJcf4H8TjM6wmN8bp/0Ehpjc7HhRLH8CZxfxvIDKV6kyiplfpHieebjtf0kLg==
X-Received: by 2002:a17:90b:195:: with SMTP id t21mr15240934pjs.93.1590865779643;
        Sat, 30 May 2020 12:09:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id d2sm10453993pfc.7.2020.05.30.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 12:09:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590747282-5487-1-git-send-email-skakit@codeaurora.org>
References: <1590747282-5487-1-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Add 51.2MHz frequency support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org, satya priya <skakit@codeaurora.org>
Date:   Sat, 30 May 2020 12:09:38 -0700
Message-ID: <159086577801.69627.2631265472584358776@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2020-05-29 03:14:42)
> To support BT use case over UART at baud rate of 3.2 Mbps,
> we need SE clocks to run at 51.2MHz frequency. Previously this
> frequency was not available in clk src, so, we were requesting
> for 102.4 MHz and dividing it internally by 2 to get 51.2MHz.
>=20
> As now 51.2MHz frequency is made available in clk src,
> adding this frequency to UART frequency table.
>=20
> We will save significant amount of power, if 51.2 is used
> because it belongs to LowSVS range whereas 102.4 fall into
> Nominal category.
>=20
> Signed-off-by: satya priya <skakit@codeaurora.org>

Great commit text! Maybe point to the commit that adds it to the
frequency table in the gcc clk driver instead of the patchwork link.

> ---
>=20
> Note: This depend on clk patch https://patchwork.kernel.org/patch/1155407=
3/
>=20
>  drivers/tty/serial/qcom_geni_serial.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 6119090..168e1c0 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -141,9 +141,10 @@ static void qcom_geni_serial_stop_rx(struct uart_por=
t *uport);
>  static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool dro=
p);
> =20
>  static const unsigned long root_freq[] =3D {7372800, 14745600, 19200000,=
 29491200,
> -                                       32000000, 48000000, 64000000, 800=
00000,
> -                                       96000000, 100000000, 102400000,
> -                                       112000000, 120000000, 128000000};
> +                                       32000000, 48000000, 51200000, 640=
00000,
> +                                       80000000, 96000000, 100000000,
> +                                       102400000, 112000000, 120000000,
> +                                       128000000};

Will this break sdm845? That clk frequency table hasn't been updated to
add 51.2 MHz.

Furthermore, it would be nice to get rid of this table and use
clk_round_rate() to find a frequency that will work with the requested
baud rate. Can we do that instead? That would make it work regardless of
what the clk driver supports for the particular SoC. Presumably we can
just call clk_round_rate() and then make sure it is evenly divisible by
the requested rate and then it will be mostly the same as before.

Or if we need to we can keep multiplying the rate 10 or 20 times and
test with clk_round_rate() each time and then give up if we don't find a
frequency that will work. The divider value looks like it is 12 bits
wide so there are 4095 possible dividers. If we need to loop through all
possible dividers then it may make sense to register a clk in this
driver and have it call divider_round_rate() to find the closest rate to
the desired rate. That would avoid reinventing a bunch of code that we
already have to implement clk dividers.

And one more thing, I see that this driver doesn't use DFS. Instead it
relies on the clk_set_rate() call to change the qup clk frequency. We
could support DFS by adding a driver specific member to struct
clk_rate_request that can be used to communicate back extra info to the
child clk. The idea is that the DFS clk (the qup uart one) can round the
rate and jam in the DFS index that corresponds to the rate into the new
member. Then the clk implemented in this serial driver can stash away
that index into some table that maps frequency of parent to DFS index
and then look up the DFS index during clk_set_rate() based on the parent
rate the clk_op is called with to program the DFS value in the uart
registers in addition to the divider.

---8<---
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qco=
m_geni_serial.c
index 6119090ce045..7d147be997e5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -140,11 +140,6 @@ static unsigned int qcom_geni_serial_tx_empty(struct u=
art_port *port);
 static void qcom_geni_serial_stop_rx(struct uart_port *uport);
 static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop);
=20
-static const unsigned long root_freq[] =3D {7372800, 14745600, 19200000, 2=
9491200,
-					32000000, 48000000, 64000000, 80000000,
-					96000000, 100000000, 102400000,
-					112000000, 120000000, 128000000};
-
 #define to_dev_port(ptr, member) \
 		container_of(ptr, struct qcom_geni_serial_port, member)
=20
@@ -900,30 +895,22 @@ static int qcom_geni_serial_startup(struct uart_port =
*uport)
 	return 0;
 }
=20
-static unsigned long get_clk_cfg(unsigned long clk_freq)
-{
-	int i;
-
-	for (i =3D 0; i < ARRAY_SIZE(root_freq); i++) {
-		if (!(root_freq[i] % clk_freq))
-			return root_freq[i];
-	}
-	return 0;
-}
-
-static unsigned long get_clk_div_rate(unsigned int baud,
+static unsigned long get_clk_div_rate(const struct geni_se *se,
+			unsigned int baud,
 			unsigned int sampling_rate, unsigned int *clk_div)
 {
 	unsigned long ser_clk;
 	unsigned long desired_clk;
+	long actual_clk;
=20
 	desired_clk =3D baud * sampling_rate;
-	ser_clk =3D get_clk_cfg(desired_clk);
-	if (!ser_clk) {
+	actual_clk =3D clk_round_rate(se->clk, desired_clk);
+	if (actual_clk % desired_clk !=3D 0) {
 		pr_err("%s: Can't find matching DFS entry for baud %d\n",
 								__func__, baud);
-		return ser_clk;
+		return 0;
 	}
+	ser_clk =3D actual_clk;
=20
 	*clk_div =3D ser_clk / desired_clk;
 	return ser_clk;
@@ -956,7 +943,7 @@ static void qcom_geni_serial_set_termios(struct uart_po=
rt *uport,
 	if (GENI_SE_VERSION_MAJOR(ver) >=3D 2 && GENI_SE_VERSION_MINOR(ver) >=3D =
5)
 		sampling_rate /=3D 2;
=20
-	clk_rate =3D get_clk_div_rate(baud, sampling_rate, &clk_div);
+	clk_rate =3D get_clk_div_rate(&port->se, baud, sampling_rate, &clk_div);
 	if (!clk_rate)
 		goto out_restart_rx;
