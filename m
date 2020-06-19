Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30C71FFF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 02:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgFSAk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 20:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgFSAk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 20:40:27 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FE3C0613EF
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:40:27 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id u15so1908444vkk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6DwgawLhU6PL5FSPvnraXncMLYJIMmvd/uQTqyvjBRY=;
        b=b4NAUMkrGQmHpV5jdeG0KSuh1KHDPIAQYqNtn7SUC2aPU2dvL1ju4YI+HbdSZqCFJ8
         QfFsFtthCw2LnuS9rA3pFMieIjVHb/ZkXE051MmSaYlZym10Ic33NkHUqJYM3EX3pw+1
         xEo2mYq+I7glhqD0CZf6QECXDtBVwBXO031ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DwgawLhU6PL5FSPvnraXncMLYJIMmvd/uQTqyvjBRY=;
        b=qqZWiCSf8cxYZAA2hXDlheSnxF7e1eYG74oK+IMat6JhhfZWe2qkVK5Matd3bwuNI0
         dKHOjQWFkv2rLnlV+DmFOYUNDRWs8nFj9jUyNjult2dcIL+9ilNwqnh5g64lxf/aVRHd
         qJZ6ALtTCOS61iiSOtaOHroGuEmBAS8rDdlsbKOVgIA6tv4PjmQJMQaUGguRQVFAwQv4
         hcSDdPJBrQIGoxmsDMSxLoZ/UiU+itDbJ7QMv1Mbf0D1XmaYc7xKDNYBX1bzNPsqO0gt
         4wIYM+bKPb9X5T90IDY9KEUcaPWB97vgQaJYSBPeSG8TG8eWVs0z1ljaZRuDxOFV/BbC
         mt0g==
X-Gm-Message-State: AOAM533llyZyFzqkZ4iASWWyO8SgaUq5Xr8Q8/XX3K0N66YWQM8pApkt
        edj0bJW/ST8+wCRpEGgGt4HNINdQAlo=
X-Google-Smtp-Source: ABdhPJzFW2wat0rfisjck4Y3Kgf/wp2/5cPDzOIIld8XgWGIBQXF9CyQtsgyDIjv6gR0T8vMaqRKug==
X-Received: by 2002:ac5:c64d:: with SMTP id j13mr5946725vkl.36.1592527226329;
        Thu, 18 Jun 2020 17:40:26 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id n12sm475025uap.8.2020.06.18.17.40.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:40:25 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id g129so4666004vsc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:40:25 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5789198vsd.198.1592527224605;
 Thu, 18 Jun 2020 17:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150626.237027-1-dianders@chromium.org> <20200618233959.160032-2-swboyd@chromium.org>
In-Reply-To: <20200618233959.160032-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 17:40:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W968K6RO0KE5Nq+MNxjN5iw7Ai0Qk0QomMSsKurx9bHA@mail.gmail.com>
Message-ID: <CAD=FV=W968K6RO0KE5Nq+MNxjN5iw7Ai0Qk0QomMSsKurx9bHA@mail.gmail.com>
Subject: Re: [PATCH 7/5] spi: spi-geni-qcom: Don't set {tx,rx}_rem_bytes unnecessarily
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 4:40 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We only need to test for these counters being non-zero when we see the
> end of a transfer. If we're doing a CS change then they will already be
> zero.  This implies that we don't need to set these to 0 if we're
> cancelling an in flight transfer too, because we only care to test these
> counters when the 'DONE' bit is set in the hardware and we've set them
> to non-zero for a transfer.
>
> This is a non-functional change, just cleanup to consolidate code.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 42 ++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 670f83793aa4..828cfc988a3f 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -126,7 +126,6 @@ static void handle_fifo_timeout(struct spi_master *spi,
>          * came in while cancelling.
>          */
>         mas->cur_xfer = NULL;
> -       mas->tx_rem_bytes = mas->rx_rem_bytes = 0;
>         geni_se_cancel_m_cmd(se);
>         spin_unlock_irq(&mas->lock);
>
> @@ -517,29 +516,30 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>                 if (mas->cur_xfer) {
>                         spi_finalize_current_transfer(spi);
>                         mas->cur_xfer = NULL;
> +                       /*
> +                        * If this happens, then a CMD_DONE came before all the
> +                        * Tx buffer bytes were sent out. This is unusual, log
> +                        * this condition and disable the WM interrupt to
> +                        * prevent the system from stalling due an interrupt
> +                        * storm.
> +                        *
> +                        * If this happens when all Rx bytes haven't been
> +                        * received, log the condition. The only known time
> +                        * this can happen is if bits_per_word != 8 and some
> +                        * registers that expect xfer lengths in num spi_words
> +                        * weren't written correctly.
> +                        */
> +                       if (mas->tx_rem_bytes) {
> +                               writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> +                               dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
> +                                       mas->tx_rem_bytes, mas->cur_bits_per_word);
> +                       }
> +                       if (mas->rx_rem_bytes)
> +                               dev_err(mas->dev, "Premature done. rx_rem = %d bpw%d\n",
> +                                       mas->rx_rem_bytes, mas->cur_bits_per_word);

...or we just remove these extra error-checks totally.  ...but if we
want to keep them:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
