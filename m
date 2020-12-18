Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99D42DDD1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Dec 2020 03:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732640AbgLRCzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 21:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732637AbgLRCzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 21:55:10 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8484FC061257
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:54:25 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id x18so626737pln.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 18:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=rrllBpnp4dHH66IT17U+etvLo5A8oP1vD6jgIF9ao0g=;
        b=gor3akWuo+7cprqkN4N3iqs/ZgKCP/R1OxvXJ8vU/zhLhX5plRELQlSB2XPDENU705
         KqCKsAoJraegllfTGscnNcM+9R0yqHCgFhM8jZVSGuRsnTBOr+Uj9xBR0vg0U9OVV6o/
         YdojdU9tE2EGO38kzM26X2WhQ8sqzh5tB7JqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=rrllBpnp4dHH66IT17U+etvLo5A8oP1vD6jgIF9ao0g=;
        b=OPpA+MfhvBEa+jhIrWgvRafCdrv+QfH5nq1KRAh2bDgo8r73OvpIL3itct3+yB2NHd
         aszQ6Snqkg6ataTA7gS2fh/3Nrzw40SeOuvxOPIKH8tIIRs3h4taYAzcp1Azh8T77dE1
         S3TcUC5VJfZ6rETAexwvDU+0B5OLm9e48pvs2gm6XlbYXOdMDaIC/8Ygsj6aZdATBWR1
         srJCLqVQ0X8FSBZpCFWI0u+LCuXm9qOg0GQqCELA8Xe0jhGBWltA5UWNZ+bTYulWI6Ve
         9ac0KZq57OPqOOcvVQHASzfOsKQxnoUUfvicEsksOmp43k0g1dCoWNCkCARBIuObXmK6
         BT3Q==
X-Gm-Message-State: AOAM5337xLXTfdcJFMAxJjDQ4vZD6syHEMU8MJAYeqIOH8OArTzof2mB
        QCpWDSwYdy74eYS2E0RBZSIDOg==
X-Google-Smtp-Source: ABdhPJyBKW3LOBc6pAdOTSVesIwljaCWcgND1kVIUwdAQj2dhzwUYKQllv/N0PCNy+r5HHQkb7bx2A==
X-Received: by 2002:a17:90a:5887:: with SMTP id j7mr2136307pji.79.1608260065154;
        Thu, 17 Dec 2020 18:54:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id mq8sm5543268pjb.13.2020.12.17.18.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 18:54:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201217142842.v3.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid>
References: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid> <20201217142842.v3.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid>
Subject: Re: [PATCH v3 3/4] spi: spi-geni-qcom: Don't try to set CS if an xfer is pending
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
Date:   Thu, 17 Dec 2020 18:54:23 -0800
Message-ID: <160826006320.1580929.12847315427212664109@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-12-17 14:29:13)
> If we get a timeout sending then this happens:
>=20
> spi_transfer_one_message()
>  ->transfer_one() AKA spi_geni_transfer_one()
>   setup_fifo_xfer()
>    mas->cur_xfer =3D non-NULL
>  spi_transfer_wait() =3D> TIMES OUT
>  if (msg->status !=3D -EINPROGRESS)
>   goto out
>  if (ret !=3D 0 ...)
>   spi_set_cs()
>    ->set_cs AKA spi_geni_set_cs()
>     # mas->cur_xfer is non-NULL
>=20
> The above happens _before_ the SPI core calls ->handle_err() AKA
> handle_fifo_timeout().
>=20
> Unfortunately that won't work so well on geni.  If we got a timeout
> transferring then it's likely that our interrupt handler is blocked,
> but we need that same interrupt handler to run and the command channel
> to be unblocked in order to adjust the chip select.  Trying to set the
> chip select doesn't crash us but ends up confusing our state machine
> and leads to messages like: Premature done. rx_rem =3D 32 bpw8
>=20
> Let's just drop the chip select request in this case.  We can detect
> the case because cur_xfer is non-NULL--it would have been set to NULL
> in the interrupt handler if the previous transfer had finished.  Sure,
> we might leave the chip select in the wrong state but it's likely it
> was going to fail anyway and this avoids getting the driver even more
> confused about what it's doing.
>=20
> The SPI core in general assumes that setting chip select is a simple
> operation that doesn't fail.  Yet another reason to just reconfigure
> the chip select line as GPIOs.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
