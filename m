Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDBC2D9C38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 17:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440082AbgLNQKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 11:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439519AbgLNQJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 11:09:54 -0500
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35669C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 08:09:10 -0800 (PST)
Received: by mail-vk1-xa41.google.com with SMTP id u67so4023012vkb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2aQQjeTAClD8BnlUklr8QIojrz0VDK1/YhYYkZp+14=;
        b=kIZlPMONz6lBq/gIOydcXGUjcQ0cvnJfuO8mypCn3kXK71AWGykGUryj8sLmqsAdFI
         ZUJzP+cGLH/fV3IW7Je5UBQzqFi7Be020MjYizulu8XR/il87US8F0Cbs4ZPNqvxhzl1
         oMJBu2XlH9E252F3Bb3qbUdtEo+LtrF9WOVHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2aQQjeTAClD8BnlUklr8QIojrz0VDK1/YhYYkZp+14=;
        b=ZHPhXOE3afP5Q1UFjadLIGUM6M33knZue6ymrn9ygXjr86TfJ+QGhoZSnRyONbWbdR
         CZK1M2Ggq5axd2gB2OhhvO9lZdbc4ViWGhWzWhm5eRQh51jkik1ekrk0v8LEennScnoW
         688+EAxtpxQfFEexKnt0VFe0fijc/dlWEnSHVjT5Tnu3PM2HyCYDGKNQVhgl37TxtoG7
         p49y96NyUW0Mg5J9etfOUl5acxyOLqm3T563GgLUH93q2WmEVJ8tP5UwPNLzeHiMEEtT
         Fml9jRK23g1f35Z9uIGCgz78X6ukOQ1FWAW/DRxHatTWPaPldMQiGOSrXq0BzL7g21ml
         6ZoQ==
X-Gm-Message-State: AOAM5335l8bzLjqyGFJM5indAZbNGTR9aMAiUSsIa/uP1MEilXzf0k84
        5PMKF/O3xSP/9eExQCDWfMBEC1X2n3M+Zw==
X-Google-Smtp-Source: ABdhPJw7Py2+eVt9cRly6satm4a5amBtXiB8xVOaVV3LYFg/WlrdyE7bSgAJY8UDYFTtl99QyHZ6ZQ==
X-Received: by 2002:ac5:cc75:: with SMTP id w21mr9207757vkm.14.1607962148878;
        Mon, 14 Dec 2020 08:09:08 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id h124sm567865vkg.49.2020.12.14.08.09.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Dec 2020 08:09:07 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id 4so5623631uap.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 08:09:07 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr23719280uaa.104.1607962147154;
 Mon, 14 Dec 2020 08:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20201213052948.308263-1-swboyd@chromium.org>
In-Reply-To: <20201213052948.308263-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Dec 2020 08:08:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WWe-0v1=kzw4XGQ9TFUkFcf2nAx0so6TFBg74JH6bVmw@mail.gmail.com>
Message-ID: <CAD=FV=WWe-0v1=kzw4XGQ9TFUkFcf2nAx0so6TFBg74JH6bVmw@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-qcom-qspi: Use irq trigger flags from firmware
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Dec 12, 2020 at 9:29 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We don't need to force this to be trigger high here, as the firmware
> properly configures the irq flags already. Drop it to save a line.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/spi/spi-qcom-qspi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 5eed88af6899..8e70f5e63e0b 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -516,8 +516,7 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>         ret = platform_get_irq(pdev, 0);
>         if (ret < 0)
>                 goto exit_probe_master_put;
> -       ret = devm_request_irq(dev, ret, qcom_qspi_irq,
> -                       IRQF_TRIGGER_HIGH, dev_name(dev), ctrl);
> +       ret = devm_request_irq(dev, ret, qcom_qspi_irq, 0, dev_name(dev), ctrl);

I don't feel that the old code is really wrong, but I guess it is
weird that it's double-specified (both in the code and in the dts).
...so this is OK w/ me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
