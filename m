Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3652525BC74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 10:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgICILf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 04:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgICILG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 04:11:06 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490A0C061251
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 01:10:55 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id q13so1215770vsj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vKxy+BrmTM4erbpnPuK1egVjffH6omXH5GzoO/2vE8=;
        b=BGahHi6rbzLUYAczxpoLOJeX76V5ePq6YWfzkIwa5saJL7xUSVSICFCjkHep3epSJu
         rj+jUuLnHYK32M8oSkW8+gX+3ldm76XAHBm8ucUvrdnKGglYNa8HHMNqFlbogIUcaI5C
         Z6mB9DQo/5HjX8TIrJ2syEftgA4yQiLeMWsrlVPiSP5j/0WyJ8PymoCJ9t4j6+cIPlZa
         3WUJJDOAAlQlq/jZGMpLJM7nkpB29yPtyG5zqbB9yGNGQp3bHkZbUs9sosiPXKECiMiv
         qf9fXJiTMt+Pk0ox4OVvfUoSGijk9thIg1ULv6G0vF1x9q5e3mhfcikygDNoODWOpTxC
         sEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vKxy+BrmTM4erbpnPuK1egVjffH6omXH5GzoO/2vE8=;
        b=JFgi1cmTY+WNvlVG7aw8o7gLBaejD3I67MY1oGv+VzXLa3BsTqaVeI0dSigEUIf6ys
         cpf2Dxxcvdezj9fEanqRsHYya+A0h0DgZxPEWOJvDn6XUhmWxpcd1mTkLjyNAI2hjV+V
         Palk00pf6ywSn5O+EjfXEcRNVhE9RP6yYX1Yskr70xvOKEQ9P93Lm3cXV+IaQqZ6Z/mR
         Pvev9UHUZ5wqN0Od8MRluCeJYhH2bFqiieSLnyKykejepiQaqVhXb+HhJY8s/wlztlYj
         q//gMoqqRO1VOkoe2QWfdQslXY1epT6YLxn/lyeddDc9LC06sDmU0otzaD5rr0iRUguJ
         8SQA==
X-Gm-Message-State: AOAM532/osk30dRanUzOqt6ZgMhC7jLVvs2cRPi4jsbZ0xsVuZjz6l7L
        au4YMmVDizDSfWlgfmSLN4bTB9mnloHOTDNNBvQXnw==
X-Google-Smtp-Source: ABdhPJxfYTnSYJGxu7eCAxgLLa9ss8++NvwiXEVkjxbE5o6nKhbHft/MCQxM3aY3B+PhB/1QvL5Twv2LkkutkBBczpQ=
X-Received: by 2002:a67:f947:: with SMTP id u7mr841916vsq.135.1599120654486;
 Thu, 03 Sep 2020 01:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200902164303.1.I5e598a25222b4534c0083b61dbfa4e0e76f66171@changeid>
In-Reply-To: <20200902164303.1.I5e598a25222b4534c0083b61dbfa4e0e76f66171@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Sep 2020 10:10:17 +0200
Message-ID: <CAPDyKFoyKjKhwKGtLMtEyDSeSiBU6wasc=jt6c=sHnhN8jqqjg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-msm: Prefer asynchronous probe
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Sep 2020 at 01:43, Douglas Anderson <dianders@chromium.org> wrote:
>
> Turning on initcall debug on one system showed this:
>   initcall sdhci_msm_driver_init+0x0/0x28 returned 0 after 34782 usecs
>
> The lion's share of this time (~33 ms) was in mmc_power_up().  This
> shouldn't be terribly surprising since there are a few calls to delay
> based on "power_delay_ms" and the default delay there is 10 ms.
>
> Because we haven't specified that we'd prefer asynchronous probe for
> this driver then we'll wait for this driver to finish before we start
> probes for more drivers.  While 33 ms doesn't sound like tons, every
> little bit counts.
>
> There should be little problem with turning on asynchronous probe for
> this driver.  It's already possible that previous drivers may have
> turned on asynchronous probe so we might already have other things
> (that probed before us) probing at the same time we are anyway.  This
> driver isn't really providing resources (clocks, regulators, etc) that
> other drivers need to probe and even if it was they should be handling
> -EPROBE_DEFER.
>
> Let's turn this on and get a bit of boot speed back.

Thanks for a very well written commit message!

Indeed, I am sure many mmc host drivers could benefit from a similar
change. At least regular platform drivers and amba drivers are pretty
sure to work, but who knows.

>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index d4c02884cca8..9dd0dbb65382 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2542,6 +2542,7 @@ static struct platform_driver sdhci_msm_driver = {
>                    .name = "sdhci_msm",
>                    .of_match_table = sdhci_msm_dt_match,
>                    .pm = &sdhci_msm_pm_ops,
> +                  .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>         },
>  };
>
> --
> 2.28.0.402.g5ffc5be6b7-goog
>
