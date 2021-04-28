Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD8636D3F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 10:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbhD1Iap (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 04:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhD1Iap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 04:30:45 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75CBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 01:30:00 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id t22so8963356pgu.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X3yT5TmoSLSmrok+Crx8M3QcwMZEOV/qAXHZ0pyFZQQ=;
        b=NmFsFFy4JyKRlWwG4SAGhGeyQ2DH/Sw3keP+7sjtOe1hFGk0zSokCAtxFiVKqQYuiY
         R+vdts7oxhszAeMpNiYcY8IFwqoeHJ87M8qLs3zimY83kZRtsVQcW/BrX4FISaKLg6nz
         CFil30c3r6NcjtKzFjtYYIfFFc0IYQhZNU7UgSxwC1eoxneA2BqilDwmSv72Y98Bfk6u
         Fh87cmHE4/wMyVG8KtcdMkHe5+x8m6NHk2V+IMeONpBIcW/NzkOMy/WRkkHGNfrFnkd/
         6C88XHDmUGmYmBTcXbmSukAnyE/qF42eBVi6cTyzi7T54amFd9uZndBILpH2cKLy9FJy
         ePwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X3yT5TmoSLSmrok+Crx8M3QcwMZEOV/qAXHZ0pyFZQQ=;
        b=JJJpeGnkpHIdrEqx/fwYVzHz10Ltkr2vguiDnj5cg493IQeWr6tw9EW4+iw9p3dNZ/
         uNO3oepZYcJJn4as7WOq1oGfUTfsBINNc2qyoM+It4xcYHrK7xw5vGljDT5aUGziWCMi
         +9pdJgrXfBe7YqWsXlS/XLQ3RuGqOUvWmlHYNVOVA7BLdEy4A0MYznvZ4PRYPS+EKu/s
         w3Liy04fO93tqbtBphMXhKkYBtW9KBgNfUkWFDKIe+syWx+0oyWXSnPdC4vuXtrcUvUO
         uNH7WFuWSfb81yQJyyCQ9JwMav7PT5Euy+2SVXjqiiPGmF0vMUaV6IPO/JdyqeQnyi90
         IWtw==
X-Gm-Message-State: AOAM53374kA9tvs7ue7oaxaBDvv4BWGwQz/4kVTfh4wP8Nsc92YcbvPy
        cQBTKQuVNbjmIjqh/Ea8LbGj4LIZJYTxZQ83r9zY2Q==
X-Google-Smtp-Source: ABdhPJzq32Kno41WvgEanKSTTJoP0HEse+GrqDt/mhwqt9SZ5cKbFQ8pOxTX89szqlPplDovLezTX8z1ZwCw4OEgCXk=
X-Received: by 2002:a05:6a00:1494:b029:278:a4bc:957f with SMTP id
 v20-20020a056a001494b0290278a4bc957fmr10769930pfu.55.1619598600279; Wed, 28
 Apr 2021 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210421065501.3134-1-jarvis.w.jiang@gmail.com>
In-Reply-To: <20210421065501.3134-1-jarvis.w.jiang@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 28 Apr 2021 10:38:40 +0200
Message-ID: <CAMZdPi-H=mnH9SFQZ7XQ8fjb0VtYbaWKGFhoXYyurDAB+RpQ5w@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: pci_generic: T99W175: update channel name
 from AT to DUN
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Chi-Wei Chen50 <cchen50@lenovo.com>,
        Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Apr 2021 at 08:56, Jarvis Jiang <jarvis.w.jiang@gmail.com> wrote:
>
> According to MHI v1.1 specification, change the channel name of T99W175
> from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
> so that the channels can be bound to the Qcom WWAN control driver, and
> device node such as /dev/wwan0p3AT will be generated, which is very useful
> for debugging modem
>
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Ok, it seems the spec claims it's a DUN channel, but all vendors use
it for AT protocol, so it's fine (and correctly handled by the
mhi_wwan_ctrl driver).

Could you please add a Fixes tag since it fixes your previous commit?

with that

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>



> ---
>  drivers/bus/mhi/pci_generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..8c7f6576e421 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>         MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
>         MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> -       MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> -       MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>         MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> --
> 2.25.1
>
