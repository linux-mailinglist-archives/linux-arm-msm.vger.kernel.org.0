Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C82445509F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 23:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbhKQWlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 17:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241239AbhKQWlF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 17:41:05 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB961C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:06 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id z18so5396506iof.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUpr14WULbylEmtF7t956SPZXS+VuuZpnqfZu1X3c5o=;
        b=XovnTv5J+ql5NGvS2VHagQDr5MzDYW2wzrdNHzt+pM0O1uc9Y7m66mLBrS6Eb8XdFh
         ctOxYw0O6dU8eAZ2n3iXfnBjSLYy0SvSjcm7Iw61g4xawTQtMYZKquHcllOB8QPoeBgK
         Ax7TGJln9rVvc7kOqw9IsuP1KFBhKatULyfVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUpr14WULbylEmtF7t956SPZXS+VuuZpnqfZu1X3c5o=;
        b=Wm1kF5r3smhkyxOiLcZ0Dkc4qfPDrvgnN0kB3tAHCN5vfSJvUG6DDNVT8n8/6Ch1AI
         Kn5ixVYCbyB+b6oxq5IEXLWiupOvc8JaicnuhSGEvwqkNlQGReyeRuJLv/lc4M2DwR8C
         HRGJaoGZvAWVD4hrlunsTl42KKO712uVOLNsvnEtRKJiaZ8SfFm6+PKUVF8tc+cGUO09
         3HkhdeEyUBeGFKbdLZu3uLuuwVV6qcGkbV6r7Z1YkxzGqNImgPwrqbLPOtuIu/zeE4GR
         +qDEMdoG2AF1jqTw/hOYHPbm9xmIzFNV0AauQIYML7gVOQQza+bZFMQq8FVD4hAF5s8B
         RkFw==
X-Gm-Message-State: AOAM532lGRJ7UGPA72PXwCPVf9Ls+/gu4nmbJRKnsromEAzMH4EfOsOJ
        gJ5e5VZZVEcKOD/quetVC4cF5MIouqsFAA==
X-Google-Smtp-Source: ABdhPJy/ppXZ2NIlAg6Cd+dKHf57ned25EEnTIKBRKpBm5E+PtTL+M9fnD9B6KFTnk+Khv9J8lFP4Q==
X-Received: by 2002:a05:6638:d08:: with SMTP id q8mr16654301jaj.38.1637188686087;
        Wed, 17 Nov 2021 14:38:06 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id a18sm613526ioe.13.2021.11.17.14.38.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 14:38:05 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id y16so5379826ioc.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 14:38:05 -0800 (PST)
X-Received: by 2002:a05:6602:8ce:: with SMTP id h14mr13375797ioz.177.1637188684807;
 Wed, 17 Nov 2021 14:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20211117133110.2682631-1-vkoul@kernel.org> <20211117133110.2682631-3-vkoul@kernel.org>
In-Reply-To: <20211117133110.2682631-3-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Nov 2021 14:37:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8Ac0MY9yG7qdqunX4C592_Zrc_Lh-tf-OAVKDi0YOKw@mail.gmail.com>
Message-ID: <CAD=FV=U8Ac0MY9yG7qdqunX4C592_Zrc_Lh-tf-OAVKDi0YOKw@mail.gmail.com>
Subject: Re: [PATCH 3/3] spi: qcom: geni: handle timeout for gpi mode
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 17, 2021 at 5:31 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We missed adding handle_err for gpi mode, so add a new function
> spi_geni_handle_err() which would call handle_fifo_timeout() or newly
> added handle_gpi_timeout() based on mode
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

Fixes: b59c122484ec ("spi: spi-geni-qcom: Add support for GPI dma")
Reported-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>


> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index b9769de1f5f0..5b6e9a6643d8 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -164,6 +164,30 @@ static void handle_fifo_timeout(struct spi_master *spi,
>         }
>  }
>
> +static void handle_gpi_timeout(struct spi_master *spi, struct spi_message *msg)
> +{
> +       struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +
> +       dmaengine_terminate_sync(mas->tx);
> +       dmaengine_terminate_sync(mas->rx);
> +}
> +
> +static void spi_geni_handle_err(struct spi_master *spi, struct spi_message *msg)
> +{
> +       struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +
> +       switch (mas->cur_xfer_mode) {
> +       case GENI_SE_FIFO:
> +               handle_fifo_timeout(spi, msg);
> +               break;
> +       case GENI_GPI_DMA:
> +               handle_gpi_timeout(spi, msg);

Slight nit that maybe you should call it handle_gpi_err() instead of
handle_gpi_timeout(). As I understand it this function will get called
for _all_ errors, including errors reported by
spi_gsi_callback_result(). So basically if you have residue then
you'll immediately finalize the transfer with -EIO in the status and
then spi_geni_handle_err() will get called. It seems a little strange
that it then goes and calls a function whose name makes it sound as if
it's only called for "timeout". (For the FIFO case we actually only
hit this for timeouts since we don't currently terminate transfers
early for errors, so the FIFO name is actually OK).

-Doug
