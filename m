Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AB4FD105
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 23:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKNWiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 17:38:13 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37233 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKNWiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 17:38:13 -0500
Received: by mail-pl1-f195.google.com with SMTP id bb5so3327549plb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 14:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=p4y/u0pJZ4ht/TVnTh39A/nft5VvdZ/DB4gpmQC3eKE=;
        b=R5r44sicHCxyOg50fkAynKsN7Vct8b4lVY3vLt/krsrcaSxBxuEOssTswUgaCguWrX
         Tr/1JgiVI6HEfXHF1XdM4QNG5NwEWwhNGArtpxFPCgeQg9T/JUcLWWU+Z0fKERu1fyWF
         YHeuDO1ycha3/W1d+56fpvv1NhnbCHZfnNoKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=p4y/u0pJZ4ht/TVnTh39A/nft5VvdZ/DB4gpmQC3eKE=;
        b=tAHMXTWmCzF5qSa6SPJpRDLzfTdjN5v+qxoGCwLaKcHTNIRD4zxxGaIjF6/QHmR/oH
         B24/36Z9wXnhAsfX2r1c/qToRgKXqbANOOhMx2s95Qxp3+C0ip2KmjCnlFQsjTsLvkGJ
         iDGRKnXS2gDCfT1HYUBL3mKVJ6+LP4t13dmBH9NfTsruMuhqLHEFD4PMQUB1EBRFM0Zs
         7eHvrbQ9KasbKiL+PMm6YZCJxvYA3JoModaS+vQ+tz+tNxnuNeC7Bh4E7Hjje+JDWsTt
         T/ehbKq7lpWaT9SZs8J4ZtF5AFIYtsU3eypEyWp2i+dMqGZlK4VXqRgBe75JSOKZnAc4
         c7DA==
X-Gm-Message-State: APjAAAWLbsurvZl/z940+OY59guJjufZ5GyEUB18+EqXROc5iRKi2IVE
        CH0FKYm/8/B4PQ4APZV/hl4KEw==
X-Google-Smtp-Source: APXvYqyfHmCJR7t2KTVkw2EmAY2DsVM1nVcn+H7AqIvcJSrHnpqB5L2ob+YwQadE1CBnl57hyUOmaQ==
X-Received: by 2002:a17:90a:bcf:: with SMTP id x15mr16023012pjd.0.1573771092936;
        Thu, 14 Nov 2019 14:38:12 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b82sm7853038pfb.33.2019.11.14.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 14:38:12 -0800 (PST)
Message-ID: <5dcdd754.1c69fb81.27caf.7022@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c08cf285b8696c4fd00706b85cd3c88d12f97df3.1573499020.git.amit.kucheria@linaro.org>
References: <cover.1573499020.git.amit.kucheria@linaro.org> <c08cf285b8696c4fd00706b85cd3c88d12f97df3.1573499020.git.amit.kucheria@linaro.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        edubezval@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org
Subject: Re: [PATCH 2/3] drivers: thermal: tsens: Add watchdog support
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 14:38:11 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-11-11 11:21:28)
> TSENS IP v2.3 onwards adds support for a watchdog to detect if the TSENS
> HW FSM is frozen. Add support to detect and restart the FSM in the

Maybe 'frozen' is an ambiguous term? Maybe 'stuck' or 'has stopped
making progress'?

> driver. The watchdog is configured by the bootloader, we just enable the
> feature in the kernel.

Does it work to enable it if we don't configure it in the bootloader?

>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/qcom/tsens-common.c | 41 +++++++++++++++++++++++++++++
>  drivers/thermal/qcom/tsens-v2.c     | 10 +++++++
>  drivers/thermal/qcom/tsens.h        | 12 +++++++++
>  3 files changed, 63 insertions(+)
>=20
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/t=
sens-common.c
> index 2989cb952cdb..9432518502a7 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -794,6 +820,21 @@ int __init init_common(struct tsens_priv *priv)
>                 }
>         }
> =20
> +       if (tsens_version(priv) > VER_1_X &&  ver_minor > 2) {
> +               /* Watchdog is present only on v2.3+ */
> +               for (i =3D 0, j =3D WDOG_BARK_STATUS; j <=3D CC_MON_MASK;=
 i++, j++) {

The variable 'i' is not actually used in this loop. What's going on?

> +                       priv->rf[j] =3D devm_regmap_field_alloc(dev, priv=
->tm_map,
> +                                                             priv->field=
s[j]);
> +                       if (IS_ERR(priv->rf[j])) {
> +                               ret =3D PTR_ERR(priv->rf[j]);
> +                               goto err_put_device;
> +                       }
> +               }
> +               /* Enable WDOG and disable cycle completion monitoring */
> +               regmap_field_write(priv->rf[WDOG_BARK_MASK], 0);
> +               regmap_field_write(priv->rf[CC_MON_MASK], 1);
> +       }
