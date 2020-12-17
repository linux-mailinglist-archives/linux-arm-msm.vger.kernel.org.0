Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24DC42DCBA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 05:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgLQEWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 23:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgLQEWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 23:22:10 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0CDC061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 20:21:29 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id f14so2938101pju.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 20:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=56J3qaOMYzA/+1T5W+oLH1TiupUlypnA8W5aLCMjSLo=;
        b=m/9FLS5dMQnznZrHlth63R8gWbczJBX/bl3bd1kZcoZ8RsJ/V7dJlhPIG0oDfPyLKa
         bUrh04CjmuLOoZvCms/lZMqBV9z2unD+qAn76WCGBPlhSYR2c1a5oB8HpgYQV62eNdqQ
         F09Ch8tNx9cflL+uqUy3kCKOhuC5lh7Xb5p3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=56J3qaOMYzA/+1T5W+oLH1TiupUlypnA8W5aLCMjSLo=;
        b=KW35DbFmVKUwpJHf9GX3ZfFqtIezX7aiabjIw1xjU6qXDiVn+Gb7J/82QfBHr8YkXi
         9uEsRmye/TsZbPqwVs55n7Jif3kAqfO6HnQaVMxsMl9FNM4VwaVRmnV3xa3r+HhzQ/gj
         MFh8TxmNgnEz0jUkQeX6GTz+i7viYWJBgwRAy84+jOeAhrQWkRljMWrY3FoH6SoTQRo/
         gT38bOTiJpiaHBznwJoT7UBsWkQj3kycBbNXrTXfqMCBnxlHq36LRpMcw0MPnAEOoCXr
         2S6tit7q066VQQM2esaYuFW0C+sF2Un3oejuQLBUfWGZv1ifdcULNj7BD8kupPgMLv4l
         JVjw==
X-Gm-Message-State: AOAM530KsAqE+IQBMsb2rh2Da0GhnJqplFww2gNYr0ogF7BiCkNQNwQF
        21QQi9D7ZMd2hhbcySpbsPia7A==
X-Google-Smtp-Source: ABdhPJxzzXzT5m33dk7gULeM5Wf8BneMMxxGopySL+rtFo773QqfhBZ51eUEdfg+HMQ1Lv8mqkVm+w==
X-Received: by 2002:a17:90a:1a10:: with SMTP id 16mr5976178pjk.42.1608178889403;
        Wed, 16 Dec 2020 20:21:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id s24sm3919242pfh.47.2020.12.16.20.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 20:21:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201216144114.v2.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid>
References: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201216144114.v2.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid>
Subject: Re: [PATCH v2 2/4] spi: spi-geni-qcom: Fail new xfers if xfer/cancel/abort pending
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Wed, 16 Dec 2020 20:21:27 -0800
Message-ID: <160817888737.1580929.1745000818550256213@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-16 14:41:50)
> If we got a timeout when trying to send an abort command then it means
> that we just got 3 timeouts in a row:
>=20
> 1. The original timeout that caused handle_fifo_timeout() to be
>    called.
> 2. A one second timeout waiting for the cancel command to finish.
> 3. A one second timeout waiting for the abort command to finish.
>=20
> SPI is clocked by the controller, so nothing (aside from a hardware
> fault or a totally broken sequencer) should be causing the actual
> commands to fail in hardware.  However, even though the hardware
> itself is not expected to fail (and it'd be hard to predict how we
> should handle things if it did), it's easy to hit the timeout case by
> simply blocking our interrupt handler from running for a long period
> of time.  Obviously the system is in pretty bad shape if a interrupt
> handler is blocked for > 2 seconds, but there are certainly bugs (even
> bugs in other unrelated drivers) that can make this happen.
>=20
> Let's make things a bit more robust against this case.  If we fail to
> abort we'll set a flag and then we'll block all future transfers until
> we have no more interrupts pending.

Why can't we forcibly roll the ball forward and clear the irq if it's a
cancel/abort that's pending? Basically tell the hardware that we
understand it did the job and canceled things out but our sad little CPU
didn't run that irq handler yet. Here have a cookie and get ready for
the next transfer.

	if (M_CMD_CANCEL_EN || M_CMD_ABORT_EN) /* but not the other irqs like CMD_=
DONE or refill fifos */
		writel(M_CMD_CANCEL_EN | M_CMD_ABORT_EN, se->base + SE_GENI_M_IRQ_CLEAR);

This would let us limp along and try to send another transfer in the
case that we timed out but the transfer went through by servicing our
own interrupt.

>=20
> Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI=
 based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v2:
> - Make this just about the failed abort.
>=20
>  drivers/spi/spi-geni-qcom.c | 56 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index bf55abbd39f1..d988463e606f 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -83,6 +83,7 @@ struct spi_geni_master {
>         spinlock_t lock;
>         int irq;
>         bool cs_flag;
> +       bool abort_failed;
>  };
> =20
>  static int get_spi_clk_cfg(unsigned int speed_hz,
> @@ -141,8 +142,46 @@ static void handle_fifo_timeout(struct spi_master *s=
pi,
>         spin_unlock_irq(&mas->lock);
> =20
>         time_left =3D wait_for_completion_timeout(&mas->abort_done, HZ);
> -       if (!time_left)
> +       if (!time_left) {
>                 dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
> +
> +               /*
> +                * No need for a lock since SPI core has a lock and we ne=
ver
> +                * access this from an interrupt.
> +                */
> +               mas->abort_failed =3D true;
> +       }
> +}
> +
> +static bool spi_geni_is_abort_still_pending(struct spi_geni_master *mas)
> +{
> +       struct geni_se *se =3D &mas->se;
> +       u32 m_irq, m_irq_en;
> +
> +       if (!mas->abort_failed)
> +               return false;
> +
> +       /*
> +        * The only known case where a transfer times out and then a canc=
el
> +        * times out then an abort times out is if something is blocking =
our
> +        * interrupt handler from running.  Avoid starting any new transf=
ers
> +        * until that sorts itself out.
> +        */
> +       m_irq =3D readl(se->base + SE_GENI_M_IRQ_STATUS);
> +       m_irq_en =3D readl(se->base + SE_GENI_M_IRQ_EN);

I suppose this could race with the irq handler. Maybe we should grab the
irq lock around the register reads so we can synchronize with the irq
handler and save a fail?

> +       if (m_irq & m_irq_en) {
> +               dev_err(mas->dev, "Interrupts pending after abort: %#010x=
\n",
> +                       m_irq & m_irq_en);
> +               return true;
> +       }
> +
