Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68175486776
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 17:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241072AbiAFQNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 11:13:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240952AbiAFQNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 11:13:17 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A8BC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 08:13:16 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id o7so3656117ioo.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X5QlOKATkg+9Prd2ezRheoLg8bFfRjYXz/Me8Di8F7c=;
        b=k3wV17DuYBAKkilG5F4sMKLPdAc/udCpFB4Zg7vUaNdHN9hLlS8Y1+LLFS/kzWWNo7
         duV9yRWDKNuuxZ1SkusEk0Bhv/5JHdNKZ3HxDCsIxAvd9u3pgSsGI/9gsKfK3GJP8Zt1
         27kQpJbUxRuz+hcivXUoaFvU8CcUr15OTJpEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5QlOKATkg+9Prd2ezRheoLg8bFfRjYXz/Me8Di8F7c=;
        b=nVt/9E2r6EQYxNgFw/EI2nZG/gqIgiqsQg0he+e3rBqRxDArCe3I1qFTBqYrOj4KY0
         n/gzj1diff/tBDUvjqi01zdlOhtJXPpm8OJ4CWqOgln3I57X6tcWarencDkLEckB9mMn
         0JC8+pWlBr4n2+/m1AwbEK7MGaM8OPi+HVni5XZEtk8/pWLN4lxZNtB4M5hLManyU0Bd
         eQUgV6W3y0YkfBj63ZC0mAYPm2Z72Y9a/iCXmzHFGs7Ybdg9VjcgrBYySBewcEW70ylI
         7w6FZsnjzbmLfKT39/YBIyDzS9RDRGytph1qm4WtdIqv36XgPtLEy1RQRGrIp2yoCbdU
         1tww==
X-Gm-Message-State: AOAM533IWJJSiwIpiL/15odE24up5QJYS4l6kcXo35dK4fr+aAzF93Nb
        vNlFDhbctPV4UKNJNCsOI9AtS8PsqbMUKQ==
X-Google-Smtp-Source: ABdhPJzk8trPc+6VB8NFnN9wWURvrUsAT3IHq09orErxK7uE1YYCmiCO83/uI4lp+SScFEXdG2iGvQ==
X-Received: by 2002:a05:6602:2ac5:: with SMTP id m5mr27597789iov.156.1641485596112;
        Thu, 06 Jan 2022 08:13:16 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id f12sm1312859ilu.39.2022.01.06.08.13.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 08:13:15 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id o1so2292827ilo.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 08:13:15 -0800 (PST)
X-Received: by 2002:a05:6e02:2187:: with SMTP id j7mr27894010ila.120.1641485595294;
 Thu, 06 Jan 2022 08:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20220103071118.27220-1-vkoul@kernel.org>
In-Reply-To: <20220103071118.27220-1-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Jan 2022 08:13:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ue9Z+NmqviCXEN2pHxWZaAcTbFzzn=xxfg8d8QzPwp4A@mail.gmail.com>
Message-ID: <CAD=FV=Ue9Z+NmqviCXEN2pHxWZaAcTbFzzn=xxfg8d8QzPwp4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] spi: qcom: geni: set the error code for gpi transfer
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Jan 2, 2022 at 11:11 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> Before we invoke spi_finalize_current_transfer() in
> spi_gsi_callback_result() we should set the spi->cur_msg->status as
> appropriate (0 for success, error otherwise).
>
> The helps to return error on transfer and not wait till it timesout on
> error
>
> Fixes: b59c122484ec ("spi: spi-geni-qcom: Add support for GPI dma")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>
> Changes in v2:
>  - add missing spi_finalize_current_transfer() for dma error case
>
>  drivers/spi/spi-geni-qcom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 413fa1a7a936..b82f3ddff0f4 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -346,17 +346,21 @@ spi_gsi_callback_result(void *cb, const struct dmaengine_result *result)
>  {
>         struct spi_master *spi = cb;
>
> +       spi->cur_msg->status = -EIO;
>         if (result->result != DMA_TRANS_NOERROR) {
>                 dev_err(&spi->dev, "DMA txn failed: %d\n", result->result);
> +               spi_finalize_current_transfer(spi);
>                 return;
>         }
>
>         if (!result->residue) {
> +               spi->cur_msg->status = 0;
>                 dev_dbg(&spi->dev, "DMA txn completed\n");
> -               spi_finalize_current_transfer(spi);
>         } else {
>                 dev_err(&spi->dev, "DMA xfer has pending: %d\n", result->residue);
>         }
> +
> +       spi_finalize_current_transfer(spi);
>  }

What you have here should work and seems fine, though it's a bit
awkward. Every exit path now calls spi_finalize_current_transfer().
IMO this would be slightly cleaner like this (also moving the error
cases to both be first)

if (result->result != DMA_TRANS_NOERROR) {
  dev_err(...);
} else if (result->residue)
  dev_err(...);
} else {
  spi->cur_msg->status = 0;
  dev_dbg(...);
}

spi_finalize_current_transfer(spi);

I'll let Mark decide if he wants it to be respun with the above, wants
a follow-on patch, or doesn't care either way. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
