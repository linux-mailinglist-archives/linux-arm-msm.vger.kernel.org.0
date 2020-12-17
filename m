Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B360B2DCBB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 05:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgLQE0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 23:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgLQE0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 23:26:01 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8FDC0617A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 20:25:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id j13so3360343pjz.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6YpmiRtm5TYLxKjyInMWvv3ZS0J/mzm9cb49V+YK5kY=;
        b=jEjd3xOf+DpGzmwpy/95puFQaczAqshCh5PqnSejpmWLy6RiOY8LpKZ2ubRRMibLtC
         4xh9z9TXgWssS7G1O6TfNqMNZyD+RN8lTDJWkgoZ8CaMdwRhD8cxysgGbUOQ2r3TI3Gc
         E0yruSO1AyCkeJlL0suLQz9f7aD/uijuNMUu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6YpmiRtm5TYLxKjyInMWvv3ZS0J/mzm9cb49V+YK5kY=;
        b=KdRbvJ6u5Cm37I2XdVygslGnPMsiukeK3IrJL0Cej6q4LKQY9yurH5rYdr5kcuZZrD
         ZeNXsAV0Bl0QyaduR1pVnqOnF0q+9Jl48I0YCotGSwYWgAUUzXYmkKU404t360spq7gx
         4A9NR5rz4J2t3WdtBvUVQgGPnBZua8RQrIaXYqAnWALL6rJaCYxWVJqgZm8YmVkqvBCK
         YXnuZQKubjHGsLhCznTak7rTnFxqefLQCIbpy6NzMp9zuEVfaFN5cK26UPTNNes0OXjh
         UwN+Ccyyw7Evs5PzdlhFmhbOLQsLJfkwif4mqUl1kMXlHFx/58etRXOCvC2gtnVJdANJ
         Iazw==
X-Gm-Message-State: AOAM531EwSzxVESSfqlsKFmzC7yJqAZc1Rmwdb+jNke4B7D9OoGyvNzi
        N0DpOEeDWuhA2wesorxhIntSUA==
X-Google-Smtp-Source: ABdhPJyf8ndvNfZb1sXiq29KhpCPQKFDG9bs5Cg0P/OIuopy6Cof2KQ0lplOFQr5pU0Vmul+AT+c7w==
X-Received: by 2002:a17:90a:9d88:: with SMTP id k8mr6250599pjp.141.1608179120649;
        Wed, 16 Dec 2020 20:25:20 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id l23sm4283040pgm.22.2020.12.16.20.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 20:25:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201216144114.v2.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid>
References: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201216144114.v2.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid>
Subject: Re: [PATCH v2 3/4] spi: spi-geni-qcom: Don't try to set CS if an xfer is pending
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Mark Brown <broonie@kernel.org>
Date:   Wed, 16 Dec 2020 20:25:18 -0800
Message-ID: <160817911850.1580929.16402785505110078436@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-16 14:41:51)
> If we get a timeout sending then this happens:
> * spi_transfer_wait() will get a timeout.
> * We'll set the chip select
> * We'll call handle_err() =3D> handle_fifo_timeout().
>=20
> Unfortunately that won't work so well on geni.  If we got a timeout
> transferring then it's likely that our interrupt handler is blocked,
> but we need that same interrupt handler to adjust the chip select.
> Trying to set the chip select doesn't crash us but ends up confusing
> our state machine and leads to messages like:
>   Premature done. rx_rem =3D 32 bpw8
>=20
> Let's just drop the chip select request in this case.  Sure, we might
> leave the chip select in the wrong state but it's likely it was going
> to fail anyway and this avoids getting the driver even more confused
> about what it's doing.
>=20
> The SPI core in general assumes that setting chip select is a simple
> operation that doesn't fail.  Yet another reason to just reconfigure
> the chip select line as GPIOs.

Indeed.

>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v2:
> - ("spi: spi-geni-qcom: Don't try to set CS if an xfer is pending") new f=
or v2.
>=20
>  drivers/spi/spi-geni-qcom.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index d988463e606f..0e4fa52ac017 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -204,9 +204,14 @@ static void spi_geni_set_cs(struct spi_device *slv, =
bool set_flag)
>                 goto exit;
>         }
> =20
> -       mas->cs_flag =3D set_flag;
> -
>         spin_lock_irq(&mas->lock);
> +       if (mas->cur_xfer) {

How is it possible that cs change happens when cur_xfer is non-NULL?

> +               dev_err(mas->dev, "Can't set CS when prev xfter running\n=
");

xfer? or xfter?

> +               spin_unlock_irq(&mas->lock);
> +               goto exit;
> +       }
> +
> +       mas->cs_flag =3D set_flag;
>         reinit_completion(&mas->cs_done);
