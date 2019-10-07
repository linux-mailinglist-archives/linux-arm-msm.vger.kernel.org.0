Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 749EACDB37
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 07:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGFJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 01:09:45 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:45805 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGFJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 01:09:45 -0400
Received: by mail-ua1-f67.google.com with SMTP id j5so3639204uak.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2019 22:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avIz7XS3ROBd92JOqOv8txx5HcOKNYvNhez7Bn0stVI=;
        b=MCGwD1tcugssvqnFf8p2haGilsW78iL0h7kkRuX5QYz5Iy5YCTkTwweVJ3n9vbk3A2
         8OvPg3GABXEV2CANd9Jkb+ilaxyaw7QdMLF8bhCKFsSZv2N+AkTNfAm/C1HGERb5fGeL
         VtOULSKt+UZBmW7Rwn/aYEo+95yRu1SSt94+iGdqEQAgb35QhkmqXWnUpxqeWLClpMoP
         QKJPUNJZuiwLoaa5AbxhTzqzOQHu5W6mqVl72uD6kSdIUtyLuqYvmfFayuR9kxdjBTu1
         yE8HTvbSb1DKMu87lWIvCLcrzmjbLoo+yMnOS0SrqKKIau1IsGr/nvkqZgJHRKF5XIjo
         BMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avIz7XS3ROBd92JOqOv8txx5HcOKNYvNhez7Bn0stVI=;
        b=a1poeVgaSDE0RAWUF5KtR4Effdc1twJSfoOhzH7wp4mVfgQCDfDzZyQee79rnUsi6j
         Joeu1P26YustsUJUAOhQsv0Tc1YK//hP/hiq4ztJSRipYkNtc+6+vb7yzx79bPeREF8C
         ocmWnhmA1O5KuQXqpY434Vjv1ltvqBeqggRszEo7S620+THNapoWZKVhACtaLKR2AF2U
         jyW65cxaLshfsBQDq7SCwya9/9MhlqG+93iCG+GAKG9CdNn6OEY68IiY6u6SGIFoTOOc
         owBX7rGRYLCHEVeKvb98uh8D+R1DcuWYDaNMpMLdM7u2SpZC8Bc1ZahzenNt6rDebZlo
         p1xQ==
X-Gm-Message-State: APjAAAUjtk4i8GTDMI9VCdRnGwy0WW6Jde60xwpPBbdeL0VKNcjdniOP
        +6SHqJ017emyjTGb/6vkriAKT2vxOayoen459Lahfw==
X-Google-Smtp-Source: APXvYqy7sJLBDqQBmD3XwTTshM9+tcdQZIofbPodeSN3O8elXWNUgTJE1UC109n2mvdDdf85PUZ+3sDssB3brf55NyQ=
X-Received: by 2002:ab0:7415:: with SMTP id r21mr5352880uap.77.1570424982681;
 Sun, 06 Oct 2019 22:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191005104133.30297-1-kholk11@gmail.com> <20191005104133.30297-4-kholk11@gmail.com>
In-Reply-To: <20191005104133.30297-4-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 7 Oct 2019 10:39:30 +0530
Message-ID: <CAHLCerMUR6b_oQoALC5a92aQyuzV4oFTGYHvH7or=7x5e5GW4Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] thermal: qcom: tsens-v1: Free memory in
 calibrate_v1 where required
To:     kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 5, 2019 at 4:11 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> The calibrate_v1 function allocates the qfprom_cdata variable
> during qfprom_read, but it never gets freed: properly kfree it.

This has already been fixed upstream. So this patch isn't required.

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index 3c85a698123a..017501f37a41 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -173,8 +173,10 @@ static int calibrate_v1(struct tsens_priv *priv)
>         int i;
>
>         qfprom_cdata = (u32 *)qfprom_read(priv->dev, "calib");
> -       if (IS_ERR(qfprom_cdata))
> +       if (IS_ERR(qfprom_cdata)) {
> +               kfree(qfprom_cdata);
>                 return PTR_ERR(qfprom_cdata);
> +       }
>
>         mode = (qfprom_cdata[4] & CAL_SEL_MASK) >> CAL_SEL_SHIFT;
>         dev_dbg(priv->dev, "calibration mode is %d\n", mode);
> @@ -225,6 +227,7 @@ static int calibrate_v1(struct tsens_priv *priv)
>         }
>
>         compute_intercept_slope(priv, p1, p2, mode);
> +       kfree(qfprom_cdata);
>
>         return 0;
>  }
> --
> 2.21.0
>
