Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F1F2D46FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 17:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbgLIQmO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 11:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732111AbgLIQl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 11:41:59 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61481C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 08:41:19 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id x6so2436729wro.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 08:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZtyuRdRz8sBuacydQZ1U8sV8ePK6VljMJ9YQuTchpwE=;
        b=SGRrDcXx7kpNQT8MctEfTnNV6tsVPXc+l1wPopGzlWU4Bryx5Upueed8qDVEzdrVs8
         GUP3ovO4MBPcAd81XrTibO5WDjJMDmALAps7mLG2kRr/coRbR7IDRt6qbOcXvaN1VCtH
         j22C1KQ1P8v5mmfS7Wt6KQ/FNoZ6QsUZ8zcrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZtyuRdRz8sBuacydQZ1U8sV8ePK6VljMJ9YQuTchpwE=;
        b=BXrYrzKPhurNTlmZo0r9SWZj48+3Ni2yoLC1eR/cByfLI9Vq3r2J8fTOkV5PUIxnun
         oCb1Jj/EUWDbAjyrh6tF8ho/uCJBntrI5mz9JdZQEhaRxUGVk3XyuxGPl9RmBJVJRe/6
         20SYtzixcxqhJnYD5V0Fx+KVYvOXXo/gkZNKdN4UHwhnsl+dfhqsPRs3BXZJqvR+ZoA3
         MVoJCpat0jQzlgG0pD/K58UYEl4JL4mo4EmN8cG6jeJV1ckdsNWIVXpHyTtZwUEm1QUB
         FGOB9MDgkmF5zE53ekOMRTubkGEskjQH/uWxI7f9PX0r6LvBGeaRB3dmykE8AfvzNSRm
         aLIw==
X-Gm-Message-State: AOAM532cEnAJBmaNRY359s80eBa0Xv+8j/y/GGZP3WrJem/ZGeGSqq+u
        aSkbm6CbQTfQXcOCMGYd2VGTCYYKXMWAt93BXvngQQ==
X-Google-Smtp-Source: ABdhPJwEg372av2KNxoGuDDVEL4uVw1qajfMrJ17k9OJ6CGdKJDuSuYJ/scAeKBtFnzbgJfJw2ScvoDjE6gpSjHwQ+A=
X-Received: by 2002:a5d:5146:: with SMTP id u6mr3839567wrt.66.1607532077897;
 Wed, 09 Dec 2020 08:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20201204193540.3047030-1-swboyd@chromium.org> <20201204193540.3047030-3-swboyd@chromium.org>
In-Reply-To: <20201204193540.3047030-3-swboyd@chromium.org>
From:   Simon Glass <sjg@chromium.org>
Date:   Wed, 9 Dec 2020 09:41:06 -0700
Message-ID: <CAPnjgZ3d4pvp1ZMFeSf1zc7oVgUsVYDR-Q8bbQouwowS8jon+Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/chrome: cros_ec_spi: Drop bits_per_word assignment
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, lk <linux-kernel@vger.kernel.org>,
        linux-spi@vger.kernel.org, Benson Leung <bleung@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Dec 2020 at 12:35, Stephen Boyd <swboyd@chromium.org> wrote:
>
> This is already handed by default in spi_setup() if the bits_per_word is
> 0, so just drop it to shave off a line.
>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_spi.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>


>
> diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrome/cros_ec_spi.c
> index f9df218fc2bb..14c4046fa04d 100644
> --- a/drivers/platform/chrome/cros_ec_spi.c
> +++ b/drivers/platform/chrome/cros_ec_spi.c
> @@ -741,7 +741,6 @@ static int cros_ec_spi_probe(struct spi_device *spi)
>         struct cros_ec_spi *ec_spi;
>         int err;
>
> -       spi->bits_per_word = 8;
>         spi->rt = true;
>         err = spi_setup(spi);
>         if (err < 0)
> --
> https://chromeos.dev
>
