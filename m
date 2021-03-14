Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E791533A37D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 09:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbhCNIW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 04:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234579AbhCNIV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 04:21:56 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA10C061762
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 00:21:56 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id ga23-20020a17090b0397b02900c0b81bbcd4so12784883pjb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7t5K6FQXwh1AvOAKrcjxJNmhozmlop1jrckC1EZ5MY=;
        b=uJBxXfBYuYuOyW+AQhAvtgzqhiuH4OIi9AB3CTF7gMF52wmijJ7NBiTJbv1blSxJwc
         OmlflovO4PiSMnIAmh60kpFvuoysCIuK7QShQ/XBl2FJwZmMiWhygyP/xdHYOEC2/tEf
         1lLR7w8NhLmAKGwxEn6isD1Ph1ZSXHwj9MpvFUcIa/m7slYvUjvdHDEwDT/VGErlBdNr
         ph1GTP96fkWsZ7g+4wAwJ6UfWKXZ+5wfpLPzyxPwIfqROoxUVw82iB/3d5R61En2Cpa+
         NcUTDw5ZP4dnDWTmK/V4MrJe6sVYrr1Uwkvp7HAUG4wG5WvN3L3Yu6Fc13OpS3LS6bw7
         tlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7t5K6FQXwh1AvOAKrcjxJNmhozmlop1jrckC1EZ5MY=;
        b=Je72STe6HEbAnMmD5XKEYEZwDTixtRbFuKTJhV8/nVTcEzN82r4G/UuP2RtX1JW/uS
         PNMqHpW6mkcFX20zFJrqepiUKxa7v1AbKdKJKt3pX2H5xc87WFWq/iqJs6B8ARA9l4zN
         GLkB1P5kxi45+2oAl2UNRc+aa9VMfrDTNnE/LILMU3exLYuOhCCV/7PQpoyEgeRDFbtr
         V2plzQpAGK8948VBF1JvW4WImmrzguiHBSX7GcU5gsV4H0PYpvb3vYzUSTWEmWwgWF+b
         0tiX9AwUR2HsA50Y5jztYtLrqYoYXGJ8ioYU8QlWeZKtb9x0dtbd2AZDjUAm+NYn+gUi
         ivYw==
X-Gm-Message-State: AOAM532fTMxMPQXOrDjwxLhiC3FttHxbs8/qFy8Ig6i+9NOY7XxAt2ew
        hdeOYVgL6G70eseAhRjFFZgf0eoLs51Kf5uQok4GIA==
X-Google-Smtp-Source: ABdhPJxv+W9HT+9fyyp/Do5HvczoqOvvPhNyTLOAvGmvL7geCSdoqZ1QAxsz95mOWtBGftCeKpM/K996tx2H9qONpAY=
X-Received: by 2002:a17:902:b210:b029:e6:33b4:cd9e with SMTP id
 t16-20020a170902b210b02900e633b4cd9emr6006219plr.67.1615710115931; Sun, 14
 Mar 2021 00:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20210311111727.8433-1-colin.king@canonical.com>
In-Reply-To: <20210311111727.8433-1-colin.king@canonical.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Sun, 14 Mar 2021 09:21:19 +0100
Message-ID: <CAMZdPi_GWq8RsoQ6nN3W4hivc4UK+Kkru7C7S-CViyKLmjqOGw@mail.gmail.com>
Subject: Re: [PATCH][next] bus: mhi: core: remove redundant initialization of
 variables state and ee
To:     Colin King <colin.king@canonical.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021 at 12:18, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variables state and ee are being initialized with values that
> are never read and are being updated later with a new values. The
> initializations are redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/bus/mhi/core/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2c61dfd01353..3faf8bade520 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -428,9 +428,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  {
>         struct mhi_controller *mhi_cntrl = priv;
>         struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -       enum mhi_state state = MHI_STATE_MAX;
> +       enum mhi_state state;
>         enum mhi_pm_state pm_state = 0;
> -       enum mhi_ee_type ee = MHI_EE_MAX;
> +       enum mhi_ee_type ee;
>
>         write_lock_irq(&mhi_cntrl->pm_lock);
>         if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> --
> 2.30.2
>
