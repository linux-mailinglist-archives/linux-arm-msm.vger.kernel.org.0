Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179122DA63F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 03:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgLOCaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 21:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbgLOCaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 21:30:19 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3DEC0617A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:29:35 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id b8so4151060plx.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 18:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=R317vm0CiY7uwAP0g5dRDwz/Va8bv8HoPU2xwOLWQGM=;
        b=bC0V5JbQhUag6dBTKffQMyhP0+g2vhJIZpYiu+HcMhKp4v5p4rzWobPLz4ki2pv1TG
         0qb9hYvWfqhtZekRNpHLaVQB2i7BR/zNrGcUh4oGR/xWZSEJhEx+hsv6HdtRSGskvYEE
         m5JxsD/f5L98s5y1+RhJmzArGuOtyrDrR7w1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=R317vm0CiY7uwAP0g5dRDwz/Va8bv8HoPU2xwOLWQGM=;
        b=WB+nJwBV4aui6OAjLQ7h29J3JjvNBZ6don+YCeNqj3fOU1on3BZoA5Y6rnju9uE6b4
         r3d1zNLmuDAMayP1Do1UVoATYznBHt1BFGoZHUyYucEWfRxHEy1w9xfNQcJnx4O7TI2O
         AniKDhijdv5XloIYMmSP6s0SEh/Cu4POSawDJT5zLw7lwwx+S+jsurLabIbvafKCMCvT
         nFKwDVOE5JuU5YutqJVCS1o7Blm15zP1DaI6JR/4l9md02qhkm6GgZgc06TqDYpdrrxj
         kir1iOIs/eE/FNjWX10QldTVIrF/b0/1U+7PFzL8fcMmlMjJnmIKwcgAr8mKS58c3vzI
         wIKg==
X-Gm-Message-State: AOAM533RZtYaoxaLzTUkPCvA33wzmKEb277v1cpNjM+cCUG8kdPqdx8j
        FgFZlxs0Tz6p0/ExhesPiubTGQ==
X-Google-Smtp-Source: ABdhPJyVx26L4lt7/ql4izUo0E4N0dbTUN3MpPPVWoydnM9Ubyf9ws/VPNQ2fkvKZM5BbBpsXVtXSA==
X-Received: by 2002:a17:90a:a502:: with SMTP id a2mr24162692pjq.155.1607999372623;
        Mon, 14 Dec 2020 18:29:32 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id b26sm21766115pgm.25.2020.12.14.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 18:29:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201214162937.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
References: <20201214162937.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
Subject: Re: [PATCH 1/2] spi: spi-geni-qcom: Fix geni_spi_isr() NULL dereference in timeout case
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Mon, 14 Dec 2020 18:29:30 -0800
Message-ID: <160799937019.1580929.2975094455755766017@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-14 16:30:18)
> In commit 7ba9bdcb91f6 ("spi: spi-geni-qcom: Don't keep a local state
> variable") we changed handle_fifo_timeout() so that we set
> "mas->cur_xfer" to NULL to make absolutely sure that we don't mess
> with the buffers from the previous transfer in the timeout case.
>=20
> Unfortunately, this caused the IRQ handler to dereference NULL in some
> cases.  One case:
>=20
>  CPU0                           CPU1
>  ----                           ----
>                                 setup_fifo_xfer()
>                                  ...
>                                  geni_se_setup_m_cmd()
>                                  <hardware starts transfer>
>  <unrelated interrupt storm>     spin_unlock_irq()
>  <continued interrupt storm>    <time passes>

Use ... for "time passes"

>  <continued interrupt storm>    <transfer complets in hardware>

s/complets/completes/

>  <continued interrupt storm>    <hardware sets M_RX_FIFO_WATERMARK_EN>

I'd rather just say handle_irq() or something instead of have <continued
interrupt storm> over here. Would make it easier to read and we can then
just assume that the geni_spi_isr() hasn't run. Or nothing at all and
just indicate that the irq for geni_spi_isr() comes in after the timeout
handling code.

>  <continued interrupt storm>    <time passes>
>  <continued interrupt storm>    handle_fifo_timeout()
>  <continued interrupt storm>     spin_lock_irq()
>  <continued interrupt storm>     mas->cur_xfer =3D NULL

From here

>  <continued interrupt storm>     geni_se_cancel_m_cmd()
>  <continued interrupt storm>     spin_unlock_irq()
>  <continued interrupt storm>     wait_for_completion_timeout() =3D> timeo=
ut
>  <continued interrupt storm>     spin_lock_irq()
>  <continued interrupt storm>     geni_se_abort_m_cmd()
>  <continued interrupt storm>     spin_unlock_irq()
>  <continued interrupt storm>     wait_for_completion_timeout() =3D> timeo=
ut

to here, these lines can be left out?

>  <interrupt storm ends>
>  geni_spi_isr()
>   spin_lock()
>   if (m_irq & M_RX_FIFO_WATERMARK_EN)
>    geni_spi_handle_rx()
>     mas->cur_xfer NULL derefrence

s/derefrence/dereference/

Here's a shortened version:

  CPU0                           CPU1
  ----                           ----
                                 setup_fifo_xfer()
                                  geni_se_setup_m_cmd()
                                 <hardware starts transfer>
                                 <transfer completes in hardware>
                                 <hardware sets M_RX_FIFO_WATERMARK_EN in m=
_irq>
				 ...
                                 handle_fifo_timeout()
                                  spin_lock_irq(mas->lock)
                                  mas->cur_xfer =3D NULL
                                  geni_se_cancel_m_cmd()
                                  spin_unlock_irq(mas->lock)

  geni_spi_isr()
   spin_lock(mas->lock)
   if (m_irq & M_RX_FIFO_WATERMARK_EN)
    geni_spi_handle_rx()
     mas->cur_xfer NULL dereference!

Two CPUs also don't really matter but I guess that's fine.

>=20
> Specifically it should be noted that the RX/TX interrupts are still
> shown asserted even when a CANCEL/ABORT interrupt has asserted.

Can we have 'TL;DR: Seriously delayed interrupts for RX/TX can lead to
timeout handling setting mas->cur_xfer to NULL.'?

>=20
> Let's check for the NULL transfer in the TX and RX cases.

and reset the watermark or clear out the fifo respectively to put the
hardware back into a sane state.

>=20
> NOTE: things still could get confused if we get timeouts all the way
> through handle_fifo_timeout(), meaning that interrupts are still
> pending.  A future patch will help these corner cases.
>=20
> Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI=
 based QUP")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  drivers/spi/spi-geni-qcom.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 25810a7eef10..6f736e94e9f4 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -354,6 +354,12 @@ static bool geni_spi_handle_tx(struct spi_geni_maste=
r *mas)
>         unsigned int bytes_per_fifo_word =3D geni_byte_per_fifo_word(mas);
>         unsigned int i =3D 0;
> =20
> +       /* Stop the watermark IRQ if nothing to send */
> +       if (mas->cur_xfer =3D=3D NULL) {
> +               writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> +               return false;
> +       }
> +
>         max_bytes =3D (mas->tx_fifo_depth - mas->tx_wm) * bytes_per_fifo_=
word;
>         if (mas->tx_rem_bytes < max_bytes)
>                 max_bytes =3D mas->tx_rem_bytes;
> @@ -396,6 +402,17 @@ static void geni_spi_handle_rx(struct spi_geni_maste=
r *mas)
>                 if (rx_last_byte_valid && rx_last_byte_valid < 4)
>                         rx_bytes -=3D bytes_per_fifo_word - rx_last_byte_=
valid;
>         }
> +
> +       /* Clear out the FIFO and bail if nowhere to put it */
> +       if (mas->cur_xfer =3D=3D NULL) {

I think if (!mas->cur_xfer) is more kernel idiomatic, but sure.

> +               unsigned int words =3D DIV_ROUND_UP(rx_bytes, bytes_per_f=
ifo_word);

Any chance to move this define up to the start of the function instead
of putting it here inside the if? Or just stick it into the for loop.
It's to avoid shadow variables.

> +
> +               for (i =3D 0; i < words; i++)

		while (i++ < DIV_ROUND_UP(rx_bytes, bytes_per_fifo_word))
			readl(se->base + SE_GENI_RX_FIFOn);

> +
> +               return;
> +       }
> +
>         if (mas->rx_rem_bytes < rx_bytes)
>                 rx_bytes =3D mas->rx_rem_bytes;
>
