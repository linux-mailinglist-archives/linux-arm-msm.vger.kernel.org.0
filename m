Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BE916534E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 01:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgBTAFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 19:05:39 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55904 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgBTAFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 19:05:39 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so75483pjz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 16:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=10lwg6uQFk9Fjbej0HWmFQxET16K1NofvVmMfuiw36Q=;
        b=lgqabAXOogpxmjlTPgJ/ZaVRlPIrbrYTEsDdU+AnT8v2wpjkFg/v6Ypr5hqqtCnNfz
         MM40vKyxgop8NzvE8PavjFbEH/+jYeDsRho2gUvShOIbdJVAvXwVxB9QVZ2+F+MwYbwi
         y+MowmEPQ0/uK9tlbl06j+wC6MTWucooZa4Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=10lwg6uQFk9Fjbej0HWmFQxET16K1NofvVmMfuiw36Q=;
        b=ekAGbg5sW+17W/dn3a1DolcAu4FaZUVSwgode2p31SDD+OHyHkJxLk3//W+IHerQbK
         fFZI9XFVzPTF9wnRwAHJBrLoDRIUm/euWtL9VvVXj9u3yFa1rk6p2leyyPOxzXnLbWob
         gatZ1gGQyQqQPQ0kOdyBkX9ed5fMlyRp6/ys8rlgqB0ZuQNAwwhh+yCdRtzmMZVcd0EM
         cT4A5r3fX1wvOEo6Jvg5u0KmS5tK/Rqbq66r78FH48eK0MgfoiGdJMe6rG3GTuu2pBWP
         +a3Vj0EhTYKb9inJOwsniKegsytwo+fbZySAV8kSD3KTvUHFc++5xkuaPA3Ml0DfWS6a
         gz2w==
X-Gm-Message-State: APjAAAVSGu2n08vv8T4sW7Il+ltsnymNNVtobdE039oonEfRMBQWfzJO
        FbqBHgp0wUOFort7zXi1iDRKdw==
X-Google-Smtp-Source: APXvYqwZ8NgitDiitBhs6lgWgsYhTMQOwCdChYmIJHoXhKewLFums+ZzthZpPWhqFNhpzDH6sUkmXw==
X-Received: by 2002:a17:902:bb83:: with SMTP id m3mr28811680pls.258.1582157138446;
        Wed, 19 Feb 2020 16:05:38 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r7sm774111pfg.34.2020.02.19.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:05:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f5a4175371ac7973061cd4f9d19674ac308672c.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org> <4f5a4175371ac7973061cd4f9d19674ac308672c.1582048155.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH v5 5/8] drivers: thermal: tsens: Add critical interrupt support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org
Date:   Wed, 19 Feb 2020 16:05:36 -0800
Message-ID: <158215713699.184098.4863049384855658604@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2020-02-18 10:12:09)
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 0e7cf5236932..5b003d598234 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -125,6 +125,28 @@ static int tsens_register(struct tsens_priv *priv)
>                 goto err_put_device;
>         }
> =20
> +       if (priv->feat->crit_int) {
> +               irq_crit =3D platform_get_irq_byname(pdev, "critical");
> +               if (irq_crit < 0) {
> +                       ret =3D irq_crit;
> +                       /* For old DTs with no IRQ defined */
> +                       if (irq_crit =3D=3D -ENXIO)
> +                               ret =3D 0;
> +                       goto err_crit_int;
> +               }
> +               ret =3D devm_request_threaded_irq(&pdev->dev, irq_crit,
> +                                               NULL, tsens_critical_irq_=
thread,
> +                                               IRQF_ONESHOT,
> +                                               dev_name(&pdev->dev), pri=
v);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "%s: failed to get critical i=
rq\n", __func__);
> +                       goto err_crit_int;
> +               }
> +
> +               enable_irq_wake(irq_crit);
> +       }
> +
> +err_crit_int:

Why use a goto? Can't this be done with if-else statements?

       if (priv->feat->crit_int) {
               irq_crit =3D platform_get_irq_byname(pdev, "critical");
               if (irq_crit < 0) {
                       ...
               } else {
                       ret =3D devm_request_threaded_irq(&pdev->dev, irq_cr=
it,
                                                       NULL, tsens_critical=
_irq_thread,
                                                       IRQF_ONESHOT,
                                                       dev_name(&pdev->dev)=
, priv);
                       if (ret)
                               dev_err(&pdev->dev, "%s: failed to get criti=
cal irq\n", __func__);
                       else
                               enable_irq_wake(irq_crit);
               }
       }

Or if the nesting is so deep that we need goto labels then perhaps it
needs to be another function.

>         enable_irq_wake(irq);
> =20
>  err_put_device:
