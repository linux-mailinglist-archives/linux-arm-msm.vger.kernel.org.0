Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C720F151399
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 01:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBDAVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 19:21:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40892 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgBDAVV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 19:21:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id i6so15475211otr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 16:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
        b=Sqy4Qf7TbtVRb9AKX7R0QHMGO6MbjHFjRhrNLCVULzUn/tmym5SloAoPUq1SLwktqL
         YfDK2SvCgqu1fkHcx0lbvUks2URnH9G99ch0qldrHccgrrXWifX1cpgNKWL3di2+l5qG
         Iwa5jrVHUpE4EDrYxjMPzWGaWAWHjMLWl631queL7ztP48d4tpQc/xVcRzYnMe81w7uC
         4hxAPoC0OgBYxmSUgZWTss5WoM88w5zWJpgZGqSN5GUyK+Gqf6JeoJvJ0WVhmy55jGIu
         VOwXEJfrLuQ1xyydF5FCEOXUqw/PKDYZA6sbjwFeJXBDWoNWiF1G1cD7YnRP7AONLW+P
         e5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPuXmrJI40A2Un1MmFXL7OHrwiIKEbtwiS4nTQZEtlw=;
        b=Ld+OLtkggdxUBjyvqaHvA4XQUHnj0W55WRN8LRByVBTuHjeWEqt4oNUfIbErNz9uj0
         Ko81agdLz8JnfrjMTNvHKe0xpaeN5/fsWdXO8Cpxj8AjoJEZgyag6ZWLyA0+AW1ifQnH
         ChA760WnxXLL+XY+G/HM9lJUW79YSUm/Pg9WAGKUeeHJp6n/H5EVN93Mdo6mpvU5iRyP
         sBx6zrLpAHqmt/nVS6f5wrWZtvpYGWR8eSdGi9eZ0JosAa52nNftn7WUDM0hWpugPBKy
         RpEXdzXc7aQQzKYyG433MxHt8fUzS7kS7V63gDLNxX8C8LktFZH4+RAEgmWApr6WzaLT
         Bn9Q==
X-Gm-Message-State: APjAAAWsvcxgV9KU6AwtINbiy4W9HxU8vf17EL8k+wz3Jb5aMzjZoUXI
        3XED2RUMYDIiOlNToNPciCtG7YQuZvv2UK9zvN6WYo9c
X-Google-Smtp-Source: APXvYqz/YSe/X4e5btHvwVXt9j0h9vzKao0F/dYt5ZLOc7r211EAvVVKoCb8baK3UiKvJDxzD5l048nUmNuGreHgVVI=
X-Received: by 2002:a05:6830:1094:: with SMTP id y20mr19728104oto.12.1580775680897;
 Mon, 03 Feb 2020 16:21:20 -0800 (PST)
MIME-Version: 1.0
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org> <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 3 Feb 2020 16:21:09 -0800
Message-ID: <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds support for enabling Graphics Bus Interface(GBIF)
> used in multiple A6xx series chipets. Also makes changes to the
> PDC/RSC sequencing specifically required for A618. This is needed
> for proper interfacing with RPMH.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dc8ec2c..2ac9a51 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> +       /*
> +        * During a previous slumber, GBIF halt is asserted to ensure
> +        * no further transaction can go through GPU before GPU
> +        * headswitch is turned off.
> +        *
> +        * This halt is deasserted once headswitch goes off but
> +        * incase headswitch doesn't goes off clear GBIF halt
> +        * here to ensure GPU wake-up doesn't fail because of
> +        * halted GPU transactions.
> +        */
> +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> +
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>

So I already brought this up on #freedreno but figured I'd follow up
on the list.

With linus/master, I'm seeing hard crashes (into usb crash mode) with
the db845c, which I isolated down to this patch, and then to the chunk
above.

Dropping the gpu_write line above gets things booting again for me.

Let me know if there are any follow on patches I can help validate.

thanks
-john
