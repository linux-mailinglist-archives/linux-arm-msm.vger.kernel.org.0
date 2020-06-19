Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB11E1FFF65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 02:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgFSAlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 20:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgFSAlN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 20:41:13 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB7EC0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:41:12 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id w20so2620412uaa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uy5QSqrLYmnNfM/E3HqOfk0DC/EqnnxRUjL0YSZ6WgA=;
        b=Y7rVoh+ec4gvOWgtKpj1Vsh0QvK0RKO04loIzF9Re5iG2Mn3PaMhiKaKhmQ4K89iQX
         J4y+p2BKyyFUI702a+LS9XzNcrElaD7ju6TRYuaV67aduc1HkNeWl8LB7KG/FwgZP0Lh
         P9C0n/RxLEFHwvxs46VLMJ74VyFL9/O7576nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uy5QSqrLYmnNfM/E3HqOfk0DC/EqnnxRUjL0YSZ6WgA=;
        b=UGn9nl6L1gRPA/ptdVog4YO6s8EWL6wBnShf/OHfoUKKcVg2tAXSFGV6DaXh6VRsQa
         m0rN6gJgGi+SkamGI9bzp3RQ+xdJk7y9tOVntue8fBa5tIQFPoiiYOq+QyBMmhf/4cJu
         cgX5q1aqegfsA4qeI+r/LWhWccMEvArIVXYQ6jxrOKR+2N43dfFdDcb9btr6i9At9VxU
         6x3o/lhSTzUV2B+7noIiYOlSXpbaOcQzjqRStIcNY1M5MJQ5OpTl7867aZQZwbPJtPXf
         iAF6K1S9I2k1V4eOtQ/aBullltPscBfCJLgr4fOTEzQLCLnvPu0oGoMOqdUjp2qtzs1L
         Ckjw==
X-Gm-Message-State: AOAM531gkuNXvflutu265lIIMTaORAye9nJ2rJw5NAM25XFLYCrk9Kb+
        KigkiGaAp1PyVcnyaUXCot2AwtRCyAQ=
X-Google-Smtp-Source: ABdhPJwMnKMzVfR028UYnn1WJbI7lAXMPFm82VVivzC0PYIclr2VKiS7L/f5cyLi6OwUzXVgORqJig==
X-Received: by 2002:ab0:6a1:: with SMTP id g30mr794560uag.133.1592527271750;
        Thu, 18 Jun 2020 17:41:11 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id r139sm544961vkr.20.2020.06.18.17.41.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 17:41:11 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id r5so2107030vso.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 17:41:10 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr5773162vsm.73.1592527270545;
 Thu, 18 Jun 2020 17:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200618150626.237027-1-dianders@chromium.org> <20200618233959.160032-1-swboyd@chromium.org>
In-Reply-To: <20200618233959.160032-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 17:40:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UwXKQcDPhqb0j+x-+kU1ZdBjVx52aY1JHx6oJRMLUPrg@mail.gmail.com>
Message-ID: <CAD=FV=UwXKQcDPhqb0j+x-+kU1ZdBjVx52aY1JHx6oJRMLUPrg@mail.gmail.com>
Subject: Re: [PATCH 6/5] spi: spi-geni-qcom: Simplify setup_fifo_xfer()
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
> The definition of SPI_FULL_DUPLEX (3) is really SPI_TX_ONLY (1) ORed
> with SPI_RX_ONLY (2). Let's drop the define and simplify the code here a
> bit by collapsing the setting of 'm_cmd' into conditions that are the
> same.
>
> This is a non-functional change, just cleanup to consolidate code.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 636c3da15db0..670f83793aa4 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -51,7 +51,6 @@
>  /* M_CMD OP codes for SPI */
>  #define SPI_TX_ONLY            1
>  #define SPI_RX_ONLY            2
> -#define SPI_FULL_DUPLEX                3
>  #define SPI_TX_RX              7
>  #define SPI_CS_ASSERT          8
>  #define SPI_CS_DEASSERT                9
> @@ -357,12 +356,6 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>
>         mas->tx_rem_bytes = 0;
>         mas->rx_rem_bytes = 0;
> -       if (xfer->tx_buf && xfer->rx_buf)
> -               m_cmd = SPI_FULL_DUPLEX;
> -       else if (xfer->tx_buf)
> -               m_cmd = SPI_TX_ONLY;
> -       else if (xfer->rx_buf)
> -               m_cmd = SPI_RX_ONLY;
>
>         spi_tx_cfg &= ~CS_TOGGLE;
>
> @@ -373,12 +366,14 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>         len &= TRANS_LEN_MSK;
>
>         mas->cur_xfer = xfer;
> -       if (m_cmd & SPI_TX_ONLY) {
> +       if (xfer->tx_buf) {
> +               m_cmd |= SPI_TX_ONLY;
>                 mas->tx_rem_bytes = xfer->len;
>                 writel(len, se->base + SE_SPI_TX_TRANS_LEN);
>         }
>
> -       if (m_cmd & SPI_RX_ONLY) {
> +       if (xfer->rx_buf) {
> +               m_cmd |= SPI_RX_ONLY;

If you're going to touch this, could you change "SPI_TX_ONLY" to
"SPI_TX_ENABLED" and "SPI_RX_ONLY" to 'SPI_RX_ENABLED".  It felt
really weird to me that if you had full duplex you were setting
"RX_ONLY" and "TX_ONLY".

Other than that, your change is nice and cleans things up a bit, so
even if you don't do the extra cleanup:

Reviewed-by: Douglas Anderson <dianders@chromium.org>



-Doug
